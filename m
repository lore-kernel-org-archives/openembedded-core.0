Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C40DC35FE7
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:06 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.115654.1726410842402556773
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=UWXp+v78;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=mwRHVsM6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010191f61addf5-bdc75b99-06b8-4159-955d-b11659be4573-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YEWBXOv6I6BL2zRScPUUTNV7f03UYzLsWRGjd2qeD7g=;
	b=UWXp+v78CooJAMb68NVliFIfjIm8woIYSdd7mAY727JHrJgLy5hGVUT40FofZFhG
	DmSrKoNtcK45Zh+eZOA44G/Zwdeoexq29Kcp5xMLoq+v+UF106+o9NZcbhTPbdLj/VE
	8os/Tu7axmCsevDLSrhfh1hfA3+Yt5rkUbV2sDAE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YEWBXOv6I6BL2zRScPUUTNV7f03UYzLsWRGjd2qeD7g=;
	b=mwRHVsM647/3uGMoFQr+JE8E2srPsjVs5qn1015Rd1uqa5jTlmE6A7Qk6nomCR09
	Ks1KvQ8sIjzhZ51hHiBCx6BeD2nKhFhRAO2QtO5A1xL9Eriqo/uVRdEZkeleQeI12E5
	jioDRYf/2VlNUQF+7+PVROnbz/GOrlwrlsIEJd9o=
Content-Type: multipart/mixed; boundary="===============5942289032179581778=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Joslyn <robert.joslyn@redrectangle.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] curl: upgrading to 8.10.0 FAILED
Message-ID: <01010191f61addf5-bdc75b99-06b8-4159-955d-b11659be4573-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:34:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204583

--===============5942289032179581778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *curl* to *8.10.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-curl-upgrade-8.9.1-8.10.0.patch
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
From 903219745b1a56bdfff0167d6a01ba2dc0e03702 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Sep 2024 14:11:48 +0000
Subject: [PATCH] curl: upgrade 8.9.1 -> 8.10.0

---
 ...e-struct-so-that-first-apply-ignores.patch | 38 -------------------
 .../curl/curl/no-test-timeout.patch           |  4 +-
 .../curl/{curl_8.9.1.bb => curl_8.10.0.bb}    | 14 +++----
 3 files changed, 8 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-support/curl/curl/0001-sigpipe-init-the-struct-so-that-first-apply-ignores.patch
 rename meta/recipes-support/curl/{curl_8.9.1.bb => curl_8.10.0.bb} (95%)

