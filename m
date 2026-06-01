Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D224DCD98DE
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:36:04 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1550.1780328126408579369
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=uek1vSF4;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FHyKIuss;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019e83d3c671-013f5698-d681-4ee6-bddc-543d8fc2d3e5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328154;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0gVOGwvfRwNFny9OFu2vGd9grdKIkjipsz4WQd8l0uo=;
	b=uek1vSF4r3/gVaZ7R/ZplUvweMjXdv1iRvoCAHF4FFuVyWFdKFdrXtsP23PUFWQQ
	LsvvL+eWGRyKMViG87YhqVbo4G9FEm8HBtCeKAYZfm4k1bVZLJIabzO37P1hzcj6FBY
	Tt98G6MaVC28GQyqZqD4w9WiPn6lzwGiKxx5nAdQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328154;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0gVOGwvfRwNFny9OFu2vGd9grdKIkjipsz4WQd8l0uo=;
	b=FHyKIuss1BVNlQHjvJ5E+FYEsaL2OdX3kiTcnAQkijOI/+sqb6/G3q/UWbrGcImA
	vwUv9xDIJaBXBYBFpf6pdgAuPE8DJerwnCd4S0+I6bDB8zu0uj91mdyVlRqJI19xbvO
	CriYtu04jZAjlzpR4f0/9XpX/zBox2UwxafpZ6QQ=
Content-Type: multipart/mixed; boundary="===============1176349688333869524=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Joslyn <robert.joslyn@redrectangle.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] curl: upgrading to 8.20.0 FAILED
Message-ID: <0101019e83d3c671-013f5698-d681-4ee6-bddc-543d8fc2d3e5-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:36:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237949

--===============1176349688333869524==
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
From d412232a6bddc968c73bbdbec4ad179ed9c02063 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 14:05:32 +0000
Subject: [PATCH] curl: upgrade 8.19.0 -> 8.20.0

