Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 402FFC531D0
	for <webhook@archiver.kernel.org>; Sat, 25 Jul 2026 05:53:14 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34892.1784958790969044710
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 22:53:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=llugtV2g;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=eao6NZlc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019f97d5aa10-cba252d1-01fa-4ba3-85e6-8c21e6a93af6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784958790;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8xm7Soi87FEUXDIQAEVdP1S1TSUSWZASOCVvdrtfMzE=;
	b=llugtV2gAfRNBLGzaDX4sdZgIwLfeGVj1wzZ2eBsdkLy095UZ4J2INRwEaczmAZ2
	xrWuOFVxvsTLh7a5H+sJm/INtoJL+UCJHstxZN9UwojLsFEARqiOKZBMEbTd22U00N5
	ek8QfG9Fhfd536KkE/kq6XPv69NpQY1OPhnz+HXU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784958790;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8xm7Soi87FEUXDIQAEVdP1S1TSUSWZASOCVvdrtfMzE=;
	b=eao6NZlcgeiWboexxQnmv/xFieE/fgcaazEsVVvLvbvrlDgFaNBl5bGTsreMrO91
	UIwWHTptRzDOeSy4hHeavdPMjM3+VffrLyp/DmLswIv4fJ5KVlqoRXcit4t5XgWeRQI
	Ky4Ih3HdUTzt3KPqYQAzrQTy2JzIYi6kOsL7Zkb8=
Content-Type: multipart/mixed; boundary="===============0988472274310356434=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] appstream: upgrading to 1.1.5 FAILED
Message-ID: <0101019f97d5aa10-cba252d1-01fa-4ba3-85e6-8c21e6a93af6-000000@us-west-2.amazonses.com>
Date: Sat, 25 Jul 2026 05:53:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.25-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2026 05:53:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241963

--===============0988472274310356434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *appstream* to *1.1.5* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-appstream-upgrade-1.1.3-1.1.5.patch
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
From dcfcf942d5e4077bf0ab00d2a689e4bf990dbccb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 25 Jul 2026 05:41:43 +0000
Subject: [PATCH] appstream: upgrade 1.1.3 -> 1.1.5

Source: NEWS

Version 1.1.5
~~~~~~~~~~~~~
Released: 2026-07-24

Features:
 * sysinfo: Implement display size detection on macOS

Bugfixes:
 * qt: Add back wrong const Component::addBundle for ABI compatibility
 * qt: Use strndup for C string-list conversion
 * pool: Fix bidirectional wildcard search for modalias provides

Contributors:
 Matthias Klumpp

Version 1.1.4
~~~~~~~~~~~~~
Released: 2026-07-22

Features:
 * sysinfo: Assume a more modern display for the handset chassis template
 * sysinfo: Assume a more modern display for the tablet chassis template
 * sysinfo: Initial code to autodetect the display size on Wayland
 * sysinfo: Handle fractional display scaling via xdg-output
 * Implement support for GCVE as vulnerability database provider
 * qt: Sync enum mirrors with the C library
 * qt: Add Artifact, Checksum, Reference, Review and Agreement wrappers
 * qt: Wrap missing C API on existing classes
 * reviews: Add simple interface to fetch ODRS reviews for a component
 * reviews: Implement support for submitting reviews

Specification:
 * docs: Suggest using the longest display side for maximum size constraints

Bugfixes:
 * Make GResources we need outlive main thread destruction
 * pool: Properly implement cancellation of load operations
 * sysinfo: Fix display-length setter overriding the shortest edge
 * relation-check: Don't zero the score if a required check errored
 * curl: Harden downloader by restricting protocols to only HTTP(S)
 * curl: Allow making POST requests and changing the user agent
 * curl: Fix retry-loop data corruption and don't blindly retry POST requests
 * yaml: Fix potential crashes when encountering missing relation entry values
 * yaml: Adjust tests and emitter to work around libfyaml string-quoting change
 * yaml: Ensure version relations are consistently quoted
 * qt: Fix buffer overrun in stringListToCharArray

Miscellaneous:
 * ci: freebsd: Switch from Cirrus to GitHub Actions
 * ci: Update Ubuntu LTS to 26.04

Contributors:
 Gleb Popov, Matthias Klumpp
---
 .../appstream/appstream/0001-remove-hardcoded-path.patch    | 6 +++---
 .../appstream/appstream/0002-Do-not-build-qt-tests.patch    | 6 +++---
 ...x-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch | 2 +-
 .../appstream/{appstream_1.1.3.bb => appstream_1.1.5.bb}    | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-support/appstream/{appstream_1.1.3.bb => appstream_1.1.5.bb} (94%)

