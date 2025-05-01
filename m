Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5C53C3ABBE
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:33 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.1806.1746113613097356396
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=FyHKyV5T;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=LWaQ+q1O;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101968c7b4a4b-f37a5fca-710c-4889-b50f-8ee0e48dc564-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113612;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JbM9EGWHruTefeg6Aha2DLyJYX1Crk+QyQj7tiLw9Ro=;
	b=FyHKyV5TAcuu5/Fuh/EsCtEDK6UKb4701/qOccS8O7OSfnEGIGR1l4IQOfnEorpD
	SnHThe0LzBWKQK+ARzX9oVaL+FZ0/o8H39SDojN2Hqvu6LkcKG9MYuEphSMo4Brrtc+
	EiOyWVE2mT9lyU1GV6GCKXBpGxes0iP2wLIneV0k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113612;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JbM9EGWHruTefeg6Aha2DLyJYX1Crk+QyQj7tiLw9Ro=;
	b=LWaQ+q1OO7FrPyz0zHsFucu4e3K7zZU2faOCAFiBZ5Bui556tusXPk1qRopAew6C
	TtNzPjfdvpbBdvZn1AE7QxVBtowr8NrEHQ04P3B36sKySxGXanzGpFnJ2PdltXvLUCS
	B28q5jgmwYymeMfnS5YepVDVdBDhKQ71p4yvUbn8=
Content-Type: multipart/mixed; boundary="===============1845169585981650958=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>, Anuj Mittal <anuj.mittal@intel.com>, 
	Anuj Mittal <anuj.mittal@intel.com>, 
	Anuj Mittal <anuj.mittal@intel.com>, 
	Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 gstreamer1.0-plugins-ugly,gstreamer1.0-plugins-bad,gstreamer1.0-rtsp-server,gstreamer1.0-plugins-base,gstreamer1.0-plugins-good:
 upgrading to 1.26.1,1.26.1,1.26.1,1.26.1,1.26.1 SUCCEEDED
Message-ID: <010101968c7b4a4b-f37a5fca-710c-4889-b50f-8ee0e48dc564-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215793

--===============1845169585981650958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-plugins-ugly,gstreamer1.0-plugins-bad,gstreamer1.0-rtsp-server,gstreamer1.0-plugins-base,gstreamer1.0-plugins-good* to *1.26.1,1.26.1,1.26.1,1.26.1,1.26.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-plugins-ugly-gstreamer1.0-plugins-bad-g.patch
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
From 9ebd8bb519ed6c50933c9e4f1dbb634877e6fb70 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 07:12:14 +0000
Subject: [PATCH] 
 gstreamer1.0-plugins-ugly,gstreamer1.0-plugins-bad,gstreamer1.0-rtsp-server,gstreamer1.0-plugins-base,gstreamer1.0-plugins-good:
 upgrade 1.26.0 -> 1.26.1,1.26.0 -> 1.26.1,1.26.0 -> 1.26.1,1.26.0 ->
 1.26.1,1.26.0 -> 1.26.1

