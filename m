Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA50C54ED4
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:21 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.2091.1706810404660546641
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SZPeOUrq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=lCM/gNl9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018d65d3eb90-9dae0fe7-110b-4c08-9662-545bb8b3b5c9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810404;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=q9W/myQ6NBAxzkRYRHBbrnLe0H5zjX96tKGtyWSz/9c=;
	b=SZPeOUrqOS/T3MB5u7jp0fIozPMRLMHyJ4pYrD3DFlZBRNctw/2WaH/YIV0BKQNk
	zHi73c82u/vrF91v3+7CU3X6Ij+gGwnfQEsHCGCT2PD6e1DkjlEKVTwJz7FS3S69vft
	OHGmzGpSWIH4mmyiGCujOIt0Sk6FZETyvZCDX99U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810404;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=q9W/myQ6NBAxzkRYRHBbrnLe0H5zjX96tKGtyWSz/9c=;
	b=lCM/gNl9kAidwhrjHOuNYZzInKR/EWLjy6nysI/1rT0ZNCW/DrOdOz8t1dw0hwqo
	0SeYKF4LEbqmVC3rF1YyYWdqi0vsrvvWWA2JbDUVCRr4ISofKI6wL8LpalLen51wOaJ
	2hzJF9kEDmiRW7RWe9y89Yq8N7av8IYUueaJD0Nk=
Content-Type: multipart/mixed; boundary="===============2246010901949626919=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-2.0: upgrading to 2.78.4 FAILED
Message-ID: <0101018d65d3eb90-9dae0fe7-110b-4c08-9662-545bb8b3b5c9-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194603

--===============2246010901949626919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glib-2.0* to *2.78.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-glib-2.0-upgrade-2.78.3-2.78.4.patch
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
From acfe2e96e5a79ab4b0a834f197c641fe807ddb52 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 05:37:48 +0000
Subject: [PATCH] glib-2.0: upgrade 2.78.3 -> 2.78.4