diff --git a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
index 56a5479099..d72bd73d85 100644
--- a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
+++ b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
@@ -1,4 +1,4 @@
-From bf79c20cfee4a074ca752a1466dc96d0b9eb6175 Mon Sep 17 00:00:00 2001
+From 8cf2785a4ac93c07c1dbd3a16a507e942d469aa4 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Mon, 12 Dec 2022 15:42:42 +0100
 Subject: [PATCH] remove hardcoded path
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate [oe-specific]
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 9af5f58..ad1483d 100644
+index 4c3ccf2..62b9838 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -194,10 +194,10 @@ endif
+@@ -227,10 +227,10 @@ endif
  stemmer_inc_dirs = include_directories()
  if get_option('stemming')
      stemmer_lib = cc.find_library('stemmer', required: true)
diff --git a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
index 3e666181eb..7a12a78dd1 100644
--- a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
+++ b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
@@ -1,4 +1,4 @@
-From 1a1619dce3c3fa54fa5f47f7ed89447e0805de43 Mon Sep 17 00:00:00 2001
+From 443b575a6444e76fdbd6a6ff9d0d3e378b6a96a2 Mon Sep 17 00:00:00 2001
 From: Marc Ferland <marc.ferland@sonatest.com>
 Date: Fri, 26 Jul 2024 15:41:00 -0400
 Subject: [PATCH] Do not build qt/tests
@@ -23,10 +23,10 @@ Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/qt/meson.build b/qt/meson.build
-index 407a57a..840c838 100644
+index 488fe60..83c2715 100644
 --- a/qt/meson.build
 +++ b/qt/meson.build
