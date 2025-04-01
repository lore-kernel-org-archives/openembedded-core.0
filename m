Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C535DC369B4
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:23 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.18046.1743511393594764349
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=gbSpLJ6x;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=kOn0e7s7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010195f16097fa-d88ab7e0-0511-4223-9fec-e6f5ed35d3f8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1RUPQqY87XwS2y4q12tZPsrgIJ7p4sa0KruwWfsCEdc=;
	b=gbSpLJ6xyAhCPojzssizPP1bQTJnD0qZdcY8U6RADijOMgJaqYKQIedX5uVTeBBJ
	m+psUKI8kzvHGDmbHyqsSvLv6J6XModj8UawHpIt2GzGsy6HkiFas79CF60a9JvfHX5
	wLCfxjQ9ZPL5YBXbSkWSBQIP9F9SUSJHbx6AFbrE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1RUPQqY87XwS2y4q12tZPsrgIJ7p4sa0KruwWfsCEdc=;
	b=kOn0e7s7BMdqmRZ3ihVbDX+HsykgkRQLUXk0XqolBeHHzP0i+l8RcHkBDy0VSaoU
	x6wAHOEI9AtwlpEO+UoxleCsaYGg6mHOB6ieYX4G51KMbyH+jTl5QyFKLoq0uxLb75h
	ImlJo+/w8pY9KgE/FnGCku0sZPkWEuOVVwuVDBaI=
Content-Type: multipart/mixed; boundary="===============2095174012162008731=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] perl: upgrading to 5.40.1 FAILED
Message-ID: <01010195f16097fa-d88ab7e0-0511-4223-9fec-e6f5ed35d3f8-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214054

--===============2095174012162008731==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *perl* to *5.40.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-perl-upgrade-5.40.0-5.40.1.patch
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
From 9ec889fde684f679cad5805e5c60d0559cd1ace4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 08:44:12 +0000
Subject: [PATCH] perl: upgrade 5.40.0 -> 5.40.1

---
 ...his-module-breaks-through-the-perl-wrapper-.patch |  2 +-
 ...Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch |  2 +-
 .../perl/files/0002-Constant-Fix-up-shebang.patch    |  2 +-
 meta/recipes-devtools/perl/files/determinism.patch   |  2 +-
 meta/recipes-devtools/perl/files/encodefix.patch     |  2 +-
 meta/recipes-devtools/perl/files/errno_ver.diff      |  2 +-
 .../recipes-devtools/perl/files/native-perlinc.patch |  2 +-
 .../perl/files/perl-configpm-switch.patch            |  2 +-
 .../recipes-devtools/perl/files/perl-dynloader.patch |  2 +-
 meta/recipes-devtools/perl/perl-ptest.inc            | 12 +++++++++++-
 .../perl/{perl_5.40.0.bb => perl_5.40.1.bb}          |  2 +-
 11 files changed, 21 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/perl/{perl_5.40.0.bb => perl_5.40.1.bb} (99%)

diff --git a/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch b/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
index 2076c61ee0..33237471e6 100644
--- a/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
+++ b/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
@@ -1,4 +1,4 @@
-From 47cd22cd213d2c5f28e674b12c264dc731682560 Mon Sep 17 00:00:00 2001
+From 5a2d1dd38cbc730980217855a297e9aef22adf02 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 5 Jun 2018 14:58:42 +0300
 Subject: [PATCH] Somehow this module breaks through the perl wrapper and
diff --git a/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch b/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
index 7e5d08d8db..db62933f78 100644
--- a/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
+++ b/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
@@ -1,4 +1,4 @@
-From 322972384e0795be339252f7cf9a318dc759b51e Mon Sep 17 00:00:00 2001
+From 4d6f6495b8e672652ed216e77cb4b5aa057e4a68 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Fri, 18 Feb 2022 09:44:26 +0000
 Subject: [PATCH] cpan/Sys-Syslog/Makefile.PL: Fix _PATH_LOG for deterministic
diff --git a/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch b/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
index 80986e66da..11493fe3ac 100644
--- a/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
+++ b/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
@@ -1,4 +1,4 @@
-From a02355bdc8cde1115daf101675cdfb707d337bf1 Mon Sep 17 00:00:00 2001
+From beffd59f19afee2a1c8790b5a471b293049267f4 Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Mon, 17 Jun 2019 10:47:23 -0500
 Subject: [PATCH] Constant: Fix up shebang
diff --git a/meta/recipes-devtools/perl/files/determinism.patch b/meta/recipes-devtools/perl/files/determinism.patch
index bdb9a928bb..24750473fc 100644
--- a/meta/recipes-devtools/perl/files/determinism.patch
+++ b/meta/recipes-devtools/perl/files/determinism.patch
@@ -1,4 +1,4 @@
-From 5c4fd57daf125357262aa796057d7be8e78d378e Mon Sep 17 00:00:00 2001
+From 57f79055fc2ff0cddf170fae67bf371b2517d1ee Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 5 Feb 2020 23:54:02 +0000
 Subject: [PATCH] Fixes to make the perl build reproducible:
diff --git a/meta/recipes-devtools/perl/files/encodefix.patch b/meta/recipes-devtools/perl/files/encodefix.patch
index 665699d12d..cfeed39dee 100644
--- a/meta/recipes-devtools/perl/files/encodefix.patch
+++ b/meta/recipes-devtools/perl/files/encodefix.patch
@@ -1,4 +1,4 @@
-From a4e22c7f2a519f24bc8aa89c6677017c0fe13679 Mon Sep 17 00:00:00 2001
+From 0c2049cda0fa93ab3fcbb2370eda6a1c1b14f33d Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 18 Feb 2020 17:27:26 +0000
 Subject: [PATCH] perl: Fix encode module reproducibility issues
diff --git a/meta/recipes-devtools/perl/files/errno_ver.diff b/meta/recipes-devtools/perl/files/errno_ver.diff
index 477642f457..8f40ca9a3e 100644
--- a/meta/recipes-devtools/perl/files/errno_ver.diff
+++ b/meta/recipes-devtools/perl/files/errno_ver.diff
@@ -1,4 +1,4 @@
-From 9c404d4b1c3607e827fb56b5ae4f8fbbdb52cd0b Mon Sep 17 00:00:00 2001
+From f61b3c4817fb07e1aa3512e0112964a9d152de35 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 16 Dec 2005 01:32:14 +1100
 Subject: [PATCH] Remove Errno version check due to upgrade problems with
diff --git a/meta/recipes-devtools/perl/files/native-perlinc.patch b/meta/recipes-devtools/perl/files/native-perlinc.patch
index 7e3e5f6652..3b1c5bf0ce 100644
--- a/meta/recipes-devtools/perl/files/native-perlinc.patch
+++ b/meta/recipes-devtools/perl/files/native-perlinc.patch
@@ -1,4 +1,4 @@
-From 9fec62b19a49d1451fd1120c5dc38baf59f73856 Mon Sep 17 00:00:00 2001
+From 1b14623af1e91198ed62c254d045dccd38b39ef0 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 30 May 2007 09:33:32 +0000
 Subject: [PATCH] perl: sync with OE
