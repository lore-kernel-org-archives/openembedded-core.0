Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35FE9C35295
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 13:23:43 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web08.10619.1648819421328610699
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 06:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=F2Rg5OM0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 0101017fe54bbe27-c8660bc1-32b9-4ec8-93ee-d04700cec35f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1648819420;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GmwYxIFnWZOuhbtc4IG0l4Ad8WUEjP1uTOjC/Z33Tgk=;
	b=F2Rg5OM0TVL5Fy0THdOr85FXsM+DGZcVClLsD+VFNiMtCylofNQejOpwjTNXNrLG
	ZhKQvs9GGlHejE1QI14YHHr9JkQdy4/NPjJN6WcDhFCNASX5xAEajuKq131OczTkg9O
	c+RsLNDZlStLJTd6xF9IwT/p1ZbrNIDPlHk047ok=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1648819420;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GmwYxIFnWZOuhbtc4IG0l4Ad8WUEjP1uTOjC/Z33Tgk=;
	b=IhSZKUoNO3nvARKA3wY3/QNPPDRnvJKCqdi387XB+q4kPrbpnnq1R3itqgq6sq1k
	8E/PmGhNGhbuMUjwVLT9l0Pd4ddStulIkkvx8rBunOqlEjOG9lbNjwcpKCIiPAKk5lO
	LJeNU6uuQXoPSBl2JkaCaWQEaS9UKpgKjbmFLwqw=
Content-Type: multipart/mixed; boundary="===============7750860563880979910=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mc: upgrading to 4.8.28 FAILED
Message-ID: 
 <0101017fe54bbe27-c8660bc1-32b9-4ec8-93ee-d04700cec35f-000000@us-west-2.amazonses.com>
Date: Fri, 1 Apr 2022 13:23:40 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 13:23:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163913

--===============7750860563880979910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mc* to *4.8.28* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-mc-upgrade-4.8.27-4.8.28.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7750860563880979910==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-mc-upgrade-4.8.27-4.8.28.patch"

From 21efba1d0fac696569def164e4676720678ea839 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Apr 2022 10:09:28 +0000
Subject: [PATCH] mc: upgrade 4.8.27 -> 4.8.28

---
 ...FTBFS-with-ncurses-build-with-disabl.patch | 87 -------------------
 .../mc/{mc_4.8.27.bb => mc_4.8.28.bb}         |  4 +-
 2 files changed, 1 insertion(+), 90 deletions(-)
 delete mode 100644 meta/recipes-extended/mc/files/0001-Ticket-4200-fix-FTBFS-with-ncurses-build-with-disabl.patch
 rename meta/recipes-extended/mc/{mc_4.8.27.bb => mc_4.8.28.bb} (94%)

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
similarity index 94%
rename from meta/recipes-extended/mc/mc_4.8.27.bb
rename to meta/recipes-extended/mc/mc_4.8.28.bb
index 564599fdf6..77102f50c0 100644
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
-- 
2.27.0


--===============7750860563880979910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1640 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (881 cached, 1 parsed). 1640 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:442bc0f975167ff8dcaf799613eb58f65bf4939e"
workspace            = "master:ee5f9d9fdd7d09aa3a86a19d07e3e64851ddc686"

Initialising tasks...done.
Sstate summary: Wanted 68 Local 61 Mirrors 0 Missed 7 Current 194 (89% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 951 of 1030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mc/mc_4.8.28.bb:do_fetch)
NOTE: recipe mc-4.8.28-r0: task do_fetch: Started
NOTE: recipe mc-4.8.28-r0: task do_fetch: Succeeded
NOTE: Running task 1017 of 1030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mc/mc_4.8.28.bb:do_unpack)
NOTE: Running task 1018 of 1030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mc/mc_4.8.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe mc-4.8.28-r0: task do_unpack: Started
NOTE: recipe mc-4.8.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mc-4.8.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mc-4.8.28-r0: task do_unpack: Succeeded
NOTE: Running task 1019 of 1030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mc/mc_4.8.28.bb:do_patch)
NOTE: recipe mc-4.8.28-r0: task do_patch: Started
NOTE: recipe mc-4.8.28-r0: task do_patch: Succeeded
NOTE: Running task 1020 of 1030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mc/mc_4.8.28.bb:do_deploy_source_date_epoch)
NOTE: Running task 1021 of 1030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mc/mc_4.8.28.bb:do_populate_lic)
NOTE: recipe mc-4.8.28-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mc-4.8.28-r0: task do_populate_lic: Started
NOTE: recipe mc-4.8.28-r0: task do_populate_lic: Succeeded
NOTE: recipe mc-4.8.28-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1022 of 1030 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mc/mc_4.8.28.bb:do_configure)
NOTE: recipe mc-4.8.28-r0: task do_configure: Started
NOTE: recipe mc-4.8.28-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1022 tasks of which 1015 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mc/mc_4.8.28.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: mc-4.8.28-r0 do_configure: QA Issue: mc: configure was passed unrecognised options: --disable-vfs-smb [unknown-configure-option]
ERROR: mc-4.8.28-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mc/4.8.28-r0/temp/log.do_configure.2452474
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mc/mc_4.8.28.bb:do_configure) failed with exit code '1'

--===============7750860563880979910==--