---
 .../0001-backport-libatomic-issue-patch.patch | 41 ---------------
 ...ialized-warnings-when-compiling-with.patch |  2 +-
 ...-avoid-including-sys-poll.h-directly.patch |  2 +-
 ...issing-opencv-data-dir-in-yocto-buil.patch |  2 +-
 ....bb => gstreamer1.0-plugins-bad_1.26.1.bb} |  3 +-
 ...et-caps-from-src-pad-when-query-caps.patch |  2 +-
 ...gins-base-Fix-atomic-64-issue-on-arm.patch | 52 -------------------
 ...parse-enhance-SSA-text-lines-parsing.patch |  2 +-
 ...iv-fb-Make-sure-config.h-is-included.patch |  2 +-
 ...bb => gstreamer1.0-plugins-base_1.26.1.bb} |  3 +-
 ...bb => gstreamer1.0-plugins-good_1.26.1.bb} |  2 +-
 ...bb => gstreamer1.0-plugins-ugly_1.26.1.bb} |  2 +-
 ....bb => gstreamer1.0-rtsp-server_1.26.1.bb} |  2 +-
 13 files changed, 11 insertions(+), 106 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-backport-libatomic-issue-patch.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.26.0.bb => gstreamer1.0-plugins-bad_1.26.1.bb} (98%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-gstreamer1.0-plugins-base-Fix-atomic-64-issue-on-arm.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.26.0.bb => gstreamer1.0-plugins-base_1.26.1.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.26.0.bb => gstreamer1.0-plugins-good_1.26.1.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.26.0.bb => gstreamer1.0-plugins-ugly_1.26.1.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.26.0.bb => gstreamer1.0-rtsp-server_1.26.1.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-backport-libatomic-issue-patch.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-backport-libatomic-issue-patch.patch
deleted file mode 100644
index 7ac605fb65..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-backport-libatomic-issue-patch.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From f8c802aa778804f02b30a191cd3bcce285023076 Mon Sep 17 00:00:00 2001
-From: Lei Maohui <leimaohui@fujitsu.com>
-Date: Wed, 2 Apr 2025 09:47:41 +0000
-Subject: [PATCH] backport libatomic issue patch
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8637/commits?commit_id=f2b5c0b6020b50f5173e449b45a6f7a7be31c48f]
-
-Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
----
- gst-libs/gst/cuda/meson.build | 15 ++++++---------
- 1 file changed, 6 insertions(+), 9 deletions(-)
-
-diff --git a/gst-libs/gst/cuda/meson.build b/gst-libs/gst/cuda/meson.build
-index 3a25244..50ae027 100644
---- a/gst-libs/gst/cuda/meson.build
-+++ b/gst-libs/gst/cuda/meson.build
-@@ -48,15 +48,12 @@ if host_system not in ['windows', 'linux']
-   subdir_done()
- endif
- 
--# Linux ARM would need -latomic for std::atomic<int64_t>
--if host_system == 'linux' and host_machine.cpu_family() in ['aarch64', 'arm']
--  libatomic_dep = cxx.find_library('atomic', required: get_option('cuda-nvmm'))
--  if not libatomic_dep.found()
--    subdir_done()
--  endif
--
--  gstcuda_platform_dep += [libatomic_dep]
--endif
-+# Check for libatomic for use of C11 atomics: some architectures need
-+# to link explicitly to this library.
-+# TODO: Once meson 1.7 is in use, this can be updated to
-+# dependency('atomic')
-+atomic_dep = cxx.find_library('atomic', required: false)
-+gstcuda_platform_dep += [atomic_dep]
- 
- cuda_win32_headers = [
-   'initguid.h',
--- 
-2.43.0
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
index 4dd9febbf6..c599d4b269 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
@@ -1,4 +1,4 @@
-From 9456674cea4a933d5fbc24230d307fe0f52588f3 Mon Sep 17 00:00:00 2001
+From 25d3ecf123388be77b75427d8a7674e1a324439d Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 26 Jan 2016 15:16:01 -0800
 Subject: [PATCH] fix maybe-uninitialized warnings when compiling with -Os
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
index e6ae7f4bfe..c2766d465f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
@@ -1,4 +1,4 @@
-From dd2b92fb70fed2799809c423fea79221a3e17108 Mon Sep 17 00:00:00 2001
+From 9e3fe2bc87702350beb35321e6f2fe69ae205d90 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Wed, 3 Feb 2016 18:05:41 -0800
 Subject: [PATCH] avoid including <sys/poll.h> directly
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
index d49cf5bd89..342ba0e149 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
@@ -1,4 +1,4 @@
-From 11a08e3f3135b649b68714c77670c37559f3a33c Mon Sep 17 00:00:00 2001
+From fe1a9ff5e950a3306a1cdc301f4ab9d77f66be06 Mon Sep 17 00:00:00 2001
 From: Andrey Zhizhikin <andrey.z@gmail.com>
 Date: Mon, 27 Jan 2020 10:22:35 +0000
 Subject: [PATCH] opencv: resolve missing opencv data dir in yocto build
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.1.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.1.bb
index 2e409558d1..a68e9306a5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.1.bb
@@ -9,9 +9,8 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch \
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
-           file://0001-backport-libatomic-issue-patch.patch \
            "
-SRC_URI[sha256sum] = "f8287a84c5f66368a5a50da5f969994a02c47f20220ffe1ca3154193e65af216"
+SRC_URI[sha256sum] = "9b8415b1bb3726a499578fb39907952981716643f660215fe68628fbd8629197"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
index 7373bd3e26..fbca1686b8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
@@ -1,4 +1,4 @@
-From bd1436f0027bb09cdcf90386910a497422d9a871 Mon Sep 17 00:00:00 2001
+From b05ecd1691adea96cada51a1d46b8c28dfb762db Mon Sep 17 00:00:00 2001
 From: zhouming <b42586@freescale.com>
 Date: Wed, 14 May 2014 10:16:20 +0800
 Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-gstreamer1.0-plugins-base-Fix-atomic-64-issue-on-arm.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-gstreamer1.0-plugins-base-Fix-atomic-64-issue-on-arm.patch
deleted file mode 100644
index 437409854f..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-gstreamer1.0-plugins-base-Fix-atomic-64-issue-on-arm.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 677a40c1f5b0793598a92cbba0a621fef89c4a26 Mon Sep 17 00:00:00 2001
-From: Lei Maohui <leimaohui@fujitsu.com>
-Date: Wed, 2 Apr 2025 09:37:24 +0000
-Subject: [PATCH] gstreamer1.0-plugins-base: Fix atomic 64 issue on armv5
-
-| /mnt/test/build_auh/tmp/work/armv5e-poky-linux-gnueabi/gstreamer1.0-plugins-base/1.26.0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/14.2.0/ld: gst-libs/gst/audio/libgstaudio-1.0.so.0.2600.0.p/gstaudioringbuffer.c.o: in function `gst_atomic_uint64_get':
-| /usr/src/debug/gstreamer1.0-plugins-base/1.26.0/gst-libs/gst/audio/gstaudioringbuffer.c:72:(.text+0x4e00): undefined reference to `__atomic_load_8'
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8637/commits?commit_id=f2b5c0b6020b50f5173e449b45a6f7a7be31c48f]
-
-Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
----
- gst-libs/gst/audio/meson.build | 2 +-
- meson.build                    | 9 +++++++++
- 2 files changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/gst-libs/gst/audio/meson.build b/gst-libs/gst/audio/meson.build
-index 1d69713..cf8935b 100644
---- a/gst-libs/gst/audio/meson.build
-+++ b/gst-libs/gst/audio/meson.build
-@@ -162,7 +162,7 @@ gstaudio = library('gstaudio-@0@'.format(api_version),
-   soversion : soversion,
-   darwin_versions : osxversion,
-   install : true,
--  dependencies : gstaudio_deps,
-+  dependencies : [ gstaudio_deps, base_platform_dep ],
- )
- pkg_name = 'gstreamer-audio-1.0'
- pkgconfig.generate(gstaudio,
-diff --git a/meson.build b/meson.build
-index a470af0..c195376 100644
---- a/meson.build
-+++ b/meson.build
-@@ -398,6 +398,15 @@ else
-   core_conf.set('DISABLE_ORC', 1)
- endif
- 
-+base_platform_dep = []
-+# Check for libatomic for use of C11 atomics: some architectures need
-+# to link explicitly to this library.
-+# TODO: Once meson 1.7 is in use, this can be updated to
-+# dependency('atomic')
-+atomic_dep = cc.find_library('atomic', required: false)
-+
-+base_platform_dep += [atomic_dep]
-+
- # Used to build SSE* things in audio-resampler
- sse_args = '-msse'
- sse2_args = '-msse2'
--- 
-2.43.0
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
index fc9ad474d9..cd44555f99 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
@@ -1,4 +1,4 @@
-From 1cc876662b7707eb5a2f668654f7921b5642e108 Mon Sep 17 00:00:00 2001
+From ac6372c06123bc08a3fb0ac138a50664f1d5f8f3 Mon Sep 17 00:00:00 2001
 From: Mingke Wang <mingke.wang@freescale.com>
 Date: Thu, 19 Mar 2015 14:17:10 +0800
 Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
index 06b5bc41ed..7e2a4638c3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
@@ -1,4 +1,4 @@
-From c0c6944eca0c497477aa9f2cec2c83c4ea7a70e5 Mon Sep 17 00:00:00 2001
+From 233d997f8005f28f2669b9a5e4a3d76801541aa1 Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Tue, 21 May 2019 14:01:11 +0200
 Subject: [PATCH] viv-fb: Make sure config.h is included
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.1.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.1.bb
index afb02f6042..c872c3bcfb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.1.bb
@@ -10,9 +10,8 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch \
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
-           file://0001-gstreamer1.0-plugins-base-Fix-atomic-64-issue-on-arm.patch \
            "
-SRC_URI[sha256sum] = "e23189fbed2ec486690382d1055c19eeaf5aae3e95e2576fc4c884d96a90e69e"
+SRC_URI[sha256sum] = "659553636f84dcf388cad5cf6530e02b0b2d3dc450e76199287ba9db6a6c5226"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.1.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.1.bb
index a2c6426c34..ea1322a5e3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.1.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "9e18f139ef69ad0867c2dfbb8fe1d1736d76df11aac83f60e8d3adb1e2eaf03b"
+SRC_URI[sha256sum] = "fcdcb2f77620a599557b2843d1c6c55c2b660f5fc28222b542847d11d9ca982f"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.1.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.1.bb
index f0e42ad8fb..0d35abf2c6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.1.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "a86b51c8454a813120848c803421f327d8c07aabcae461e0597cc49398c0fcde"
+SRC_URI[sha256sum] = "34d9bcec8e88b008839d8de33fb043ae75eb04e466df74066fd66ee487a8ec4f"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.1.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.1.bb
index fd801c2c62..76f6dac25d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.1.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "e983c039496e3f75e39696554ce74db4120e2465de17aa1cc37160568e9b40bc"
+SRC_URI[sha256sum] = "253fdfec78320c2f67486cd3797a0253c06982c3a8d5160f795b4257fadab301"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.47.1


--===============1845169585981650958==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-plugins-ugly-gstreamer1.0-plugins-bad-g.patch"

RnJvbSA5ZWJkOGJiNTE5ZWQ2YzUwOTMzYzllNGYxZGJiNjM0ODc3ZTZmYjcwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAwNzoxMjoxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIAog
Z3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseSxnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQsZ3N0cmVh
bWVyMS4wLXJ0c3Atc2VydmVyLGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UsZ3N0cmVhbWVyMS4w
LXBsdWdpbnMtZ29vZDoKIHVwZ3JhZGUgMS4yNi4wIC0+IDEuMjYuMSwxLjI2LjAgLT4gMS4yNi4x
LDEuMjYuMCAtPiAxLjI2LjEsMS4yNi4wIC0+CiAxLjI2LjEsMS4yNi4wIC0+IDEuMjYuMQoKLS0t
CiAuLi4vMDAwMS1iYWNrcG9ydC1saWJhdG9taWMtaXNzdWUtcGF0Y2gucGF0Y2ggfCA0MSAtLS0t
LS0tLS0tLS0tLS0KIC4uLmlhbGl6ZWQtd2FybmluZ3Mtd2hlbi1jb21waWxpbmctd2l0aC5wYXRj
aCB8ICAyICstCiAuLi4tYXZvaWQtaW5jbHVkaW5nLXN5cy1wb2xsLmgtZGlyZWN0bHkucGF0Y2gg
fCAgMiArLQogLi4uaXNzaW5nLW9wZW5jdi1kYXRhLWRpci1pbi15b2N0by1idWlsLnBhdGNoIHwg
IDIgKy0KIC4uLi5iYiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWRfMS4yNi4xLmJifSB8ICAz
ICstCiAuLi5ldC1jYXBzLWZyb20tc3JjLXBhZC13aGVuLXF1ZXJ5LWNhcHMucGF0Y2ggfCAgMiAr
LQogLi4uZ2lucy1iYXNlLUZpeC1hdG9taWMtNjQtaXNzdWUtb24tYXJtLnBhdGNoIHwgNTIgLS0t
LS0tLS0tLS0tLS0tLS0tLQogLi4ucGFyc2UtZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1wYXJzaW5n
LnBhdGNoIHwgIDIgKy0KIC4uLml2LWZiLU1ha2Utc3VyZS1jb25maWcuaC1pcy1pbmNsdWRlZC5w
YXRjaCB8ICAyICstCiAuLi5iYiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjYuMS5i
Yn0gfCAgMyArLQogLi4uYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjI2LjEuYmJ9
IHwgIDIgKy0KIC4uLmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4yNi4xLmJifSB8
ICAyICstCiAuLi4uYmIgPT4gZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjYuMS5iYn0gfCAg
MiArLQogMTMgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTA2IGRlbGV0aW9ucygt
KQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9n
c3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwMS1iYWNrcG9ydC1saWJhdG9taWMtaXNzdWUtcGF0
Y2gucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJl
YW1lcjEuMC1wbHVnaW5zLWJhZF8xLjI2LjAuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFk
XzEuMjYuMS5iYn0gKDk4JSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtbXVsdGlt
ZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAxLWdzdHJlYW1lcjEu
MC1wbHVnaW5zLWJhc2UtRml4LWF0b21pYy02NC1pc3N1ZS1vbi1hcm0ucGF0Y2gKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJh
c2VfMS4yNi4wLmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2VfMS4yNi4xLmJifSAoOTYl
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4w
LXBsdWdpbnMtZ29vZF8xLjI2LjAuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjI2
LjEuYmJ9ICg5NyUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tn
c3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjYuMC5iYiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lu
cy11Z2x5XzEuMjYuMS5iYn0gKDk0JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9n
c3RyZWFtZXIve2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjI2LjAuYmIgPT4gZ3N0cmVhbWVy
MS4wLXJ0c3Atc2VydmVyXzEuMjYuMS5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLzAwMDEtYmFj
a3BvcnQtbGliYXRvbWljLWlzc3VlLXBhdGNoLnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDAxLWJhY2twb3J0LWxpYmF0
b21pYy1pc3N1ZS1wYXRjaC5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggN2Fj
NjA1ZmI2NS4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLzAwMDEtYmFja3BvcnQtbGliYXRvbWljLWlzc3Vl
LXBhdGNoLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNDEgKzAsMCBAQAotRnJvbSBmOGM4MDJh
YTc3ODgwNGYwMmIzMGExOTFjZDNiY2NlMjg1MDIzMDc2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQotRnJvbTogTGVpIE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0c3UuY29tPgotRGF0ZTogV2VkLCAy
IEFwciAyMDI1IDA5OjQ3OjQxICswMDAwCi1TdWJqZWN0OiBbUEFUQ0hdIGJhY2twb3J0IGxpYmF0
b21pYyBpc3N1ZSBwYXRjaAotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dp
dGxhYi5mcmVlZGVza3RvcC5vcmcvZ3N0cmVhbWVyL2dzdHJlYW1lci8tL21lcmdlX3JlcXVlc3Rz
Lzg2MzcvY29tbWl0cz9jb21taXRfaWQ9ZjJiNWMwYjYwMjBiNTBmNTE3M2U0NDliNDVhNmY3YTdi
ZTMxYzQ4Zl0KLQotU2lnbmVkLW9mZi1ieTogTGVpIE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0c3Uu
Y29tPgotLS0tCi0gZ3N0LWxpYnMvZ3N0L2N1ZGEvbWVzb24uYnVpbGQgfCAxNSArKysrKystLS0t
LS0tLS0KLSAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQot
Ci1kaWZmIC0tZ2l0IGEvZ3N0LWxpYnMvZ3N0L2N1ZGEvbWVzb24uYnVpbGQgYi9nc3QtbGlicy9n
c3QvY3VkYS9tZXNvbi5idWlsZAotaW5kZXggM2EyNTI0NC4uNTBhZTAyNyAxMDA2NDQKLS0tLSBh
L2dzdC1saWJzL2dzdC9jdWRhL21lc29uLmJ1aWxkCi0rKysgYi9nc3QtbGlicy9nc3QvY3VkYS9t
ZXNvbi5idWlsZAotQEAgLTQ4LDE1ICs0OCwxMiBAQCBpZiBob3N0X3N5c3RlbSBub3QgaW4gWyd3
aW5kb3dzJywgJ2xpbnV4J10KLSAgIHN1YmRpcl9kb25lKCkKLSBlbmRpZgotIAotLSMgTGludXgg
QVJNIHdvdWxkIG5lZWQgLWxhdG9taWMgZm9yIHN0ZDo6YXRvbWljPGludDY0X3Q+Ci0taWYgaG9z
dF9zeXN0ZW0gPT0gJ2xpbnV4JyBhbmQgaG9zdF9tYWNoaW5lLmNwdV9mYW1pbHkoKSBpbiBbJ2Fh
cmNoNjQnLCAnYXJtJ10KLS0gIGxpYmF0b21pY19kZXAgPSBjeHguZmluZF9saWJyYXJ5KCdhdG9t
aWMnLCByZXF1aXJlZDogZ2V0X29wdGlvbignY3VkYS1udm1tJykpCi0tICBpZiBub3QgbGliYXRv
bWljX2RlcC5mb3VuZCgpCi0tICAgIHN1YmRpcl9kb25lKCkKLS0gIGVuZGlmCi0tCi0tICBnc3Rj
dWRhX3BsYXRmb3JtX2RlcCArPSBbbGliYXRvbWljX2RlcF0KLS1lbmRpZgotKyMgQ2hlY2sgZm9y
IGxpYmF0b21pYyBmb3IgdXNlIG9mIEMxMSBhdG9taWNzOiBzb21lIGFyY2hpdGVjdHVyZXMgbmVl
ZAotKyMgdG8gbGluayBleHBsaWNpdGx5IHRvIHRoaXMgbGlicmFyeS4KLSsjIFRPRE86IE9uY2Ug
bWVzb24gMS43IGlzIGluIHVzZSwgdGhpcyBjYW4gYmUgdXBkYXRlZCB0bwotKyMgZGVwZW5kZW5j
eSgnYXRvbWljJykKLSthdG9taWNfZGVwID0gY3h4LmZpbmRfbGlicmFyeSgnYXRvbWljJywgcmVx
dWlyZWQ6IGZhbHNlKQotK2dzdGN1ZGFfcGxhdGZvcm1fZGVwICs9IFthdG9taWNfZGVwXQotIAot
IGN1ZGFfd2luMzJfaGVhZGVycyA9IFsKLSAgICdpbml0Z3VpZC5oJywKLS0tIAotMi40My4wCi0K
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtcGx1Z2lucy1iYWQvMDAwMS1maXgtbWF5YmUtdW5pbml0aWFsaXplZC13YXJuaW5ncy13aGVu
LWNvbXBpbGluZy13aXRoLnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDAxLWZpeC1tYXliZS11bmluaXRpYWxpemVkLXdh
cm5pbmdzLXdoZW4tY29tcGlsaW5nLXdpdGgucGF0Y2gKaW5kZXggNGRkOWZlYmJmNi4uYzU5OWQ0
YjI2OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJl
YW1lcjEuMC1wbHVnaW5zLWJhZC8wMDAxLWZpeC1tYXliZS11bmluaXRpYWxpemVkLXdhcm5pbmdz
LXdoZW4tY29tcGlsaW5nLXdpdGgucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
Z3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDAxLWZpeC1tYXliZS11bmluaXRp
YWxpemVkLXdhcm5pbmdzLXdoZW4tY29tcGlsaW5nLXdpdGgucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDk0NTY2NzRjZWE0YTkzM2Q1ZmJjMjQyMzBkMzA3ZmUwZjUyNTg4ZjMgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDI1ZDNlY2YxMjMzODhiZTc3Yjc1NDI3ZDhhNzY3NGUxYTMy
NDQzOWQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbmRyZSBNY0N1cmR5IDxhcm1j
Y3VyZHlAZ21haWwuY29tPgogRGF0ZTogVHVlLCAyNiBKYW4gMjAxNiAxNToxNjowMSAtMDgwMAog
U3ViamVjdDogW1BBVENIXSBmaXggbWF5YmUtdW5pbml0aWFsaXplZCB3YXJuaW5ncyB3aGVuIGNv
bXBpbGluZyB3aXRoIC1PcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0
cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDAyLWF2b2lkLWluY2x1ZGluZy1zeXMt
cG9sbC5oLWRpcmVjdGx5LnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDAyLWF2b2lkLWluY2x1ZGluZy1zeXMtcG9sbC5o
LWRpcmVjdGx5LnBhdGNoCmluZGV4IGU2YWU3ZjRiZmUuLmMyNzY2ZDQ2NWYgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1i
YWQvMDAwMi1hdm9pZC1pbmNsdWRpbmctc3lzLXBvbGwuaC1kaXJlY3RseS5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFk
LzAwMDItYXZvaWQtaW5jbHVkaW5nLXN5cy1wb2xsLmgtZGlyZWN0bHkucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIGRkMmI5MmZiNzBmZWQyNzk5ODA5YzQyM2ZlYTc5MjIxYTNlMTcxMDggTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDllM2ZlMmJjODc3MDIzNTBiZWIzNTMyMWU2ZjJm
ZTY5YWUyMDVkOTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbmRyZSBNY0N1cmR5
IDxhcm1jY3VyZHlAZ21haWwuY29tPgogRGF0ZTogV2VkLCAzIEZlYiAyMDE2IDE4OjA1OjQxIC0w
ODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGF2b2lkIGluY2x1ZGluZyA8c3lzL3BvbGwuaD4gZGlyZWN0
bHkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtcGx1Z2lucy1iYWQvMDAwNC1vcGVuY3YtcmVzb2x2ZS1taXNzaW5nLW9wZW5jdi1kYXRh
LWRpci1pbi15b2N0by1idWlsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDA0LW9wZW5jdi1yZXNvbHZlLW1pc3Npbmct
b3BlbmN2LWRhdGEtZGlyLWluLXlvY3RvLWJ1aWwucGF0Y2gKaW5kZXggZDQ5Y2Y1YmQ4OS4uMzQy
YmEwZTE0OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dz
dHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDA0LW9wZW5jdi1yZXNvbHZlLW1pc3Npbmctb3BlbmN2
LWRhdGEtZGlyLWluLXlvY3RvLWJ1aWwucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDA0LW9wZW5jdi1yZXNvbHZl
LW1pc3Npbmctb3BlbmN2LWRhdGEtZGlyLWluLXlvY3RvLWJ1aWwucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIDExYTA4ZTNmMzEzNWI2NDliNjg3MTRjNzc2NzBjMzc1NTlmM2EzM2MgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGZlMWE5ZmY1ZTk1MGEzMzA2YTFjZGMzMDFmNGFiOWQ3
N2Y2NmJlMDYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbmRyZXkgWmhpemhpa2lu
IDxhbmRyZXkuekBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDI3IEphbiAyMDIwIDEwOjIyOjM1ICsw
MDAwCiBTdWJqZWN0OiBbUEFUQ0hdIG9wZW5jdjogcmVzb2x2ZSBtaXNzaW5nIG9wZW5jdiBkYXRh
IGRpciBpbiB5b2N0byBidWlsZApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
Z3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZF8xLjI2LjAuYmIgYi9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkXzEuMjYuMS5i
YgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRp
YS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkXzEuMjYuMC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJh
ZF8xLjI2LjEuYmIKaW5kZXggMmU0MDk1NThkMS4uYTY4ZTkzMDZhNSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZF8x
LjI2LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC1wbHVnaW5zLWJhZF8xLjI2LjEuYmIKQEAgLTksOSArOSw4IEBAIFNSQ19VUkkgPSAiaHR0
cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3QtcGx1Z2lucy1iYWQvZ3N0LXBs
dWdpbnMtYmFkCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWZpeC1tYXliZS11bmluaXRpYWxpemVk
LXdhcm5pbmdzLXdoZW4tY29tcGlsaW5nLXdpdGgucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8v
MDAwMi1hdm9pZC1pbmNsdWRpbmctc3lzLXBvbGwuaC1kaXJlY3RseS5wYXRjaCBcCiAgICAgICAg
ICAgIGZpbGU6Ly8wMDA0LW9wZW5jdi1yZXNvbHZlLW1pc3Npbmctb3BlbmN2LWRhdGEtZGlyLWlu
LXlvY3RvLWJ1aWwucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMS1iYWNrcG9ydC1saWJh
dG9taWMtaXNzdWUtcGF0Y2gucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiZjgyODdhODRjNWY2NjM2OGE1YTUwZGE1Zjk2OTk5NGEwMmM0N2YyMDIyMGZmZTFjYTMx
NTQxOTNlNjVhZjIxNiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5Yjg0MTViMWJiMzcyNmE0OTk1
NzhmYjM5OTA3OTUyOTgxNzE2NjQzZjY2MDIxNWZlNjg2MjhmYmQ4NjI5MTk3IgogCiBTID0gIiR7
V09SS0RJUn0vZ3N0LXBsdWdpbnMtYmFkLSR7UFZ9IgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAxLUVO
R1IwMDMxMjUxNS1nZXQtY2Fwcy1mcm9tLXNyYy1wYWQtd2hlbi1xdWVyeS1jYXBzLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJh
c2UvMDAwMS1FTkdSMDAzMTI1MTUtZ2V0LWNhcHMtZnJvbS1zcmMtcGFkLXdoZW4tcXVlcnktY2Fw
cy5wYXRjaAppbmRleCA3MzczYmQzZTI2Li5mYmNhMTY4NmI4IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAx
LUVOR1IwMDMxMjUxNS1nZXQtY2Fwcy1mcm9tLXNyYy1wYWQtd2hlbi1xdWVyeS1jYXBzLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1
Z2lucy1iYXNlLzAwMDEtRU5HUjAwMzEyNTE1LWdldC1jYXBzLWZyb20tc3JjLXBhZC13aGVuLXF1
ZXJ5LWNhcHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGJkMTQzNmYwMDI3YmIwOWNkY2Y5
MDM4NjkxMGE0OTc0MjJkOWE4NzEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGIwNWVj
ZDE2OTFhZGVhOTZjYWRhNTFhMWQ0NmI4YzI4ZGZiNzYyZGIgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiB6aG91bWluZyA8YjQyNTg2QGZyZWVzY2FsZS5jb20+CiBEYXRlOiBXZWQsIDE0
IE1heSAyMDE0IDEwOjE2OjIwICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIEVOR1IwMDMxMjUxNTog
Z2V0IGNhcHMgZnJvbSBzcmMgcGFkIHdoZW4gcXVlcnkgY2FwcwpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAw
MS1nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLUZpeC1hdG9taWMtNjQtaXNzdWUtb24tYXJtLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVn
aW5zLWJhc2UvMDAwMS1nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLUZpeC1hdG9taWMtNjQtaXNz
dWUtb24tYXJtLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA0Mzc0MDk4NTRm
Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDEtZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS1GaXgt
YXRvbWljLTY0LWlzc3VlLW9uLWFybS5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDUyICswLDAg
QEAKLUZyb20gNjc3YTQwYzFmNWIwNzkzNTk4YTkyY2JiYTBhNjIxZmVmODljNGEyNiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IExlaSBNYW9odWkgPGxlaW1hb2h1aUBmdWppdHN1LmNv
bT4KLURhdGU6IFdlZCwgMiBBcHIgMjAyNSAwOTozNzoyNCArMDAwMAotU3ViamVjdDogW1BBVENI
XSBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlOiBGaXggYXRvbWljIDY0IGlzc3VlIG9uIGFybXY1
Ci0KLXwgL21udC90ZXN0L2J1aWxkX2F1aC90bXAvd29yay9hcm12NWUtcG9reS1saW51eC1nbnVl
YWJpL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UvMS4yNi4wL3JlY2lwZS1zeXNyb290LW5hdGl2
ZS91c3IvYmluL2FybS1wb2t5LWxpbnV4LWdudWVhYmkvLi4vLi4vbGliZXhlYy9hcm0tcG9reS1s
aW51eC1nbnVlYWJpL2djYy9hcm0tcG9reS1saW51eC1nbnVlYWJpLzE0LjIuMC9sZDogZ3N0LWxp
YnMvZ3N0L2F1ZGlvL2xpYmdzdGF1ZGlvLTEuMC5zby4wLjI2MDAuMC5wL2dzdGF1ZGlvcmluZ2J1
ZmZlci5jLm86IGluIGZ1bmN0aW9uIGBnc3RfYXRvbWljX3VpbnQ2NF9nZXQnOgotfCAvdXNyL3Ny
Yy9kZWJ1Zy9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzEuMjYuMC9nc3QtbGlicy9nc3QvYXVk
aW8vZ3N0YXVkaW9yaW5nYnVmZmVyLmM6NzI6KC50ZXh0KzB4NGUwMCk6IHVuZGVmaW5lZCByZWZl
cmVuY2UgdG8gYF9fYXRvbWljX2xvYWRfOCcKLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBb
aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2dzdHJlYW1lci9nc3RyZWFtZXIvLS9tZXJn
ZV9yZXF1ZXN0cy84NjM3L2NvbW1pdHM/Y29tbWl0X2lkPWYyYjVjMGI2MDIwYjUwZjUxNzNlNDQ5
YjQ1YTZmN2E3YmUzMWM0OGZdCi0KLVNpZ25lZC1vZmYtYnk6IExlaSBNYW9odWkgPGxlaW1hb2h1
aUBmdWppdHN1LmNvbT4KLS0tLQotIGdzdC1saWJzL2dzdC9hdWRpby9tZXNvbi5idWlsZCB8IDIg
Ky0KLSBtZXNvbi5idWlsZCAgICAgICAgICAgICAgICAgICAgfCA5ICsrKysrKysrKwotIDIgZmls
ZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0
IGEvZ3N0LWxpYnMvZ3N0L2F1ZGlvL21lc29uLmJ1aWxkIGIvZ3N0LWxpYnMvZ3N0L2F1ZGlvL21l
c29uLmJ1aWxkCi1pbmRleCAxZDY5NzEzLi5jZjg5MzViIDEwMDY0NAotLS0tIGEvZ3N0LWxpYnMv
Z3N0L2F1ZGlvL21lc29uLmJ1aWxkCi0rKysgYi9nc3QtbGlicy9nc3QvYXVkaW8vbWVzb24uYnVp
bGQKLUBAIC0xNjIsNyArMTYyLDcgQEAgZ3N0YXVkaW8gPSBsaWJyYXJ5KCdnc3RhdWRpby1AMEAn
LmZvcm1hdChhcGlfdmVyc2lvbiksCi0gICBzb3ZlcnNpb24gOiBzb3ZlcnNpb24sCi0gICBkYXJ3
aW5fdmVyc2lvbnMgOiBvc3h2ZXJzaW9uLAotICAgaW5zdGFsbCA6IHRydWUsCi0tICBkZXBlbmRl
bmNpZXMgOiBnc3RhdWRpb19kZXBzLAotKyAgZGVwZW5kZW5jaWVzIDogWyBnc3RhdWRpb19kZXBz
LCBiYXNlX3BsYXRmb3JtX2RlcCBdLAotICkKLSBwa2dfbmFtZSA9ICdnc3RyZWFtZXItYXVkaW8t
MS4wJwotIHBrZ2NvbmZpZy5nZW5lcmF0ZShnc3RhdWRpbywKLWRpZmYgLS1naXQgYS9tZXNvbi5i
dWlsZCBiL21lc29uLmJ1aWxkCi1pbmRleCBhNDcwYWYwLi5jMTk1Mzc2IDEwMDY0NAotLS0tIGEv
bWVzb24uYnVpbGQKLSsrKyBiL21lc29uLmJ1aWxkCi1AQCAtMzk4LDYgKzM5OCwxNSBAQCBlbHNl
Ci0gICBjb3JlX2NvbmYuc2V0KCdESVNBQkxFX09SQycsIDEpCi0gZW5kaWYKLSAKLStiYXNlX3Bs
YXRmb3JtX2RlcCA9IFtdCi0rIyBDaGVjayBmb3IgbGliYXRvbWljIGZvciB1c2Ugb2YgQzExIGF0
b21pY3M6IHNvbWUgYXJjaGl0ZWN0dXJlcyBuZWVkCi0rIyB0byBsaW5rIGV4cGxpY2l0bHkgdG8g
dGhpcyBsaWJyYXJ5LgotKyMgVE9ETzogT25jZSBtZXNvbiAxLjcgaXMgaW4gdXNlLCB0aGlzIGNh
biBiZSB1cGRhdGVkIHRvCi0rIyBkZXBlbmRlbmN5KCdhdG9taWMnKQotK2F0b21pY19kZXAgPSBj
Yy5maW5kX2xpYnJhcnkoJ2F0b21pYycsIHJlcXVpcmVkOiBmYWxzZSkKLSsKLStiYXNlX3BsYXRm
b3JtX2RlcCArPSBbYXRvbWljX2RlcF0KLSsKLSAjIFVzZWQgdG8gYnVpbGQgU1NFKiB0aGluZ3Mg
aW4gYXVkaW8tcmVzYW1wbGVyCi0gc3NlX2FyZ3MgPSAnLW1zc2UnCi0gc3NlMl9hcmdzID0gJy1t
c3NlMicKLS0tIAotMi40My4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDItc3NhcGFyc2UtZW5oYW5j
ZS1TU0EtdGV4dC1saW5lcy1wYXJzaW5nLnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
Z3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAwMi1zc2FwYXJzZS1lbmhhbmNl
LVNTQS10ZXh0LWxpbmVzLXBhcnNpbmcucGF0Y2gKaW5kZXggZmM5YWQ0NzRkOS4uY2Q0NDU1NWY5
OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC1wbHVnaW5zLWJhc2UvMDAwMi1zc2FwYXJzZS1lbmhhbmNlLVNTQS10ZXh0LWxpbmVzLXBh
cnNpbmcucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJl
YW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAwMi1zc2FwYXJzZS1lbmhhbmNlLVNTQS10ZXh0LWxpbmVz
LXBhcnNpbmcucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDFjYzg3NjY2MmI3NzA3ZWI1YTJm
NjY4NjU0Zjc5MjFiNTY0MmUxMDggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGFjNjM3
MmMwNjEyM2JjMDhhM2ZiMGFjMTM4YTUwNjY0ZjFkNWY4ZjMgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBNaW5na2UgV2FuZyA8bWluZ2tlLndhbmdAZnJlZXNjYWxlLmNvbT4KIERhdGU6
IFRodSwgMTkgTWFyIDIwMTUgMTQ6MTc6MTAgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gc3NhcGFy
c2U6IGVuaGFuY2UgU1NBIHRleHQgbGluZXMgcGFyc2luZy4KZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDMt
dml2LWZiLU1ha2Utc3VyZS1jb25maWcuaC1pcy1pbmNsdWRlZC5wYXRjaCBiL21ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDMtdml2
LWZiLU1ha2Utc3VyZS1jb25maWcuaC1pcy1pbmNsdWRlZC5wYXRjaAppbmRleCAwNmI1YmM0MWVk
Li43ZTJhNDYzOGMzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAzLXZpdi1mYi1NYWtlLXN1cmUtY29uZmln
LmgtaXMtaW5jbHVkZWQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAwMy12aXYtZmItTWFrZS1zdXJlLWNvbmZp
Zy5oLWlzLWluY2x1ZGVkLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjMGM2OTQ0ZWNhMGM0
OTc0NzdhYTlmMmNlYzJjODNjNGVhN2E3MGU1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSAyMzNkOTk3ZjgwMDVmMjhmMjY2OWI5YTVlNGEzZDc2ODAxNTQxYWExIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogQ2FybG9zIFJhZmFlbCBHaWFuaSA8Y3JnNzQ3NUBtYWlsYm94Lm9y
Zz4KIERhdGU6IFR1ZSwgMjEgTWF5IDIwMTkgMTQ6MDE6MTEgKzAyMDAKIFN1YmplY3Q6IFtQQVRD
SF0gdml2LWZiOiBNYWtlIHN1cmUgY29uZmlnLmggaXMgaW5jbHVkZWQKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNl
XzEuMjYuMC5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtcGx1Z2lucy1iYXNlXzEuMjYuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMt
YmFzZV8xLjI2LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjYuMS5iYgppbmRleCBhZmIwMmY2MDQyLi5j
ODcyYzNiY2ZiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIv
Z3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZV8xLjI2LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2VfMS4yNi4xLmJiCkBA
IC0xMCw5ICsxMCw4IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Au
b3JnL3NyYy9nc3QtcGx1Z2lucy1iYXNlL2dzdC1wbHVnaW5zLWJhCiAgICAgICAgICAgIGZpbGU6
Ly8wMDAxLUVOR1IwMDMxMjUxNS1nZXQtY2Fwcy1mcm9tLXNyYy1wYWQtd2hlbi1xdWVyeS1jYXBz
LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDMtdml2LWZiLU1ha2Utc3VyZS1jb25maWcu
aC1pcy1pbmNsdWRlZC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAyLXNzYXBhcnNlLWVu
aGFuY2UtU1NBLXRleHQtbGluZXMtcGFyc2luZy5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8w
MDAxLWdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UtRml4LWF0b21pYy02NC1pc3N1ZS1vbi1hcm0u
cGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZTIzMTg5ZmJlZDJl
YzQ4NjY5MDM4MmQxMDU1YzE5ZWVhZjVhYWUzZTk1ZTI1NzZmYzRjODg0ZDk2YTkwZTY5ZSIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICI2NTk1NTM2MzZmODRkY2YzODhjYWQ1Y2Y2NTMwZTAyYjBiMmQz
ZGM0NTBlNzYxOTkyODdiYTlkYjZhNmM1MjI2IgogCiBTID0gIiR7V09SS0RJUn0vZ3N0LXBsdWdp
bnMtYmFzZS0ke1BWfSIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0
cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yNi4wLmJiIGIvbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yNi4xLmJi
CnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEuMjYuMC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdv
b2RfMS4yNi4xLmJiCmluZGV4IGEyYzY0MjZjMzQuLmVhMTMyMmE1ZTMgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29k
XzEuMjYuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLXBsdWdpbnMtZ29vZF8xLjI2LjEuYmIKQEAgLTYsNyArNiw3IEBAIEJVR1RSQUNLRVIg
PSAiaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2dzdHJlYW1lci9nc3QtcGx1Z2lucy1n
b29kLy0vaXNzdWVzCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Au
b3JnL3NyYy9nc3QtcGx1Z2lucy1nb29kL2dzdC1wbHVnaW5zLWdvb2QtJHtQVn0udGFyLnh6Igog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOWUxOGYxMzllZjY5YWQwODY3YzJkZmJiOGZlMWQxNzM2
ZDc2ZGYxMWFhYzgzZjYwZThkM2FkYjFlMmVhZjAzYiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJm
Y2RjYjJmNzc2MjBhNTk5NTU3YjI4NDNkMWM2YzU1YzJiNjYwZjVmYzI4MjIyYjU0Mjg0N2QxMWQ5
Y2E5ODJmIgogCiBTID0gIiR7V09SS0RJUn0vZ3N0LXBsdWdpbnMtZ29vZC0ke1BWfSIKIApkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1w
bHVnaW5zLXVnbHlfMS4yNi4wLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4yNi4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtcGx1Z2lucy11Z2x5XzEuMjYuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4yNi4xLmJiCmluZGV4IGYw
ZTQyYWQ4ZmIuLjBkMzVhYmYyYzYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjYuMC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8x
LjI2LjEuYmIKQEAgLTE1LDcgKzE1LDcgQEAgU1JDX1VSSSA9ICIgXAogICAgICAgICAgICAgaHR0
cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3QtcGx1Z2lucy11Z2x5L2dzdC1w
bHVnaW5zLXVnbHktJHtQVn0udGFyLnh6IFwKICAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImE4NmI1MWM4NDU0YTgxMzEyMDg0OGM4MDM0MjFmMzI3ZDhjMDdhYWJjYWU0NjFl
MDU5N2NjNDkzOThjMGZjZGUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzRkOWJjZWM4ZTg4YjAw
ODgzOWQ4ZGUzM2ZiMDQzYWU3NWViMDRlNDY2ZGY3NDA2NmZkNjZlZTQ4N2E4ZWM0ZiIKIAogUyA9
ICIke1dPUktESVJ9L2dzdC1wbHVnaW5zLXVnbHktJHtQVn0iCiAKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4y
Ni4wLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1y
dHNwLXNlcnZlcl8xLjI2LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8x
LjI2LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yNi4xLmJiCmluZGV4IGZkODAxYzJjNjIuLjc2ZjZkYWMy
NWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yNi4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yNi4xLmJiCkBAIC0xMCw3ICsx
MCw3IEBAIFBOUkVBTCA9ICJnc3QtcnRzcC1zZXJ2ZXIiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9n
c3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy8ke1BOUkVBTH0vJHtQTlJFQUx9LSR7UFZ9LnRh
ci54eiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImU5ODNjMDM5NDk2ZTNmNzVlMzk2OTY1NTRj
ZTc0ZGI0MTIwZTI0NjVkZTE3YWExY2MzNzE2MDU2OGU5YjQwYmMiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMjUzZmRmZWM3ODMyMGMyZjY3NDg2Y2QzNzk3YTAyNTNjMDY5ODJjM2E4ZDUxNjBmNzk1
YjQyNTdmYWRhYjMwMSIKIAogUyA9ICIke1dPUktESVJ9LyR7UE5SRUFMfS0ke1BWfSIKIAotLSAK
Mi40Ny4xCgo=

--===============1845169585981650958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 928 .bb files complete (0 cached, 928 parsed). 1898 targets, 50 skipped, 0 masked, 0 errors.
Removing 144 recipes from the core2-64 sysroot...done.
Removing 143 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f2983217e2b0d35c4bf54e077080d18e51474f1a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1138 Local 981 Mirrors 0 Missed 157 Current 435 (86% match, 90% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch allarch...done.
Removing 9 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 458 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 460 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 463 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 476 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 557 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 614 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 615 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 616 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 620 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 621 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.65.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 624 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 627 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 632 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 635 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 638 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/lame/lame_3.100.bb:do_create_spdx_setscene)
NOTE: Running setscene task 640 of 1573 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo-c_0.10.5+cargo-0.83.0.bb:do_create_spdx_setscene)
NOTE: recipe libwebp-1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.26.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe taglib-2.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.26.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe gstreamer1.0-plugins-good-1.26.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe nghttp2-1.65.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe speex-1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe lame-3.100-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.26.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.26.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe taglib-2.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.26.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nghttp2-1.65.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lame-3.100-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe iso-codes-4.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 652 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.41.bb:do_create_spdx_setscene)
NOTE: Running setscene task 655 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 656 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 657 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.85.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 663 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 664 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 666 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 668 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 671 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 672 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 673 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 680 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_create_spdx_setscene)
NOTE: Running setscene task 682 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/lame/lame_3.100.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 683 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_20.1.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 686 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.85.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe speex-1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lame-3.100-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe taglib-2.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe llvm-20.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe cargo-c-native-0.10.5+cargo-0.83.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sbc-2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libstd-rs-1.85.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe orc-0.4.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 687 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_create_spdx_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 688 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_create_spdx_setscene)
NOTE: recipe llvm-20.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 689 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 691 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 692 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 693 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 694 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_create_spdx_setscene)
NOTE: Running setscene task 698 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_create_spdx_setscene)
NOTE: Running setscene task 700 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 701 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_create_spdx_setscene)
NOTE: recipe libwebp-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lame-3.100-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 702 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx_setscene)
NOTE: recipe cargo-c-native-0.10.5+cargo-0.83.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe taglib-2.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 706 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.7.9-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 707 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_create_spdx_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 708 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 710 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.309.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 715 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 716 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.309.0.bb:do_create_spdx_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libarchive-3.7.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 717 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libwebp-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-1.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 722 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 726 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/lame/lame_3.100.bb:do_packagedata_setscene)
NOTE: Running setscene task 727 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 728 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 729 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 730 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 731 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 732 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 733 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 735 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.65.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe lame-3.100-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe taglib-2.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 736 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_create_spdx_setscene)
NOTE: recipe libwebp-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 737 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.41.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 738 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_create_spdx_setscene)
NOTE: recipe speex-1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nghttp2-1.65.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.59.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lame-3.100-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe taglib-2.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 742 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 744 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.85.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 745 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 749 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 751 of 1573 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.85.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 753 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 754 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_create_spdx_setscene)
NOTE: recipe orc-0.4.41-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 755 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 757 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe speex-1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 760 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 761 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: recipe librsvg-2.59.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 762 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 765 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_spdx_setscene)
NOTE: recipe libusb1-1.0.28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libstd-rs-1.85.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nghttp2-1.65.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-76-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 766 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 767 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe cargo-native-1.85.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 770 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 773 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe icu-76-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 774 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_create_spdx_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 775 of 1573 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo-c_0.10.5+cargo-0.83.0.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.44.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 778 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 779 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.41.bb:do_packagedata_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cargo-native-1.85.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 782 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.85.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 783 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 784 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.17.0.bb:do_packagedata_setscene)
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 786 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.65.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 787 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.85.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 788 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_create_spdx_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mpg123-1.32.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 791 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_create_spdx_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nghttp2-1.65.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libstd-rs-1.85.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 793 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe mpg123-1.32.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 796 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 797 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 798 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 799 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 800 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 801 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe orc-0.4.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe file-5.46-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nghttp2-1.65.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe mpg123-1.32.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe utfcpp-4.0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 804 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx_setscene)
NOTE: recipe libsoup-3.6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cargo-c-native-0.10.5+cargo-0.83.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 805 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 807 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 808 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpg123-1.32.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 810 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsoup-3.6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_create_spdx_setscene)
NOTE: Running setscene task 815 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 819 of 1573 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.85.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 820 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 824 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 827 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 829 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe utfcpp-4.0.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 831 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe utfcpp-4.0.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 833 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-34.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe rust-native-1.85.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe taglib-2.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 835 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_create_spdx_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 837 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe utfcpp-4.0.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe taglib-2.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rust-native-1.85.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 840 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 841 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe librsvg-2.59.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 842 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.28.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 847 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 854 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 856 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 859 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.85.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 861 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: recipe curl-8.12.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 864 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 866 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_create_spdx_setscene)
NOTE: recipe pango-1.56.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe librsvg-2.59.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 868 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe speex-1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.28-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 870 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe iso-codes-4.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.56.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 871 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/lame/lame_3.100.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 872 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 873 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.3.bb:do_recipe_qa_setscene)
NOTE: recipe speex-1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libusb1-1.0.28-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 877 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.41.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 880 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 883 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 885 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lame-3.100-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsoup-3.6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pulseaudio-17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 890 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 891 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 893 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 894 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 895 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 896 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_create_spdx_setscene)
NOTE: recipe pango-1.56.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cargo-c-native-0.10.5+cargo-0.83.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 897 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_packagedata_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwebp-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 898 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lame-3.100-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsoup-3.6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pulseaudio-17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 899 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pango-1.56.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 902 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 904 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libwebp-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 908 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 910 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 911 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 914 of 1573 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.85.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 915 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 918 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 920 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.26.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 922 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.309.0.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 923 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 925 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 928 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.65.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 929 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 930 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 931 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-1.26.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 932 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.85.1.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cargo-native-1.85.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 934 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 935 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nghttp2-1.65.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 936 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 937 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 938 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_packagedata_setscene)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libstd-rs-1.85.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_25.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 939 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_recipe_qa_setscene)
NOTE: recipe nghttp2-1.65.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 940 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ofono-2.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 945 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_packagedata_setscene)
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.85.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_25.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 948 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 949 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_20.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 950 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_packagedata_setscene)
NOTE: Running setscene task 953 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_create_spdx_setscene)
NOTE: Running setscene task 955 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 956 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 957 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe ofono-2.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 958 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.42-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.26.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 960 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 963 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.6.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe llvm-20.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cargo-native-1.85.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 965 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 966 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-11.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.26.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 967 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 969 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 972 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_create_spdx_setscene)
NOTE: recipe wayland-protocols-1.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 973 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe utfcpp-4.0.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-11.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 975 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_populate_sysroot_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 977 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 978 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 979 of 1573 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.85.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 980 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.309.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe utfcpp-4.0.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 981 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe llvm-20.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 983 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 988 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 989 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 990 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.76.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 992 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.192-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pulseaudio-17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 994 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 995 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 996 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rust-native-1.85.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 997 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ell-0.76-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1000 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1001 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1002 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ell-0.76-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunwind-1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1003 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1004 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_20.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1005 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunwind-1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1009 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_25.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1013 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1016 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1020 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1021 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1022 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1023 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1025 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.16.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe llvm-20.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_25.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1027 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.44.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1028 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_create_spdx_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1029 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1030 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_package_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ofono-2.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ofono-2.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1032 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1035 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1036 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1037 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1040 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.309.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1043 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1044 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1045 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1051 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1052 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.82.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1055 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1056 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1060 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_create_spdx_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-76-1-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rust-native-1.85.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.82-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1062 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1063 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.82-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1065 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.309.0.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1066 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.76.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1069 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.309.0.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1071 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1072 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.44.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1073 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: recipe icu-76-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1075 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_create_spdx_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1078 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1079 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1081 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.4.309.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ell-0.76-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1082 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1084 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ell-0.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1085 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1086 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.309.0.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1087 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe spirv-headers-1_1.4.309.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1092 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1093 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1095 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_package_setscene: Started
NOTE: Running setscene task 1097 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1098 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1099 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1106 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1109 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1110 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_packagedata_setscene)
NOTE: recipe libtool-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1111 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-76-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1113 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1115 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.47-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1116 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1118 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1119 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1121 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1124 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1127 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1128 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1129 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1130 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1131 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1132 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1134 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_packagedata_setscene)
NOTE: recipe icu-76-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1135 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1137 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1138 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1139 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1140 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.82.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1146 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1147 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_recipe_qa_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1149 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1150 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1154 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bluez5-5.82-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1155 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.14-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1157 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1159 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.82-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1160 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1162 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1163 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1164 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1165 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1167 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1168 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1169 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.44.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1171 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1172 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_package_setscene)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1174 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1176 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe icu-76-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1177 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_package_setscene: Started
NOTE: recipe icu-76-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1178 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1180 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1182 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1183 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1186 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1187 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1188 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1190 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 1191 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1194 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1197 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1198 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1199 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1201 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1202 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1203 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1204 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1205 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1207 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1209 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1210 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1211 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1213 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.47-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1214 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1215 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1218 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1221 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1224 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1227 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1228 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1229 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.309.0.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1231 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1233 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe llvm-20.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1235 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1237 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.309.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1238 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1240 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1242 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1243 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1245 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_20.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.4.309.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1247 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1248 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1249 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1251 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1252 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1254 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1256 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe llvm-20.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1257 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1260 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.4.309.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1263 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.309.0.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe llvm-20.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.309.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.309.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1265 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1266 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1270 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1273 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1274 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1276 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1277 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1278 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1279 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1281 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1282 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1284 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1285 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.192-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1286 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1287 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1288 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1289 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1290 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1291 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1292 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 1293 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1294 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1295 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1296 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1297 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1298 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1299 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1301 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1303 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1304 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.7.9-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1305 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1306 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1311 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.192-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1315 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1317 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1319 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1320 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1322 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1323 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_package_setscene)
NOTE: recipe python3-setuptools-78.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1324 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1329 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1330 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1331 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1332 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1333 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1334 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1335 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1336 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_package_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1337 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1339 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1345 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1347 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1348 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1349 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 1350 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1353 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1354 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1356 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1357 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1361 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1362 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1363 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1365 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1366 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1367 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1369 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1371 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1372 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1373 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1375 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1376 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1377 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1378 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1379 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1381 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1382 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1383 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1384 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1386 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1387 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1389 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1390 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1391 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1395 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1396 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1398 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1399 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1400 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1402 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1405 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1406 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1407 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1408 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1412 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1414 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1416 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1417 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1419 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1421 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1423 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1424 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1427 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1428 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1429 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1430 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1431 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1437 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1438 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1439 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1441 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_package_setscene)
NOTE: recipe curl-8.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1442 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1443 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1444 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1445 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1447 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1448 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1450 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_package_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1452 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1453 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1455 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1456 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 1457 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1459 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1460 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1461 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1462 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1464 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1465 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1466 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1468 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1469 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1471 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1477 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1478 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1481 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1482 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.12.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1486 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1487 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1490 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1494 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1495 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1496 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1497 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.12.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1500 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1502 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1503 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1506 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1508 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1509 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1510 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_packagedata_setscene)
NOTE: Running setscene task 1511 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_packagedata_setscene)
NOTE: Running setscene task 1512 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1514 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.75-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.75-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1515 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.75-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1516 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_package_setscene)
NOTE: recipe libcap-2.75-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1518 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1520 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1521 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1522 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.75-r0: task do_package_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1525 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1527 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.75-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1528 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1529 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1530 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.75-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1531 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.75-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1010 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_fetch)
NOTE: Running task 1088 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_write_config)
NOTE: Running task 1103 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_fetch: Started
NOTE: Running task 1115 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_fetch: Succeeded
NOTE: Running task 1125 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_unpack)
NOTE: recipe libcap-2.75-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_write_config: Started
NOTE: recipe libcap-2.75-r0: task do_fetch: Succeeded
NOTE: Running task 1168 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_unpack)
NOTE: recipe libgcrypt-1.11.0-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_write_config: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1193 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_fetch)
NOTE: Running task 1197 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_unpack: Started
NOTE: Running setscene task 1534 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1535 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1536 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.75-r0: task do_unpack: Started
NOTE: Running task 1218 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_fetch)
NOTE: recipe shadow-4.17.3-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_fetch: Succeeded
NOTE: Running task 1256 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_unpack)
NOTE: recipe libcap-2.75-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_fetch: Started
NOTE: recipe dbus-1.16.2-r0: task do_fetch: Succeeded
NOTE: Running task 1300 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_unpack)
NOTE: recipe shadow-4.17.3-r0: task do_unpack: Started
NOTE: Running task 1327 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_fetch)
NOTE: Running task 1330 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_fetch)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1538 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Started
NOTE: recipe elfutils-0.192-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1402 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_write_config)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_fetch: Succeeded
NOTE: Running task 1425 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_unpack)
NOTE: Running task 1434 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_unpack)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1540 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1541 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_unpack: Succeeded
NOTE: Running task 1456 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_patch)
NOTE: recipe dbus-1.16.2-r0: task do_write_config: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1543 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Started
NOTE: recipe dbus-1.16.2-r0: task do_unpack: Succeeded
NOTE: Running task 1464 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_patch)
NOTE: recipe elfutils-0.192-r0: task do_unpack: Started
NOTE: recipe dbus-1.16.2-r0: task do_write_config: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: Running task 1504 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1524 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_fetch)
NOTE: recipe libgcrypt-1.11.0-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_patch: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_fetch: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 1545 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1546 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1547 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.20-r0: task do_fetch: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1548 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1550 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Succeeded
NOTE: Running task 1579 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_fetch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: Running task 1599 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_unpack)
NOTE: Running task 1601 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.0.bb:do_fetch)
NOTE: Running task 1603 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.82.bb:do_fetch)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_fetch: Started
NOTE: recipe vala-0.56.18-r0: task do_fetch: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.26.0-r0: task do_fetch: Started
NOTE: recipe bluez5-5.82-r0: task do_fetch: Started
NOTE: Running task 1647 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.26.0-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.82-r0: task do_fetch: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1684 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_unpack)
NOTE: Running setscene task 1555 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1556 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1558 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.20-r0: task do_unpack: Succeeded
NOTE: Running task 1690 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_patch)
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Started
NOTE: Running task 1704 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.0.bb:do_unpack)
NOTE: Running task 1705 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.82.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_unpack: Started
NOTE: recipe libical-3.0.20-r0: task do_patch: Started
NOTE: recipe shadow-4.17.3-r0: task do_unpack: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Succeeded
NOTE: recipe bluez5-5.82-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.26.0-r0: task do_unpack: Started
NOTE: Running task 1763 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 1563 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1564 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1565 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1805 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_fetch)
NOTE: recipe eudev-3.2.14-r0: task do_patch: Started
NOTE: recipe libical-3.0.20-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_fetch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.26.0-r0: task do_unpack: Succeeded
NOTE: recipe bluez5-5.82-r0: task do_unpack: Succeeded
NOTE: Running task 1928 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.0.bb:do_patch)
NOTE: Running task 1931 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.82.bb:do_patch)
NOTE: Running task 1944 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: recipe vala-0.56.18-r0: task do_unpack: Succeeded
NOTE: Running task 1952 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_patch)
NOTE: recipe eudev-3.2.14-r0: task do_patch: Succeeded
NOTE: Running task 1972 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_generate_toolchain_file)
NOTE: Running task 1974 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: Running task 1981 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.0.bb:do_write_config)
NOTE: recipe gstreamer1.0-1.26.0-r0: task do_patch: Started
NOTE: recipe elfutils-0.192-r0: task do_unpack: Succeeded
NOTE: Running task 1984 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_unpack)
NOTE: recipe bluez5-5.82-r0: task do_patch: Started
NOTE: Running task 1986 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_fetch)
NOTE: recipe vala-0.56.18-r0: task do_patch: Started
NOTE: recipe mesa-2_25.0.2-r0: task do_fetch: Started
NOTE: recipe mesa-2_25.0.2-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: recipe vala-0.56.18-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.26.0-r0: task do_write_config: Started
NOTE: recipe cairo-1.18.4-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_fetch: Started
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_fetch: Succeeded
NOTE: Running task 2050 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.26.0-r0: task do_write_config: Succeeded
NOTE: Running task 2076 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_unpack)
NOTE: recipe bluez5-5.82-r0: task do_patch: Succeeded
NOTE: Running task 2095 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb:do_fetch)
NOTE: Running task 2096 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_fetch)
NOTE: Running task 2116 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_write_config)
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: Running task 2129 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: recipe mesa-2_25.0.2-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_fetch: Started
NOTE: Running task 2150 of 4240 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_install)
NOTE: recipe harfbuzz-11.1.0-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-11.1.0-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.26.0-r0: task do_patch: Succeeded
NOTE: Running task 2170 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.3.bb:do_fetch)
NOTE: Running task 2172 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb:do_unpack)
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: Running task 2173 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_unpack)
NOTE: Running task 2178 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: Running task 2182 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_write_config)
NOTE: recipe cairo-1.18.4-r0: task do_write_config: Succeeded
NOTE: Running task 2189 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.28.bb:do_fetch)
NOTE: Running task 2210 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_fetch)
NOTE: recipe libxft-1_2.3.8-r0: task do_unpack: Started
NOTE: recipe pango-1.56.3-r0: task do_fetch: Started
NOTE: recipe harfbuzz-11.1.0-r0: task do_unpack: Started
NOTE: Running task 2218 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_write_config)
NOTE: recipe pango-1.56.3-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: Running task 2222 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.3.bb:do_unpack)
NOTE: Running task 2229 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.76.bb:do_fetch)
NOTE: recipe mesa-native-2_25.0.2-r0: task do_install: Started
NOTE: recipe libusb1-1.0.28-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_write_config: Started
NOTE: Running task 2235 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb:do_write_config)
NOTE: recipe libusb1-1.0.28-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Started
NOTE: Running task 2241 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.28.bb:do_unpack)
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_unpack: Succeeded
NOTE: Running task 2247 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_patch)
NOTE: recipe ell-0.76-r0: task do_fetch: Started
NOTE: Running task 2248 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_patch)
NOTE: recipe pango-1.56.3-r0: task do_unpack: Started
NOTE: Running task 2249 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack)
NOTE: recipe ell-0.76-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_25.0.2-r0: task do_write_config: Started
NOTE: recipe harfbuzz-11.1.0-r0: task do_write_config: Started
NOTE: Running task 2257 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.1.bb:do_recipe_qa)
NOTE: recipe libusb1-1.0.28-r0: task do_unpack: Started
NOTE: Running task 2266 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.16.bb:do_fetch)
NOTE: Running task 2267 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: recipe harfbuzz-11.1.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_25.0.2-r0: task do_write_config: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_patch: Started
NOTE: Running task 2276 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.76.bb:do_unpack)
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.1-r0: task do_recipe_qa: Started
NOTE: recipe ofono-2.16-r0: task do_fetch: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.28-r0: task do_unpack: Succeeded
NOTE: recipe ofono-2.16-r0: task do_fetch: Succeeded
NOTE: Running task 2294 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.3.bb:do_write_config)
NOTE: Running task 2295 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.28.bb:do_patch)
NOTE: recipe pango-1.56.3-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.76-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1568 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: Running task 2309 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.3.bb:do_patch)
NOTE: Running task 2310 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_patch)
NOTE: recipe pango-1.56.3-r0: task do_write_config: Started
NOTE: recipe libusb1-1.0.28-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_patch: Succeeded
NOTE: Running task 2322 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.16.bb:do_unpack)
NOTE: Running task 2324 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: Running task 2332 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-base-1.26.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ell-0.76-r0: task do_unpack: Succeeded
NOTE: Running task 2340 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.1.bb:do_fetch)
NOTE: recipe pango-1.56.3-r0: task do_write_config: Succeeded
NOTE: Running task 2341 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.76.bb:do_patch)
NOTE: Running task 2342 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_write_config)
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 2349 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Started
NOTE: recipe pango-1.56.3-r0: task do_patch: Started
NOTE: recipe cairo-1.18.4-r0: task do_unpack: Succeeded
NOTE: recipe ofono-2.16-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.28-r0: task do_patch: Succeeded
NOTE: Running task 2355 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Succeeded
NOTE: recipe pango-1.56.3-r0: task do_patch: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.1-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Started
NOTE: recipe ell-0.76-r0: task do_patch: Started
NOTE: Running task 2382 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_fetch)
NOTE: recipe pulseaudio-17.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-native-2_25.0.2-r0: task do_install: Succeeded
NOTE: Running task 2384 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-base-1.26.1-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: Running task 2387 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.1.bb:do_unpack)
NOTE: Running task 2393 of 4240 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot)
NOTE: recipe ell-0.76-r0: task do_patch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_patch: Started
NOTE: Running task 2401 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_unpack)
NOTE: recipe libgudev-238-r0: task do_fetch: Started
NOTE: recipe ofono-2.16-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1570 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.26.1-r0: task do_unpack: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_patch: Succeeded
NOTE: Running setscene task 1572 of 1573 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe pulseaudio-17.0-r0: task do_unpack: Started
NOTE: Running task 2405 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.16.bb:do_patch)
NOTE: recipe librsvg-2.59.2-r0: task do_fetch: Started
NOTE: Running task 2406 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe mesa-native-2_25.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ofono-2.16-r0: task do_patch: Started
NOTE: Running task 2425 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.1.bb:do_write_config)
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: Running task 2430 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ofono-2.16-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.1-r0: task do_unpack: Succeeded
NOTE: Running task 2461 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.1.bb:do_patch)
NOTE: Running task 2462 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_fetch)
NOTE: Running task 2463 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.10.bb:do_fetch)
NOTE: Running task 2478 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-base-1.26.1-r0: task do_write_config: Started
NOTE: recipe harfbuzz-11.1.0-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-238-r0: task do_unpack: Started
NOTE: recipe pulseaudio-17.0-r0: task do_unpack: Succeeded
NOTE: Running task 2480 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb:do_patch)
NOTE: Running task 2481 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_patch)
NOTE: recipe librsvg-2.59.2-r0: task do_fetch: Succeeded
NOTE: Running task 2487 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.26.1-r0: task do_write_config: Succeeded
NOTE: recipe mpg123-1.32.10-r0: task do_fetch: Started
NOTE: recipe libsoup-3.6.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.1-r0: task do_patch: Started
NOTE: recipe mpg123-1.32.10-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-3.6.5-r0: task do_fetch: Succeeded
NOTE: Running task 2501 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.10.bb:do_unpack)
NOTE: Running task 2502 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_unpack)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe harfbuzz-11.1.0-r0: task do_patch: Started
NOTE: recipe libgudev-238-r0: task do_unpack: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_write_config: Started
NOTE: recipe pulseaudio-17.0-r0: task do_patch: Started
NOTE: recipe mpg123-1.32.10-r0: task do_unpack: Started
NOTE: recipe pulseaudio-17.0-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-3.6.5-r0: task do_unpack: Started
NOTE: recipe harfbuzz-11.1.0-r0: task do_patch: Succeeded
NOTE: recipe librsvg-2.59.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.1-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.32.10-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-3.6.5-r0: task do_unpack: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_patch: Succeeded
NOTE: Running task 2756 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3051 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-native-2_25.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3184 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: Running task 3256 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_25.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_25.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 3326 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: recipe libxft-1_2.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3401 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_collect_spdx_deps)
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3402 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3416 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_configure)
NOTE: recipe mesa-2_25.0.2-r0: task do_patch: Started
NOTE: Running task 3428 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.26.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3470 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_patch)
NOTE: Running task 3471 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.10.bb:do_patch)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe eudev-3.2.14-r0: task do_configure: Started
NOTE: Running task 3485 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_write_config)
NOTE: Running task 3489 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_configure)
NOTE: recipe libgudev-238-r0: task do_patch: Started
NOTE: recipe mpg123-1.32.10-r0: task do_patch: Started
NOTE: recipe libsoup-3.6.5-r0: task do_patch: Started
NOTE: Running task 3534 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.1.bb:do_recipe_qa)
NOTE: Running task 3535 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.1.bb:do_recipe_qa)
NOTE: Running task 3536 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.1.bb:do_recipe_qa)
NOTE: Running task 3537 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.1.bb:do_recipe_qa)
NOTE: recipe libgudev-238-r0: task do_write_config: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-3.6.5-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_configure: Started
NOTE: Running task 3539 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_configure)
NOTE: recipe libgudev-238-r0: task do_patch: Succeeded
NOTE: recipe libgudev-238-r0: task do_write_config: Succeeded
NOTE: recipe mpg123-1.32.10-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.26.1-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.26.1-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.1-r0: task do_recipe_qa: Started
NOTE: recipe mesa-2_25.0.2-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.26.1-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3569 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_rust_gen_targets)
NOTE: recipe libxft-1_2.3.8-r0: task do_configure: Started
NOTE: Running task 3610 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_collect_spdx_deps)
NOTE: Running task 3621 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_write_config)
NOTE: Running task 3622 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_write_config)
NOTE: Running task 3651 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_collect_spdx_deps)
NOTE: recipe mesa-2_25.0.2-r0: task do_rust_gen_targets: Started
NOTE: recipe mesa-2_25.0.2-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 3662 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.17.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.26.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.26.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libsoup-3.6.5-r0: task do_write_config: Started
NOTE: Running task 3664 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.1.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-good-1.26.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3665 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.1.bb:do_fetch)
NOTE: recipe libcap-2.75-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsoup-3.6.5-r0: task do_write_config: Succeeded
NOTE: Running task 3666 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.1.bb:do_fetch)
NOTE: recipe eudev-3.2.14-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3667 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.1.bb:do_fetch)
NOTE: recipe librsvg-2.59.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.26.1-r0: task do_fetch: Started
NOTE: recipe libcap-2.75-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.26.1-r0: task do_fetch: Succeeded
NOTE: Running task 3698 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_create_spdx)
NOTE: recipe librsvg-2.59.2-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.26.1-r0: task do_fetch: Started
NOTE: Running task 3699 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.1.bb:do_unpack)
NOTE: Running task 3700 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-good-1.26.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.1-r0: task do_fetch: Started
NOTE: Running task 3703 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.1.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-ugly-1.26.1-r0: task do_fetch: Started
NOTE: recipe eudev-3.2.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.26.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.1-r0: task do_fetch: Succeeded
NOTE: Running task 3706 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.1.bb:do_unpack)
NOTE: Running task 3707 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.1.bb:do_unpack)
NOTE: recipe shadow-4.17.3-r0: task do_create_spdx: Started
NOTE: recipe libcap-2.75-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.26.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-good-1.26.1-r0: task do_unpack: Started
NOTE: Running task 3774 of 4240 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-ugly-1.26.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.26.1-r0: task do_unpack: Succeeded
NOTE: Running task 3800 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.1.bb:do_patch)
NOTE: Running task 3812 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.1.bb:do_write_config)
NOTE: Running task 3813 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.1.bb:do_write_config)
NOTE: Running task 3814 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.1.bb:do_write_config)
NOTE: Running task 3815 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.1.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-ugly-1.26.1-r0: task do_unpack: Succeeded
NOTE: Running task 3816 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.1.bb:do_patch)
NOTE: recipe gstreamer1.0-rtsp-server-1.26.1-r0: task do_patch: Started
NOTE: recipe mesa-2_25.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.26.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-good-1.26.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.26.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.1-r0: task do_write_config: Started
NOTE: recipe mesa-native-2_25.0.2-r0: task do_create_spdx: Started
NOTE: Running task 3817 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_rust_create_wrappers)
NOTE: recipe gstreamer1.0-plugins-good-1.26.1-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.26.1-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.26.1-r0: task do_patch: Started
NOTE: Running task 3818 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.1.bb:do_patch)
NOTE: recipe gstreamer1.0-rtsp-server-1.26.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.26.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.26.1-r0: task do_write_config: Succeeded
NOTE: Running task 3819 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.1-r0: task do_write_config: Succeeded
NOTE: recipe libcap-2.75-r0: task do_create_spdx: Succeeded
NOTE: Running task 3822 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-ugly-1.26.1-r0: task do_patch: Succeeded
NOTE: Running task 3823 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_collect_spdx_deps)
NOTE: Running task 3824 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-good-1.26.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.26.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_25.0.2-r0: task do_rust_create_wrappers: Started
NOTE: recipe gstreamer1.0-plugins-good-1.26.1-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3861 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.11.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.26.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_25.0.2-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.1-r0: task do_unpack: Succeeded
NOTE: Running task 3930 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.26.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-4.17.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3931 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.1.bb:do_patch)
NOTE: recipe mesa-native-2_25.0.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.26.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3932 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-ugly-1.26.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.1-r0: task do_patch: Started
NOTE: recipe mesa-2_25.0.2-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-good-1.26.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.1-r0: task do_patch: Succeeded
NOTE: Running task 3933 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3935 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_collect_spdx_deps)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3936 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_create_spdx)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_create_spdx: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3937 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_collect_spdx_deps)
NOTE: recipe elfutils-0.192-r0: task do_collect_spdx_deps: Started
NOTE: recipe elfutils-0.192-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3938 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_create_spdx)
NOTE: recipe elfutils-0.192-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.59.2-r0: task do_unpack: Succeeded
NOTE: Running task 3939 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_patch)
NOTE: recipe librsvg-2.59.2-r0: task do_patch: Started
NOTE: recipe librsvg-2.59.2-r0: task do_patch: Succeeded
NOTE: Running task 3941 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_rust_gen_targets)
NOTE: recipe elfutils-0.192-r0: task do_create_spdx: Succeeded
NOTE: Running task 3942 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.59.2-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.59.2-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe mesa-2_25.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe mesa-2_25.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_configure: Succeeded
NOTE: Running task 3943 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_compile)
NOTE: recipe libxft-1_2.3.8-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_compile: Succeeded
NOTE: Running task 3944 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_install)
NOTE: recipe libxft-1_2.3.8-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_install: Succeeded
NOTE: Running task 3945 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot)
NOTE: Running task 3946 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_package)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_configure: Succeeded
NOTE: Running task 3947 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_compile)
NOTE: recipe eudev-3.2.14-r0: task do_compile: Started
NOTE: recipe mesa-2_25.0.2-r0: task do_configure: Succeeded
NOTE: Running task 3948 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_compile)
NOTE: recipe mesa-2_25.0.2-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_package: Succeeded
NOTE: Running task 3949 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_configure: Succeeded
NOTE: Running task 3950 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3951 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_compile)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_compile: Started
NOTE: recipe eudev-3.2.14-r0: task do_compile: Succeeded
NOTE: Running task 3952 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_install)
NOTE: recipe eudev-3.2.14-r0: task do_install: Started
NOTE: recipe eudev-3.2.14-r0: task do_install: Succeeded
NOTE: Running task 3954 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_package)
NOTE: Running task 3955 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe eudev-3.2.14-r0: task do_package: Started
NOTE: recipe libusb1-1.0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3956 of 4240 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.28.bb:do_configure)
NOTE: recipe libusb1-1.0.28-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata: Failed
NOTE: recipe eudev-3.2.14-r0: task do_package: Succeeded
NOTE: recipe libusb1-1.0.28-r0: task do_configure: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_compile: Succeeded
NOTE: recipe mesa-2_25.0.2-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3956 tasks of which 3788 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250501071010.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250501071010.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libxft/2.3.8/temp/log.do_packagedata.1197733
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: libxft-1_2.3.8-r0 do_packagedata: QA Issue: Package version for package libxft-src went backwards which would break package feeds (from 1:2.3.9-r0 to 1:2.3.8-r0) [version-going-backwards]
ERROR: libxft-1_2.3.8-r0 do_packagedata: QA Issue: Package version for package libxft-dbg went backwards which would break package feeds (from 1:2.3.9-r0 to 1:2.3.8-r0) [version-going-backwards]
ERROR: libxft-1_2.3.8-r0 do_packagedata: QA Issue: Package version for package libxft-staticdev went backwards which would break package feeds (from 1:2.3.9-r0 to 1:2.3.8-r0) [version-going-backwards]
ERROR: libxft-1_2.3.8-r0 do_packagedata: QA Issue: Package version for package libxft-dev went backwards which would break package feeds (from 1:2.3.9-r0 to 1:2.3.8-r0) [version-going-backwards]
ERROR: libxft-1_2.3.8-r0 do_packagedata: QA Issue: Package version for package libxft-doc went backwards which would break package feeds (from 1:2.3.9-r0 to 1:2.3.8-r0) [version-going-backwards]
ERROR: libxft-1_2.3.8-r0 do_packagedata: QA Issue: Package version for package libxft-locale went backwards which would break package feeds (from 1:2.3.9-r0 to 1:2.3.8-r0) [version-going-backwards]
ERROR: libxft-1_2.3.8-r0 do_packagedata: QA Issue: Package version for package libxft went backwards which would break package feeds (from 1:2.3.9-r0 to 1:2.3.8-r0) [version-going-backwards]
ERROR: libxft-1_2.3.8-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libxft/2.3.8/temp/log.do_packagedata.1197733
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata) failed with exit code '1'

