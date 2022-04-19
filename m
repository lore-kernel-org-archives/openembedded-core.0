Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F37C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 02:46:34 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.4553.1650332718466189524
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 18:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=R0BevZwp;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650332716; i=@fujitsu.com;
	bh=uXbdwbsCb66UmeK8UEQb0/encC8zwNyRuxhlwmdWRd4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=R0BevZwpjmjwR3x6lXTEwrtkWnHnX1JF8yJ1b2n2OtbXE71Ohg/YJEGlvU1e4HKf/
	 QR6dr6qoWl1f/5wbEaENyuifx5Pr3jDMo22JnoR383ZTWQ0OnzJm52qiT4kHmW+TWY
	 tOkUHtznSNIOH61AYVDL7URS34zGOJiXrSeBYQs3wTK998QLuy2WHmSad7NfFs8jal
	 2smgM+6qhitRIp2lROrl9XZqVJoxW0CE+UM71KcVHcFtkwGZnzBn5N3DP60iXk6c3u
	 6o1MZqn3hkc5hdOIKNcGcVAty9iYW07VPS1robo67EdWYbsPwn0qNxvWWFS6QiBSi3
	 5kHURtVgR3AZQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRWlGSWpSXmKPExsViZ8MxSVdHJC7
  J4MsrJos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWP5ym72gqOcFVtf7WJvYHzK0cXIxSEk8JhR
  4mb/CVYI5zyTxLV1a6CcPYwSHzvfsHcxcnKwCahJTL91AyjBwSEioCdx9Z8oSJhZQEXixe8es
  BJhAVeJN7OPMIPYLAKqEk8XbWUHKecVcJKYddAIJCwhoCAx5eF7sBJeAUGJkzOfsECMkZA4+O
  IFM0SNosTsy80sEHaFxKxZbUwQtprE1XObmCcw8s9C0j4LSfsCRqZVjHZJRZnpGSW5iZk5uoY
  GBrqGhqa65oa6hsbGeolVuol6qaW6yal5JUWJQGm9xPJivdTiYr3iytzknBS9vNSSTYzA0Ewp
  dm/dwXi576feIUZJDiYlUd5HB2OThPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwSgvEJQkJFqWmp
  1akZeYA4wQmLcHBoyTCu1YQKM1bXJCYW5yZDpE6xagoJc67QggoIQCSyCjNg2uDxeYlRlkpYV
  5GBgYGIZ6C1KLczBJU+VeM4hyMSsK870DG82TmlcBNfwW0mAlocfWUWJDFJYkIKakGJt0lzvI
  RnXIvGxovlK3aa/Lo/LM+prvPv6V8Lxa3L9kym2+v/56MKrdoQe5jOdfVlP1XdRaF37yyi/d5
  zMdX2UXulp+ljpstWXl8ycrY7Vmd0yaJ8zGWZvaGLH0Ve1GhXm7hO9Ga5sA/t5uP65x8zZwR2
  zvdd5OSeuRPNbWgBVNvKF/3WfE53G2JvobInTOVrduXK578cF9KJyri/1atT3Yres5ts9uwsy
  du9WYr89Dj4ZtORFgZ8i6c9FgzSehx97EHU2S1XtYdlgkyXuPedeqw/eN1Nl7T8+0m5SlKfyl
  Q0FlpUZbRmyLT4al1mZFlzXufLx2GJSGugXVhckpnFXp+b+q39L4wpz2k0adCiaU4I9FQi7mo
  OBEAuwsZgUgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-528.messagelabs.com!1650332715!312048!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21496 invoked from network); 19 Apr 2022 01:45:16 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-17.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Apr 2022 01:45:16 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 944CA100359
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 02:45:15 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 87A4110034F
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 02:45:15 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 19 Apr 2022 02:44:54 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-dbusmock: upgrade 0.27.3 -> 0.27.5
Date: Tue, 19 Apr 2022 09:44:42 +0800
Message-ID: <1650332686-20457-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Apr 2022 02:46:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164610

Changelog:
============
bluez and accountsservice templates: Drop default arguments from D-Bus methods

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dbusmock_0.27.3.bb => python3-dbusmock_0.27.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.27.3.bb => python3-dbusmock_0.27.5.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.27.3.bb b/meta/recipes-devtools/python/python3-dbusmock_0.27.5.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dbusmock_0.27.3.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.27.5.bb
index 5febdae1bd..852d1555be 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.27.3.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.27.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "24feaa524e0631854a7f0529ef757c1e4c542adef89cf04e1d4248bc512a006f"
+SRC_URI[sha256sum] = "0bff30d8d01e7eef491f75d359c87765abba7001307fa8fed19cb59f06ed3c2a"
 
 PYPI_PACKAGE = "python-dbusmock"
 
-- 
2.25.1


