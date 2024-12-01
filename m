Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C9DDD49780
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:06:11 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.148766.1733047562398622652
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:06:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=iJA1N/KI;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=gQOzVbFS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019381af4a5b-ce5e0fea-d970-4fd4-8932-1991aceacea9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733047569;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NVkMsX56o2YS0dZiRH1IuPmDJUBj1e+iR3EfefqK53s=;
	b=iJA1N/KI8lTXHeF6k0qFzimO4ZVyO/Q2N6Y7eXv2NuvxhA+AAtdCEECkMtF9hjpo
	WIOAk9wdHekwOCfI7VJZ3gldNuJ3Zv767W3tKwCXzBwxg8Xhx6aGV/w26ynCHPnntHi
	kd1ysNn+9oeOhkLlc71q8+SnCeYfE7oLfQps0kkE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733047569;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NVkMsX56o2YS0dZiRH1IuPmDJUBj1e+iR3EfefqK53s=;
	b=gQOzVbFSLea+RWnNdY7KejzWFWWkYkyUdOLoagKzCc1qR2fftNeHFOI8zAhnYi59
	1ixd5msBGytzgi8W9fsV+8hK45gED8VR7e/L63QXS0qKd5S2sqHm+4xXbbwe6drxlvn
	ZmpGEuoNNDvtvU6FB6Rn9xbBv1DFs7q+z0ho7fvQ=
Content-Type: multipart/mixed; boundary="===============1244261225603663217=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Joslyn <robert.joslyn@redrectangle.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] curl: upgrading to 8.11.0 FAILED
Message-ID: <0101019381af4a5b-ce5e0fea-d970-4fd4-8932-1991aceacea9-000000@us-west-2.amazonses.com>
Date: Sun, 1 Dec 2024 10:06:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208105

--===============1244261225603663217==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *curl* to *8.11.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-curl-upgrade-8.10.1-8.11.0.patch
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
From 751ac36e678a5a68b1c0c00d3f6d929eff84c50c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Dec 2024 09:25:23 +0000
Subject: [PATCH] curl: upgrade 8.10.1 -> 8.11.0

---
 meta/recipes-support/curl/curl/no-test-timeout.patch        | 6 +++---
 .../recipes-support/curl/{curl_8.10.1.bb => curl_8.11.0.bb} | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/curl/{curl_8.10.1.bb => curl_8.11.0.bb} (98%)

diff --git a/meta/recipes-support/curl/curl/no-test-timeout.patch b/meta/recipes-support/curl/curl/no-test-timeout.patch
index 7122b6f043..4c373e4724 100644
--- a/meta/recipes-support/curl/curl/no-test-timeout.patch
+++ b/meta/recipes-support/curl/curl/no-test-timeout.patch
@@ -1,4 +1,4 @@
-From 42cddb52e821cfc2f09f1974742714e5f2f1856e Mon Sep 17 00:00:00 2001
+From 200e992c745c9ec31654a7fbc15a3f223055ebeb Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 15 Mar 2024 14:37:37 +0000
 Subject: [PATCH] Set the max-time timeout to 600 so the timeout is 10 minutes
@@ -11,10 +11,10 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/servers.pm b/tests/servers.pm
-index d4472d5..9999938 100644
+index 37519ee..8524349 100644
 --- a/tests/servers.pm
 +++ b/tests/servers.pm
-@@ -120,7 +120,7 @@ my $sshdverstr;  # for socks server, ssh daemon version string
+@@ -122,7 +122,7 @@ my $sshdverstr;  # for socks server, ssh daemon version string
  my $sshderror;   # for socks server, ssh daemon version error
  my %doesntrun;    # servers that don't work, identified by pidfile
  my %PORT = (nolisten => 47); # port we use for a local non-listening service
diff --git a/meta/recipes-support/curl/curl_8.10.1.bb b/meta/recipes-support/curl/curl_8.11.0.bb
similarity index 98%
rename from meta/recipes-support/curl/curl_8.10.1.bb
rename to meta/recipes-support/curl/curl_8.11.0.bb
index 0252d4475e..87cab8e1a7 100644
--- a/meta/recipes-support/curl/curl_8.10.1.bb
+++ b/meta/recipes-support/curl/curl_8.11.0.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
     file://disable-tests \
     file://no-test-timeout.patch \
 "
-SRC_URI[sha256sum] = "73a4b0e99596a09fa5924a4fb7e4b995a85fda0d18a2c02ab9cf134bebce04ee"
+SRC_URI[sha256sum] = "db59cf0d671ca6e7f5c2c5ec177084a33a79e04c97e71cf183a5cdea235054eb"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.44.1


