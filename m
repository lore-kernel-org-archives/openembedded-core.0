Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6813C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 08:06:48 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web10.4769.1665475603066974332
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 01:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hVLAiiR1;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665475601; i=@fujitsu.com;
	bh=EZKuQvK3NyjBiYU2SpFreXJS026YlOtNiaOoqGC6F6A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=hVLAiiR1/LGYx2sPxn8afsknGa9TwQJApjcG14HfxHb3N493rDS9kdN3i+Wy6lzhr
	 H0sAXlubFKOYL9OjWcQf2o7htscjHxPglhAR+vO0tSczcIIhAMZFEtUMY4F3DByOmU
	 d6ZMV6zNsr8mjCabC7IE3DDkUOUze4T0r/pg4vqrvwKR+k6nf7lGLzljlCSmtsvw2A
	 yM+ipG/gTuJkn44lSHdNvTVtAygD4+Jmt/UySI1O6MPvYdKD2DudYUbwr6DdE+1WQe
	 XW2cgeRmc3fADCT3YC+37NL2lRc8kRsGigQbr+5YwXOY0TWQUrMuBLk/BNxi8S4rP3
	 3KpP1uy28PIWw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBIsWRWlGSWpSXmKPExsViZ8ORpCug4pp
  ssPWxocWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrH80zzmgvtSFd37VjE3MO4W72Lk4hASeMAo
  8e/yImYI5zKTxP6uM4wQzh5GiUNPpwA5nBxsAmoS02/dYO1i5OAQEdCTuPpPFCTMLKAi8eJ3D
  zuILSxgKbG19S8ziM0ioCox7+8+NhCbV8BJ4tCPn2BxCQEFiSkP34PZnALOEk96LrGA2EJANZ
  tb1jND1AtKnJz5hAVivoTEwRcvoHoVJWZfbmaBsCskZs1qY4Kw1SSuntvEPIFRcBaS9llI2hc
  wMq1itEoqykzPKMlNzMzRNTQw0DU0NNUFkkbGeolVuol6qaW65anFJbqGeonlxXqpxcV6xZW5
  yTkpenmpJZsYgUGcUsxQvYPxf+9PvUOMkhxMSqK8V5+7JAvxJeWnVGYkFmfEF5XmpBYfYpTh4
  FCS4P2l5JosJFiUmp5akZaZA4womLQEB4+SCG+PFFCat7ggMbc4Mx0idYrRnmPq7H/7mTmWg8
  mZX9sOMHNs2td1gFmIJS8/L1VKnDdXGahNAKQtozQPbigsAVxilJUS5mVkYGAQ4ilILcrNLEG
  Vf8UozsGoJMyrDDKFJzOvBG73K6CzmIDOOnnVCeSskkSElFQDU1Sm9PJzst2aMwNeC/0NeOFX
  NOXFSdvIH3d5Ngn8tX7uxqsdpWLJGbD5AXPiJZWOmRdEpwRKbvOVrNCdGPm3z+WtlaFIx+VMo
  URDmVAB6TMaJSXd/dUrf305+uKHwSv3H7M+szUYTqvv/njWqerfaaWGOWG9F5Qnxr3X2uDruz
  5t/sfpe8/avxTv//bNWifPxuBA+d8G++aqjSZCnaYecZLFHzNnXIhi+KIlXRRsKlNzvtH9qdI
  xCd3NX91/bT8zd9KNPJH13h5/7yotPqCwQUI4PUZ5u6rmKrEXq1wKJWoW7n6RtSuTjUs4QGrZ
  7Gln5MO+5n5drLg7dsWa028CPH7z3917YNGUSSyFt3ccVmIpzkg01GIuKk4EAMgGxK97AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-585.messagelabs.com!1665475600!288494!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21703 invoked from network); 11 Oct 2022 08:06:40 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-12.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Oct 2022 08:06:40 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 6FCA81B0
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:06:40 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 650821AC
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:06:40 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 11 Oct 2022 09:06:38 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] powertop: upgrade 2.14 -> 2.15
Date: Tue, 11 Oct 2022 16:05:58 +0800
Message-ID: <1665475558-16409-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665475558-16409-1-git-send-email-wangmy@fujitsu.com>
References: <1665475558-16409-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 08:06:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171604

