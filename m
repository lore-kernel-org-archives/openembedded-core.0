Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38851C47094
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:54 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.11829.1650052688500389949
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ZJX7E2WX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 010101802ecde8ac-c15bc030-d645-4fc7-a54b-bfcb1e2d11f5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052688;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Az9zQUOxJJOmRflxUs1DccC0E8QPXqi8MdKJD9s93Jc=;
	b=ZJX7E2WXRom4q1VtLGYG7kCiAx1UXJTeQUF9NaWMnZhL0hX6iy6jyQazTpA9g5cV
	/1OQmps88M+oskm8PdNVkYP5CNpJfpiVbfXuzcca2ZYCrJA+aiF4dmYSJ0lmzDmdYZo
	eHpcP8w7F2DU0ifyIvM0LnH4IyvuZIkw10l4Rxko=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052688;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Az9zQUOxJJOmRflxUs1DccC0E8QPXqi8MdKJD9s93Jc=;
	b=c0uUjUvizE9m4CyWLdAbbh0MQbw0Qh53DLsksi5MKPh2fm9dwi4gkKnrXdyS2LvA
	W7lYs8ztDVJhJ5qB8g9xaJ1Ozg/PhiU4RESz0tIgkwDlpg4BH5Z+updOhoZ6TBaB4uR
	ATG99SVU9560NoC3uqrBwt+sAKAjuIg/pl2IieCM=
Content-Type: multipart/mixed; boundary="===============4731970365611637869=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mc: upgrading to 4.8.28 FAILED
Message-ID: 
 <010101802ecde8ac-c15bc030-d645-4fc7-a54b-bfcb1e2d11f5-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:08 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164480

--===============4731970365611637869==
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
--===============4731970365611637869==
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
meta-yocto-bsp       = "tmp-auh-upgrades:1eeca78e525d63a80c82d6b622634c1e66a2193d"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 67 Local 60 Mirrors 0 Missed 7 Current 195 (89% match, 97% complete)
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
NOTE: recipe mc-4.8.28-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mc-4.8.28-r0: task do_populate_lic: Succeeded
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mc/4.8.28-r0/temp/log.do_configure.2971273
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mc/mc_4.8.28.bb:do_configure) failed with exit code '1'

--===============4731970365611637869==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-mc-upgrade-4.8.27-4.8.28.patch"

From b1fe00c2652c51330f4817701eac13d8a0808cf6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 12:03:44 +0000
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


--===============4731970365611637869==--

