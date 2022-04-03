Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09FBDC38A06
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:20 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.7580.1649245872930275708
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 04:51:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DTqwDOeC;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649245871; i=@fujitsu.com;
	bh=td5lkTTYdGMWPI7PzNLp5Eo2R1xea8ZXQia1vSzqnqI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=DTqwDOeCb4TWph3A4Sd2vMarC5D7UtJJEboR1ZnPmmzYrUcDr4R8v7/rvhWYstPwW
	 pBDlBLZrEprQRKb+BKWfzNfBWoAc3G/tn1mzVJKjDXn6haQNG3kQCPF3ceTi836yfe
	 PhoWhdCBMsL0UbKMMDEHM+XtUELMGkLUN7PQr7AkVmratokKBeDC8n/3hHJkFXknOK
	 h/j9TMnhDm8Qz96WPbgRDDNNUOt9X/6LcT4LwIdWgHJXn3gOBej+stidZtmf5jQFYj
	 I88C5hWFvA37nZ1R9MwIR0h/THCghd07lw2WziCy0GwxUuDuJvAzH4ZYxYugV1Bstu
	 qmOHARSLYYzNw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MxSXddnW+
  SwcclmhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aJ/8vZC1ZqVOzbeZqxgbFVuYuRk0NI4DGj
  xOtV8V2MXED2eSaJTxvPsEI4uxkluhdvZQWpYhNQk5h+6waQzcEhIqAncfWfKEiYWUBF4sXvH
  nYQW1jAXGLNhP+MIDYLSPzRZ7A4r4CTRPvJp8wgtoSAgsSUh++ZIeKCEidnPmGBmCMhcfDFC6
  gaRYnZl5tZIOwKiVmz2pggbDWJq+c2MU9g5J+FpH0WkvYFjEyrGO2SijLTM0pyEzNzdA0NDHQ
  NDU11zUx0jUxM9RKrdBP1Ukt1k1PzSooSgdJ6ieXFeqnFxXrFlbnJOSl6eaklmxiBoZlS7PB1
  B+Pxvp96hxglOZiURHn3l/smCfEl5adUZiQWZ8QXleakFh9ilOHgUJLg3VIFlBMsSk1PrUjLz
  AHGCUxagoNHSYRXqwYozVtckJhbnJkOkTrFaMwx8fnFvcwcO7dc3sssxJKXn5cqJc77EqRUAK
  Q0ozQPbhAsfi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEub1ApnCk5lXArfvFdApTECnvDv
  jCXJKSSJCSqqB6Y5D8j6NisUOqRpyXrw35AwlZnI9OidSN+9aWK7Kx5czhYucPlgw3Eo855pt
  4pv175Gt4+1MEeH6mXv8Gdpueuc05ntGqIZ3MgWqXP3RcOSOxIYJrYEPLNuM71x8rLQw219L9
  ErJmWaj3kN3ld+FMy/2Oxbf6drU09Pf/6Wc+aNQ4tVbgqqPLmyr6Wbe4l/JVpaUday1lXvNMR
  VTFdeDRQsPsr3jZ6qOWOzwdUvqZKNfll0X3l2Nmchgyz3JY6tFxT6vWmaW5kf96tf3yT7TfcK
  5Q+PHq0QnnT9Nk4Ss5vsryopt2xW0xvKTo27Q84kJOglyzRLLS7p7mXvFNmy8sPp++KQf5Tq3
  r+X7miqxFGckGmoxFxUnAgBR26MwWgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-528.messagelabs.com!1649245870!30196!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7701 invoked from network); 6 Apr 2022 11:51:10 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-2.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Apr 2022 11:51:10 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 1D935100465
	for <openembedded-core@lists.openembedded.org>;
 Wed,  6 Apr 2022 12:51:10 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 10EFC1000E9
	for <openembedded-core@lists.openembedded.org>;
 Wed,  6 Apr 2022 12:51:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 6 Apr 2022 12:50:49 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mc: upgrade 4.8.27 -> 4.8.28
Date: Mon, 4 Apr 2022 02:47:27 +0800
Message-ID: <1649011649-28952-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 06 Apr 2022 16:33:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164076

Remove unsupported option of smb 

0001-Ticket-4200-fix-FTBFS-with-ncurses-build-with-disabl.patch
removed since it's included in 4.8.28

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...FTBFS-with-ncurses-build-with-disabl.patch | 87 -------------------
 .../mc/{mc_4.8.27.bb => mc_4.8.28.bb}         |  5 +-
 2 files changed, 1 insertion(+), 91 deletions(-)
 delete mode 100644 meta/recipes-extended/mc/files/0001-Ticket-4200-fix-FTBFS-with-ncurses-build-with-disabl.patch
 rename meta/recipes-extended/mc/{mc_4.8.27.bb => mc_4.8.28.bb} (92%)