diff --git a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
index 3721277933..ae329d3751 100644
--- a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
+++ b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
@@ -1,4 +1,4 @@
-From 7a48538a7e8614a3342151b646d2105c0cb0cdd9 Mon Sep 17 00:00:00 2001
+From 4a58b6cc213c0265d2343a2769d35e07135d892f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sun, 27 May 2007 21:04:11 +0000
 Subject: [PATCH] perl: 5.8.7 -> 5.8.8 (from OE)
diff --git a/meta/recipes-devtools/perl/files/perl-dynloader.patch b/meta/recipes-devtools/perl/files/perl-dynloader.patch
index 5472602d3a..24685b4232 100644
--- a/meta/recipes-devtools/perl/files/perl-dynloader.patch
+++ b/meta/recipes-devtools/perl/files/perl-dynloader.patch
@@ -1,4 +1,4 @@
-From 25a26c52c320e699b37a7ad1f4f045bc8aa4cb00 Mon Sep 17 00:00:00 2001
+From 647e00451e4f4e2acebc199a7c42f2df14d6c97b Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard@openedhand.com>
 Date: Sun, 27 May 2007 21:04:11 +0000
 Subject: [PATCH] perl: 5.8.7 -> 5.8.8 (from OE)
diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index 4b4756118c..0830ff5b2a 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -1,6 +1,16 @@
 inherit ptest
 
-SRC_URI += "file://run-ptest \
+SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
+           file://perl-rdepends.txt \
+           file://0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch \
+           file://errno_ver.diff \
+           file://native-perlinc.patch \
+           file://perl-dynloader.patch \
+           file://0002-Constant-Fix-up-shebang.patch \
+           file://determinism.patch \
+           file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
+           file://run-ptest \
+           file://perl-configpm-switch.patch \
            "
 
 DEBUG_PREFIX_MAP_REGEX = "${@'\\|'.join(d.getVar('DEBUG_PREFIX_MAP').split())}"
diff --git a/meta/recipes-devtools/perl/perl_5.40.0.bb b/meta/recipes-devtools/perl/perl_5.40.1.bb
similarity index 99%
rename from meta/recipes-devtools/perl/perl_5.40.0.bb
rename to meta/recipes-devtools/perl/perl_5.40.1.bb
index 0d4338f29f..448fd52ed6 100644
--- a/meta/recipes-devtools/perl/perl_5.40.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.40.1.bb
@@ -25,7 +25,7 @@ SRC_URI:append:class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "c740348f357396327a9795d3e8323bafd0fe8a5c7835fc1cbaba0cc8dfe7161f"
+SRC_URI[perl.sha256sum] = "02f8c45bb379ed0c3de7514fad48c714fd46be8f0b536bfd5320050165a1ee26"
 
 B = "${WORKDIR}/perl-${PV}-build"
 
-- 
2.47.1