0001-src-fix-compatibility-with-ncurses-6.3.patch
removed since it's included in new version.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...c-fix-compatibility-with-ncurses-6.3.patch | 52 -------------------
 .../{powertop_2.14.bb => powertop_2.15.bb}    |  3 +-
 2 files changed, 1 insertion(+), 54 deletions(-)
 delete mode 100644 meta/recipes-kernel/powertop/powertop/0001-src-fix-compatibility-with-ncurses-6.3.patch
 rename meta/recipes-kernel/powertop/{powertop_2.14.bb => powertop_2.15.bb} (87%)

diff --git a/meta/recipes-kernel/powertop/powertop/0001-src-fix-compatibility-with-ncurses-6.3.patch b/meta/recipes-kernel/powertop/powertop/0001-src-fix-compatibility-with-ncurses-6.3.patch
deleted file mode 100644
index 84b05ac971..0000000000
--- a/meta/recipes-kernel/powertop/powertop/0001-src-fix-compatibility-with-ncurses-6.3.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 76d3f0851520bc8488e432f423941f1e72cc7405 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 25 Oct 2021 17:47:23 +0200
-Subject: [PATCH] src: fix compatibility with ncurses 6.3
-
-Upstream-Status: Submitted [https://github.com/fenrus75/powertop/pull/92]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/devices/devfreq.cpp | 2 +-
- src/display.cpp         | 2 +-
- src/lib.cpp             | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/devices/devfreq.cpp b/src/devices/devfreq.cpp
-index 0509d0f..b194ac4 100644
---- a/src/devices/devfreq.cpp
-+++ b/src/devices/devfreq.cpp
-@@ -297,7 +297,7 @@ void display_devfreq_devices(void)
- 			df->fill_freq_utilization(j, buf);
- 			strcat(fline, buf);
- 			strcat(fline, "\n");
--			wprintw(win, fline);
-+			wprintw(win, "%s", fline);
- 		}
- 		wprintw(win, "\n");
- 	}
-diff --git a/src/display.cpp b/src/display.cpp
-index 7131144..cc03919 100644
---- a/src/display.cpp
-+++ b/src/display.cpp
-@@ -125,7 +125,7 @@ void show_tab(unsigned int tab)
- 
- 	c = bottom_lines[tab_names[tab]].c_str();
- 	if (c && strlen(c) > 0)
--		mvwprintw(bottom_line, 0,0, c);
-+		mvwprintw(bottom_line, 0,0, "%s", c);
- 	else
- 		mvwprintw(bottom_line, 0, 0,
- 			"<ESC> %s | <TAB> / <Shift + TAB> %s | ", _("Exit"),
-diff --git a/src/lib.cpp b/src/lib.cpp
-index 5e48f37..5cd1c4a 100644
---- a/src/lib.cpp
-+++ b/src/lib.cpp
-@@ -583,7 +583,7 @@ void ui_notify_user_ncurses(const char *frmt, ...)
- 	 * buffer */
- 	vsnprintf(notify, UI_NOTIFY_BUFF_SZ - 1, frmt, list);
- 	va_end(list);
--	mvprintw(1, 0, notify);
-+	mvprintw(1, 0, "%s", notify);
- 	attroff(COLOR_PAIR(1));
- }
- 
diff --git a/meta/recipes-kernel/powertop/powertop_2.14.bb b/meta/recipes-kernel/powertop/powertop_2.15.bb
similarity index 87%
rename from meta/recipes-kernel/powertop/powertop_2.14.bb
rename to meta/recipes-kernel/powertop/powertop_2.15.bb
index a2f30040b5..0aae4c9397 100644
--- a/meta/recipes-kernel/powertop/powertop_2.14.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.15.bb
@@ -8,9 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
 SRC_URI = "git://github.com/fenrus75/powertop;protocol=https;branch=master \
            file://0001-wakeup_xxx.h-include-limits.h.patch \
-           file://0001-src-fix-compatibility-with-ncurses-6.3.patch \
            "
-SRCREV = "52f022f9bbe6e060fba11701d657a8d9762702ba"
+SRCREV = "d51ad395436d4d1dcc3ca46e1519ffeb475bf651"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


