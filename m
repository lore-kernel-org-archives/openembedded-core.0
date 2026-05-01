Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9397CD484D
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:58 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15712.1777645534207843400
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=P6m9/+Zm;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Inaq5S+5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019de3ee8bbe-de598c38-6f49-49ad-8fa5-2d73ca1db608-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645554;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dTT7X/zidvaK5urTJwYWkaoE7ESQcX1UyeSGPSMpY8Y=;
	b=P6m9/+ZmcmduWPhB1sgsrvcgvvXwJbRq9ZdLk1txvpe551fg13vYSte28KXh01vm
	4L/hRLb14cC5E9NPj6sOJOQXerGCrfi4lsqk9g2CLtRt1MFebLg9+W6SWGiZsTd4ipj
	7XByWXZrK503pk4czPslYgjD4oz3in3NDWUepOBU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645554;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dTT7X/zidvaK5urTJwYWkaoE7ESQcX1UyeSGPSMpY8Y=;
	b=Inaq5S+5dcNAU4nzS50znIL/ICf0OV0Za6Axer/asylrUD0Hr7J3bIzXrAALYM1s
	TjJWoAl7uJaHBTidd/lilpvvZibuZTGFSyLYEBEfmsuNcRldlhADgbLE6xlKHmoMjnd
	FRxwxcuBLOm9+jF0kpkL0HbZIpzAz25Pe828rwsk=
Content-Type: multipart/mixed; boundary="===============2760042990445689865=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Joslyn <robert.joslyn@redrectangle.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] curl: upgrading to 8.20.0 FAILED
Message-ID: <0101019de3ee8bbe-de598c38-6f49-49ad-8fa5-2d73ca1db608-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236292

--===============2760042990445689865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *curl* to *8.20.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-curl-upgrade-8.19.0-8.20.0.patch
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
From a7ac71abd136d7217444ffd71cfd8b1a47f94295 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 13:20:27 +0000
Subject: [PATCH] curl: upgrade 8.19.0 -> 8.20.0

