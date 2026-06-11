Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF7B9CDB481
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:56 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50407.1781195495833571318
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Jj3E92xx;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NTizAffw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019eb786a544-e8ed38e4-dc4d-4704-b6b0-b76c7c1054bf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195515;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oAopsXulC4SXFoN7DiQ1GLRuXh83hZx+UAMff32XFL8=;
	b=Jj3E92xxgST9tHkJQQ/x+UtUW2W3cuGCrBGDH1k6BHu4csrUTeDIc08X/8M7jdCz
	pm9ku2y2YLEze7Pd1Q/osQG2HKci+kmyIzQiLJ7klBVHDjJqx+JxQrWRhU7a/JPnU56
	52eTUpTI9veDZoypJmJeJCXOx3bH3zpn2JOKy2vU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195515;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oAopsXulC4SXFoN7DiQ1GLRuXh83hZx+UAMff32XFL8=;
	b=NTizAffw4qD5jNJ9f7k8L16ZNLyvjiasPVKxtRvYdwiy16rs+5YZJIXopCbBuDJD
	+d3ST70MG9k+EY+c/PhkjK/QaNY6lRrjFvbsfDqYQ+nhyxGLsRp2wBHVqp9+ZXPgLRR
	QqQ9zLW2WTHSSnZX2No/B01s6PngwxR50AyLdn6s=
Content-Type: multipart/mixed; boundary="===============6609367451177888814=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fontconfig: upgrading to 2.18.1 SUCCEEDED
Message-ID: <0101019eb786a544-e8ed38e4-dc4d-4704-b6b0-b76c7c1054bf-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238530

--===============6609367451177888814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *fontconfig* to *2.18.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-fontconfig-upgrade-2.17.1-2.18.1.patch
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

-- >8 --
From 0fb1414b2804410d5c7be6868198c838e707233f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 12:01:02 +0000
Subject: [PATCH] fontconfig: upgrade 2.17.1 -> 2.18.1