---
 meta/recipes-support/curl/curl/no-test-timeout.patch         | 4 ++--
 meta/recipes-support/curl/{curl_8.19.0.bb => curl_8.20.0.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/curl/{curl_8.19.0.bb => curl_8.20.0.bb} (98%)

diff --git a/meta/recipes-support/curl/curl/no-test-timeout.patch b/meta/recipes-support/curl/curl/no-test-timeout.patch
index 3ece55cab6..adcf3fb415 100644
--- a/meta/recipes-support/curl/curl/no-test-timeout.patch
+++ b/meta/recipes-support/curl/curl/no-test-timeout.patch
@@ -1,4 +1,4 @@
-From 30fb6d1ce4cc721feef5665934f2b7f83fb50efb Mon Sep 17 00:00:00 2001
+From 2c38daf4fa5e2a3159fb9fc4f5ca2feb94db125f Mon Sep 17 00:00:00 2001
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


--===============1176349688333869524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1975 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "6.0.99+snapshot-8e8d5f976b6da93691f9132f22de3156ccb9d6be"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:8e8d5f976b6da93691f9132f22de3156ccb9d6be"
meta-yocto-bsp       
meta-poky            = "master:d13ca2a2e0f478046d920b8fc7dd3098952b5ad8"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 272 Local 101 Mirrors 0 Missed 171 Current 533 (37% match, 78% complete)
done.
Removing 5 stale sstate objects for arch allarch...done.
Removing 61 stale sstate objects for arch x86-64-v3...done.
Removing 4 stale sstate objects for arch x86_64...done.
Removing 58 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 576 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/cross-localedef-native_2.43.bb:do_create_spdx_setscene)
NOTE: Running setscene task 584 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 597 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.43.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 625 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.43.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 645 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 673 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 685 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 704 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 720 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 721 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 726 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 760 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 770 of 805 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rsync/rsync_3.4.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 792 of 805 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 797 of 805 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe cross-localedef-native-2.43+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe ca-certificates-20260223-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glibc-locale-2.43+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-locale-2.43+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe perl-5.42.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.42.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe curl-8.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rsync-native-3.4.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-native-8.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ca-certificates-20260223-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe cross-localedef-native-2.43+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glibc-locale-2.43+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe curl-8.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe rpm-native-1_4.20.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.42.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe curl-native-8.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 800 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe rsync-native-3.4.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 801 of 805 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rsync/rsync_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 685 of 2023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_fetch)
NOTE: recipe rsync-native-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-locale-2.43+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 781 of 2023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_fetch)
NOTE: recipe curl-native-8.20.0-r0: task do_fetch: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_fetch: Started
NOTE: recipe rsync-native-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1133 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_fetch)
NOTE: Running setscene task 804 of 805 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rsync/rsync_3.4.2.bb:do_recipe_qa_setscene)
NOTE: recipe curl-native-8.20.0-r0: task do_fetch: Succeeded
NOTE: Running task 1176 of 2023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_unpack)
NOTE: Running task 1177 of 2023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe perl-5.42.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 805 of 805 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1238 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_fetch)
NOTE: recipe rsync-native-3.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1326 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-8.20.0-r0: task do_fetch: Started
NOTE: Running task 1340 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_write_config)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_fetch: Started
NOTE: recipe curl-8.20.0-r0: task do_fetch: Succeeded
NOTE: Running task 1371 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb:do_configure)
NOTE: Running task 1377 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_unpack)
NOTE: recipe perl-5.42.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rsync-native-3.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1404 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_fetch: Succeeded
NOTE: recipe curl-native-8.20.0-r0: task do_unpack: Started
NOTE: recipe curl-native-8.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1434 of 2023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_unpack)
NOTE: Running task 1436 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_create_recipe_spdx)
NOTE: recipe wayland-protocols-1.48-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ca-certificates-20260223-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_write_config: Started
NOTE: recipe perl-5.42.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1449 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.20.0-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_write_config: Succeeded
NOTE: recipe rpm-native-1_4.20.1-r0: task do_unpack: Started
NOTE: recipe curl-8.20.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe perl-5.42.0-r0: task do_fetch: Started
NOTE: recipe perl-5.42.0-r0: task do_fetch: Succeeded
NOTE: Running task 1450 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ca-certificates-20260223-r0: task do_configure: Succeeded
NOTE: Running noexec task 1451 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_configure)
NOTE: Running noexec task 1452 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_compile)
NOTE: Running task 1453 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_install)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_fetch: Succeeded
NOTE: recipe perl-5.42.0-r0: task do_unpack: Started
NOTE: recipe curl-native-8.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe curl-native-8.20.0-r0: task do_unpack: Succeeded
NOTE: recipe curl-8.20.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe wayland-protocols-1.48-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe curl-8.20.0-r0: task do_unpack: Succeeded
NOTE: Running task 1454 of 2023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_patch)
NOTE: Running task 1455 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_patch)
NOTE: Running task 1456 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_unpack)
NOTE: Running task 1457 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_configure)
NOTE: Running task 1458 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb:do_compile)
NOTE: recipe linux-libc-headers-6.18-r0: task do_install: Started
NOTE: recipe ca-certificates-20260223-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_unpack: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_unpack: Succeeded
NOTE: recipe curl-8.20.0-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.48-r0: task do_configure: Started
NOTE: Running task 1459 of 2023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_patch)
NOTE: recipe curl-native-8.20.0-r0: task do_patch: Started
NOTE: recipe curl-8.20.0-r0: task do_patch: Succeeded
NOTE: Running task 1460 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1461 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_populate_lic)
NOTE: recipe curl-native-8.20.0-r0: task do_patch: Succeeded
NOTE: Running task 1462 of 2023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe perl-5.42.0-r0: task do_unpack: Succeeded
NOTE: recipe rpm-native-1_4.20.1-r0: task do_patch: Started
NOTE: Running task 1463 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_patch)
NOTE: recipe curl-8.20.0-r0: task do_populate_lic: Started
NOTE: recipe curl-8.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe perl-5.42.0-r0: task do_patch: Started
NOTE: recipe curl-native-8.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-8.20.0-r0: task do_populate_lic: Succeeded
NOTE: recipe ca-certificates-20260223-r0: task do_compile: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_populate_lic unihash changed to 7349f00f87fcb7790d43763a5d3deb745e34bdacb796e838b4579784cb06d273
NOTE: Running task 1464 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb:do_install)
NOTE: recipe curl-8.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_deploy_source_date_epoch unihash changed to eb738835ccb61b75a36cad17e830aa49ed3e1900252270a9b1c2653d06019b97
NOTE: recipe curl-native-8.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_deploy_source_date_epoch unihash changed to 71873bb982da568f480ac961e0be14b74bea0c60d0495223b1b46868024e10b0
NOTE: recipe libxkbcommon-1.13.1-r0: task do_unpack: Succeeded
NOTE: recipe ca-certificates-20260223-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 1465 of 2023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_configure)
NOTE: Running task 1466 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_patch)
NOTE: recipe perl-5.42.0-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxkbcommon-1.13.1-r0: task do_patch: Started
NOTE: recipe curl-native-8.20.0-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_patch: Succeeded
NOTE: recipe rpm-native-1_4.20.1-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1469 of 2023 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_generate_toolchain_file)
NOTE: recipe linux-libc-headers-6.18-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1485 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glibc-2.43+git-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.43+git-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1486 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_configure)
NOTE: recipe glibc-2.43+git-r1: task do_configure: Started
NOTE: recipe wayland-protocols-1.48-r0: task do_configure: Succeeded
NOTE: recipe ca-certificates-20260223-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1487 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_compile)
NOTE: Setscene tasks completed
NOTE: recipe wayland-protocols-1.48-r0: task do_compile: Started
NOTE: recipe wayland-protocols-1.48-r0: task do_compile: Succeeded
NOTE: Running task 1489 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_install)
NOTE: recipe wayland-protocols-1.48-r0: task do_install: Started
NOTE: recipe wayland-protocols-1.48-r0: task do_install: Succeeded
NOTE: recipe glibc-2.43+git-r1: task do_configure: Succeeded
NOTE: Running task 1491 of 2023 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_compile)
NOTE: recipe glibc-2.43+git-r1: task do_compile: Started
NOTE: recipe curl-native-8.20.0-r0: task do_configure: Failed
Bitbake still alive (no events for 600s). Active tasks:
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_compile
NOTE: recipe glibc-2.43+git-r1: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1491 tasks of which 1454 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 7 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601135129.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601135129.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/curl-native/8.20.0/temp/log.do_configure.1260335
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: curl-native-8.20.0-r0 do_configure: QA Issue: curl-native: configure was passed unrecognised options: --without-librtmp [unknown-configure-option]
ERROR: curl-native-8.20.0-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/curl-native/8.20.0/temp/log.do_configure.1260335
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_configure) failed with exit code '1'