--===============1244261225603663217==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1879 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1877 targets, 41 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:665aedf366bcba578ea4da94b762fd8f77c5d5a7"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 458 Local 279 Mirrors 0 Missed 179 Current 267 (60% match, 75% complete)
Removing 5 stale sstate objects for arch allarch...done.
Removing 4 stale sstate objects for arch x86_64...done.
Removing 62 stale sstate objects for arch qemux86_64...done.
Removing 13 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 388 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.40.bb:do_create_spdx_setscene)
NOTE: Running setscene task 389 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 394 of 725 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 398 of 725 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 401 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 403 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 406 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 412 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 414 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 415 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 418 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 424 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 427 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 433 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 434 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_create_spdx_setscene)
NOTE: recipe cross-localedef-native-2.40+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-locale-2.40+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-20240203-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perlcross-native-1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe make-native-4.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe cross-localedef-native-2.40+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ca-certificates-20240203-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 436 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 437 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perlcross-native-1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 438 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 440 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe make-native-4.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 442 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 446 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 448 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 466 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 483 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 498 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 525 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 544 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 548 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 551 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.40+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 555 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 557 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 558 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_stash_locale_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 559 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running noexec task 534 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_fetch)
NOTE: Running noexec task 535 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 560 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 571 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_256.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 573 of 725 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-protocols-1.38-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 576 of 725 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 577 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 580 of 725 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 583 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: Running task 584 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-locale-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 585 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_fetch)
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-locale-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: Running setscene task 581 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-native-0.191-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 660 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.4.0-r0: task do_fetch: Started
NOTE: recipe curl-native-8.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 691 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: recipe openssl-3.4.0-r0: task do_fetch: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 762 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_unpack)
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 777 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_fetch)
NOTE: recipe perl-5.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 582 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-native-0.191-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 812 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_fetch)
NOTE: Running task 841 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_fetch)
NOTE: Running task 847 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_fetch)
NOTE: recipe curl-native-8.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 849 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_fetch)
NOTE: Running task 852 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb:do_fetch)
NOTE: Running task 868 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_fetch: Started
NOTE: Running task 894 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.12-r0: task do_fetch: Succeeded
NOTE: Running task 895 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_unpack)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 896 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssl-3.4.0-r0: task do_unpack: Started
NOTE: recipe systemd-1_256.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 583 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 584 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.3-r0: task do_fetch: Started
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.7-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.5-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.11.0-r0: task do_fetch: Started
NOTE: Running setscene task 585 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-native-0.191-r0: task do_fetch: Started
NOTE: Running setscene task 586 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.5-r0: task do_fetch: Succeeded
NOTE: Running setscene task 587 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.71.bb:do_populate_sysroot_setscene)
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: Running setscene task 588 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.11.0-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_unpack: Started
NOTE: recipe elfutils-native-0.191-r0: task do_fetch: Succeeded
NOTE: Running setscene task 589 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-native-8.11.0-r0: task do_fetch: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: Running setscene task 590 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 591 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 592 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-native-8.11.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 593 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.71-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: Running setscene task 594 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_256.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 595 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 897 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 596 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_256.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 597 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.8.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.71-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 598 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 599 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 600 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 601 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.71.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 602 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 603 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 604 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 605 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 606 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 607 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.71-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_256.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 608 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 609 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.71-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 611 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.2.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_256.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 612 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.71.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 613 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 614 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 615 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-33-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 616 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 617 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 618 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 619 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.71-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 620 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 621 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 622 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-33-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 623 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.71-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 624 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 625 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 627 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.43-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.13.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 628 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 629 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 630 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 631 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 632 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 633 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 900 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_fetch)
NOTE: Running setscene task 634 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 635 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 636 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-33-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 637 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 638 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.13.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 639 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 640 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 641 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-33-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 901 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 902 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 642 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 643 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.40+git-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 644 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 645 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_fetch: Succeeded
NOTE: Running setscene task 646 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.13.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.82.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 647 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 648 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 903 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_unpack)
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.82.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.13.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 649 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 650 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_recipe_qa_setscene)
NOTE: Running task 904 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 651 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 652 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 653 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 654 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 655 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 656 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_unpack: Started
NOTE: Running setscene task 657 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.13.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.82.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.4.0-r0: task do_patch: Started
NOTE: Running setscene task 658 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 659 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.2.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 660 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-setuptools-75.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 907 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_unpack)
NOTE: recipe libxml2-2.13.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 908 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.82.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 909 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_unpack)
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 910 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_unpack)
NOTE: recipe util-linux-2.40.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 912 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.82.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 661 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 662 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 663 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-native-8.11.0-r0: task do_unpack: Started
NOTE: Running setscene task 664 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 665 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe curl-native-8.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-native-0.191-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_unpack: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 666 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 914 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-75.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 667 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-initial-1_2.82.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 668 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 669 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 670 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.13.5-r0: task do_fetch: Started
NOTE: recipe openssl-3.4.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 672 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 673 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 917 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_fetch)
NOTE: Running task 918 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_unpack)
NOTE: recipe python3-setuptools-75.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 674 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.82.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-75.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 675 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 920 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_fetch)
NOTE: recipe util-linux-2.40.2-r0: task do_fetch: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-native-8.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_fetch: Succeeded
NOTE: Running task 923 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_fetch)
NOTE: Running task 924 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_unpack)
NOTE: recipe glib-2.0-initial-1_2.82.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 931 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_patch)
NOTE: Running task 933 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_fetch)
NOTE: recipe python3-setuptools-75.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 676 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Started
NOTE: recipe curl-native-8.11.0-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 677 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 935 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_patch)
NOTE: Running task 936 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_fetch)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-75.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 938 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_fetch)
NOTE: recipe attr-2.5.2-r0: task do_patch: Started
NOTE: recipe wayland-1.23.1-r0: task do_fetch: Started
NOTE: recipe util-linux-2.40.2-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-75.6.0-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_fetch: Succeeded
NOTE: recipe curl-native-8.11.0-r0: task do_patch: Started
NOTE: Running setscene task 678 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_recipe_qa_setscene)
NOTE: Running task 939 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_unpack)
NOTE: recipe bash-completion-2.14.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Succeeded
NOTE: Running task 940 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_fetch)
NOTE: Running task 941 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_unpack)
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-75.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 942 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_patch)
NOTE: recipe attr-2.5.2-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_unpack: Started
NOTE: Running task 943 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.2.bb:do_fetch)
NOTE: Running task 945 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_fetch)
NOTE: recipe bash-completion-2.14.0-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Started
NOTE: recipe curl-native-8.11.0-r0: task do_patch: Succeeded
NOTE: Running task 946 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-3.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 679 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 680 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 681 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.40.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.82.2-r0: task do_fetch: Started
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.82.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 682 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 683 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-native-8.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 684 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 685 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 686 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-native-0.191-r0: task do_unpack: Succeeded
NOTE: Running setscene task 687 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 688 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 689 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.47.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 690 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-native-8.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 691 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 692 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_deploy_source_date_epoch_setscene)
NOTE: Task virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_deploy_source_date_epoch unihash changed to 92f4af1007ed1a35108202c4322ee79e9b12405bb35b091309c995df0f7adada
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.13.5-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.47.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 529 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 530 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 545 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 666 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 678 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 680 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 683 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 688 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 689 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 690 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 691 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 692 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcrypt-4.4.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.47.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 693 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 696 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 697 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 699 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 700 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 701 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 703 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: Running task 948 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_fetch)
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 712 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 713 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 714 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 949 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_configure)
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.47.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_fetch: Started
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_fetch: Succeeded
NOTE: Running task 950 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.36-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.47.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 952 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_fetch)
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 953 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 955 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_fetch)
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 957 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.0.bb:do_fetch)
NOTE: Running task 959 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 962 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_fetch)
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 964 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_fetch)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-native-8.11.0-r0: task do_configure: Started
NOTE: Running task 966 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_fetch)
NOTE: Running task 968 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_fetch)
NOTE: Running task 970 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_fetch)
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 715 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.24-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.6-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.47.0-r0: task do_fetch: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.47.0-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_fetch: Started
NOTE: recipe xz-5.6.3-r0: task do_fetch: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_fetch: Succeeded
NOTE: Running setscene task 716 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 971 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_fetch)
NOTE: recipe ncurses-6.5-r0: task do_fetch: Started
NOTE: recipe elfutils-native-0.191-r0: task do_patch: Started
NOTE: Running task 973 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_fetch)
NOTE: recipe xz-5.6.3-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 974 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_unpack)
NOTE: Running task 975 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_unpack)
NOTE: recipe gdbm-1.24-r0: task do_unpack: Succeeded
NOTE: Running task 976 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_unpack)
NOTE: Running task 977 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_patch)
NOTE: recipe libtool-cross-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Started
NOTE: Running setscene task 717 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.4-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.6-r0: task do_unpack: Started
NOTE: recipe xz-5.6.3-r0: task do_unpack: Started
NOTE: recipe gdbm-1.24-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_fetch: Started
NOTE: Running task 978 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 979 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe ncurses-6.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_fetch: Succeeded
NOTE: Running task 980 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_unpack)
NOTE: recipe libffi-3.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 981 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_patch)
NOTE: Running task 982 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 718 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.6.3-r0: task do_unpack: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_unpack: Started
NOTE: Running setscene task 719 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.6.4-r0: task do_unpack: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 983 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_patch)
NOTE: Running task 984 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_patch)
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 986 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe ncurses-6.5-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.6-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_patch: Succeeded
NOTE: Running task 988 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.0.bb:do_unpack)
NOTE: recipe xz-5.6.3-r0: task do_patch: Started
NOTE: recipe expat-2.6.4-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 989 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_unpack)
NOTE: Running setscene task 719 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running task 990 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_patch)
NOTE: recipe sqlite3-3_3.47.0-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_unpack: Started
NOTE: recipe xz-5.6.3-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_patch: Succeeded
NOTE: Running task 991 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_generate_toolchain_file)
NOTE: Running task 994 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_unpack)
NOTE: Running task 995 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_unpack)
NOTE: recipe glibc-2.40+git-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.0-r0: task do_unpack: Succeeded
NOTE: Running task 997 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_fetch)
NOTE: Running task 998 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.0.bb:do_patch)
NOTE: recipe libedit-20240808-3.1-r1: task do_unpack: Started
NOTE: recipe expat-2.6.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Started
NOTE: recipe wayland-1.23.1-r0: task do_fetch: Succeeded
NOTE: Running task 999 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_unpack)
NOTE: recipe libtirpc-1.3.6-r0: task do_unpack: Succeeded
NOTE: Running task 1000 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_patch)
NOTE: recipe libtool-cross-2.5.2-r0: task do_fetch: Started
NOTE: recipe expat-2.6.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.47.0-r0: task do_patch: Started
NOTE: Running task 1001 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_patch)
NOTE: Running task 1002 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_patch)
NOTE: recipe libtool-cross-2.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 1003 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_unpack)
NOTE: recipe libtirpc-1.3.6-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_unpack: Succeeded
NOTE: Running task 1004 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_patch)
NOTE: recipe libedit-20240808-3.1-r1: task do_patch: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_unpack: Started
NOTE: recipe python3-3.13.0-r0: task do_unpack: Started
NOTE: recipe libpam-1.6.1-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.47.0-r0: task do_patch: Succeeded
NOTE: Running task 1006 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_generate_toolchain_file)
NOTE: recipe elfutils-native-0.191-r0: task do_patch: Succeeded
NOTE: Running task 1010 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_patch: Started
NOTE: Running task 1011 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe libtirpc-1.3.6-r0: task do_patch: Succeeded
NOTE: Running task 1014 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_unpack: Succeeded
NOTE: Running task 1015 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_patch)
NOTE: recipe bash-completion-2.14.0-r0: task do_unpack: Started
NOTE: recipe libpam-1.6.1-r0: task do_patch: Succeeded
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1017 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 1020 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe libpcre2-10.44-r0: task do_fetch: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_patch: Succeeded
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1022 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_patch)
NOTE: Running task 1023 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_patch: Started
NOTE: recipe libxml2-2.13.5-r0: task do_unpack: Started
NOTE: recipe ncurses-6.5-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Started
NOTE: Running task 1024 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_patch)
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1025 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_patch)
NOTE: recipe libunistring-1.3-r0: task do_unpack: Started
NOTE: recipe util-linux-2.40.2-r0: task do_patch: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 1026 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_patch)
NOTE: recipe libxcrypt-4.4.36-r0: task do_patch: Succeeded
NOTE: Running task 1030 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_fetch)
NOTE: recipe ncurses-6.5-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 1032 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: recipe bash-completion-2.14.0-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Succeeded
NOTE: Running task 1034 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_unpack)
NOTE: recipe bash-completion-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: Running task 1036 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_unpack)
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 1038 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_unpack)
NOTE: Running task 1039 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_unpack)
NOTE: recipe python3-setuptools-75.6.0-r0: task do_unpack: Started
NOTE: recipe libunistring-1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1040 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_patch)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.7-r0: task do_unpack: Started
NOTE: recipe wayland-1.23.1-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_fetch: Succeeded
NOTE: Running task 1041 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.2.bb:do_unpack)
NOTE: recipe python3-setuptools-75.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1042 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_patch)
NOTE: recipe libunistring-1.3-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_patch: Succeeded
NOTE: Running task 1044 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.82.2-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-75.6.0-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 721 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 1045 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_patch)
NOTE: recipe libunistring-1.3-r0: task do_patch: Succeeded
NOTE: Running task 1046 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_patch)
NOTE: recipe ncurses-6.5-r0: task do_patch: Succeeded
NOTE: Running task 1047 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb:do_unpack)
NOTE: Running task 1049 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_unpack)
NOTE: recipe util-linux-2.40.2-r0: task do_patch: Succeeded
NOTE: recipe curl-8.11.0-r0: task do_unpack: Started
NOTE: Running task 1053 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.13.5-r0: task do_unpack: Succeeded
NOTE: Running task 1054 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_patch)
NOTE: Running task 1055 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_patch)
NOTE: recipe wayland-1.23.1-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.5-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.7-r0: task do_patch: Started
NOTE: recipe perl-5.40.0-r0: task do_unpack: Started
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-75.6.0-r0: task do_patch: Succeeded
NOTE: Running task 1056 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_fetch)
NOTE: recipe libxml2-2.13.5-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.7-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_patch: Succeeded
NOTE: Running task 1057 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_unpack)
NOTE: Running task 1058 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_fetch: Started
NOTE: Running task 1062 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_fetch)
NOTE: recipe base-passwd-3.6.5-r0: task do_unpack: Succeeded
NOTE: Running task 1063 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb:do_patch)
NOTE: recipe libseccomp-2.5.5-r0: task do_unpack: Started
NOTE: recipe libxml2-2.13.5-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_patch: Succeeded
NOTE: Running task 1065 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: Running task 1068 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_write_config)
NOTE: recipe shadow-4.16.0-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.5-r0: task do_patch: Started
NOTE: recipe shadow-4.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1071 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_write_config)
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1072 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.11.0-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_write_config: Started
NOTE: Running task 1074 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_patch)
NOTE: Running task 1075 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.2.bb:do_write_config)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.82.2-r0: task do_unpack: Succeeded
NOTE: Running task 1076 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.2.bb:do_patch)
NOTE: recipe wayland-1.23.1-r0: task do_write_config: Started
NOTE: Running task 1077 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_unpack)
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: recipe python3-3.13.0-r0: task do_unpack: Succeeded
NOTE: Running task 1078 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_patch)
NOTE: recipe curl-8.11.0-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.82.2-r0: task do_write_config: Started
NOTE: recipe wayland-1.23.1-r0: task do_write_config: Succeeded
NOTE: Running task 1079 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe shadow-4.16.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.82.2-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.82.2-r0: task do_patch: Started
NOTE: Running task 1081 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe python3-3.13.0-r0: task do_patch: Started
NOTE: recipe curl-8.11.0-r0: task do_patch: Succeeded
NOTE: Running task 1082 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: Running task 1087 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_write_config)
NOTE: recipe libpcre2-10.44-r0: task do_fetch: Succeeded
NOTE: Running task 1088 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_unpack)
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_unpack: Succeeded
NOTE: Running task 1097 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1098 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_patch)
NOTE: Running task 1102 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Started
NOTE: recipe curl-8.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre2-10.44-r0: task do_unpack: Started
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Succeeded
NOTE: Running task 1103 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.5-r0: task do_patch: Succeeded
NOTE: Running task 1105 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1106 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_fetch)
NOTE: recipe libseccomp-2.5.5-r0: task do_patch: Succeeded
NOTE: Running task 1111 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: recipe perl-5.40.0-r0: task do_unpack: Succeeded
NOTE: Running task 1112 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_patch)
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: recipe curl-8.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_deploy_source_date_epoch unihash changed to eab57a9486144d1a7c43dfc83cfa28325e5f690a427e2034ea191881180ee2b2
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Started
NOTE: Running task 1115 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_fetch)
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe perl-5.40.0-r0: task do_patch: Started
NOTE: recipe libpcre2-10.44-r0: task do_unpack: Succeeded
NOTE: Running task 1116 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_patch)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.44-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: Running task 1117 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: recipe libpcre2-10.44-r0: task do_patch: Succeeded
NOTE: Running task 1119 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1121 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.82.2-r0: task do_patch: Succeeded
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: Running task 1140 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1142 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: Running task 1143 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1144 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_fetch)
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_fetch: Started
NOTE: recipe shadow-4.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1145 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1146 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe shadow-4.16.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1147 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe perl-5.40.0-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_unpack: Succeeded
NOTE: Running setscene task 722 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1151 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_patch)
NOTE: Running task 1160 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_collect_spdx_deps)
NOTE: Running task 1166 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_fetch)
NOTE: Running task 1167 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-20240203-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ca-certificates-20240203-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_patch: Succeeded
NOTE: Running task 1184 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: Running noexec task 1186 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_configure)
NOTE: Running noexec task 1187 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_compile)
NOTE: Running task 1188 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_install)
NOTE: Running task 1189 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_fetch)
NOTE: recipe initscripts-1.0-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1190 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.12-r0: task do_install: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1191 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_unpack)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1203 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_fetch: Succeeded
NOTE: Running task 1204 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1205 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.71.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1206 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_patch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_fetch: Succeeded
NOTE: Running task 1207 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_unpack)
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1208 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_unpack)
NOTE: recipe kmod-33-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.71-r0: task do_fetch: Started
NOTE: Running task 1209 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_patch)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Started
NOTE: recipe libcap-2.71-r0: task do_fetch: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_unpack: Started
NOTE: Running task 1210 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_fetch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_unpack: Succeeded
NOTE: Running task 1211 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_patch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Started
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1215 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_unpack)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: Running task 1218 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_unpack)
NOTE: Running task 1219 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: recipe util-macros-1_1.20.2-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1220 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_patch)
NOTE: recipe wayland-protocols-1.38-r0: task do_unpack: Started
NOTE: recipe ca-certificates-20240203-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1221 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_unpack)
NOTE: Running task 1253 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: Running task 1254 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Succeeded
NOTE: Running task 1255 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.71.bb:do_unpack)
NOTE: recipe wayland-protocols-1.38-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_patch: Succeeded
NOTE: Running task 1256 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_patch)
NOTE: Running task 1258 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_unpack)
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: Running task 1259 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe ca-certificates-20240203-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_unpack: Started
NOTE: Running task 1260 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_patch)
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: recipe libcap-2.71-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_fetch: Succeeded
NOTE: Running task 1261 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_unpack)
NOTE: recipe ca-certificates-20240203-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_patch: Succeeded
NOTE: Running task 1263 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.8.bb:do_fetch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: Running task 1264 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_patch)
NOTE: Running task 1282 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_write_config)
NOTE: recipe update-rc.d-0.8+git-r0: task do_unpack: Started
NOTE: recipe libcap-2.71-r0: task do_unpack: Succeeded
NOTE: Running task 1283 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.71.bb:do_patch)
NOTE: recipe initscripts-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1284 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_write_config: Started
NOTE: recipe systemd-1_256.8-r0: task do_fetch: Started
NOTE: recipe libcap-2.71-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe wayland-protocols-1.38-r0: task do_write_config: Succeeded
NOTE: Running task 1287 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1288 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_write_config)
NOTE: recipe initscripts-1.0-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1289 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_unpack)
NOTE: recipe initscripts-1.0-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.43-r0: task do_write_config: Succeeded
NOTE: Running task 1298 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_256.8-r0: task do_fetch: Succeeded
NOTE: Running task 1299 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.8.bb:do_unpack)
NOTE: recipe libcap-2.71-r0: task do_patch: Succeeded
NOTE: Running task 1320 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1321 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_write_config)
NOTE: recipe ca-certificates-20240203-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_unpack: Started
NOTE: Running task 1323 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe ca-certificates-20240203-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ca-certificates-20240203-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1324 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_configure)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_write_config: Started
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Succeeded
NOTE: Running task 1325 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch)
NOTE: recipe update-rc.d-0.8+git-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1326 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_patch)
NOTE: Running task 1327 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: recipe update-rc.d-0.8+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_256.8-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: recipe ca-certificates-20240203-r0: task do_configure: Started
NOTE: Running task 1328 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: Running task 1330 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_configure)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1331 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_patch)
NOTE: recipe zstd-1.5.6-r0: task do_patch: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1334 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_fetch)
NOTE: recipe ca-certificates-20240203-r0: task do_configure: Succeeded
NOTE: Running task 1335 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_compile)
NOTE: recipe update-rc.d-0.8+git-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1337 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_configure)
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: Running task 1338 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_configure)
NOTE: Running task 1339 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_fetch)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_patch: Started
NOTE: recipe zstd-1.5.6-r0: task do_patch: Succeeded
NOTE: Running task 1359 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.8.bb:do_warn_musl)
NOTE: recipe psmisc-23.7-r0: task do_fetch: Started
NOTE: recipe ca-certificates-20240203-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1361 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.8.bb:do_write_config)
NOTE: Running task 1362 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_compile)
NOTE: recipe update-rc.d-0.8+git-r0: task do_configure: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_configure: Started
NOTE: recipe procps-4.0.4-r0: task do_fetch: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_configure: Succeeded
NOTE: Running task 1363 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_compile)
NOTE: recipe initscripts-1.0-r0: task do_compile: Started
NOTE: recipe systemd-1_256.8-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_256.8-r0: task do_warn_musl: Succeeded
NOTE: recipe systemd-1_256.8-r0: task do_write_config: Started
NOTE: recipe initscripts-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1416 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: Running task 1417 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_install)
NOTE: recipe psmisc-23.7-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_compile: Started
NOTE: Running task 1418 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_unpack)
NOTE: recipe update-rc.d-0.8+git-r0: task do_compile: Succeeded
NOTE: Running task 1419 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_unpack)
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: Running task 1420 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_install)
NOTE: Running task 1426 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_collect_spdx_deps)
NOTE: recipe systemd-1_256.8-r0: task do_write_config: Succeeded
NOTE: Running task 1428 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe procps-4.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 1429 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_install: Started
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Started
NOTE: recipe psmisc-23.7-r0: task do_unpack: Started
NOTE: recipe ca-certificates-20240203-r0: task do_compile: Succeeded
NOTE: recipe ca-certificates-20240203-r0: task do_collect_spdx_deps: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_install: Started
NOTE: Running task 1430 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_install)
NOTE: recipe ca-certificates-20240203-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe curl-8.11.0-r0: task do_populate_lic: Started
NOTE: recipe procps-4.0.4-r0: task do_unpack: Started
NOTE: recipe ca-certificates-20240203-r0: task do_install: Started
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1431 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_patch)
NOTE: recipe update-rc.d-0.8+git-r0: task do_install: Succeeded
NOTE: recipe kmod-33-r0: task do_fetch: Succeeded
NOTE: Running task 1433 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_unpack)
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Started
NOTE: recipe kmod-33-r0: task do_unpack: Started
NOTE: recipe curl-8.11.0-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_populate_lic unihash changed to e72c971c43ddf87238c02dc814f20b89017b0db85c48e34fa5252701f27fc9d7
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Succeeded
NOTE: Running task 1435 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_unpack)
NOTE: recipe psmisc-23.7-r0: task do_unpack: Succeeded
NOTE: Running task 1436 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_patch)
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Started
NOTE: recipe psmisc-23.7-r0: task do_patch: Started
NOTE: recipe procps-4.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 1437 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_patch)
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Succeeded
NOTE: Running task 1438 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_patch)
NOTE: recipe psmisc-23.7-r0: task do_patch: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_patch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_256.8-r0: task do_unpack: Succeeded
NOTE: recipe kmod-33-r0: task do_unpack: Succeeded
NOTE: Running task 1441 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.8.bb:do_patch)
NOTE: Running task 1442 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_patch)
NOTE: recipe procps-4.0.4-r0: task do_patch: Succeeded
NOTE: recipe kmod-33-r0: task do_patch: Started
NOTE: recipe systemd-1_256.8-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_configure: Succeeded
NOTE: Running task 1444 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_compile)
NOTE: recipe wayland-protocols-1.38-r0: task do_compile: Started
NOTE: recipe kmod-33-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_256.8-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_install: Succeeded
NOTE: recipe ca-certificates-20240203-r0: task do_install: Succeeded
NOTE: recipe wayland-protocols-1.38-r0: task do_compile: Succeeded
NOTE: Running task 1449 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_install)
NOTE: recipe linux-libc-headers-6.12-r0: task do_install: Succeeded
NOTE: Running task 1464 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-protocols-1.38-r0: task do_install: Started
NOTE: recipe glibc-2.40+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.40+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1465 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_configure)
NOTE: recipe glibc-2.40+git-r0: task do_configure: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_install: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_configure: Succeeded
NOTE: Running task 1467 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_compile)
NOTE: recipe glibc-2.40+git-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_fetch: Succeeded
NOTE: Running task 1468 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.43-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_unpack: Succeeded
NOTE: Running task 1469 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_patch)
NOTE: recipe xkeyboard-config-2.43-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_patch: Succeeded
NOTE: recipe curl-native-8.11.0-r0: task do_configure: Succeeded
NOTE: Running task 1471 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_compile)
NOTE: recipe curl-native-8.11.0-r0: task do_compile: Started
NOTE: recipe curl-native-8.11.0-r0: task do_compile: Succeeded
NOTE: Running task 1472 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_install)
NOTE: recipe curl-native-8.11.0-r0: task do_install: Started
NOTE: recipe curl-native-8.11.0-r0: task do_install: Succeeded
NOTE: Running task 1473 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_populate_sysroot)
NOTE: recipe curl-native-8.11.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-native-8.11.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1474 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1475 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_configure)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1476 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_compile)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1477 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_install)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_install: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_install: Succeeded
NOTE: Running task 1478 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_populate_sysroot)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1479 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-native-0.191-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-native-0.191-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1480 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_configure)
NOTE: recipe elfutils-native-0.191-r0: task do_configure: Started
NOTE: recipe elfutils-native-0.191-r0: task do_configure: Succeeded
NOTE: Running task 1481 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_compile)
NOTE: recipe elfutils-native-0.191-r0: task do_compile: Started
NOTE: recipe elfutils-native-0.191-r0: task do_compile: Succeeded
NOTE: Running task 1482 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_install)
NOTE: recipe elfutils-native-0.191-r0: task do_install: Started
NOTE: recipe elfutils-native-0.191-r0: task do_install: Succeeded
NOTE: Running task 1483 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_populate_sysroot)
NOTE: recipe elfutils-native-0.191-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-native-0.191-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1484 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1485 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_prepare_recipe_sysroot)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1486 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_configure)
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1487 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_configure)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_configure: Started
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_configure: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1488 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_compile)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_compile: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1489 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_install)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_install: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_install: Succeeded
NOTE: Running task 1490 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_populate_sysroot)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1491 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_compile)
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_compile: Started
NOTE: recipe glibc-2.40+git-r0: task do_compile: Succeeded
NOTE: Running task 1492 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_install)
NOTE: recipe glibc-2.40+git-r0: task do_install: Started
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1493 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_install)
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_install: Started
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_install: Succeeded
NOTE: Running task 1494 of 2042 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_populate_sysroot)
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1495 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_package)
NOTE: Running task 1496 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 1497 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_package)
NOTE: Running task 1498 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_package)
NOTE: Running task 1499 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package)
NOTE: Running task 1500 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe ca-certificates-20240203-r0: task do_package: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_package: Started
NOTE: recipe initscripts-1.0-r0: task do_package: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_package: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_package: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_package unihash changed to cd8e8ca47211f426d23aae0eb4b31eb3d41e1d19ab5c47f4cf1f79f34104e49b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_packagedata became valid
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.38-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe update-rc.d-0.8+git-r0: task do_package: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_package unihash changed to 31b98198f0cd11b406bbb3d999554fcf59e70c7143cc08ad43561266c4119609
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata became valid
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package unihash changed to cca3242b3e025ae639454c4dc1ec455653d9f6c08e58d3644ab5e6abc19c3f2b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx became valid
NOTE: Running setscene task 717 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 724 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe ca-certificates-20240203-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_package unihash changed to 1572f3f7fcf651358e74fce9070447d3c35c47d8a2fa2b3c22f7c7a2a6cbcd38
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_create_spdx became valid
NOTE: Running setscene task 719 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_package_write_deb_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 720 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 721 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_create_spdx_setscene)
NOTE: Running setscene task 723 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 724 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_package_qa_setscene)
NOTE: recipe ca-certificates-20240203-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ca-certificates-20240203-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ca-certificates-20240203-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20240203-r0: task do_package_qa_setscene: Started
NOTE: recipe ca-certificates-20240203-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe ca-certificates-20240203-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ca-certificates-20240203-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ca-certificates-20240203-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20240203-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package unihash changed to f14b4cba8995efdba7c0c76674148e200a7470b465bd5ceac2b57da81d269f8a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata became valid
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20240203-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe linux-libc-headers-6.12-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_package unihash changed to 23cc9852a91a2dda09e6b9aa7f49df8e555b05b8c6dfb4cc1b2e795a08135f72
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata became valid
NOTE: Running setscene task 664 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_create_spdx_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1514 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_collect_spdx_deps)
NOTE: recipe glibc-2.40+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe glibc-2.40+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1517 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1518 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_package)
NOTE: recipe libgcc-14.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.40+git-r0: task do_package: Started
NOTE: recipe libgcc-14.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1519 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_configure)
NOTE: recipe libgcc-14.2.0-r0: task do_configure: Started
NOTE: recipe libgcc-14.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1520 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_compile)
NOTE: recipe libgcc-14.2.0-r0: task do_compile: Started
NOTE: recipe libgcc-14.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1521 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_install)
NOTE: recipe libgcc-14.2.0-r0: task do_install: Started
NOTE: recipe libgcc-14.2.0-r0: task do_install: Succeeded
NOTE: Running task 1522 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_multilib_install)
NOTE: recipe libgcc-14.2.0-r0: task do_multilib_install: Started
NOTE: recipe libgcc-14.2.0-r0: task do_multilib_install: Succeeded
NOTE: Running task 1523 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_extra_symlinks)
NOTE: recipe libgcc-14.2.0-r0: task do_extra_symlinks: Started
NOTE: recipe libgcc-14.2.0-r0: task do_extra_symlinks: Succeeded
NOTE: Running task 1525 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1526 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_configure)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_configure: Started
NOTE: recipe glibc-2.40+git-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_package unihash changed to b33c8d82a5bba307ae615a305be0e3febe246651548e13d18d12cd7b4a6d38fa
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_packagedata became valid
NOTE: Running setscene task 662 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.40+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_packagedata_setscene)
NOTE: recipe glibc-2.40+git-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1528 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_package)
NOTE: Running task 1530 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_collect_spdx_deps)
NOTE: recipe libgcc-14.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcc-14.2.0-r0: task do_package: Started
NOTE: recipe libgcc-14.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_package unihash changed to 0a3d2b4a5bbddf4cc2e29a1d9083eb438e61cbb730d0bcbe62f0f6351e110c07
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_create_spdx became valid
NOTE: Running setscene task 657 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1533 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_collect_spdx_deps)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1534 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_compile)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_compile: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1535 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_install)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_install: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_install: Succeeded
NOTE: Running task 1542 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1543 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1544 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1545 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1546 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1547 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1548 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1549 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1550 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1551 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1552 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_package)
NOTE: Running task 1553 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1554 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1555 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1556 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1557 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.6.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.47.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.6.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2024.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_package: Started
NOTE: recipe zlib-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1558 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_configure)
NOTE: recipe zlib-1.3.1-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1559 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_configure)
NOTE: recipe libtirpc-1.3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1560 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_configure)
NOTE: Running task 1561 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_configure)
NOTE: recipe libffi-3.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.47.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1562 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_configure)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1563 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_configure)
NOTE: recipe libcap-ng-0.8.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1564 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_configure)
NOTE: recipe expat-2.6.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-passwd-3.6.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1565 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.0.bb:do_configure)
NOTE: Running task 1566 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Started
NOTE: Running task 1567 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_configure)
NOTE: Running task 1568 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_configure)
NOTE: recipe libseccomp-2.5.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1569 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_configure)
NOTE: Running task 1570 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb:do_configure)
NOTE: Running task 1571 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_configure)
NOTE: recipe libtirpc-1.3.6-r0: task do_configure: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_configure: Started
NOTE: recipe gdbm-1.24-r0: task do_configure: Started
NOTE: recipe libffi-3.4.6-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.47.0-r0: task do_configure: Started
NOTE: Running task 1572 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_compile)
NOTE: recipe bash-completion-2.14.0-r0: task do_configure: Started
NOTE: recipe expat-2.6.4-r0: task do_configure: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_configure: Started
NOTE: recipe libunistring-1.3-r0: task do_configure: Started
NOTE: recipe base-passwd-3.6.5-r0: task do_configure: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_configure: Started
NOTE: recipe xorgproto-2024.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1573 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1574 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_install)
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1575 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_configure)
NOTE: recipe zlib-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1576 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_configure_ptest_base)
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Succeeded
NOTE: Running task 1578 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2024.1-r0: task do_configure: Started
NOTE: recipe zlib-1.3.1-r0: task do_configure_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1579 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1580 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: recipe openssl-3.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1581 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_configure)
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe openssl-3.4.0-r0: task do_configure: Started
NOTE: recipe xorgproto-2024.1-r0: task do_configure: Succeeded
NOTE: Running task 1582 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1583 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_configure)
NOTE: recipe xz-5.6.3-r0: task do_configure: Started
NOTE: recipe expat-2.6.4-r0: task do_configure: Succeeded
NOTE: Running task 1584 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_compile)
NOTE: recipe zlib-1.3.1-r0: task do_compile: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 1585 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_configure_ptest_base)
NOTE: recipe zlib-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1586 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_compile_ptest_base)
NOTE: recipe expat-2.6.4-r0: task do_configure_ptest_base: Started
NOTE: recipe expat-2.6.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1587 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_compile)
NOTE: recipe zlib-1.3.1-r0: task do_compile_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1588 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_install)
NOTE: recipe expat-2.6.4-r0: task do_compile: Started
NOTE: recipe zlib-1.3.1-r0: task do_install: Started
NOTE: recipe base-passwd-3.6.5-r0: task do_configure: Succeeded
NOTE: Running task 1589 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 1590 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_install_ptest_base)
NOTE: recipe ncurses-6.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.1-r0: task do_install_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1592 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_compile)
NOTE: recipe ncurses-6.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1593 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_configure)
NOTE: recipe bash-completion-2.14.0-r0: task do_compile: Started
NOTE: recipe ncurses-6.5-r0: task do_configure: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 1594 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_install)
NOTE: recipe bash-completion-2.14.0-r0: task do_install: Started
NOTE: recipe expat-2.6.4-r0: task do_compile: Succeeded
NOTE: Running task 1595 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_compile_ptest_base)
NOTE: recipe expat-2.6.4-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.6.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1596 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_install)
NOTE: recipe expat-2.6.4-r0: task do_install: Started
NOTE: recipe expat-2.6.4-r0: task do_install: Succeeded
NOTE: Running task 1597 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_install_ptest_base)
NOTE: recipe expat-2.6.4-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.6.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1599 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1600 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_configure)
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_configure: Started
NOTE: Running task 1601 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_package unihash changed to 08aba2b996c8c593bade7738f89d577896bd163833f1c921e7e6843dd9b087cc
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_create_spdx became valid
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe sqlite3-3_3.47.0-r0: task do_configure: Succeeded
NOTE: Running setscene task 633 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running task 1602 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: Running task 1603 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.0.bb:do_compile)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.47.0-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 721 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 724 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1605 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package)
NOTE: recipe libcap-ng-0.8.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1606 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_compile)
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1607 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb:do_compile)
NOTE: recipe base-passwd-3.6.5-r0: task do_compile: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1608 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1609 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe libtirpc-1.3.6-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe base-passwd-3.6.5-r0: task do_compile: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1610 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: Running task 1611 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe base-passwd-3.6.5-r0: task do_install: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_compile: Succeeded
NOTE: Running task 1612 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_install)
NOTE: recipe base-passwd-3.6.5-r0: task do_install: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_install: Started
NOTE: Running task 1613 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_package)
NOTE: recipe libffi-3.4.6-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1614 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_compile)
NOTE: recipe gdbm-1.24-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1615 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_configure_ptest_base)
NOTE: recipe zlib-1.3.1-r0: task do_package: Started
NOTE: recipe libffi-3.4.6-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_configure_ptest_base: Started
NOTE: Running task 1616 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe gdbm-1.24-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1617 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_compile: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package unihash changed to b9711b71003cc8a194840ebeeb3a3fd413925494505e900252bdf99d511b7986
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx became valid
NOTE: Running setscene task 724 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1618 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_configure_ptest_base)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1620 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_prepare_recipe_sysroot)
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_configure_ptest_base: Started
NOTE: recipe openssl-3.4.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1621 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_compile)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_install: Succeeded
NOTE: recipe openssl-3.4.0-r0: task do_compile: Started
NOTE: Running task 1624 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1626 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_compile)
NOTE: recipe util-macros-1_1.20.2-r0: task do_configure: Started
NOTE: recipe xorgproto-2024.1-r0: task do_compile: Started
NOTE: recipe libpcre2-10.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1627 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_configure)
NOTE: recipe libtirpc-1.3.6-r0: task do_compile: Succeeded
NOTE: Running task 1628 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_install)
NOTE: recipe libpcre2-10.44-r0: task do_configure: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_install: Started
NOTE: recipe libffi-3.4.6-r0: task do_compile: Succeeded
NOTE: Running task 1629 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_install)
NOTE: recipe xorgproto-2024.1-r0: task do_compile: Succeeded
NOTE: Running task 1630 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_install)
NOTE: recipe libffi-3.4.6-r0: task do_install: Started
NOTE: recipe xorgproto-2024.1-r0: task do_install: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1631 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_compile)
NOTE: recipe libxcrypt-4.4.36-r0: task do_compile: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_install: Succeeded
NOTE: Running task 1633 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnsl2-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.4.6-r0: task do_install: Succeeded
NOTE: Running task 1636 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_configure_ptest_base)
NOTE: recipe libnsl2-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1637 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_configure)
NOTE: recipe libseccomp-2.5.5-r0: task do_configure_ptest_base: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_configure: Started
NOTE: Running task 1638 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_compile)
NOTE: recipe xorgproto-2024.1-r0: task do_install: Succeeded
NOTE: Running task 1640 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_package)
NOTE: recipe libseccomp-2.5.5-r0: task do_compile: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_package: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 1642 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_package)
NOTE: recipe libffi-3.4.6-r0: task do_package: Started
NOTE: recipe zlib-1.3.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_package unihash changed to 7272d8938ec598cabb0090791dee63a7ebd571a5f8bf700a4bc055da71e42af6
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata became valid
NOTE: recipe gdbm-1.24-r0: task do_compile: Succeeded
NOTE: Running setscene task 699 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running task 1643 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_compile_ptest_base)
NOTE: recipe libxcrypt-4.4.36-r0: task do_compile: Succeeded
NOTE: Running task 1644 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_install)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_compile_ptest_base: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_install: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1646 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcrypt-4.4.36-r0: task do_install: Succeeded
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1648 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.24-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1649 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_install)
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1650 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_package)
NOTE: recipe gdbm-1.24-r0: task do_install: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_package: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_configure: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1651 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_compile)
NOTE: Running task 1652 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_configure)
NOTE: recipe util-macros-1_1.20.2-r0: task do_compile: Started
NOTE: recipe libpam-1.6.1-r0: task do_configure: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_compile: Succeeded
NOTE: Running task 1653 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_install)
NOTE: recipe util-macros-1_1.20.2-r0: task do_install: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_install: Succeeded
NOTE: Running task 1655 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_configure)
NOTE: recipe sed-4.9-r0: task do_configure: Started
NOTE: recipe gdbm-1.24-r0: task do_install: Succeeded
NOTE: Running task 1656 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_install_ptest_base)
NOTE: recipe libtirpc-1.3.6-r0: task do_package: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_package unihash changed to c99abc41ba1dca79785443cb2f3b667bf2ff37aae6a484f9271f1ddfe2469710
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata became valid
NOTE: recipe gdbm-1.24-r0: task do_install_ptest_base: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_package unihash changed to 430d480fe601fc02ac87e24e6a41f69b3ff77315729aa31b327bcb8810cd14f6
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata became valid
NOTE: Running setscene task 723 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 724 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1658 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1660 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_package)
NOTE: Running task 1662 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb:do_package)
NOTE: recipe perl-5.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.24-r0: task do_package: Started
NOTE: recipe base-passwd-3.6.5-r0: task do_package: Started
NOTE: recipe perl-5.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1663 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_configure)
NOTE: recipe perl-5.40.0-r0: task do_configure: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_compile: Succeeded
NOTE: Running task 1669 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe attr-2.5.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1670 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_configure_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe attr-2.5.2-r0: task do_configure_ptest_base: Started
NOTE: recipe attr-2.5.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1671 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_compile)
NOTE: recipe attr-2.5.2-r0: task do_compile: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_package unihash changed to 5208a00e1082001a5695b070bdf783523058d2f59db181e2eee8b1081c434a6e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_packagedata became valid
NOTE: Running setscene task 699 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_create_spdx_setscene)
NOTE: recipe libxcrypt-4.4.36-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_packagedata_setscene)
NOTE: recipe libxcrypt-4.4.36-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1673 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_package)
NOTE: recipe attr-2.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1674 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_compile_ptest_base)
NOTE: recipe attr-2.5.2-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.6.4-r0: task do_package: Started
NOTE: recipe attr-2.5.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1675 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_install)
NOTE: recipe attr-2.5.2-r0: task do_install: Started
NOTE: recipe attr-2.5.2-r0: task do_install: Succeeded
NOTE: Running task 1676 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_install_ptest_base)
NOTE: recipe base-passwd-3.6.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb:do_package unihash changed to 330310113d045d4542cce9c7a47bc72508c298b255ed22c660efd695a76f8967
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb:do_create_spdx became valid
NOTE: Running setscene task 724 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb:do_create_spdx_setscene)
NOTE: recipe xz-5.6.3-r0: task do_configure: Succeeded
NOTE: Running task 1677 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_configure_ptest_base)
NOTE: recipe attr-2.5.2-r0: task do_install_ptest_base: Started
NOTE: recipe base-passwd-3.6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_configure_ptest_base: Started
NOTE: recipe xz-5.6.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe base-passwd-3.6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1678 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_compile)
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1680 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.6.3-r0: task do_compile: Started
NOTE: recipe base-passwd-3.6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1681 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package)
NOTE: recipe attr-2.5.2-r0: task do_package: Started
NOTE: recipe acl-2.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1682 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_configure)
NOTE: recipe acl-2.3.2-r0: task do_configure: Started
NOTE: recipe expat-2.6.4-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_package unihash changed to ace3a5205d1027bc0f10a51819e049568836f01582abe4fb67b3d8be1fdc8e9e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_packagedata became valid
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package unihash changed to 1750ab27cd7b1146941b237949a6203fdff0f466633ed6d8970aeb173ecda631
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata became valid
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running task 1685 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_compile_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_compile_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1687 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package)
NOTE: recipe bash-completion-2.14.0-r0: task do_package: Started
NOTE: recipe gdbm-1.24-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_package unihash changed to 0305aa04d63131c8cdc20c41f36359bde8753882974ffc3e31550c6bce08145d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata became valid
NOTE: Running setscene task 705 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_create_spdx_setscene)
NOTE: recipe gdbm-1.24-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1689 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnsl2-2.0.1-r0: task do_configure: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Setscene tasks completed
NOTE: Running task 1690 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_compile)
NOTE: recipe libnsl2-2.0.1-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1691 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_install)
NOTE: recipe libseccomp-2.5.5-r0: task do_install: Started
NOTE: recipe libpcre2-10.44-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1692 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_compile)
NOTE: recipe xcb-proto-1.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1693 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcre2-10.44-r0: task do_compile: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1694 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxau-1_1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1695 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_install)
NOTE: recipe libseccomp-2.5.5-r0: task do_install: Succeeded
NOTE: Running task 1696 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.6.3-r0: task do_compile: Succeeded
NOTE: Running task 1697 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_compile_ptest_base)
NOTE: recipe libnsl2-2.0.1-r0: task do_install: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1698 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_configure)
NOTE: recipe xz-5.6.3-r0: task do_compile_ptest_base: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_configure: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1699 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_configure)
NOTE: recipe attr-2.5.2-r0: task do_package: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_configure: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package unihash changed to 21bfb58218f43ec18c6513793199cac533f73252518ad5e5bf120284d135ca29
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata became valid
NOTE: Running setscene task 717 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running task 1701 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_configure)
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_configure: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1703 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_configure)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_configure: Started
NOTE: recipe xz-5.6.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1704 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_install)
NOTE: recipe xz-5.6.3-r0: task do_install: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package unihash changed to 5154176d931f82a8bdfa084160f3d5d8441ad5fa1a49b1aae503d66aaa9e400d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata became valid
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1706 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_package)
NOTE: recipe xcb-proto-1.17.0-r0: task do_configure: Succeeded
NOTE: Running task 1707 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_compile)
NOTE: recipe libnsl2-2.0.1-r0: task do_package: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_compile: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_compile: Succeeded
NOTE: Running task 1708 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_install)
NOTE: recipe xcb-proto-1.17.0-r0: task do_install: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_install: Succeeded
NOTE: Running task 1712 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpthread-stubs-0.5-r0: task do_configure: Succeeded
NOTE: Running task 1713 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_compile)
NOTE: recipe xkeyboard-config-2.43-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_compile: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_compile: Succeeded
NOTE: Running task 1714 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_install)
NOTE: recipe libpthread-stubs-0.5-r0: task do_install: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_install: Succeeded
NOTE: recipe xkeyboard-config-2.43-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1715 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_configure)
NOTE: Running task 1717 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.6.3-r0: task do_install: Succeeded
NOTE: Running task 1718 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_install_ptest_base)
NOTE: recipe xkeyboard-config-2.43-r0: task do_configure: Started
NOTE: recipe glibc-locale-2.40+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.6.3-r0: task do_install_ptest_base: Started
NOTE: recipe glibc-locale-2.40+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 1719 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_configure)
NOTE: Running noexec task 1720 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_compile)
NOTE: Running task 1721 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_install)
NOTE: recipe libpcre2-10.44-r0: task do_compile: Succeeded
NOTE: Running task 1722 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_install)
NOTE: recipe xz-5.6.3-r0: task do_install_ptest_base: Succeeded
NOTE: recipe glibc-locale-2.40+git-r0: task do_install: Started
NOTE: Running task 1724 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_package)
NOTE: recipe libpcre2-10.44-r0: task do_install: Started
NOTE: recipe xz-5.6.3-r0: task do_package: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_package: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_configure: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_package unihash changed to 23c9dcde61cce7acfa45ec6945fe80c80ef0101bedcf72ff78665799436f6369
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata became valid
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: Running task 1725 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_configure_ptest_base)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_configure_ptest_base: Started
NOTE: recipe acl-2.3.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1726 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_compile)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1728 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_package)
NOTE: recipe acl-2.3.2-r0: task do_compile: Started
NOTE: recipe xorgproto-2024.1-r0: task do_package: Started
NOTE: recipe libpcre2-10.44-r0: task do_install: Succeeded
NOTE: Running task 1738 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_package)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1739 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_compile)
NOTE: recipe util-macros-1_1.20.2-r0: task do_package: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_configure: Succeeded
NOTE: Running task 1740 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_compile)
NOTE: recipe xkeyboard-config-2.43-r0: task do_compile: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_compile: Succeeded
NOTE: Running task 1741 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_install)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_install: Started
NOTE: recipe acl-2.3.2-r0: task do_compile: Succeeded
NOTE: recipe xkeyboard-config-2.43-r0: task do_compile: Succeeded
NOTE: Running task 1742 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_compile_ptest_base)
NOTE: Running task 1743 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_install)
NOTE: recipe acl-2.3.2-r0: task do_compile_ptest_base: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_install: Started
NOTE: recipe xorgproto-2024.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_package unihash changed to 6da0ce164de1a109f27890f0e95faf781df5e65a7f12389069d9f8305f15dbb4
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata became valid
NOTE: Running setscene task 724 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1745 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1746 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_install)
NOTE: recipe zstd-1.5.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe acl-2.3.2-r0: task do_install: Started
NOTE: recipe zstd-1.5.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1747 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_configure)
NOTE: recipe zstd-1.5.6-r0: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_install: Succeeded
NOTE: Running task 1749 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_package)
NOTE: recipe zstd-1.5.6-r0: task do_configure: Succeeded
NOTE: Running task 1750 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_compile)
NOTE: recipe zstd-1.5.6-r0: task do_compile: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_package: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_package unihash changed to e9667fd4dac428d8e7ecb3670f83b7765a7e1eb3287f09b2aa8687dc8d931487
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata became valid
NOTE: Running setscene task 711 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.43-r0: task do_install: Succeeded
NOTE: Running task 1752 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_install_ptest_base)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_install: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_install_ptest_base: Started
NOTE: Running task 1753 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_install_ptest_base)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1755 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_package)
NOTE: recipe acl-2.3.2-r0: task do_install_ptest_base: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_package: Started
NOTE: recipe acl-2.3.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1759 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_package)
NOTE: recipe xcb-proto-1.17.0-r0: task do_package: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1760 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_compile)
NOTE: recipe libxau-1_1.0.11-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_install_ptest_base: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_package: Succeeded
NOTE: Running task 1762 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_package)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_package unihash changed to 7cfdca0a69b013da87bddc35a16f60b1e845a557ea38fbaac2b6268d817e06ff
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata became valid
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_package: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_package: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1763 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_package)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_package unihash changed to 778ff7b4581b1cebb432f3ca2deb944510bec81f81195a46b1d20dab343e8d41
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata became valid
NOTE: recipe libpcre2-10.44-r0: task do_package: Started
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_compile: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 1764 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_install)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1765 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_configure_ptest_base)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1768 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_package)
NOTE: recipe libxau-1_1.0.11-r0: task do_install: Started
NOTE: recipe libpam-1.6.1-r0: task do_configure_ptest_base: Started
NOTE: recipe xz-5.6.3-r0: task do_package: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1769 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_compile)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_package unihash changed to c69c5c7edb9fc376662da601b98f47617aa35f9cf2840db905369d201fb86dc1
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_packagedata became valid
NOTE: recipe xkeyboard-config-2.43-r0: task do_package: Started
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_compile: Started
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_install: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_package: Succeeded
NOTE: Running task 1771 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_package)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_package unihash changed to 8de518121d72e0deb46c179fef6393e22d9c819cff8a558a9ba4e2a1ea205d7d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata became valid
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running task 1773 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_package)
NOTE: recipe libxau-1_1.0.11-r0: task do_package: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1774 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_compile)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_package: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1776 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_compile: Started
NOTE: recipe acl-2.3.2-r0: task do_package: Started
NOTE: recipe glibc-locale-2.40+git-r0: task do_install: Succeeded
NOTE: Running task 1777 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_package)
NOTE: recipe glibc-locale-2.40+git-r0: task do_package: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_package unihash changed to 6946f746bc56d8debde6e5498990761e76f162bab0dc0361c51e28a326573935
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata became valid
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_compile: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 1778 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_install)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1786 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_collect_spdx_deps)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_install: Started
NOTE: recipe libunistring-1.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libunistring-1.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1787 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_collect_spdx_deps)
NOTE: recipe openssl-3.4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe openssl-3.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1789 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_collect_spdx_deps)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 1791 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.6.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpam-1.6.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1792 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package)
NOTE: recipe libxcb-1.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxcb-1.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1793 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_configure)
NOTE: recipe libxcb-1.17.0-r0: task do_configure: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_package unihash changed to db236cc60d30f62aefce87d5d63084237eec2e53f41c721cf3ae3f2ce3dd8efc
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata became valid
NOTE: Running setscene task 715 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1800 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_collect_spdx_deps)
NOTE: recipe libpcre2-10.44-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_package unihash changed to 1ba2419715d8fdd1e4005b2bfbaa228a72c88738a88044bea1d3c97c04601238
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata became valid
NOTE: recipe glibc-locale-2.40+git-r0: task do_collect_spdx_deps: Started
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata_setscene)
NOTE: recipe glibc-locale-2.40+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1802 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_collect_spdx_deps)
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xkeyboard-config-2.43-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_package unihash changed to dd0725a7948799106b4ceb33ba3da3b48877430feeee428b8b5f53fadc99b949
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_packagedata became valid
NOTE: recipe acl-2.3.2-r0: task do_package: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package unihash changed to f277fd3c1f46900beaadc088ea24ff7e88bdf39e798b3df75e2da9b9744a530c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata became valid
NOTE: recipe xkeyboard-config-2.43-r0: task do_packagedata_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package unihash changed to e5f83b57c5a64bb32583f6b1a8b0eb2b3b687f0041dad050ee3b1cacda85b321
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata became valid
NOTE: Running setscene task 714 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 722 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.3-r0: task do_configure: Succeeded
NOTE: Running task 1804 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_compile)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe ncurses-6.5-r0: task do_configure: Succeeded
NOTE: Running task 1808 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_compile)
NOTE: recipe ncurses-6.5-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_package unihash changed to a850a533ab22e560fe59d553289e689bc665b98ce956d600e15d8f71e778edbd
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata became valid
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe sed-4.9-r0: task do_configure: Succeeded
NOTE: Running task 1810 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_configure_ptest_base)
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1811 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_compile)
NOTE: recipe sed-4.9-r0: task do_compile: Started
NOTE: recipe sed-4.9-r0: task do_compile: Succeeded
NOTE: Running task 1812 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_compile_ptest_base)
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1813 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_install)
NOTE: recipe sed-4.9-r0: task do_install: Started
NOTE: recipe libxcb-1.17.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1814 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_compile)
NOTE: recipe libxcb-1.17.0-r0: task do_compile: Started
NOTE: recipe sed-4.9-r0: task do_install: Succeeded
NOTE: Running task 1815 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_install_ptest_base)
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1816 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: recipe ncurses-6.5-r0: task do_compile: Succeeded
NOTE: Running task 1817 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_install)
NOTE: recipe ncurses-6.5-r0: task do_install: Started
NOTE: recipe libxcb-1.17.0-r0: task do_compile: Succeeded
NOTE: Running task 1818 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_install)
NOTE: recipe libxcb-1.17.0-r0: task do_install: Started
NOTE: recipe openssl-3.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1819 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_compile_ptest_base)
NOTE: recipe openssl-3.4.0-r0: task do_compile_ptest_base: Started
NOTE: recipe openssl-3.4.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1820 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_install)
NOTE: recipe openssl-3.4.0-r0: task do_install: Started
NOTE: recipe zstd-1.5.6-r0: task do_compile: Succeeded
NOTE: Running task 1821 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_install)
NOTE: recipe sqlite3-3_3.47.0-r0: task do_compile: Succeeded
NOTE: Running task 1822 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.0.bb:do_install)
NOTE: recipe zstd-1.5.6-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.47.0-r0: task do_install: Started
NOTE: recipe libpam-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1823 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_compile_ptest_base)
NOTE: recipe sqlite3-3_3.47.0-r0: task do_install: Succeeded
NOTE: Running task 1825 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.0.bb:do_package)
NOTE: recipe libpam-1.6.1-r0: task do_compile_ptest_base: Started
NOTE: recipe sqlite3-3_3.47.0-r0: task do_package: Started
NOTE: recipe libpam-1.6.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1826 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_install)
NOTE: recipe libpam-1.6.1-r0: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package unihash changed to e47892250ad3c92df9c54d4cbf00d1ace9e3806174495c904982c3dfb4ea0bc3
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata became valid
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_install: Succeeded
NOTE: Running task 1828 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_package: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe openssl-3.4.0-r0: task do_install: Succeeded
NOTE: Running task 1830 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_install_ptest_base)
NOTE: recipe sqlite3-3_3.47.0-r0: task do_package: Succeeded
NOTE: recipe openssl-3.4.0-r0: task do_install_ptest_base: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.0.bb:do_package unihash changed to f93c64083de50d9aa301f5749443afbc185d23a59b3bf6f74ebd0eaeaaf4e348
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.0.bb:do_packagedata became valid
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.0.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.47.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.47.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libpam-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 1832 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_install_ptest_base)
NOTE: recipe libpam-1.6.1-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.6.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1834 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1835 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_package)
NOTE: Running task 1836 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.71.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.71-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpam-1.6.1-r0: task do_package: Started
NOTE: recipe libcap-2.71-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1837 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.71.bb:do_configure)
NOTE: recipe libcap-2.71-r0: task do_configure: Started
NOTE: recipe shadow-4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1838 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_configure)
NOTE: recipe libcap-2.71-r0: task do_configure: Succeeded
NOTE: Running task 1839 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.71.bb:do_compile)
NOTE: recipe shadow-4.16.0-r0: task do_configure: Started
NOTE: recipe libcap-2.71-r0: task do_compile: Started
NOTE: recipe libcap-2.71-r0: task do_compile: Succeeded
NOTE: Running task 1840 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.71.bb:do_install)
NOTE: recipe libxcb-1.17.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package unihash changed to ae4bcb25690c6422f57bd75ddb3871021f9bd17c4320df3b24a89e3be318df5c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata became valid
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.71-r0: task do_install: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe zstd-1.5.6-r0: task do_install: Succeeded
NOTE: Running task 1843 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_package)
NOTE: recipe zstd-1.5.6-r0: task do_package: Started
NOTE: recipe libcap-2.71-r0: task do_install: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_package unihash changed to e132794165f2ab3f61991356032e3e79f305f2597e22c95437121ced09034d94
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata became valid
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libpam-1.6.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_package unihash changed to ece7581bd1e0160b41962417c7dca2e669f1cf7a4b0369180e305c4a7f3caada
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata became valid
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1847 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.71.bb:do_package)
NOTE: Running task 1848 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_create_spdx)
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx: Started
NOTE: recipe libcap-2.71-r0: task do_package: Started
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1849 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.16.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.16.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_install: Succeeded
NOTE: Running task 1851 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1852 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1853 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package)
NOTE: Running task 1854 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libedit-20240808-3.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe psmisc-23.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.40.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.5-r0: task do_package: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1855 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_configure)
NOTE: recipe psmisc-23.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1856 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_configure)
NOTE: recipe libedit-20240808-3.1-r1: task do_configure: Started
NOTE: recipe psmisc-23.7-r0: task do_configure: Started
NOTE: recipe util-linux-2.40.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1857 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_configure)
NOTE: recipe util-linux-2.40.2-r0: task do_configure: Started
NOTE: recipe openssl-3.4.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1859 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_package)
NOTE: Running task 1860 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-33-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.4.0-r0: task do_package: Started
NOTE: recipe libcap-2.71-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.71.bb:do_package unihash changed to dede10d189c17d3a885848774abc96ed469973dbb3a47ce9cda9951fa74aba86
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.71.bb:do_packagedata became valid
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.71.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.71-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.71-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe kmod-33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1862 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_configure)
NOTE: recipe kmod-33-r0: task do_configure: Started
NOTE: recipe shadow-4.16.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1863 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_compile)
NOTE: recipe shadow-4.16.0-r0: task do_compile: Started
NOTE: recipe shadow-4.16.0-r0: task do_compile: Succeeded
NOTE: Running task 1864 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_install)
NOTE: recipe shadow-4.16.0-r0: task do_install: Started
NOTE: recipe shadow-4.16.0-r0: task do_install: Succeeded
NOTE: Running task 1866 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_package)
NOTE: Running task 1867 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.16.0-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1868 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_configure)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1869 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_compile)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1870 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_install)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_install: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_configure: Succeeded
NOTE: Running task 1872 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_compile)
NOTE: recipe libedit-20240808-3.1-r1: task do_compile: Started
NOTE: recipe ncurses-6.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package unihash changed to a095bb3338f74515c27ccff48ad5f2e086aea4d64db3ca3b198355106b3b7405
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata became valid
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libedit-20240808-3.1-r1: task do_compile: Succeeded
NOTE: Running task 1874 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_install)
NOTE: recipe libedit-20240808-3.1-r1: task do_install: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_install: Succeeded
NOTE: Running task 1876 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1877 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_package)
NOTE: recipe shadow-4.16.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_package unihash changed to 6670d674dbba682bf35734454c65f8af423fc598f6ba0f0d7341e76cd3c3092b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_packagedata became valid
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_packagedata_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_package: Started
NOTE: recipe python3-3.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-33-r0: task do_configure: Succeeded
NOTE: Running task 1878 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_compile)
NOTE: recipe kmod-33-r0: task do_compile: Started
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1880 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package)
NOTE: Running task 1881 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_create_spdx)
NOTE: recipe shadow-4.16.0-r0: task do_create_spdx: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package: Started
NOTE: recipe python3-3.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1882 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_configure)
NOTE: recipe python3-3.13.0-r0: task do_configure: Started
NOTE: recipe shadow-4.16.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1883 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_collect_spdx_deps)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe perl-5.40.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1884 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_configure_ptest_base)
NOTE: recipe perl-5.40.0-r0: task do_configure_ptest_base: Started
NOTE: recipe perl-5.40.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1885 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_compile)
NOTE: recipe perl-5.40.0-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe kmod-33-r0: task do_compile: Succeeded
NOTE: Running task 1886 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_install)
NOTE: recipe kmod-33-r0: task do_install: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_package unihash changed to 59e2d5594ed67e4addc200db9fa7470f2a13890029c7c327f3ca86d3324ff83a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_packagedata became valid
NOTE: Running setscene task 705 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_packagedata_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package: Succeeded
NOTE: Running task 1887 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata)
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata unihash changed to 2c45ed581d0c3cb2d62dd4cf712f422373bac7744990684fb32d25bd03607cfc
NOTE: recipe kmod-33-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1889 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1891 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_compile)
NOTE: recipe psmisc-23.7-r0: task do_compile: Started
NOTE: recipe libunistring-1.3-r0: task do_compile: Succeeded
NOTE: Running task 1892 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_install)
NOTE: recipe libunistring-1.3-r0: task do_install: Started
NOTE: recipe psmisc-23.7-r0: task do_compile: Succeeded
NOTE: Running task 1893 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_install)
NOTE: recipe psmisc-23.7-r0: task do_install: Started
NOTE: recipe libunistring-1.3-r0: task do_install: Succeeded
NOTE: Running task 1895 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1896 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_package)
NOTE: recipe libunistring-1.3-r0: task do_package: Started
NOTE: recipe libidn2-2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe psmisc-23.7-r0: task do_install: Succeeded
NOTE: Running task 1897 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_package)
NOTE: recipe libidn2-2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1898 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_configure)
NOTE: recipe psmisc-23.7-r0: task do_package: Started
NOTE: recipe libidn2-2.3.7-r0: task do_configure: Started
NOTE: recipe libunistring-1.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_package unihash changed to 8bfbd7f2496b9f9d724211523632398e53478205179d839eb8b17f46ceca03d5
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_create_spdx became valid
NOTE: Running setscene task 722 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_create_spdx_setscene)
NOTE: recipe libunistring-1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1901 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_collect_spdx_deps)
NOTE: recipe psmisc-23.7-r0: task do_package: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_collect_spdx_deps: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_package unihash changed to f397f98602dde786d102b4d6169c5c7b67c07f50ac13dffd0a07fc5aa89b8f83
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata became valid
NOTE: recipe openssl-3.4.0-r0: task do_package: Succeeded
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_package unihash changed to 53a977f597c60d30632ed9af94ac85ffc6acbb582c2ec3666fd3c288d98d124e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_create_spdx became valid
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 700 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_create_spdx_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1903 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk)
NOTE: Running task 1904 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb)
NOTE: Running task 1905 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm)
NOTE: Running task 1906 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa)
NOTE: recipe openssl-3.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa: Started
NOTE: recipe openssl-3.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1908 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_package)
NOTE: Running task 1912 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_package_write_rpm)
NOTE: recipe ca-certificates-20240203-r0: task do_package_write_rpm: Started
NOTE: recipe kmod-33-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk unihash changed to 09cf5b1dceb06aa87988ecc5519b4936b205f4eef8ac1db9ee1670e8b30f8890
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb unihash changed to e76e955b16034b99d877d31972bb3e188622806a4ed083f6e3ae3e3de153234a
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa unihash changed to 7fd7e827140c7c25ea3ec4e1fefa55188b64961a1f51593c14251484b91edf41
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm unihash changed to c3da089a492c8228ca016b6ed991cc118f8858d933c42762169da4ee8908cfce
NOTE: recipe ca-certificates-20240203-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_package_write_rpm unihash changed to 33e6e68c151883230fdcff5f4b181e573505901318e18fd70067677cc1887c77
NOTE: recipe kmod-33-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_package unihash changed to 73c70c5020d1a0a880f456390b3f629cf9ead7aab3ee5fbba55261f56d3f810f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_packagedata became valid
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_packagedata_setscene)
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe util-linux-2.40.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1915 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_configure_ptest_base)
NOTE: recipe util-linux-2.40.2-r0: task do_configure_ptest_base: Started
NOTE: recipe util-linux-2.40.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1916 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_compile)
NOTE: recipe util-linux-2.40.2-r0: task do_compile: Started
NOTE: recipe util-linux-2.40.2-r0: task do_compile: Succeeded
NOTE: Running task 1917 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_compile_ptest_base)
NOTE: recipe util-linux-2.40.2-r0: task do_compile_ptest_base: Started
NOTE: recipe util-linux-2.40.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1918 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_install)
NOTE: recipe util-linux-2.40.2-r0: task do_install: Started
NOTE: recipe util-linux-2.40.2-r0: task do_install: Succeeded
NOTE: Running task 1919 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_install_ptest_base)
NOTE: recipe util-linux-2.40.2-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-2.40.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1921 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_package)
NOTE: recipe util-linux-2.40.2-r0: task do_package: Started
NOTE: recipe libidn2-2.3.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1922 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_compile)
NOTE: recipe libidn2-2.3.7-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.7-r0: task do_compile: Succeeded
NOTE: Running task 1923 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_install)
NOTE: recipe libidn2-2.3.7-r0: task do_install: Started
NOTE: recipe libidn2-2.3.7-r0: task do_install: Succeeded
NOTE: Running task 1925 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1926 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_package)
NOTE: recipe libidn2-2.3.7-r0: task do_package: Started
NOTE: recipe curl-8.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1927 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_configure)
NOTE: recipe curl-8.11.0-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.7-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_package unihash changed to 9aab88585e6a15072f2821e9e97b914c47a92614cb69390b60c1df23a26e3d0e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata became valid
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1929 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_create_spdx)
NOTE: recipe libidn2-2.3.7-r0: task do_create_spdx: Started
NOTE: recipe libidn2-2.3.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 1930 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_collect_spdx_deps)
NOTE: recipe curl-8.11.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe curl-8.11.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1931 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_configure_ptest_base)
NOTE: recipe python3-3.13.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.13.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1932 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_compile)
NOTE: recipe python3-3.13.0-r0: task do_compile: Started
NOTE: recipe util-linux-2.40.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_package unihash changed to a9b3559dee4d4550ed67b6c6e1434bd0c87f49e34f765954a401a644391dd58b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_packagedata became valid
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_compile: Succeeded
NOTE: Running task 1934 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_compile_ptest_base)
NOTE: recipe perl-5.40.0-r0: task do_compile_ptest_base: Started
NOTE: recipe perl-5.40.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1935 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_install)
NOTE: recipe perl-5.40.0-r0: task do_install: Started
NOTE: recipe python3-3.13.0-r0: task do_compile: Succeeded
NOTE: Running task 1936 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_compile_ptest_base)
NOTE: recipe python3-3.13.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-3.13.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1937 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_install)
NOTE: recipe python3-3.13.0-r0: task do_install: Started
NOTE: recipe curl-8.11.0-r0: task do_configure: Succeeded
NOTE: Running task 1938 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_configure_ptest_base)
NOTE: recipe curl-8.11.0-r0: task do_configure_ptest_base: Started
NOTE: recipe curl-8.11.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1939 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_compile)
NOTE: recipe curl-8.11.0-r0: task do_compile: Started
NOTE: recipe curl-8.11.0-r0: task do_compile: Succeeded
NOTE: Running task 1940 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_compile_ptest_base)
NOTE: recipe curl-8.11.0-r0: task do_compile_ptest_base: Started
NOTE: recipe curl-8.11.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1941 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_install)
NOTE: recipe curl-8.11.0-r0: task do_install: Started
NOTE: recipe curl-8.11.0-r0: task do_install: Succeeded
NOTE: Running task 1942 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_install_ptest_base)
NOTE: recipe curl-8.11.0-r0: task do_install_ptest_base: Started
NOTE: recipe glibc-locale-2.40+git-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_package unihash changed to fb05a7b2dccf97bae288e6a986eefa4b0160c692008ffd787f3e314eac0c8fac
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_package_qa became valid
NOTE: Running setscene task 715 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 716 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_package_qa_setscene)
NOTE: Running setscene task 718 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 724 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_create_spdx_setscene)
NOTE: recipe glibc-locale-2.40+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe glibc-locale-2.40+git-r0: task do_package_qa_setscene: Started
NOTE: recipe glibc-locale-2.40+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe glibc-locale-2.40+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-locale-2.40+git-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe glibc-locale-2.40+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glibc-locale-2.40+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe glibc-locale-2.40+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 725 of 725 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_packagedata_setscene)
NOTE: recipe glibc-locale-2.40+git-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_install: Succeeded
NOTE: Running task 1943 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_install_ptest_base)
NOTE: recipe perl-5.40.0-r0: task do_install_ptest_base: Started
NOTE: recipe glibc-locale-2.40+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1948 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_package_write_rpm)
NOTE: recipe glibc-locale-2.40+git-r0: task do_package_write_rpm: Started
NOTE: recipe python3-3.13.0-r0: task do_install: Succeeded
NOTE: Running task 1950 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_install_ptest_base)
NOTE: recipe python3-3.13.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-3.13.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1952 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1953 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1954 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_package)
NOTE: recipe python3-setuptools-75.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.13.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.13.0-r0: task do_package: Started
NOTE: recipe python3-setuptools-75.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1955 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_configure)
NOTE: recipe libxml2-2.13.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1956 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_configure)
NOTE: recipe python3-setuptools-75.6.0-r0: task do_configure: Started
NOTE: recipe libxml2-2.13.5-r0: task do_configure: Started
NOTE: recipe python3-setuptools-75.6.0-r0: task do_configure: Succeeded
NOTE: Running task 1957 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_compile)
NOTE: recipe python3-setuptools-75.6.0-r0: task do_compile: Started
NOTE: recipe python3-setuptools-75.6.0-r0: task do_compile: Succeeded
NOTE: Running task 1958 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_install)
NOTE: recipe perl-5.40.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-setuptools-75.6.0-r0: task do_install: Started
NOTE: Running task 1959 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_package)
NOTE: recipe perl-5.40.0-r0: task do_package: Started
NOTE: recipe python3-setuptools-75.6.0-r0: task do_install: Succeeded
NOTE: Running task 1962 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1963 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_configure: Succeeded
NOTE: Running task 1964 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_install_ptest_base
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/libauthretry /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/libauthretry
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/libntlmconnect /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/libntlmconnect
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/libprereq /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/libprereq
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib500 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib500
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib501 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib501
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib502 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib502
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib503 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib503
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib504 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib504
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib505 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib505
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib506 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib506
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib507 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib507
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib508 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib508
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib509 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib509
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib510 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib510
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib511 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib511
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib512 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib512
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib513 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib513
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib514 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib514
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib515 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib515
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib516 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib516
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib517 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib517
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib518 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib518
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib519 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib519
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib520 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib520
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib521 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib521
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib523 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib523
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib524 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib524
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib525 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib525
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib526 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib526
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib527 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib527
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib529 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib529
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib530 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib530
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib532 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib532
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib533 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib533
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib536 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib536
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib537 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib537
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib539 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib539
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib540 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib540
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib541 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib541
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib542 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib542
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib543 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib543
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib544 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib544
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib545 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib545
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib547 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib547
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib548 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib548
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib549 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib549
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib552 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib552
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib553 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib553
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib554 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib554
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib555 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib555
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib556 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib556
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib557 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib557
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib558 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib558
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib559 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib559
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib560 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib560
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib562 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib562
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib564 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib564
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib565 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib565
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib566 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib566
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib567 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib567
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib568 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib568
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib569 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib569
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib570 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib570
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib571 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib571
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib572 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib572
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib573 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib573
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib574 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib574
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib575 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib575
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib576 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib576
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib578 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib578
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib579 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib579
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib582 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib582
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib583 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib583
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib584 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib584
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib585 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib585
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib586 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib586
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib587 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib587
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib589 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib589
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib590 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib590
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib591 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib591
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib597 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib597
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib598 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib598
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib599 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib599
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib643 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib643
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib645 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib645
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib650 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib650
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib651 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib651
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib652 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib652
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib653 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib653
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib654 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib654
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib655 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib655
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib658 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib658
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib659 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib659
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib661 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib661
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib666 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib666
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib667 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib667
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib668 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib668
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib670 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib670
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib671 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib671
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib672 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib672
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib673 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib673
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib674 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib674
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib676 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib676
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib677 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib677
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib678 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib678
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1156 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1156
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1301 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1301
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1485 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1485
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1500 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1500
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1501 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1501
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1502 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1502
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1503 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1503
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1504 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1504
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1505 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1505
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1506 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1506
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1507 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1507
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1508 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1508
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1509 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1509
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1510 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1510
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1511 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1511
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1512 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1512
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1513 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1513
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1514 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1514
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1515 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1515
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1517 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1517
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1518 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1518
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1520 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1520
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1521 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1521
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1522 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1522
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1523 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1523
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1525 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1525
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1526 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1526
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1527 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1527
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1528 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1528
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1529 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1529
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1530 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1530
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1531 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1531
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1532 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1532
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1533 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1533
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1534 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1534
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1535 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1535
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1536 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1536
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1537 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1537
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1538 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1538
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1539 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1539
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1540 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1540
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1541 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1541
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1542 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1542
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1543 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1543
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1545 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1545
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1550 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1550
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1551 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1551
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1552 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1552
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1553 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1553
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1554 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1554
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1555 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1555
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1556 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1556
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1557 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1557
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1558 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1558
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1559 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1559
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1560 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1560
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1564 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1564
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1565 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1565
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1567 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1567
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1568 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1568
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1569 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1569
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1591 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1591
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1592 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1592
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1593 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1593
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1594 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1594
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1596 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1596
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1597 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1597
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1598 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1598
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1662 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1662
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1900 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1900
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1901 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1901
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1903 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1903
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1905 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1905
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1906 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1906
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1907 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1907
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1908 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1908
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1910 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1910
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1911 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1911
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1912 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1912
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1913 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1913
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1915 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1915
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1916 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1916
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1917 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1917
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1918 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1918
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1919 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1919
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1933 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1933
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1934 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1934
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1935 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1935
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1936 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1936
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1937 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1937
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1938 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1938
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1939 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1939
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1940 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1940
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1945 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1945
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1946 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1946
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1947 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1947
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1948 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1948
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1955 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1955
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1956 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1956
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1957 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1957
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1958 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1958
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1959 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1959
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1960 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1960
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1964 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1964
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1970 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1970
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1971 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1971
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1972 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1972
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1973 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1973
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1974 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1974
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib1975 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib1975
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib2301 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib2301
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib2302 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib2302
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib2304 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib2304
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib2305 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib2305
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib2306 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib2306
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib2308 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib2308
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib2402 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib2402
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib2404 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib2404
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib2405 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib2405
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib2502 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib2502
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib3010 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib3010
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib3025 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib3025
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib3026 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib3026
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib3027 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib3027
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib3100 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib3100
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib3101 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib3101
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib3102 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib3102
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib3103 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib3103
| libtool: install: install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/build/tests/libtest/.libs/lib3207 /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest/lib3207
| cp: cannot stat '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/curl-8.11.0/tests/libtest/notexists.pl': No such file or directory
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/temp/run.do_install_ptest_base.2657038:196 exit 1 from 'cp /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/curl-8.11.0/tests/libtest/notexists.pl /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/image/usr/lib/curl/ptest/tests/libtest'
| WARNING: Backtrace (BB generated script):
| 	#1: do_install_ptest, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/temp/run.do_install_ptest_base.2657038, line 196
| 	#2: do_install_ptest_base, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/temp/run.do_install_ptest_base.2657038, line 159
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/temp/run.do_install_ptest_base.2657038, line 237
NOTE: recipe curl-8.11.0-r0: task do_install_ptest_base: Failed
NOTE: recipe libxml2-2.13.5-r0: task do_configure: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_compile: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_package: Succeeded
NOTE: recipe glibc-locale-2.40+git-r0: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1964 tasks of which 1378 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241201091821.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241201091821.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_install_ptest_base
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/temp/log.do_install_ptest_base.2657038
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: curl-8.11.0-r0 do_install_ptest_base: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/temp/run.do_install_ptest_base.2657038' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/curl/8.11.0/temp/log.do_install_ptest_base.2657038
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.0.bb:do_install_ptest_base) failed with exit code '1'