---
 ...ded-missing-target-rule-dependencies.patch | 31 ---------
 .../fontconfig/fontconfig/musl-fix.patch      | 66 -------------------
 .../fontconfig/revert-static-pkgconfig.patch  |  8 +++
 ...tconfig_2.17.1.bb => fontconfig_2.18.1.bb} |  4 +-
 4 files changed, 9 insertions(+), 100 deletions(-)
 delete mode 100644 meta/recipes-graphics/fontconfig/fontconfig/0001-build-Added-missing-target-rule-dependencies.patch
 delete mode 100644 meta/recipes-graphics/fontconfig/fontconfig/musl-fix.patch
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.17.1.bb => fontconfig_2.18.1.bb} (92%)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig/0001-build-Added-missing-target-rule-dependencies.patch b/meta/recipes-graphics/fontconfig/fontconfig/0001-build-Added-missing-target-rule-dependencies.patch
deleted file mode 100644
index 40b25cc926..0000000000
--- a/meta/recipes-graphics/fontconfig/fontconfig/0001-build-Added-missing-target-rule-dependencies.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 0bba79bfd3d8a216794d15af97ce4abefd4b8748 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Florian=20=22sp1rit=22=E2=80=8B?= <sp1rit@disroot.org>
-Date: Sat, 9 Aug 2025 20:22:43 +0200
-Subject: [PATCH] build: Added missing target rule-dependencies
-
-02b835b62 did not appropriately ensure, that the patternlib_internal
-target waits until the {ft_,}alias_headers have finished generating the
-headers that it depends on.
-
-Upstream-Status: Backport [0bba79bfd3d8a216794d15af97ce4abefd4b8748]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- src/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/meson.build b/src/meson.build
-index c4d65d6c..10866aa8 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -9,7 +9,7 @@ endif
- # Factor our pattern manipulation code into its own library
- # to break the depedency cycle:
- # FontConfig pattern handling - Fontations code - FontConfig.
--pattern_sources = [ 'fcpat.c', fcstdint_h, fclang_h ]
-+pattern_sources = [ 'fcpat.c', fcstdint_h, fclang_h, alias_headers, ft_alias_headers ]
- pattern_lib = static_library('patternlib_internal',
-                                     pattern_sources,
-                                     include_directories: incbase,
--- 
-2.43.0
-
diff --git a/meta/recipes-graphics/fontconfig/fontconfig/musl-fix.patch b/meta/recipes-graphics/fontconfig/fontconfig/musl-fix.patch
deleted file mode 100644
index c4508bd15a..0000000000
--- a/meta/recipes-graphics/fontconfig/fontconfig/musl-fix.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 75cc3e6ef0e451f42d3464ed4d639304ad9a4f58 Mon Sep 17 00:00:00 2001
-From: Akira TAGOH <akira@tagoh.org>
-Date: Thu, 3 Jul 2025 03:31:49 +0900
-Subject: [PATCH] test: Fix a build issue with musl libc
-
-Fixes https://gitlab.freedesktop.org/fontconfig/fontconfig/-/issues/484
-
-Changelog: fixed
-Upstream-Status: Backport [https://gitlab.freedesktop.org/fontconfig/fontconfig/-/commit/75cc3e6ef0e451f42d3464ed4d639304ad9a4f58]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- test/test-mt-fccfg.c | 22 ++++++++++++++++++++--
- 1 file changed, 20 insertions(+), 2 deletions(-)
-
-diff --git a/test/test-mt-fccfg.c b/test/test-mt-fccfg.c
-index 24ad7583..3b7d843d 100644
---- a/test/test-mt-fccfg.c
-+++ b/test/test-mt-fccfg.c
-@@ -1,9 +1,12 @@
- /* Copyright (C) 2025 fontconfig Authors */
- /* SPDX-License-Identifier: HPND */
-+#ifdef HAVE_CONFIG_H
-+#  include "config.h"
-+#endif
-+
- #include <fontconfig/fontconfig.h>
- 
- #include <stdio.h>
--#define __USE_XOPEN
- #include <pthread.h>
- #include <stdlib.h>
- 
-@@ -13,6 +16,21 @@ struct thr_arg_s {
-     int thr_num;
- };
- 
-+#ifdef _WIN32
-+int
-+setenv (const char *name, const char *value, int o)
-+{
-+    size_t len = strlen (name) + strlen (value) + 1;
-+    char  *s = malloc (len + 1);
-+    int    ret;
-+
-+    snprintf (s, len, "%s=%s", name, value);
-+    ret = _putenv (s);
-+    free (s);
-+    return ret;
-+}
-+#endif
-+
- static void *
- run_test_in_thread (void *arg)
- {
-@@ -61,7 +79,7 @@ test (void)
-     if (c1 == c2)
- 	return 1;
-     /* To make visible if we have any references */
--    putenv ("FC_DEBUG=16");
-+    setenv ("FC_DEBUG", "16", 1);
-     FcFini();
- 
-     return 0;
--- 
-GitLab
-
diff --git a/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch b/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch
index 30d6423037..4c505b3e7f 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch
+++ b/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch
@@ -1,3 +1,8 @@
+From 06897ba10c1ab0d6844e16353a1563174f93ad4f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 23 Apr 2015 20:35:32 -0700
+Subject: [PATCH] fontconfig: Fix pkgconfig file generation to not have
+
 Revert part of http://cgit.freedesktop.org/fontconfig/commit/fontconfig.pc.in?id=338ffe6b886ad4ba86ff471cb59c4a5e5ffbe408
 We really dont do static linking so its not going to cause issues for us but as such this is harming us by adding absolute
 paths into -I options into fontconfig.pc which is them prepended with sysroot when read back by cross pkg-config and
@@ -7,6 +12,9 @@ gently refuses and rightly so.
 
 Upstream-Status: Inappropriate [OE-Specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ fontconfig.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/fontconfig.pc.in b/fontconfig.pc.in
 index 61b35fb..5bc9bab 100644
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.18.1.bb
similarity index 92%
rename from meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb
rename to meta/recipes-graphics/fontconfig/fontconfig_2.18.1.bb
index 0d0fcfcceb..76b2652738 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.18.1.bb
@@ -22,10 +22,8 @@ DEPENDS = "expat freetype zlib gperf-native util-linux"
 
 SRC_URI = "https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/${PV}/fontconfig-${PV}.tar.xz \
            file://revert-static-pkgconfig.patch \
-           file://musl-fix.patch \
-           file://0001-build-Added-missing-target-rule-dependencies.patch \
            "
-SRC_URI[sha256sum] = "9f5cae93f4fffc1fbc05ae99cdfc708cd60dfd6612ffc0512827025c026fa541"
+SRC_URI[sha256sum] = "2300f3dbfa7253b3a44f4feecdbc8dfa45dde5dc2cfb71fceaf31f394cb41031"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/fontconfig/fontconfig/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"
-- 
2.47.1


--===============6609367451177888814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/fontconfig/fontconfig-dbg: FILELIST: removed "/usr/lib/.debug/libfontconfig.so.1.16.0", added "/usr/lib/.debug/libfontconfig.so.1.17.0 /usr/bin/.debug/fc-genconf"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-dbg: PKGV changed from 2.17.1 [default] to 2.18.1 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-dbg: PKGSIZE changed from 2504504 to 2621752 (+5%)
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-dbg: PV changed from "2.17.1" to "2.18.1"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-dev: PKGV changed from 2.17.1 [default] to 2.18.1 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-dev: PKGSIZE changed from 43207 to 44798 (+4%)
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-dev: PV changed from "2.17.1" to "2.18.1"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-doc: PKGV changed from 2.17.1 [default] to 2.18.1 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-doc: PV changed from "2.17.1" to "2.18.1"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-locale-ka: PKGV changed from 2.17.1 [default] to 2.18.1 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-locale-ka: PV changed from "2.17.1" to "2.18.1"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-locale-zh-cn: PKGV changed from 2.17.1 [default] to 2.18.1 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-locale-zh-cn: PV changed from "2.17.1" to "2.18.1"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-src: FILELIST: directory renamed /usr/src/debug/fontconfig/2.17.1/fc-lang -> /usr/src/debug/fontconfig/2.18.1/fc-lang, directory renamed /usr/src/debug/fontconfig/2.17.1/fc-pattern -> /usr/src/debug/fontconfig/2.18.1/fc-pattern, directory renamed /usr/src/debug/fontconfig/2.17.1/fc-query -> /usr/src/debug/fontconfig/2.18.1/fc-query, directory renamed /usr/src/debug/fontconfig/2.17.1 -> /usr/src/debug/fontconfig/2.18.1, directory renamed /usr/src/debug/fontconfig/2.17.1/fc-list -> /usr/src/debug/fontconfig/2.18.1/fc-list, directory renamed /usr/src/debug/fontconfig/2.17.1/fc-cat -> /usr/src/debug/fontconfig/2.18.1/fc-cat, directory renamed /usr/src/debug/fontconfig/2.17.1/fc-conflist -> /usr/src/debug/fontconfig/2.18.1/fc-conflist, directory renamed /usr/src/debug/fontconfig/2.17.1/fc-scan -> /usr/src/debug/fontconfig/2.18.1/fc-scan, directory renamed /usr/src/debug/fontconfig/2.17.1/fc-case -> /usr/src/debug/fontconfig/2.18.1/fc-cas
 e, directory renamed /usr/src/debug/fontconfig/2.17.1/fc-match -> /usr/src/debug/fontconfig/2.18.1/fc-match, directory renamed /usr/src/debug/fontconfig/2.17.1/fontconfig -> /usr/src/debug/fontconfig/2.18.1/fontconfig, directory renamed /usr/src/debug/fontconfig/2.17.1/fc-validate -> /usr/src/debug/fontconfig/2.18.1/fc-validate, directory renamed /usr/src/debug/fontconfig/2.17.1/fc-cache -> /usr/src/debug/fontconfig/2.18.1/fc-cache, removed "/usr/src/debug/fontconfig/2.17.1/src/fcstr.c /usr/src/debug/fontconfig/2.17.1/src/fcint.h /usr/src/debug/fontconfig/2.17.1/src/fcmatrix.c /usr/src/debug/fontconfig/2.17.1/src/fcdir.c /usr/src/debug/fontconfig/2.17.1/src/fchash.c /usr/src/debug/fontconfig/2.17.1/src/fcxml.c /usr/src/debug/fontconfig/2.17.1/src/fccfg.c /usr/src/debug/fontconfig/2.17.1/src/fcptrlist.c /usr/src/debug/fontconfig/2.17.1/src/fclang.c /usr/src/debug/fontconfig/2.17.1/src/fcpat.c /usr/src/debug/fontconfig/2.17.1/src/fcfreetype.c /usr/src/debug/fontconfig/2.17.1/src/fcdbg
 .c /usr/src/debug/fontconfig/2.17.1/src/fccharset.c /usr/src/debug/fontconfig/2.17.1/src/fcformat.c /usr/src/debug/fontconfig/2.17.1/src/fcmutex.h /usr/src/debug/fontconfig/2.17.1/src/fcdefault.c /usr/src/debug/fontconfig/2.17.1/src/fcobjshash.gperf /usr/src/debug/fontconfig/2.17.1/src/fcfs.c /usr/src/debug/fontconfig/2.17.1/src/fcobjs.c /usr/src/debug/fontconfig/2.17.1/src/fcrange.c /usr/src/debug/fontconfig/2.17.1/src/fcstat.c /usr/src/debug/fontconfig/2.17.1/src/fcname.c /usr/src/debug/fontconfig/2.17.1/src/fcweight.c /usr/src/debug/fontconfig/2.17.1/src/fcatomic.h /usr/src/debug/fontconfig/2.17.1/src/fcatomic.c /usr/src/debug/fontconfig/2.17.1/src/fclist.c /usr/src/debug/fontconfig/2.17.1/src/fccache.c /usr/src/debug/fontconfig/2.17.1/src/fcmd5.h /usr/src/debug/fontconfig/2.17.1/src/fcserialize.c /usr/src/debug/fontconfig/2.17.1/src/ftglue.c /usr/src/debug/fontconfig/2.17.1/src/fcmatch.c /usr/src/debug/fontconfig/2.17.1/src/ftglue.h /usr/src/debug/fontconfig/2.17.1/src/fccompat.
 c /usr/src/debug/fontconfig/2.17.1/src/fcinit.c /usr/src/debug/fontconfig/2.17.1/src/fcfoundry.h", added "/usr/src/debug/fontconfig/2.18.1/src/fcstr.c /usr/src/debug/fontconfig/2.18.1/src/fcint.h /usr/src/debug/fontconfig/2.18.1/src/fcmatrix.c /usr/src/debug/fontconfig/2.18.1/fc-const/fcconst.h /usr/src/debug/fontconfig/2.18.1/src/fcdir.c /usr/src/debug/fontconfig/2.18.1/src/fchash.c /usr/src/debug/fontconfig/2.18.1/src/fcxml.c /usr/src/debug/fontconfig/2.18.1/src/fclang.c /usr/src/debug/fontconfig/2.18.1/src/fcptrlist.c /usr/src/debug/fontconfig/2.18.1/src/fccfg.c /usr/src/debug/fontconfig/2.18.1/src/fcpat.c /usr/src/debug/fontconfig/2.18.1/src/fcfreetype.c /usr/src/debug/fontconfig/2.18.1/src/fcdbg.c /usr/src/debug/fontconfig/2.18.1/src/fccharset.c /usr/src/debug/fontconfig/2.18.1/src/fcformat.c /usr/src/debug/fontconfig/2.18.1/src/fcmutex.h /usr/src/debug/fontconfig/2.18.1/src/fcdefault.c /usr/src/debug/fontconfig/2.18.1/src/fcobjshash.gperf /usr/src/debug/fontconfig/2.18.1/src/f
 cfs.c /usr/src/debug/fontconfig/2.18.1/src/fcconffile.c /usr/src/debug/fontconfig/2.18.1/src/fcobjs.c /usr/src/debug/fontconfig/2.18.1/src/fcrange.c /usr/src/debug/fontconfig/2.18.1/src/fcstat.c /usr/src/debug/fontconfig/2.18.1/src/fcname.c /usr/src/debug/fontconfig/2.18.1/src/fcweight.c /usr/src/debug/fontconfig/2.18.1/src/fcatomic.h /usr/src/debug/fontconfig/2.18.1/src/fcatomic.c /usr/src/debug/fontconfig/2.18.1/src/fclist.c /usr/src/debug/fontconfig/2.18.1/src/fccache.c /usr/src/debug/fontconfig/2.18.1/src/fcmd5.h /usr/src/debug/fontconfig/2.18.1/src/fcserialize.c /usr/src/debug/fontconfig/2.18.1/src/ftglue.c /usr/src/debug/fontconfig/2.18.1/src/fcmatch.c /usr/src/debug/fontconfig/2.18.1/src/ftglue.h /usr/src/debug/fontconfig/2.18.1/src/fccompat.c /usr/src/debug/fontconfig/2.18.1/src/fcinit.c /usr/src/debug/fontconfig/2.18.1/fc-genconf/fc-genconf.c /usr/src/debug/fontconfig/2.18.1/src/fcfoundry.h"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-src: PKGV changed from 2.17.1 [default] to 2.18.1 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-src: PKGSIZE changed from 1007008 to 1065533 (+6%)
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-src: PV changed from "2.17.1" to "2.18.1"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-staticdev: PKGV changed from 2.17.1 [default] to 2.18.1 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-staticdev: PV changed from "2.17.1" to "2.18.1"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-utils: FILELIST: added "/usr/bin/fc-genconf"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-utils: PKGV changed from 2.17.1 [default] to 2.18.1 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-utils: PKGSIZE changed from 142368 to 156824 (+10%)
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-utils: PV changed from "2.17.1" to "2.18.1"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig: FILELIST: removed "/usr/lib/libfontconfig.so.1.16.0", added "/usr/lib/libfontconfig.so.1.17.0 /etc/fonts/conf.d/48-guessfamily.conf"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig: PKGV changed from 2.17.1 [default] to 2.18.1 [default]
packages/x86-64-v3-poky-linux/fontconfig/fontconfig: PKGSIZE changed from 482072 to 524736 (+9%)
packages/x86-64-v3-poky-linux/fontconfig/fontconfig: PV changed from "2.17.1" to "2.18.1"
packages/x86-64-v3-poky-linux/fontconfig: PKGV changed from 2.17.1 [default] to 2.18.1 [default]
packages/x86-64-v3-poky-linux/fontconfig: SRC_URI changed from "https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/2.17.1/fontconfig-2.17.1.tar.xz file://revert-static-pkgconfig.patch file://musl-fix.patch file://0001-build-Added-missing-target-rule-dependencies.patch" to "https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/2.18.1/fontconfig-2.18.1.tar.xz file://revert-static-pkgconfig.patch"
packages/x86-64-v3-poky-linux/fontconfig: PV changed from "2.17.1" to "2.18.1"
Changes to packages/x86-64-v3-poky-linux/fontconfig (sysroot):
  /usr/lib/libfontconfig.so.1 changed symlink target from libfontconfig.so.1.16.0 to libfontconfig.so.1.17.0
  /usr/lib/libfontconfig.so.1.16.0 moved to /usr/lib/libfontconfig.so.1.17.0

--===============6609367451177888814==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-fontconfig-upgrade-2.17.1-2.18.1.patch"

RnJvbSAwZmIxNDE0YjI4MDQ0MTBkNWM3YmU2ODY4MTk4YzgzOGU3MDcyMzNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTI6MDE6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBm
b250Y29uZmlnOiB1cGdyYWRlIDIuMTcuMSAtPiAyLjE4LjEKCi0tLQogLi4uZGVkLW1pc3Npbmct
dGFyZ2V0LXJ1bGUtZGVwZW5kZW5jaWVzLnBhdGNoIHwgMzEgLS0tLS0tLS0tCiAuLi4vZm9udGNv
bmZpZy9mb250Y29uZmlnL211c2wtZml4LnBhdGNoICAgICAgfCA2NiAtLS0tLS0tLS0tLS0tLS0t
LS0tCiAuLi4vZm9udGNvbmZpZy9yZXZlcnQtc3RhdGljLXBrZ2NvbmZpZy5wYXRjaCAgfCAgOCAr
KysKIC4uLnRjb25maWdfMi4xNy4xLmJiID0+IGZvbnRjb25maWdfMi4xOC4xLmJifSB8ICA0ICst
CiA0IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTAwIGRlbGV0aW9ucygtKQogZGVs
ZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1ncmFwaGljcy9mb250Y29uZmlnL2ZvbnRjb25m
aWcvMDAwMS1idWlsZC1BZGRlZC1taXNzaW5nLXRhcmdldC1ydWxlLWRlcGVuZGVuY2llcy5wYXRj
aAogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1ncmFwaGljcy9mb250Y29uZmlnL2Zv
bnRjb25maWcvbXVzbC1maXgucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZm9u
dGNvbmZpZy97Zm9udGNvbmZpZ18yLjE3LjEuYmIgPT4gZm9udGNvbmZpZ18yLjE4LjEuYmJ9ICg5
MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ZvbnRjb25maWcvZm9udGNv
bmZpZy8wMDAxLWJ1aWxkLUFkZGVkLW1pc3NpbmctdGFyZ2V0LXJ1bGUtZGVwZW5kZW5jaWVzLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ZvbnRjb25maWcvZm9udGNvbmZpZy8wMDAxLWJ1
aWxkLUFkZGVkLW1pc3NpbmctdGFyZ2V0LXJ1bGUtZGVwZW5kZW5jaWVzLnBhdGNoCmRlbGV0ZWQg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCA0MGIyNWNjOTI2Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9mb250Y29uZmlnL2ZvbnRjb25maWcvMDAwMS1idWlsZC1BZGRlZC1t
aXNzaW5nLXRhcmdldC1ydWxlLWRlcGVuZGVuY2llcy5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0x
LDMxICswLDAgQEAKLUZyb20gMGJiYTc5YmZkM2Q4YTIxNjc5NGQxNWFmOTdjZTRhYmVmZDRiODc0
OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206ID0/VVRGLTg/cT9GbG9yaWFuPTIwPTIy
c3Axcml0PTIyPUUyPTgwPThCPz0gPHNwMXJpdEBkaXNyb290Lm9yZz4KLURhdGU6IFNhdCwgOSBB
dWcgMjAyNSAyMDoyMjo0MyArMDIwMAotU3ViamVjdDogW1BBVENIXSBidWlsZDogQWRkZWQgbWlz
c2luZyB0YXJnZXQgcnVsZS1kZXBlbmRlbmNpZXMKLQotMDJiODM1YjYyIGRpZCBub3QgYXBwcm9w
cmlhdGVseSBlbnN1cmUsIHRoYXQgdGhlIHBhdHRlcm5saWJfaW50ZXJuYWwKLXRhcmdldCB3YWl0
cyB1bnRpbCB0aGUge2Z0Xyx9YWxpYXNfaGVhZGVycyBoYXZlIGZpbmlzaGVkIGdlbmVyYXRpbmcg
dGhlCi1oZWFkZXJzIHRoYXQgaXQgZGVwZW5kcyBvbi4KLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNr
cG9ydCBbMGJiYTc5YmZkM2Q4YTIxNjc5NGQxNWFmOTdjZTRhYmVmZDRiODc0OF0KLVNpZ25lZC1v
ZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgotLS0tCi0gc3JjL21lc29u
LmJ1aWxkIHwgMiArLQotIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQotCi1kaWZmIC0tZ2l0IGEvc3JjL21lc29uLmJ1aWxkIGIvc3JjL21lc29uLmJ1aWxkCi1p
bmRleCBjNGQ2NWQ2Yy4uMTA4NjZhYTggMTAwNjQ0Ci0tLS0gYS9zcmMvbWVzb24uYnVpbGQKLSsr
KyBiL3NyYy9tZXNvbi5idWlsZAotQEAgLTksNyArOSw3IEBAIGVuZGlmCi0gIyBGYWN0b3Igb3Vy
IHBhdHRlcm4gbWFuaXB1bGF0aW9uIGNvZGUgaW50byBpdHMgb3duIGxpYnJhcnkKLSAjIHRvIGJy
ZWFrIHRoZSBkZXBlZGVuY3kgY3ljbGU6Ci0gIyBGb250Q29uZmlnIHBhdHRlcm4gaGFuZGxpbmcg
LSBGb250YXRpb25zIGNvZGUgLSBGb250Q29uZmlnLgotLXBhdHRlcm5fc291cmNlcyA9IFsgJ2Zj
cGF0LmMnLCBmY3N0ZGludF9oLCBmY2xhbmdfaCBdCi0rcGF0dGVybl9zb3VyY2VzID0gWyAnZmNw
YXQuYycsIGZjc3RkaW50X2gsIGZjbGFuZ19oLCBhbGlhc19oZWFkZXJzLCBmdF9hbGlhc19oZWFk
ZXJzIF0KLSBwYXR0ZXJuX2xpYiA9IHN0YXRpY19saWJyYXJ5KCdwYXR0ZXJubGliX2ludGVybmFs
JywKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXR0ZXJuX3NvdXJjZXMs
Ci0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5jbHVkZV9kaXJlY3Rvcmll
czogaW5jYmFzZSwKLS0tIAotMi40My4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9mb250Y29uZmlnL2ZvbnRjb25maWcvbXVzbC1maXgucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvZm9udGNvbmZpZy9mb250Y29uZmlnL211c2wtZml4LnBhdGNoCmRlbGV0ZWQgZmls
ZSBtb2RlIDEwMDY0NAppbmRleCBjNDUwOGJkMTVhLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9mb250Y29uZmlnL2ZvbnRjb25maWcvbXVzbC1maXgucGF0Y2gKKysrIC9k
ZXYvbnVsbApAQCAtMSw2NiArMCwwIEBACi1Gcm9tIDc1Y2MzZTZlZjBlNDUxZjQyZDM0NjRlZDRk
NjM5MzA0YWQ5YTRmNTggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBBa2lyYSBUQUdP
SCA8YWtpcmFAdGFnb2gub3JnPgotRGF0ZTogVGh1LCAzIEp1bCAyMDI1IDAzOjMxOjQ5ICswOTAw
Ci1TdWJqZWN0OiBbUEFUQ0hdIHRlc3Q6IEZpeCBhIGJ1aWxkIGlzc3VlIHdpdGggbXVzbCBsaWJj
Ci0KLUZpeGVzIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9mb250Y29uZmlnL2ZvbnRj
b25maWcvLS9pc3N1ZXMvNDg0Ci0KLUNoYW5nZWxvZzogZml4ZWQKLVVwc3RyZWFtLVN0YXR1czog
QmFja3BvcnQgW2h0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9mb250Y29uZmlnL2ZvbnRj
b25maWcvLS9jb21taXQvNzVjYzNlNmVmMGU0NTFmNDJkMzQ2NGVkNGQ2MzkzMDRhZDlhNGY1OF0K
LVNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+Ci0t
LS0KLSB0ZXN0L3Rlc3QtbXQtZmNjZmcuYyB8IDIyICsrKysrKysrKysrKysrKysrKysrLS0KLSAx
IGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKLQotZGlmZiAt
LWdpdCBhL3Rlc3QvdGVzdC1tdC1mY2NmZy5jIGIvdGVzdC90ZXN0LW10LWZjY2ZnLmMKLWluZGV4
IDI0YWQ3NTgzLi4zYjdkODQzZCAxMDA2NDQKLS0tLSBhL3Rlc3QvdGVzdC1tdC1mY2NmZy5jCi0r
KysgYi90ZXN0L3Rlc3QtbXQtZmNjZmcuYwotQEAgLTEsOSArMSwxMiBAQAotIC8qIENvcHlyaWdo
dCAoQykgMjAyNSBmb250Y29uZmlnIEF1dGhvcnMgKi8KLSAvKiBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogSFBORCAqLwotKyNpZmRlZiBIQVZFX0NPTkZJR19ICi0rIyAgaW5jbHVkZSAiY29uZmln
LmgiCi0rI2VuZGlmCi0rCi0gI2luY2x1ZGUgPGZvbnRjb25maWcvZm9udGNvbmZpZy5oPgotIAot
ICNpbmNsdWRlIDxzdGRpby5oPgotLSNkZWZpbmUgX19VU0VfWE9QRU4KLSAjaW5jbHVkZSA8cHRo
cmVhZC5oPgotICNpbmNsdWRlIDxzdGRsaWIuaD4KLSAKLUBAIC0xMyw2ICsxNiwyMSBAQCBzdHJ1
Y3QgdGhyX2FyZ19zIHsKLSAgICAgaW50IHRocl9udW07Ci0gfTsKLSAKLSsjaWZkZWYgX1dJTjMy
Ci0raW50Ci0rc2V0ZW52IChjb25zdCBjaGFyICpuYW1lLCBjb25zdCBjaGFyICp2YWx1ZSwgaW50
IG8pCi0rewotKyAgICBzaXplX3QgbGVuID0gc3RybGVuIChuYW1lKSArIHN0cmxlbiAodmFsdWUp
ICsgMTsKLSsgICAgY2hhciAgKnMgPSBtYWxsb2MgKGxlbiArIDEpOwotKyAgICBpbnQgICAgcmV0
OwotKwotKyAgICBzbnByaW50ZiAocywgbGVuLCAiJXM9JXMiLCBuYW1lLCB2YWx1ZSk7Ci0rICAg
IHJldCA9IF9wdXRlbnYgKHMpOwotKyAgICBmcmVlIChzKTsKLSsgICAgcmV0dXJuIHJldDsKLSt9
Ci0rI2VuZGlmCi0rCi0gc3RhdGljIHZvaWQgKgotIHJ1bl90ZXN0X2luX3RocmVhZCAodm9pZCAq
YXJnKQotIHsKLUBAIC02MSw3ICs3OSw3IEBAIHRlc3QgKHZvaWQpCi0gICAgIGlmIChjMSA9PSBj
MikKLSAJcmV0dXJuIDE7Ci0gICAgIC8qIFRvIG1ha2UgdmlzaWJsZSBpZiB3ZSBoYXZlIGFueSBy
ZWZlcmVuY2VzICovCi0tICAgIHB1dGVudiAoIkZDX0RFQlVHPTE2Iik7Ci0rICAgIHNldGVudiAo
IkZDX0RFQlVHIiwgIjE2IiwgMSk7Ci0gICAgIEZjRmluaSgpOwotIAotICAgICByZXR1cm4gMDsK
LS0tIAotR2l0TGFiCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9mb250Y29u
ZmlnL2ZvbnRjb25maWcvcmV2ZXJ0LXN0YXRpYy1wa2djb25maWcucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvZm9udGNvbmZpZy9mb250Y29uZmlnL3JldmVydC1zdGF0aWMtcGtnY29uZmln
LnBhdGNoCmluZGV4IDMwZDY0MjMwMzcuLjRjNTA1YjNlN2YgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9mb250Y29uZmlnL2ZvbnRjb25maWcvcmV2ZXJ0LXN0YXRpYy1wa2djb25m
aWcucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ZvbnRjb25maWcvZm9udGNvbmZp
Zy9yZXZlcnQtc3RhdGljLXBrZ2NvbmZpZy5wYXRjaApAQCAtMSwzICsxLDggQEAKK0Zyb20gMDY4
OTdiYTEwYzFhYjBkNjg0NGUxNjM1M2ExNTYzMTc0ZjkzYWQ0ZiBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CitEYXRlOiBUaHUsIDIz
IEFwciAyMDE1IDIwOjM1OjMyIC0wNzAwCitTdWJqZWN0OiBbUEFUQ0hdIGZvbnRjb25maWc6IEZp
eCBwa2djb25maWcgZmlsZSBnZW5lcmF0aW9uIHRvIG5vdCBoYXZlCisKIFJldmVydCBwYXJ0IG9m
IGh0dHA6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9mb250Y29uZmlnL2NvbW1pdC9mb250Y29uZmln
LnBjLmluP2lkPTMzOGZmZTZiODg2YWQ0YmE4NmZmNDcxY2I1OWM0YTVlNWZmYmU0MDgKIFdlIHJl
YWxseSBkb250IGRvIHN0YXRpYyBsaW5raW5nIHNvIGl0cyBub3QgZ29pbmcgdG8gY2F1c2UgaXNz
dWVzIGZvciB1cyBidXQgYXMgc3VjaCB0aGlzIGlzIGhhcm1pbmcgdXMgYnkgYWRkaW5nIGFic29s
dXRlCiBwYXRocyBpbnRvIC1JIG9wdGlvbnMgaW50byBmb250Y29uZmlnLnBjIHdoaWNoIGlzIHRo
ZW0gcHJlcGVuZGVkIHdpdGggc3lzcm9vdCB3aGVuIHJlYWQgYmFjayBieSBjcm9zcyBwa2ctY29u
ZmlnIGFuZApAQCAtNyw2ICsxMiw5IEBAIGdlbnRseSByZWZ1c2VzIGFuZCByaWdodGx5IHNvLgog
CiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW09FLVNwZWNpZmljXQogU2lnbmVkLW9m
Zi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KKy0tLQorIGZvbnRjb25maWcucGMu
aW4gfCAyICstCisgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiAKIGRpZmYgLS1naXQgYS9mb250Y29uZmlnLnBjLmluIGIvZm9udGNvbmZpZy5wYy5pbgogaW5k
ZXggNjFiMzVmYi4uNWJjOWJhYiAxMDA2NDQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9mb250Y29uZmlnL2ZvbnRjb25maWdfMi4xNy4xLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL2ZvbnRjb25maWcvZm9udGNvbmZpZ18yLjE4LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MiUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ZvbnRjb25maWcvZm9udGNvbmZpZ18y
LjE3LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9mb250Y29uZmlnL2ZvbnRj
b25maWdfMi4xOC4xLmJiCmluZGV4IDBkMGZjZmNjZWIuLjc2YjI2NTI3MzggMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9mb250Y29uZmlnL2ZvbnRjb25maWdfMi4xNy4xLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9mb250Y29uZmlnL2ZvbnRjb25maWdfMi4xOC4xLmJi
CkBAIC0yMiwxMCArMjIsOCBAQCBERVBFTkRTID0gImV4cGF0IGZyZWV0eXBlIHpsaWIgZ3BlcmYt
bmF0aXZlIHV0aWwtbGludXgiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0
b3Aub3JnL2FwaS92NC9wcm9qZWN0cy84OTAvcGFja2FnZXMvZ2VuZXJpYy9mb250Y29uZmlnLyR7
UFZ9L2ZvbnRjb25maWctJHtQVn0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovL3JldmVydC1z
dGF0aWMtcGtnY29uZmlnLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovL211c2wtZml4LnBhdGNo
IFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtYnVpbGQtQWRkZWQtbWlzc2luZy10YXJnZXQtcnVs
ZS1kZXBlbmRlbmNpZXMucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiOWY1Y2FlOTNmNGZmZmMxZmJjMDVhZTk5Y2RmYzcwOGNkNjBkZmQ2NjEyZmZjMDUxMjgyNzAy
NWMwMjZmYTU0MSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyMzAwZjNkYmZhNzI1M2IzYTQ0ZjRm
ZWVjZGJjOGRmYTQ1ZGRlNWRjMmNmYjcxZmNlYWYzMWYzOTRjYjQxMDMxIgogCiBVUFNUUkVBTV9D
SEVDS19VUkkgPSAiaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2ZvbnRjb25maWcvZm9u
dGNvbmZpZy8tL3RhZ3MiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJyZWxlYXNlcy8oP1A8cHZl
cj4uKykiCi0tIAoyLjQ3LjEKCg==

--===============6609367451177888814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/fontconfig/fontconfig-utils: FILELIST: added "/usr/bin/fc-genconf"
packages/x86-64-v3-poky-linux/fontconfig/fontconfig-utils: PKGSIZE changed from 142368 to 156824 (+10%)
packages/x86-64-v3-poky-linux/fontconfig/fontconfig: FILELIST: removed "/usr/lib/libfontconfig.so.1.16.0", added "/etc/fonts/conf.d/48-guessfamily.conf /usr/lib/libfontconfig.so.1.17.0"
Changes to packages/x86-64-v3-poky-linux/fontconfig (sysroot):
  /usr/lib/libfontconfig.so.1 changed symlink target from libfontconfig.so.1.16.0 to libfontconfig.so.1.17.0
  /usr/lib/libfontconfig.so.1.16.0 moved to /usr/lib/libfontconfig.so.1.17.0

--===============6609367451177888814==--