---
 meta/recipes-support/curl/curl/no-test-timeout.patch         | 4 ++--
 meta/recipes-support/curl/{curl_8.19.0.bb => curl_8.20.0.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/curl/{curl_8.19.0.bb => curl_8.20.0.bb} (98%)

diff --git a/meta/recipes-support/curl/curl/no-test-timeout.patch b/meta/recipes-support/curl/curl/no-test-timeout.patch
index 3ece55cab6..03b2a4bd27 100644
--- a/meta/recipes-support/curl/curl/no-test-timeout.patch
+++ b/meta/recipes-support/curl/curl/no-test-timeout.patch
@@ -1,4 +1,4 @@
-From 30fb6d1ce4cc721feef5665934f2b7f83fb50efb Mon Sep 17 00:00:00 2001
+From 1b1d22d0efe834080395ed8cffff931e15a8d37c Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 15 Mar 2024 14:37:37 +0000
 Subject: [PATCH] Set the max-time timeout to 600 so the timeout is 10 minutes
@@ -12,7 +12,7 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/servers.pm b/tests/servers.pm
-index 5d5d98b..442cfaf 100644
+index dba3c3e..198d4a8 100644
 --- a/tests/servers.pm
 +++ b/tests/servers.pm
 @@ -124,7 +124,7 @@ my $sshdverstr;  # for socks server, ssh daemon version string
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.20.0.bb
similarity index 98%
rename from meta/recipes-support/curl/curl_8.19.0.bb
rename to meta/recipes-support/curl/curl_8.20.0.bb
index b9251336b8..1e1ee980b4 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.20.0.bb
@@ -20,7 +20,7 @@ SRC_URI:append:class-nativesdk = " \
     file://environment.d-curl.sh \
 "
 
-SRC_URI[sha256sum] = "4eb41489790d19e190d7ac7e18e82857cdd68af8f4e66b292ced562d333f11df"
+SRC_URI[sha256sum] = "63fe2dc148ba0ceae89922ef838f7e5c946272c2e78b7c59fab4b79d3ce2b896"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.47.1


--===============2760042990445689865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1976 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-a01d279c7198e5157588d48a52d4753f0c98048d"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:a01d279c7198e5157588d48a52d4753f0c98048d"
meta-yocto-bsp       
meta-poky            = "master:a67ae0e83d8aba0c46cb8383808b2d1203fbb414"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 301 Local 128 Mirrors 0 Missed 173 Current 504 (42% match, 78% complete)
done.
Removing 4 stale sstate objects for arch x86_64...done.
Removing 58 stale sstate objects for arch qemux86_64...done.
Removing 5 stale sstate objects for arch allarch...done.
Removing 59 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 567 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 587 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.43.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 604 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 615 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 617 of 805 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 626 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.43.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 627 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 632 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 635 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/cross-localedef-native_2.43.bb:do_create_spdx_setscene)
NOTE: Running setscene task 636 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 638 of 805 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 645 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 674 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 691 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 692 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 701 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_create_spdx_setscene)
NOTE: recipe ca-certificates-20260223-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glibc-locale-2.43+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe cross-localedef-native-2.43+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glibc-locale-2.43+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.42.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.42.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe make-native-4.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-native-3.5.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe ca-certificates-20260223-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 716 of 805 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.0.bb:do_create_spdx_setscene)
NOTE: recipe cross-localedef-native-2.43+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glibc-locale-2.43+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 721 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.46.bb:do_create_spdx_setscene)
NOTE: Running setscene task 729 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 733 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 736 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sed-4.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.42.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 737 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 739 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 746 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libgcc-initial-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 750 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 753 of 805 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 759 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe make-native-4.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-native-3.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 764 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 771 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-x86_64-2.46-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-native-5.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-locale-2.43+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.46-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 786 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_stash_locale_setscene)
NOTE: Running setscene task 789 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 795 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gawk-native-5.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.19.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 798 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 799 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glibc-2.43+git-r1: task do_stash_locale_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe perl-5.42.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 425 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_unpack)
NOTE: Running setscene task 801 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 468 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-libc-headers-6.18-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 669 of 2023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_recipe_qa)
NOTE: recipe linux-libc-headers-6.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 750 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_fetch)
NOTE: Running task 757 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 920 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_unpack)
NOTE: recipe curl-native-8.20.0-r0: task do_recipe_qa: Started
NOTE: Running task 931 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_unpack)
NOTE: recipe xz-5.8.2-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.2-r0: task do_unpack: Started
NOTE: Running task 993 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_unpack)
NOTE: recipe xz-5.8.2-r0: task do_fetch: Succeeded
NOTE: Running task 1014 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_unpack)
NOTE: recipe glibc-2.43+git-r1: task do_stash_locale_setscene: Succeeded
NOTE: Running setscene task 802 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 803 of 805 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_unpack: Started
NOTE: Running task 1074 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_unpack: Started
NOTE: Running task 1112 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_recipe_qa)
NOTE: Running task 1123 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_unpack)
NOTE: recipe xz-5.8.2-r0: task do_unpack: Started
NOTE: recipe util-linux-2.41.3-r0: task do_unpack: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gawk-native-5.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_unpack: Started
NOTE: recipe curl-8.20.0-r0: task do_recipe_qa: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_unpack: Started
NOTE: Running task 1259 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_unpack)
NOTE: Running task 1275 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_unpack)
NOTE: recipe libpam-1.7.2-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_unpack: Succeeded
NOTE: Running task 1305 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1306 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_patch)
NOTE: Running task 1320 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_patch)
NOTE: recipe bash-completion-2.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1351 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb:do_configure)
NOTE: recipe libcap-2.78-r0: task do_unpack: Started
NOTE: Running task 1352 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_patch)
NOTE: recipe sed-4.10-r0: task do_unpack: Started
NOTE: recipe gawk-native-5.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-native-8.20.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe wayland-protocols-1.48-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_unpack: Succeeded
NOTE: Running task 1362 of 2023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_fetch)
NOTE: recipe xz-5.8.2-r0: task do_patch: Started
NOTE: recipe ca-certificates-20260223-r0: task do_configure: Started
NOTE: Running task 1393 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_patch)
NOTE: recipe libpam-1.7.2-r0: task do_patch: Started
NOTE: Running task 1415 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_create_recipe_spdx)
NOTE: recipe libgcc-initial-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_patch: Started
NOTE: Running setscene task 805 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_patch: Succeeded
NOTE: Running task 1417 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_patch)
NOTE: recipe bash-completion-2.17.0-r0: task do_patch: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_patch: Started
NOTE: recipe curl-native-8.20.0-r0: task do_fetch: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe ca-certificates-20260223-r0: task do_configure: Succeeded
NOTE: recipe curl-8.20.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe curl-native-8.20.0-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.78-r0: task do_patch: Started
NOTE: Running task 1432 of 2023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_unpack)
NOTE: Running task 1433 of 2023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1434 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb:do_compile)
NOTE: recipe libcap-2.78-r0: task do_patch: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_patch: Succeeded
NOTE: recipe sed-4.10-r0: task do_unpack: Succeeded
NOTE: Running task 1437 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_patch)
NOTE: recipe ca-certificates-20260223-r0: task do_compile: Started
NOTE: recipe curl-8.20.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1438 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_fetch)
NOTE: recipe curl-native-8.20.0-r0: task do_unpack: Started
NOTE: recipe curl-native-8.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-protocols-1.48-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sed-4.10-r0: task do_patch: Started
NOTE: Running task 1439 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_configure)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_unpack: Succeeded
NOTE: recipe sed-4.10-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_unpack: Succeeded
NOTE: recipe curl-8.20.0-r0: task do_fetch: Started
NOTE: Running task 1440 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_patch)
NOTE: recipe curl-8.20.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1442 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_patch)
NOTE: recipe wayland-protocols-1.48-r0: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_patch: Started
NOTE: recipe ca-certificates-20260223-r0: task do_compile: Succeeded
NOTE: Running task 1443 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb:do_install)
NOTE: recipe curl-native-8.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe curl-8.20.0-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_patch: Succeeded
NOTE: recipe curl-native-8.20.0-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_patch: Succeeded
NOTE: Running task 1444 of 2023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_patch)
NOTE: Running task 1445 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_patch)
NOTE: Running task 1448 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_unpack)
NOTE: recipe ca-certificates-20260223-r0: task do_install: Started
NOTE: recipe curl-8.20.0-r0: task do_unpack: Started
NOTE: recipe util-linux-2.41.3-r0: task do_patch: Started
NOTE: recipe curl-native-8.20.0-r0: task do_patch: Started
NOTE: recipe curl-native-8.20.0-r0: task do_patch: Succeeded
NOTE: Running task 1450 of 2023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-native-8.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-8.20.0-r0: task do_unpack: Succeeded
NOTE: Running task 1451 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_patch)
NOTE: recipe curl-8.20.0-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.48-r0: task do_configure: Succeeded
NOTE: Running task 1452 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_compile)
NOTE: recipe curl-8.20.0-r0: task do_patch: Succeeded
NOTE: Running task 1453 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1454 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_populate_lic)
NOTE: recipe util-linux-2.41.3-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1456 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-source_15.2.bb:do_unpack)
NOTE: recipe wayland-protocols-1.48-r0: task do_compile: Started
NOTE: recipe curl-native-8.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1459 of 2023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_configure)
NOTE: recipe curl-8.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-8.20.0-r0: task do_populate_lic: Started
NOTE: recipe gcc-source-15.2.0-15.2.0-r0: task do_unpack: Started
NOTE: recipe curl-native-8.20.0-r0: task do_configure: Started
NOTE: recipe ca-certificates-20260223-r0: task do_install: Succeeded
NOTE: recipe wayland-protocols-1.48-r0: task do_compile: Succeeded
NOTE: Running task 1461 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_install)
NOTE: recipe curl-8.20.0-r0: task do_populate_lic: Succeeded
NOTE: recipe wayland-protocols-1.48-r0: task do_install: Started
NOTE: recipe curl-8.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wayland-protocols-1.48-r0: task do_install: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_unpack: Succeeded
NOTE: Running task 1463 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_patch)
NOTE: recipe linux-libc-headers-6.18-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_patch: Succeeded
NOTE: Running noexec task 1465 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_configure)
NOTE: Running noexec task 1466 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_compile)
NOTE: Running task 1467 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_install)
NOTE: recipe linux-libc-headers-6.18-r0: task do_install: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_install: Succeeded
NOTE: recipe gcc-source-15.2.0-15.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1470 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-source_15.2.bb:do_patch)
NOTE: recipe gcc-source-15.2.0-15.2.0-r0: task do_patch: Started
NOTE: recipe gcc-source-15.2.0-15.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1472 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-source_15.2.bb:do_preconfigure)
NOTE: recipe gcc-source-15.2.0-15.2.0-r0: task do_preconfigure: Started
NOTE: recipe gcc-source-15.2.0-15.2.0-r0: task do_preconfigure: Succeeded
NOTE: Running task 1489 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-2.43+git-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.43+git-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1490 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_configure)
NOTE: recipe glibc-2.43+git-r1: task do_configure: Started
NOTE: recipe glibc-2.43+git-r1: task do_configure: Succeeded
NOTE: Running task 1491 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_compile)
NOTE: recipe glibc-2.43+git-r1: task do_compile: Started
NOTE: recipe curl-native-8.20.0-r0: task do_configure: Failed
NOTE: recipe glibc-2.43+git-r1: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1491 tasks of which 1439 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260501131851.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260501131851.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/curl-native/8.20.0/temp/log.do_configure.3769005
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: curl-native-8.20.0-r0 do_configure: QA Issue: curl-native: configure was passed unrecognised options: --without-librtmp [unknown-configure-option]
ERROR: curl-native-8.20.0-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/curl-native/8.20.0/temp/log.do_configure.3769005
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_configure) failed with exit code '1'