-@@ -130,5 +130,3 @@ install_data (
+@@ -144,5 +144,3 @@ install_data (
      join_paths(meson.current_build_dir(), 'AppStreamQtConfigVersion.cmake'),
      install_dir: join_paths(get_option('libdir'), 'cmake', 'AppStreamQt')
  )
diff --git a/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch b/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
index 8ba4de95c9..7b533a31bc 100644
--- a/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
+++ b/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
@@ -1,4 +1,4 @@
-From 4fdd29346b51eea577ee46c7166348dad19bbcb0 Mon Sep 17 00:00:00 2001
+From 6bda946d63af196169d8b81ee5cf81c3df7f891a Mon Sep 17 00:00:00 2001
 From: Marc Ferland <marc.ferland@sonatest.com>
 Date: Mon, 29 Jul 2024 09:35:51 -0400
 Subject: [PATCH] Fix PACKAGE_PREFIX_DIR in qt/cmake/AppStreamQtConfig.cmake.in
diff --git a/meta/recipes-support/appstream/appstream_1.1.3.bb b/meta/recipes-support/appstream/appstream_1.1.5.bb
similarity index 94%
rename from meta/recipes-support/appstream/appstream_1.1.3.bb
rename to meta/recipes-support/appstream/appstream_1.1.5.bb
index 06e4f7940a..ccf627a478 100644
--- a/meta/recipes-support/appstream/appstream_1.1.3.bb
+++ b/meta/recipes-support/appstream/appstream_1.1.5.bb
@@ -24,7 +24,7 @@ SRC_URI = " \
 	file://0002-Do-not-build-qt-tests.patch \
 	file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch \
 "
-SRC_URI[sha256sum] = "2624f967068427edc94f3979edae3571bb077063f5bc231f737776da527bf467"
+SRC_URI[sha256sum] = "fc57337e250b0d27e75ac4216cc69a76d03c54011a5da5c7a2c57711a3d0cdf9"
 
 S = "${UNPACKDIR}/AppStream-${PV}"
 
-- 
2.47.1


--===============0988472274310356434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="appstream-changelog.txt"

Changelog for appstream: 1.1.3 -> 1.1.5
Source: NEWS

Version 1.1.5
~~~~~~~~~~~~~
Released: 2026-07-24

Features:
 * sysinfo: Implement display size detection on macOS

Bugfixes:
 * qt: Add back wrong const Component::addBundle for ABI compatibility
 * qt: Use strndup for C string-list conversion
 * pool: Fix bidirectional wildcard search for modalias provides

Contributors:
 Matthias Klumpp

Version 1.1.4
~~~~~~~~~~~~~
Released: 2026-07-22

Features:
 * sysinfo: Assume a more modern display for the handset chassis template
 * sysinfo: Assume a more modern display for the tablet chassis template
 * sysinfo: Initial code to autodetect the display size on Wayland
 * sysinfo: Handle fractional display scaling via xdg-output
 * Implement support for GCVE as vulnerability database provider
 * qt: Sync enum mirrors with the C library
 * qt: Add Artifact, Checksum, Reference, Review and Agreement wrappers
 * qt: Wrap missing C API on existing classes
 * reviews: Add simple interface to fetch ODRS reviews for a component
 * reviews: Implement support for submitting reviews

Specification:
 * docs: Suggest using the longest display side for maximum size constraints

Bugfixes:
 * Make GResources we need outlive main thread destruction
 * pool: Properly implement cancellation of load operations
 * sysinfo: Fix display-length setter overriding the shortest edge
 * relation-check: Don't zero the score if a required check errored
 * curl: Harden downloader by restricting protocols to only HTTP(S)
 * curl: Allow making POST requests and changing the user agent
 * curl: Fix retry-loop data corruption and don't blindly retry POST requests
 * yaml: Fix potential crashes when encountering missing relation entry values
 * yaml: Adjust tests and emitter to work around libfyaml string-quoting change
 * yaml: Ensure version relations are consistently quoted
 * qt: Fix buffer overrun in stringListToCharArray

Miscellaneous:
 * ci: freebsd: Switch from Cirrus to GitHub Actions
 * ci: Update Ubuntu LTS to 26.04

Contributors:
 Gleb Popov, Matthias Klumpp

--===============0988472274310356434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 953 .bb files complete (0 cached, 953 parsed). 1981 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "6.0.99+snapshot-fe94cc33b125c503a2e542bd3aecc94541e2d01f"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:fe94cc33b125c503a2e542bd3aecc94541e2d01f"
meta-yocto-bsp       
meta-poky            = "master:e4690557fb0fffcb5e9a86d1c1ebc550bb0da090"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 347 Local 328 Mirrors 0 Missed 19 Current 533 (94% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 761 of 880 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 792 of 880 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 822 of 880 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.28.bb:do_create_spdx_setscene)
NOTE: Running task 716 of 2114 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.5.bb:do_recipe_qa)
NOTE: Running task 717 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.5.bb:do_recipe_qa)
NOTE: Running task 727 of 2114 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.5.bb:do_write_config)
NOTE: Running task 728 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.5.bb:do_write_config)
NOTE: recipe libfyaml-native-0.9.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe appstream-1.1.5-r0: task do_recipe_qa: Started
NOTE: recipe appstream-1.1.5-r0: task do_write_config: Started
NOTE: recipe curl-native-8.21.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe appstream-native-1.1.5-r0: task do_recipe_qa: Started
NOTE: recipe appstream-native-1.1.5-r0: task do_write_config: Started
NOTE: recipe libxmlb-native-0.3.28-r0: task do_create_spdx_setscene: Started
NOTE: recipe appstream-1.1.5-r0: task do_write_config: Succeeded
NOTE: recipe libfyaml-native-0.9.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 864 of 880 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe appstream-native-1.1.5-r0: task do_write_config: Succeeded
NOTE: recipe curl-native-8.21.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 867 of 880 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxmlb-native-0.3.28-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 870 of 880 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.28.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 874 of 880 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb:do_create_spdx_setscene)
NOTE: recipe gettext-minimal-native-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe appstream-1.1.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe libfyaml-native-0.9.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 769 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.5.bb:do_fetch)
NOTE: recipe curl-native-8.21.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxmlb-native-0.3.28-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gettext-minimal-native-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libfyaml-native-0.9.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe appstream-1.1.5-r0: task do_fetch: Started
NOTE: recipe curl-native-8.21.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe appstream-1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libxmlb-native-0.3.28-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe appstream-native-1.1.5-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 879 of 880 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gettext-minimal-native-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gettext-minimal-native-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1827 of 2114 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.5.bb:do_fetch)
NOTE: Running task 1883 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.5.bb:do_unpack)
NOTE: Running task 2039 of 2114 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.5.bb:do_create_recipe_spdx)
NOTE: recipe appstream-1.1.5-r0: task do_unpack: Started
NOTE: recipe appstream-native-1.1.5-r0: task do_fetch: Started
NOTE: recipe appstream-native-1.1.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe appstream-native-1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 2088 of 2114 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.5.bb:do_unpack)
NOTE: Running task 2089 of 2114 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe appstream-1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 2090 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.5.bb:do_patch)
NOTE: recipe appstream-native-1.1.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2091 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.5.bb:do_create_recipe_spdx)
NOTE: recipe appstream-1.1.5-r0: task do_patch: Started
NOTE: recipe appstream-native-1.1.5-r0: task do_unpack: Started
NOTE: recipe appstream-native-1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe appstream-1.1.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe appstream-1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 2092 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2093 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.5.bb:do_populate_lic)
NOTE: recipe appstream-native-1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 2094 of 2114 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.5.bb:do_patch)
NOTE: recipe appstream-1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe appstream-1.1.5-r0: task do_populate_lic: Started
NOTE: recipe appstream-native-1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe appstream-1.1.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe appstream-native-1.1.5-r0: task do_patch: Started
NOTE: recipe appstream-1.1.5-r0: task do_populate_lic: Succeeded
NOTE: recipe appstream-native-1.1.5-r0: task do_patch: Succeeded
NOTE: recipe appstream-1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2095 of 2114 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe appstream-native-1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe appstream-native-1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2096 of 2114 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.5.bb:do_configure)
NOTE: recipe appstream-native-1.1.5-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_3.0.3.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pytho
 n/python3_3.14.6.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.28.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/itstool/itstool_2.0.7.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers
 /openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'cmake-native', 'libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'libxml2-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'perl-native', 'pkgconf-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-lxml-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'vala-native', 'bzip2-native', 'gperf-native', 'unzip-native', 'xz-native', 'zstd-native', 'gobject-introspection-native', 'libxmlb-native', 'curl-native', 'gdbm-native', 'itstool-native', 'libffi-native', 'libfyaml-native', 'libpcre2-native', 'libxslt-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dapidocs=false -Dgir=false -Dvapi=false -Dman=false -Dbash-completion=false -Dqt=false -Dstemming=false -Dsystemd=false...
