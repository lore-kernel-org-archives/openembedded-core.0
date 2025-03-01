Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53066C3DA4A
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:17 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.7042.1740828314959565878
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=PBke3svW;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=21KAg3at;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019551740953-e60df1a5-7547-4417-bebb-bfd7a7b0e2f2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828314;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WtwcbVNwpqAoeFwhdDAtjtRXdR4s0pKB1hRxLPa0Rd8=;
	b=PBke3svW3q3cUItKDUPE70vaPpMaeJuAyQjMBZQMaqFfqZnrZ+EJ5seMXJIz8qGc
	UkU3ur0TBIGFSbpWkiX2X2suTGXAbFfUSEWiXtS5VKpRp/h9MM0CLzOKA5fSBwwzY1a
	X5cVyAP6uAhOdHTUFgo8kGrMZZ5pCz/IHwq6OXcA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828314;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WtwcbVNwpqAoeFwhdDAtjtRXdR4s0pKB1hRxLPa0Rd8=;
	b=21KAg3at4quZEKT2hzG+hY+rWMVbTb5Cd1ZBGGw52Xlo+e7o3SakrCVrPVxp9FLq
	9piyax3RzN4oRDF3E37kIx6EpfA0Couof8V6/ViMjHTmSSECXfNaLbUoWId9DfFVUEM
	UqONtwOtbTYoPvvsOw9GXuMcjsB/HKxWfnJHjjwQ=
Content-Type: multipart/mixed; boundary="===============7356507713799161960=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>, Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-2.0-initial,glib-2.0: upgrading to 2.82.5,2.82.5 SUCCEEDED
Message-ID: <0101019551740953-e60df1a5-7547-4417-bebb-bfd7a7b0e2f2-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212097

--===============7356507713799161960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *glib-2.0-initial,glib-2.0* to *2.82.5,2.82.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glib-2.0-initial-glib-2.0-upgrade-2.82.4-2.82.5-2.82.patch
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
From 6c1006417d6442e6e0a1beec5188a92d74108820 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 05:23:27 +0000
Subject: [PATCH] glib-2.0-initial,glib-2.0: upgrade 2.82.4 -> 2.82.5,2.82.4 ->
 2.82.5

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
 ...lib-2.0-initial_2.82.4.bb => glib-2.0-initial_2.82.5.bb} | 0
 .../glib-2.0/{glib-2.0_2.82.4.bb => glib-2.0_2.82.5.bb}     | 0
 meta/recipes-core/glib-2.0/glib.inc                         | 2 +-
 13 files changed, 15 insertions(+), 15 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.82.4.bb => glib-2.0-initial_2.82.5.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.82.4.bb => glib-2.0_2.82.5.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