diff --git a/meta/recipes-support/curl/curl/0001-sigpipe-init-the-struct-so-that-first-apply-ignores.patch b/meta/recipes-support/curl/curl/0001-sigpipe-init-the-struct-so-that-first-apply-ignores.patch
deleted file mode 100644
index 15c69e1430..0000000000
--- a/meta/recipes-support/curl/curl/0001-sigpipe-init-the-struct-so-that-first-apply-ignores.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 3eec5afbd0b6377eca893c392569b2faf094d970 Mon Sep 17 00:00:00 2001
-From: Daniel Stenberg <daniel@haxx.se>
-Date: Mon, 5 Aug 2024 00:17:17 +0200
-Subject: [PATCH] sigpipe: init the struct so that first apply ignores
-
-Initializes 'no_signal' to TRUE, so that a call to sigpipe_apply() after
-init ignores the signal (unless CURLOPT_NOSIGNAL) is set.
-
-I have read the existing code multiple times now and I think it gets the
-initial state reversed this missing to ignore.
-
-Regression from 17e6f06ea37136c36d27
-
-Reported-by: Rasmus Thomsen
-Fixes #14344
-Closes #14390
-
-Upstream-Status: Backport [https://github.com/curl/curl/commit/3eec5afbd0b6377eca893c392569b2faf094d970]
-Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
----
- lib/sigpipe.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/sigpipe.h b/lib/sigpipe.h
-index b91a2f513..d78afd905 100644
---- a/lib/sigpipe.h
-+++ b/lib/sigpipe.h
-@@ -39,6 +39,7 @@ struct sigpipe_ignore {
- static void sigpipe_init(struct sigpipe_ignore *ig)
- {
-   memset(ig, 0, sizeof(*ig));
-+  ig->no_signal = TRUE;
- }
- 
- /*
--- 
-2.44.2
-
diff --git a/meta/recipes-support/curl/curl/no-test-timeout.patch b/meta/recipes-support/curl/curl/no-test-timeout.patch
index 7122b6f043..414caedf8a 100644
--- a/meta/recipes-support/curl/curl/no-test-timeout.patch
+++ b/meta/recipes-support/curl/curl/no-test-timeout.patch
@@ -1,4 +1,4 @@
-From 42cddb52e821cfc2f09f1974742714e5f2f1856e Mon Sep 17 00:00:00 2001
+From 97114a75b70e0e9161ad8d95f37fb0bb03a869f3 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 15 Mar 2024 14:37:37 +0000
 Subject: [PATCH] Set the max-time timeout to 600 so the timeout is 10 minutes
@@ -11,7 +11,7 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/servers.pm b/tests/servers.pm
-index d4472d5..9999938 100644
+index 887cf27..e3ccf40 100644
 --- a/tests/servers.pm
 +++ b/tests/servers.pm
 @@ -120,7 +120,7 @@ my $sshdverstr;  # for socks server, ssh daemon version string
diff --git a/meta/recipes-support/curl/curl_8.9.1.bb b/meta/recipes-support/curl/curl_8.10.0.bb
similarity index 95%
rename from meta/recipes-support/curl/curl_8.9.1.bb
rename to meta/recipes-support/curl/curl_8.10.0.bb
index 745224929b..2319a2cf57 100644
--- a/meta/recipes-support/curl/curl_8.9.1.bb
+++ b/meta/recipes-support/curl/curl_8.10.0.bb
@@ -9,14 +9,12 @@ SECTION = "console/network"
 LICENSE = "curl"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eed2e5088e1ac619c9a1c747da291d75"
 
-SRC_URI = " \
-    https://curl.se/download/${BP}.tar.xz \
-    file://run-ptest \
-    file://disable-tests \
-    file://no-test-timeout.patch \
-    file://0001-sigpipe-init-the-struct-so-that-first-apply-ignores.patch \
-"
-SRC_URI[sha256sum] = "f292f6cc051d5bbabf725ef85d432dfeacc8711dd717ea97612ae590643801e5"
+SRC_URI = "https://curl.se/download/${BP}.tar.xz \
+           file://run-ptest \
+           file://disable-tests \
+           file://no-test-timeout.patch \
+           "
+SRC_URI[sha256sum] = "e6b142f0e85e954759d37e26a3627e2278137595be80e3a860c4353e4335e5a0"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.44.0


--===============5942289032179581778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1869 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (915 cached, 1 parsed). 1867 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-e460a7c745ad8f189680a3ec11435ac1a565a125"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:e460a7c745ad8f189680a3ec11435ac1a565a125"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 469 Local 288 Mirrors 0 Missed 181 Current 270 (61% match, 75% complete)
Removing 9 stale sstate objects for arch core2-64...done.
Removing 4 stale sstate objects for arch x86_64...done.
Removing 64 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 287 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 288 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 291 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 292 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 299 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.40.bb:do_create_spdx_setscene)
NOTE: Running setscene task 300 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 302 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 317 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 322 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 331 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 347 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 353 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 378 of 739 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 383 of 739 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 400 of 739 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_create_spdx_setscene)
NOTE: recipe cross-localedef-native-2.40+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-20240203-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-locale-2.40+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perlcross-native-1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe cracklib-native-2.10.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-native-4.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe ca-certificates-20240203-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cross-localedef-native-2.40+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 438 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 439 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 440 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 441 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perlcross-native-1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 442 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-native-2.10.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe make-native-4.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 446 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 449 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 456 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 488 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 493 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 514 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 543 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 548 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 553 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-protocols-1.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 558 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 559 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running noexec task 375 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 561 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 565 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_256.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running noexec task 429 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_fetch)
NOTE: recipe base-passwd-3.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 579 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 461 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 467 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: recipe openssl-3.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 477 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_fetch)
NOTE: recipe wayland-protocols-1.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 478 of 2093 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.0.bb:do_recipe_qa)
NOTE: recipe glibc-locale-2.40+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 580 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.40.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 582 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_stash_locale_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 583 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 584 of 739 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 585 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cross-localedef-native-2.40+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-locale-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 595 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 620 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: recipe openssl-3.3.1-r0: task do_fetch: Started
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-native-8.10.0-r0: task do_recipe_qa: Started
NOTE: Running task 684 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_unpack)
NOTE: recipe glibc-locale-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perlcross-native-1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 728 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_fetch)
NOTE: Running task 732 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_fetch)
NOTE: Running task 735 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.0.bb:do_recipe_qa)
NOTE: Running task 737 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_fetch)
NOTE: Running task 768 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.10-r0: task do_fetch: Started
NOTE: recipe systemd-1_256.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cross-localedef-native-2.40+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 587 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: Running setscene task 589 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.40.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_fetch: Succeeded
NOTE: Running setscene task 590 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-5.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 591 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 592 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 593 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: recipe openssl-3.3.1-r0: task do_unpack: Started
NOTE: recipe libunistring-1.2-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: Running setscene task 594 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe curl-8.10.0-r0: task do_recipe_qa: Started
NOTE: recipe cross-localedef-native-2.40+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_fetch: Started
NOTE: recipe libunistring-1.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 595 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 596 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_fetch: Succeeded
NOTE: Running setscene task 597 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cross-localedef-native-2.40+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 598 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.40.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perlcross-native-1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-native-8.10.0-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 599 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 600 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_256.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: Running setscene task 601 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 602 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 603 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_256.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 604 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.5.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 605 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 606 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.10.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 608 of 739 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.6.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 609 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 610 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 611 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 612 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 613 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 614 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glibc-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 615 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 616 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perlcross-native-1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 617 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_256.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-33-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 619 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 620 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 621 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perlcross-native-1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 622 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-33-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 623 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_recipe_qa_setscene)
NOTE: recipe systemd-1_256.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 624 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 625 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 626 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 627 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 628 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 629 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.70-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 630 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 631 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 632 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 633 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-33-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 634 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 635 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.70-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 636 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-33-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 637 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 638 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 639 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: Running task 769 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_unpack)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.42-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 770 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 640 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 641 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 642 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.42-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 643 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 644 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 645 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 646 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 647 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 648 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 649 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 650 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 651 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 652 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 653 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 773 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_fetch)
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.13.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 809 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 654 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 655 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running task 815 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 656 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.13.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 657 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 658 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 660 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 661 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 662 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 663 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glibc-2.40+git-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 664 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 665 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glibc-2.40+git-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.80.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 666 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 667 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running task 816 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_unpack)
NOTE: recipe util-linux-2.40.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 822 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_patch)
NOTE: Running task 823 of 2093 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.0.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 668 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 669 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_recipe_qa_setscene)
NOTE: Running task 896 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: Running task 898 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.3.bb:do_fetch)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 670 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_patch: Started
NOTE: Running setscene task 671 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-initial-1_2.80.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 673 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 674 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glibc-2.40+git-r0: task do_unpack: Started
NOTE: recipe curl-native-8.10.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.3-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 675 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 676 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: recipe curl-native-8.10.0-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 677 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 678 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 679 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.80.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 680 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 899 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 900 of 2093 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.0.bb:do_unpack)
NOTE: recipe glib-2.0-initial-1_2.80.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 901 of 2093 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-72.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 681 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_fetch: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_patch: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 907 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_fetch)
NOTE: Running task 908 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: Running setscene task 682 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 683 of 739 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-setuptools-72.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 684 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 685 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-native-8.10.0-r0: task do_unpack: Started
NOTE: Running setscene task 686 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.10.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-native-8.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 687 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.2-r0: task do_unpack: Started
NOTE: recipe cracklib-native-2.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-72.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 912 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_fetch)
NOTE: Running task 920 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.0.bb:do_fetch)
NOTE: recipe attr-2.5.2-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_fetch: Succeeded
NOTE: Running task 921 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_patch)
NOTE: Running task 922 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_unpack)
NOTE: recipe cracklib-2.10.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 688 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-72.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 924 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_fetch)
NOTE: Running task 926 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_fetch)
NOTE: recipe bash-completion-2.14.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_fetch: Started
NOTE: Running setscene task 689 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-native-2.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.10.0-r0: task do_fetch: Started
NOTE: Running setscene task 691 of 739 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_patch: Started
NOTE: recipe cracklib-2.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 692 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 927 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_unpack)
NOTE: recipe python3-setuptools-72.1.0-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Started
NOTE: recipe util-linux-2.40.2-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 929 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_fetch)
NOTE: recipe cracklib-2.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 931 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_fetch)
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-native-8.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 693 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 694 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.10.0-r0: task do_fetch: Succeeded
NOTE: recipe cracklib-native-2.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 695 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_unpack: Started
NOTE: recipe curl-native-8.10.0-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 696 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 697 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 698 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_fetch: Started
NOTE: Running setscene task 699 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-native-2.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 700 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 701 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 702 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 703 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 704 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 705 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 706 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 707 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 708 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 709 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcrypt-4.4.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 710 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.6.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 711 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 712 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 713 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 714 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 715 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 716 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 717 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 718 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libxcrypt-4.4.36-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 719 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 720 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 721 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 722 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 723 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 724 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 933 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 934 of 2093 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.0.bb:do_patch)
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 936 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_fetch)
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 938 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 940 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_fetch)
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 725 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.6.3-r0: task do_fetch: Started
NOTE: Running setscene task 726 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 727 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxcrypt-4.4.36-r0: task do_fetch: Started
NOTE: recipe expat-2.6.3-r0: task do_fetch: Succeeded
NOTE: Running task 941 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_unpack)
NOTE: recipe curl-native-8.10.0-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 728 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 943 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 729 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 730 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Succeeded
NOTE: Running task 946 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_fetch)
NOTE: recipe expat-2.6.3-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 948 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 950 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_fetch)
NOTE: Running task 952 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_fetch)
NOTE: recipe xz-5.6.2-r0: task do_fetch: Started
NOTE: recipe curl-native-8.10.0-r0: task do_patch: Succeeded
NOTE: Running task 953 of 2093 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 954 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_unpack)
NOTE: Running task 956 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_fetch)
NOTE: recipe libedit-20240808-3.1-r1: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 957 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe libxml2-2.13.3-r0: task do_fetch: Succeeded
NOTE: Running task 958 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_fetch: Started
NOTE: Running setscene task 731 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.3-r0: task do_unpack: Succeeded
NOTE: Running task 959 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_patch)
NOTE: recipe ncurses-6.5-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.6-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 732 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.5-r0: task do_fetch: Started
NOTE: recipe xz-5.6.2-r0: task do_unpack: Started
NOTE: recipe curl-native-8.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 733 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 960 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_patch)
NOTE: recipe ncurses-6.5-r0: task do_fetch: Succeeded
NOTE: Running task 961 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_unpack)
NOTE: recipe expat-2.6.3-r0: task do_patch: Succeeded
NOTE: Running task 962 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_generate_toolchain_file)
NOTE: recipe libtool-cross-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.6.2-r0: task do_patch: Started
NOTE: Running setscene task 734 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_unpack: Started
NOTE: recipe expat-2.6.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe curl-native-8.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 964 of 2093 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.0.bb:do_configure)
NOTE: recipe expat-2.6.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 966 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_patch: Succeeded
NOTE: Running task 969 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 971 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_fetch)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_fetch: Started
NOTE: recipe curl-native-8.10.0-r0: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_fetch: Started
NOTE: Running task 972 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe python3-3.12.6-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 973 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_unpack)
NOTE: recipe glibc-2.40+git-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_fetch: Succeeded
NOTE: Running task 974 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_patch)
NOTE: Running task 977 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 978 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 980 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_unpack)
NOTE: recipe glibc-2.40+git-r0: task do_patch: Started
NOTE: recipe cracklib-2.10.2-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_fetch: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_fetch: Succeeded
NOTE: Running task 983 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_unpack)
NOTE: Running task 984 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_unpack)
NOTE: Running task 985 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.2-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Started
NOTE: Running task 988 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_patch)
NOTE: recipe cracklib-2.10.2-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.6-r0: task do_unpack: Started
NOTE: recipe python3-3.12.6-r0: task do_unpack: Started
NOTE: recipe ncurses-6.5-r0: task do_unpack: Succeeded
NOTE: Running task 989 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_patch)
NOTE: recipe libpam-1.6.1-r0: task do_patch: Started
NOTE: recipe libffi-3.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 990 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_patch)
NOTE: recipe gdbm-1.24-r0: task do_fetch: Succeeded
NOTE: Running task 991 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_unpack)
NOTE: recipe ncurses-6.5-r0: task do_patch: Started
NOTE: recipe libpam-1.6.1-r0: task do_patch: Succeeded
NOTE: Running task 993 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_fetch)
NOTE: recipe libffi-3.4.6-r0: task do_patch: Started
NOTE: recipe gdbm-1.24-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 994 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_patch)
NOTE: Running task 995 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: recipe gdbm-1.24-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_fetch: Succeeded
NOTE: Running task 996 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_patch)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_fetch: Succeeded
NOTE: Running task 1001 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_unpack)
NOTE: Running task 1005 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_unpack)
NOTE: recipe libffi-3.4.6-r0: task do_patch: Succeeded
NOTE: Running task 1008 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Started
NOTE: recipe gdbm-1.24-r0: task do_patch: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_unpack: Started
NOTE: recipe cracklib-2.10.2-r0: task do_unpack: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_unpack: Succeeded
NOTE: Running task 1009 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_patch)
NOTE: Running task 1010 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_patch)
NOTE: recipe libpcre2-10.44-r0: task do_fetch: Started
NOTE: recipe ncurses-6.5-r0: task do_patch: Succeeded
NOTE: Running task 1012 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.3.bb:do_unpack)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 735 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1014 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_unpack)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_unpack: Succeeded
NOTE: Running task 1015 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_patch)
NOTE: recipe cracklib-2.10.2-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_patch: Started
NOTE: recipe gdbm-1.24-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: Running task 1017 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_patch)
NOTE: recipe bash-completion-2.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 1018 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_patch)
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Started
NOTE: recipe libxml2-2.13.3-r0: task do_unpack: Started
NOTE: recipe cracklib-2.10.2-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_patch: Started
NOTE: Running task 1023 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_fetch)
NOTE: recipe bash-completion-2.14.0-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_patch: Started
NOTE: Running task 1025 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_patch: Succeeded
NOTE: Running task 1027 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_unpack)
NOTE: recipe bash-completion-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_patch: Succeeded
NOTE: Running task 1031 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_fetch)
NOTE: Running task 1032 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_unpack)
NOTE: recipe wayland-1.23.1-r0: task do_fetch: Started
NOTE: recipe libunistring-1.2-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.7-r0: task do_unpack: Started
NOTE: recipe perl-5.40.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_fetch: Started
NOTE: recipe glibc-2.40+git-r0: task do_patch: Succeeded
NOTE: Running task 1036 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.0.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_fetch: Succeeded
NOTE: Running task 1037 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_fetch)
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Succeeded
NOTE: Running task 1038 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_patch)
NOTE: recipe libidn2-2.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 1039 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_patch)
NOTE: recipe curl-8.10.0-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_fetch: Started
NOTE: recipe libunistring-1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1040 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_patch)
NOTE: recipe util-linux-2.40.2-r0: task do_patch: Succeeded
NOTE: Running task 1042 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: recipe libxml2-2.13.3-r0: task do_unpack: Succeeded
NOTE: Running task 1043 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.3.bb:do_patch)
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.7-r0: task do_patch: Started
NOTE: recipe libunistring-1.2-r0: task do_patch: Started
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 1044 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_unpack)
NOTE: recipe libidn2-2.3.7-r0: task do_patch: Succeeded
NOTE: Running task 1045 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_unpack)
NOTE: recipe libxml2-2.13.3-r0: task do_patch: Started
NOTE: recipe python3-3.12.6-r0: task do_unpack: Succeeded
NOTE: Running task 1046 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_patch)
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_patch: Succeeded
NOTE: Running task 1053 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb:do_unpack)
NOTE: Running task 1054 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_unpack)
NOTE: recipe libpcre2-10.44-r0: task do_fetch: Succeeded
NOTE: Running task 1055 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_unpack)
NOTE: recipe python3-setuptools-72.1.0-r0: task do_unpack: Started
NOTE: recipe libxml2-2.13.3-r0: task do_patch: Succeeded
NOTE: Running task 1059 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_fetch)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_unpack: Started
NOTE: recipe curl-8.10.0-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_unpack: Started
NOTE: Running task 1060 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.0.bb:do_patch)
NOTE: recipe python3-setuptools-72.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_patch: Started
NOTE: Running task 1061 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_patch)
NOTE: recipe util-macros-1_1.20.1-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_patch: Started
NOTE: recipe curl-8.10.0-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_unpack: Succeeded
NOTE: Running task 1062 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_patch)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_unpack: Succeeded
NOTE: Running task 1063 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_patch)
NOTE: recipe util-macros-1_1.20.1-r0: task do_fetch: Succeeded
NOTE: Running task 1064 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_fetch)
NOTE: recipe base-passwd-3.6.4-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_unpack: Succeeded
NOTE: Running task 1065 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_patch)
NOTE: recipe curl-8.10.0-r0: task do_patch: Succeeded
NOTE: Running task 1066 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_collect_spdx_deps)
NOTE: recipe python3-setuptools-72.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1068 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_patch: Started
NOTE: recipe libpcre2-10.44-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Started
NOTE: Running task 1069 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_patch)
NOTE: recipe linux-libc-headers-6.10-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_patch: Succeeded
NOTE: Running task 1072 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_fetch)
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_patch: Succeeded
NOTE: Running task 1074 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_unpack)
NOTE: Running noexec task 1076 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_configure)
NOTE: Running noexec task 1077 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_compile)
NOTE: Running task 1078 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_install)
NOTE: recipe libpcre2-10.44-r0: task do_patch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_unpack: Started
NOTE: recipe shadow-4.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1079 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb:do_patch)
NOTE: recipe libpcre2-10.44-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_unpack: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_fetch: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_fetch: Succeeded
NOTE: Running setscene task 736 of 739 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1091 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_unpack)
NOTE: Running task 1092 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_unpack)
NOTE: Running task 1093 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_unpack)
NOTE: Running task 1094 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_unpack)
NOTE: Running task 1095 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: Running task 1096 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_unpack)
NOTE: Running task 1097 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_patch)
NOTE: Running task 1098 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1105 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_write_config)
NOTE: Running task 1107 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_write_config)
NOTE: recipe linux-libc-headers-6.10-r0: task do_install: Started
NOTE: recipe python3-3.12.6-r0: task do_patch: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1109 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb:do_write_config)
NOTE: recipe libtirpc-1.3.5-r0: task do_unpack: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_patch: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_unpack: Started
NOTE: recipe perl-5.40.0-r0: task do_unpack: Started
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Started
NOTE: recipe curl-8.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wayland-1.23.1-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_write_config: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_unpack: Succeeded
NOTE: Running task 1110 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_patch)
NOTE: recipe wayland-1.23.1-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_write_config: Succeeded
NOTE: Running task 1112 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_unpack)
NOTE: Running task 1116 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_write_config: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 1117 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_patch)
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Succeeded
NOTE: Running task 1118 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_patch)
NOTE: recipe libedit-20240808-3.1-r1: task do_patch: Started
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_write_config: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_patch: Succeeded
NOTE: Running task 1126 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_write_config)
NOTE: Running task 1140 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_fetch)
NOTE: recipe shadow-4.16.0-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_patch: Started
NOTE: Running task 1142 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_patch: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe curl-8.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Succeeded
NOTE: Running task 1155 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_fetch)
NOTE: Running task 1156 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_fetch)
NOTE: Running task 1159 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_fetch)
NOTE: Running task 1162 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: Running task 1185 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_fetch)
NOTE: recipe wayland-1.23.1-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: Running task 1186 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_unpack)
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Succeeded
NOTE: Running task 1194 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.42.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_unpack: Succeeded
NOTE: Running task 1195 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_patch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe ca-certificates-20240203-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1197 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.37.bb:do_fetch)
NOTE: Running task 1198 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_fetch)
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: Running task 1202 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_unpack)
NOTE: recipe wayland-1.23.1-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.42-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_patch: Succeeded
NOTE: Running task 1204 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: recipe libseccomp-2.5.5-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1205 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_unpack)
NOTE: Running task 1206 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_unpack)
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Started
NOTE: recipe wayland-protocols-1.37-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Started
NOTE: recipe wayland-1.23.1-r0: task do_unpack: Succeeded
NOTE: Running task 1207 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_patch)
NOTE: recipe ca-certificates-20240203-r0: task do_fetch: Succeeded
NOTE: Running task 1224 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.42-r0: task do_fetch: Succeeded
NOTE: Running task 1226 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_fetch)
NOTE: Running task 1227 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_fetch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1228 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_patch)
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1229 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: recipe wayland-1.23.1-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: Running task 1230 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: recipe update-rc.d-0.8+git-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r0: task do_fetch: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1231 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_fetch)
NOTE: Running task 1232 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1233 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_patch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: recipe wayland-1.23.1-r0: task do_patch: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: Running task 1235 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_fetch)
NOTE: Running task 1236 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_patch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Started
NOTE: recipe kmod-33-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Started
NOTE: Running task 1237 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_fetch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Succeeded
NOTE: Running task 1239 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Started
NOTE: Running task 1244 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.42.bb:do_unpack)
NOTE: recipe perl-5.40.0-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1245 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_unpack)
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1260 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libcap-2.70-r0: task do_fetch: Started
NOTE: recipe ca-certificates-20240203-r0: task do_unpack: Started
NOTE: recipe libcap-2.70-r0: task do_fetch: Succeeded
NOTE: Running task 1285 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.42-r0: task do_unpack: Started
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Started
NOTE: recipe shadow-4.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1286 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_patch)
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_fetch: Succeeded
NOTE: Running task 1287 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Succeeded
NOTE: Running task 1288 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: recipe ca-certificates-20240203-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_unpack: Started
NOTE: Running task 1289 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_patch)
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1290 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.42-r0: task do_unpack: Succeeded
NOTE: Running task 1291 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_unpack: Started
NOTE: Running task 1292 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.42.bb:do_patch)
NOTE: recipe shadow-4.16.0-r0: task do_patch: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_fetch: Succeeded
NOTE: Running task 1293 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_unpack)
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: recipe ca-certificates-20240203-r0: task do_patch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.42-r0: task do_patch: Started
NOTE: Running task 1294 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_unpack)
NOTE: recipe update-rc.d-0.8+git-r0: task do_unpack: Started
NOTE: recipe shadow-4.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1296 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.42-r0: task do_patch: Succeeded
NOTE: Running task 1297 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Succeeded
NOTE: recipe wayland-protocols-1.37-r0: task do_fetch: Succeeded
NOTE: Running task 1299 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.37.bb:do_unpack)
NOTE: Running task 1300 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.5.bb:do_fetch)
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Started
NOTE: recipe libcap-2.70-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: Running task 1301 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: recipe wayland-protocols-1.37-r0: task do_unpack: Started
NOTE: recipe perl-5.40.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1327 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.42.bb:do_write_config)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 1e64e1e4064c8612247b82a662087177c62d7b0abaab6e5e4a0d3de62dd6b75c
NOTE: Setscene tasks completed
NOTE: Running task 1329 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.37.bb:do_write_config)
NOTE: recipe systemd-1_256.5-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r0: task do_patch: Succeeded
NOTE: Running task 1330 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.70-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_unpack: Succeeded
NOTE: Running task 1331 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_patch)
NOTE: recipe ca-certificates-20240203-r0: task do_patch: Succeeded
NOTE: recipe wayland-protocols-1.37-r0: task do_unpack: Succeeded
NOTE: Running task 1332 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_patch)
NOTE: Running task 1341 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.37.bb:do_patch)
NOTE: Running task 1349 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_prepare_recipe_sysroot)
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.42-r0: task do_write_config: Started
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: Running task 1367 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-protocols-1.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.70-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.37-r0: task do_write_config: Started
NOTE: recipe ca-certificates-20240203-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_patch: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.42-r0: task do_write_config: Succeeded
NOTE: Running task 1368 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_patch)
NOTE: recipe wayland-protocols-1.37-r0: task do_patch: Started
NOTE: recipe ca-certificates-20240203-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1369 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_write_config)
NOTE: Running task 1370 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_configure)
NOTE: recipe wayland-protocols-1.37-r0: task do_write_config: Succeeded
NOTE: Running task 1371 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_patch: Succeeded
NOTE: Running task 1373 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1374 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: Running task 1375 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_configure)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_write_config: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ca-certificates-20240203-r0: task do_configure: Started
NOTE: recipe libcap-2.70-r0: task do_patch: Succeeded
NOTE: Running task 1381 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_fetch)
NOTE: recipe systemd-1_256.5-r0: task do_fetch: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_patch: Succeeded
NOTE: Running task 1382 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.5.bb:do_unpack)
NOTE: Running task 1383 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_fetch)
NOTE: Running task 1385 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_configure)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: recipe ca-certificates-20240203-r0: task do_configure: Succeeded
NOTE: Running task 1407 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_compile)
NOTE: Running task 1417 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.5.bb:do_warn_musl)
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Succeeded
NOTE: Running task 1418 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch)
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: Running task 1419 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.5.bb:do_write_config)
NOTE: recipe update-rc.d-0.8+git-r0: task do_configure: Started
NOTE: recipe psmisc-23.7-r0: task do_fetch: Started
NOTE: recipe wayland-protocols-1.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1465 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: Running task 1466 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_compile)
NOTE: recipe wayland-protocols-1.37-r0: task do_patch: Succeeded
NOTE: recipe ca-certificates-20240203-r0: task do_compile: Started
NOTE: Running task 1468 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.37.bb:do_configure)
NOTE: recipe systemd-1_256.5-r0: task do_unpack: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_configure: Succeeded
NOTE: Running task 1469 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_compile)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_patch: Started
NOTE: Running task 1470 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_unpack)
NOTE: recipe systemd-1_256.5-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_256.5-r0: task do_warn_musl: Succeeded
NOTE: Running task 1474 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe systemd-1_256.5-r0: task do_write_config: Started
NOTE: recipe initscripts-1.0-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_compile: Started
NOTE: recipe wayland-protocols-1.37-r0: task do_configure: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_compile: Succeeded
NOTE: Running task 1476 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.0.bb:do_populate_lic)
NOTE: Running task 1477 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_install)
NOTE: recipe zstd-1.5.6-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r0: task do_compile: Succeeded
NOTE: recipe ca-certificates-20240203-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1479 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_unpack)
NOTE: recipe systemd-1_256.5-r0: task do_write_config: Succeeded
NOTE: Running task 1480 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_install)
NOTE: recipe ca-certificates-20240203-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_install: Started
NOTE: recipe curl-8.10.0-r0: task do_populate_lic: Started
NOTE: recipe procps-4.0.4-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1481 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_patch)
NOTE: recipe initscripts-1.0-r0: task do_install: Started
NOTE: recipe ca-certificates-20240203-r0: task do_compile: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_install: Succeeded
NOTE: Running task 1482 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_install)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_patch: Succeeded
NOTE: recipe ca-certificates-20240203-r0: task do_install: Started
NOTE: recipe curl-8.10.0-r0: task do_populate_lic: Succeeded
NOTE: recipe kmod-33-r0: task do_fetch: Succeeded
NOTE: Running task 1485 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.10-r0: task do_install: Succeeded
NOTE: Running task 1500 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-33-r0: task do_unpack: Started
NOTE: recipe procps-4.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 1501 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_patch)
NOTE: recipe glibc-2.40+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-4.0.4-r0: task do_patch: Started
NOTE: recipe glibc-2.40+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1502 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_configure)
NOTE: recipe procps-4.0.4-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_configure: Started
NOTE: recipe kmod-33-r0: task do_unpack: Succeeded
NOTE: Running task 1504 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_patch)
NOTE: recipe kmod-33-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r0: task do_install: Succeeded
NOTE: recipe systemd-1_256.5-r0: task do_unpack: Succeeded
NOTE: Running task 1506 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.5.bb:do_patch)
NOTE: recipe wayland-protocols-1.37-r0: task do_configure: Succeeded
NOTE: Running task 1507 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.37.bb:do_compile)
NOTE: recipe kmod-33-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_256.5-r0: task do_patch: Started
NOTE: recipe ca-certificates-20240203-r0: task do_install: Succeeded
NOTE: recipe wayland-protocols-1.37-r0: task do_compile: Started
NOTE: recipe psmisc-23.7-r0: task do_fetch: Succeeded
NOTE: Running task 1510 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_unpack)
NOTE: recipe systemd-1_256.5-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_unpack: Started
NOTE: recipe wayland-protocols-1.37-r0: task do_compile: Succeeded
NOTE: Running task 1512 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.37.bb:do_install)
NOTE: recipe wayland-protocols-1.37-r0: task do_install: Started
NOTE: recipe psmisc-23.7-r0: task do_unpack: Succeeded
NOTE: Running task 1513 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_patch)
NOTE: recipe psmisc-23.7-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_patch: Succeeded
NOTE: recipe wayland-protocols-1.37-r0: task do_install: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_configure: Succeeded
NOTE: Running task 1516 of 2093 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_compile)
NOTE: recipe glibc-2.40+git-r0: task do_compile: Started
NOTE: recipe curl-native-8.10.0-r0: task do_configure: Failed
NOTE: recipe glibc-2.40+git-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1516 tasks of which 1282 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240915140953.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240915140953.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.0.bb:do_configure
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/curl-native/8.10.0/temp/log.do_configure.3514758
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: curl-native-8.10.0-r0 do_configure: QA Issue: curl-native: configure was passed unrecognised options: --with-random [unknown-configure-option]
ERROR: curl-native-8.10.0-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/curl-native/8.10.0/temp/log.do_configure.3514758
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.0.bb:do_configure) failed with exit code '1'

--===============5942289032179581778==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-curl-upgrade-8.9.1-8.10.0.patch"

RnJvbSA5MDMyMTk3NDViMWE1NmJkZmZmMDE2N2Q2YTAxYmEyZGMwZTAzNzAyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgU2VwIDIwMjQgMTQ6MTE6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
dXJsOiB1cGdyYWRlIDguOS4xIC0+IDguMTAuMAoKLS0tCiAuLi5lLXN0cnVjdC1zby10aGF0LWZp
cnN0LWFwcGx5LWlnbm9yZXMucGF0Y2ggfCAzOCAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4vY3Vy
bC9jdXJsL25vLXRlc3QtdGltZW91dC5wYXRjaCAgICAgICAgICAgfCAgNCArLQogLi4uL2N1cmwv
e2N1cmxfOC45LjEuYmIgPT4gY3VybF84LjEwLjAuYmJ9ICAgIHwgMTQgKysrLS0tLQogMyBmaWxl
cyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDQ4IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUg
MTAwNjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3VybC8wMDAxLXNpZ3BpcGUtaW5pdC10
aGUtc3RydWN0LXNvLXRoYXQtZmlyc3QtYXBwbHktaWdub3Jlcy5wYXRjaAogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2N1cmwve2N1cmxfOC45LjEuYmIgPT4gY3VybF84LjEwLjAuYmJ9ICg5
NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsLzAwMDEtc2ln
cGlwZS1pbml0LXRoZS1zdHJ1Y3Qtc28tdGhhdC1maXJzdC1hcHBseS1pZ25vcmVzLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsLzAwMDEtc2lncGlwZS1pbml0LXRoZS1zdHJ1
Y3Qtc28tdGhhdC1maXJzdC1hcHBseS1pZ25vcmVzLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAxNWM2OWUxNDMwLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2N1cmwvY3VybC8wMDAxLXNpZ3BpcGUtaW5pdC10aGUtc3RydWN0LXNvLXRoYXQtZmlyc3Qt
YXBwbHktaWdub3Jlcy5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDM4ICswLDAgQEAKLUZyb20g
M2VlYzVhZmJkMGI2Mzc3ZWNhODkzYzM5MjU2OWIyZmFmMDk0ZDk3MCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKLUZyb206IERhbmllbCBTdGVuYmVyZyA8ZGFuaWVsQGhheHguc2U+Ci1EYXRlOiBN
b24sIDUgQXVnIDIwMjQgMDA6MTc6MTcgKzAyMDAKLVN1YmplY3Q6IFtQQVRDSF0gc2lncGlwZTog
aW5pdCB0aGUgc3RydWN0IHNvIHRoYXQgZmlyc3QgYXBwbHkgaWdub3JlcwotCi1Jbml0aWFsaXpl
cyAnbm9fc2lnbmFsJyB0byBUUlVFLCBzbyB0aGF0IGEgY2FsbCB0byBzaWdwaXBlX2FwcGx5KCkg
YWZ0ZXIKLWluaXQgaWdub3JlcyB0aGUgc2lnbmFsICh1bmxlc3MgQ1VSTE9QVF9OT1NJR05BTCkg
aXMgc2V0LgotCi1JIGhhdmUgcmVhZCB0aGUgZXhpc3RpbmcgY29kZSBtdWx0aXBsZSB0aW1lcyBu
b3cgYW5kIEkgdGhpbmsgaXQgZ2V0cyB0aGUKLWluaXRpYWwgc3RhdGUgcmV2ZXJzZWQgdGhpcyBt
aXNzaW5nIHRvIGlnbm9yZS4KLQotUmVncmVzc2lvbiBmcm9tIDE3ZTZmMDZlYTM3MTM2YzM2ZDI3
Ci0KLVJlcG9ydGVkLWJ5OiBSYXNtdXMgVGhvbXNlbgotRml4ZXMgIzE0MzQ0Ci1DbG9zZXMgIzE0
MzkwCi0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0aHViLmNvbS9jdXJs
L2N1cmwvY29tbWl0LzNlZWM1YWZiZDBiNjM3N2VjYTg5M2MzOTI1NjliMmZhZjA5NGQ5NzBdCi1T
aWduZWQtb2ZmLWJ5OiBSb2JlcnQgSm9zbHluIDxyb2JlcnQuam9zbHluQHJlZHJlY3RhbmdsZS5v
cmc+Ci0tLS0KLSBsaWIvc2lncGlwZS5oIHwgMSArCi0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCi0KLWRpZmYgLS1naXQgYS9saWIvc2lncGlwZS5oIGIvbGliL3NpZ3BpcGUuaAotaW5k
ZXggYjkxYTJmNTEzLi5kNzhhZmQ5MDUgMTAwNjQ0Ci0tLS0gYS9saWIvc2lncGlwZS5oCi0rKysg
Yi9saWIvc2lncGlwZS5oCi1AQCAtMzksNiArMzksNyBAQCBzdHJ1Y3Qgc2lncGlwZV9pZ25vcmUg
ewotIHN0YXRpYyB2b2lkIHNpZ3BpcGVfaW5pdChzdHJ1Y3Qgc2lncGlwZV9pZ25vcmUgKmlnKQot
IHsKLSAgIG1lbXNldChpZywgMCwgc2l6ZW9mKCppZykpOwotKyAgaWctPm5vX3NpZ25hbCA9IFRS
VUU7Ci0gfQotIAotIC8qCi0tLSAKLTIuNDQuMgotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9jdXJsL2N1cmwvbm8tdGVzdC10aW1lb3V0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvY3VybC9jdXJsL25vLXRlc3QtdGltZW91dC5wYXRjaAppbmRleCA3MTIyYjZmMDQzLi40
MTRjYWVkZjhhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmwvbm8t
dGVzdC10aW1lb3V0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3VybC9u
by10ZXN0LXRpbWVvdXQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDQyY2RkYjUyZTgyMWNm
YzJmMDlmMTk3NDc0MjcxNGU1ZjJmMTg1NmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDk3MTE0YTc1YjcwZTBlOTE2MWFkOGQ5NWYzN2ZiMGJiMDNhODY5ZjMgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KIERhdGU6
IEZyaSwgMTUgTWFyIDIwMjQgMTQ6Mzc6MzcgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gU2V0IHRo
ZSBtYXgtdGltZSB0aW1lb3V0IHRvIDYwMCBzbyB0aGUgdGltZW91dCBpcyAxMCBtaW51dGVzCkBA
IC0xMSw3ICsxMSw3IEBAIFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBh
cm0uY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
CiBkaWZmIC0tZ2l0IGEvdGVzdHMvc2VydmVycy5wbSBiL3Rlc3RzL3NlcnZlcnMucG0KLWluZGV4
IGQ0NDcyZDUuLjk5OTk5MzggMTAwNjQ0CitpbmRleCA4ODdjZjI3Li5lM2NjZjQwIDEwMDY0NAog
LS0tIGEvdGVzdHMvc2VydmVycy5wbQogKysrIGIvdGVzdHMvc2VydmVycy5wbQogQEAgLTEyMCw3
ICsxMjAsNyBAQCBteSAkc3NoZHZlcnN0cjsgICMgZm9yIHNvY2tzIHNlcnZlciwgc3NoIGRhZW1v
biB2ZXJzaW9uIHN0cmluZwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9j
dXJsXzguOS4xLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsXzguMTAuMC5iYgpz
aW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJs
L2N1cmxfOC45LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3VybF84
LjEwLjAuYmIKaW5kZXggNzQ1MjI0OTI5Yi4uMjMxOWEyY2Y1NyAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsXzguOS4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2N1cmwvY3VybF84LjEwLjAuYmIKQEAgLTksMTQgKzksMTIgQEAgU0VDVElPTiA9ICJjb25z
b2xlL25ldHdvcmsiCiBMSUNFTlNFID0gImN1cmwiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9DT1BZSU5HO21kNT1lZWQyZTUwODhlMWFjNjE5YzlhMWM3NDdkYTI5MWQ3NSIKIAotU1JDX1VS
SSA9ICIgXAotICAgIGh0dHBzOi8vY3VybC5zZS9kb3dubG9hZC8ke0JQfS50YXIueHogXAotICAg
IGZpbGU6Ly9ydW4tcHRlc3QgXAotICAgIGZpbGU6Ly9kaXNhYmxlLXRlc3RzIFwKLSAgICBmaWxl
Oi8vbm8tdGVzdC10aW1lb3V0LnBhdGNoIFwKLSAgICBmaWxlOi8vMDAwMS1zaWdwaXBlLWluaXQt
dGhlLXN0cnVjdC1zby10aGF0LWZpcnN0LWFwcGx5LWlnbm9yZXMucGF0Y2ggXAotIgotU1JDX1VS
SVtzaGEyNTZzdW1dID0gImYyOTJmNmNjMDUxZDViYmFiZjcyNWVmODVkNDMyZGZlYWNjODcxMWRk
NzE3ZWE5NzYxMmFlNTkwNjQzODAxZTUiCitTUkNfVVJJID0gImh0dHBzOi8vY3VybC5zZS9kb3du
bG9hZC8ke0JQfS50YXIueHogXAorICAgICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKKyAgICAg
ICAgICAgZmlsZTovL2Rpc2FibGUtdGVzdHMgXAorICAgICAgICAgICBmaWxlOi8vbm8tdGVzdC10
aW1lb3V0LnBhdGNoIFwKKyAgICAgICAgICAgIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImU2YjE0
MmYwZTg1ZTk1NDc1OWQzN2UyNmEzNjI3ZTIyNzgxMzc1OTViZTgwZTNhODYwYzQzNTNlNDMzNWU1
YTAiCiAKICMgQ3VybCBoYXMgdXNlZCBtYW55IG5hbWVzIG92ZXIgdGhlIHllYXJzLi4uCiBDVkVf
UFJPRFVDVCA9ICJoYXh4OmN1cmwgaGF4eDpsaWJjdXJsIGN1cmw6Y3VybCBjdXJsOmxpYmN1cmwg
bGliY3VybDpsaWJjdXJsIGRhbmllbF9zdGVuYmVyZzpjdXJsIgotLSAKMi40NC4wCgo=

--===============5942289032179581778==--

