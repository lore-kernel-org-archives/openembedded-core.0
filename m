Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE10CCA47C
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 07:42:27 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.6265.1657611734329139328
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 00:42:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eeH78QA+;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657611732; i=@fujitsu.com;
	bh=Aj0Myq5WuQKsf8Ah0Ar/qyRfapjhb56qT7aLfqiXFww=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=eeH78QA+tZ5csPoLuCuWbyyms61DBL5rjbmwmWqIsNVKACHxCssup5sf0XeCA9J0U
	 tCMYz1GzUIOsFFahmxy7L/aFx71VOtwW9+sockZPE/q/TfwC8EWKcqnrehYruaNkcP
	 CAdlasX27pquRL5MFBJ2vUpx+J+EN1HMrT9tAUfX+HdOl8d1/5zJQKzGtGnLJXgYwX
	 /r/Bqao8NwueyH35vRjbiokRdOehphEKrN2HQ/Sc897oWjGTkAgv+kIBfszqSBkS0b
	 jX4V6yaoRE1kF52gFRbMZLg4YjooG3XgO19uPeGDJAR5DPHOlzRDobDHUmx+kpvD/D
	 wVmXU6lb+Xk6w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsViZ8ORpHtZ9Wy
  SwaKnqhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8adFTvYCjZyVlxqXs/SwLiXo4uRi0NI4AGj
  ROvBBYwQziUmiWkXfzNDOHsYJea3T2TpYuTkYBNQk5h+6wZrFyMHh4iAnsTVf6IgYWYBFYkXv
  3vYQWxhAQuJ9/+vMILYLAKqEicbVrGB2LwCThLTL10Aq5EQUJCY8vA9M0RcUOLkzCcsEHMkJA
  6+eMEMUaMoMftyMwuEXSExY8Y2NghbTeLquU3MExj5ZyFpn4WkfQEj0ypG26SizPSMktzEzBx
  dQwMDXUNDUwhtaa6XWKWbqJdaqpuXX1SSoWuol1herJdaXKxXXJmbnJOil5dasokRGJopxSlH
  dzAe2/dL7xCjJAeTkihvnvTZJCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvDYqQDnBotT01Iq0z
  BxgnMCkJTh4lER4TZSB0rzFBYm5xZnpEKlTjLocM7+2HWAWYsnLz0uVEudVB5khAFKUUZoHNw
  IWs5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfNagqziycwrgdv0CugIJqAj5CLPgBxRkoi
  Qkmpg6uotfVvS/+FQpFX1qVyrhJUvpJLsz+1IMd8sHqPoYfomUINJqjcnW39rbrOKnfDKOxsX
  tDWmBK74Lf5uh6pVQdBbFYsW2b9PdFJrzvl+PmJiIM7feOL2hZOC2y7eDOBOfNoUcLJVuEj6Z
  fx53pjZ/lNXGV8+27lrY8R/ychti0VX+Ob0THSSELFp05sjvkZiluD2tZV9xWuXcv78ske8kN
  Ekfma3c+Q2/Tr7s+xZn65dXf1pTpfA5p18H1s7ZDV8ZcVb7y/ZLDGzxf7V6VVOsh4du39Iyyh
  c7q6a4nG1Z1vH4/fqEwr1Vt8tWha+MtpZInzFyYpD146snb1k5+l3zlyBUvtqpnzwkfWpTTqt
  xFKckWioxVxUnAgA2EHfSlQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-745.messagelabs.com!1657611731!225331!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3713 invoked from network); 12 Jul 2022 07:42:11 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Jul 2022 07:42:11 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 10BE41A3
	for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:42:11 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 0526E7C
	for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:42:11 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 12 Jul 2022 08:42:09 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] inetutils: upgrade 2.2 -> 2.3
Date: Tue, 12 Jul 2022 15:41:42 +0800
Message-ID: <1657611705-30786-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 07:42:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167896

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../inetutils/{inetutils_2.2.bb => inetutils_2.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/inetutils/{inetutils_2.2.bb => inetutils_2.3.bb} (99%)

diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.2.bb b/meta/recipes-connectivity/inetutils/inetutils_2.3.bb
similarity index 99%
rename from meta/recipes-connectivity/inetutils/inetutils_2.2.bb
rename to meta/recipes-connectivity/inetutils/inetutils_2.3.bb
index 6c9a299b71..1e8f63637e 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.3.bb
@@ -10,7 +10,7 @@ LICENSE = "GPL-3.0-only"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7"
 
-SRC_URI[sha256sum] = "d547f69172df73afef691a0f7886280fd781acea28def4ff4b4b212086a89d80"
+SRC_URI[sha256sum] = "0b01bb08e29623c4e3b940f233c961451d9af8c5066301add76a52a95d51772c"
 SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch \
            file://inetutils-1.8-0003-wchar.patch \
-- 
2.25.1