--===============1845169585981650958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-accurip: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-accurip: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmdec: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmdec: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmenc: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmenc: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aes: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aes: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aiff: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aiff: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analytics-typelib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analytics-typelib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analyticsoverlay: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analyticsoverlay: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-apps: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-apps: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-asfmux: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-asfmux: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiobuffersplit: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiobuffersplit: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiofxbad: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiofxbad: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiolatency: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiolatency: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiomixmatrix: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiomixmatrix: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiovisualizers: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiovisualizers: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-autoconvert: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-autoconvert: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-badaudio-typelib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-badaudio-typelib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bayer: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bayer: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bluez: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bluez: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bz2: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bz2: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-camerabin: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-camerabin: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-closedcaption: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-closedcaption: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecalpha: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecalpha: PKGSIZE changed from 35480 to 39576 (+12%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecalpha: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecs-typelib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecs-typelib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codectimestamper: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codectimestamper: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-coloreffects: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-coloreffects: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-cuda-typelib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-cuda-typelib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-curl: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-curl: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dash: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dash: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: FILELIST: removed "/usr/lib/.debug/libgstinsertbin-1.0.so.0.2600.0 /usr/lib/.debug/libgstmpegts-1.0.so.0.2600.0 /usr/lib/.debug/libgstvulkan-1.0.so.0.2600.0 /usr/lib/.debug/libgsturidownloader-1.0.so.0.2600.0 /usr/lib/.debug/libgstplay-1.0.so.0.2600.0 /usr/lib/.debug/libgstmse-1.0.so.0.2600.0 /usr/lib/.debug/libgstanalytics-1.0.so.0.2600.0 /usr/lib/.debug/libgstcodecs-1.0.so.0.2600.0 /usr/lib/.debug/libgstphotography-1.0.so.0.2600.0 /usr/lib/.debug/libgstbasecamerabinsrc-1.0.so.0.2600.0 /usr/lib/.debug/libgstwayland-1.0.so.0.2600.0 /usr/lib/.debug/libgstdxva-1.0.so.0.2600.0 /usr/lib/.debug/libgstsctp-1.0.so.0.2600.0 /usr/lib/.debug/libgstwebrtc-1.0.so.0.2600.0 /usr/lib/.debug/libgstcuda-1.0.so.0.2600.0 /usr/lib/.debug/libgstadaptivedemux-1.0.so.0.2600.0 /usr/lib/.debug/libgstbadaudio-1.0.so.0.2600.0 /usr/lib/.debug/libgstplayer-1.0.so.0.2600.0 /usr/lib/.debug/libgstisoff-1.0.so.0.2600.0 /usr/lib/.debu
 g/libgstcodecparsers-1.0.so.0.2600.0", added "/usr/lib/.debug/libgstmpegts-1.0.so.0.2601.0 /usr/lib/.debug/libgstvulkan-1.0.so.0.2601.0 /usr/lib/.debug/libgstinsertbin-1.0.so.0.2601.0 /usr/lib/.debug/libgsturidownloader-1.0.so.0.2601.0 /usr/lib/.debug/libgstanalytics-1.0.so.0.2601.0 /usr/lib/.debug/libgstplay-1.0.so.0.2601.0 /usr/lib/.debug/libgstmse-1.0.so.0.2601.0 /usr/lib/.debug/libgstcodecs-1.0.so.0.2601.0 /usr/lib/.debug/libgstphotography-1.0.so.0.2601.0 /usr/lib/.debug/libgstbasecamerabinsrc-1.0.so.0.2601.0 /usr/lib/.debug/libgstwayland-1.0.so.0.2601.0 /usr/lib/.debug/libgstdxva-1.0.so.0.2601.0 /usr/lib/.debug/libgstwebrtc-1.0.so.0.2601.0 /usr/lib/.debug/libgstsctp-1.0.so.0.2601.0 /usr/lib/.debug/libgstcuda-1.0.so.0.2601.0 /usr/lib/.debug/libgstbadaudio-1.0.so.0.2601.0 /usr/lib/.debug/libgstadaptivedemux-1.0.so.0.2601.0 /usr/lib/.debug/libgstisoff-1.0.so.0.2601.0 /usr/lib/.debug/libgstplayer-1.0.so.0.2601.0 /usr/lib/.debug/libgstcodecparsers-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: PKGSIZE changed from 30959872 to 30979624 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-debugutilsbad: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-debugutilsbad: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-decklink: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-decklink: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dev: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dev: PKGSIZE changed from 3883190 to 3883164 (-0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dev: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-doc: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-doc: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dtls: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dtls: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvb: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvb: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsubenc: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsubenc: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsuboverlay: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsuboverlay: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvdspu: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvdspu: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dxva-typelib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dxva-typelib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-faceoverlay: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-faceoverlay: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fbdevsink: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fbdevsink: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-festival: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-festival: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fieldanalysis: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fieldanalysis: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-freeverb: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-freeverb: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-frei0r: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-frei0r: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gaudieffects: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gaudieffects: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gdp: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gdp: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-geometrictransform: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-geometrictransform: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-glib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-glib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-hls: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-hls: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-id3tag: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-id3tag: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin-typelib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin-typelib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-inter: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-inter: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-interlace: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-interlace: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ipcpipeline: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ipcpipeline: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivfparse: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivfparse: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivtc: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivtc: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jp2kdecimator: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jp2kdecimator: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jpegformat: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jpegformat: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-legacyrawparse: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-legacyrawparse: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-af: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-af: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ast: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ast: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-az: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-az: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-bg: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-bg: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ca: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ca: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-cs: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-cs: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-da: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-da: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-de: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-de: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-el: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-el: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-en-gb: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-en-gb: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eo: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eo: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-es: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-es: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eu: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eu: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fi: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fi: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fr: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fr: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fur: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fur: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-gl: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-gl: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hr: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hr: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hu: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hu: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-id: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-id: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-it: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-it: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ja: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ja: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ka: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ka: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ky: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ky: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lt: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lt: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lv: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lv: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-mt: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-mt: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nb: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nb: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nl: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nl: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-or: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-or: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pl: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pl: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pt-br: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pt-br: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ro: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ro: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ru: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ru: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sk: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sk: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sl: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sl: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sq: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sq: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sr: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sr: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sv: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sv: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-tr: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-tr: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-uk: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-uk: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-vi: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-vi: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-cn: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-cn: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-tw: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-tw: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-meta: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-meta: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-midi: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-midi: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsdemux: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsdemux: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsmux: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsmux: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegts-typelib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegts-typelib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsdemux: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsdemux: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsmux: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsmux: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse-typelib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse-typelib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mxf: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mxf: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-netsim: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-netsim: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pcapparse: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pcapparse: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-play-typelib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-play-typelib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-player-typelib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-player-typelib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pnm: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pnm: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-proxy: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-proxy: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-removesilence: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-removesilence: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rfbsrc: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rfbsrc: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rist: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rist: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rsvg: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rsvg: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtmp2: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtmp2: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtpmanagerbad: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtpmanagerbad: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtponvif: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtponvif: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sbc: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sbc: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sdpelem: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sdpelem: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-segmentclip: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-segmentclip: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-shm: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-shm: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-siren: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-siren: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smooth: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smooth: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smoothstreaming: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smoothstreaming: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sndfile: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sndfile: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-speed: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-speed: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-src: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-src: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-staticdev: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-staticdev: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-subenc: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-subenc: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-switchbin: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-switchbin: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-timecode: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-timecode: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcode: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcode: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcoder-typelib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcoder-typelib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ttmlsubs: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ttmlsubs: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-unixfd: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-unixfd: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvcgadget: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvcgadget: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvch264: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvch264: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videofiltersbad: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videofiltersbad: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoframe-audiolevel: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoframe-audiolevel: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoparsersbad: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoparsersbad: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videosignal: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videosignal: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vmnc: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vmnc: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan-typelib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan-typelib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanwayland-typelib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanwayland-typelib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanxcb-typelib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanxcb-typelib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-waylandsink: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-waylandsink: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webp: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webp: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webrtc-typelib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webrtc-typelib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-y4mdec: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-y4mdec: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.26.0.tar.xz file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch file://0002-avoid-including-sys-poll.h-directly.patch file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch file://0001-backport-libatomic-issue-patch.patch" to "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.26.1.tar.xz file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch file://0002-avoid-including-sys-poll.h-directly.patch file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: FILES: removed "/usr/lib/libgstadaptivedemux-1.0.so.0.2600.0", added "/usr/lib/libgstadaptivedemux-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: FILELIST: removed "/usr/lib/libgstadaptivedemux-1.0.so.0.2600.0", added "/usr/lib/libgstadaptivedemux-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: FILES: removed "/usr/lib/libgstanalytics-1.0.so.0.2600.0", added "/usr/lib/libgstanalytics-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: FILELIST: removed "/usr/lib/libgstanalytics-1.0.so.0.2600.0", added "/usr/lib/libgstanalytics-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: FILES: removed "/usr/lib/libgstbadaudio-1.0.so.0.2600.0", added "/usr/lib/libgstbadaudio-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: FILELIST: removed "/usr/lib/libgstbadaudio-1.0.so.0.2600.0", added "/usr/lib/libgstbadaudio-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: FILES: removed "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2600.0", added "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: FILELIST: removed "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2600.0", added "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: FILES: removed "/usr/lib/libgstcodecparsers-1.0.so.0.2600.0", added "/usr/lib/libgstcodecparsers-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: FILELIST: removed "/usr/lib/libgstcodecparsers-1.0.so.0.2600.0", added "/usr/lib/libgstcodecparsers-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: FILES: removed "/usr/lib/libgstcodecs-1.0.so.0.2600.0", added "/usr/lib/libgstcodecs-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: FILELIST: removed "/usr/lib/libgstcodecs-1.0.so.0.2600.0", added "/usr/lib/libgstcodecs-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: FILES: removed "/usr/lib/libgstcuda-1.0.so.0.2600.0", added "/usr/lib/libgstcuda-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: FILELIST: removed "/usr/lib/libgstcuda-1.0.so.0.2600.0", added "/usr/lib/libgstcuda-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: FILES: removed "/usr/lib/libgstdxva-1.0.so.0.2600.0", added "/usr/lib/libgstdxva-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: FILELIST: removed "/usr/lib/libgstdxva-1.0.so.0.2600.0", added "/usr/lib/libgstdxva-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: FILES: removed "/usr/lib/libgstinsertbin-1.0.so.0.2600.0", added "/usr/lib/libgstinsertbin-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: FILELIST: removed "/usr/lib/libgstinsertbin-1.0.so.0.2600.0", added "/usr/lib/libgstinsertbin-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: FILES: removed "/usr/lib/libgstisoff-1.0.so.0.2600.0", added "/usr/lib/libgstisoff-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: FILELIST: removed "/usr/lib/libgstisoff-1.0.so.0.2600.0", added "/usr/lib/libgstisoff-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: FILES: removed "/usr/lib/libgstmpegts-1.0.so.0.2600.0", added "/usr/lib/libgstmpegts-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: FILELIST: removed "/usr/lib/libgstmpegts-1.0.so.0.2600.0", added "/usr/lib/libgstmpegts-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: FILES: removed "/usr/lib/libgstmse-1.0.so.0.2600.0", added "/usr/lib/libgstmse-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: FILELIST: removed "/usr/lib/libgstmse-1.0.so.0.2600.0", added "/usr/lib/libgstmse-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: PKGSIZE changed from 142169 to 146265 (+3%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: FILES: removed "/usr/lib/libgstphotography-1.0.so.0.2600.0", added "/usr/lib/libgstphotography-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: FILELIST: removed "/usr/lib/libgstphotography-1.0.so.0.2600.0", added "/usr/lib/libgstphotography-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: FILES: removed "/usr/lib/libgstplay-1.0.so.0.2600.0", added "/usr/lib/libgstplay-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: FILELIST: removed "/usr/lib/libgstplay-1.0.so.0.2600.0", added "/usr/lib/libgstplay-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: FILES: removed "/usr/lib/libgstplayer-1.0.so.0.2600.0", added "/usr/lib/libgstplayer-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: FILELIST: removed "/usr/lib/libgstplayer-1.0.so.0.2600.0", added "/usr/lib/libgstplayer-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: FILES: removed "/usr/lib/libgstsctp-1.0.so.0.2600.0", added "/usr/lib/libgstsctp-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: FILELIST: removed "/usr/lib/libgstsctp-1.0.so.0.2600.0", added "/usr/lib/libgstsctp-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsttranscoder-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsttranscoder-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: FILES: removed "/usr/lib/libgsturidownloader-1.0.so.0.2600.0", added "/usr/lib/libgsturidownloader-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: FILELIST: removed "/usr/lib/libgsturidownloader-1.0.so.0.2600.0", added "/usr/lib/libgsturidownloader-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: FILES: removed "/usr/lib/libgstvulkan-1.0.so.0.2600.0", added "/usr/lib/libgstvulkan-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: FILELIST: removed "/usr/lib/libgstvulkan-1.0.so.0.2600.0", added "/usr/lib/libgstvulkan-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: FILES: removed "/usr/lib/libgstwayland-1.0.so.0.2600.0", added "/usr/lib/libgstwayland-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: FILELIST: removed "/usr/lib/libgstwayland-1.0.so.0.2600.0", added "/usr/lib/libgstwayland-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: FILES: removed "/usr/lib/libgstwebrtc-1.0.so.0.2600.0", added "/usr/lib/libgstwebrtc-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: FILELIST: removed "/usr/lib/libgstwebrtc-1.0.so.0.2600.0", added "/usr/lib/libgstwebrtc-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
Changes to packages/core2-64-poky-linux/gstreamer1.0-plugins-bad (sysroot):
  /usr/lib/libgstadaptivedemux-1.0.so.0 changed symlink target from libgstadaptivedemux-1.0.so.0.2600.0 to libgstadaptivedemux-1.0.so.0.2601.0
  /usr/lib/libgstanalytics-1.0.so.0 changed symlink target from libgstanalytics-1.0.so.0.2600.0 to libgstanalytics-1.0.so.0.2601.0
  /usr/lib/libgstbadaudio-1.0.so.0 changed symlink target from libgstbadaudio-1.0.so.0.2600.0 to libgstbadaudio-1.0.so.0.2601.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0 changed symlink target from libgstbasecamerabinsrc-1.0.so.0.2600.0 to libgstbasecamerabinsrc-1.0.so.0.2601.0
  /usr/lib/libgstcodecparsers-1.0.so.0 changed symlink target from libgstcodecparsers-1.0.so.0.2600.0 to libgstcodecparsers-1.0.so.0.2601.0
  /usr/lib/libgstcodecs-1.0.so.0 changed symlink target from libgstcodecs-1.0.so.0.2600.0 to libgstcodecs-1.0.so.0.2601.0
  /usr/lib/libgstcuda-1.0.so.0 changed symlink target from libgstcuda-1.0.so.0.2600.0 to libgstcuda-1.0.so.0.2601.0
  /usr/lib/libgstdxva-1.0.so.0 changed symlink target from libgstdxva-1.0.so.0.2600.0 to libgstdxva-1.0.so.0.2601.0
  /usr/lib/libgstinsertbin-1.0.so.0 changed symlink target from libgstinsertbin-1.0.so.0.2600.0 to libgstinsertbin-1.0.so.0.2601.0
  /usr/lib/libgstisoff-1.0.so.0 changed symlink target from libgstisoff-1.0.so.0.2600.0 to libgstisoff-1.0.so.0.2601.0
  /usr/lib/libgstmpegts-1.0.so.0 changed symlink target from libgstmpegts-1.0.so.0.2600.0 to libgstmpegts-1.0.so.0.2601.0
  /usr/lib/libgstmse-1.0.so.0 changed symlink target from libgstmse-1.0.so.0.2600.0 to libgstmse-1.0.so.0.2601.0
  /usr/lib/libgstphotography-1.0.so.0 changed symlink target from libgstphotography-1.0.so.0.2600.0 to libgstphotography-1.0.so.0.2601.0
  /usr/lib/libgstplay-1.0.so.0 changed symlink target from libgstplay-1.0.so.0.2600.0 to libgstplay-1.0.so.0.2601.0
  /usr/lib/libgstplayer-1.0.so.0 changed symlink target from libgstplayer-1.0.so.0.2600.0 to libgstplayer-1.0.so.0.2601.0
  /usr/lib/libgstsctp-1.0.so.0 changed symlink target from libgstsctp-1.0.so.0.2600.0 to libgstsctp-1.0.so.0.2601.0
  /usr/lib/libgsturidownloader-1.0.so.0 changed symlink target from libgsturidownloader-1.0.so.0.2600.0 to libgsturidownloader-1.0.so.0.2601.0
  /usr/lib/libgstvulkan-1.0.so.0 changed symlink target from libgstvulkan-1.0.so.0.2600.0 to libgstvulkan-1.0.so.0.2601.0
  /usr/lib/libgstwayland-1.0.so.0 changed symlink target from libgstwayland-1.0.so.0.2600.0 to libgstwayland-1.0.so.0.2601.0
  /usr/lib/libgstwebrtc-1.0.so.0 changed symlink target from libgstwebrtc-1.0.so.0.2600.0 to libgstwebrtc-1.0.so.0.2601.0
  /usr/lib/libgstadaptivedemux-1.0.so.0.2600.0 moved to /usr/lib/libgstadaptivedemux-1.0.so.0.2601.0
  /usr/lib/libgstanalytics-1.0.so.0.2600.0 moved to /usr/lib/libgstanalytics-1.0.so.0.2601.0
  /usr/lib/libgstbadaudio-1.0.so.0.2600.0 moved to /usr/lib/libgstbadaudio-1.0.so.0.2601.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2600.0 moved to /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2601.0
  /usr/lib/libgstcodecparsers-1.0.so.0.2600.0 moved to /usr/lib/libgstcodecparsers-1.0.so.0.2601.0
  /usr/lib/libgstcodecs-1.0.so.0.2600.0 moved to /usr/lib/libgstcodecs-1.0.so.0.2601.0
  /usr/lib/libgstcuda-1.0.so.0.2600.0 moved to /usr/lib/libgstcuda-1.0.so.0.2601.0
  /usr/lib/libgstdxva-1.0.so.0.2600.0 moved to /usr/lib/libgstdxva-1.0.so.0.2601.0
  /usr/lib/libgstinsertbin-1.0.so.0.2600.0 moved to /usr/lib/libgstinsertbin-1.0.so.0.2601.0
  /usr/lib/libgstisoff-1.0.so.0.2600.0 moved to /usr/lib/libgstisoff-1.0.so.0.2601.0
  /usr/lib/libgstmpegts-1.0.so.0.2600.0 moved to /usr/lib/libgstmpegts-1.0.so.0.2601.0
  /usr/lib/libgstmse-1.0.so.0.2600.0 moved to /usr/lib/libgstmse-1.0.so.0.2601.0
  /usr/lib/libgstphotography-1.0.so.0.2600.0 moved to /usr/lib/libgstphotography-1.0.so.0.2601.0
  /usr/lib/libgstplay-1.0.so.0.2600.0 moved to /usr/lib/libgstplay-1.0.so.0.2601.0
  /usr/lib/libgstplayer-1.0.so.0.2600.0 moved to /usr/lib/libgstplayer-1.0.so.0.2601.0
  /usr/lib/libgstsctp-1.0.so.0.2600.0 moved to /usr/lib/libgstsctp-1.0.so.0.2601.0
  /usr/lib/libgsturidownloader-1.0.so.0.2600.0 moved to /usr/lib/libgsturidownloader-1.0.so.0.2601.0
  /usr/lib/libgstvulkan-1.0.so.0.2600.0 moved to /usr/lib/libgstvulkan-1.0.so.0.2601.0
  /usr/lib/libgstwayland-1.0.so.0.2600.0 moved to /usr/lib/libgstwayland-1.0.so.0.2601.0
  /usr/lib/libgstwebrtc-1.0.so.0.2600.0 moved to /usr/lib/libgstwebrtc-1.0.so.0.2601.0
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-adder: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-adder: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-allocators-typelib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-allocators-typelib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-alsa: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-alsa: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app-typelib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app-typelib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-apps: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-apps: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audio-typelib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audio-typelib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioconvert: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioconvert: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiomixer: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiomixer: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiorate: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiorate: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioresample: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioresample: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiotestsrc: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiotestsrc: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-basedebug: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-basedebug: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-compositor: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-compositor: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: FILELIST: removed "/usr/lib/.debug/libgstrtsp-1.0.so.0.2600.0 /usr/lib/.debug/libgstapp-1.0.so.0.2600.0 /usr/lib/.debug/libgstrtp-1.0.so.0.2600.0 /usr/lib/.debug/libgstsdp-1.0.so.0.2600.0 /usr/lib/.debug/libgstfft-1.0.so.0.2600.0 /usr/lib/.debug/libgstvideo-1.0.so.0.2600.0 /usr/lib/.debug/libgstaudio-1.0.so.0.2600.0 /usr/lib/.debug/libgstallocators-1.0.so.0.2600.0 /usr/lib/.debug/libgsttag-1.0.so.0.2600.0 /usr/lib/.debug/libgstgl-1.0.so.0.2600.0 /usr/lib/.debug/libgstriff-1.0.so.0.2600.0 /usr/lib/.debug/libgstpbutils-1.0.so.0.2600.0", added "/usr/lib/.debug/libgstrtsp-1.0.so.0.2601.0 /usr/lib/.debug/libgstapp-1.0.so.0.2601.0 /usr/lib/.debug/libgstrtp-1.0.so.0.2601.0 /usr/lib/.debug/libgstvideo-1.0.so.0.2601.0 /usr/lib/.debug/libgstaudio-1.0.so.0.2601.0 /usr/lib/.debug/libgstfft-1.0.so.0.2601.0 /usr/lib/.debug/libgstsdp-1.0.so.0.2601.0 /usr/lib/.debug/libgstallocators-1.0.so.0.2601.0 /usr/lib/.debug/
 libgstgl-1.0.so.0.2601.0 /usr/lib/.debug/libgsttag-1.0.so.0.2601.0 /usr/lib/.debug/libgstpbutils-1.0.so.0.2601.0 /usr/lib/.debug/libgstriff-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PKGSIZE changed from 19276816 to 19279712 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dev: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dev: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-doc: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-doc: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dsd: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dsd: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-encoding: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-encoding: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gio: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gio: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gl-typelib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gl-typelib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glegl-typelib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glegl-typelib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glwayland-typelib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glwayland-typelib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glx11-typelib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glx11-typelib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-af: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-af: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-az: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-az: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-bg: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-bg: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ca: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ca: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-cs: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-cs: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-da: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-da: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-de: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-de: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-el: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-el: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-en-gb: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-en-gb: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eo: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eo: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-es: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-es: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eu: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eu: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fi: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fi: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fr: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fr: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fur: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fur: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-gl: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-gl: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hr: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hr: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hu: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hu: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-id: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-id: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-it: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-it: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ja: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ja: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ka: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ka: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lt: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lt: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lv: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lv: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nb: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nb: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nl: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nl: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-or: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-or: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pl: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pl: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pt-br: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pt-br: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ro: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ro: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ru: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ru: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sk: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sk: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sl: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sl: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sq: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sq: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sr: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sr: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sv: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sv: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-tr: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-tr: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-uk: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-uk: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-vi: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-vi: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-zh-cn: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-zh-cn: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-meta: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-meta: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ogg: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ogg: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-opengl: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-opengl: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-overlaycomposition: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-overlaycomposition: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pango: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pango: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbtypes: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbtypes: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbutils-typelib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbutils-typelib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-playback: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-playback: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rawparse: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rawparse: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtp-typelib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtp-typelib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtsp-typelib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtsp-typelib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-sdp-typelib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-sdp-typelib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-src: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-src: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-staticdev: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-staticdev: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-subparse: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-subparse: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tag-typelib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tag-typelib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tcp: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tcp: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-theora: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-theora: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-typefindfunctions: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-typefindfunctions: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-video-typelib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-video-typelib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videoconvertscale: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videoconvertscale: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videorate: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videorate: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videotestsrc: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videotestsrc: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-volume: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-volume: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-vorbis: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-vorbis: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ximagesink: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ximagesink: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-xvimagesink: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-xvimagesink: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.26.0.tar.xz file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch file://0003-viv-fb-Make-sure-config.h-is-included.patch file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch file://0001-gstreamer1.0-plugins-base-Fix-atomic-64-issue-on-arm.patch" to "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.26.1.tar.xz file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch file://0003-viv-fb-Make-sure-config.h-is-included.patch file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: FILES: removed "/usr/lib/libgstallocators-1.0.so.0.2600.0", added "/usr/lib/libgstallocators-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: FILELIST: removed "/usr/lib/libgstallocators-1.0.so.0.2600.0", added "/usr/lib/libgstallocators-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: FILES: removed "/usr/lib/libgstapp-1.0.so.0.2600.0", added "/usr/lib/libgstapp-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: FILELIST: removed "/usr/lib/libgstapp-1.0.so.0.2600.0", added "/usr/lib/libgstapp-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: FILES: removed "/usr/lib/libgstaudio-1.0.so.0.2600.0", added "/usr/lib/libgstaudio-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: FILELIST: removed "/usr/lib/libgstaudio-1.0.so.0.2600.0", added "/usr/lib/libgstaudio-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: FILES: removed "/usr/lib/libgstfft-1.0.so.0.2600.0", added "/usr/lib/libgstfft-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: FILELIST: removed "/usr/lib/libgstfft-1.0.so.0.2600.0", added "/usr/lib/libgstfft-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: FILES: removed "/usr/lib/libgstgl-1.0.so.0.2600.0", added "/usr/lib/libgstgl-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: FILELIST: removed "/usr/lib/libgstgl-1.0.so.0.2600.0", added "/usr/lib/libgstgl-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: FILES: removed "/usr/lib/libgstpbutils-1.0.so.0.2600.0", added "/usr/lib/libgstpbutils-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: FILELIST: removed "/usr/lib/libgstpbutils-1.0.so.0.2600.0", added "/usr/lib/libgstpbutils-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: FILES: removed "/usr/lib/libgstriff-1.0.so.0.2600.0", added "/usr/lib/libgstriff-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: FILELIST: removed "/usr/lib/libgstriff-1.0.so.0.2600.0", added "/usr/lib/libgstriff-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: FILES: removed "/usr/lib/libgstrtp-1.0.so.0.2600.0", added "/usr/lib/libgstrtp-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: FILELIST: removed "/usr/lib/libgstrtp-1.0.so.0.2600.0", added "/usr/lib/libgstrtp-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: FILES: removed "/usr/lib/libgstrtsp-1.0.so.0.2600.0", added "/usr/lib/libgstrtsp-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: FILELIST: removed "/usr/lib/libgstrtsp-1.0.so.0.2600.0", added "/usr/lib/libgstrtsp-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: FILES: removed "/usr/lib/libgstsdp-1.0.so.0.2600.0", added "/usr/lib/libgstsdp-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: FILELIST: removed "/usr/lib/libgstsdp-1.0.so.0.2600.0", added "/usr/lib/libgstsdp-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: FILES: removed "/usr/lib/libgsttag-1.0.so.0.2600.0", added "/usr/lib/libgsttag-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: FILELIST: removed "/usr/lib/libgsttag-1.0.so.0.2600.0", added "/usr/lib/libgsttag-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: FILES: removed "/usr/lib/libgstvideo-1.0.so.0.2600.0", added "/usr/lib/libgstvideo-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: FILELIST: removed "/usr/lib/libgstvideo-1.0.so.0.2600.0", added "/usr/lib/libgstvideo-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
Changes to packages/core2-64-poky-linux/gstreamer1.0-plugins-base (sysroot):
  /usr/lib/libgstallocators-1.0.so.0 changed symlink target from libgstallocators-1.0.so.0.2600.0 to libgstallocators-1.0.so.0.2601.0
  /usr/lib/libgstapp-1.0.so.0 changed symlink target from libgstapp-1.0.so.0.2600.0 to libgstapp-1.0.so.0.2601.0
  /usr/lib/libgstaudio-1.0.so.0 changed symlink target from libgstaudio-1.0.so.0.2600.0 to libgstaudio-1.0.so.0.2601.0
  /usr/lib/libgstfft-1.0.so.0 changed symlink target from libgstfft-1.0.so.0.2600.0 to libgstfft-1.0.so.0.2601.0
  /usr/lib/libgstgl-1.0.so.0 changed symlink target from libgstgl-1.0.so.0.2600.0 to libgstgl-1.0.so.0.2601.0
  /usr/lib/libgstpbutils-1.0.so.0 changed symlink target from libgstpbutils-1.0.so.0.2600.0 to libgstpbutils-1.0.so.0.2601.0
  /usr/lib/libgstriff-1.0.so.0 changed symlink target from libgstriff-1.0.so.0.2600.0 to libgstriff-1.0.so.0.2601.0
  /usr/lib/libgstrtp-1.0.so.0 changed symlink target from libgstrtp-1.0.so.0.2600.0 to libgstrtp-1.0.so.0.2601.0
  /usr/lib/libgstrtsp-1.0.so.0 changed symlink target from libgstrtsp-1.0.so.0.2600.0 to libgstrtsp-1.0.so.0.2601.0
  /usr/lib/libgstsdp-1.0.so.0 changed symlink target from libgstsdp-1.0.so.0.2600.0 to libgstsdp-1.0.so.0.2601.0
  /usr/lib/libgsttag-1.0.so.0 changed symlink target from libgsttag-1.0.so.0.2600.0 to libgsttag-1.0.so.0.2601.0
  /usr/lib/libgstvideo-1.0.so.0 changed symlink target from libgstvideo-1.0.so.0.2600.0 to libgstvideo-1.0.so.0.2601.0
  /usr/lib/libgstallocators-1.0.so.0.2600.0 moved to /usr/lib/libgstallocators-1.0.so.0.2601.0
  /usr/lib/libgstapp-1.0.so.0.2600.0 moved to /usr/lib/libgstapp-1.0.so.0.2601.0
  /usr/lib/libgstaudio-1.0.so.0.2600.0 moved to /usr/lib/libgstaudio-1.0.so.0.2601.0
  /usr/lib/libgstfft-1.0.so.0.2600.0 moved to /usr/lib/libgstfft-1.0.so.0.2601.0
  /usr/lib/libgstgl-1.0.so.0.2600.0 moved to /usr/lib/libgstgl-1.0.so.0.2601.0
  /usr/lib/libgstpbutils-1.0.so.0.2600.0 moved to /usr/lib/libgstpbutils-1.0.so.0.2601.0
  /usr/lib/libgstriff-1.0.so.0.2600.0 moved to /usr/lib/libgstriff-1.0.so.0.2601.0
  /usr/lib/libgstrtp-1.0.so.0.2600.0 moved to /usr/lib/libgstrtp-1.0.so.0.2601.0
  /usr/lib/libgstrtsp-1.0.so.0.2600.0 moved to /usr/lib/libgstrtsp-1.0.so.0.2601.0
  /usr/lib/libgstsdp-1.0.so.0.2600.0 moved to /usr/lib/libgstsdp-1.0.so.0.2601.0
  /usr/lib/libgsttag-1.0.so.0.2600.0 moved to /usr/lib/libgsttag-1.0.so.0.2601.0
  /usr/lib/libgstvideo-1.0.so.0.2600.0 moved to /usr/lib/libgstvideo-1.0.so.0.2601.0
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-adaptivedemux2: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-adaptivedemux2: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alaw: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alaw: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alpha: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alpha: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alphacolor: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alphacolor: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apetag: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apetag: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apps: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apps: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audiofx: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audiofx: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audioparsers: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audioparsers: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-auparse: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-auparse: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-autodetect: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-autodetect: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-avi: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-avi: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cairo: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cairo: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cutter: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cutter: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PKGSIZE changed from 22206864 to 22220104 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-debug: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-debug: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-deinterlace: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-deinterlace: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dev: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dev: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-doc: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-doc: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dtmf: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dtmf: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-effectv: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-effectv: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-equalizer: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-equalizer: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flac: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flac: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flv: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flv: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flxdec: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flxdec: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-gdkpixbuf: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-gdkpixbuf: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-glib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-glib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom2k1: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom2k1: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-icydemux: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-icydemux: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-id3demux: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-id3demux: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-interleave: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-interleave: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PKGSIZE changed from 643160 to 647256 (+1%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-jpeg: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-jpeg: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-lame: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-lame: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-level: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-level: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-af: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-af: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-az: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-az: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-bg: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-bg: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ca: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ca: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-cs: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-cs: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-da: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-da: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-de: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-de: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-el: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-el: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-en-gb: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-en-gb: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eo: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eo: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-es: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-es: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eu: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eu: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fi: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fi: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fr: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fr: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-gl: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-gl: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hr: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hr: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hu: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hu: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-id: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-id: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-it: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-it: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ja: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ja: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ka: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ka: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ky: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ky: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lt: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lt: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lv: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lv: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-mt: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-mt: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nb: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nb: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nl: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nl: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-or: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-or: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pl: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pl: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pt-br: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pt-br: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ro: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ro: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ru: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ru: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sk: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sk: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sl: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sl: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sq: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sq: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sr: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sr: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sv: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sv: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-tr: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-tr: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-uk: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-uk: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-vi: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-vi: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-cn: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-cn: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-hk: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-hk: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-tw: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-tw: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-meta: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-meta: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-monoscope: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-monoscope: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mpg123: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mpg123: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mulaw: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mulaw: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multifile: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multifile: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multipart: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multipart: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-navigationtest: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-navigationtest: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ossaudio: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ossaudio: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-png: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-png: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-pulseaudio: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-pulseaudio: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-replaygain: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-replaygain: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtp: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtp: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtsp: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtsp: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-shapewipe: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-shapewipe: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-smpte: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-smpte: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-soup: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-soup: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-spectrum: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-spectrum: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-speex: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-speex: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-staticdev: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-staticdev: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-taglib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-taglib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-udp: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-udp: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videobox: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videobox: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videocrop: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videocrop: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videofilter: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videofilter: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videomixer: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videomixer: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavenc: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavenc: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavparse: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavparse: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-xingmux: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-xingmux: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-y4menc: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-y4menc: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.26.0.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.26.1.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-apps: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-apps: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-asf: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-asf: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dbg: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dbg: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dev: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dev: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-doc: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-doc: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdlpcmdec: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdlpcmdec: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdsub: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdsub: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-glib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-glib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-af: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-af: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ast: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ast: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-az: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-az: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-bg: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-bg: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ca: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ca: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-cs: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-cs: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-da: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-da: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-de: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-de: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-el: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-el: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-en-gb: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-en-gb: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eo: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eo: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-es: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-es: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eu: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eu: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fi: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fi: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fr: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fr: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fur: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fur: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-gl: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-gl: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hr: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hr: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hu: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hu: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-id: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-id: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-it: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-it: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ja: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ja: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ka: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ka: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lt: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lt: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lv: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lv: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ms: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ms: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-mt: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-mt: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nb: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nb: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nl: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nl: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-or: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-or: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pl: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pl: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pt-br: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pt-br: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ro: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ro: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ru: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ru: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sk: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sk: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sl: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sl: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sq: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sq: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sr: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sr: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sv: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sv: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ta: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ta: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-tr: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-tr: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-uk: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-uk: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-vi: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-vi: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-cn: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-cn: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-tw: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-tw: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-meta: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-meta: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-realmedia: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-realmedia: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-src: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-src: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-staticdev: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-staticdev: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.26.0.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.26.1.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-apps: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-apps: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: FILELIST: removed "/usr/lib/.debug/libgstrtspserver-1.0.so.0.2600.0", added "/usr/lib/.debug/libgstrtspserver-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PKGSIZE changed from 1615176 to 1615232 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dev: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dev: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-doc: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-doc: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-glib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-glib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-locale: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-locale: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-meta: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-meta: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspclientsink: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspclientsink: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspserver-typelib: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspserver-typelib: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-staticdev: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-staticdev: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.26.0.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.26.1.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILES: removed "/usr/lib/libgstrtspserver-1.0.so.0.2600.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILELIST: removed "/usr/lib/libgstrtspserver-1.0.so.0.2600.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
Changes to packages/core2-64-poky-linux/gstreamer1.0-rtsp-server (sysroot):
  /usr/lib/libgstrtspserver-1.0.so.0 changed symlink target from libgstrtspserver-1.0.so.0.2600.0 to libgstrtspserver-1.0.so.0.2601.0
  /usr/lib/libgstrtspserver-1.0.so.0.2600.0 moved to /usr/lib/libgstrtspserver-1.0.so.0.2601.0

--===============1845169585981650958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecalpha: PKGSIZE changed from 35480 to 39576 (+12%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: FILELIST: removed "/usr/lib/libgstadaptivedemux-1.0.so.0.2600.0", added "/usr/lib/libgstadaptivedemux-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: FILELIST: removed "/usr/lib/libgstanalytics-1.0.so.0.2600.0", added "/usr/lib/libgstanalytics-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: FILELIST: removed "/usr/lib/libgstbadaudio-1.0.so.0.2600.0", added "/usr/lib/libgstbadaudio-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: FILELIST: removed "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2600.0", added "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: FILELIST: removed "/usr/lib/libgstcodecparsers-1.0.so.0.2600.0", added "/usr/lib/libgstcodecparsers-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: FILELIST: removed "/usr/lib/libgstcodecs-1.0.so.0.2600.0", added "/usr/lib/libgstcodecs-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: FILELIST: removed "/usr/lib/libgstcuda-1.0.so.0.2600.0", added "/usr/lib/libgstcuda-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: FILELIST: removed "/usr/lib/libgstdxva-1.0.so.0.2600.0", added "/usr/lib/libgstdxva-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: FILELIST: removed "/usr/lib/libgstinsertbin-1.0.so.0.2600.0", added "/usr/lib/libgstinsertbin-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: FILELIST: removed "/usr/lib/libgstisoff-1.0.so.0.2600.0", added "/usr/lib/libgstisoff-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: FILELIST: removed "/usr/lib/libgstmpegts-1.0.so.0.2600.0", added "/usr/lib/libgstmpegts-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: FILELIST: removed "/usr/lib/libgstmse-1.0.so.0.2600.0", added "/usr/lib/libgstmse-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: FILELIST: removed "/usr/lib/libgstphotography-1.0.so.0.2600.0", added "/usr/lib/libgstphotography-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: FILELIST: removed "/usr/lib/libgstplay-1.0.so.0.2600.0", added "/usr/lib/libgstplay-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: FILELIST: removed "/usr/lib/libgstplayer-1.0.so.0.2600.0", added "/usr/lib/libgstplayer-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: FILELIST: removed "/usr/lib/libgstsctp-1.0.so.0.2600.0", added "/usr/lib/libgstsctp-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: FILELIST: removed "/usr/lib/libgsturidownloader-1.0.so.0.2600.0", added "/usr/lib/libgsturidownloader-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: FILELIST: removed "/usr/lib/libgstvulkan-1.0.so.0.2600.0", added "/usr/lib/libgstvulkan-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: FILELIST: removed "/usr/lib/libgstwayland-1.0.so.0.2600.0", added "/usr/lib/libgstwayland-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: FILELIST: removed "/usr/lib/libgstwebrtc-1.0.so.0.2600.0", added "/usr/lib/libgstwebrtc-1.0.so.0.2601.0"
Changes to packages/core2-64-poky-linux/gstreamer1.0-plugins-bad (sysroot):
  /usr/lib/libgstadaptivedemux-1.0.so.0 changed symlink target from libgstadaptivedemux-1.0.so.0.2600.0 to libgstadaptivedemux-1.0.so.0.2601.0
  /usr/lib/libgstanalytics-1.0.so.0 changed symlink target from libgstanalytics-1.0.so.0.2600.0 to libgstanalytics-1.0.so.0.2601.0
  /usr/lib/libgstbadaudio-1.0.so.0 changed symlink target from libgstbadaudio-1.0.so.0.2600.0 to libgstbadaudio-1.0.so.0.2601.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0 changed symlink target from libgstbasecamerabinsrc-1.0.so.0.2600.0 to libgstbasecamerabinsrc-1.0.so.0.2601.0
  /usr/lib/libgstcodecparsers-1.0.so.0 changed symlink target from libgstcodecparsers-1.0.so.0.2600.0 to libgstcodecparsers-1.0.so.0.2601.0
  /usr/lib/libgstcodecs-1.0.so.0 changed symlink target from libgstcodecs-1.0.so.0.2600.0 to libgstcodecs-1.0.so.0.2601.0
  /usr/lib/libgstcuda-1.0.so.0 changed symlink target from libgstcuda-1.0.so.0.2600.0 to libgstcuda-1.0.so.0.2601.0
  /usr/lib/libgstdxva-1.0.so.0 changed symlink target from libgstdxva-1.0.so.0.2600.0 to libgstdxva-1.0.so.0.2601.0
  /usr/lib/libgstinsertbin-1.0.so.0 changed symlink target from libgstinsertbin-1.0.so.0.2600.0 to libgstinsertbin-1.0.so.0.2601.0
  /usr/lib/libgstisoff-1.0.so.0 changed symlink target from libgstisoff-1.0.so.0.2600.0 to libgstisoff-1.0.so.0.2601.0
  /usr/lib/libgstmpegts-1.0.so.0 changed symlink target from libgstmpegts-1.0.so.0.2600.0 to libgstmpegts-1.0.so.0.2601.0
  /usr/lib/libgstmse-1.0.so.0 changed symlink target from libgstmse-1.0.so.0.2600.0 to libgstmse-1.0.so.0.2601.0
  /usr/lib/libgstphotography-1.0.so.0 changed symlink target from libgstphotography-1.0.so.0.2600.0 to libgstphotography-1.0.so.0.2601.0
  /usr/lib/libgstplay-1.0.so.0 changed symlink target from libgstplay-1.0.so.0.2600.0 to libgstplay-1.0.so.0.2601.0
  /usr/lib/libgstplayer-1.0.so.0 changed symlink target from libgstplayer-1.0.so.0.2600.0 to libgstplayer-1.0.so.0.2601.0
  /usr/lib/libgstsctp-1.0.so.0 changed symlink target from libgstsctp-1.0.so.0.2600.0 to libgstsctp-1.0.so.0.2601.0
  /usr/lib/libgsturidownloader-1.0.so.0 changed symlink target from libgsturidownloader-1.0.so.0.2600.0 to libgsturidownloader-1.0.so.0.2601.0
  /usr/lib/libgstvulkan-1.0.so.0 changed symlink target from libgstvulkan-1.0.so.0.2600.0 to libgstvulkan-1.0.so.0.2601.0
  /usr/lib/libgstwayland-1.0.so.0 changed symlink target from libgstwayland-1.0.so.0.2600.0 to libgstwayland-1.0.so.0.2601.0
  /usr/lib/libgstwebrtc-1.0.so.0 changed symlink target from libgstwebrtc-1.0.so.0.2600.0 to libgstwebrtc-1.0.so.0.2601.0
  /usr/lib/libgstadaptivedemux-1.0.so.0.2600.0 moved to /usr/lib/libgstadaptivedemux-1.0.so.0.2601.0
  /usr/lib/libgstanalytics-1.0.so.0.2600.0 moved to /usr/lib/libgstanalytics-1.0.so.0.2601.0
  /usr/lib/libgstbadaudio-1.0.so.0.2600.0 moved to /usr/lib/libgstbadaudio-1.0.so.0.2601.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2600.0 moved to /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2601.0
  /usr/lib/libgstcodecparsers-1.0.so.0.2600.0 moved to /usr/lib/libgstcodecparsers-1.0.so.0.2601.0
  /usr/lib/libgstcodecs-1.0.so.0.2600.0 moved to /usr/lib/libgstcodecs-1.0.so.0.2601.0
  /usr/lib/libgstcuda-1.0.so.0.2600.0 moved to /usr/lib/libgstcuda-1.0.so.0.2601.0
  /usr/lib/libgstdxva-1.0.so.0.2600.0 moved to /usr/lib/libgstdxva-1.0.so.0.2601.0
  /usr/lib/libgstinsertbin-1.0.so.0.2600.0 moved to /usr/lib/libgstinsertbin-1.0.so.0.2601.0
  /usr/lib/libgstisoff-1.0.so.0.2600.0 moved to /usr/lib/libgstisoff-1.0.so.0.2601.0
  /usr/lib/libgstmpegts-1.0.so.0.2600.0 moved to /usr/lib/libgstmpegts-1.0.so.0.2601.0
  /usr/lib/libgstmse-1.0.so.0.2600.0 moved to /usr/lib/libgstmse-1.0.so.0.2601.0
  /usr/lib/libgstphotography-1.0.so.0.2600.0 moved to /usr/lib/libgstphotography-1.0.so.0.2601.0
  /usr/lib/libgstplay-1.0.so.0.2600.0 moved to /usr/lib/libgstplay-1.0.so.0.2601.0
  /usr/lib/libgstplayer-1.0.so.0.2600.0 moved to /usr/lib/libgstplayer-1.0.so.0.2601.0
  /usr/lib/libgstsctp-1.0.so.0.2600.0 moved to /usr/lib/libgstsctp-1.0.so.0.2601.0
  /usr/lib/libgsturidownloader-1.0.so.0.2600.0 moved to /usr/lib/libgsturidownloader-1.0.so.0.2601.0
  /usr/lib/libgstvulkan-1.0.so.0.2600.0 moved to /usr/lib/libgstvulkan-1.0.so.0.2601.0
  /usr/lib/libgstwayland-1.0.so.0.2600.0 moved to /usr/lib/libgstwayland-1.0.so.0.2601.0
  /usr/lib/libgstwebrtc-1.0.so.0.2600.0 moved to /usr/lib/libgstwebrtc-1.0.so.0.2601.0
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: FILELIST: removed "/usr/lib/libgstallocators-1.0.so.0.2600.0", added "/usr/lib/libgstallocators-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: FILELIST: removed "/usr/lib/libgstapp-1.0.so.0.2600.0", added "/usr/lib/libgstapp-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: FILELIST: removed "/usr/lib/libgstaudio-1.0.so.0.2600.0", added "/usr/lib/libgstaudio-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: FILELIST: removed "/usr/lib/libgstfft-1.0.so.0.2600.0", added "/usr/lib/libgstfft-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: FILELIST: removed "/usr/lib/libgstgl-1.0.so.0.2600.0", added "/usr/lib/libgstgl-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: FILELIST: removed "/usr/lib/libgstpbutils-1.0.so.0.2600.0", added "/usr/lib/libgstpbutils-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: FILELIST: removed "/usr/lib/libgstriff-1.0.so.0.2600.0", added "/usr/lib/libgstriff-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: FILELIST: removed "/usr/lib/libgstrtp-1.0.so.0.2600.0", added "/usr/lib/libgstrtp-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: FILELIST: removed "/usr/lib/libgstrtsp-1.0.so.0.2600.0", added "/usr/lib/libgstrtsp-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: FILELIST: removed "/usr/lib/libgstsdp-1.0.so.0.2600.0", added "/usr/lib/libgstsdp-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: FILELIST: removed "/usr/lib/libgsttag-1.0.so.0.2600.0", added "/usr/lib/libgsttag-1.0.so.0.2601.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: FILELIST: removed "/usr/lib/libgstvideo-1.0.so.0.2600.0", added "/usr/lib/libgstvideo-1.0.so.0.2601.0"
Changes to packages/core2-64-poky-linux/gstreamer1.0-plugins-base (sysroot):
  /usr/lib/libgstallocators-1.0.so.0 changed symlink target from libgstallocators-1.0.so.0.2600.0 to libgstallocators-1.0.so.0.2601.0
  /usr/lib/libgstapp-1.0.so.0 changed symlink target from libgstapp-1.0.so.0.2600.0 to libgstapp-1.0.so.0.2601.0
  /usr/lib/libgstaudio-1.0.so.0 changed symlink target from libgstaudio-1.0.so.0.2600.0 to libgstaudio-1.0.so.0.2601.0
  /usr/lib/libgstfft-1.0.so.0 changed symlink target from libgstfft-1.0.so.0.2600.0 to libgstfft-1.0.so.0.2601.0
  /usr/lib/libgstgl-1.0.so.0 changed symlink target from libgstgl-1.0.so.0.2600.0 to libgstgl-1.0.so.0.2601.0
  /usr/lib/libgstpbutils-1.0.so.0 changed symlink target from libgstpbutils-1.0.so.0.2600.0 to libgstpbutils-1.0.so.0.2601.0
  /usr/lib/libgstriff-1.0.so.0 changed symlink target from libgstriff-1.0.so.0.2600.0 to libgstriff-1.0.so.0.2601.0
  /usr/lib/libgstrtp-1.0.so.0 changed symlink target from libgstrtp-1.0.so.0.2600.0 to libgstrtp-1.0.so.0.2601.0
  /usr/lib/libgstrtsp-1.0.so.0 changed symlink target from libgstrtsp-1.0.so.0.2600.0 to libgstrtsp-1.0.so.0.2601.0
  /usr/lib/libgstsdp-1.0.so.0 changed symlink target from libgstsdp-1.0.so.0.2600.0 to libgstsdp-1.0.so.0.2601.0
  /usr/lib/libgsttag-1.0.so.0 changed symlink target from libgsttag-1.0.so.0.2600.0 to libgsttag-1.0.so.0.2601.0
  /usr/lib/libgstvideo-1.0.so.0 changed symlink target from libgstvideo-1.0.so.0.2600.0 to libgstvideo-1.0.so.0.2601.0
  /usr/lib/libgstallocators-1.0.so.0.2600.0 moved to /usr/lib/libgstallocators-1.0.so.0.2601.0
  /usr/lib/libgstapp-1.0.so.0.2600.0 moved to /usr/lib/libgstapp-1.0.so.0.2601.0
  /usr/lib/libgstaudio-1.0.so.0.2600.0 moved to /usr/lib/libgstaudio-1.0.so.0.2601.0
  /usr/lib/libgstfft-1.0.so.0.2600.0 moved to /usr/lib/libgstfft-1.0.so.0.2601.0
  /usr/lib/libgstgl-1.0.so.0.2600.0 moved to /usr/lib/libgstgl-1.0.so.0.2601.0
  /usr/lib/libgstpbutils-1.0.so.0.2600.0 moved to /usr/lib/libgstpbutils-1.0.so.0.2601.0
  /usr/lib/libgstriff-1.0.so.0.2600.0 moved to /usr/lib/libgstriff-1.0.so.0.2601.0
  /usr/lib/libgstrtp-1.0.so.0.2600.0 moved to /usr/lib/libgstrtp-1.0.so.0.2601.0
  /usr/lib/libgstrtsp-1.0.so.0.2600.0 moved to /usr/lib/libgstrtsp-1.0.so.0.2601.0
  /usr/lib/libgstsdp-1.0.so.0.2600.0 moved to /usr/lib/libgstsdp-1.0.so.0.2601.0
  /usr/lib/libgsttag-1.0.so.0.2600.0 moved to /usr/lib/libgsttag-1.0.so.0.2601.0
  /usr/lib/libgstvideo-1.0.so.0.2600.0 moved to /usr/lib/libgstvideo-1.0.so.0.2601.0
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILELIST: removed "/usr/lib/libgstrtspserver-1.0.so.0.2600.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2601.0"
Changes to packages/core2-64-poky-linux/gstreamer1.0-rtsp-server (sysroot):
  /usr/lib/libgstrtspserver-1.0.so.0 changed symlink target from libgstrtspserver-1.0.so.0.2600.0 to libgstrtspserver-1.0.so.0.2601.0
  /usr/lib/libgstrtspserver-1.0.so.0.2600.0 moved to /usr/lib/libgstrtspserver-1.0.so.0.2601.0

--===============1845169585981650958==--

