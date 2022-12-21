Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44073C41535
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 03:00:00 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web11.10009.1671591590898550605
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 18:59:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=C4XcMPRn;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671591589; i=@fujitsu.com;
	bh=rrHiLPohNpY0L/5JNLF8dKkA9r2IOv6FF/XpTZvQw2c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=C4XcMPRnLDOWnVQrkycATfmJyMtpZTk0zp/IqGZYz1sUsJNHwVlrLmJqmcgdmxcaX
	 zZeOPNsQNbLZbsLaGU0CcESePzoxPkUI8tIxFac85rF32LGaTbqs7AUzNrGhzgGd3n
	 S9HRgJfAWw2z6vgAH9D+qRSgAyheU1oRjivCTgye2DVg/WuqDBrY+f89QR4OF3F99t
	 cq/z5bnE0Day8B0DpVwvm6/xpvlBf7f5EG6asIu+njrsruhSczqBz1jJkfx1s5vuhH
	 cbP0hBdfXSMuw67KyySi1IB2XlcFGe5FQPdkn9MD6ZF1vA6CZNdjv/oyWkA1ZuM6+6
	 bUSm1kQj/Gcvw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MxSXdx2aJ
  kg3XvTS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oxnd7ayFvRyVDw7+oSlgXEZexcjF4eQwGNG
  iQ0bL7JBONeYJDo+7mXtYuQEcvYwSkzoygex2QSkJG7c/w9UxMEhIqAncfWfKEiYWUBF4sXvH
  nYQW1jARKL5+00wm0VAVWLmh1csIDavgJNE7+o5YHEJAQWJKQ/fM4PYnALOEkff7WWDWOUkce
  74VyaIekGJkzOfsEDMl5A4+OIFM0SvosTsy80sEHaFxKxZbUwQtprE1XObmCcwCs5C0j4LSfs
  CRqZVjGbFqUVlqUW6hoZ6SUWZ6RkluYmZOXqJVbqJeqmluuWpxSW6hnqJ5cV6qcXFesWVuck5
  KXp5qSWbGIGhm1LMMH0H489lf/QOMUpyMCmJ8vowLEoW4kvKT6nMSCzOiC8qzUktPsQow8GhJ
  MFrWgqUEyxKTU+tSMvMAcYRTFqCg0dJhNeuBCjNW1yQmFucmQ6ROsWoKCXOGwrSJwCSyCjNg2
  uDxe4lRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8MSDjeTLzSuCmvwJazAS0eNrNhSCLSxI
  RUlINTFnbfIMNClL/h6tunvx0Us/yhY0/XpebeK7ePsuuzGRZTKf0/q7LLmf5d516xZWWGPqi
  frr2/bXtHs8vbG1wMDrH+u2etuXl+w+fyb9caS18XdHreeG0X5qLmM467ha4/fKXtO9vxZMrb
  qy99MvG+viVWavz3l/W6N1mo3jq2rcFlbWFa0xnVQlzpi69pLIid2oFgzRXjdKapoMSloEr1q
  X4PO/gNf+kP//Z0rDfl598usBYVimZ+ETwfPkNt1cGXnPLju6qSm9mvVh21snzRqSW93F5N6W
  Y1iV6B56+vR4mxZj78EBnGdeUqPKp+75vOyB6yqNKTYP1u9ZO6WtTD9Qo77p167KMgvX5y6bN
  zL+VWIozEg21mIuKEwGZeLOCWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-585.messagelabs.com!1671591587!66695!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22614 invoked from network); 21 Dec 2022 02:59:47 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-12.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Dec 2022 02:59:47 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 803581000E9
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 02:59:47 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 73A461000DC
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 02:59:47 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 21 Dec 2022 02:59:46 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ell: upgrade 0.54 -> 0.55
Date: Wed, 21 Dec 2022 10:59:08 +0800
Message-ID: <1671591551-12455-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1671591551-12455-1-git-send-email-wangmy@fujitsu.com>
References: <1671591551-12455-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 03:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174890

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Fix issue with DHCP and blocked unicast requests.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/ell/{ell_0.54.bb => ell_0.55.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.54.bb => ell_0.55.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.54.bb b/meta/recipes-core/ell/ell_0.55.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.54.bb
rename to meta/recipes-core/ell/ell_0.55.bb
index 5594e0ba54..7184701e4e 100644
--- a/meta/recipes-core/ell/ell_0.54.bb
+++ b/meta/recipes-core/ell/ell_0.55.bb
@@ -15,7 +15,7 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "43be093b25359acd84dd2b07b45a1eacc3a4089bb01342eb3fc99ec9d94a25d9"
+SRC_URI[sha256sum] = "a7e1fd3e13d9083f80eb9787546add49fba5c3d9e9f166b06e2ff9fd8030dc6d"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.25.1