--===============2095174012162008731==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1888 entries from dependency cache.
Parsing recipes...done.
Parsing of 924 .bb files complete (923 cached, 1 parsed). 1886 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:aeecf715ebc43dca0ef8a4934b3107c06b8f2565"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 539 Local 206 Mirrors 0 Missed 333 Current 244 (38% match, 57% complete)
Removing 63 stale sstate objects for arch qemux86_64...done.
Removing 5 stale sstate objects for arch allarch...done.
Removing 58 stale sstate objects for arch x86_64...done.
Removing 29 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 352 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 356 of 783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 370 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 382 of 783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 389 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 400 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 406 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 408 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 409 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 413 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 421 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 424 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 425 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 431 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 434 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 437 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.1.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-locale-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.40.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dpkg-native-1.22.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-34.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 440 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_257.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-locale-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gawk-5.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.40.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 445 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe dpkg-native-1.22.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-34.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 447 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 457 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 459 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 465 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_257.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 467 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 468 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 469 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 471 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 473 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe procps-4.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 476 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 477 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 481 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 484 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 490 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 494 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe gawk-5.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.75-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 498 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-34.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 500 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 501 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 505 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 506 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gawk-5.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 517 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 520 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 521 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 526 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.75-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 531 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-34.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 533 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 535 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 539 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 540 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 541 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 545 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_257.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 551 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 555 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 560 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 561 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 562 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 566 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_257.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 575 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 577 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 578 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 579 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.75-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 581 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 584 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 586 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 587 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 597 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 599 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 601 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 605 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 606 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 609 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 611 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 613 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 616 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 617 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 623 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 627 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 629 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_76.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 632 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 639 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 641 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 642 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 647 of 783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe qemu-native-9.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-76.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 649 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 651 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 652 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 653 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe qemu-native-9.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-76.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 655 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 657 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 658 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_create_spdx_setscene)
NOTE: Running setscene task 659 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 662 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 666 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 669 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-native-2.13.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 670 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 671 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 673 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_76.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 674 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-native-2.13.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 675 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 676 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 677 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 678 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 679 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-76.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 681 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 682 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 683 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 684 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 686 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 687 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 689 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-76.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 692 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 693 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 698 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 700 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 701 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 702 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 704 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 707 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 714 of 783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 715 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 717 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 721 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-3.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 727 of 783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 729 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 733 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 738 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 739 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 742 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 751 of 783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 758 of 783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perlcross-native-1.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 761 of 783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 762 of 783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 766 of 783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 768 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.31.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glibc-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 772 of 783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 774 of 783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perlcross-native-1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cmake-native-3.31.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-c-native-0.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-native-8.12.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 775 of 783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-native-2.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cmake-native-3.31.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-c-native-0.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-native-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-native-8.12.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-native-3.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-native-5.40.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 776 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_gcc_stash_builddir_setscene)
NOTE: Running setscene task 778 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe expat-native-2.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 779 of 783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-native-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perlcross-native-1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-native-5.40.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-native-3.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 104 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.1.bb:do_fetch)
NOTE: Running task 128 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_fetch)
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 148 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 168 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.31.6.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perl-native-5.40.1-r0: task do_fetch: Started
NOTE: recipe perlcross-native-1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 781 of 783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.6.bb:do_recipe_qa_setscene)
NOTE: recipe cmake-native-3.31.6-r0: task do_fetch: Started
NOTE: recipe openssl-native-3.4.1-r0: task do_fetch: Started
NOTE: recipe perl-native-5.40.1-r0: task do_fetch: Succeeded
NOTE: recipe cmake-native-3.31.6-r0: task do_fetch: Succeeded
NOTE: Running task 221 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.1.bb:do_unpack)
NOTE: Running task 225 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.31.6.bb:do_unpack)
NOTE: recipe expat-native-2.7.1-r0: task do_fetch: Started
NOTE: recipe openssl-native-3.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 233 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_unpack)
NOTE: recipe expat-native-2.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 239 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_unpack)
NOTE: recipe perlcross-native-1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cmake-native-3.31.6-r0: task do_unpack: Started
NOTE: recipe perl-native-5.40.1-r0: task do_unpack: Started
NOTE: recipe perlcross-native-1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 333 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe expat-native-2.7.1-r0: task do_unpack: Started
NOTE: recipe openssl-native-3.4.1-r0: task do_unpack: Started
NOTE: Running task 374 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.12-r0: task do_fetch: Started
NOTE: recipe perl-native-5.40.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 468 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_fetch)
NOTE: recipe expat-native-2.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 478 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_patch)
NOTE: recipe linux-libc-headers-6.12-r0: task do_fetch: Succeeded
NOTE: Running task 486 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_unpack)
NOTE: Running task 487 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 492 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_fetch)
NOTE: Running noexec task 543 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.12-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-native-5.40.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 551 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_fetch)
NOTE: Running task 555 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_fetch)
NOTE: Running task 557 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: Running task 565 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: Running task 567 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_fetch)
NOTE: recipe expat-native-2.7.1-r0: task do_patch: Started
NOTE: Running task 569 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe util-linux-native-2.40.4-r0: task do_fetch: Started
NOTE: Running task 571 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_fetch)
NOTE: recipe glibc-2.41+git-r0: task do_fetch: Started
NOTE: Running task 574 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_fetch)
NOTE: recipe util-linux-native-2.40.4-r0: task do_fetch: Succeeded
NOTE: Running task 575 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_unpack)
NOTE: recipe expat-native-2.7.1-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Started
NOTE: recipe glibc-2.41+git-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: Running task 577 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_generate_toolchain_file)
NOTE: Running task 578 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_unpack)
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: Running task 579 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_unpack)
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_fetch: Started
NOTE: Running task 580 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_fetch)
NOTE: recipe expat-2.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 581 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: recipe openssl-3.4.1-r0: task do_fetch: Started
NOTE: recipe gdbm-1.24-r0: task do_fetch: Succeeded
NOTE: Running task 582 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_unpack)
NOTE: Running task 594 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.40.4-r0: task do_unpack: Started
NOTE: recipe expat-native-2.7.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe glibc-2.41+git-r0: task do_unpack: Started
NOTE: recipe xz-5.6.4-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: recipe xz-5.6.4-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 595 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_unpack)
NOTE: Running task 596 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe expat-2.7.1-r0: task do_unpack: Started
NOTE: recipe expat-native-2.7.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe openssl-3.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 597 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 598 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 599 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_unpack)
NOTE: recipe curl-native-8.12.1-r0: task do_fetch: Started
NOTE: Running task 600 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: recipe curl-native-8.12.1-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 605 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_patch)
NOTE: Running task 606 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_fetch)
NOTE: recipe gdbm-1.24-r0: task do_unpack: Started
NOTE: recipe openssl-native-3.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 607 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_patch)
NOTE: recipe xz-5.6.4-r0: task do_unpack: Started
NOTE: recipe expat-2.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 608 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: recipe openssl-3.4.1-r0: task do_unpack: Started
NOTE: recipe gdbm-1.24-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Started
NOTE: Running task 609 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_patch)
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_fetch: Started
NOTE: recipe xz-5.6.4-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_patch: Started
NOTE: Running task 610 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_patch)
NOTE: recipe openssl-native-3.4.1-r0: task do_patch: Started
NOTE: recipe gdbm-1.24-r0: task do_patch: Started
NOTE: recipe perl-native-5.40.1-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_patch: Started
NOTE: Running task 611 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.1.bb:do_patch)
NOTE: recipe expat-2.7.1-r0: task do_patch: Succeeded
NOTE: Running task 619 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_fetch)
NOTE: Running task 620 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_unpack)
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_fetch: Succeeded
NOTE: Running task 623 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_unpack)
NOTE: recipe xz-5.6.4-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_patch: Succeeded
NOTE: recipe util-linux-native-2.40.4-r0: task do_unpack: Succeeded
NOTE: recipe perl-native-5.40.1-r0: task do_patch: Started
NOTE: Running task 634 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_patch)
NOTE: recipe json-c-native-0.18-r0: task do_fetch: Started
NOTE: Running task 642 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_generate_toolchain_file)
NOTE: recipe openssl-native-3.4.1-r0: task do_patch: Succeeded
NOTE: recipe curl-native-8.12.1-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe json-c-native-0.18-r0: task do_fetch: Succeeded
NOTE: Running task 649 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: Running task 650 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_unpack)
NOTE: Running task 651 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_fetch)
NOTE: Running task 653 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_unpack: Started
NOTE: recipe expat-2.7.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.40.4-r0: task do_patch: Started
NOTE: recipe ncurses-6.5-r0: task do_fetch: Started
NOTE: recipe expat-2.7.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_fetch: Succeeded
NOTE: recipe json-c-native-0.18-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 666 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: Running task 676 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_fetch)
NOTE: recipe json-c-native-0.18-r0: task do_unpack: Succeeded
NOTE: Running task 690 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_patch)
NOTE: Running task 707 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_unpack)
NOTE: recipe cmake-native-3.31.6-r0: task do_unpack: Succeeded
NOTE: Running task 708 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.31.6.bb:do_patch)
NOTE: recipe openssl-3.4.1-r0: task do_unpack: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: Running task 709 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: Running task 712 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_fetch)
NOTE: recipe ncurses-6.5-r0: task do_fetch: Succeeded
NOTE: recipe cmake-native-3.31.6-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_unpack: Started
NOTE: Running task 713 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Succeeded
NOTE: Running task 721 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.1.bb:do_collect_spdx_deps)
NOTE: recipe curl-native-8.12.1-r0: task do_unpack: Succeeded
NOTE: recipe json-c-native-0.18-r0: task do_patch: Started
NOTE: Running task 722 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_patch)
NOTE: recipe openssl-3.4.1-r0: task do_patch: Started
NOTE: recipe libffi-3.4.7-r0: task do_fetch: Started
NOTE: recipe json-c-native-0.18-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_unpack: Started
NOTE: Running task 731 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_fetch)
NOTE: Running task 732 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.38-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 733 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_unpack)
NOTE: Running task 735 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_patch)
NOTE: Running task 738 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_fetch)
NOTE: recipe perl-native-5.40.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe curl-native-8.12.1-r0: task do_patch: Started
NOTE: recipe perl-native-5.40.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_fetch: Started
NOTE: Running task 739 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_fetch)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_fetch: Succeeded
NOTE: Running task 741 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Started
NOTE: recipe cmake-native-3.31.6-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe util-linux-native-2.40.4-r0: task do_patch: Succeeded
NOTE: Running task 755 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.2.0.bb:do_fetch)
NOTE: recipe libedit-20250104-3.1-r1: task do_fetch: Started
NOTE: Running task 773 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_generate_toolchain_file)
NOTE: Running task 779 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_unpack)
NOTE: recipe curl-native-8.12.1-r0: task do_patch: Succeeded
NOTE: Running task 781 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_fetch)
NOTE: recipe libedit-20250104-3.1-r1: task do_fetch: Succeeded
NOTE: Running task 786 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_fetch)
NOTE: Running task 787 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_unpack)
NOTE: recipe qemu-native-9.2.0-r0: task do_fetch: Started
NOTE: recipe python3-3.13.2-r0: task do_fetch: Started
NOTE: recipe openssl-3.4.1-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_unpack: Started
NOTE: recipe qemu-native-9.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 789 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_unpack)
NOTE: Running task 790 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_unpack)
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_unpack: Started
NOTE: recipe json-c-native-0.18-r0: task do_generate_toolchain_file: Started
NOTE: Running task 791 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_unpack)
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Started
NOTE: recipe python3-3.13.2-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-native-2.13.6-r0: task do_fetch: Started
NOTE: Running task 792 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_unpack)
NOTE: recipe libxml2-native-2.13.6-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe json-c-native-0.18-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 793 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.2.0.bb:do_unpack)
NOTE: recipe libffi-3.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 797 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_patch)
NOTE: recipe libtirpc-1.3.6-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_unpack: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_unpack: Started
NOTE: Running task 814 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_unpack)
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_unpack: Succeeded
NOTE: Running task 815 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_unpack)
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Started
NOTE: Running task 820 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_patch)
NOTE: recipe libedit-20250104-3.1-r1: task do_unpack: Succeeded
NOTE: recipe qemu-native-9.2.0-r0: task do_unpack: Started
NOTE: Running task 844 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_patch)
NOTE: Running task 850 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_fetch)
NOTE: recipe libffi-3.4.7-r0: task do_patch: Started
NOTE: recipe python3-3.13.2-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_unpack: Succeeded
NOTE: Running task 851 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_patch)
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Started
NOTE: recipe libxml2-native-2.13.6-r0: task do_unpack: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_patch: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_patch: Started
NOTE: Running task 852 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_patch)
NOTE: recipe bash-completion-2.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 853 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_write_config)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_patch: Started
NOTE: recipe libffi-3.4.7-r0: task do_patch: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_patch: Started
NOTE: Running task 855 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_unpack)
NOTE: recipe ncurses-6.5-r0: task do_unpack: Succeeded
NOTE: Running task 856 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_patch)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_patch: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_patch: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Started
NOTE: Running task 860 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_fetch)
NOTE: Running task 862 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_fetch)
NOTE: recipe bash-completion-2.16.0-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_patch: Succeeded
NOTE: Running task 863 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_patch)
NOTE: recipe ncurses-6.5-r0: task do_patch: Started
NOTE: Running task 870 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_fetch)
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Succeeded
NOTE: Running task 872 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_fetch)
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_unpack: Succeeded
NOTE: Running task 873 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_patch)
NOTE: recipe libpcre2-10.45-r0: task do_fetch: Started
NOTE: Running task 874 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_patch)
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.45-r0: task do_fetch: Succeeded
NOTE: Running task 875 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_unpack)
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_patch: Started
NOTE: Running task 876 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_unpack)
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Started
NOTE: recipe libxml2-2.13.6-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_patch: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 877 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_patch)
NOTE: recipe libpcre2-10.45-r0: task do_unpack: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_patch: Succeeded
NOTE: Running task 880 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_fetch)
NOTE: recipe libxml2-2.13.6-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 884 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: Running task 888 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_unpack)
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Succeeded
NOTE: Running task 892 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_write_config)
NOTE: Running task 893 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_unpack)
NOTE: recipe libxml2-native-2.13.6-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_patch: Succeeded
NOTE: Running task 894 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_patch)
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: recipe util-linux-2.40.4-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 917 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_76.0.0.bb:do_fetch)
NOTE: Running task 918 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_unpack)
NOTE: recipe libxml2-2.13.6-r0: task do_unpack: Started
NOTE: recipe util-linux-2.40.4-r0: task do_fetch: Succeeded
NOTE: Running task 919 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_unpack)
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_write_config: Started
NOTE: recipe ncurses-6.5-r0: task do_patch: Succeeded
NOTE: Running task 922 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_write_config: Succeeded
NOTE: recipe libxml2-native-2.13.6-r0: task do_patch: Started
NOTE: recipe python3-setuptools-76.0.0-r0: task do_fetch: Started
NOTE: Running task 925 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_fetch)
NOTE: recipe attr-2.5.2-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-76.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 926 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_fetch)
NOTE: recipe util-linux-2.40.4-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.45-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 927 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_patch)
NOTE: Running task 928 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_patch)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_fetch: Started
NOTE: recipe libxml2-native-2.13.6-r0: task do_patch: Succeeded
NOTE: Running task 939 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_76.0.0.bb:do_unpack)
NOTE: Running task 941 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_unpack)
NOTE: recipe wayland-1.23.1-r0: task do_fetch: Succeeded
NOTE: Running task 944 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_patch: Started
NOTE: Running task 946 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: recipe python3-setuptools-76.0.0-r0: task do_unpack: Started
NOTE: recipe glibc-2.41+git-r0: task do_unpack: Succeeded
NOTE: Running task 949 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_unpack)
NOTE: Running task 950 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_patch)
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Started
NOTE: Running task 951 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_patch)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.45-r0: task do_patch: Succeeded
NOTE: Running task 953 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_unpack)
NOTE: recipe python3-setuptools-76.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 954 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_76.0.0.bb:do_patch)
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: recipe wayland-1.23.1-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 957 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_patch: Started
NOTE: recipe glibc-2.41+git-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Succeeded
NOTE: Running task 959 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_patch)
NOTE: Running task 960 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_fetch)
NOTE: recipe python3-setuptools-76.0.0-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 963 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_unpack)
NOTE: recipe util-macros-1_1.20.2-r0: task do_fetch: Started
NOTE: recipe python3-3.13.2-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_unpack: Succeeded
NOTE: Running task 964 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_patch)
NOTE: recipe wayland-1.23.1-r0: task do_unpack: Succeeded
NOTE: Running task 965 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_patch)
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Started
NOTE: Running task 966 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_patch)
NOTE: Running task 967 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Succeeded
NOTE: Running task 968 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_unpack)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Started
NOTE: Running task 969 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_patch)
NOTE: recipe util-linux-2.40.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-76.0.0-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_patch: Started
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: Running task 970 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_unpack)
NOTE: recipe wayland-1.23.1-r0: task do_patch: Started
NOTE: Running task 971 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_patch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_unpack: Started
NOTE: recipe python3-3.13.2-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_unpack: Succeeded
NOTE: Running task 972 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_patch)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_patch: Started
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Succeeded
NOTE: Running task 974 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: Running task 982 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_write_config)
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Started
NOTE: recipe libxml2-2.13.6-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_patch: Started
NOTE: Running task 985 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_write_config)
NOTE: Running task 986 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_write_config)
NOTE: Running task 991 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_patch: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_write_config: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_fetch: Started
NOTE: recipe wayland-1.23.1-r0: task do_write_config: Started
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_write_config: Succeeded
NOTE: Running task 992 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_patch)
NOTE: recipe base-passwd-3.6.6-r0: task do_fetch: Succeeded
NOTE: Running task 998 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.1.bb:do_fetch)
NOTE: Running task 999 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_unpack)
NOTE: recipe wayland-1.23.1-r0: task do_write_config: Succeeded
NOTE: Running task 1000 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_write_config)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_unpack: Succeeded
NOTE: Running task 1003 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_patch)
NOTE: Running task 1005 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_patch: Succeeded
NOTE: Running task 1011 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_unpack: Started
NOTE: recipe perl-5.40.1-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1012 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_patch)
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Started
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Succeeded
NOTE: recipe perl-5.40.1-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_patch: Succeeded
NOTE: Running task 1014 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_fetch)
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: Running task 1016 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_fetch)
NOTE: Running task 1017 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_fetch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Succeeded
NOTE: Running task 1020 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.1.bb:do_unpack)
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Started
NOTE: Running task 1023 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1024 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_fetch)
NOTE: Running task 1028 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_fetch)
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1029 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_patch)
NOTE: Running task 1030 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_fetch)
NOTE: Running task 1036 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: Running task 1037 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe util-linux-2.40.4-r0: task do_patch: Succeeded
NOTE: recipe perl-5.40.1-r0: task do_unpack: Started
NOTE: recipe shadow-4.17.3-r0: task do_fetch: Started
NOTE: Running task 1039 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.44-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1041 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.44-r0: task do_fetch: Succeeded
NOTE: Running task 1042 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_unpack)
NOTE: recipe shadow-4.17.3-r0: task do_fetch: Succeeded
NOTE: Running task 1045 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_patch: Started
NOTE: Running task 1046 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Started
NOTE: Running task 1062 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe shadow-4.17.3-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1063 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_patch)
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1064 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_patch)
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1065 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_patch)
NOTE: Running task 1066 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Succeeded
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: Running task 1067 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_patch)
NOTE: Running task 1068 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe glibc-2.41+git-r0: task do_patch: Succeeded
NOTE: Running task 1069 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_fetch)
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Started
NOTE: Running task 1071 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_fetch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Started
NOTE: Running task 1072 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_fetch)
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: Running task 1073 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Succeeded
NOTE: Running task 1074 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.1.bb:do_fetch)
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Started
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_fetch: Started
NOTE: Running task 1077 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.75-r0: task do_fetch: Started
NOTE: Running task 1078 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_unpack)
NOTE: recipe initscripts-1.0-r0: task do_fetch: Started
NOTE: recipe libcap-2.75-r0: task do_fetch: Succeeded
NOTE: Running task 1079 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_fetch: Succeeded
NOTE: recipe kmod-34.1-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: Running task 1089 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: recipe kmod-34.1-r0: task do_fetch: Succeeded
NOTE: Running task 1097 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: Running task 1098 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_unpack)
NOTE: Running task 1099 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1100 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.1.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.44-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Started
NOTE: Running task 1104 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Succeeded
NOTE: Running task 1105 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe python3-3.13.2-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.75-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_fetch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_unpack: Started
NOTE: Running task 1109 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_unpack)
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: Running task 1116 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_fetch)
NOTE: Running task 1117 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: recipe kmod-34.1-r0: task do_unpack: Started
NOTE: Running task 1118 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_patch)
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Started
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1119 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_patch)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_unpack: Succeeded
NOTE: Running task 1120 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_patch)
NOTE: recipe mpfr-4.2.1-r0: task do_fetch: Started
NOTE: recipe readline-8.2.13-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Started
NOTE: recipe libcap-2.75-r0: task do_unpack: Succeeded
NOTE: Running task 1121 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_patch)
NOTE: recipe mpfr-4.2.1-r0: task do_fetch: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_fetch: Succeeded
NOTE: Running task 1123 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.4.bb:do_fetch)
NOTE: Running task 1125 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Started
NOTE: recipe kmod-34.1-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_patch: Started
NOTE: Running task 1126 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.1.bb:do_patch)
NOTE: Running task 1127 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: recipe libcap-2.75-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Succeeded
NOTE: recipe perl-5.40.1-r0: task do_unpack: Succeeded
NOTE: Running task 1129 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1130 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.1.bb:do_patch)
NOTE: recipe xkeyboard-config-2.44-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1133 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_write_config)
NOTE: recipe libcap-2.75-r0: task do_patch: Succeeded
NOTE: Running task 1134 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1136 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe systemd-1_257.4-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_patch: Started
NOTE: Running task 1138 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_unpack)
NOTE: recipe kmod-34.1-r0: task do_patch: Started
NOTE: recipe gawk-5.3.1-r0: task do_fetch: Started
NOTE: recipe perl-5.40.1-r0: task do_patch: Started
NOTE: recipe gawk-5.3.1-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: Running task 1139 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.44-r0: task do_write_config: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe kmod-34.1-r0: task do_patch: Succeeded
NOTE: Running task 1147 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_unpack)
NOTE: recipe readline-8.2.13-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1150 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe initscripts-1.0-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_unpack: Succeeded
NOTE: Running task 1157 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_patch)
NOTE: Running task 1159 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_fetch)
NOTE: recipe mpfr-4.2.1-r0: task do_unpack: Started
NOTE: Running task 1176 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: recipe systemd-1_257.4-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.3.1-r0: task do_unpack: Started
NOTE: Running task 1177 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.4.bb:do_unpack)
NOTE: recipe readline-8.2.13-r0: task do_unpack: Succeeded
NOTE: Running task 1178 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Started
NOTE: recipe shadow-4.17.3-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 1179 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_patch)
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1180 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_patch)
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: Running task 1181 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: recipe systemd-1_257.4-r0: task do_unpack: Started
NOTE: recipe mpfr-4.2.1-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_patch: Succeeded
NOTE: recipe gawk-5.3.1-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_patch: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: recipe perl-5.40.1-r0: task do_patch: Succeeded
NOTE: Running task 1182 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1183 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: Running task 1185 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: Running task 1186 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_patch)
NOTE: Running task 1187 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_patch)
NOTE: Running task 1190 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_write_config)
NOTE: Running task 1191 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1192 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.1.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: Running task 1198 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_fetch)
NOTE: Running task 1199 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_unpack)
NOTE: Running task 1201 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe mpfr-4.2.1-r0: task do_patch: Started
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe perl-5.40.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_write_config: Started
NOTE: recipe gawk-5.3.1-r0: task do_patch: Started
NOTE: recipe kmod-34.1-r0: task do_write_config: Started
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1202 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_configure)
NOTE: recipe procps-4.0.5-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_write_config: Succeeded
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_fetch: Started
NOTE: Running task 1205 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.4.bb:do_warn_musl)
NOTE: recipe kmod-34.1-r0: task do_write_config: Succeeded
NOTE: Running task 1206 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.4.bb:do_write_config)
NOTE: recipe mpfr-4.2.1-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_configure: Started
NOTE: Running task 1212 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_fetch)
NOTE: recipe perl-5.40.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_configure: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.1.bb:do_deploy_source_date_epoch unihash changed to 8b780ba8ba00d0a0d36d348c790ef42b6a7874dc339cb6791d8577f14d0063b7
NOTE: recipe procps-4.0.5-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_257.4-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_257.4-r0: task do_warn_musl: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_fetch: Started
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_257.4-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: recipe gawk-5.3.1-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1214 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_compile)
NOTE: Running task 1215 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_unpack)
NOTE: Running task 1217 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: Running task 1218 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_fetch)
NOTE: Running task 1220 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb:do_fetch)
NOTE: Running task 1234 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: Running task 1239 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_collect_spdx_deps)
NOTE: recipe systemd-1_257.4-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1241 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.1.bb:do_populate_lic)
NOTE: recipe initscripts-1.0-r0: task do_compile: Started
NOTE: recipe make-4.4.1-r0: task do_fetch: Started
NOTE: recipe procps-4.0.5-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe make-4.4.1-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1243 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_unpack)
NOTE: recipe initscripts-1.0-r0: task do_compile: Succeeded
NOTE: recipe dpkg-native-1.22.11-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_fetch: Succeeded
NOTE: Running task 1244 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_install)
NOTE: Running task 1245 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_unpack)
NOTE: recipe perl-5.40.1-r0: task do_populate_lic: Started
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_257.4-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1247 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.4.bb:do_patch)
NOTE: Running task 1248 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_patch)
NOTE: recipe make-4.4.1-r0: task do_unpack: Started
NOTE: recipe psmisc-23.7-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Started
NOTE: recipe dpkg-native-1.22.11-r0: task do_fetch: Succeeded
NOTE: recipe make-4.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1249 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb:do_unpack)
NOTE: Running task 1250 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_patch)
NOTE: recipe systemd-1_257.4-r0: task do_patch: Started
NOTE: recipe perl-5.40.1-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.1.bb:do_populate_lic unihash changed to c3e0b536b000f54649a2e3fb4e0e3e1605fbadd7ec201f7052f3d10e4b71913a
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Succeeded
NOTE: recipe make-4.4.1-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_unpack: Succeeded
NOTE: recipe dpkg-native-1.22.11-r0: task do_unpack: Started
NOTE: Running task 1252 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_patch)
NOTE: Running task 1253 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_collect_spdx_deps)
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1254 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe linux-libc-headers-6.12-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe procps-4.0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1255 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_patch)
NOTE: recipe linux-libc-headers-6.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_patch: Succeeded
NOTE: Running noexec task 1257 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_configure)
NOTE: Running noexec task 1258 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_compile)
NOTE: Running task 1259 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_install)
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_patch: Started
NOTE: recipe systemd-1_257.4-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_unpack: Succeeded
NOTE: recipe make-4.4.1-r0: task do_patch: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_patch: Started
NOTE: Running task 1261 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_patch)
NOTE: recipe linux-libc-headers-6.12-r0: task do_install: Started
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_patch: Started
NOTE: recipe procps-4.0.5-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_patch: Succeeded
NOTE: recipe dpkg-native-1.22.11-r0: task do_unpack: Succeeded
NOTE: Running task 1266 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb:do_patch)
NOTE: recipe initscripts-1.0-r0: task do_install: Succeeded
NOTE: recipe dpkg-native-1.22.11-r0: task do_patch: Started
NOTE: recipe qemu-native-9.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1268 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.2.0.bb:do_patch)
NOTE: recipe qemu-native-9.2.0-r0: task do_patch: Started
NOTE: recipe dpkg-native-1.22.11-r0: task do_patch: Succeeded
NOTE: recipe perl-native-5.40.1-r0: task do_patch: Failed
NOTE: recipe qemu-native-9.2.0-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_install: Succeeded
NOTE: Tasks Summary: Attempted 1269 tasks of which 1011 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250401084354.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250401084354.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.1.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.40.1/temp/log.do_patch.3514366
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: perl-native-5.40.1-r0 do_patch: Applying patch 'perl-configpm-switch.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.40.1/perl-5.40.1'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.40.1/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch perl-configpm-switch.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.40.1/temp/log.do_patch.3514366
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.1.bb:do_patch) failed with exit code '1'