| The Meson build system
| Version: 1.11.2
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.5/sources/AppStream-1.1.5
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.5/build
| Build type: native build
| Project name: AppStream
| Project version: 1.1.5
| C compiler for the host machine: gcc (gcc 14.2.0 "gcc (GCC) 14.2.0")
| C linker for the host machine: gcc ld.bfd 2.43.1.20241111
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Compiler for C supports arguments -Werror=shadow: YES
| Compiler for C supports arguments -Werror=empty-body: YES
| Compiler for C supports arguments -Werror=strict-prototypes: YES
| Compiler for C supports arguments -Werror=missing-prototypes: YES
| Compiler for C supports arguments -Werror=implicit-function-declaration: YES
| Compiler for C supports arguments -Werror=pointer-arith: YES
| Compiler for C supports arguments -Werror=missing-declarations: YES
| Compiler for C supports arguments -Werror=return-type: YES
| Compiler for C supports arguments -Werror=int-conversion: YES
| Compiler for C supports arguments -Werror=incompatible-pointer-types: YES
| Compiler for C supports arguments -Werror=misleading-indentation: YES
| Compiler for C supports arguments -Werror=missing-include-dirs: YES
| Compiler for C supports arguments -Werror=declaration-after-statement: YES
| Compiler for C supports arguments -Werror=format-security: NO
| Compiler for C supports arguments -Wno-missing-field-initializers: YES
| Compiler for C supports arguments -Wno-error=missing-field-initializers: YES
| Compiler for C supports arguments -Wno-unused-parameter: YES
| Compiler for C supports arguments -Wno-error=unused-parameter: YES
| Found pkg-config: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.5/recipe-sysroot-native/usr/bin/pkg-config-native) 3.0.3
| Run-time dependency glib-2.0 found: YES 2.88.2
| Run-time dependency gobject-2.0 found: YES 2.88.2
| Run-time dependency gio-2.0 found: YES 2.88.2
| Run-time dependency gmodule-2.0 found: YES 2.88.2
| Run-time dependency libcurl found: YES 8.21.0
| Run-time dependency libxml-2.0 found: YES 2.15.3
| Run-time dependency libfyaml found: YES 0.9.6
| Run-time dependency xmlb found: YES 0.3.28
| Library m found: YES
| Run-time dependency libzstd found: YES 1.5.7
| Found CMake: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.5/recipe-sysroot-native/usr/bin/cmake (4.4.0)
| Run-time dependency wayland-client found: NO  (tried pkg-config and cmake)
| 
| ../sources/AppStream-1.1.5/meson.build:210:25: ERROR: Dependency "wayland-client" not found (tried pkg-config and cmake)
| 
| A full log can be found at /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.5/build/meson-logs/meson-log.txt
| 
| Last 10 lines of meson-log.txt:
|   - "-DCMAKE_TOOLCHAIN_FILE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.5/build/meson-private/cmake_wayland-client/CMakeMesonToolchainFile.cmake"
|   - "."
|   -- Module search paths:    ['/', '/opt', '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.5/recipe-sysroot-native/usr', '/usr', '/usr/local']
|   -- CMake root:             /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.5/recipe-sysroot-native/usr/share/cmake-4.4
|   -- CMake architectures:    []
|   -- CMake lib search paths: ['lib', 'lib32', 'lib64', 'libx32', 'share', '']
| Preliminary CMake check failed. Aborting.
| Run-time dependency wayland-client found: NO  (tried pkg-config and cmake)
| 
| ../sources/AppStream-1.1.5/meson.build:210:25: ERROR: Dependency "wayland-client" not found (tried pkg-config and cmake)
| 
| ERROR: meson setup failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.5/temp/run.do_configure.2236923:175 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.5/temp/run.do_configure.2236923, line 175
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.5/temp/run.do_configure.2236923, line 164
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.5/temp/run.do_configure.2236923, line 151
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.5/temp/run.do_configure.2236923, line 188
NOTE: recipe appstream-native-1.1.5-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2096 tasks of which 2079 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260725054128.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260725054128.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.5.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.5/temp/log.do_configure.2236923
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: appstream-native-1.1.5-r0 do_configure: meson setup failed
ERROR: appstream-native-1.1.5-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.5/temp/run.do_configure.2236923' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/appstream-native/1.1.5/temp/log.do_configure.2236923
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.5.bb:do_configure) failed with exit code '1'