---
 ...t-write-bindir-into-pkg-config-files.patch |  2 +-
 ...0001-Fix-DATADIRNAME-on-uclibc-Linux.patch |  2 +-
 ...-gio-querymodules-as-libexec_PROGRAM.patch |  2 +-
 ...ng-about-deprecated-paths-in-schemas.patch |  2 +-
 ...-correctly-when-building-with-mingw3.patch |  4 ++--
 ...ces.c-comment-out-a-build-host-only-.patch |  2 +-
 ...on-Run-atomics-test-on-clang-as-well.patch |  4 ++--
 ...ot-enable-pidfd-features-on-native-g.patch |  4 ++--
 ...dcode-python-path-into-various-tools.patch |  2 +-
 .../glib-2.0/glib-2.0/native-gtkdoc.patch     | 21 -------------------
 .../glib-2.0/glib-2.0/relocate-modules.patch  |  2 +-
 ...{glib-2.0_2.78.3.bb => glib-2.0_2.78.4.bb} |  5 +++--
 12 files changed, 16 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/native-gtkdoc.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.78.3.bb => glib-2.0_2.78.4.bb} (91%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
index 0e5f371cb5..65da16e773 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
@@ -1,4 +1,4 @@
-From cf7df91cc8c3b4811235ef8aec144c5f0cf90bdb Mon Sep 17 00:00:00 2001
+From ab4a70a33361fe45ce9abd3946fb1c77dc73cd7a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not write $bindir into pkg-config files
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
index 1254466063..a6fc29eb63 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
@@ -1,4 +1,4 @@
-From b907a6681c4c24e5d3745538d9fcd471cf1c4c4a Mon Sep 17 00:00:00 2001
+From e23c6340341d8d3e13892692180cabc81db5ed96 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
index 50d369c24e..6ada503da8 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From 6e2ddcb5465d10618345b12e0b4471ead0f14304 Mon Sep 17 00:00:00 2001
+From 0e94dfce27e81149963ec65f42812cba1fe9a196 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
index f810574d97..06948cb6ff 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From c8c223045821cac97f798cfa63f19853621a8a2a Mon Sep 17 00:00:00 2001
+From 099471a0a6f80b0b61bbadeb06611611bdb61d2d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
index e1d2fb0e54..a3b2cda376 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
@@ -1,4 +1,4 @@
-From bafde4eedc0a22b45e73ee6183b9a11393a1e400 Mon Sep 17 00:00:00 2001
+From 83e214a99d19386e02b4ef87f7748fcdbc4d68da Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 13 Feb 2019 15:32:05 +0100
 Subject: [PATCH] Set host_machine correctly when building with mingw32
@@ -66,7 +66,7 @@ index d80c86e..5329cda 100644
      glib_tests += {
        'gpoll' : {
 diff --git a/meson.build b/meson.build
-index f7e936e..122f8b5 100644
+index 813c9b7..6ee775e 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -54,6 +54,9 @@ else
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
index e4c2f77459..ac110e3292 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From 3f05b9418c88bbb83c08b57cc5529b006f26fff4 Mon Sep 17 00:00:00 2001
+From 697644e9e01d422466dcb0489d93cff7aaacf813 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-clang-as-well.patch
index 071e4a7c4d..fd631a4d82 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-clang-as-well.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-clang-as-well.patch
@@ -1,4 +1,4 @@
-From 17d718640ae6f953e5eea714c1bd64eeb6e4799f Mon Sep 17 00:00:00 2001
+From e4d9030e7795feb9a4b65669afcb26fe35a9a1e8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 122f8b5..f055079 100644
+index 6ee775e..8bc5fa7 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -1938,7 +1938,7 @@ atomicdefine = '''
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
index e03f9a3c84..e1fc9aeeab 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From 7865d698b5d392aac3a3d32e9ebd5fea45017d15 Mon Sep 17 00:00:00 2001
+From b7c90de23a24b27f9bf3db9b892fd432f298c5e9 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native glib
@@ -15,7 +15,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index f055079..77d78aa 100644
+index 8bc5fa7..df1fa60 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -981,7 +981,8 @@ if cc.links('''#include <sys/syscall.h>
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch b/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch
index 4b75167da6..aa59b12e00 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch
@@ -1,4 +1,4 @@
-From 53bcd4b6cd3fe3fe4246914462e6724761eecf51 Mon Sep 17 00:00:00 2001
+From 92700849773ae2cede0ae7feb56e1e99d7400d9a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/native-gtkdoc.patch b/meta/recipes-core/glib-2.0/glib-2.0/native-gtkdoc.patch
deleted file mode 100644
index f56c2b8564..0000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/native-gtkdoc.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-docs/reference: depend on a native gtk-doc
-
-In a cross-compiled environment we don't need a target gtk-doc, but a
-native gtk-doc.
-
-Upstream-Status: Backport [f3ff370d1b24f8afb51cd4e865593d5b678188a9]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-diff --git a/docs/reference/meson.build b/docs/reference/meson.build
-index c417ffecb..67c1dda56 100644
---- a/docs/reference/meson.build
-+++ b/docs/reference/meson.build
-@@ -42,7 +42,7 @@ ignore_decorators = '|'.join(ignore_decorators)
- if get_option('gtk_doc')
-   # Check we have the minimum gtk-doc version required. Older versions won't
-   # generate correct documentation.
--  dependency('gtk-doc', version : '>=1.32.1',
-+  dependency('gtk-doc', version : '>=1.32.1', native: true,
-     fallback : ['gtk-doc', 'dummy_dep'],
-     default_options : ['tests=false'])
- 
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index 95a73298d8..376ae5d329 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 03a069cb8066d3e8ef72a43f7b1db5c9625e9cc2 Mon Sep 17 00:00:00 2001
+From b4860b3900d001eeba4ef99d66f86123173ed4b9 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb
similarity index 91%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb
index 2729b2a596..e89439e230 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb
@@ -14,13 +14,14 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
-           file://native-gtkdoc.patch \
+           file://relocate-modules.patch \
+           file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \ 
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[sha256sum] = "609801dd373796e515972bf95fc0b2daa44545481ee2f465c4f204d224b2bc21"
+SRC_URI[sha256sum] = "24b8e0672dca120cc32d394bccb85844e732e04fe75d18bb0573b2dbc7548f63"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.42.0


--===============2246010901949626919==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-2.0-upgrade-2.78.3-2.78.4.patch"

RnJvbSBhY2ZlMmU5NmU1YTc5YWI0YjBhODM0ZjE5N2M2NDFmZTgwN2RkYjUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAwNTozNzo0OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGds
aWItMi4wOiB1cGdyYWRlIDIuNzguMyAtPiAyLjc4LjQKCi0tLQogLi4udC13cml0ZS1iaW5kaXIt
aW50by1wa2ctY29uZmlnLWZpbGVzLnBhdGNoIHwgIDIgKy0KIC4uLjAwMDEtRml4LURBVEFESVJO
QU1FLW9uLXVjbGliYy1MaW51eC5wYXRjaCB8ICAyICstCiAuLi4tZ2lvLXF1ZXJ5bW9kdWxlcy1h
cy1saWJleGVjX1BST0dSQU0ucGF0Y2ggfCAgMiArLQogLi4ubmctYWJvdXQtZGVwcmVjYXRlZC1w
YXRocy1pbi1zY2hlbWFzLnBhdGNoIHwgIDIgKy0KIC4uLi1jb3JyZWN0bHktd2hlbi1idWlsZGlu
Zy13aXRoLW1pbmd3My5wYXRjaCB8ICA0ICsrLS0KIC4uLmNlcy5jLWNvbW1lbnQtb3V0LWEtYnVp
bGQtaG9zdC1vbmx5LS5wYXRjaCB8ICAyICstCiAuLi5vbi1SdW4tYXRvbWljcy10ZXN0LW9uLWNs
YW5nLWFzLXdlbGwucGF0Y2ggfCAgNCArKy0tCiAuLi5vdC1lbmFibGUtcGlkZmQtZmVhdHVyZXMt
b24tbmF0aXZlLWcucGF0Y2ggfCAgNCArKy0tCiAuLi5kY29kZS1weXRob24tcGF0aC1pbnRvLXZh
cmlvdXMtdG9vbHMucGF0Y2ggfCAgMiArLQogLi4uL2dsaWItMi4wL2dsaWItMi4wL25hdGl2ZS1n
dGtkb2MucGF0Y2ggICAgIHwgMjEgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4uL2dsaWItMi4wL2ds
aWItMi4wL3JlbG9jYXRlLW1vZHVsZXMucGF0Y2ggIHwgIDIgKy0KIC4uLntnbGliLTIuMF8yLjc4
LjMuYmIgPT4gZ2xpYi0yLjBfMi43OC40LmJifSB8ICA1ICsrKy0tCiAxMiBmaWxlcyBjaGFuZ2Vk
LCAxNiBpbnNlcnRpb25zKCspLCAzNiBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBt
ZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC9uYXRpdmUtZ3RrZG9jLnBhdGNoCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAve2dsaWItMi4wXzIuNzguMy5iYiA9PiBn
bGliLTIuMF8yLjc4LjQuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUv
Z2xpYi0yLjAvZ2xpYi0yLjAvMDAwMS1Eby1ub3Qtd3JpdGUtYmluZGlyLWludG8tcGtnLWNvbmZp
Zy1maWxlcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLzAwMDEt
RG8tbm90LXdyaXRlLWJpbmRpci1pbnRvLXBrZy1jb25maWctZmlsZXMucGF0Y2gKaW5kZXggMGU1
ZjM3MWNiNS4uNjVkYTE2ZTc3MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0y
LjAvZ2xpYi0yLjAvMDAwMS1Eby1ub3Qtd3JpdGUtYmluZGlyLWludG8tcGtnLWNvbmZpZy1maWxl
cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC8wMDAxLURv
LW5vdC13cml0ZS1iaW5kaXItaW50by1wa2ctY29uZmlnLWZpbGVzLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSBjZjdkZjkxY2M4YzNiNDgxMTIzNWVmOGFlYzE0NGM1ZjBjZjkwYmRiIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhYjRhNzBhMzMzNjFmZTQ1Y2U5YWJkMzk0NmZiMWM3
N2RjNzNjZDdhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2
aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBGcmksIDE1IEZlYiAyMDE5IDExOjE3
OjI3ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIERvIG5vdCB3cml0ZSAkYmluZGlyIGludG8gcGtn
LWNvbmZpZyBmaWxlcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xp
Yi0yLjAvMDAwMS1GaXgtREFUQURJUk5BTUUtb24tdWNsaWJjLUxpbnV4LnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAvMDAwMS1GaXgtREFUQURJUk5BTUUtb24tdWNs
aWJjLUxpbnV4LnBhdGNoCmluZGV4IDEyNTQ0NjYwNjMuLmE2ZmMyOWViNjMgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLzAwMDEtRml4LURBVEFESVJOQU1F
LW9uLXVjbGliYy1MaW51eC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9n
bGliLTIuMC8wMDAxLUZpeC1EQVRBRElSTkFNRS1vbi11Y2xpYmMtTGludXgucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIGI5MDdhNjY4MWM0YzI0ZTVkMzc0NTUzOGQ5ZmNkNDcxY2YxYzRjNGEg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGUyM2M2MzQwMzQxZDhkM2UxMzg5MjY5MjE4
MGNhYmM4MWRiNWVkOTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8
cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogU2F0LCAxNSBNYXIgMjAxNCAyMjo0MjoyOSAtMDcw
MAogU3ViamVjdDogW1BBVENIXSBGaXggREFUQURJUk5BTUUgb24gdWNsaWJjL0xpbnV4CmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC8wMDAxLUluc3RhbGwt
Z2lvLXF1ZXJ5bW9kdWxlcy1hcy1saWJleGVjX1BST0dSQU0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
Y29yZS9nbGliLTIuMC9nbGliLTIuMC8wMDAxLUluc3RhbGwtZ2lvLXF1ZXJ5bW9kdWxlcy1hcy1s
aWJleGVjX1BST0dSQU0ucGF0Y2gKaW5kZXggNTBkMzY5YzI0ZS4uNmFkYTUwM2RhOCAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAvMDAwMS1JbnN0YWxsLWdp
by1xdWVyeW1vZHVsZXMtYXMtbGliZXhlY19QUk9HUkFNLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLzAwMDEtSW5zdGFsbC1naW8tcXVlcnltb2R1bGVzLWFz
LWxpYmV4ZWNfUFJPR1JBTS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNmUyZGRjYjU0NjVk
MTA2MTgzNDViMTJlMGI0NDcxZWFkMGYxNDMwNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gMGU5NGRmY2UyN2U4MTE0OTk2M2VjNjVmNDI4MTJjYmExZmU5YTE5NiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEp1c3NpIEt1a2tvbmVuIDxqdXNzaS5rdWtrb25lbkBpbnRlbC5j
b20+CiBEYXRlOiBUdWUsIDIyIE1hciAyMDE2IDE1OjE0OjU4ICswMjAwCiBTdWJqZWN0OiBbUEFU
Q0hdIEluc3RhbGwgZ2lvLXF1ZXJ5bW9kdWxlcyBhcyBsaWJleGVjX1BST0dSQU0KZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLzAwMDEtUmVtb3ZlLXRoZS13
YXJuaW5nLWFib3V0LWRlcHJlY2F0ZWQtcGF0aHMtaW4tc2NoZW1hcy5wYXRjaCBiL21ldGEvcmVj
aXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLzAwMDEtUmVtb3ZlLXRoZS13YXJuaW5nLWFib3V0
LWRlcHJlY2F0ZWQtcGF0aHMtaW4tc2NoZW1hcy5wYXRjaAppbmRleCBmODEwNTc0ZDk3Li4wNjk0
OGNiNmZmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC8w
MDAxLVJlbW92ZS10aGUtd2FybmluZy1hYm91dC1kZXByZWNhdGVkLXBhdGhzLWluLXNjaGVtYXMu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAvMDAwMS1SZW1v
dmUtdGhlLXdhcm5pbmctYWJvdXQtZGVwcmVjYXRlZC1wYXRocy1pbi1zY2hlbWFzLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSBjOGMyMjMwNDU4MjFjYWM5N2Y3OThjZmE2M2YxOTg1MzYyMWE4
YTJhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwOTk0NzFhMGE2ZjgwYjBiNjFiYmFk
ZWIwNjYxMTYxMWJkYjYxZDJkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFu
ZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBGcmksIDEyIEp1biAy
MDE1IDE3OjA4OjQ2ICswMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIFJlbW92ZSB0aGUgd2FybmluZyBh
Ym91dCBkZXByZWNhdGVkIHBhdGhzIGluIHNjaGVtYXMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLzAwMDEtU2V0LWhvc3RfbWFjaGluZS1jb3JyZWN0bHkt
d2hlbi1idWlsZGluZy13aXRoLW1pbmd3My5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWIt
Mi4wL2dsaWItMi4wLzAwMDEtU2V0LWhvc3RfbWFjaGluZS1jb3JyZWN0bHktd2hlbi1idWlsZGlu
Zy13aXRoLW1pbmd3My5wYXRjaAppbmRleCBlMWQyZmIwZTU0Li5hM2IyY2RhMzc2IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC8wMDAxLVNldC1ob3N0X21h
Y2hpbmUtY29ycmVjdGx5LXdoZW4tYnVpbGRpbmctd2l0aC1taW5ndzMucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAvMDAwMS1TZXQtaG9zdF9tYWNoaW5lLWNv
cnJlY3RseS13aGVuLWJ1aWxkaW5nLXdpdGgtbWluZ3czLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSBiYWZkZTRlZWRjMGEyMmI0NWU3M2VlNjE4M2I5YTExMzkzYTFlNDAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSA4M2UyMTRhOTlkMTkzODZlMDJiNGVmODdmNzc0OGZjZGJjNGQ2
OGRhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFs
ZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDEzIEZlYiAyMDE5IDE1OjMyOjA1ICsw
MTAwCiBTdWJqZWN0OiBbUEFUQ0hdIFNldCBob3N0X21hY2hpbmUgY29ycmVjdGx5IHdoZW4gYnVp
bGRpbmcgd2l0aCBtaW5ndzMyCkBAIC02Niw3ICs2Niw3IEBAIGluZGV4IGQ4MGM4NmUuLjUzMjlj
ZGEgMTAwNjQ0CiAgICAgIGdsaWJfdGVzdHMgKz0gewogICAgICAgICdncG9sbCcgOiB7CiBkaWZm
IC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAotaW5kZXggZjdlOTM2ZS4uMTIyZjhi
NSAxMDA2NDQKK2luZGV4IDgxM2M5YjcuLjZlZTc3NWUgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWls
ZAogKysrIGIvbWVzb24uYnVpbGQKIEBAIC01NCw2ICs1NCw5IEBAIGVsc2UKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLzAwMDEtZ2lvLXRlc3RzLXJlc291
cmNlcy5jLWNvbW1lbnQtb3V0LWEtYnVpbGQtaG9zdC1vbmx5LS5wYXRjaCBiL21ldGEvcmVjaXBl
cy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLzAwMDEtZ2lvLXRlc3RzLXJlc291cmNlcy5jLWNvbW1l
bnQtb3V0LWEtYnVpbGQtaG9zdC1vbmx5LS5wYXRjaAppbmRleCBlNGMyZjc3NDU5Li5hYzExMGUz
MjkyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC8wMDAx
LWdpby10ZXN0cy1yZXNvdXJjZXMuYy1jb21tZW50LW91dC1hLWJ1aWxkLWhvc3Qtb25seS0ucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAvMDAwMS1naW8tdGVz
dHMtcmVzb3VyY2VzLmMtY29tbWVudC1vdXQtYS1idWlsZC1ob3N0LW9ubHktLnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSAzZjA1Yjk0MThjODhiYmI4M2MwOGI1N2NjNTUyOWIwMDZmMjZmZmY0
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2OTc2NDRlOWUwMWQ0MjI0NjZkY2IwNDg5
ZDkzY2ZmN2FhYWNmODEzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVy
IEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDggSmFuIDIwMjAg
MTg6MjI6NDYgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gZ2lvL3Rlc3RzL3Jlc291cmNlcy5jOiBj
b21tZW50IG91dCBhIGJ1aWxkIGhvc3Qtb25seSB0ZXN0CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC8wMDAxLW1lc29uLVJ1bi1hdG9taWNzLXRlc3Qtb24t
Y2xhbmctYXMtd2VsbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4w
LzAwMDEtbWVzb24tUnVuLWF0b21pY3MtdGVzdC1vbi1jbGFuZy1hcy13ZWxsLnBhdGNoCmluZGV4
IDA3MWU0YTdjNGQuLmZkNjMxYTRkODIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2ds
aWItMi4wL2dsaWItMi4wLzAwMDEtbWVzb24tUnVuLWF0b21pY3MtdGVzdC1vbi1jbGFuZy1hcy13
ZWxsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLzAwMDEt
bWVzb24tUnVuLWF0b21pY3MtdGVzdC1vbi1jbGFuZy1hcy13ZWxsLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSAxN2Q3MTg2NDBhZTZmOTUzZTVlZWE3MTRjMWJkNjRlZWI2ZTQ3OTlmIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlNGQ5MDMwZTc3OTVmZWI5YTRiNjU2NjlhZmNiMjZm
ZTM1YTlhMWU4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4KIERhdGU6IFNhdCwgMTIgT2N0IDIwMTkgMTc6NDY6MjYgLTA3MDAKIFN1
YmplY3Q6IFtQQVRDSF0gbWVzb246IFJ1biBhdG9taWNzIHRlc3Qgb24gY2xhbmcgYXMgd2VsbApA
QCAtMTUsNyArMTUsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwu
Y29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBk
aWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAotaW5kZXggMTIyZjhiNS4uZjA1
NTA3OSAxMDA2NDQKK2luZGV4IDZlZTc3NWUuLjhiYzVmYTcgMTAwNjQ0CiAtLS0gYS9tZXNvbi5i
dWlsZAogKysrIGIvbWVzb24uYnVpbGQKIEBAIC0xOTM4LDcgKzE5MzgsNyBAQCBhdG9taWNkZWZp
bmUgPSAnJycKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4w
LzAwMDEtbWVzb24uYnVpbGQtZG8tbm90LWVuYWJsZS1waWRmZC1mZWF0dXJlcy1vbi1uYXRpdmUt
Zy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLzAwMDEtbWVzb24u
YnVpbGQtZG8tbm90LWVuYWJsZS1waWRmZC1mZWF0dXJlcy1vbi1uYXRpdmUtZy5wYXRjaAppbmRl
eCBlMDNmOWEzYzg0Li5lMWZjOWFlZWFiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9n
bGliLTIuMC9nbGliLTIuMC8wMDAxLW1lc29uLmJ1aWxkLWRvLW5vdC1lbmFibGUtcGlkZmQtZmVh
dHVyZXMtb24tbmF0aXZlLWcucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAv
Z2xpYi0yLjAvMDAwMS1tZXNvbi5idWlsZC1kby1ub3QtZW5hYmxlLXBpZGZkLWZlYXR1cmVzLW9u
LW5hdGl2ZS1nLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3ODY1ZDY5OGI1ZDM5MmFhYzNh
M2QzMmU5ZWJkNWZlYTQ1MDE3ZDE1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiN2M5
MGRlMjNhMjRiMjdmOWJmM2RiOWI4OTJmZDQzMmYyOThjNWU5IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KIERhdGU6
IFNhdCwgMTYgU2VwIDIwMjMgMjI6Mjg6MjcgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gbWVzb24u
YnVpbGQ6IGRvIG5vdCBlbmFibGUgcGlkZmQgZmVhdHVyZXMgb24gbmF0aXZlIGdsaWIKQEAgLTE1
LDcgKzE1LDcgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRy
b25peC5kZT4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CiAKIGRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCi1pbmRleCBmMDU1MDc5
Li43N2Q3OGFhIDEwMDY0NAoraW5kZXggOGJjNWZhNy4uZGYxZmE2MCAxMDA2NDQKIC0tLSBhL21l
c29uLmJ1aWxkCiArKysgYi9tZXNvbi5idWlsZAogQEAgLTk4MSw3ICs5ODEsOCBAQCBpZiBjYy5s
aW5rcygnJycjaW5jbHVkZSA8c3lzL3N5c2NhbGwuaD4KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLzAwMTAtRG8tbm90LWhhcmRjb2RlLXB5dGhvbi1wYXRo
LWludG8tdmFyaW91cy10b29scy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2ds
aWItMi4wLzAwMTAtRG8tbm90LWhhcmRjb2RlLXB5dGhvbi1wYXRoLWludG8tdmFyaW91cy10b29s
cy5wYXRjaAppbmRleCA0Yjc1MTY3ZGE2Li5hYTU5YjEyZTAwIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC8wMDEwLURvLW5vdC1oYXJkY29kZS1weXRob24t
cGF0aC1pbnRvLXZhcmlvdXMtdG9vbHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xp
Yi0yLjAvZ2xpYi0yLjAvMDAxMC1Eby1ub3QtaGFyZGNvZGUtcHl0aG9uLXBhdGgtaW50by12YXJp
b3VzLXRvb2xzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1M2JjZDRiNmNkM2ZlM2ZlNDI0
NjkxNDQ2MmU2NzI0NzYxZWVjZjUxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5Mjcw
MDg0OTc3M2FlMmNlZGUwYWU3ZmViNTZlMWU5OWQ3NDAwZDlhIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBE
YXRlOiBUdWUsIDMgT2N0IDIwMTcgMTA6NDU6NTUgKzAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gRG8g
bm90IGhhcmRjb2RlIHB5dGhvbiBwYXRoIGludG8gdmFyaW91cyB0b29scwpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAvbmF0aXZlLWd0a2RvYy5wYXRjaCBi
L21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wL25hdGl2ZS1ndGtkb2MucGF0Y2gK
ZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGY1NmMyYjg1NjQuLjAwMDAwMDAwMDAKLS0t
IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAvbmF0aXZlLWd0a2RvYy5wYXRj
aAorKysgL2Rldi9udWxsCkBAIC0xLDIxICswLDAgQEAKLWRvY3MvcmVmZXJlbmNlOiBkZXBlbmQg
b24gYSBuYXRpdmUgZ3RrLWRvYwotCi1JbiBhIGNyb3NzLWNvbXBpbGVkIGVudmlyb25tZW50IHdl
IGRvbid0IG5lZWQgYSB0YXJnZXQgZ3RrLWRvYywgYnV0IGEKLW5hdGl2ZSBndGstZG9jLgotCi1V
cHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtmM2ZmMzcwZDFiMjRmOGFmYjUxY2Q0ZTg2NTU5M2Q1
YjY3ODE4OGE5XQotU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5j
b20+Ci0KLWRpZmYgLS1naXQgYS9kb2NzL3JlZmVyZW5jZS9tZXNvbi5idWlsZCBiL2RvY3MvcmVm
ZXJlbmNlL21lc29uLmJ1aWxkCi1pbmRleCBjNDE3ZmZlY2IuLjY3YzFkZGE1NiAxMDA2NDQKLS0t
LSBhL2RvY3MvcmVmZXJlbmNlL21lc29uLmJ1aWxkCi0rKysgYi9kb2NzL3JlZmVyZW5jZS9tZXNv
bi5idWlsZAotQEAgLTQyLDcgKzQyLDcgQEAgaWdub3JlX2RlY29yYXRvcnMgPSAnfCcuam9pbihp
Z25vcmVfZGVjb3JhdG9ycykKLSBpZiBnZXRfb3B0aW9uKCdndGtfZG9jJykKLSAgICMgQ2hlY2sg
d2UgaGF2ZSB0aGUgbWluaW11bSBndGstZG9jIHZlcnNpb24gcmVxdWlyZWQuIE9sZGVyIHZlcnNp
b25zIHdvbid0Ci0gICAjIGdlbmVyYXRlIGNvcnJlY3QgZG9jdW1lbnRhdGlvbi4KLS0gIGRlcGVu
ZGVuY3koJ2d0ay1kb2MnLCB2ZXJzaW9uIDogJz49MS4zMi4xJywKLSsgIGRlcGVuZGVuY3koJ2d0
ay1kb2MnLCB2ZXJzaW9uIDogJz49MS4zMi4xJywgbmF0aXZlOiB0cnVlLAotICAgICBmYWxsYmFj
ayA6IFsnZ3RrLWRvYycsICdkdW1teV9kZXAnXSwKLSAgICAgZGVmYXVsdF9vcHRpb25zIDogWyd0
ZXN0cz1mYWxzZSddKQotIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAv
Z2xpYi0yLjAvcmVsb2NhdGUtbW9kdWxlcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWIt
Mi4wL2dsaWItMi4wL3JlbG9jYXRlLW1vZHVsZXMucGF0Y2gKaW5kZXggOTVhNzMyOThkOC4uMzc2
YWU1ZDMyOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAv
cmVsb2NhdGUtbW9kdWxlcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9n
bGliLTIuMC9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwM2Ew
NjljYjgwNjZkM2U4ZWY3MmE0M2Y3YjFkYjVjOTYyNWU5Y2MyIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSBiNDg2MGIzOTAwZDAwMWVlYmE0ZWY5OWQ2NmY4NjEyMzE3M2VkNGI5IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVs
LmNvbT4KIERhdGU6IEZyaSwgMTEgTWFyIDIwMTYgMTU6MzU6NTUgKzAwMDAKIFN1YmplY3Q6IFtQ
QVRDSF0gZ2xpYi0yLjA6IHJlbG9jYXRlIHRoZSBHSU8gbW9kdWxlIGRpcmVjdG9yeSBmb3IgbmF0
aXZlIGJ1aWxkcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0y
LjBfMi43OC4zLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjBfMi43OC40
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL2ds
aWItMi4wL2dsaWItMi4wXzIuNzguMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvZ2xp
Yi0yLjAvZ2xpYi0yLjBfMi43OC40LmJiCmluZGV4IDI3MjliMmE1OTYuLmU4OTQzOWUyMzAgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wXzIuNzguMy5iYgor
KysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMF8yLjc4LjQuYmIKQEAgLTE0
LDEzICsxNCwxNCBAQCBTUkNfVVJJID0gIiR7R05PTUVfTUlSUk9SfS9nbGliLyR7U0hSVF9WRVJ9
L2dsaWItJHtQVn0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtRG8tbm90LXdyaXRl
LWJpbmRpci1pbnRvLXBrZy1jb25maWctZmlsZXMucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8v
MDAwMS1tZXNvbi1SdW4tYXRvbWljcy10ZXN0LW9uLWNsYW5nLWFzLXdlbGwucGF0Y2ggXAogICAg
ICAgICAgICBmaWxlOi8vMDAwMS1naW8tdGVzdHMtcmVzb3VyY2VzLmMtY29tbWVudC1vdXQtYS1i
dWlsZC1ob3N0LW9ubHktLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovL25hdGl2ZS1ndGtkb2Mu
cGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vcmVsb2NhdGUtbW9kdWxlcy5wYXRjaCBcCisgICAg
ICAgICAgIGZpbGU6Ly8wMDAxLW1lc29uLmJ1aWxkLWRvLW5vdC1lbmFibGUtcGlkZmQtZmVhdHVy
ZXMtb24tbmF0aXZlLWcucGF0Y2ggXAogICAgICAgICAgICAiCiBTUkNfVVJJOmFwcGVuZDpjbGFz
cy1uYXRpdmUgPSAiIGZpbGU6Ly9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoIFwgCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly8wMDAxLW1lc29uLmJ1aWxkLWRvLW5vdC1lbmFi
bGUtcGlkZmQtZmVhdHVyZXMtb24tbmF0aXZlLWcucGF0Y2ggXAogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjA5ODAxZGQzNzM3OTZlNTE1
OTcyYmY5NWZjMGIyZGFhNDQ1NDU0ODFlZTJmNDY1YzRmMjA0ZDIyNGIyYmMyMSIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICIyNGI4ZTA2NzJkY2ExMjBjYzMyZDM5NGJjY2I4NTg0NGU3MzJlMDRmZTc1
ZDE4YmIwNTczYjJkYmM3NTQ4ZjYzIgogCiAjIEZpbmQgYW55IG1lc29uIGNyb3NzIGZpbGVzIGlu
IEZJTEVTUEFUSCB0aGF0IGFyZSByZWxldmFudCBmb3IgdGhlIGN1cnJlbnQKICMgYnVpbGQgKHVz
aW5nIHNpdGVpbmZvKSBhbmQgYWRkIHRoZW0gdG8gRVhUUkFfT0VNRVNPTi4KLS0gCjIuNDIuMAoK

--===============2246010901949626919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1852 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (911 cached, 1 parsed). 1849 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-6ed51445a90bb8fcfd36f6c72f1bb76b1d15fa6a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6ed51445a90bb8fcfd36f6c72f1bb76b1d15fa6a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 468 Local 349 Mirrors 0 Missed 119 Current 565 (74% match, 88% complete)
Removing 49 stale sstate objects for arch core2-64...done.
Removing 24 stale sstate objects for arch qemux86_64...done.
Removing 5 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 727 of 1033 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 728 of 1033 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 733 of 1033 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 740 of 1033 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 741 of 1033 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 745 of 1033 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 746 of 1033 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 767 of 1033 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 772 of 1033 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 776 of 1033 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 778 of 1033 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_create_spdx_setscene)
NOTE: Running setscene task 779 of 1033 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 788 of 1033 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 804 of 1033 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 807 of 1033 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 808 of 1033 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-31-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_255.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 810 of 1033 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 811 of 1033 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 815 of 1033 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 823 of 1033 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 835 of 1033 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 836 of 1033 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_create_spdx_setscene)
NOTE: Running setscene task 847 of 1033 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_create_spdx_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 873 of 1033 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 910 of 1033 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/intltool/intltool_0.51.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 922 of 1033 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 962 of 1033 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 964 of 1033 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 965 of 1033 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 966 of 1033 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 967 of 1033 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_255.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 988 of 1033 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_create_spdx_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe intltool-native-0.51.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-jinja2-native-3.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 999 of 1033 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_create_spdx_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1004 of 1033 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-native-2023.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-native-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-native-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-native-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxslt-native-1.1.39-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1008 of 1033 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-native-2023.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-native-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxslt-native-1.1.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-jinja2-native-3.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1018 of 1033 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe intltool-native-0.51.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1019 of 1033 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libxml-parser-perl_2.46.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-native-2.39.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-native-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1021 of 1033 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-native-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-native-2.39.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1022 of 1033 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext-minimal-native_0.22.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1024 of 1033 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_create_spdx_setscene)
NOTE: recipe python3-markupsafe-native-2.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml-parser-perl-native-2.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xorgproto-native-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1033 of 1033 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx_setscene)
NOTE: recipe gettext-minimal-native-0.22.4-r0: task do_create_spdx_setscene: Started
NOTE: Running task 479 of 2804 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_recipe_qa)
NOTE: Running task 496 of 2804 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_write_config)
NOTE: Running task 502 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_fetch)
NOTE: Running task 510 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_recipe_qa)
NOTE: Running task 513 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_fetch)
NOTE: recipe xorgproto-native-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-native-10.42-r0: task do_create_spdx_setscene: Started
NOTE: Running task 523 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_write_config)
NOTE: Running task 534 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_write_config)
NOTE: Running task 535 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_write_config)
NOTE: Running task 540 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_fetch)
NOTE: Running task 542 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: Running task 547 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_fetch)
NOTE: recipe gettext-minimal-native-0.22.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-markupsafe-native-2.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml-parser-perl-native-2.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-native-2.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-native-10.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_write_config: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libxcb-1.16-r0: task do_fetch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_recipe_qa: Started
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Started
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_write_config: Started
NOTE: recipe libxcb-1.16-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_recipe_qa: Started
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_write_config: Started
NOTE: recipe xorgproto-2023.2-r0: task do_write_config: Succeeded
NOTE: recipe libxml2-native-2.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1187 of 2804 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_fetch)
NOTE: Running task 1277 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_fetch)
NOTE: Running task 1300 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_unpack)
NOTE: Running task 1311 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_unpack)
NOTE: Running task 1398 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_unpack)
NOTE: Running task 1400 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: Running task 1419 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_unpack)
NOTE: Running task 1467 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_fetch)
NOTE: Running task 1492 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_fetch)
NOTE: Running task 1498 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_fetch)
NOTE: Running task 1533 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.1.bb:do_fetch)
NOTE: Running task 1540 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_fetch)
NOTE: recipe xorgproto-2023.2-r0: task do_unpack: Started
NOTE: Running task 1548 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_fetch)
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: recipe libxcb-1.16-r0: task do_unpack: Started
NOTE: Running task 1634 of 2804 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_unpack)
NOTE: Running task 1635 of 2804 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_fetch: Succeeded
NOTE: Running task 1636 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.40-r0: task do_fetch: Started
NOTE: Running task 1680 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_write_config)
NOTE: recipe libx11-1_1.8.7-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_fetch: Started
NOTE: Running task 1705 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_write_config)
NOTE: recipe xkeyboard-config-2.40-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Started
NOTE: Running task 1706 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_unpack)
NOTE: recipe libx11-1_1.8.7-r0: task do_fetch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1707 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_unpack)
NOTE: Running task 1708 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_unpack)
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1709 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_unpack)
NOTE: Running task 1710 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_unpack)
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_unpack: Succeeded
NOTE: Running task 1711 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 1712 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_patch)
NOTE: recipe systemd-1_255.1-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: Running task 1713 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_patch)
NOTE: Running task 1714 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: recipe libxcb-1.16-r0: task do_unpack: Succeeded
NOTE: Running task 1715 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_patch)
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_write_config: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe systemd-1_255.1-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.40-r0: task do_write_config: Succeeded
NOTE: Running task 1716 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.1.bb:do_unpack)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_write_config: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: recipe wayland-1.22.0-r0: task do_patch: Started
NOTE: Running task 1753 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.1.bb:do_warn_musl)
NOTE: Running task 1754 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.1.bb:do_write_config)
NOTE: recipe libxcb-1.16-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1817 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_patch)
NOTE: Running task 1818 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_patch)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1832 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_patch)
NOTE: recipe xkeyboard-config-2.40-r0: task do_unpack: Succeeded
NOTE: Running task 1846 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_patch)
NOTE: recipe libxcb-1.16-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_255.1-r0: task do_unpack: Started
NOTE: Running task 1882 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_fetch)
NOTE: Running task 1883 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: Running task 1884 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_fetch)
NOTE: recipe wayland-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_255.1-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_255.1-r0: task do_warn_musl: Succeeded
NOTE: recipe systemd-1_255.1-r0: task do_write_config: Started
NOTE: Running task 1972 of 2804 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Started
NOTE: Running task 2031 of 2804 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_fetch)
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_patch: Started
NOTE: recipe systemd-1_255.1-r0: task do_write_config: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Started
NOTE: Running task 2101 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_write_config)
NOTE: Running task 2109 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_patch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_patch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: Running task 2145 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_unpack)
NOTE: Running task 2153 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Succeeded
NOTE: Running task 2160 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_unpack)
NOTE: Running task 2161 of 2804 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.40-r0: task do_patch: Succeeded
NOTE: Running task 2258 of 2804 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_write_config)
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_patch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_fetch: Succeeded
NOTE: Running task 2448 of 2804 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_fetch: Succeeded
NOTE: Running task 2517 of 2804 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_unpack)
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Succeeded
NOTE: Running task 2528 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_patch)
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_write_config: Succeeded
NOTE: Running task 2529 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_patch)
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_write_config: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 2530 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_patch)
NOTE: Running task 2531 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: recipe libx11-1_1.8.7-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Started
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_unpack: Succeeded
NOTE: Running task 2536 of 2804 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_unpack: Succeeded
NOTE: Running task 2537 of 2804 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_patch)
NOTE: Running task 2538 of 2804 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_collect_spdx_deps)
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_patch: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_patch: Started
NOTE: Running task 2539 of 2804 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2540 of 2804 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_create_spdx)
NOTE: recipe gobject-introspection-native-1.78.1-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_patch: Succeeded
NOTE: Running task 2542 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2543 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_populate_lic)
NOTE: recipe systemd-1_255.1-r0: task do_unpack: Succeeded
NOTE: Running task 2544 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.1.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_create_spdx: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_populate_lic: Started
NOTE: recipe systemd-1_255.1-r0: task do_patch: Started
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 2546 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.2.0.bb:do_collect_spdx_deps)
NOTE: Running task 2547 of 2804 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_populate_lic: Succeeded
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe qemu-native-8.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe systemd-1_255.1-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe qemu-native-8.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2549 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.2.0.bb:do_create_spdx)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2550 of 2804 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx)
NOTE: recipe qemu-native-8.2.0-r0: task do_create_spdx: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx: Started
NOTE: recipe qemu-native-8.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2551 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_collect_spdx_deps)
NOTE: Running task 2552 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_collect_spdx_deps)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 2553 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_collect_spdx_deps)
NOTE: Running task 2554 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_collect_spdx_deps)
NOTE: Running task 2555 of 2804 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_collect_spdx_deps)
NOTE: recipe xorgproto-2023.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_collect_spdx_deps: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe wayland-1.22.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xorgproto-2023.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xkeyboard-config-2.40-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-2.0-native-1_2.78.4-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 2555 tasks of which 2474 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240201053724.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240201053724.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_patch
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: glib-2.0-native-1_2.78.4-r0 do_patch: Applying patch 'relocate-modules.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.4/glib-2.78.4'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.4/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch relocate-modules.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.4/temp/log.do_patch.624687
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_patch) failed with exit code '1'

--===============2246010901949626919==--