index 4ef03f3157..c3176c75e5 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
@@ -1,4 +1,4 @@
-From 7e00964de0ae27f868726413e46f27145807a50d Mon Sep 17 00:00:00 2001
+From 9d12f41438e3f43be31055d15087ae17fe14e5cb Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not prefix executables with $bindir in pkg-config files
diff --git a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
index c1d55d87b6..a84e8a4aae 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
@@ -1,4 +1,4 @@
-From 979d3ddf77abfd00c1e2108cde4aef2d015257b0 Mon Sep 17 00:00:00 2001
+From 9744f423bacbd8fa08db47ff8ab7b246c0a60599 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
index 9599156eaf..56d10df7b4 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From 54f9e7fcbd6345846c379a47c20245259a83d42a Mon Sep 17 00:00:00 2001
+From 283906f5a5a18c2fb33a122ab07f4edc9b0d4186 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
diff --git a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
index e4c193cfbb..b89d4793d2 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From 1300572dfc8e488a3edaed8cb1f22fcf2303e452 Mon Sep 17 00:00:00 2001
+From 413817f0be3f242619d7bbbac8f746dcc941f98d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
index bf3fb93bea..281eac8f94 100644
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From ec777a7f17c28e72f7b0bdcec385656533c50cca Mon Sep 17 00:00:00 2001
+From ef00c0c8faf11ef91911980fb5ba18c8dd3a7752 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
index 9b26ea8e84..b38578f177 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
@@ -1,4 +1,4 @@
-From 8b8953adcd0071c39a78e6d2fd437ad0e149591d Mon Sep 17 00:00:00 2001
+From d5d9a39827de8d1988a91173d56b06eeb5b9acfe Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 5beb14d..963815f 100644
+index a998044..de99f19 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -2050,7 +2050,7 @@ atomicdefine = '''
+@@ -2051,7 +2051,7 @@ atomicdefine = '''
  # We know that we can always use real ("lock free") atomic operations with MSVC
  if cc.get_id() == 'msvc' or cc.get_id() == 'clang-cl' or cc.links(atomictest, name : 'atomic ops')
    have_atomic_lock_free = true
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
index 80f26b738a..4aa50a567a 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From 51d592900e8acdec4f043ceeb23e32d27dded8eb Mon Sep 17 00:00:00 2001
+From aced831c93ec94ddf6cc44a2c910f979ef99ceb9 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native glib
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 963815f..4d4a9f3 100644
+index de99f19..4dd62f6 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -1048,7 +1048,8 @@ if cc.links('''#include <sys/syscall.h>
+@@ -1049,7 +1049,8 @@ if cc.links('''#include <sys/syscall.h>
                   waitid (P_PIDFD, 0, &child_info, WEXITED | WNOHANG);
                   return 0;
                 }''', name : 'pidfd_open(2) system call')
diff --git a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
index 8184c9636c..12785a90af 100644
--- a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
@@ -1,4 +1,4 @@
-From cc02206c156cb99c441e56a51639cd5ca64efae9 Mon Sep 17 00:00:00 2001
+From 4f00ca24e3a098cbda23351c2d6550a09ef5bb0e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
diff --git a/meta/recipes-core/glib-2.0/files/relocate-modules.patch b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
index f4bee2f02e..e230b40c25 100644
--- a/meta/recipes-core/glib-2.0/files/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
@@ -1,4 +1,4 @@
-From afe2c1e5854102c0e75f9e70a6569c9f2b6360d8 Mon Sep 17 00:00:00 2001
+From a096e57ae67d2da3efdc6bedb01bacaf50791284 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/files/skip-timeout.patch b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
index e5f09a4e2d..b15de088c1 100644
--- a/meta/recipes-core/glib-2.0/files/skip-timeout.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
@@ -1,4 +1,4 @@
-From 7cd21568601b78720f92955f1e794ca4f11c225d Mon Sep 17 00:00:00 2001
+From 74db54d60b79eaf76d11cd5c308b10bd752ea079 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 28 Mar 2024 16:27:09 +0000
 Subject: [PATCH] Skip /timeout/rounding test
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.4.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.5.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.4.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.5.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.82.5.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.82.5.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 9d50a95c40..728caf7fc0 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -232,7 +232,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[sha256sum] = "37dd0877fe964cd15e9a2710b044a1830fb1bd93652a6d0cb6b8b2dff187c709"
+SRC_URI[sha256sum] = "05c2031f9bdf6b5aba7a06ca84f0b4aced28b19bf1b50c6ab25cc675277cbc3f"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.44.1


--===============7356507713799161960==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-2.0-initial-glib-2.0-upgrade-2.82.4-2.82.5-2.82.patch"

RnJvbSA2YzEwMDY0MTdkNjQ0MmU2ZTBhMWJlZWM1MTg4YTkyZDc0MTA4ODIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAwNToyMzoyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGds
aWItMi4wLWluaXRpYWwsZ2xpYi0yLjA6IHVwZ3JhZGUgMi44Mi40IC0+IDIuODIuNSwyLjgyLjQg
LT4KIDIuODIuNQoKLS0tCiAuLi4vMDAwMS1Eby1ub3Qtd3JpdGUtYmluZGlyLWludG8tcGtnLWNv
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
YXRjaCAgICAgICAgIHwgMiArLQogLi4ubGliLTIuMC1pbml0aWFsXzIuODIuNC5iYiA9PiBnbGli
LTIuMC1pbml0aWFsXzIuODIuNS5iYn0gfCAwCiAuLi4vZ2xpYi0yLjAve2dsaWItMi4wXzIuODIu
NC5iYiA9PiBnbGliLTIuMF8yLjgyLjUuYmJ9ICAgICB8IDAKIG1ldGEvcmVjaXBlcy1jb3JlL2ds
aWItMi4wL2dsaWIuaW5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogMTMgZmlsZXMg
Y2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWNvcmUvZ2xpYi0yLjAve2dsaWItMi4wLWluaXRpYWxfMi44Mi40LmJiID0+IGdsaWIt
Mi4wLWluaXRpYWxfMi44Mi41LmJifSAoMTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS9n
bGliLTIuMC97Z2xpYi0yLjBfMi44Mi40LmJiID0+IGdsaWItMi4wXzIuODIuNS5iYn0gKDEwMCUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1Eby1u
b3Qtd3JpdGUtYmluZGlyLWludG8tcGtnLWNvbmZpZy1maWxlcy5wYXRjaCBiL21ldGEvcmVjaXBl
cy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtRG8tbm90LXdyaXRlLWJpbmRpci1pbnRvLXBrZy1j
b25maWctZmlsZXMucGF0Y2gKaW5kZXggNGVmMDNmMzE1Ny4uYzMxNzZjNzVlNSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1Eby1ub3Qtd3JpdGUtYmlu
ZGlyLWludG8tcGtnLWNvbmZpZy1maWxlcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9n
bGliLTIuMC9maWxlcy8wMDAxLURvLW5vdC13cml0ZS1iaW5kaXItaW50by1wa2ctY29uZmlnLWZp
bGVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3ZTAwOTY0ZGUwYWUyN2Y4Njg3MjY0MTNl
NDZmMjcxNDU4MDdhNTBkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5ZDEyZjQxNDM4
ZTNmNDNiZTMxMDU1ZDE1MDg3YWUxN2ZlMTRlNWNiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBG
cmksIDE1IEZlYiAyMDE5IDExOjE3OjI3ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIERvIG5vdCBw
cmVmaXggZXhlY3V0YWJsZXMgd2l0aCAkYmluZGlyIGluIHBrZy1jb25maWcgZmlsZXMKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtRml4LURBVEFESVJO
QU1FLW9uLXVjbGliYy1MaW51eC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2Zp
bGVzLzAwMDEtRml4LURBVEFESVJOQU1FLW9uLXVjbGliYy1MaW51eC5wYXRjaAppbmRleCBjMWQ1
NWQ4N2I2Li5hODRlOGE0YWFlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIu
MC9maWxlcy8wMDAxLUZpeC1EQVRBRElSTkFNRS1vbi11Y2xpYmMtTGludXgucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1GaXgtREFUQURJUk5BTUUtb24t
dWNsaWJjLUxpbnV4LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5NzlkM2RkZjc3YWJmZDAw
YzFlMjEwOGNkZTRhZWYyZDAxNTI1N2IwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5
NzQ0ZjQyM2JhY2JkOGZhMDhkYjQ3ZmY4YWI3YjI0NmMwYTYwNTk5IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFNhdCwg
MTUgTWFyIDIwMTQgMjI6NDI6MjkgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gRml4IERBVEFESVJO
QU1FIG9uIHVjbGliYy9MaW51eApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0y
LjAvZmlsZXMvMDAwMS1JbnN0YWxsLWdpby1xdWVyeW1vZHVsZXMtYXMtbGliZXhlY19QUk9HUkFN
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1JbnN0YWxsLWdp
by1xdWVyeW1vZHVsZXMtYXMtbGliZXhlY19QUk9HUkFNLnBhdGNoCmluZGV4IDk1OTkxNTZlYWYu
LjU2ZDEwZGY3YjQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVz
LzAwMDEtSW5zdGFsbC1naW8tcXVlcnltb2R1bGVzLWFzLWxpYmV4ZWNfUFJPR1JBTS5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLUluc3RhbGwtZ2lvLXF1
ZXJ5bW9kdWxlcy1hcy1saWJleGVjX1BST0dSQU0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IDU0ZjllN2ZjYmQ2MzQ1ODQ2YzM3OWE0N2MyMDI0NTI1OWE4M2Q0MmEgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDI4MzkwNmY1YTVhMThjMmZiMzNhMTIyYWIwN2Y0ZWRjOWIwZDQxODYg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKdXNzaSBLdWtrb25lbiA8anVzc2kua3Vr
a29uZW5AaW50ZWwuY29tPgogRGF0ZTogVHVlLCAyMiBNYXIgMjAxNiAxNToxNDo1OCArMDIwMAog
U3ViamVjdDogW1BBVENIXSBJbnN0YWxsIGdpby1xdWVyeW1vZHVsZXMgYXMgbGliZXhlY19QUk9H
UkFNCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLVJl
bW92ZS10aGUtd2FybmluZy1hYm91dC1kZXByZWNhdGVkLXBhdGhzLWluLXNjaGVtYXMucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLVJlbW92ZS10aGUtd2Fybmlu
Zy1hYm91dC1kZXByZWNhdGVkLXBhdGhzLWluLXNjaGVtYXMucGF0Y2gKaW5kZXggZTRjMTkzY2Zi
Yi4uYjg5ZDQ3OTNkMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmls
ZXMvMDAwMS1SZW1vdmUtdGhlLXdhcm5pbmctYWJvdXQtZGVwcmVjYXRlZC1wYXRocy1pbi1zY2hl
bWFzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtUmVt
b3ZlLXRoZS13YXJuaW5nLWFib3V0LWRlcHJlY2F0ZWQtcGF0aHMtaW4tc2NoZW1hcy5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gMTMwMDU3MmRmYzhlNDg4YTNlZGFlZDhjYjFmMjJmY2YyMzAz
ZTQ1MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNDEzODE3ZjBiZTNmMjQyNjE5ZDdi
YmJhYzhmNzQ2ZGNjOTQxZjk4ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhh
bmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogRnJpLCAxMiBKdW4g
MjAxNSAxNzowODo0NiArMDMwMAogU3ViamVjdDogW1BBVENIXSBSZW1vdmUgdGhlIHdhcm5pbmcg
YWJvdXQgZGVwcmVjYXRlZCBwYXRocyBpbiBzY2hlbWFzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLWdpby10ZXN0cy1yZXNvdXJjZXMuYy1jb21tZW50
LW91dC1hLWJ1aWxkLWhvc3Qtb25seS0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIu
MC9maWxlcy8wMDAxLWdpby10ZXN0cy1yZXNvdXJjZXMuYy1jb21tZW50LW91dC1hLWJ1aWxkLWhv
c3Qtb25seS0ucGF0Y2gKaW5kZXggYmYzZmI5M2JlYS4uMjgxZWFjOGY5NCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1naW8tdGVzdHMtcmVzb3VyY2Vz
LmMtY29tbWVudC1vdXQtYS1idWlsZC1ob3N0LW9ubHktLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtZ2lvLXRlc3RzLXJlc291cmNlcy5jLWNvbW1lbnQt
b3V0LWEtYnVpbGQtaG9zdC1vbmx5LS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZWM3Nzdh
N2YxN2MyOGU3MmY3YjBiZGNlYzM4NTY1NjUzM2M1MGNjYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gZWYwMGMwYzhmYWYxMWVmOTE5MTE5ODBmYjViYTE4YzhkZDNhNzc1MiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5A
Z21haWwuY29tPgogRGF0ZTogV2VkLCA4IEphbiAyMDIwIDE4OjIyOjQ2ICswMTAwCiBTdWJqZWN0
OiBbUEFUQ0hdIGdpby90ZXN0cy9yZXNvdXJjZXMuYzogY29tbWVudCBvdXQgYSBidWlsZCBob3N0
LW9ubHkgdGVzdApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMv
MDAwMS1tZXNvbi1SdW4tYXRvbWljcy10ZXN0LW9uLWNsYW5nLWFzLXdlbGwucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLW1lc29uLVJ1bi1hdG9taWNzLXRlc3Qt
b24tY2xhbmctYXMtd2VsbC5wYXRjaAppbmRleCA5YjI2ZWE4ZTg0Li5iMzg1NzhmMTc3IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDAxLW1lc29uLVJ1bi1h
dG9taWNzLXRlc3Qtb24tY2xhbmctYXMtd2VsbC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29y
ZS9nbGliLTIuMC9maWxlcy8wMDAxLW1lc29uLVJ1bi1hdG9taWNzLXRlc3Qtb24tY2xhbmctYXMt
d2VsbC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOGI4OTUzYWRjZDAwNzFjMzlhNzhlNmQy
ZmQ0MzdhZDBlMTQ5NTkxZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZDVkOWEzOTgy
N2RlOGQxOTg4YTkxMTczZDU2YjA2ZWViNWI5YWNmZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBTYXQsIDEyIE9jdCAy
MDE5IDE3OjQ2OjI2IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIG1lc29uOiBSdW4gYXRvbWljcyB0
ZXN0IG9uIGNsYW5nIGFzIHdlbGwKQEAgLTE0LDEwICsxNCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBL
aGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5i
dWlsZAotaW5kZXggNWJlYjE0ZC4uOTYzODE1ZiAxMDA2NDQKK2luZGV4IGE5OTgwNDQuLmRlOTlm
MTkgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIvbWVzb24uYnVpbGQKLUBAIC0yMDUw
LDcgKzIwNTAsNyBAQCBhdG9taWNkZWZpbmUgPSAnJycKK0BAIC0yMDUxLDcgKzIwNTEsNyBAQCBh
dG9taWNkZWZpbmUgPSAnJycKICAjIFdlIGtub3cgdGhhdCB3ZSBjYW4gYWx3YXlzIHVzZSByZWFs
ICgibG9jayBmcmVlIikgYXRvbWljIG9wZXJhdGlvbnMgd2l0aCBNU1ZDCiAgaWYgY2MuZ2V0X2lk
KCkgPT0gJ21zdmMnIG9yIGNjLmdldF9pZCgpID09ICdjbGFuZy1jbCcgb3IgY2MubGlua3MoYXRv
bWljdGVzdCwgbmFtZSA6ICdhdG9taWMgb3BzJykKICAgIGhhdmVfYXRvbWljX2xvY2tfZnJlZSA9
IHRydWUKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEt
bWVzb24uYnVpbGQtZG8tbm90LWVuYWJsZS1waWRmZC1mZWF0dXJlcy1vbi1uYXRpdmUtZy5wYXRj
aCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzLzAwMDEtbWVzb24uYnVpbGQtZG8t
bm90LWVuYWJsZS1waWRmZC1mZWF0dXJlcy1vbi1uYXRpdmUtZy5wYXRjaAppbmRleCA4MGYyNmI3
MzhhLi40YWE1MGE1NjdhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9m
aWxlcy8wMDAxLW1lc29uLmJ1aWxkLWRvLW5vdC1lbmFibGUtcGlkZmQtZmVhdHVyZXMtb24tbmF0
aXZlLWcucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAwMS1t
ZXNvbi5idWlsZC1kby1ub3QtZW5hYmxlLXBpZGZkLWZlYXR1cmVzLW9uLW5hdGl2ZS1nLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1MWQ1OTI5MDBlOGFjZGVjNGYwNDNjZWViMjNlMzJkMjdk
ZGVkOGViIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhY2VkODMxYzkzZWM5NGRkZjZj
YzQ0YTJjOTEwZjk3OWVmOTljZWI5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxl
eGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KIERhdGU6IFNhdCwgMTYgU2VwIDIw
MjMgMjI6Mjg6MjcgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gbWVzb24uYnVpbGQ6IGRvIG5vdCBl
bmFibGUgcGlkZmQgZmVhdHVyZXMgb24gbmF0aXZlIGdsaWIKQEAgLTE0LDEwICsxNCwxMCBAQCBT
aWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdp
dCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKLWluZGV4IDk2MzgxNWYuLjRkNGE5ZjMgMTAw
NjQ0CitpbmRleCBkZTk5ZjE5Li40ZGQ2MmY2IDEwMDY0NAogLS0tIGEvbWVzb24uYnVpbGQKICsr
KyBiL21lc29uLmJ1aWxkCi1AQCAtMTA0OCw3ICsxMDQ4LDggQEAgaWYgY2MubGlua3MoJycnI2lu
Y2x1ZGUgPHN5cy9zeXNjYWxsLmg+CitAQCAtMTA0OSw3ICsxMDQ5LDggQEAgaWYgY2MubGlua3Mo
JycnI2luY2x1ZGUgPHN5cy9zeXNjYWxsLmg+CiAgICAgICAgICAgICAgICAgICB3YWl0aWQgKFBf
UElERkQsIDAsICZjaGlsZF9pbmZvLCBXRVhJVEVEIHwgV05PSEFORyk7CiAgICAgICAgICAgICAg
ICAgICByZXR1cm4gMDsKICAgICAgICAgICAgICAgICB9JycnLCBuYW1lIDogJ3BpZGZkX29wZW4o
Mikgc3lzdGVtIGNhbGwnKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAv
ZmlsZXMvMDAxMC1Eby1ub3QtaGFyZGNvZGUtcHl0aG9uLXBhdGgtaW50by12YXJpb3VzLXRvb2xz
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZmlsZXMvMDAxMC1Eby1ub3QtaGFy
ZGNvZGUtcHl0aG9uLXBhdGgtaW50by12YXJpb3VzLXRvb2xzLnBhdGNoCmluZGV4IDgxODRjOTYz
NmMuLjEyNzg1YTkwYWYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2Zp
bGVzLzAwMTAtRG8tbm90LWhhcmRjb2RlLXB5dGhvbi1wYXRoLWludG8tdmFyaW91cy10b29scy5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy8wMDEwLURvLW5vdC1o
YXJkY29kZS1weXRob24tcGF0aC1pbnRvLXZhcmlvdXMtdG9vbHMucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIGNjMDIyMDZjMTU2Y2I5OWM0NDFlNTZhNTE2MzljZDVjYTY0ZWZhZTkgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDRmMDBjYTI0ZTNhMDk4Y2JkYTIzMzUxYzJkNjU1MGEw
OWVmNWJiMGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZp
biA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFR1ZSwgMyBPY3QgMjAxNyAxMDo0NTo1
NSArMDMwMAogU3ViamVjdDogW1BBVENIXSBEbyBub3QgaGFyZGNvZGUgcHl0aG9uIHBhdGggaW50
byB2YXJpb3VzIHRvb2xzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9m
aWxlcy9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAv
ZmlsZXMvcmVsb2NhdGUtbW9kdWxlcy5wYXRjaAppbmRleCBmNGJlZTJmMDJlLi5lMjMwYjQwYzI1
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9yZWxvY2F0ZS1t
b2R1bGVzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ZpbGVzL3JlbG9j
YXRlLW1vZHVsZXMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGFmZTJjMWU1ODU0MTAyYzBl
NzVmOWU3MGE2NTY5YzlmMmI2MzYwZDggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGEw
OTZlNTdhZTY3ZDJkYTNlZmRjNmJlZGIwMWJhY2FmNTA3OTEyODQgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AaW50ZWwuY29tPgogRGF0ZTog
RnJpLCAxMSBNYXIgMjAxNiAxNTozNTo1NSArMDAwMAogU3ViamVjdDogW1BBVENIXSBnbGliLTIu
MDogcmVsb2NhdGUgdGhlIEdJTyBtb2R1bGUgZGlyZWN0b3J5IGZvciBuYXRpdmUgYnVpbGRzCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9za2lwLXRpbWVvdXQu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9maWxlcy9za2lwLXRpbWVvdXQucGF0
Y2gKaW5kZXggZTVmMDlhNGUyZC4uYjE1ZGUwODhjMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWNvcmUvZ2xpYi0yLjAvZmlsZXMvc2tpcC10aW1lb3V0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1jb3JlL2dsaWItMi4wL2ZpbGVzL3NraXAtdGltZW91dC5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gN2NkMjE1Njg2MDFiNzg3MjBmOTI5NTVmMWU3OTRjYTRmMTFjMjI1ZCBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gNzRkYjU0ZDYwYjc5ZWFmNzZkMTFjZDVjMzA4YjEwYmQ3NTJl
YTA3OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1
cnRvbkBhcm0uY29tPgogRGF0ZTogVGh1LCAyOCBNYXIgMjAyNCAxNjoyNzowOSArMDAwMAogU3Vi
amVjdDogW1BBVENIXSBTa2lwIC90aW1lb3V0L3JvdW5kaW5nIHRlc3QKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLWluaXRpYWxfMi44Mi40LmJiIGIvbWV0
YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAtaW5pdGlhbF8yLjgyLjUuYmIKc2ltaWxh
cml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ds
aWItMi4wLWluaXRpYWxfMi44Mi40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9nbGli
LTIuMC9nbGliLTIuMC1pbml0aWFsXzIuODIuNS5iYgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjBfMi44Mi40LmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xp
Yi0yLjAvZ2xpYi0yLjBfMi44Mi41LmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMF8yLjgyLjQuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wXzIuODIuNS5iYgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi5pbmMgYi9tZXRhL3JlY2lwZXMtY29y
ZS9nbGliLTIuMC9nbGliLmluYwppbmRleCA5ZDUwYTk1YzQwLi43MjhjYWY3ZmMwIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLmluYworKysgYi9tZXRhL3JlY2lw
ZXMtY29yZS9nbGliLTIuMC9nbGliLmluYwpAQCAtMjMyLDcgKzIzMiw3IEBAIFNSQ19VUkk6YXBw
ZW5kOmNsYXNzLW5hdGl2ZSA9ICIgZmlsZTovL3JlbG9jYXRlLW1vZHVsZXMucGF0Y2ggXAogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmaWxlOi8vMDAwMS1tZXNvbi5idWlsZC1kby1u
b3QtZW5hYmxlLXBpZGZkLWZlYXR1cmVzLW9uLW5hdGl2ZS1nLnBhdGNoIFwKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM3ZGQwODc3ZmU5
NjRjZDE1ZTlhMjcxMGIwNDRhMTgzMGZiMWJkOTM2NTJhNmQwY2I2YjhiMmRmZjE4N2M3MDkiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiMDVjMjAzMWY5YmRmNmI1YWJhN2EwNmNhODRmMGI0YWNlZDI4
YjE5YmYxYjUwYzZhYjI1Y2M2NzUyNzdjYmMzZiIKIAogIyBGaW5kIGFueSBtZXNvbiBjcm9zcyBm
aWxlcyBpbiBGSUxFU1BBVEggdGhhdCBhcmUgcmVsZXZhbnQgZm9yIHRoZSBjdXJyZW50CiAjIGJ1
aWxkICh1c2luZyBzaXRlaW5mbykgYW5kIGFkZCB0aGVtIHRvIEVYVFJBX09FTUVTT04uCi0tIAoy
LjQ0LjEKCg==

--===============7356507713799161960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

Changes to packages/core2-64-poky-linux/glib-2.0-initial (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8200.4 to libgio-2.0.so.0.8200.5
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8200.4 to libgirepository-2.0.so.0.8200.5
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8200.4 to libglib-2.0.so.0.8200.5
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8200.4 to libgmodule-2.0.so.0.8200.5
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8200.4 to libgobject-2.0.so.0.8200.5
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8200.4 to libgthread-2.0.so.0.8200.5
  /usr/lib/libgio-2.0.so.0.8200.4 moved to /usr/lib/libgio-2.0.so.0.8200.5
  /usr/lib/libgirepository-2.0.so.0.8200.4 moved to /usr/lib/libgirepository-2.0.so.0.8200.5
  /usr/lib/libglib-2.0.so.0.8200.4 moved to /usr/lib/libglib-2.0.so.0.8200.5
  /usr/lib/libgmodule-2.0.so.0.8200.4 moved to /usr/lib/libgmodule-2.0.so.0.8200.5
  /usr/lib/libgobject-2.0.so.0.8200.4 moved to /usr/lib/libgobject-2.0.so.0.8200.5
  /usr/lib/libgthread-2.0.so.0.8200.4 moved to /usr/lib/libgthread-2.0.so.0.8200.5
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8200.4-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8200.5-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8200.4-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8200.5-gdb.py
packages/core2-64-poky-linux/glib-2.0/glib-2.0-bash-completion: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-bash-completion: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-codegen: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-codegen: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dbg: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dbg: PKGSIZE changed from 31965874 to 31967722 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dbg: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dbg: FILELIST: removed "/usr/lib/.debug/libgthread-2.0.so.0.8200.4 /usr/lib/.debug/libgio-2.0.so.0.8200.4 /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8200.4-gdb.py /usr/lib/.debug/libgmodule-2.0.so.0.8200.4 /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8200.4-gdb.py /usr/lib/.debug/libgirepository-2.0.so.0.8200.4 /usr/lib/.debug/libglib-2.0.so.0.8200.4 /usr/lib/.debug/libgobject-2.0.so.0.8200.4", added "/usr/lib/.debug/libgthread-2.0.so.0.8200.5 /usr/lib/.debug/libgio-2.0.so.0.8200.5 /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8200.5-gdb.py /usr/lib/.debug/libgmodule-2.0.so.0.8200.5 /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8200.5-gdb.py /usr/lib/.debug/libgirepository-2.0.so.0.8200.5 /usr/lib/.debug/libglib-2.0.so.0.8200.5 /usr/lib/.debug/libgobject-2.0.so.0.8200.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dev: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-dev: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-doc: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-doc: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ab: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ab: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-af: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-af: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-am: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-am: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-an: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-an: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ar: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ar: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-as: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-as: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ast: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ast: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-az: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-az: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-be+latin: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-be+latin: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-be: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-be: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bg: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bg: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bn-in: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bn-in: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bn: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bn: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bs: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-bs: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ca+valencia: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ca+valencia: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ca: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ca: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-cs: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-cs: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-cy: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-cy: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-da: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-da: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-de: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-de: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-dz: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-dz: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-el: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-el: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en+shaw: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en+shaw: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en-ca: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en-ca: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-eo: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-eo: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-es: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-es: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-et: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-et: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-eu: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-eu: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fa: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fa: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fi: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fi: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fr: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fr: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fur: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-fur: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ga: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ga: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gd: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gd: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gl: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gl: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gu: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-gu: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-he: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-he: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hi: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hi: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hr: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hr: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hu: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hu: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hy: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-hy: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-id: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-id: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ie: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ie: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-is: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-is: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-it: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-it: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ja: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ja: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ka: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ka: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kab: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kab: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kk: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kk: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kn: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-kn: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ko: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ko: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ku: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ku: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-lt: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-lt: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-lv: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-lv: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mai: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mai: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mg: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mg: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mk: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mk: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ml: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ml: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mn: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mn: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mr: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-mr: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ms: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ms: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nb: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nb: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nds: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nds: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ne: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ne: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nl: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nl: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nn: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-nn: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-oc: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-oc: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-or: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-or: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pa: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pa: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pl: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pl: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ps: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ps: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pt: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-pt: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ro: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ro: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ru: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ru: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-rw: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-rw: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-si: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-si: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sk: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sk: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sl: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sl: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sq: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sq: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr+ije: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr+ije: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sr: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sv: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-sv: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ta: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ta: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-te: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-te: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tg: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tg: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-th: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-th: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tl: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tl: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tr: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tr: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tt: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-tt: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ug: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-ug: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-uk: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-uk: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-vi: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-vi: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-wa: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-wa: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-xh: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-xh: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-yi: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-yi: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-hk: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-hk: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-tw: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-locale-zh-tw: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-ptest: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-ptest: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-src: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-src: PKGSIZE changed from 25119485 to 25120619 (+0%)
packages/core2-64-poky-linux/glib-2.0/glib-2.0-src: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-staticdev: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-staticdev: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0-utils: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0-utils: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0/glib-2.0: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
packages/core2-64-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libgthread-2.0.so.0.8200.4 /usr/lib/libgobject-2.0.so.0.8200.4 /usr/lib/libglib-2.0.so.0.8200.4 /usr/lib/libgio-2.0.so.0.8200.4 /usr/lib/libgmodule-2.0.so.0.8200.4 /usr/lib/libgirepository-2.0.so.0.8200.4", added "/usr/lib/libgobject-2.0.so.0.8200.5 /usr/lib/libgthread-2.0.so.0.8200.5 /usr/lib/libglib-2.0.so.0.8200.5 /usr/lib/libgio-2.0.so.0.8200.5 /usr/lib/libgirepository-2.0.so.0.8200.5 /usr/lib/libgmodule-2.0.so.0.8200.5"
packages/core2-64-poky-linux/glib-2.0: PV changed from "2.82.4" to "2.82.5"
packages/core2-64-poky-linux/glib-2.0: SRC_URI changed from "https://download.gnome.org/sources//glib/2.82/glib-2.82.4.tar.xz file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-on-clang-as-well.patch file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://skip-timeout.patch" to "https://download.gnome.org/sources//glib/2.82/glib-2.82.5.tar.xz file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-on-clang-as-well.patch file
 ://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://skip-timeout.patch"
packages/core2-64-poky-linux/glib-2.0: PKGV changed from 2.82.4 [default] to 2.82.5 [default]
Changes to packages/core2-64-poky-linux/glib-2.0 (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8200.4 to libgio-2.0.so.0.8200.5
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8200.4 to libgirepository-2.0.so.0.8200.5
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8200.4 to libglib-2.0.so.0.8200.5
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8200.4 to libgmodule-2.0.so.0.8200.5
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8200.4 to libgobject-2.0.so.0.8200.5
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8200.4 to libgthread-2.0.so.0.8200.5
  /usr/lib/libgio-2.0.so.0.8200.4 moved to /usr/lib/libgio-2.0.so.0.8200.5
  /usr/lib/libgirepository-2.0.so.0.8200.4 moved to /usr/lib/libgirepository-2.0.so.0.8200.5
  /usr/lib/libglib-2.0.so.0.8200.4 moved to /usr/lib/libglib-2.0.so.0.8200.5
  /usr/lib/libgmodule-2.0.so.0.8200.4 moved to /usr/lib/libgmodule-2.0.so.0.8200.5
  /usr/lib/libgobject-2.0.so.0.8200.4 moved to /usr/lib/libgobject-2.0.so.0.8200.5
  /usr/lib/libgthread-2.0.so.0.8200.4 moved to /usr/lib/libgthread-2.0.so.0.8200.5
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8200.4-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8200.5-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8200.4-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8200.5-gdb.py
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8200.4 to libgio-2.0.so.0.8200.5
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8200.4 to libgirepository-2.0.so.0.8200.5
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8200.4 to libglib-2.0.so.0.8200.5
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8200.4 to libgmodule-2.0.so.0.8200.5
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8200.4 to libgobject-2.0.so.0.8200.5
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8200.4 to libgthread-2.0.so.0.8200.5
  /usr/lib/libgio-2.0.so.0.8200.4 moved to /usr/lib/libgio-2.0.so.0.8200.5
  /usr/lib/libgirepository-2.0.so.0.8200.4 moved to /usr/lib/libgirepository-2.0.so.0.8200.5
  /usr/lib/libglib-2.0.so.0.8200.4 moved to /usr/lib/libglib-2.0.so.0.8200.5
  /usr/lib/libgmodule-2.0.so.0.8200.4 moved to /usr/lib/libgmodule-2.0.so.0.8200.5
  /usr/lib/libgobject-2.0.so.0.8200.4 moved to /usr/lib/libgobject-2.0.so.0.8200.5
  /usr/lib/libgthread-2.0.so.0.8200.4 moved to /usr/lib/libgthread-2.0.so.0.8200.5
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.5 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.5/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.5/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.5/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.5/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8200.5-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.5/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8200.5-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8200.4-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8200.4-gdb.py was removed

--===============7356507713799161960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/glib-2.0-initial (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8200.4 to libgio-2.0.so.0.8200.5
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8200.4 to libgirepository-2.0.so.0.8200.5
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8200.4 to libglib-2.0.so.0.8200.5
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8200.4 to libgmodule-2.0.so.0.8200.5
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8200.4 to libgobject-2.0.so.0.8200.5
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8200.4 to libgthread-2.0.so.0.8200.5
  /usr/lib/libgio-2.0.so.0.8200.4 moved to /usr/lib/libgio-2.0.so.0.8200.5
  /usr/lib/libgirepository-2.0.so.0.8200.4 moved to /usr/lib/libgirepository-2.0.so.0.8200.5
  /usr/lib/libglib-2.0.so.0.8200.4 moved to /usr/lib/libglib-2.0.so.0.8200.5
  /usr/lib/libgmodule-2.0.so.0.8200.4 moved to /usr/lib/libgmodule-2.0.so.0.8200.5
  /usr/lib/libgobject-2.0.so.0.8200.4 moved to /usr/lib/libgobject-2.0.so.0.8200.5
  /usr/lib/libgthread-2.0.so.0.8200.4 moved to /usr/lib/libgthread-2.0.so.0.8200.5
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8200.4-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8200.5-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8200.4-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8200.5-gdb.py
packages/core2-64-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libgirepository-2.0.so.0.8200.4 /usr/lib/libgthread-2.0.so.0.8200.4 /usr/lib/libgio-2.0.so.0.8200.4 /usr/lib/libgmodule-2.0.so.0.8200.4 /usr/lib/libglib-2.0.so.0.8200.4 /usr/lib/libgobject-2.0.so.0.8200.4", added "/usr/lib/libgirepository-2.0.so.0.8200.5 /usr/lib/libgthread-2.0.so.0.8200.5 /usr/lib/libgio-2.0.so.0.8200.5 /usr/lib/libgmodule-2.0.so.0.8200.5 /usr/lib/libglib-2.0.so.0.8200.5 /usr/lib/libgobject-2.0.so.0.8200.5"
Changes to packages/core2-64-poky-linux/glib-2.0 (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8200.4 to libgio-2.0.so.0.8200.5
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8200.4 to libgirepository-2.0.so.0.8200.5
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8200.4 to libglib-2.0.so.0.8200.5
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8200.4 to libgmodule-2.0.so.0.8200.5
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8200.4 to libgobject-2.0.so.0.8200.5
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8200.4 to libgthread-2.0.so.0.8200.5
  /usr/lib/libgio-2.0.so.0.8200.4 moved to /usr/lib/libgio-2.0.so.0.8200.5
  /usr/lib/libgirepository-2.0.so.0.8200.4 moved to /usr/lib/libgirepository-2.0.so.0.8200.5
  /usr/lib/libglib-2.0.so.0.8200.4 moved to /usr/lib/libglib-2.0.so.0.8200.5
  /usr/lib/libgmodule-2.0.so.0.8200.4 moved to /usr/lib/libgmodule-2.0.so.0.8200.5
  /usr/lib/libgobject-2.0.so.0.8200.4 moved to /usr/lib/libgobject-2.0.so.0.8200.5
  /usr/lib/libgthread-2.0.so.0.8200.4 moved to /usr/lib/libgthread-2.0.so.0.8200.5
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8200.4-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8200.5-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8200.4-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8200.5-gdb.py
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8200.4 to libgio-2.0.so.0.8200.5
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8200.4 to libgirepository-2.0.so.0.8200.5
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8200.4 to libglib-2.0.so.0.8200.5
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8200.4 to libgmodule-2.0.so.0.8200.5
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8200.4 to libgobject-2.0.so.0.8200.5
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8200.4 to libgthread-2.0.so.0.8200.5
  /usr/lib/libgio-2.0.so.0.8200.4 moved to /usr/lib/libgio-2.0.so.0.8200.5
  /usr/lib/libgirepository-2.0.so.0.8200.4 moved to /usr/lib/libgirepository-2.0.so.0.8200.5
  /usr/lib/libglib-2.0.so.0.8200.4 moved to /usr/lib/libglib-2.0.so.0.8200.5
  /usr/lib/libgmodule-2.0.so.0.8200.4 moved to /usr/lib/libgmodule-2.0.so.0.8200.5
  /usr/lib/libgobject-2.0.so.0.8200.4 moved to /usr/lib/libgobject-2.0.so.0.8200.5
  /usr/lib/libgthread-2.0.so.0.8200.4 moved to /usr/lib/libgthread-2.0.so.0.8200.5
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.5 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.5/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.5/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.5/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.5/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8200.5-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.5/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8200.5-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8200.4-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.82.4/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8200.4-gdb.py was removed

--===============7356507713799161960==--

