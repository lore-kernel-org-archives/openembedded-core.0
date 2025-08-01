Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3ED4CA0ECC
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:07:49 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.88616.1754057261605930845
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:07:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=MJRsBBko;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=q+jFfJoS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019865f5be57-eee649d7-0db3-4d60-bf7c-650f20fa2ad8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057260;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rMmtYU0OeTYfffvORgov98USupoRd+FKfqJUt0FMQck=;
	b=MJRsBBkoDzKWjqvvxDwqDS74+xDvmSUx0YfWdotcoKDOQ8ah828AY0mB2NIzE4l9
	lC0Mg4s0igR+yYgMsNegf/DD8Bqe4XOEh8FuyA5VO+Ui99sYkb8eKiWLoMI2ujJIlG4
	SqxVHNLT/a3l7aOXNDicjEbQ9/2mMjoO34LRf16A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057260;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rMmtYU0OeTYfffvORgov98USupoRd+FKfqJUt0FMQck=;
	b=q+jFfJoSDnL+yrudcH7bzFsPuDBR/O+R4bq79zavHDyCNxUtg2vh5HWWVHauV/Wx
	NxmOUTBHVCW/2EKO4wssn7gTPinfIKCey2IBAvwkGFF4/HJgDWvoukiyzw5L1FiTSYP
	iO7fpqIFg6tDrV9bfb8rHDdxhQTP8+XDCt94gVB8=
Content-Type: multipart/mixed; boundary="===============0827913057576582605=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>, Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-2.0-initial,glib-2.0: upgrading to 2.84.3,2.84.3 SUCCEEDED
Message-ID: <0101019865f5be57-eee649d7-0db3-4d60-bf7c-650f20fa2ad8-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221247

--===============0827913057576582605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *glib-2.0-initial,glib-2.0* to *2.84.3,2.84.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glib-2.0-initial-glib-2.0-upgrade-2.84.2-2.84.3-2.84.patch
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
From 6f042873355ccbdf30e287405336490143156ff2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 05:23:10 +0000
Subject: [PATCH] glib-2.0-initial,glib-2.0: upgrade 2.84.2 -> 2.84.3,2.84.2 ->
 2.84.3

---
 .../0001-Do-not-write-bindir-into-pkg-config-files.patch    | 2 +-
 .../files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch        | 2 +-
 .../0001-Install-gio-querymodules-as-libexec_PROGRAM.patch  | 2 +-
 ...move-the-warning-about-deprecated-paths-in-schemas.patch | 2 +-
 ...o-tests-resources.c-comment-out-a-build-host-only-.patch | 2 +-
 .../0001-meson-Run-atomics-test-on-clang-as-well.patch      | 6 +++---
 ...son.build-do-not-enable-pidfd-features-on-native-g.patch | 6 +++---
 ...010-Do-not-hardcode-python-path-into-various-tools.patch | 2 +-
 meta/recipes-core/glib-2.0/files/relocate-modules.patch     | 2 +-
 meta/recipes-core/glib-2.0/files/skip-timeout.patch         | 2 +-
 ...lib-2.0-initial_2.84.2.bb => glib-2.0-initial_2.84.3.bb} | 0
 .../glib-2.0/{glib-2.0_2.84.2.bb => glib-2.0_2.84.3.bb}     | 0
 meta/recipes-core/glib-2.0/glib.inc                         | 2 +-
 13 files changed, 15 insertions(+), 15 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.84.2.bb => glib-2.0-initial_2.84.3.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.84.2.bb => glib-2.0_2.84.3.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