diff --git a/meta/recipes-extended/mc/files/0001-Ticket-4200-fix-FTBFS-with-ncurses-build-with-disabl.patch b/meta/recipes-extended/mc/files/0001-Ticket-4200-fix-FTBFS-with-ncurses-build-with-disabl.patch
deleted file mode 100644
index 408473664f..0000000000
--- a/meta/recipes-extended/mc/files/0001-Ticket-4200-fix-FTBFS-with-ncurses-build-with-disabl.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From e7bbf72544ab62db9c92bfe7bd1155227e78c621 Mon Sep 17 00:00:00 2001
-From: Andrew Borodin <aborodin@vmail.ru>
-Date: Sat, 28 Aug 2021 11:46:53 +0300
-Subject: [PATCH] Ticket #4200: fix FTBFS with ncurses build with
- --disable-widec.
-
-Upstream-Status: Accepted [https://github.com/MidnightCommander/mc/commit/e7bbf72544]
-Signed-off-by: Andrew Borodin <aborodin@vmail.ru>
----
- lib/tty/tty-ncurses.c   | 8 ++++++++
- lib/tty/tty-ncurses.h   | 5 +++++
- lib/tty/tty-slang.h     | 2 ++
- src/filemanager/boxes.c | 2 ++
- 4 files changed, 17 insertions(+)
-
-diff --git a/lib/tty/tty-ncurses.c b/lib/tty/tty-ncurses.c
-index f619c0a7bf31..13058a624208 100644
---- a/lib/tty/tty-ncurses.c
-+++ b/lib/tty/tty-ncurses.c
-@@ -560,6 +560,7 @@ tty_fill_region (int y, int x, int rows, int cols, unsigned char ch)
- void
- tty_colorize_area (int y, int x, int rows, int cols, int color)
- {
-+#ifdef ENABLE_SHADOWS
-     cchar_t *ctext;
-     wchar_t wch[10];            /* TODO not sure if the length is correct */
-     attr_t attrs;
-@@ -585,6 +586,13 @@ tty_colorize_area (int y, int x, int rows, int cols, int color)
-     }
- 
-     g_free (ctext);
-+#else
-+    (void) y;
-+    (void) x;
-+    (void) rows;
-+    (void) cols;
-+    (void) color;
-+#endif /* ENABLE_SHADOWS */
- }
- 
- /* --------------------------------------------------------------------------------------------- */
-diff --git a/lib/tty/tty-ncurses.h b/lib/tty/tty-ncurses.h
-index d75df9533ab9..8feb17ccd045 100644
---- a/lib/tty/tty-ncurses.h
-+++ b/lib/tty/tty-ncurses.h
-@@ -30,6 +30,11 @@
- #define NCURSES_CONST const
- #endif
- 
-+/* do not draw shadows if NCurses is built with --disable-widec */
-+#if defined(NCURSES_WIDECHAR) && NCURSES_WIDECHAR
-+#define ENABLE_SHADOWS 1
-+#endif
-+
- /*** typedefs(not structures) and defined constants **********************************************/
- 
- /*** enums ***************************************************************************************/
-diff --git a/lib/tty/tty-slang.h b/lib/tty/tty-slang.h
-index 5b12c6512853..eeaade388af4 100644
---- a/lib/tty/tty-slang.h
-+++ b/lib/tty/tty-slang.h
-@@ -23,6 +23,8 @@
- #define COLS  SLtt_Screen_Cols
- #define LINES SLtt_Screen_Rows
- 
-+#define ENABLE_SHADOWS 1
-+
- /*** enums ***************************************************************************************/
- 
- enum
-diff --git a/src/filemanager/boxes.c b/src/filemanager/boxes.c
-index 3eb525be4a9b..98df5ff2ed9a 100644
---- a/src/filemanager/boxes.c
-+++ b/src/filemanager/boxes.c
-@@ -280,7 +280,9 @@ appearance_box_callback (Widget * w, Widget * sender, widget_msg_t msg, int parm
-     switch (msg)
-     {
-     case MSG_INIT:
-+#ifdef ENABLE_SHADOWS
-         if (!tty_use_colors ())
-+#endif
-         {
-             Widget *shadow;
- 
--- 
-2.34.1
-
diff --git a/meta/recipes-extended/mc/mc_4.8.27.bb b/meta/recipes-extended/mc/mc_4.8.28.bb
similarity index 92%
rename from meta/recipes-extended/mc/mc_4.8.27.bb
rename to meta/recipes-extended/mc/mc_4.8.28.bb
index 564599fdf6..9a950a8cd0 100644
--- a/meta/recipes-extended/mc/mc_4.8.27.bb
+++ b/meta/recipes-extended/mc/mc_4.8.28.bb
@@ -11,12 +11,10 @@ RRECOMMENDS:${PN} = "ncurses-terminfo"
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://0001-mc-replace-perl-w-with-use-warnings.patch \
            file://nomandate.patch \
-           file://0001-Ticket-4200-fix-FTBFS-with-ncurses-build-with-disabl.patch \
            "
-SRC_URI[sha256sum] = "2f52dd9c75c20d8eac7701bd3a8c6c125aaf8cdd9cf12b78ca50a0102b543407"
+SRC_URI[sha256sum] = "6bb47533d7a55bb21e46292d2f94786c9037bd7a70bf02b6a3c48adb0c9ce20c"
 
 # remove at next version upgrade or when output changes
-PR = "r1"
 HASHEQUIV_HASH_VERSION .= ".2"
 
 inherit autotools gettext pkgconfig
@@ -25,7 +23,6 @@ inherit autotools gettext pkgconfig
 # Both Samba (smb) and sftp require package delivered from meta-openembedded
 #
 PACKAGECONFIG ??= ""
-PACKAGECONFIG[smb] = "--enable-vfs-smb,--disable-vfs-smb,samba,"
 PACKAGECONFIG[sftp] = "--enable-vfs-sftp,--disable-vfs-sftp,libssh2,"
 
 # enable NCURSES_WIDECHAR=1 only if ENABLE_WIDEC has not been explicitly disabled (e.g. by the distro config).
-- 
2.25.1