--===============1176349688333869524==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-curl-upgrade-8.19.0-8.20.0.patch"

RnJvbSBkNDEyMjMyYTZiZGRjOTY4YzczYmJkYmVjNGFkMTc5ZWQ5YzAyMDYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxNDowNTozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGN1
cmw6IHVwZ3JhZGUgOC4xOS4wIC0+IDguMjAuMAoKLS0tCiBtZXRhL3JlY2lwZXMtc3VwcG9ydC9j
dXJsL2N1cmwvbm8tdGVzdC10aW1lb3V0LnBhdGNoICAgICAgICAgfCA0ICsrLS0KIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2N1cmwve2N1cmxfOC4xOS4wLmJiID0+IGN1cmxfOC4yMC4wLmJifSB8IDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwve2N1cmxfOC4xOS4wLmJiID0+IGN1cmxfOC4y
MC4wLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3Vy
bC9uby10ZXN0LXRpbWVvdXQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmwv
bm8tdGVzdC10aW1lb3V0LnBhdGNoCmluZGV4IDNlY2U1NWNhYjYuLmFkY2YzZmI0MTUgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3VybC9uby10ZXN0LXRpbWVvdXQucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsL25vLXRlc3QtdGltZW91dC5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMzBmYjZkMWNlNGNjNzIxZmVlZjU2NjU5MzRmMmI3
ZjgzZmI1MGVmYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMmMzOGRhZjRmYTVlMmEz
MTU5ZmI5ZmM0ZjVjYTJmZWI5NGRiMTI1ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
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

--===============1176349688333869524==--