--===============1244261225603663217==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-curl-upgrade-8.10.1-8.11.0.patch"

RnJvbSA3NTFhYzM2ZTY3OGE1YTY4YjFjMGMwMGQzZjZkOTI5ZWZmODRjNTBjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBEZWMgMjAyNCAwOToyNToyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGN1
cmw6IHVwZ3JhZGUgOC4xMC4xIC0+IDguMTEuMAoKLS0tCiBtZXRhL3JlY2lwZXMtc3VwcG9ydC9j
dXJsL2N1cmwvbm8tdGVzdC10aW1lb3V0LnBhdGNoICAgICAgICB8IDYgKysrLS0tCiAuLi4vcmVj
aXBlcy1zdXBwb3J0L2N1cmwve2N1cmxfOC4xMC4xLmJiID0+IGN1cmxfOC4xMS4wLmJifSB8IDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwve2N1cmxfOC4xMC4xLmJiID0+IGN1cmxfOC4x
MS4wLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3Vy
bC9uby10ZXN0LXRpbWVvdXQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmwv
bm8tdGVzdC10aW1lb3V0LnBhdGNoCmluZGV4IDcxMjJiNmYwNDMuLjRjMzczZTQ3MjQgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3VybC9uby10ZXN0LXRpbWVvdXQucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsL25vLXRlc3QtdGltZW91dC5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNDJjZGRiNTJlODIxY2ZjMmYwOWYxOTc0NzQyNzE0
ZTVmMmYxODU2ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMjAwZTk5MmM3NDVjOWVj
MzE2NTRhN2ZiYzE1YTNmMjIzMDU1ZWJlYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgogRGF0ZTogRnJpLCAxNSBNYXIgMjAy
NCAxNDozNzozNyArMDAwMAogU3ViamVjdDogW1BBVENIXSBTZXQgdGhlIG1heC10aW1lIHRpbWVv
dXQgdG8gNjAwIHNvIHRoZSB0aW1lb3V0IGlzIDEwIG1pbnV0ZXMKQEAgLTExLDEwICsxMSwxMCBA
QCBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBh
L3Rlc3RzL3NlcnZlcnMucG0gYi90ZXN0cy9zZXJ2ZXJzLnBtCi1pbmRleCBkNDQ3MmQ1Li45OTk5
OTM4IDEwMDY0NAoraW5kZXggMzc1MTllZS4uODUyNDM0OSAxMDA2NDQKIC0tLSBhL3Rlc3RzL3Nl
cnZlcnMucG0KICsrKyBiL3Rlc3RzL3NlcnZlcnMucG0KLUBAIC0xMjAsNyArMTIwLDcgQEAgbXkg
JHNzaGR2ZXJzdHI7ICAjIGZvciBzb2NrcyBzZXJ2ZXIsIHNzaCBkYWVtb24gdmVyc2lvbiBzdHJp
bmcKK0BAIC0xMjIsNyArMTIyLDcgQEAgbXkgJHNzaGR2ZXJzdHI7ICAjIGZvciBzb2NrcyBzZXJ2
ZXIsIHNzaCBkYWVtb24gdmVyc2lvbiBzdHJpbmcKICBteSAkc3NoZGVycm9yOyAgICMgZm9yIHNv
Y2tzIHNlcnZlciwgc3NoIGRhZW1vbiB2ZXJzaW9uIGVycm9yCiAgbXkgJWRvZXNudHJ1bjsgICAg
IyBzZXJ2ZXJzIHRoYXQgZG9uJ3Qgd29yaywgaWRlbnRpZmllZCBieSBwaWRmaWxlCiAgbXkgJVBP
UlQgPSAobm9saXN0ZW4gPT4gNDcpOyAjIHBvcnQgd2UgdXNlIGZvciBhIGxvY2FsIG5vbi1saXN0
ZW5pbmcgc2VydmljZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJs
XzguMTAuMS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3VybF84LjExLjAuYmIKc2lt
aWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9j
dXJsXzguMTAuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsXzgu
MTEuMC5iYgppbmRleCAwMjUyZDQ0NzVlLi44N2NhYjhlMWE3IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9jdXJsL2N1cmxfOC4xMC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2N1cmwvY3VybF84LjExLjAuYmIKQEAgLTE1LDcgKzE1LDcgQEAgU1JDX1VSSSA9ICIgXAog
ICAgIGZpbGU6Ly9kaXNhYmxlLXRlc3RzIFwKICAgICBmaWxlOi8vbm8tdGVzdC10aW1lb3V0LnBh
dGNoIFwKICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3M2E0YjBlOTk1OTZhMDlmYTU5MjRhNGZi
N2U0Yjk5NWE4NWZkYTBkMThhMmMwMmFiOWNmMTM0YmViY2UwNGVlIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImRiNTljZjBkNjcxY2E2ZTdmNWMyYzVlYzE3NzA4NGEzM2E3OWUwNGM5N2U3MWNmMTgz
YTVjZGVhMjM1MDU0ZWIiCiAKICMgQ3VybCBoYXMgdXNlZCBtYW55IG5hbWVzIG92ZXIgdGhlIHll
YXJzLi4uCiBDVkVfUFJPRFVDVCA9ICJoYXh4OmN1cmwgaGF4eDpsaWJjdXJsIGN1cmw6Y3VybCBj
dXJsOmxpYmN1cmwgbGliY3VybDpsaWJjdXJsIGRhbmllbF9zdGVuYmVyZzpjdXJsIgotLSAKMi40
NC4xCgo=

--===============1244261225603663217==--