--===============2760042990445689865==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-curl-upgrade-8.19.0-8.20.0.patch"

RnJvbSBhN2FjNzFhYmQxMzZkNzIxNzQ0NGZmZDcxY2ZkOGIxYTQ3Zjk0Mjk1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAxMzoyMDoyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGN1
cmw6IHVwZ3JhZGUgOC4xOS4wIC0+IDguMjAuMAoKLS0tCiBtZXRhL3JlY2lwZXMtc3VwcG9ydC9j
dXJsL2N1cmwvbm8tdGVzdC10aW1lb3V0LnBhdGNoICAgICAgICAgfCA0ICsrLS0KIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2N1cmwve2N1cmxfOC4xOS4wLmJiID0+IGN1cmxfOC4yMC4wLmJifSB8IDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwve2N1cmxfOC4xOS4wLmJiID0+IGN1cmxfOC4y
MC4wLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3Vy
bC9uby10ZXN0LXRpbWVvdXQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmwv
bm8tdGVzdC10aW1lb3V0LnBhdGNoCmluZGV4IDNlY2U1NWNhYjYuLjAzYjJhNGJkMjcgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3VybC9uby10ZXN0LXRpbWVvdXQucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsL25vLXRlc3QtdGltZW91dC5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMzBmYjZkMWNlNGNjNzIxZmVlZjU2NjU5MzRmMmI3
ZjgzZmI1MGVmYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMWIxZDIyZDBlZmU4MzQw
ODAzOTVlZDhjZmZmZjkzMWUxNWE4ZDM3YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgogRGF0ZTogRnJpLCAxNSBNYXIgMjAy
NCAxNDozNzozNyArMDAwMAogU3ViamVjdDogW1BBVENIXSBTZXQgdGhlIG1heC10aW1lIHRpbWVv
dXQgdG8gNjAwIHNvIHRoZSB0aW1lb3V0IGlzIDEwIG1pbnV0ZXMKQEAgLTEyLDcgKzEyLDcgQEAg
U2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+CiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS90
ZXN0cy9zZXJ2ZXJzLnBtIGIvdGVzdHMvc2VydmVycy5wbQotaW5kZXggNWQ1ZDk4Yi4uNDQyY2Zh
ZiAxMDA2NDQKK2luZGV4IGRiYTNjM2UuLjE5OGQ0YTggMTAwNjQ0CiAtLS0gYS90ZXN0cy9zZXJ2
ZXJzLnBtCiArKysgYi90ZXN0cy9zZXJ2ZXJzLnBtCiBAQCAtMTI0LDcgKzEyNCw3IEBAIG15ICRz
c2hkdmVyc3RyOyAgIyBmb3Igc29ja3Mgc2VydmVyLCBzc2ggZGFlbW9uIHZlcnNpb24gc3RyaW5n
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmxfOC4xOS4wLmJiIGIv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsXzguMjAuMC5iYgpzaW1pbGFyaXR5IGluZGV4
IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmxfOC4xOS4wLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmxfOC4yMC4wLmJiCmluZGV4
IGI5MjUxMzM2YjguLjFlMWVlOTgwYjQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2N1cmwvY3VybF84LjE5LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJs
XzguMjAuMC5iYgpAQCAtMjAsNyArMjAsNyBAQCBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmVz
ZGsgPSAiIFwKICAgICBmaWxlOi8vZW52aXJvbm1lbnQuZC1jdXJsLnNoIFwKICIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjRlYjQxNDg5NzkwZDE5ZTE5MGQ3YWM3ZTE4ZTgyODU3Y2RkNjhhZjhm
NGU2NmIyOTJjZWQ1NjJkMzMzZjExZGYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjNmZTJkYzE0
OGJhMGNlYWU4OTkyMmVmODM4ZjdlNWM5NDYyNzJjMmU3OGI3YzU5ZmFiNGI3OWQzY2UyYjg5NiIK
IAogIyBDdXJsIGhhcyB1c2VkIG1hbnkgbmFtZXMgb3ZlciB0aGUgeWVhcnMuLi4KIENWRV9QUk9E
VUNUID0gImhheHg6Y3VybCBoYXh4OmxpYmN1cmwgY3VybDpjdXJsIGN1cmw6bGliY3VybCBsaWJj
dXJsOmxpYmN1cmwgZGFuaWVsX3N0ZW5iZXJnOmN1cmwiCi0tIAoyLjQ3LjEKCg==

--===============2760042990445689865==--