--===============0988472274310356434==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-appstream-upgrade-1.1.3-1.1.5.patch"

RnJvbSBkY2ZjZjk0MmQ1ZTQwNzdiZjBhYjAwZDJhNjg5ZTRiZjk5MGRiY2NiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjUgSnVsIDIwMjYgMDU6NDE6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
cHBzdHJlYW06IHVwZ3JhZGUgMS4xLjMgLT4gMS4xLjUKClNvdXJjZTogTkVXUwoKVmVyc2lvbiAx
LjEuNQp+fn5+fn5+fn5+fn5+ClJlbGVhc2VkOiAyMDI2LTA3LTI0CgpGZWF0dXJlczoKICogc3lz
aW5mbzogSW1wbGVtZW50IGRpc3BsYXkgc2l6ZSBkZXRlY3Rpb24gb24gbWFjT1MKCkJ1Z2ZpeGVz
OgogKiBxdDogQWRkIGJhY2sgd3JvbmcgY29uc3QgQ29tcG9uZW50OjphZGRCdW5kbGUgZm9yIEFC
SSBjb21wYXRpYmlsaXR5CiAqIHF0OiBVc2Ugc3RybmR1cCBmb3IgQyBzdHJpbmctbGlzdCBjb252
ZXJzaW9uCiAqIHBvb2w6IEZpeCBiaWRpcmVjdGlvbmFsIHdpbGRjYXJkIHNlYXJjaCBmb3IgbW9k
YWxpYXMgcHJvdmlkZXMKCkNvbnRyaWJ1dG9yczoKIE1hdHRoaWFzIEtsdW1wcAoKVmVyc2lvbiAx
LjEuNAp+fn5+fn5+fn5+fn5+ClJlbGVhc2VkOiAyMDI2LTA3LTIyCgpGZWF0dXJlczoKICogc3lz
aW5mbzogQXNzdW1lIGEgbW9yZSBtb2Rlcm4gZGlzcGxheSBmb3IgdGhlIGhhbmRzZXQgY2hhc3Np
cyB0ZW1wbGF0ZQogKiBzeXNpbmZvOiBBc3N1bWUgYSBtb3JlIG1vZGVybiBkaXNwbGF5IGZvciB0
aGUgdGFibGV0IGNoYXNzaXMgdGVtcGxhdGUKICogc3lzaW5mbzogSW5pdGlhbCBjb2RlIHRvIGF1
dG9kZXRlY3QgdGhlIGRpc3BsYXkgc2l6ZSBvbiBXYXlsYW5kCiAqIHN5c2luZm86IEhhbmRsZSBm
cmFjdGlvbmFsIGRpc3BsYXkgc2NhbGluZyB2aWEgeGRnLW91dHB1dAogKiBJbXBsZW1lbnQgc3Vw
cG9ydCBmb3IgR0NWRSBhcyB2dWxuZXJhYmlsaXR5IGRhdGFiYXNlIHByb3ZpZGVyCiAqIHF0OiBT
eW5jIGVudW0gbWlycm9ycyB3aXRoIHRoZSBDIGxpYnJhcnkKICogcXQ6IEFkZCBBcnRpZmFjdCwg
Q2hlY2tzdW0sIFJlZmVyZW5jZSwgUmV2aWV3IGFuZCBBZ3JlZW1lbnQgd3JhcHBlcnMKICogcXQ6
IFdyYXAgbWlzc2luZyBDIEFQSSBvbiBleGlzdGluZyBjbGFzc2VzCiAqIHJldmlld3M6IEFkZCBz
aW1wbGUgaW50ZXJmYWNlIHRvIGZldGNoIE9EUlMgcmV2aWV3cyBmb3IgYSBjb21wb25lbnQKICog
cmV2aWV3czogSW1wbGVtZW50IHN1cHBvcnQgZm9yIHN1Ym1pdHRpbmcgcmV2aWV3cwoKU3BlY2lm
aWNhdGlvbjoKICogZG9jczogU3VnZ2VzdCB1c2luZyB0aGUgbG9uZ2VzdCBkaXNwbGF5IHNpZGUg
Zm9yIG1heGltdW0gc2l6ZSBjb25zdHJhaW50cwoKQnVnZml4ZXM6CiAqIE1ha2UgR1Jlc291cmNl
cyB3ZSBuZWVkIG91dGxpdmUgbWFpbiB0aHJlYWQgZGVzdHJ1Y3Rpb24KICogcG9vbDogUHJvcGVy
bHkgaW1wbGVtZW50IGNhbmNlbGxhdGlvbiBvZiBsb2FkIG9wZXJhdGlvbnMKICogc3lzaW5mbzog
Rml4IGRpc3BsYXktbGVuZ3RoIHNldHRlciBvdmVycmlkaW5nIHRoZSBzaG9ydGVzdCBlZGdlCiAq
IHJlbGF0aW9uLWNoZWNrOiBEb24ndCB6ZXJvIHRoZSBzY29yZSBpZiBhIHJlcXVpcmVkIGNoZWNr
IGVycm9yZWQKICogY3VybDogSGFyZGVuIGRvd25sb2FkZXIgYnkgcmVzdHJpY3RpbmcgcHJvdG9j
b2xzIHRvIG9ubHkgSFRUUChTKQogKiBjdXJsOiBBbGxvdyBtYWtpbmcgUE9TVCByZXF1ZXN0cyBh
bmQgY2hhbmdpbmcgdGhlIHVzZXIgYWdlbnQKICogY3VybDogRml4IHJldHJ5LWxvb3AgZGF0YSBj
b3JydXB0aW9uIGFuZCBkb24ndCBibGluZGx5IHJldHJ5IFBPU1QgcmVxdWVzdHMKICogeWFtbDog
Rml4IHBvdGVudGlhbCBjcmFzaGVzIHdoZW4gZW5jb3VudGVyaW5nIG1pc3NpbmcgcmVsYXRpb24g
ZW50cnkgdmFsdWVzCiAqIHlhbWw6IEFkanVzdCB0ZXN0cyBhbmQgZW1pdHRlciB0byB3b3JrIGFy
b3VuZCBsaWJmeWFtbCBzdHJpbmctcXVvdGluZyBjaGFuZ2UKICogeWFtbDogRW5zdXJlIHZlcnNp
b24gcmVsYXRpb25zIGFyZSBjb25zaXN0ZW50bHkgcXVvdGVkCiAqIHF0OiBGaXggYnVmZmVyIG92
ZXJydW4gaW4gc3RyaW5nTGlzdFRvQ2hhckFycmF5CgpNaXNjZWxsYW5lb3VzOgogKiBjaTogZnJl
ZWJzZDogU3dpdGNoIGZyb20gQ2lycnVzIHRvIEdpdEh1YiBBY3Rpb25zCiAqIGNpOiBVcGRhdGUg
VWJ1bnR1IExUUyB0byAyNi4wNAoKQ29udHJpYnV0b3JzOgogR2xlYiBQb3BvdiwgTWF0dGhpYXMg
S2x1bXBwCi0tLQogLi4uL2FwcHN0cmVhbS9hcHBzdHJlYW0vMDAwMS1yZW1vdmUtaGFyZGNvZGVk
LXBhdGgucGF0Y2ggICAgfCA2ICsrKy0tLQogLi4uL2FwcHN0cmVhbS9hcHBzdHJlYW0vMDAwMi1E
by1ub3QtYnVpbGQtcXQtdGVzdHMucGF0Y2ggICAgfCA2ICsrKy0tLQogLi4ueC1QQUNLQUdFX1BS
RUZJWF9ESVItaW4tcXQtY21ha2UtQXBwU3RyZWFtUXRDb25maWcucGF0Y2ggfCAyICstCiAuLi4v
YXBwc3RyZWFtL3thcHBzdHJlYW1fMS4xLjMuYmIgPT4gYXBwc3RyZWFtXzEuMS41LmJifSAgICB8
IDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS97YXBwc3RyZWFtXzEuMS4zLmJi
ID0+IGFwcHN0cmVhbV8xLjEuNS5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDEtcmVtb3ZlLWhhcmRjb2RlZC1wYXRoLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbS8wMDAxLXJlbW92
ZS1oYXJkY29kZWQtcGF0aC5wYXRjaAppbmRleCA1NmE1NDc5MDk5Li5kNzJiZDczZDg1IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDEtcmVt
b3ZlLWhhcmRjb2RlZC1wYXRoLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0
cmVhbS9hcHBzdHJlYW0vMDAwMS1yZW1vdmUtaGFyZGNvZGVkLXBhdGgucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIGJmNzljMjBjZmVlNGEwNzRjYTc1MmExNDY2ZGM5NmQwYjllYjYxNzUgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDhjZjI3ODVhNGFjOTNjMDdjMWRiZDNhMTZhNTA3
ZTk0MmQ0NjlhYTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBNYXJrdXMgVm9sayA8
Zl9sX2tAdC1vbmxpbmUuZGU+CiBEYXRlOiBNb24sIDEyIERlYyAyMDIyIDE1OjQyOjQyICswMTAw
CiBTdWJqZWN0OiBbUEFUQ0hdIHJlbW92ZSBoYXJkY29kZWQgcGF0aApAQCAtMTQsMTAgKzE0LDEw
IEBAIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbb2Utc3BlY2lmaWNdCiAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBh
L21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKLWluZGV4IDlhZjVmNTguLmFkMTQ4M2QgMTAwNjQ0
CitpbmRleCA0YzNjY2YyLi42MmI5ODM4IDEwMDY0NAogLS0tIGEvbWVzb24uYnVpbGQKICsrKyBi
L21lc29uLmJ1aWxkCi1AQCAtMTk0LDEwICsxOTQsMTAgQEAgZW5kaWYKK0BAIC0yMjcsMTAgKzIy
NywxMCBAQCBlbmRpZgogIHN0ZW1tZXJfaW5jX2RpcnMgPSBpbmNsdWRlX2RpcmVjdG9yaWVzKCkK
ICBpZiBnZXRfb3B0aW9uKCdzdGVtbWluZycpCiAgICAgIHN0ZW1tZXJfbGliID0gY2MuZmluZF9s
aWJyYXJ5KCdzdGVtbWVyJywgcmVxdWlyZWQ6IHRydWUpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDItRG8tbm90LWJ1aWxkLXF0LXRlc3Rz
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbS8wMDAyLURv
LW5vdC1idWlsZC1xdC10ZXN0cy5wYXRjaAppbmRleCAzZTY2NjE4MWViLi43YTEyYTc4ZGQxIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDIt
RG8tbm90LWJ1aWxkLXF0LXRlc3RzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Fw
cHN0cmVhbS9hcHBzdHJlYW0vMDAwMi1Eby1ub3QtYnVpbGQtcXQtdGVzdHMucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIDFhMTYxOWRjZTNjM2ZhNTRmYTVmNDdmN2VkODk0NDdlMDgwNWRlNDMg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDQ0M2I1NzVhNjQ0NGU3NmZkYmQ2YTZmZjlk
MGQzZTM3OGI2YTk2YTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBNYXJjIEZlcmxh
bmQgPG1hcmMuZmVybGFuZEBzb25hdGVzdC5jb20+CiBEYXRlOiBGcmksIDI2IEp1bCAyMDI0IDE1
OjQxOjAwIC0wNDAwCiBTdWJqZWN0OiBbUEFUQ0hdIERvIG5vdCBidWlsZCBxdC90ZXN0cwpAQCAt
MjMsMTAgKzIzLDEwIEBAIFNpZ25lZC1vZmYtYnk6IE1hcmMgRmVybGFuZCA8bWFyYy5mZXJsYW5k
QHNvbmF0ZXN0LmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAt
LWdpdCBhL3F0L21lc29uLmJ1aWxkIGIvcXQvbWVzb24uYnVpbGQKLWluZGV4IDQwN2E1N2EuLjg0
MGM4MzggMTAwNjQ0CitpbmRleCA0ODhmZTYwLi44M2MyNzE1IDEwMDY0NAogLS0tIGEvcXQvbWVz
b24uYnVpbGQKICsrKyBiL3F0L21lc29uLmJ1aWxkCi1AQCAtMTMwLDUgKzEzMCwzIEBAIGluc3Rh
bGxfZGF0YSAoCitAQCAtMTQ0LDUgKzE0NCwzIEBAIGluc3RhbGxfZGF0YSAoCiAgICAgIGpvaW5f
cGF0aHMobWVzb24uY3VycmVudF9idWlsZF9kaXIoKSwgJ0FwcFN0cmVhbVF0Q29uZmlnVmVyc2lv
bi5jbWFrZScpLAogICAgICBpbnN0YWxsX2Rpcjogam9pbl9wYXRocyhnZXRfb3B0aW9uKCdsaWJk
aXInKSwgJ2NtYWtlJywgJ0FwcFN0cmVhbVF0JykKICApCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDMtRml4LVBBQ0tBR0VfUFJFRklYX0RJ
Ui1pbi1xdC1jbWFrZS1BcHBTdHJlYW1RdENvbmZpZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2FwcHN0cmVhbS9hcHBzdHJlYW0vMDAwMy1GaXgtUEFDS0FHRV9QUkVGSVhfRElSLWluLXF0
LWNtYWtlLUFwcFN0cmVhbVF0Q29uZmlnLnBhdGNoCmluZGV4IDhiYTRkZTk1YzkuLjdiNTMzYTMx
YmMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS9hcHBzdHJlYW0v
MDAwMy1GaXgtUEFDS0FHRV9QUkVGSVhfRElSLWluLXF0LWNtYWtlLUFwcFN0cmVhbVF0Q29uZmln
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS9hcHBzdHJlYW0vMDAw
My1GaXgtUEFDS0FHRV9QUkVGSVhfRElSLWluLXF0LWNtYWtlLUFwcFN0cmVhbVF0Q29uZmlnLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0ZmRkMjkzNDZiNTFlZWE1NzdlZTQ2YzcxNjYzNDhk
YWQxOWJiY2IwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2YmRhOTQ2ZDYzYWYxOTYx
NjlkOGI4MWVlNWNmODFjM2RmN2Y4OTFhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
TWFyYyBGZXJsYW5kIDxtYXJjLmZlcmxhbmRAc29uYXRlc3QuY29tPgogRGF0ZTogTW9uLCAyOSBK
dWwgMjAyNCAwOTozNTo1MSAtMDQwMAogU3ViamVjdDogW1BBVENIXSBGaXggUEFDS0FHRV9QUkVG
SVhfRElSIGluIHF0L2NtYWtlL0FwcFN0cmVhbVF0Q29uZmlnLmNtYWtlLmluCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtXzEuMS4zLmJiIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbV8xLjEuNS5iYgpzaW1pbGFyaXR5
IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBw
c3RyZWFtXzEuMS4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0v
YXBwc3RyZWFtXzEuMS41LmJiCmluZGV4IDA2ZTRmNzk0MGEuLmNjZjYyN2E0NzggMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS9hcHBzdHJlYW1fMS4xLjMuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbV8xLjEuNS5iYgpAQCAt
MjQsNyArMjQsNyBAQCBTUkNfVVJJID0gIiBcCiAJZmlsZTovLzAwMDItRG8tbm90LWJ1aWxkLXF0
LXRlc3RzLnBhdGNoIFwKIAlmaWxlOi8vMDAwMy1GaXgtUEFDS0FHRV9QUkVGSVhfRElSLWluLXF0
LWNtYWtlLUFwcFN0cmVhbVF0Q29uZmlnLnBhdGNoIFwKICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICIyNjI0Zjk2NzA2ODQyN2VkYzk0ZjM5NzllZGFlMzU3MWJiMDc3MDYzZjViYzIzMWY3Mzc3NzZk
YTUyN2JmNDY3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImZjNTczMzdlMjUwYjBkMjdlNzVhYzQy
MTZjYzY5YTc2ZDAzYzU0MDExYTVkYTVjN2EyYzU3NzExYTNkMGNkZjkiCiAKIFMgPSAiJHtVTlBB
Q0tESVJ9L0FwcFN0cmVhbS0ke1BWfSIKIAotLSAKMi40Ny4xCgo=

--===============0988472274310356434==--