index c394ab3277..c0990b1128 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
@@ -1,4 +1,4 @@
-From 8981db5d775e04b72fb68b6a4553c87fdaedee65 Mon Sep 17 00:00:00 2001
+From 71126c2e652c8481f858acb9253f89c6ee92d8aa Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not prefix executables with $bindir in pkg-config files
diff --git a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
index 19fffbdc5f..418c602761 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
@@ -1,4 +1,4 @@
-From 48bfc87e9f757cf65ad967520860bfd7526c36f2 Mon Sep 17 00:00:00 2001
+From 6fe95f0fedcc22b0054390dfbb187224563d6127 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
index 89ba10ff6d..a18862b765 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From b8dcbf03b315d31759176e9d4fd389e8fda6ffcd Mon Sep 17 00:00:00 2001
+From 8d7c0dd664c215ba46557d57e0acef232db31b04 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
diff --git a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
index ebdf957272..ef5f6ecae8 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From bdb2772d672e95584585e902689936559c5db05d Mon Sep 17 00:00:00 2001
+From c87f1da2fda1694f1bf4f43d99652defb4dacc9f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
index 771b03e66d..ad18e30f9f 100644
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From 8cb75d3bc368ee108a4b14bc57a92bd0c0b2e10e Mon Sep 17 00:00:00 2001
+From 00874b534c4d9902c67c0704de603226a29cb748 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
index e5878a1428..ea456c6210 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
@@ -1,4 +1,4 @@
-From 502984fe340a76c92e2c04235f43fdcb47728806 Mon Sep 17 00:00:00 2001
+From 7cfcd03e74258a33e030262fefd003eeb5476b43 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index a8bcadc..041b68e 100644
+index 2aff65b..e2ba84c 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -2075,7 +2075,7 @@ atomicdefine = '''
+@@ -2077,7 +2077,7 @@ atomicdefine = '''
  # We know that we can always use real ("lock free") atomic operations with MSVC
  if cc.get_id() == 'msvc' or cc.get_id() == 'clang-cl' or cc.links(atomictest, name : 'atomic ops')
    have_atomic_lock_free = true
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
index e512940e34..b128a6e16a 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From d5e566c45a9ab4d7e51104ab176e6eb5f705f91d Mon Sep 17 00:00:00 2001
+From 8234ed2498b86816327c2855dd92c0b18e7cdbfa Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native glib
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 041b68e..155bfd4 100644
+index e2ba84c..dee62d8 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -1073,7 +1073,8 @@ if cc.links('''#include <sys/syscall.h>
+@@ -1075,7 +1075,8 @@ if cc.links('''#include <sys/syscall.h>
                   waitid (P_PIDFD, 0, &child_info, WEXITED | WNOHANG);
                   return 0;
                 }''', name : 'pidfd_open(2) system call')
diff --git a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
index d26f944d51..7957060ce4 100644
--- a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
@@ -1,4 +1,4 @@
-From 211927d2caa4a81e1131c2210e1db838104a1fb9 Mon Sep 17 00:00:00 2001
+From 6d33c7f26c4c70a8ab259b255320c4a14ae6b5c1 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
diff --git a/meta/recipes-core/glib-2.0/files/relocate-modules.patch b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
index ddf464526c..60e2c549cf 100644
--- a/meta/recipes-core/glib-2.0/files/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 456bac53f19d3094aa2007054c87d86c9d65b423 Mon Sep 17 00:00:00 2001
+From a0f0877ddb6cf4eff32971c0d0fd72386152f47b Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/files/skip-timeout.patch b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
index 138e970553..254da12cbe 100644
--- a/meta/recipes-core/glib-2.0/files/skip-timeout.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
@@ -1,4 +1,4 @@
-From 51bfcab0b60bd57f4d3463c479fdf47e645cd6fe Mon Sep 17 00:00:00 2001
+From 422eebf2deafe582e04c3478468915ce762f08e2 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 28 Mar 2024 16:27:09 +0000
 Subject: [PATCH] Skip /timeout/rounding test
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.3.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.3.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.84.3.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.84.3.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index ba7763c841..cc9e070291 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -234,7 +234,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[sha256sum] = "88e960dd937057407d61fcb3b45a860704b25923c37ae2478b85f2ecb5a4021f"
+SRC_URI[sha256sum] = "aa4f87c3225bf57ca85f320888f7484901a17934ca37023c3bd8435a72db863e"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.47.1


--===============0827913057576582605==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-2.0-initial-glib-2.0-upgrade-2.84.2-2.84.3-2.84.patch"

RnJvbSA2ZjA0Mjg3MzM1NWNjYmRmMzBlMjg3NDA1MzM2NDkwMTQzMTU2ZmYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAwNToyMzoxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGds
aWItMi4wLWluaXRpYWwsZ2xpYi0yLjA6IHVwZ3JhZGUgMi44NC4yIC0+IDIuODQuMywyLjg0LjIg
LT4KIDIuODQuMwoKLS0tCiAuLi4vMDAwMS1Eby1ub3Qtd3JpdGUtYmluZGlyLWludG8tcGtnLWNv
bmZpZy1maWxlcy5wYXRjaCAgICB8IDIgKy0KIC4uLi9maWxlcy8wMDAxLUZpeC1EQVRBRElSTkFN
RS1vbi11Y2xpYmMtTGludXgucGF0Y2ggICAgICAgIHwgMiArLQogLi4uLzAwMDEtSW5zdGFsbC1n
aW8tcXVlcnltb2R1bGVzLWFzLWxpYmV4ZWNfUFJPR1JBTS5wYXRjaCAgfCAyICstCiAuLi5tb3Zl
LXRoZS13YXJuaW5nLWFib3V0LWRlcHJlY2F0ZWQtcGF0aHMtaW4tc2NoZW1hcy5wYXRjaCB8IDIg
Ky0KIC4uLm8tdGVzdHMtcmVzb3VyY2VzLmMtY29tbWVudC1vdXQtYS1idWlsZC1ob3N0LW9ubHkt
LnBhdGNoIHwgMiArLQogLi4uLzAwMDEtbWVzb24tUnVuLWF0b21pY3MtdGVzdC1vbi1jbGFuZy1h
cy13ZWxsLnBhdGNoICAgICAgfCA2ICsrKy0tLQogLi4uc29uLmJ1aWxkLWRvLW5vdC1lbmFibGUt
cGlkZmQtZmVhdHVyZXMtb24tbmF0aXZlLWcucGF0Y2ggfCA2ICsrKy0tLQogLi4uMDEwLURvLW5v
dC1oYXJkY29kZS1weXRob24tcGF0aC1pbnRvLXZhcmlvdXMtdG9vbHMucGF0Y2ggfCAyICstCiBt
ZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoICAg
ICB8IDIgKy0KIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzL3NraXAtdGltZW91dC5w
YXRjaCAgICAgICAgIHwgMiArLQogLi4ubGliLTIuMC1pbml0aWFsXzIuODQuMi5iYiA9PiBnbGli
LTIuMC1pbml0aWFsXzIuODQuMy5iYn0gfCAwCiAuLi4vZ2xpYi0yLjAve2dsaWItMi4wXzIuODQu
Mi5iYiA9PiBnbGliLTIuMF8yLjg0LjMuYmJ9ICAgICB8IDAKIG1ldGEvcmVjaXBlcy1jb3JlL2ds
aWItMi4wL2dsaWIuaW5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogMTMgZmlsZXMg
Y2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWNvcmUvZ2xpYi0yLjAve2dsaWItMi4wLWluaXRpYWxfMi44NC4yLmJiID0+IGdsaWIt
Mi4wLWluaXRpYWxfMi44NC4zLmJifSAoMTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS9n
bGliLTIuMC97Z2xpYi0yLjBfMi44NC4yLmJiID0+IGdsaWItMi4wXzIuODQuMy5iYn0gKDEwMCUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1Eby1u
b3Qtd3JpdGUtYmluZGlyLWludG8tcGtnLWNvbmZpZy1maWxlcy5wYXRjaCBiL21ldGEvcmVjaXBl
cy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtRG8tbm90LXdyaXRlLWJpbmRpci1pbnRvLXBrZy1j
b25maWctZmlsZXMucGF0Y2gKaW5kZXggYzM5NGFiMzI3Ny4uYzA5OTBiMTEyOCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1Eby1ub3Qtd3JpdGUtYmlu
ZGlyLWludG8tcGtnLWNvbmZpZy1maWxlcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9n
bGliLTIuMC9maWxlcy8wMDAxLURvLW5vdC13cml0ZS1iaW5kaXItaW50by1wa2ctY29uZmlnLWZp
bGVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4OTgxZGI1ZDc3NWUwNGI3MmZiNjhiNmE0
NTUzYzg3ZmRhZWRlZTY1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3MTEyNmMyZTY1
MmM4NDgxZjg1OGFjYjkyNTNmODljNmVlOTJkOGFhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBG
cmksIDE1IEZlYiAyMDE5IDExOjE3OjI3ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIERvIG5vdCBw
cmVmaXggZXhlY3V0YWJsZXMgd2l0aCAkYmluZGlyIGluIHBrZy1jb25maWcgZmlsZXMKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtRml4LURBVEFESVJO
QU1FLW9uLXVjbGliYy1MaW51eC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2Zp
bGVzLzAwMDEtRml4LURBVEFESVJOQU1FLW9uLXVjbGliYy1MaW51eC5wYXRjaAppbmRleCAxOWZm
ZmJkYzVmLi40MThjNjAyNzYxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIu
MC9maWxlcy8wMDAxLUZpeC1EQVRBRElSTkFNRS1vbi11Y2xpYmMtTGludXgucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1GaXgtREFUQURJUk5BTUUtb24t
dWNsaWJjLUxpbnV4LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0OGJmYzg3ZTlmNzU3Y2Y2
NWFkOTY3NTIwODYwYmZkNzUyNmMzNmYyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2
ZmU5NWYwZmVkY2MyMmIwMDU0MzkwZGZiYjE4NzIyNDU2M2Q2MTI3IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFNhdCwg
MTUgTWFyIDIwMTQgMjI6NDI6MjkgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gRml4IERBVEFESVJO
QU1FIG9uIHVjbGliYy9MaW51eApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0y
LjAvZmlsZXMvMDAwMS1JbnN0YWxsLWdpby1xdWVyeW1vZHVsZXMtYXMtbGliZXhlY19QUk9HUkFN
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1JbnN0YWxsLWdp
by1xdWVyeW1vZHVsZXMtYXMtbGliZXhlY19QUk9HUkFNLnBhdGNoCmluZGV4IDg5YmExMGZmNmQu
LmExODg2MmI3NjUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVz
LzAwMDEtSW5zdGFsbC1naW8tcXVlcnltb2R1bGVzLWFzLWxpYmV4ZWNfUFJPR1JBTS5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLUluc3RhbGwtZ2lvLXF1
ZXJ5bW9kdWxlcy1hcy1saWJleGVjX1BST0dSQU0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IGI4ZGNiZjAzYjMxNWQzMTc1OTE3NmU5ZDRmZDM4OWU4ZmRhNmZmY2QgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDhkN2MwZGQ2NjRjMjE1YmE0NjU1N2Q1N2UwYWNlZjIzMmRiMzFiMDQg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKdXNzaSBLdWtrb25lbiA8anVzc2kua3Vr
a29uZW5AaW50ZWwuY29tPgogRGF0ZTogVHVlLCAyMiBNYXIgMjAxNiAxNToxNDo1OCArMDIwMAog
U3ViamVjdDogW1BBVENIXSBJbnN0YWxsIGdpby1xdWVyeW1vZHVsZXMgYXMgbGliZXhlY19QUk9H
UkFNCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLVJl
bW92ZS10aGUtd2FybmluZy1hYm91dC1kZXByZWNhdGVkLXBhdGhzLWluLXNjaGVtYXMucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLVJlbW92ZS10aGUtd2Fybmlu
Zy1hYm91dC1kZXByZWNhdGVkLXBhdGhzLWluLXNjaGVtYXMucGF0Y2gKaW5kZXggZWJkZjk1NzI3
Mi4uZWY1ZjZlY2FlOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmls
ZXMvMDAwMS1SZW1vdmUtdGhlLXdhcm5pbmctYWJvdXQtZGVwcmVjYXRlZC1wYXRocy1pbi1zY2hl
bWFzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtUmVt
b3ZlLXRoZS13YXJuaW5nLWFib3V0LWRlcHJlY2F0ZWQtcGF0aHMtaW4tc2NoZW1hcy5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gYmRiMjc3MmQ2NzJlOTU1ODQ1ODVlOTAyNjg5OTM2NTU5YzVk
YjA1ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzg3ZjFkYTJmZGExNjk0ZjFiZjRm
NDNkOTk2NTJkZWZiNGRhY2M5ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhh
bmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogRnJpLCAxMiBKdW4g
MjAxNSAxNzowODo0NiArMDMwMAogU3ViamVjdDogW1BBVENIXSBSZW1vdmUgdGhlIHdhcm5pbmcg
YWJvdXQgZGVwcmVjYXRlZCBwYXRocyBpbiBzY2hlbWFzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLWdpby10ZXN0cy1yZXNvdXJjZXMuYy1jb21tZW50
LW91dC1hLWJ1aWxkLWhvc3Qtb25seS0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIu
MC9maWxlcy8wMDAxLWdpby10ZXN0cy1yZXNvdXJjZXMuYy1jb21tZW50LW91dC1hLWJ1aWxkLWhv
c3Qtb25seS0ucGF0Y2gKaW5kZXggNzcxYjAzZTY2ZC4uYWQxOGUzMGY5ZiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1naW8tdGVzdHMtcmVzb3VyY2Vz
LmMtY29tbWVudC1vdXQtYS1idWlsZC1ob3N0LW9ubHktLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtZ2lvLXRlc3RzLXJlc291cmNlcy5jLWNvbW1lbnQt
b3V0LWEtYnVpbGQtaG9zdC1vbmx5LS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOGNiNzVk
M2JjMzY4ZWUxMDhhNGIxNGJjNTdhOTJiZDBjMGIyZTEwZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gMDA4NzRiNTM0YzRkOTkwMmM2N2MwNzA0ZGU2MDMyMjZhMjljYjc0OCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5A
Z21haWwuY29tPgogRGF0ZTogV2VkLCA4IEphbiAyMDIwIDE4OjIyOjQ2ICswMTAwCiBTdWJqZWN0
OiBbUEFUQ0hdIGdpby90ZXN0cy9yZXNvdXJjZXMuYzogY29tbWVudCBvdXQgYSBidWlsZCBob3N0
LW9ubHkgdGVzdApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMv
MDAwMS1tZXNvbi1SdW4tYXRvbWljcy10ZXN0LW9uLWNsYW5nLWFzLXdlbGwucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLW1lc29uLVJ1bi1hdG9taWNzLXRlc3Qt
b24tY2xhbmctYXMtd2VsbC5wYXRjaAppbmRleCBlNTg3OGExNDI4Li5lYTQ1NmM2MjEwIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLW1lc29uLVJ1bi1h
dG9taWNzLXRlc3Qtb24tY2xhbmctYXMtd2VsbC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29y
ZS9nbGliLTIuMC9maWxlcy8wMDAxLW1lc29uLVJ1bi1hdG9taWNzLXRlc3Qtb24tY2xhbmctYXMt
d2VsbC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNTAyOTg0ZmUzNDBhNzZjOTJlMmMwNDIz
NWY0M2ZkY2I0NzcyODgwNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gN2NmY2QwM2U3
NDI1OGEzM2UwMzAyNjJmZWZkMDAzZWViNTQ3NmI0MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBTYXQsIDEyIE9jdCAy
MDE5IDE3OjQ2OjI2IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIG1lc29uOiBSdW4gYXRvbWljcyB0
ZXN0IG9uIGNsYW5nIGFzIHdlbGwKQEAgLTE0LDEwICsxNCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBL
aGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5i
dWlsZAotaW5kZXggYThiY2FkYy4uMDQxYjY4ZSAxMDA2NDQKK2luZGV4IDJhZmY2NWIuLmUyYmE4
NGMgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIvbWVzb24uYnVpbGQKLUBAIC0yMDc1
LDcgKzIwNzUsNyBAQCBhdG9taWNkZWZpbmUgPSAnJycKK0BAIC0yMDc3LDcgKzIwNzcsNyBAQCBh
dG9taWNkZWZpbmUgPSAnJycKICAjIFdlIGtub3cgdGhhdCB3ZSBjYW4gYWx3YXlzIHVzZSByZWFs
ICgibG9jayBmcmVlIikgYXRvbWljIG9wZXJhdGlvbnMgd2l0aCBNU1ZDCiAgaWYgY2MuZ2V0X2lk
KCkgPT0gJ21zdmMnIG9yIGNjLmdldF9pZCgpID09ICdjbGFuZy1jbCcgb3IgY2MubGlua3MoYXRv
bWljdGVzdCwgbmFtZSA6ICdhdG9taWMgb3BzJykKICAgIGhhdmVfYXRvbWljX2xvY2tfZnJlZSA9
IHRydWUKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEt
bWVzb24uYnVpbGQtZG8tbm90LWVuYWJsZS1waWRmZC1mZWF0dXJlcy1vbi1uYXRpdmUtZy5wYXRj
aCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtbWVzb24uYnVpbGQtZG8t
bm90LWVuYWJsZS1waWRmZC1mZWF0dXJlcy1vbi1uYXRpdmUtZy5wYXRjaAppbmRleCBlNTEyOTQw
ZTM0Li5iMTI4YTZlMTZhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9m
aWxlcy8wMDAxLW1lc29uLmJ1aWxkLWRvLW5vdC1lbmFibGUtcGlkZmQtZmVhdHVyZXMtb24tbmF0
aXZlLWcucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1t
ZXNvbi5idWlsZC1kby1ub3QtZW5hYmxlLXBpZGZkLWZlYXR1cmVzLW9uLW5hdGl2ZS1nLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkNWU1NjZjNDVhOWFiNGQ3ZTUxMTA0YWIxNzZlNmViNWY3
MDVmOTFkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4MjM0ZWQyNDk4Yjg2ODE2MzI3
YzI4NTVkZDkyYzBiMThlN2NkYmZhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxl
eGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KIERhdGU6IFNhdCwgMTYgU2VwIDIw
MjMgMjI6Mjg6MjcgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gbWVzb24uYnVpbGQ6IGRvIG5vdCBl
bmFibGUgcGlkZmQgZmVhdHVyZXMgb24gbmF0aXZlIGdsaWIKQEAgLTE0LDEwICsxNCwxMCBAQCBT
aWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdp
dCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKLWluZGV4IDA0MWI2OGUuLjE1NWJmZDQgMTAw
NjQ0CitpbmRleCBlMmJhODRjLi5kZWU2MmQ4IDEwMDY0NAogLS0tIGEvbWVzb24uYnVpbGQKICsr
KyBiL21lc29uLmJ1aWxkCi1AQCAtMTA3Myw3ICsxMDczLDggQEAgaWYgY2MubGlua3MoJycnI2lu
Y2x1ZGUgPHN5cy9zeXNjYWxsLmg+CitAQCAtMTA3NSw3ICsxMDc1LDggQEAgaWYgY2MubGlua3Mo
JycnI2luY2x1ZGUgPHN5cy9zeXNjYWxsLmg+CiAgICAgICAgICAgICAgICAgICB3YWl0aWQgKFBf
UElERkQsIDAsICZjaGlsZF9pbmZvLCBXRVhJVEVEIHwgV05PSEFORyk7CiAgICAgICAgICAgICAg
ICAgICByZXR1cm4gMDsKICAgICAgICAgICAgICAgICB9JycnLCBuYW1lIDogJ3BpZGZkX29wZW4o
Mikgc3lzdGVtIGNhbGwnKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAv
ZmlsZXMvMDAxMC1Eby1ub3QtaGFyZGNvZGUtcHl0aG9uLXBhdGgtaW50by12YXJpb3VzLXRvb2xz
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAxMC1Eby1ub3QtaGFy
ZGNvZGUtcHl0aG9uLXBhdGgtaW50by12YXJpb3VzLXRvb2xzLnBhdGNoCmluZGV4IGQyNmY5NDRk
NTEuLjc5NTcwNjBjZTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2Zp
bGVzLzAwMTAtRG8tbm90LWhhcmRjb2RlLXB5dGhvbi1wYXRoLWludG8tdmFyaW91cy10b29scy5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDEwLURvLW5vdC1o
YXJkY29kZS1weXRob24tcGF0aC1pbnRvLXZhcmlvdXMtdG9vbHMucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIDIxMTkyN2QyY2FhNGE4MWUxMTMxYzIyMTBlMWRiODM4MTA0YTFmYjkgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDZkMzNjN2YyNmM0YzcwYThhYjI1OWIyNTUzMjBjNGEx
NGFlNmI1YzEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZp
biA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFR1ZSwgMyBPY3QgMjAxNyAxMDo0NTo1
NSArMDMwMAogU3ViamVjdDogW1BBVENIXSBEbyBub3QgaGFyZGNvZGUgcHl0aG9uIHBhdGggaW50
byB2YXJpb3VzIHRvb2xzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9m
aWxlcy9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAv
ZmlsZXMvcmVsb2NhdGUtbW9kdWxlcy5wYXRjaAppbmRleCBkZGY0NjQ1MjZjLi42MGUyYzU0OWNm
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9yZWxvY2F0ZS1t
b2R1bGVzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzL3JlbG9j
YXRlLW1vZHVsZXMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDQ1NmJhYzUzZjE5ZDMwOTRh
YTIwMDcwNTRjODdkODZjOWQ2NWI0MjMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGEw
ZjA4NzdkZGI2Y2Y0ZWZmMzI5NzFjMGQwZmQ3MjM4NjE1MmY0N2IgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AaW50ZWwuY29tPgogRGF0ZTog
RnJpLCAxMSBNYXIgMjAxNiAxNTozNTo1NSArMDAwMAogU3ViamVjdDogW1BBVENIXSBnbGliLTIu
MDogcmVsb2NhdGUgdGhlIEdJTyBtb2R1bGUgZGlyZWN0b3J5IGZvciBuYXRpdmUgYnVpbGRzCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9za2lwLXRpbWVvdXQu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9za2lwLXRpbWVvdXQucGF0
Y2gKaW5kZXggMTM4ZTk3MDU1My4uMjU0ZGExMmNiZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWNvcmUvZ2xpYi0yLjAvZmlsZXMvc2tpcC10aW1lb3V0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1jb3JlL2dsaWItMi4wL2ZpbGVzL3NraXAtdGltZW91dC5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gNTFiZmNhYjBiNjBiZDU3ZjRkMzQ2M2M0NzlmZGY0N2U2NDVjZDZmZSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gNDIyZWViZjJkZWFmZTU4MmUwNGMzNDc4NDY4OTE1Y2U3NjJm
MDhlMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1
cnRvbkBhcm0uY29tPgogRGF0ZTogVGh1LCAyOCBNYXIgMjAyNCAxNjoyNzowOSArMDAwMAogU3Vi
amVjdDogW1BBVENIXSBTa2lwIC90aW1lb3V0L3JvdW5kaW5nIHRlc3QKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLWluaXRpYWxfMi44NC4yLmJiIGIvbWV0
YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAtaW5pdGlhbF8yLjg0LjMuYmIKc2ltaWxh
cml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ds
aWItMi4wLWluaXRpYWxfMi44NC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9nbGli
LTIuMC9nbGliLTIuMC1pbml0aWFsXzIuODQuMy5iYgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjBfMi44NC4yLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xp
Yi0yLjAvZ2xpYi0yLjBfMi44NC4zLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMF8yLjg0LjIuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wXzIuODQuMy5iYgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi5pbmMgYi9tZXRhL3JlY2lwZXMtY29y
ZS9nbGliLTIuMC9nbGliLmluYwppbmRleCBiYTc3NjNjODQxLi5jYzllMDcwMjkxIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLmluYworKysgYi9tZXRhL3JlY2lw
ZXMtY29yZS9nbGliLTIuMC9nbGliLmluYwpAQCAtMjM0LDcgKzIzNCw3IEBAIFNSQ19VUkk6YXBw
ZW5kOmNsYXNzLW5hdGl2ZSA9ICIgZmlsZTovL3JlbG9jYXRlLW1vZHVsZXMucGF0Y2ggXAogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmaWxlOi8vMDAwMS1tZXNvbi5idWlsZC1kby1u
b3QtZW5hYmxlLXBpZGZkLWZlYXR1cmVzLW9uLW5hdGl2ZS1nLnBhdGNoIFwKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjg4ZTk2MGRkOTM3
MDU3NDA3ZDYxZmNiM2I0NWE4NjA3MDRiMjU5MjNjMzdhZTI0NzhiODVmMmVjYjVhNDAyMWYiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiYWE0Zjg3YzMyMjViZjU3Y2E4NWYzMjA4ODhmNzQ4NDkwMWEx
NzkzNGNhMzcwMjNjM2JkODQzNWE3MmRiODYzZSIKIAogIyBGaW5kIGFueSBtZXNvbiBjcm9zcyBm
aWxlcyBpbiBGSUxFU1BBVEggdGhhdCBhcmUgcmVsZXZhbnQgZm9yIHRoZSBjdXJyZW50CiAjIGJ1
aWxkICh1c2luZyBzaXRlaW5mbykgYW5kIGFkZCB0aGVtIHRvIEVYVFJBX09FTUVTT04uCi0tIAoy
LjQ3LjEKCg==

--===============0827913057576582605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

Changes to packages/core2-64-poky-linux/glib-2.0-initial (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8400.2 to libgio-2.0.so.0.8400.3
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8400.2 to libgirepository-2.0.so.0.8400.3
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8400.2 to libglib-2.0.so.0.8400.3
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8400.2 to libgmodule-2.0.so.0.8400.3
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8400.2 to libgobject-2.0.so.0.8400.3
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8400.2 to libgthread-2.0.so.0.8400.3
  /usr/lib/libgio-2.0.so.0.8400.2 moved to /usr/lib/libgio-2.0.so.0.8400.3
  /usr/lib/libgirepository-2.0.so.0.8400.2 moved to /usr/lib/libgirepository-2.0.so.0.8400.3
  /usr/lib/libglib-2.0.so.0.8400.2 moved to /usr/lib/libglib-2.0.so.0.8400.3
  /usr/lib/libgmodule-2.0.so.0.8400.2 moved to /usr/lib/libgmodule-2.0.so.0.8400.3
  /usr/lib/libgobject-2.0.so.0.8400.2 moved to /usr/lib/libgobject-2.0.so.0.8400.3
  /usr/lib/libgthread-2.0.so.0.8400.2 moved to /usr/lib/libgthread-2.0.so.0.8400.3
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8400.2-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8400.3-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8400.3-gdb.py
packages/core2-64-poky-linux/glib-2.0/glib-2.0-bash-completion: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-bash-completion: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-codegen: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-codegen: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dbg: FILELIST: removed "/usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py /usr/lib/.debug/libgio-2.0.so.0.8400.2 /usr/lib/.debug/libglib-2.0.so.0.8400.2 /usr/lib/.debug/libgobject-2.0.so.0.8400.2 /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8400.2-gdb.py /usr/lib/.debug/libgthread-2.0.so.0.8400.2 /usr/lib/.debug/libgirepository-2.0.so.0.8400.2 /usr/lib/.debug/libgmodule-2.0.so.0.8400.2", added "/usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8400.3-gdb.py /usr/lib/.debug/libgio-2.0.so.0.8400.3 /usr/lib/.debug/libglib-2.0.so.0.8400.3 /usr/lib/.debug/libgobject-2.0.so.0.8400.3 /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8400.3-gdb.py /usr/lib/.debug/libgthread-2.0.so.0.8400.3 /usr/lib/.debug/libgirepository-2.0.so.0.8400.3 /usr/lib/.debug/libgmodule-2.0.so.0.8400.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dbg: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dbg: PKGSIZE changed from 31988978 to 31990794 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dbg: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dev: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dev: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-doc: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-doc: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ab: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ab: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-af: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-af: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-am: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-am: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-an: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-an: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ar: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ar: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-as: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-as: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ast: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ast: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-az: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-az: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-be+latin: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-be+latin: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-be: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-be: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bg: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bg: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bn-in: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bn-in: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bn: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bn: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bs: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bs: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ca+valencia: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ca+valencia: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ca: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ca: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-cs: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-cs: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-cy: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-cy: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-da: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-da: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-de: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-de: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-dz: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-dz: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-el: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-el: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en+shaw: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en+shaw: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en-ca: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en-ca: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-eo: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-eo: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-es: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-es: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-et: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-et: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-eu: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-eu: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fa: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fa: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fi: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fi: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fr: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fr: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fur: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fur: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ga: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ga: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gd: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gd: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gl: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gl: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gu: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gu: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-he: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-he: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hi: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hi: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hr: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hr: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hu: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hu: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hy: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hy: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-id: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-id: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ie: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ie: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-is: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-is: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-it: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-it: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ja: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ja: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ka: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ka: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kab: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kab: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kk: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kk: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kn: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kn: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ko: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ko: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ku: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ku: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-lt: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-lt: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-lv: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-lv: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mai: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mai: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mg: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mg: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mk: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mk: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ml: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ml: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mn: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mn: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mr: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mr: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ms: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ms: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nb: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nb: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nds: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nds: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ne: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ne: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nl: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nl: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nn: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nn: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-oc: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-oc: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-or: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-or: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pa: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pa: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pl: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pl: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ps: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ps: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pt: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pt: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ro: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ro: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ru: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ru: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-rw: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-rw: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-si: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-si: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sk: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sk: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sl: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sl: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sq: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sq: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr+ije: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr+ije: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sv: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sv: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ta: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ta: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-te: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-te: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tg: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tg: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-th: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-th: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tl: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tl: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tr: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tr: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tt: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tt: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ug: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ug: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-uk: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-uk: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-vi: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-vi: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-wa: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-wa: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-xh: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-xh: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-yi: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-yi: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-hk: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-hk: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-tw: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-tw: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-ptest: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-ptest: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-src: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-src: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-staticdev: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-staticdev: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-utils: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-utils: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libgobject-2.0.so.0.8400.2 /usr/lib/libgthread-2.0.so.0.8400.2 /usr/lib/libgio-2.0.so.0.8400.2 /usr/lib/libgmodule-2.0.so.0.8400.2 /usr/lib/libglib-2.0.so.0.8400.2 /usr/lib/libgirepository-2.0.so.0.8400.2", added "/usr/lib/libgobject-2.0.so.0.8400.3 /usr/lib/libgthread-2.0.so.0.8400.3 /usr/lib/libgio-2.0.so.0.8400.3 /usr/lib/libgmodule-2.0.so.0.8400.3 /usr/lib/libglib-2.0.so.0.8400.3 /usr/lib/libgirepository-2.0.so.0.8400.3"
packages/core2-64-poky-linux/glib-2.0/glib-2.0: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0: PV changed from "2.84.2" to "2.84.3"
packages/core2-64-poky-linux/glib-2.0: PKGV changed from 2.84.2 [default] to 2.84.3 [default]
packages/core2-64-poky-linux/glib-2.0: SRC_URI changed from "https://download.gnome.org/sources//glib/2.84/glib-2.84.2.tar.xz file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-on-clang-as-well.patch file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://skip-timeout.patch" to "https://download.gnome.org/sources//glib/2.84/glib-2.84.3.tar.xz file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-on-clang-as-well.patch file
 ://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://skip-timeout.patch"
packages/core2-64-poky-linux/glib-2.0: PV changed from "2.84.2" to "2.84.3"
Changes to packages/core2-64-poky-linux/glib-2.0 (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8400.2 to libgio-2.0.so.0.8400.3
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8400.2 to libgirepository-2.0.so.0.8400.3
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8400.2 to libglib-2.0.so.0.8400.3
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8400.2 to libgmodule-2.0.so.0.8400.3
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8400.2 to libgobject-2.0.so.0.8400.3
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8400.2 to libgthread-2.0.so.0.8400.3
  /usr/lib/libgio-2.0.so.0.8400.2 moved to /usr/lib/libgio-2.0.so.0.8400.3
  /usr/lib/libgirepository-2.0.so.0.8400.2 moved to /usr/lib/libgirepository-2.0.so.0.8400.3
  /usr/lib/libglib-2.0.so.0.8400.2 moved to /usr/lib/libglib-2.0.so.0.8400.3
  /usr/lib/libgmodule-2.0.so.0.8400.2 moved to /usr/lib/libgmodule-2.0.so.0.8400.3
  /usr/lib/libgobject-2.0.so.0.8400.2 moved to /usr/lib/libgobject-2.0.so.0.8400.3
  /usr/lib/libgthread-2.0.so.0.8400.2 moved to /usr/lib/libgthread-2.0.so.0.8400.3
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8400.2-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8400.3-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8400.3-gdb.py
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8400.2 to libgio-2.0.so.0.8400.3
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8400.2 to libgirepository-2.0.so.0.8400.3
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8400.2 to libglib-2.0.so.0.8400.3
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8400.2 to libgmodule-2.0.so.0.8400.3
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8400.2 to libgobject-2.0.so.0.8400.3
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8400.2 to libgthread-2.0.so.0.8400.3
  /usr/lib/libgio-2.0.so.0.8400.2 moved to /usr/lib/libgio-2.0.so.0.8400.3
  /usr/lib/libgirepository-2.0.so.0.8400.2 moved to /usr/lib/libgirepository-2.0.so.0.8400.3
  /usr/lib/libglib-2.0.so.0.8400.2 moved to /usr/lib/libglib-2.0.so.0.8400.3
  /usr/lib/libgmodule-2.0.so.0.8400.2 moved to /usr/lib/libgmodule-2.0.so.0.8400.3
  /usr/lib/libgobject-2.0.so.0.8400.2 moved to /usr/lib/libgobject-2.0.so.0.8400.3
  /usr/lib/libgthread-2.0.so.0.8400.2 moved to /usr/lib/libgthread-2.0.so.0.8400.3
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.3 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.3/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.3/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.3/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.2-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py was removed

--===============0827913057576582605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/glib-2.0-initial (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8400.2 to libgio-2.0.so.0.8400.3
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8400.2 to libgirepository-2.0.so.0.8400.3
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8400.2 to libglib-2.0.so.0.8400.3
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8400.2 to libgmodule-2.0.so.0.8400.3
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8400.2 to libgobject-2.0.so.0.8400.3
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8400.2 to libgthread-2.0.so.0.8400.3
  /usr/lib/libgio-2.0.so.0.8400.2 moved to /usr/lib/libgio-2.0.so.0.8400.3
  /usr/lib/libgirepository-2.0.so.0.8400.2 moved to /usr/lib/libgirepository-2.0.so.0.8400.3
  /usr/lib/libglib-2.0.so.0.8400.2 moved to /usr/lib/libglib-2.0.so.0.8400.3
  /usr/lib/libgmodule-2.0.so.0.8400.2 moved to /usr/lib/libgmodule-2.0.so.0.8400.3
  /usr/lib/libgobject-2.0.so.0.8400.2 moved to /usr/lib/libgobject-2.0.so.0.8400.3
  /usr/lib/libgthread-2.0.so.0.8400.2 moved to /usr/lib/libgthread-2.0.so.0.8400.3
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8400.2-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8400.3-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8400.3-gdb.py
packages/core2-64-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libgmodule-2.0.so.0.8400.2 /usr/lib/libglib-2.0.so.0.8400.2 /usr/lib/libgobject-2.0.so.0.8400.2 /usr/lib/libgthread-2.0.so.0.8400.2 /usr/lib/libgirepository-2.0.so.0.8400.2 /usr/lib/libgio-2.0.so.0.8400.2", added "/usr/lib/libgmodule-2.0.so.0.8400.3 /usr/lib/libglib-2.0.so.0.8400.3 /usr/lib/libgthread-2.0.so.0.8400.3 /usr/lib/libgobject-2.0.so.0.8400.3 /usr/lib/libgirepository-2.0.so.0.8400.3 /usr/lib/libgio-2.0.so.0.8400.3"
Changes to packages/core2-64-poky-linux/glib-2.0 (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8400.2 to libgio-2.0.so.0.8400.3
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8400.2 to libgirepository-2.0.so.0.8400.3
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8400.2 to libglib-2.0.so.0.8400.3
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8400.2 to libgmodule-2.0.so.0.8400.3
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8400.2 to libgobject-2.0.so.0.8400.3
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8400.2 to libgthread-2.0.so.0.8400.3
  /usr/lib/libgio-2.0.so.0.8400.2 moved to /usr/lib/libgio-2.0.so.0.8400.3
  /usr/lib/libgirepository-2.0.so.0.8400.2 moved to /usr/lib/libgirepository-2.0.so.0.8400.3
  /usr/lib/libglib-2.0.so.0.8400.2 moved to /usr/lib/libglib-2.0.so.0.8400.3
  /usr/lib/libgmodule-2.0.so.0.8400.2 moved to /usr/lib/libgmodule-2.0.so.0.8400.3
  /usr/lib/libgobject-2.0.so.0.8400.2 moved to /usr/lib/libgobject-2.0.so.0.8400.3
  /usr/lib/libgthread-2.0.so.0.8400.2 moved to /usr/lib/libgthread-2.0.so.0.8400.3
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8400.2-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8400.3-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8400.3-gdb.py
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8400.2 to libgio-2.0.so.0.8400.3
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8400.2 to libgirepository-2.0.so.0.8400.3
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8400.2 to libglib-2.0.so.0.8400.3
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8400.2 to libgmodule-2.0.so.0.8400.3
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8400.2 to libgobject-2.0.so.0.8400.3
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8400.2 to libgthread-2.0.so.0.8400.3
  /usr/lib/libgio-2.0.so.0.8400.2 moved to /usr/lib/libgio-2.0.so.0.8400.3
  /usr/lib/libgirepository-2.0.so.0.8400.2 moved to /usr/lib/libgirepository-2.0.so.0.8400.3
  /usr/lib/libglib-2.0.so.0.8400.2 moved to /usr/lib/libglib-2.0.so.0.8400.3
  /usr/lib/libgmodule-2.0.so.0.8400.2 moved to /usr/lib/libgmodule-2.0.so.0.8400.3
  /usr/lib/libgobject-2.0.so.0.8400.2 moved to /usr/lib/libgobject-2.0.so.0.8400.3
  /usr/lib/libgthread-2.0.so.0.8400.2 moved to /usr/lib/libgthread-2.0.so.0.8400.3
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.3 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.3/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.3/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.3/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.2-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py was removed

--===============0827913057576582605==--