--===============2095174012162008731==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-perl-upgrade-5.40.0-5.40.1.patch"

RnJvbSA5ZWM4ODlmZGU2ODRmNjc5Y2FkNTgwNWU1YzYwZDA1NTljZDFhY2U0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAwODo0NDoxMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBl
cmw6IHVwZ3JhZGUgNS40MC4wIC0+IDUuNDAuMQoKLS0tCiAuLi5oaXMtbW9kdWxlLWJyZWFrcy10
aHJvdWdoLXRoZS1wZXJsLXdyYXBwZXItLnBhdGNoIHwgIDIgKy0KIC4uLlN5c2xvZy1NYWtlZmls
ZS5QTC1GaXgtX1BBVEhfTE9HLWZvci1kZXRlcm0ucGF0Y2ggfCAgMiArLQogLi4uL3BlcmwvZmls
ZXMvMDAwMi1Db25zdGFudC1GaXgtdXAtc2hlYmFuZy5wYXRjaCAgICB8ICAyICstCiBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9kZXRlcm1pbmlzbS5wYXRjaCAgIHwgIDIgKy0KIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL2VuY29kZWZpeC5wYXRjaCAgICAgfCAgMiAr
LQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZXJybm9fdmVyLmRpZmYgICAgICB8
ICAyICstCiAuLi4vcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL25hdGl2ZS1wZXJsaW5jLnBh
dGNoIHwgIDIgKy0KIC4uLi9wZXJsL2ZpbGVzL3BlcmwtY29uZmlncG0tc3dpdGNoLnBhdGNoICAg
ICAgICAgICAgfCAgMiArLQogLi4uL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9wZXJsLWR5
bmxvYWRlci5wYXRjaCB8ICAyICstCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9wZXJsLXB0
ZXN0LmluYyAgICAgICAgICAgIHwgMTIgKysrKysrKysrKystCiAuLi4vcGVybC97cGVybF81LjQw
LjAuYmIgPT4gcGVybF81LjQwLjEuYmJ9ICAgICAgICAgIHwgIDIgKy0KIDExIGZpbGVzIGNoYW5n
ZWQsIDIxIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9wZXJsL3twZXJsXzUuNDAuMC5iYiA9PiBwZXJsXzUuNDAuMS5iYn0gKDk5JSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy8wMDAxLVNvbWVo
b3ctdGhpcy1tb2R1bGUtYnJlYWtzLXRocm91Z2gtdGhlLXBlcmwtd3JhcHBlci0ucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy8wMDAxLVNvbWVob3ctdGhpcy1tb2R1bGUt
YnJlYWtzLXRocm91Z2gtdGhlLXBlcmwtd3JhcHBlci0ucGF0Y2gKaW5kZXggMjA3NmM2MWVlMC4u
MzMyMzc0NzFlNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMv
MDAwMS1Tb21laG93LXRoaXMtbW9kdWxlLWJyZWFrcy10aHJvdWdoLXRoZS1wZXJsLXdyYXBwZXIt
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzLzAwMDEtU29tZWhv
dy10aGlzLW1vZHVsZS1icmVha3MtdGhyb3VnaC10aGUtcGVybC13cmFwcGVyLS5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gNDdjZDIyY2QyMTNkMmM1ZjI4ZTY3NGIxMmMyNjRkYzczMTY4MjU2
MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNWEyZDFkZDM4Y2JjNzMwOTgwMjE3ODU1
YTI5N2U5YWVmMjJhZGYwMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRl
ciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogVHVlLCA1IEp1biAyMDE4
IDE0OjU4OjQyICswMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIFNvbWVob3cgdGhpcyBtb2R1bGUgYnJl
YWtzIHRocm91Z2ggdGhlIHBlcmwgd3JhcHBlciBhbmQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9wZXJsL2ZpbGVzLzAwMDEtY3Bhbi1TeXMtU3lzbG9nLU1ha2VmaWxlLlBMLUZp
eC1fUEFUSF9MT0ctZm9yLWRldGVybS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJs
L2ZpbGVzLzAwMDEtY3Bhbi1TeXMtU3lzbG9nLU1ha2VmaWxlLlBMLUZpeC1fUEFUSF9MT0ctZm9y
LWRldGVybS5wYXRjaAppbmRleCA3ZTVkMDhkOGRiLi5kYjYyOTMzZjc4IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy8wMDAxLWNwYW4tU3lzLVN5c2xvZy1NYWtl
ZmlsZS5QTC1GaXgtX1BBVEhfTE9HLWZvci1kZXRlcm0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3BlcmwvZmlsZXMvMDAwMS1jcGFuLVN5cy1TeXNsb2ctTWFrZWZpbGUuUEwtRml4
LV9QQVRIX0xPRy1mb3ItZGV0ZXJtLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzMjI5NzIz
ODRlMDc5NWJlMzM5MjUyZjdjZjlhMzE4ZGM3NTliNTFlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSA0ZDZmNjQ5NWI4ZTY3MjY1MmVkMjE2ZTc3Y2I0YjVhYTA1N2U0YTY4IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9iZXJ0IFlhbmcgPGxpZXpoaS55YW5nQHdpbmRyaXZl
ci5jb20+CiBEYXRlOiBGcmksIDE4IEZlYiAyMDIyIDA5OjQ0OjI2ICswMDAwCiBTdWJqZWN0OiBb
UEFUQ0hdIGNwYW4vU3lzLVN5c2xvZy9NYWtlZmlsZS5QTDogRml4IF9QQVRIX0xPRyBmb3IgZGV0
ZXJtaW5pc3RpYwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMv
MDAwMi1Db25zdGFudC1GaXgtdXAtc2hlYmFuZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9wZXJsL2ZpbGVzLzAwMDItQ29uc3RhbnQtRml4LXVwLXNoZWJhbmcucGF0Y2gKaW5kZXggODA5
ODZlNjZkYS4uMTE0OTNmZTNhYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Bl
cmwvZmlsZXMvMDAwMi1Db25zdGFudC1GaXgtdXAtc2hlYmFuZy5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy8wMDAyLUNvbnN0YW50LUZpeC11cC1zaGViYW5nLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhMDIzNTViZGM4Y2RlMTExNWRhZjEwMTY3NWNkZmI3
MDdkMzM3YmYxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiZWZmZDU5ZjE5YWZlZTJh
MWM4NzkwYjVhNDcxYjI5MzA0OTI2N2Y0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
Sm9zaHVhIFdhdHQgPEpQRVdoYWNrZXJAZ21haWwuY29tPgogRGF0ZTogTW9uLCAxNyBKdW4gMjAx
OSAxMDo0NzoyMyAtMDUwMAogU3ViamVjdDogW1BBVENIXSBDb25zdGFudDogRml4IHVwIHNoZWJh
bmcKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL2RldGVybWlu
aXNtLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZGV0ZXJtaW5pc20u
cGF0Y2gKaW5kZXggYmRiOWE5MjhiYi4uMjQ3NTA0NzNmYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZGV0ZXJtaW5pc20ucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZGV0ZXJtaW5pc20ucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDVjNGZkNTdkYWYxMjUzNTcyNjJhYTc5NjA1N2Q3YmU4ZTc4ZDM3OGUgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDU3Zjc5MDU1ZmMyZmYwY2RkZjE3MGZhZTY3YmYzNzFiMjUx
N2QxZWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IFdlZCwgNSBGZWIgMjAyMCAy
Mzo1NDowMiArMDAwMAogU3ViamVjdDogW1BBVENIXSBGaXhlcyB0byBtYWtlIHRoZSBwZXJsIGJ1
aWxkIHJlcHJvZHVjaWJsZToKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJs
L2ZpbGVzL2VuY29kZWZpeC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVz
L2VuY29kZWZpeC5wYXRjaAppbmRleCA2NjU2OTlkMTJkLi5jZmVlZDM5ZGVlIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9lbmNvZGVmaXgucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZW5jb2RlZml4LnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSBhNGUyMmM3ZjJhNTE5ZjI0YmM4YWE4OWM2Njc3MDE3YzBmZTEzNjc5IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwYzIwNDljZGEwZmE5M2FiM2ZjYmIyMzcwZWRh
NmExYzFiMTRmMzNkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJk
aWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBUdWUsIDE4IEZl
YiAyMDIwIDE3OjI3OjI2ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHBlcmw6IEZpeCBlbmNvZGUg
bW9kdWxlIHJlcHJvZHVjaWJpbGl0eSBpc3N1ZXMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9wZXJsL2ZpbGVzL2Vycm5vX3Zlci5kaWZmIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3BlcmwvZmlsZXMvZXJybm9fdmVyLmRpZmYKaW5kZXggNDc3NjQyZjQ1Ny4uOGY0MGNhOWEzZSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZXJybm9fdmVyLmRp
ZmYKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZXJybm9fdmVyLmRpZmYK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIDljNDA0ZDRiMWMzNjA3ZTgyN2ZiNTZiNWFlNGY4ZmJiZGI1
MmNkMGIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGY2MWIzYzQ4MTdmYjA3ZTFhYTM1
MTJlMDExMjk2NGE5ZDE1MmRlMzUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBCcmVu
ZGFuIE8nRGVhIDxib2RAZGViaWFuLm9yZz4KIERhdGU6IEZyaSwgMTYgRGVjIDIwMDUgMDE6MzI6
MTQgKzExMDAKIFN1YmplY3Q6IFtQQVRDSF0gUmVtb3ZlIEVycm5vIHZlcnNpb24gY2hlY2sgZHVl
IHRvIHVwZ3JhZGUgcHJvYmxlbXMgd2l0aApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BlcmwvZmlsZXMvbmF0aXZlLXBlcmxpbmMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcGVybC9maWxlcy9uYXRpdmUtcGVybGluYy5wYXRjaAppbmRleCA3ZTNlNWY2NjUyLi4zYjFj
NWJmMGNlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9uYXRp
dmUtcGVybGluYy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9u
YXRpdmUtcGVybGluYy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOWZlYzYyYjE5YTQ5ZDE0
NTFmZDExMjBjNWRjMzhiYWY1OWY3Mzg1NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
MWIxNDYyM2FmMWU5MTE5OGVkNjJjMjU0ZDA0NWRjY2QzOGIzOWVmMCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29t
PgogRGF0ZTogV2VkLCAzMCBNYXkgMjAwNyAwOTozMzozMiArMDAwMAogU3ViamVjdDogW1BBVENI
XSBwZXJsOiBzeW5jIHdpdGggT0UKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
ZXJsL2ZpbGVzL3BlcmwtY29uZmlncG0tc3dpdGNoLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BlcmwvZmlsZXMvcGVybC1jb25maWdwbS1zd2l0Y2gucGF0Y2gKaW5kZXggMzcyMTI3Nzkz
My4uYWUzMjlkMzc1MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmls
ZXMvcGVybC1jb25maWdwbS1zd2l0Y2gucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3BlcmwvZmlsZXMvcGVybC1jb25maWdwbS1zd2l0Y2gucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDdhNDg1MzhhN2U4NjE0YTMzNDIxNTFiNjQ2ZDIxMDVjMGNiMGNkZDkgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDRhNThiNmNjMjEzYzAyNjVkMjM0M2EyNzY5ZDM1ZTA3MTM1ZDg5
MmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxl
eC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFN1biwgMjcgTWF5IDIwMDcgMjE6MDQ6MTEgKzAw
MDAKIFN1YmplY3Q6IFtQQVRDSF0gcGVybDogNS44LjcgLT4gNS44LjggKGZyb20gT0UpCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9wZXJsLWR5bmxvYWRlci5w
YXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL3BlcmwtZHlubG9hZGVyLnBh
dGNoCmluZGV4IDU0NzI2MDJkM2EuLjI0Njg1YjQyMzIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9wZXJsL2ZpbGVzL3BlcmwtZHlubG9hZGVyLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL3BlcmwtZHlubG9hZGVyLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSAyNWEyNmM1MmMzMjBlNjk5YjM3YTdhZDFmNGYwNDViYzhhYTRjYjAwIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2NDdlMDA0NTFlNGY0ZTJhY2ViYzE5OWE3YzQyZjJk
ZjE0ZDZjOTdiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUg
PHJpY2hhcmRAb3BlbmVkaGFuZC5jb20+CiBEYXRlOiBTdW4sIDI3IE1heSAyMDA3IDIxOjA0OjEx
ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHBlcmw6IDUuOC43IC0+IDUuOC44IChmcm9tIE9FKQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvcGVybC1wdGVzdC5pbmMgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9wZXJsLXB0ZXN0LmluYwppbmRleCA0YjQ3NTYxMThj
Li4wODMwZmY1YjJhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9wZXJs
LXB0ZXN0LmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9wZXJsLXB0ZXN0Lmlu
YwpAQCAtMSw2ICsxLDE2IEBACiBpbmhlcml0IHB0ZXN0CiAKLVNSQ19VUkkgKz0gImZpbGU6Ly9y
dW4tcHRlc3QgXAorU1JDX1VSSSA9ICJodHRwczovL3d3dy5jcGFuLm9yZy9zcmMvNS4wL3Blcmwt
JHtQVn0udGFyLmd6O25hbWU9cGVybCBcCisgICAgICAgICAgIGZpbGU6Ly9wZXJsLXJkZXBlbmRz
LnR4dCBcCisgICAgICAgICAgIGZpbGU6Ly8wMDAxLVNvbWVob3ctdGhpcy1tb2R1bGUtYnJlYWtz
LXRocm91Z2gtdGhlLXBlcmwtd3JhcHBlci0ucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vZXJy
bm9fdmVyLmRpZmYgXAorICAgICAgICAgICBmaWxlOi8vbmF0aXZlLXBlcmxpbmMucGF0Y2ggXAor
ICAgICAgICAgICBmaWxlOi8vcGVybC1keW5sb2FkZXIucGF0Y2ggXAorICAgICAgICAgICBmaWxl
Oi8vMDAwMi1Db25zdGFudC1GaXgtdXAtc2hlYmFuZy5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6
Ly9kZXRlcm1pbmlzbS5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly8wMDAxLWNwYW4tU3lzLVN5
c2xvZy1NYWtlZmlsZS5QTC1GaXgtX1BBVEhfTE9HLWZvci1kZXRlcm0ucGF0Y2ggXAorICAgICAg
ICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKKyAgICAgICAgICAgZmlsZTovL3BlcmwtY29uZmlncG0t
c3dpdGNoLnBhdGNoIFwKICAgICAgICAgICAgIgogCiBERUJVR19QUkVGSVhfTUFQX1JFR0VYID0g
IiR7QCdcXHwnLmpvaW4oZC5nZXRWYXIoJ0RFQlVHX1BSRUZJWF9NQVAnKS5zcGxpdCgpKX0iCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9wZXJsXzUuNDAuMC5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL3BlcmxfNS40MC4xLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL3BlcmxfNS40MC4wLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9wZXJsXzUuNDAuMS5iYgppbmRl
eCAwZDQzMzhmMjlmLi40NDhmZDUyZWQ2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcGVybC9wZXJsXzUuNDAuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9w
ZXJsXzUuNDAuMS5iYgpAQCAtMjUsNyArMjUsNyBAQCBTUkNfVVJJOmFwcGVuZDpjbGFzcy10YXJn
ZXQgPSAiIFwKICAgICAgICAgICAgZmlsZTovL2VuY29kZWZpeC5wYXRjaCBcCiAiCiAKLVNSQ19V
UklbcGVybC5zaGEyNTZzdW1dID0gImM3NDAzNDhmMzU3Mzk2MzI3YTk3OTVkM2U4MzIzYmFmZDBm
ZThhNWM3ODM1ZmMxY2JhYmEwY2M4ZGZlNzE2MWYiCitTUkNfVVJJW3Blcmwuc2hhMjU2c3VtXSA9
ICIwMmY4YzQ1YmIzNzllZDBjM2RlNzUxNGZhZDQ4YzcxNGZkNDZiZThmMGI1MzZiZmQ1MzIwMDUw
MTY1YTFlZTI2IgogCiBCID0gIiR7V09SS0RJUn0vcGVybC0ke1BWfS1idWlsZCIKIAotLSAKMi40
Ny4xCgo=

--===============2095174012162008731==--

