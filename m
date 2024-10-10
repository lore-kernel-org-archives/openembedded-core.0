Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00389D0D7AE
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:42 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.53262.1728588944704958677
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=c0I6H49f;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Gxyd4MFo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019277eedb64-cb6890da-bcfe-448e-a6b4-4b24c8630459-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588996;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KB3KtImm2SAPCVPuo6yJ4sBoMJ8FHtvOtCdyFvrMyWI=;
	b=c0I6H49fqxoWMj3WOqaENGzcSP8JZZqQvwQIDQpEwlB2ISPyDC/fbogbJh8LLDot
	Ny5i8ZXMTF92oAYxkdGoBTIHtp5m1bGhLZzQHblnqmttTYOfigOYj71O3gVBg9Ee/VX
	A9KH/J89RV5AD03Y+pQBUU9btmkMYNx1VjY+q1Vw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588996;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KB3KtImm2SAPCVPuo6yJ4sBoMJ8FHtvOtCdyFvrMyWI=;
	b=Gxyd4MFoefofBiZpzPnhMaVm10fMuwHBjVgjtnZyTmfFZgYjT17AIYvRcRoCfPIX
	X5kJ83BVKHjBipVMvJc041oSkVnZZGO9cMKc3R7FmkH4CCSCGeC5maSZzaPXBHm4gFn
	u9Z0DzwVxJDcmmjWRTeXZwbkwO9rT5YvZlrYDJqQ=
Content-Type: multipart/mixed; boundary="===============9072073258114988110=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ltp: upgrading to 20240930 SUCCEEDED
Message-ID: <0101019277eedb64-cb6890da-bcfe-448e-a6b4-4b24c8630459-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205609

--===============9072073258114988110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ltp* to *20240930* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ltp-upgrade-20240524-20240930.patch
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
From 288d7af89be192744319bdf8061c516fcb80ca80 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 03:32:32 +0000
Subject: [PATCH] ltp: upgrade 20240524 -> 20240930

---
 .../ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch  | 2 +-
 .../ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch         | 2 +-
 meta/recipes-extended/ltp/{ltp_20240524.bb => ltp_20240930.bb}  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/ltp/{ltp_20240524.bb => ltp_20240930.bb} (99%)

diff --git a/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch b/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch
index ade6a52b63..fd71cd85f0 100644
--- a/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch
@@ -1,4 +1,4 @@
-From 2d384f268791ecd5ff0f26c8137dd4de0a1c4566 Mon Sep 17 00:00:00 2001
+From 474ff3c4f1175cc02548a3110fab9579ca42da1f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 10 Jun 2024 22:52:56 -0700
 Subject: [PATCH] Add __clear_cache declaration for clang
diff --git a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
index 5b6c780bec..97f261e5e9 100644
--- a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
@@ -1,4 +1,4 @@
-From 768159aa53257d247645a12518778f50b8fdf578 Mon Sep 17 00:00:00 2001
+From d6e2d9e73dad920b5e49aaa94f86bab2779c3368 Mon Sep 17 00:00:00 2001
 From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
 Date: Wed, 29 Jul 2020 08:47:09 -0400
 Subject: [PATCH] Remove OOM tests from runtest/mm
diff --git a/meta/recipes-extended/ltp/ltp_20240524.bb b/meta/recipes-extended/ltp/ltp_20240930.bb
similarity index 99%
rename from meta/recipes-extended/ltp/ltp_20240524.bb
rename to meta/recipes-extended/ltp/ltp_20240930.bb
index 6b46723478..ac8bea4244 100644
--- a/meta/recipes-extended/ltp/ltp_20240524.bb
+++ b/meta/recipes-extended/ltp/ltp_20240930.bb
@@ -24,7 +24,7 @@ TUNE_CCARGS:remove:x86-64 = "-mfpmath=sse"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "8f21ebba42216dbb7e8d44c23b4a977d6823f7a1"
+SRCREV = "60f81419c43f94ec182827ef0b9eb5baeb303419"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
-- 
2.44.1


--===============9072073258114988110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 917 .bb files complete (0 cached, 917 parsed). 1872 targets, 51 skipped, 0 masked, 0 errors.
Removing 108 recipes from the core2-64 sysroot...done.
Removing 121 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3565fc31c580ef1367fb252d5734984e6479c89d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 946 Local 878 Mirrors 0 Missed 68 Current 250 (92% match, 94% complete)
Removing 1 stale sstate objects for arch allarch...done.
Removing 3 stale sstate objects for arch x86_64...done.
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 258 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 259 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 260 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 265 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 270 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 271 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 272 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 273 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 274 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 275 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 281 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 282 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 283 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 284 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 285 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_package_write_ipk_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.8.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-6.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe file-5.45-r0: task do_package_write_deb_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe file-5.45-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe file-5.45-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 286 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 289 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_package_write_deb_setscene)
NOTE: recipe expect-5.45.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 290 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_package_write_ipk_setscene)
NOTE: recipe expect-5.45.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 291 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 292 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 293 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_ipk_setscene)
NOTE: recipe socat-1.8.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 294 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 295 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cpio/cpio_2.15.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 296 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cpio/cpio_2.15.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 300 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cpio/cpio_2.15.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-6.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 307 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_deb_setscene)
NOTE: recipe bash-5.2.32-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-5.2.32-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-5.2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cpio-2.15-r0: task do_package_write_deb_setscene: Started
NOTE: recipe cpio-2.15-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cpio-2.15-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 308 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 309 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 310 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_package_write_deb_setscene)
NOTE: recipe cpio-2.15-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 311 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_package_write_ipk_setscene)
NOTE: recipe cpio-2.15-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 312 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.2.32-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe cpio-2.15-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 313 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.13.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 314 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.13.bb:do_package_write_ipk_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 315 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.13.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.2.32-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe bash-5.2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 319 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 320 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_ipk_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.3.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe gawk-5.3.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe gawk-5.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 321 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.12.6-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_package_write_deb_setscene: Started
NOTE: recipe gzip-1.13-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe gzip-1.13-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 328 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/expect/expect_5.45.4.bb:do_create_spdx_setscene)
NOTE: recipe gzip-1.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 330 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.12.6-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 332 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_create_spdx_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 333 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_create_spdx_setscene)
NOTE: Running setscene task 334 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_create_spdx_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.3.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 335 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cpio/cpio_2.15.bb:do_create_spdx_setscene)
NOTE: recipe gawk-5.3.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 337 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gawk-5.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 338 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_packagedata_setscene)
NOTE: recipe gzip-1.13-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe gzip-1.13-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 339 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_create_spdx_setscene)
NOTE: recipe gzip-1.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 341 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 342 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 343 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_create_spdx_setscene)
NOTE: recipe expect-5.45.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 344 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_packagedata_setscene)
NOTE: recipe perl-5.40.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 345 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.191-r0: task do_create_spdx_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 348 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_create_spdx_setscene)
NOTE: recipe bc-1.07.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.32-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cpio-2.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-2.43.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gawk-5.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe gzip-1.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe grep-3.11-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 352 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_create_spdx_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 356 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_create_spdx_setscene)
NOTE: Running setscene task 357 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx_setscene)
NOTE: recipe cpio-2.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.2.32-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 366 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 367 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/expect/expect_5.45.4.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gawk-5.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gzip-1.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 370 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_15.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 371 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 373 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 374 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cpio/cpio_2.15.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 376 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 379 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.13.bb:do_packagedata_setscene)
NOTE: recipe perl-5.40.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 384 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe iproute2-6.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdb-15.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cpio-2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 390 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-2.43.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 400 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_create_spdx_setscene)
NOTE: recipe gzip-1.13-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe diffutils-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 401 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_populate_sysroot_setscene)
NOTE: recipe iputils-20240905-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 405 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_packagedata_setscene)
NOTE: Running setscene task 406 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_populate_sysroot_setscene)
NOTE: recipe gdb-15.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 407 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 408 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe grep-3.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 412 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_write_ipk_setscene)
NOTE: recipe readline-8.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 413 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_write_rpm_setscene)
NOTE: recipe expect-5.45.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 417 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcltk/tcl_8.6.15.bb:do_packagedata_setscene)
NOTE: recipe net-tools-2.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe logrotate-3.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 422 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_create_spdx_setscene)
NOTE: recipe iputils-20240905-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe iproute2-6.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 423 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_recipe_qa_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 424 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.10.0.bb:do_package_setscene)
NOTE: recipe net-tools-2.10-r0: task do_package_write_deb_setscene: Started
NOTE: recipe gzip-1.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdb-15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe logrotate-3.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcl-8.6.15-r0: task do_packagedata_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cpio-2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdb-15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe iputils-20240905-r0: task do_recipe_qa_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iputils-20240905-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tcl-8.6.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 439 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 440 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 441 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 444 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 445 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 448 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 449 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 456 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 457 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 459 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tar/tar_1.35.bb:do_create_spdx_setscene)
NOTE: Running setscene task 460 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tar/tar_1.35.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 461 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tar/tar_1.35.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 462 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tar/tar_1.35.bb:do_package_write_rpm_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe logrotate-3.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe tar-1.35-r0: task do_create_spdx_setscene: Started
NOTE: recipe tar-1.35-r0: task do_package_write_deb_setscene: Started
NOTE: recipe tar-1.35-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe tar-1.35-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 463 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_create_spdx_setscene)
NOTE: recipe logrotate-3.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 465 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 466 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_recipe_qa_setscene)
NOTE: recipe procps-4.0.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 467 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 468 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 469 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 470 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tar-1.35-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tar-1.35-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe tar-1.35-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tar-1.35-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 472 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 473 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 474 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 475 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 484 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tar/tar_1.35.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_ipk_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Started
NOTE: recipe quota-4.09-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe tar-1.35-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_packagedata_setscene: Started
NOTE: recipe quota-4.09-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 487 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 488 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 492 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot_setscene)
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 493 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_create_spdx_setscene)
NOTE: Running setscene task 500 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package_write_deb_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 501 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package_write_ipk_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 503 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 507 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_create_spdx_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 520 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 524 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 526 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r0: task do_create_spdx_setscene: Started
NOTE: recipe which-2.21-r0: task do_package_write_deb_setscene: Started
NOTE: recipe which-2.21-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe which-2.21-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 527 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iproute2-6.10.0-r0: task do_package_setscene: Started
NOTE: Running setscene task 530 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe which-2.21-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe which-2.21-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 531 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 532 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe which-2.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 534 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 536 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 537 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_package_setscene)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 538 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe tar-1.35-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 540 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 544 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-6.10.11+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 545 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe which-2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 548 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_populate_sysroot_setscene)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_package_setscene: Started
NOTE: Running setscene task 552 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.10.bb:do_deploy_setscene)
NOTE: recipe python3-3.12.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 553 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 557 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_create_spdx_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 558 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.10.bb:do_package_write_deb_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 562 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.10.bb:do_package_write_ipk_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 564 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 566 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe linux-yocto-6.10.11+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 570 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 572 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_create_spdx_setscene)
NOTE: recipe expat-2.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 573 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 575 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe linux-yocto-6.10.11+git-r0: task do_deploy_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 577 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-yocto-6.10.11+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 581 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 583 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_create_spdx_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-6.10.11+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 584 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_write_deb_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-6.10.11+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 586 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 588 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 589 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 590 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 593 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 594 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 597 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 598 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 599 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 600 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 602 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 603 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 604 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 605 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 607 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 608 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 609 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 612 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 614 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 618 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 620 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 622 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe iproute2-6.10.0-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 623 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.10.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 624 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-72.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 625 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 627 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 628 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 629 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe iproute2-6.10.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 631 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 633 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iproute2-6.10.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 634 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 637 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 641 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.6-r0: task do_packagedata_setscene: Started
NOTE: recipe iproute2-6.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 643 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 644 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.191-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 645 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 647 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-72.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 648 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iproute2-6.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 650 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 652 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 653 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-72.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 655 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.6.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-72.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe iptables-1.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 656 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.6.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.191-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 659 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 662 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 665 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 666 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 668 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 670 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 672 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 674 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 675 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 676 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 677 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 678 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 680 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 681 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-6.10.11+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 683 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 684 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 686 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_write_ipk_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-6.10.11+git-r0: task do_deploy_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 688 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 690 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 692 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_create_spdx_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libarchive-3.7.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-6.10.11+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 694 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 695 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_package_write_ipk_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 697 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 699 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_package_write_rpm_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 704 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 706 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 708 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_create_spdx_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 709 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 711 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 712 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.12.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 713 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.10.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 716 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 717 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-6.10.11+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 718 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe curl-8.10.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe curl-8.10.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 719 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 720 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 721 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 723 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.10.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 724 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 725 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 729 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 731 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 732 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_create_spdx_setscene)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 734 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 736 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 738 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 741 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20240203-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-yocto-6.10.11+git-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 743 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_create_spdx_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 745 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 747 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe ca-certificates-20240203-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 748 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 752 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 756 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 757 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.70-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 759 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.10.0.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 760 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_package_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/gawk/5.3.0/temp/log.do_packagedata_setscene.210173
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 761 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_package_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 767 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 771 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 774 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.14.1.bb:do_create_spdx_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 776 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 777 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_create_spdx_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnl-1_3.10.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 779 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.3.0-r0: task do_package_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_package_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe liburcu-0.14.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnl-1_3.10.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 781 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 782 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_packagedata_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 783 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 785 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 787 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: recipe liburcu-0.14.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 791 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.10.0.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 792 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_populate_sysroot_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 793 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 794 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 795 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 796 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnl-1_3.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 798 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 800 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: recipe curl-8.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 801 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 802 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 804 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 805 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libnl-1_3.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 806 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 807 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnutls-3.8.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 809 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 810 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 811 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 812 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 813 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 816 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 819 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 820 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 821 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.10.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 824 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 826 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 828 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 829 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.10.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 832 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 834 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 836 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 837 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 839 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 840 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 842 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 843 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.10.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 845 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 846 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 849 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 852 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 853 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.50-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.50-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 855 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe libnl-1_3.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 856 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 858 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 859 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 860 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.14.1.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.50-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 861 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.50-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 863 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 866 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 867 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 869 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 871 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libnl-1_3.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 872 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe liburcu-0.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe liburcu-0.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.50-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 873 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_package_setscene)
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 875 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 877 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe liburcu-0.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 880 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.50-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 881 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 883 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 884 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 887 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx_setscene)
NOTE: recipe liburcu-0.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 888 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: recipe libnl-1_3.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 889 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_create_spdx_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_package_setscene: Started
NOTE: Running setscene task 891 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.14.1.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 893 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnl-1_3.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 895 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 897 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_packagedata_setscene)
NOTE: recipe liburcu-0.14.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 898 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 899 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_create_spdx_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 901 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe liburcu-0.14.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 928 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_recipe_qa_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1019 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_create_spdx_setscene)
NOTE: recipe nettle-3.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1020 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1023 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1025 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 1026 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1027 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1028 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1029 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1031 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1032 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1035 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1036 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe gawk-5.3.0-r0: task do_package_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1038 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 1039 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1041 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1044 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1046 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1049 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe gawk-5.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1050 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gawk-5.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1053 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_recipe_qa_setscene)
NOTE: recipe linux-yocto-6.10.11+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1081 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_fetch)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1057 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1169 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_fetch)
NOTE: Running task 1186 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20240930.bb:do_recipe_qa)
NOTE: Running task 1195 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.10.0.bb:do_fetch)
NOTE: Running task 1205 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_recipe_qa)
NOTE: Running task 1207 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_fetch)
NOTE: Running task 1208 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_fetch)
NOTE: Running task 1210 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_15.2.bb:do_fetch)
NOTE: Running task 1264 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_write_config)
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe logrotate-3.22.0-r0: task do_fetch: Started
NOTE: Running setscene task 1059 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe logrotate-3.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 1348 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_unpack)
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_fetch: Started
NOTE: recipe ltp-20240930-r0: task do_recipe_qa: Started
NOTE: recipe quota-4.09-r0: task do_fetch: Started
NOTE: recipe iproute2-6.10.0-r0: task do_fetch: Started
NOTE: recipe cronie-1.7.2-r0: task do_recipe_qa: Started
NOTE: recipe gdb-15.2-r0: task do_fetch: Started
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_fetch: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-yocto-6.10.11+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iputils-20240905-r0: task do_fetch: Started
NOTE: recipe quota-4.09-r0: task do_fetch: Succeeded
NOTE: Running task 1369 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_unpack)
NOTE: recipe iproute2-6.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 1375 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.10.0.bb:do_unpack)
NOTE: Running task 1376 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_unpack)
NOTE: recipe gdb-15.2-r0: task do_fetch: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1377 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_15.2.bb:do_unpack)
NOTE: recipe iputils-20240905-r0: task do_write_config: Started
NOTE: recipe logrotate-3.22.0-r0: task do_unpack: Started
NOTE: recipe linux-yocto-6.10.11+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_unpack: Started
NOTE: recipe iputils-20240905-r0: task do_write_config: Succeeded
NOTE: recipe quota-4.09-r0: task do_unpack: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe iproute2-6.10.0-r0: task do_unpack: Started
NOTE: Running setscene task 1063 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe gdb-15.2-r0: task do_unpack: Started
NOTE: recipe quota-4.09-r0: task do_unpack: Succeeded
NOTE: Running task 1383 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_patch)
NOTE: recipe iputils-20240905-r0: task do_fetch: Succeeded
NOTE: Running task 1384 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_unpack)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe logrotate-3.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 1385 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_patch)
NOTE: recipe ltp-20240930-r0: task do_recipe_qa: Succeeded
NOTE: recipe quota-4.09-r0: task do_patch: Started
NOTE: Running task 1386 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20240930.bb:do_fetch)
NOTE: recipe iputils-20240905-r0: task do_unpack: Started
NOTE: recipe iproute2-6.10.0-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe logrotate-3.22.0-r0: task do_patch: Started
NOTE: Running task 1425 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.10.0.bb:do_patch)
NOTE: recipe ltp-20240930-r0: task do_fetch: Started
NOTE: recipe logrotate-3.22.0-r0: task do_patch: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1429 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_fetch)
NOTE: recipe iproute2-6.10.0-r0: task do_patch: Started
NOTE: recipe quota-4.09-r0: task do_patch: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_fetch: Started
NOTE: recipe cronie-1.7.2-r0: task do_fetch: Succeeded
NOTE: recipe ltp-20240930-r0: task do_fetch: Succeeded
NOTE: Running task 1431 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_unpack)
NOTE: recipe iproute2-6.10.0-r0: task do_patch: Succeeded
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_unpack: Succeeded
NOTE: Running task 1432 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_patch)
NOTE: Running task 1433 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20240930.bb:do_unpack)
NOTE: recipe perl-5.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1075 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 1076 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe ltp-20240930-r0: task do_unpack: Started
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_patch: Started
NOTE: recipe cronie-1.7.2-r0: task do_unpack: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iputils-20240905-r0: task do_unpack: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 1704 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_patch)
NOTE: Running task 1705 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_patch)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iputils-20240905-r0: task do_patch: Started
NOTE: recipe cronie-1.7.2-r0: task do_patch: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1082 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iputils-20240905-r0: task do_patch: Succeeded
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_patch: Succeeded
NOTE: Running task 1713 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe cronie-1.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1083 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1084 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1085 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1086 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1087 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1088 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata_setscene)
NOTE: Running setscene task 1089 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 1090 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_recipe_qa_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_deploy_source_date_epoch unihash changed to f4c6d348c62852ecf7cfaa24335b91020fc3fe0e90fb38084ced46ef9406392a
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1095 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1096 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1097 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1099 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1101 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ltp-20240930-r0: task do_unpack: Succeeded
NOTE: Running task 1719 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20240930.bb:do_patch)
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ltp-20240930-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1104 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdb-15.2-r0: task do_unpack: Succeeded
NOTE: Running task 1735 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_15.2.bb:do_patch)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdb-15.2-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ltp-20240930-r0: task do_patch: Succeeded
NOTE: Running task 1741 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20240930.bb:do_deploy_source_date_epoch)
NOTE: Running task 1742 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20240930.bb:do_populate_lic)
NOTE: recipe ltp-20240930-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ltp-20240930-r0: task do_populate_lic: Started
NOTE: recipe ltp-20240930-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20240930.bb:do_populate_lic unihash changed to 46e8faea29c67ae7448b0b59695a14b323de37e3f4fdc73085f974df1182f6a3
NOTE: recipe ltp-20240930-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdb-15.2-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1105 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1106 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1107 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1108 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1109 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1110 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1111 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1112 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1113 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1114 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1115 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1116 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1117 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1118 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1124 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1126 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1128 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1130 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1133 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1134 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1135 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1138 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1140 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1141 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1143 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1145 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1146 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1147 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1149 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1154 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1156 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1157 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1159 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1161 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1163 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1165 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1166 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1168 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1169 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1170 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1171 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1173 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1177 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1178 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1180 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1185 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1187 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1188 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1192 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1193 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1195 of 1196 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2436 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2557 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2663 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2675 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20240930.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2688 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_packagedata)
NOTE: recipe logrotate-3.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2690 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2691 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2693 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-6.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ltp-20240930-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2859 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20240930.bb:do_collect_spdx_deps)
NOTE: recipe gawk-5.3.0-r0: task do_packagedata: Started
NOTE: Running task 2894 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_collect_spdx_deps)
NOTE: Running task 2907 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_collect_spdx_deps)
NOTE: recipe quota-4.09-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iputils-20240905-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cronie-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2918 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.10.0.bb:do_collect_spdx_deps)
NOTE: Running task 2921 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_collect_spdx_deps)
NOTE: recipe ltp-20240930-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2928 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_collect_spdx_deps)
NOTE: Running task 2931 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_collect_spdx_deps)
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2978 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_package_write_ipk)
NOTE: recipe quota-4.09-r0: task do_collect_spdx_deps: Started
NOTE: recipe iproute2-6.10.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe logrotate-3.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2979 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_configure)
NOTE: recipe iproute2-6.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iputils-20240905-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2980 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.10.0.bb:do_configure)
NOTE: recipe logrotate-3.22.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe cronie-1.7.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe ltp-20240930-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ltp-20240930-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2981 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20240930.bb:do_configure)
NOTE: recipe logrotate-3.22.0-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_package_write_ipk: Started
NOTE: Running task 2982 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_package_write_deb)
NOTE: recipe logrotate-3.22.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe iproute2-6.10.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe iproute2-6.10.0-r0: task do_configure: Started
NOTE: Running task 2983 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_package_write_rpm)
NOTE: recipe cronie-1.7.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ltp-20240930-r0: task do_configure: Started
NOTE: recipe gawk-5.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3013 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_package_write_ipk)
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe e2fsprogs-1.47.1-r0: task do_package_write_deb: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_package_write_rpm: Started
NOTE: Running task 3014 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_package_write_deb)
NOTE: Running task 3015 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_configure)
NOTE: Running task 3016 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_package_write_rpm)
NOTE: recipe iputils-20240905-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iputils-20240905-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3023 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_configure)
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_configure: Started
NOTE: recipe coreutils-9.5-r0: task do_package_write_ipk: Started
NOTE: recipe cronie-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3024 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_configure)
NOTE: recipe coreutils-9.5-r0: task do_package_write_deb: Started
NOTE: recipe coreutils-9.5-r0: task do_package_write_rpm: Started
NOTE: recipe iputils-20240905-r0: task do_configure: Started
NOTE: recipe quota-4.09-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe quota-4.09-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3025 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_configure)
NOTE: recipe cronie-1.7.2-r0: task do_configure: Started
NOTE: recipe iproute2-6.10.0-r0: task do_configure: Succeeded
NOTE: Running task 3026 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.10.0.bb:do_compile)
NOTE: recipe quota-4.09-r0: task do_configure: Started
NOTE: recipe iproute2-6.10.0-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_package_write_ipk unihash changed to a2533ce66d175bfa9c62f182e25e4661ff7bcfc326e027b2bc41eb3908b644af
NOTE: recipe iputils-20240905-r0: task do_configure: Succeeded
NOTE: Running task 3027 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_compile)
NOTE: recipe iputils-20240905-r0: task do_compile: Started
NOTE: recipe coreutils-9.5-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_package_write_ipk unihash changed to c7d03056aa5caf4ea6ecbd0646cc7998e3b4786fbd043620ce5b258dff815f30
NOTE: recipe iputils-20240905-r0: task do_compile: Succeeded
NOTE: Running task 3028 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_install)
NOTE: recipe iputils-20240905-r0: task do_install: Started
NOTE: recipe iputils-20240905-r0: task do_install: Succeeded
NOTE: Running task 3029 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_package)
NOTE: Running task 3030 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_populate_sysroot)
NOTE: recipe iputils-20240905-r0: task do_package: Started
NOTE: recipe iputils-20240905-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_package_write_deb unihash changed to 98c3dab6025e18b08d20deba9e74b0098bd16d7d62344eee0afb4e288deb8243
NOTE: recipe iputils-20240905-r0: task do_populate_sysroot: Succeeded
NOTE: recipe logrotate-3.22.0-r0: task do_configure: Succeeded
NOTE: Running task 3031 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_configure_ptest_base)
NOTE: recipe logrotate-3.22.0-r0: task do_configure_ptest_base: Started
NOTE: recipe logrotate-3.22.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3032 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_compile)
NOTE: recipe logrotate-3.22.0-r0: task do_compile: Started
NOTE: recipe cronie-1.7.2-r0: task do_configure: Succeeded
NOTE: Running task 3033 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_compile)
NOTE: recipe cronie-1.7.2-r0: task do_compile: Started
NOTE: recipe iputils-20240905-r0: task do_package: Succeeded
NOTE: Running task 3034 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_packagedata)
NOTE: recipe iputils-20240905-r0: task do_packagedata: Started
NOTE: recipe quota-4.09-r0: task do_configure: Succeeded
NOTE: Running task 3035 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_compile)
NOTE: recipe logrotate-3.22.0-r0: task do_compile: Succeeded
NOTE: Running task 3036 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_compile_ptest_base)
NOTE: recipe quota-4.09-r0: task do_compile: Started
NOTE: recipe logrotate-3.22.0-r0: task do_compile_ptest_base: Started
NOTE: recipe cronie-1.7.2-r0: task do_compile: Succeeded
NOTE: recipe logrotate-3.22.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3037 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_install)
NOTE: Running task 3038 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_install)
NOTE: recipe iputils-20240905-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_packagedata unihash changed to 6fc31b5da039f675bc738cbfc7eca25fb2bd871f71b6fb864f355931246a94f8
NOTE: Setscene tasks completed
NOTE: Running task 3039 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_create_spdx)
NOTE: Running task 3040 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_package_write_ipk)
NOTE: Running task 3041 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_package_write_deb)
NOTE: recipe cronie-1.7.2-r0: task do_install: Started
NOTE: Running task 3042 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_package_write_rpm)
NOTE: recipe logrotate-3.22.0-r0: task do_install: Started
NOTE: recipe iputils-20240905-r0: task do_create_spdx: Started
NOTE: recipe iputils-20240905-r0: task do_package_write_deb: Started
NOTE: recipe iputils-20240905-r0: task do_package_write_ipk: Started
NOTE: recipe iputils-20240905-r0: task do_package_write_rpm: Started
NOTE: recipe quota-4.09-r0: task do_compile: Succeeded
NOTE: Running task 3043 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_install)
NOTE: recipe iputils-20240905-r0: task do_create_spdx: Succeeded
NOTE: recipe logrotate-3.22.0-r0: task do_install: Succeeded
NOTE: recipe quota-4.09-r0: task do_install: Started
NOTE: Running task 3044 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_install_ptest_base)
NOTE: recipe cronie-1.7.2-r0: task do_install: Succeeded
NOTE: Running task 3045 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_package)
NOTE: Running task 3046 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_populate_sysroot)
NOTE: recipe logrotate-3.22.0-r0: task do_install_ptest_base: Started
NOTE: recipe cronie-1.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe cronie-1.7.2-r0: task do_package: Started
NOTE: recipe iputils-20240905-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_package_write_deb unihash changed to a3afd084e208d494f7902d180296e8d14d995d06a9fa1ad12adb343c0b02ec4d
NOTE: recipe iputils-20240905-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_package_write_ipk unihash changed to c3f2e1a0fc5e1ca461be95f4fce672b15229a58ff37565f508451ca647f3bb9b
NOTE: recipe logrotate-3.22.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3047 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_package)
NOTE: Running task 3048 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_populate_sysroot)
NOTE: recipe quota-4.09-r0: task do_install: Succeeded
NOTE: recipe logrotate-3.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe logrotate-3.22.0-r0: task do_package: Started
NOTE: Running task 3049 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_package)
NOTE: Running task 3050 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_populate_sysroot)
NOTE: recipe cronie-1.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe quota-4.09-r0: task do_package: Started
NOTE: recipe quota-4.09-r0: task do_populate_sysroot: Started
NOTE: recipe logrotate-3.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe iputils-20240905-r0: task do_package_write_rpm: Succeeded
NOTE: recipe quota-4.09-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240905.bb:do_package_write_rpm unihash changed to 7a2c3d8ebef336b1d2ffc02ad32bfe5b5910827ab54996f24f9d2b04c04a32de
NOTE: recipe iproute2-6.10.0-r0: task do_compile: Succeeded
NOTE: Running task 3051 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.10.0.bb:do_install)
NOTE: recipe iproute2-6.10.0-r0: task do_install: Started
NOTE: recipe iproute2-6.10.0-r0: task do_install: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_package: Succeeded
NOTE: Running task 3054 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.10.0.bb:do_populate_sysroot)
NOTE: recipe coreutils-9.5-r0: task do_package_write_deb: Succeeded
NOTE: Running task 3055 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.10.0.bb:do_package_write_ipk)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3056 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_packagedata)
NOTE: Running task 3057 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.10.0.bb:do_package_write_deb)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_package_write_deb unihash changed to e24d3bf9199c2f287793ae7b068ddb48971828b91267cd396195929469fd21aa
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_package_write_rpm unihash changed to f8c88bf1cc1cd97beb5dd2ba5d9ef1db9ecbc95d1b0e7f503bca08209d49f3a4
NOTE: Running task 3058 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.10.0.bb:do_package_write_rpm)
NOTE: Running task 3059 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_package_write_ipk)
NOTE: recipe iproute2-6.10.0-r0: task do_populate_sysroot: Started
NOTE: Running task 3060 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_package_write_deb)
NOTE: recipe cronie-1.7.2-r0: task do_packagedata: Started
NOTE: Running task 3061 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_package_write_rpm)
NOTE: recipe iproute2-6.10.0-r0: task do_package_write_ipk: Started
NOTE: recipe iproute2-6.10.0-r0: task do_package_write_deb: Started
NOTE: recipe iproute2-6.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.40.2-r0: task do_package_write_ipk: Started
NOTE: recipe util-linux-2.40.2-r0: task do_package_write_deb: Started
NOTE: recipe util-linux-2.40.2-r0: task do_package_write_rpm: Started
NOTE: recipe cronie-1.7.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3062 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_create_spdx)
NOTE: Running task 3063 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_package_write_ipk)
NOTE: Running task 3064 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_package_write_deb)
NOTE: Running task 3065 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_package_write_rpm)
NOTE: recipe iproute2-6.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3066 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.10.0.bb:do_create_spdx)
NOTE: recipe cronie-1.7.2-r0: task do_create_spdx: Started
NOTE: recipe cronie-1.7.2-r0: task do_package_write_ipk: Started
NOTE: recipe cronie-1.7.2-r0: task do_package_write_deb: Started
NOTE: recipe cronie-1.7.2-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-6.10.0-r0: task do_create_spdx: Started
NOTE: recipe cronie-1.7.2-r0: task do_create_spdx: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe iproute2-6.10.0-r0: task do_create_spdx: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_package_write_deb: Succeeded
NOTE: recipe iproute2-6.10.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.10.0.bb:do_package_write_ipk unihash changed to 74b90277d458b508ce25bb6039660e2c3bed8dd60d876fb7cd647069bd8aad27
NOTE: recipe quota-4.09-r0: task do_package: Succeeded
NOTE: Running task 3067 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_packagedata)
NOTE: recipe quota-4.09-r0: task do_packagedata: Started
NOTE: recipe quota-4.09-r0: task do_packagedata: Succeeded
NOTE: recipe logrotate-3.22.0-r0: task do_package: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_packagedata unihash changed to fe41028034652a512714e7afb1adb77fc1fe528f697e553f8c79ba8b282e3e4e
NOTE: Setscene tasks completed
NOTE: Running task 3068 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_packagedata)
NOTE: Running task 3069 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_create_spdx)
NOTE: Running task 3070 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_package_write_ipk)
NOTE: Running task 3071 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_package_write_deb)
NOTE: Running task 3072 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_package_write_rpm)
NOTE: recipe logrotate-3.22.0-r0: task do_packagedata: Started
NOTE: recipe quota-4.09-r0: task do_create_spdx: Started
NOTE: recipe quota-4.09-r0: task do_package_write_ipk: Started
NOTE: recipe quota-4.09-r0: task do_package_write_deb: Started
NOTE: recipe quota-4.09-r0: task do_package_write_rpm: Started
NOTE: recipe logrotate-3.22.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_packagedata unihash changed to e753b33697354bfa17eb5ad2e5025719abfbf2ff352ca5b3fe5e86b87f5f16e2
NOTE: Setscene tasks completed
NOTE: Running task 3073 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_create_spdx)
NOTE: Running task 3074 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_package_write_ipk)
NOTE: Running task 3075 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_package_write_deb)
NOTE: Running task 3076 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_package_write_rpm)
NOTE: recipe logrotate-3.22.0-r0: task do_create_spdx: Started
NOTE: recipe logrotate-3.22.0-r0: task do_package_write_ipk: Started
NOTE: recipe quota-4.09-r0: task do_create_spdx: Succeeded
NOTE: recipe logrotate-3.22.0-r0: task do_package_write_deb: Started
NOTE: recipe logrotate-3.22.0-r0: task do_package_write_rpm: Started
NOTE: recipe quota-4.09-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_package_write_ipk unihash changed to 5895d34841a00f0b1f7bfcd752e1d931477f6c03d5b9abb1dac7fe3ec6ce1239
NOTE: recipe logrotate-3.22.0-r0: task do_create_spdx: Succeeded
NOTE: recipe logrotate-3.22.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_package_write_ipk unihash changed to 48184ae7a657af28df27c45376f65f26674ec93b9d244684174d0802018a5b89
NOTE: recipe iproute2-6.10.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe logrotate-3.22.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.10.0.bb:do_package_write_deb unihash changed to 13225b631b049d9fb6d59c3e4e2262f068ad369b08d33a5e43e387568addd287
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_package_write_deb unihash changed to def7e3047c0a78a527d37fade08348db192107592364d784d8cd9b3b399d4c00
NOTE: recipe quota-4.09-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_package_write_deb unihash changed to a6e2862a938b0727ba94a57e0a8bccf9544b33ff6aa0eed5ee0f2cf47b504345
NOTE: recipe util-linux-2.40.2-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_package_write_ipk unihash changed to cb0fbd32aadf0e284d1864c7ad4d1b9a0fcfd02cb19d8d43aa605ecb2afbf58e
NOTE: recipe ltp-20240930-r0: task do_configure: Succeeded
NOTE: Running task 3077 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20240930.bb:do_compile)
NOTE: recipe logrotate-3.22.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_package_write_rpm unihash changed to a780f76f159dd7e0f5a9cf1f7eb0925c76c4c1e4ea596bf0812790feefe95485
NOTE: recipe quota-4.09-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ltp-20240930-r0: task do_compile: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_package_write_rpm unihash changed to 17572222c12ea88866f7080340a31c2b33964bcf5c6bdd0e15be5db525b24dd9
NOTE: recipe iproute2-6.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.10.0.bb:do_package_write_rpm unihash changed to 8856be44a76c8cf94d080c22ad5a8b1aa53947505b5f0ce26768cb815940a98f
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_configure: Succeeded
NOTE: Running task 3078 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_compile)
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_compile: Started
NOTE: recipe coreutils-9.5-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_package_write_rpm unihash changed to f37b1387f244933d2183a8cd50a02a4d62f75b6e946b9eff50cd693c9685bbb1
NOTE: recipe util-linux-2.40.2-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_package_write_deb unihash changed to e6c9f33d8167679ada4b65c7b1a1b451881d56f9f79724761a1e1fdf49a155c5
NOTE: recipe util-linux-2.40.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_package_write_rpm unihash changed to 89f66859a1aaa8dbc7a59e44f85fc67c0138ad2e9ee6e68bfa260789ebea29fb
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_compile: Succeeded
NOTE: Running task 3079 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_install)
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_install: Started
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_install: Succeeded
NOTE: Running task 3080 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_package)
NOTE: Running task 3081 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_populate_sysroot)
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_package: Started
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3082 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdb-15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdb-15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3083 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_15.2.bb:do_configure)
NOTE: recipe gdb-15.2-r0: task do_configure: Started
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_package: Succeeded
NOTE: Running task 3084 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_packagedata)
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_packagedata: Started
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_packagedata unihash changed to 21f4c4138da8fb830de7c763ed2e930d8bb95c4609c169fe95d1c23b610b23eb
NOTE: Setscene tasks completed
NOTE: Running task 3085 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_create_spdx)
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_create_spdx: Started
NOTE: recipe gdb-15.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3086 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_15.2.bb:do_compile)
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 3087 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_15.2.bb:do_collect_spdx_deps)
NOTE: recipe gdb-15.2-r0: task do_compile: Started
NOTE: recipe gdb-15.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe gdb-15.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gdb-15.2-r0: task do_compile: Succeeded
NOTE: Running task 3088 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_15.2.bb:do_install)
NOTE: recipe gdb-15.2-r0: task do_install: Started
NOTE: recipe gdb-15.2-r0: task do_install: Succeeded
NOTE: Running task 3089 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_15.2.bb:do_package)
NOTE: Running task 3090 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_15.2.bb:do_populate_sysroot)
NOTE: recipe gdb-15.2-r0: task do_package: Started
NOTE: recipe gdb-15.2-r0: task do_populate_sysroot: Started
NOTE: recipe gdb-15.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdb-15.2-r0: task do_package: Succeeded
NOTE: Running task 3091 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_15.2.bb:do_packagedata)
NOTE: recipe gdb-15.2-r0: task do_packagedata: Started
NOTE: recipe gdb-15.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_15.2.bb:do_packagedata unihash changed to 642dfd222c7a4d98012281a43c91abec86c97a69957b6087871d616089c1b1bb
NOTE: Setscene tasks completed
NOTE: Running task 3092 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_15.2.bb:do_create_spdx)
NOTE: Running task 3093 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_15.2.bb:do_package_write_ipk)
NOTE: Running task 3094 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_15.2.bb:do_package_write_deb)
NOTE: Running task 3095 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_15.2.bb:do_package_write_rpm)
NOTE: recipe gdb-15.2-r0: task do_create_spdx: Started
NOTE: recipe gdb-15.2-r0: task do_package_write_ipk: Started
NOTE: recipe gdb-15.2-r0: task do_package_write_deb: Started
NOTE: recipe gdb-15.2-r0: task do_package_write_rpm: Started
NOTE: recipe gdb-15.2-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_15.2.bb:do_package_write_ipk unihash changed to c2e7ad5043f751183a50bb94d6218135471e4d5bfa0da5ff65e4f66547aab722
NOTE: recipe gdb-15.2-r0: task do_create_spdx: Succeeded
NOTE: recipe gdb-15.2-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_15.2.bb:do_package_write_deb unihash changed to 8108226434df8182565af54530c6f90e25748968d3965fcb5f01d7b2663e5061
NOTE: recipe gdb-15.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_15.2.bb:do_package_write_rpm unihash changed to f019b9a9f2503240f75c3e51e28ddaaa81bca54f60a1a1b7318e0771fd44ed68
NOTE: recipe ltp-20240930-r0: task do_compile: Succeeded
NOTE: Running task 3096 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20240930.bb:do_install)
NOTE: recipe ltp-20240930-r0: task do_install: Started
NOTE: recipe ltp-20240930-r0: task do_install: Succeeded
NOTE: Running task 3097 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20240930.bb:do_package)
NOTE: Running task 3098 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20240930.bb:do_populate_sysroot)
NOTE: recipe ltp-20240930-r0: task do_populate_sysroot: Started
NOTE: recipe ltp-20240930-r0: task do_package: Started
NOTE: recipe ltp-20240930-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ltp-20240930-r0: task do_package: Succeeded
NOTE: Running task 3099 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20240930.bb:do_packagedata)
NOTE: recipe ltp-20240930-r0: task do_packagedata: Started
NOTE: recipe ltp-20240930-r0: task do_packagedata: Succeeded
NOTE: Running task 3100 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20240930.bb:do_create_spdx)
NOTE: Running task 3101 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20240930.bb:do_package_write_ipk)
NOTE: Running task 3102 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20240930.bb:do_package_write_deb)
NOTE: Running task 3103 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20240930.bb:do_package_write_rpm)
NOTE: recipe ltp-20240930-r0: task do_create_spdx: Started
NOTE: Running task 3104 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20240930.bb:do_package_qa)
NOTE: recipe ltp-20240930-r0: task do_package_write_ipk: Started
NOTE: recipe ltp-20240930-r0: task do_package_write_deb: Started
NOTE: recipe ltp-20240930-r0: task do_package_write_rpm: Started
NOTE: recipe ltp-20240930-r0: task do_package_qa: Started
NOTE: recipe ltp-20240930-r0: task do_package_write_ipk: Succeeded
NOTE: recipe ltp-20240930-r0: task do_create_spdx: Succeeded
NOTE: Running task 3105 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20240930.bb:do_create_package_spdx)
NOTE: recipe ltp-20240930-r0: task do_create_package_spdx: Started
NOTE: recipe ltp-20240930-r0: task do_package_write_deb: Succeeded
NOTE: recipe ltp-20240930-r0: task do_create_package_spdx: Succeeded
NOTE: recipe ltp-20240930-r0: task do_package_qa: Succeeded
NOTE: recipe ltp-20240930-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3106 of 3106 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20240930.bb:do_build)
NOTE: Tasks Summary: Attempted 3106 tasks of which 2969 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 31 ERROR messages, returning a non-zero exit code.
ERROR: gawk-5.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-src went backwards which would break package feeds (from 0:5.3.1-r0 to 0:5.3.0-r0) [version-going-backwards]
ERROR: gawk-5.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-dbg went backwards which would break package feeds (from 0:5.3.1-r0 to 0:5.3.0-r0) [version-going-backwards]
ERROR: gawk-5.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-ptest went backwards which would break package feeds (from 0:5.3.1-r0 to 0:5.3.0-r0) [version-going-backwards]
ERROR: gawk-5.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-gawkbug went backwards which would break package feeds (from 0:5.3.1-r0 to 0:5.3.0-r0) [version-going-backwards]
ERROR: gawk-5.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-staticdev went backwards which would break package feeds (from 0:5.3.1-r0 to 0:5.3.0-r0) [version-going-backwards]
ERROR: gawk-5.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-dev went backwards which would break package feeds (from 0:5.3.1-r0 to 0:5.3.0-r0) [version-going-backwards]
ERROR: gawk-5.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-doc went backwards which would break package feeds (from 0:5.3.1-r0 to 0:5.3.0-r0) [version-going-backwards]
ERROR: gawk-5.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-bg went backwards which would break package feeds (from 0:5.3.1-r0 to 0:5.3.0-r0) [version-going-backwards]
ERROR: gawk-5.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ca went backwards which would break package feeds (from 0:5.3.1-r0 to 0:5.3.0-r0) [version-going-backwards]
ERROR: gawk-5.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-da went backwards which would break package feeds (from 0:5.3.1-r0 to 0:5.3.0-r0) [version-going-backwards]
ERROR: gawk-5.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-de went backwards which would break package feeds (from 0:5.3.1-r0 to 0:5.3.0-r0) [version-going-backwards]
ERROR: gawk-5.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-es went backwards which would break package feeds (from 0:5.3.1-r0 to 0:5.3.0-r0) [version-going-backwards]
ERROR: gawk-5.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-fi went backwards which would break package feeds (from 0:5.3.1-r0 to 0:5.3.0-r0) [version-going-backwards]
ERROR: gawk-5.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-fr went backwards which would break package feeds (from 0:5.3.1-r0 to 0:5.3.0-r0) [version-going-backwards]
ERROR: gawk-5.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-id went backwards which would break package feeds (from 0:5.3.1-r0 to 0:5.3.0-r0) [version-going-backwards]
ERROR: gawk-5.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-it went backwards which would break package feeds (from 0:5.3.1-r0 to 0:5.3.0-r0) [version-going-backwards]
ERROR: gawk-5.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ja went backwards which would break package feeds (from 0:5.3.1-r0 to 0:5.3.0-r0) [version-going-backwards]
ERROR: gawk-5.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ko went backwards which would break package feeds (from 0:5.3.1-r0 to 0:5.3.0-r0) [version-going-backwards]
ERROR: gawk-5.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ms went backwards which would break package feeds (from 0:5.3.1-r0 to 0:5.3.0-r0) [version-going-backwards]
ERROR: gawk-5.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-nl went backwards which would break package feeds (from 0:5.3.1-r0 to 0:5.3.0-r0) [version-going-backwards]
ERROR: gawk-5.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-pl went backwards which would break package feeds (from 0:5.3.1-r0 to 0:5.3.0-r0) [version-going-backwards]
ERROR: gawk-5.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-pt went backwards which would break package feeds (from 0:5.3.1-r0 to 0:5.3.0-r0) [version-going-backwards]
ERROR: gawk-5.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-pt-br went backwards which would break package feeds (from 0:5.3.1-r0 to 0:5.3.0-r0) [version-going-backwards]
ERROR: gawk-5.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ro went backwards which would break package feeds (from 0:5.3.1-r0 to 0:5.3.0-r0) [version-going-backwards]
ERROR: gawk-5.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-sr went backwards which would break package feeds (from 0:5.3.1-r0 to 0:5.3.0-r0) [version-going-backwards]
ERROR: gawk-5.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-sv went backwards which would break package feeds (from 0:5.3.1-r0 to 0:5.3.0-r0) [version-going-backwards]
ERROR: gawk-5.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-uk went backwards which would break package feeds (from 0:5.3.1-r0 to 0:5.3.0-r0) [version-going-backwards]
ERROR: gawk-5.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-vi went backwards which would break package feeds (from 0:5.3.1-r0 to 0:5.3.0-r0) [version-going-backwards]
ERROR: gawk-5.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-zh-cn went backwards which would break package feeds (from 0:5.3.1-r0 to 0:5.3.0-r0) [version-going-backwards]
ERROR: gawk-5.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package gawk went backwards which would break package feeds (from 0:5.3.1-r0 to 0:5.3.0-r0) [version-going-backwards]
ERROR: gawk-5.3.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============9072073258114988110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/ltp/ltp-dev: PKGSIZE changed from 312465 to 347136 (+11%)
packages/core2-64-poky-linux/ltp/ltp-dev: FILELIST: added "/opt/ltp/include/ujson_writer.h /opt/ltp/include/ujson_reader.h /opt/ltp/include/tst_tmpdir.h /opt/ltp/include/ujson.h /opt/ltp/include/ujson_common.h /opt/ltp/include/ujson_utf.h"
packages/core2-64-poky-linux/ltp/ltp: FILELIST: removed "/opt/ltp/testcases/bin/prctl04 /opt/ltp/testcases/realtime/func/sched_football/run_auto.sh /opt/ltp/testcases/realtime/func/sched_football/sched_football", added "/opt/ltp/testcases/bin/lstat03_64 /opt/ltp/testcases/bin/run_tests.sh /opt/ltp/testcases/bin/chmod09 /opt/ltp/testcases/bin/chmod08 /opt/ltp/testcases/bin/shutdown02 /opt/ltp/testcases/bin/tst_loader.sh /opt/ltp/testcases/bin/shutdown01 /opt/ltp/testcases/bin/tst_res_ /opt/ltp/testcases/bin/stat04_64 /opt/ltp/testcases/bin/rename15 /opt/ltp/testcases/bin/tst_run_shell /opt/ltp/testcases/bin/nfsstat02.sh /opt/ltp/testcases/bin/cachestat02 /opt/ltp/testcases/bin/cachestat03 /opt/ltp/testcases/bin/sched_football /opt/ltp/testcases/bin/cachestat01 /opt/ltp/testcases/bin/cachestat04 /opt/ltp/testcases/bin/unlink10 /opt/ltp/testcases/bin/mseal02 /opt/ltp/testcases/bin/mseal01 /opt/ltp/testcases/bin/lstat03 /opt/ltp/testcases/bin/stat04 /opt/ltp/testcases/bin/landlock_exec /
 opt/ltp/testcases/bin/landlock01 /opt/ltp/testcases/bin/landlock03 /opt/ltp/testcases/bin/landlock02 /opt/ltp/testcases/bin/landlock05 /opt/ltp/testcases/bin/landlock04 /opt/ltp/testcases/bin/landlock07 /opt/ltp/testcases/bin/landlock06 /opt/ltp/testcases/bin/sigsuspend02 /opt/ltp/testcases/bin/fchmodat2_02 /opt/ltp/testcases/bin/request_key06 /opt/ltp/testcases/bin/signalfd02 /opt/ltp/testcases/bin/fchmodat2_01 /opt/ltp/testcases/bin/hugeshmget06 /opt/ltp/testcases/bin/shell_test04 /opt/ltp/testcases/bin/shell_test05 /opt/ltp/testcases/bin/shell_test06 /opt/ltp/testcases/bin/shell_test01 /opt/ltp/testcases/bin/shell_test02 /opt/ltp/testcases/bin/shell_test03 /opt/ltp/testcases/bin/tst_env.sh /opt/ltp/testcases/bin/ioctl_ficlone01 /opt/ltp/testcases/bin/ioctl_ficlone02 /opt/ltp/testcases/bin/ioctl_ficlone03 /opt/ltp/testcases/bin/ioctl_ficlone04 /opt/ltp/testcases/bin/open15 /opt/ltp/testcases/bin/ioctl_ficlonerange01 /opt/ltp/testcases/bin/ioctl_ficlonerange02 /opt/ltp/testcases/bi
 n/getcpu02 /opt/ltp/testcases/bin/seccomp01"
Changes to packages/core2-64-poky-linux/ltp (sysroot):
  /opt/ltp/include/tst_tmpdir.h was added
  /opt/ltp/include/ujson_common.h was added
  /opt/ltp/include/ujson.h was added
  /opt/ltp/include/ujson_reader.h was added
  /opt/ltp/include/ujson_utf.h was added
  /opt/ltp/include/ujson_writer.h was added

--===============9072073258114988110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ltp: PKGV changed from 20240524 [default] to 20240930 [default]
packages/core2-64-poky-linux/ltp: PV changed from "20240524" to "20240930"
packages/core2-64-poky-linux/ltp/ltp-dbg: PKGV changed from 20240524 [default] to 20240930 [default]
packages/core2-64-poky-linux/ltp/ltp-dbg: PKGSIZE changed from 1070421536 to 1113761560 (+4%)
packages/core2-64-poky-linux/ltp/ltp-dbg: PV changed from "20240524" to "20240930"
packages/core2-64-poky-linux/ltp/ltp-dbg: FILELIST: removed "/opt/ltp/testcases/bin/.debug/prctl04 /opt/ltp/testcases/realtime/func/sched_football/.debug/sched_football", added "/opt/ltp/testcases/bin/.debug/ioctl_ficlone01 /opt/ltp/testcases/bin/.debug/ioctl_ficlone03 /opt/ltp/testcases/bin/.debug/ioctl_ficlone02 /opt/ltp/testcases/bin/.debug/ioctl_ficlone04 /opt/ltp/testcases/bin/.debug/mseal01 /opt/ltp/testcases/bin/.debug/mseal02 /opt/ltp/testcases/bin/.debug/chmod08 /opt/ltp/testcases/bin/.debug/chmod09 /opt/ltp/testcases/bin/.debug/tst_run_shell /opt/ltp/testcases/bin/.debug/stat04_64 /opt/ltp/testcases/bin/.debug/cachestat01 /opt/ltp/testcases/bin/.debug/stat04 /opt/ltp/testcases/bin/.debug/cachestat03 /opt/ltp/testcases/bin/.debug/cachestat02 /opt/ltp/testcases/bin/.debug/cachestat04 /opt/ltp/testcases/bin/.debug/request_key06 /opt/ltp/testcases/bin/.debug/sched_football /opt/ltp/testcases/bin/.debug/lstat03 /opt/ltp/testcases/bin/.debug/getcpu02 /opt/ltp/testcases/bin/.debug
 /rename15 /opt/ltp/testcases/bin/.debug/hugeshmget06 /opt/ltp/testcases/bin/.debug/sigsuspend02 /opt/ltp/testcases/bin/.debug/signalfd02 /opt/ltp/testcases/bin/.debug/shutdown02 /opt/ltp/testcases/bin/.debug/shutdown01 /opt/ltp/testcases/bin/.debug/shell_test04 /opt/ltp/testcases/bin/.debug/shell_test05 /opt/ltp/testcases/bin/.debug/shell_test06 /opt/ltp/testcases/bin/.debug/shell_test01 /opt/ltp/testcases/bin/.debug/shell_test02 /opt/ltp/testcases/bin/.debug/shell_test03 /opt/ltp/testcases/bin/.debug/landlock_exec /opt/ltp/testcases/bin/.debug/tst_res_ /opt/ltp/testcases/bin/.debug/lstat03_64 /opt/ltp/testcases/bin/.debug/unlink10 /opt/ltp/testcases/bin/.debug/landlock02 /opt/ltp/testcases/bin/.debug/landlock03 /opt/ltp/testcases/bin/.debug/landlock01 /opt/ltp/testcases/bin/.debug/landlock06 /opt/ltp/testcases/bin/.debug/landlock07 /opt/ltp/testcases/bin/.debug/landlock04 /opt/ltp/testcases/bin/.debug/landlock05 /opt/ltp/testcases/bin/.debug/seccomp01 /opt/ltp/testcases/bin/.debug/
 fchmodat2_01 /opt/ltp/testcases/bin/.debug/fchmodat2_02 /opt/ltp/testcases/bin/.debug/ioctl_ficlonerange01 /opt/ltp/testcases/bin/.debug/open15 /opt/ltp/testcases/bin/.debug/ioctl_ficlonerange02"
packages/core2-64-poky-linux/ltp/ltp-dev: PKGV changed from 20240524 [default] to 20240930 [default]
packages/core2-64-poky-linux/ltp/ltp-dev: PKGSIZE changed from 312465 to 347136 (+11%)
packages/core2-64-poky-linux/ltp/ltp-dev: PV changed from "20240524" to "20240930"
packages/core2-64-poky-linux/ltp/ltp-dev: FILELIST: added "/opt/ltp/include/ujson_utf.h /opt/ltp/include/ujson_reader.h /opt/ltp/include/tst_tmpdir.h /opt/ltp/include/ujson_common.h /opt/ltp/include/ujson.h /opt/ltp/include/ujson_writer.h"
packages/core2-64-poky-linux/ltp/ltp-doc: PKGV changed from 20240524 [default] to 20240930 [default]
packages/core2-64-poky-linux/ltp/ltp-doc: PV changed from "20240524" to "20240930"
packages/core2-64-poky-linux/ltp/ltp-locale: PKGV changed from 20240524 [default] to 20240930 [default]
packages/core2-64-poky-linux/ltp/ltp-locale: PV changed from "20240524" to "20240930"
packages/core2-64-poky-linux/ltp/ltp-src: PKGV changed from 20240524 [default] to 20240930 [default]
packages/core2-64-poky-linux/ltp/ltp-src: PKGSIZE changed from 12866765 to 13465083 (+5%)
packages/core2-64-poky-linux/ltp/ltp-src: PV changed from "20240524" to "20240930"
packages/core2-64-poky-linux/ltp/ltp-src: FILELIST: directory renamed /usr/src/debug/ltp/20240524/testcases/network/nfs/nfslock01 -> /usr/src/debug/ltp/20240930/testcases/network/nfs/nfslock01, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/init_module -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/init_module, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/futex -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/futex, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/irq -> /usr/src/debug/ltp/20240930/testcases/kernel/irq, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/controllers/memcg/functional -> /usr/src/debug/ltp/20240930/testcases/kernel/controllers/memcg/functional, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sched_yield -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_destr
 oy, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sigset -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sigset, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/syslog -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/syslog, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_settype -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_settype, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/controllers/cpuacct -> /usr/src/debug/ltp/20240930/testcases/kernel/controllers/cpuacct, directory renamed /us
 r/src/debug/ltp/20240524/testcases/kernel/syscalls/string -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/string, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_timedlock -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_timedlock, directory renamed /usr/src/debug/ltp/20240524/testcases/network/sctp -> /usr/src/debug/ltp/20240930/testcases/network/sctp, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sendmmsg -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sendmmsg, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_push -> /usr/src/debug/ltp/2
 0240930/testcases/open_posix_testsuite/conformance/behavior/WIFEXITED, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/ctime -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/strlen, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/dup3 -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/dup3, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/dup2 -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/dup2, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/inotify_init -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/inotify_init, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/security/cap_bound -> /usr/src/debug/ltp/20240930/testcases/kernel/security/cap_bound, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fanotify -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fan
 otify, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/containers/mountns -> /usr/src/debug/ltp/20240930/testcases/kernel/containers/mountns, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/rt_sigqueueinfo -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/rt_sigqueueinfo, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_atfork -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_atfork, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_destroy -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_init, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/watchqueue -> /usr/src/debug/ltp/20240930/testcases/kernel/watchqueue, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interface
 s/strlen -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mktime, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/tkill -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/tkill, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sched_getattr -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sched_getattr, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sched_setattr -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sched_setattr, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/utils -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/utils, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/get_robust_list -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/get_robust_list, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/set_robust_list -> /usr/src/debug/ltp/20240930/testcases/kern
 el/syscalls/set_robust_list, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_init -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_destroy, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_init -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_init, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_init -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_init, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sigemptyset -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/behavior/timers, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sysfs -> /usr/src/d
 ebug/ltp/20240930/testcases/kernel/syscalls/sysfs, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/pipe -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/pipe, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/epoll_create1 -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/epoll_create1, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_unlock -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_unlock, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/iopl -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/iopl, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/recvmmsg -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/recvmmsg, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/io_uring -> /usr/src/debug/ltp/20240930/testcases/kernel/sysca
 lls/io_uring, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sgetmask -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sgetmask, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setns -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setns, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mount_setattr -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mount_setattr, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fchmodat -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fchmodat, directory renamed /usr/src/debug/ltp/20240524/libs/libltpvdso -> /usr/src/debug/ltp/20240930/libs/vdso, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/mem/hugetlb/hugeshmat -> /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugeshmat, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/keyctl -> /usr/src/debug/ltp/20240930/testcases/kernel/
 syscalls/keyctl, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/security/filecaps -> /usr/src/debug/ltp/20240930/testcases/kernel/security/filecaps, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/uevents -> /usr/src/debug/ltp/20240930/testcases/kernel/uevents, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getitimer -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getitimer, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/containers/mqns -> /usr/src/debug/ltp/20240930/testcases/kernel/containers/mqns, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setitimer -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setitimer, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sysctl -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sysctl, directory renamed /usr/src/debug/ltp/20240524/libs/libltpsigwait -> /usr/src/debug/ltp/20240930/libs/sigwait, direct
 ory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/personality -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/personality, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/pivot_root -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/pivot_root, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/containers/userns -> /usr/src/debug/ltp/20240930/testcases/kernel/containers/userns, directory renamed /usr/src/debug/ltp/20240524/testcases/misc/f00f -> /usr/src/debug/ltp/20240930/testcases/misc/f00f, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/syncfs -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/syncfs, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mlock -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mlock, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setfsuid -> /usr/
 src/debug/ltp/20240930/testcases/kernel/syscalls/setfsuid, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mq_timedreceive -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mq_timedreceive, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/device-drivers/tbio/tbio_user -> /usr/src/debug/ltp/20240930/testcases/kernel/device-drivers/tbio/tbio_user, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ulimit -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ulimit, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/testfrmw -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/testfrmw, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/controllers/cgroup -> /usr/src/debug/ltp/20240930/testcases/kernel/controllers/cgroup, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/creat -> /usr/src/debug/ltp/202409
 30/testcases/kernel/syscalls/creat, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ipc/semop -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ipc/semop, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/openat -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/openat, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/device-drivers/rtc -> /usr/src/debug/ltp/20240930/testcases/kernel/device-drivers/rtc, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/difftime -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/ctime, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/pidfd_open -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/pidfd_open, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/faccessat2 -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/faccessat2, directory re
 named /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sigfillset -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_destroy, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/strftime -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/pread -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/pread, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/lio_listio -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/lio_listio, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/functional/mqueues -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/functional/mqueues, directory renamed /usr/src/debug/ltp/202
 40524/testcases/commands/nm/datafiles -> /usr/src/debug/ltp/20240930/testcases/commands/nm/datafiles, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_getprioceiling -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_getprioceiling, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/killpg -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sem_post, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/definitions/aio_h -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedpolicy, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_lock -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_lock, direct
 ory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/readahead -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/readahead, directory renamed /usr/src/debug/ltp/20240524/testcases/misc/math/float/exp_log -> /usr/src/debug/ltp/20240930/testcases/misc/math/float/exp_log, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/openat2 -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/openat2, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/security/smack -> /usr/src/debug/ltp/20240930/testcases/kernel/security/smack, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/renameat -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/renameat, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init/speculative -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init/speculative, directory renamed /usr/
 src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/kill -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/kill, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/tracing/pt_test -> /usr/src/debug/ltp/20240930/testcases/kernel/tracing/pt_test, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_join/speculative -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_join/speculative, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/connectors/pec -> /usr/src/debug/ltp/20240930/testcases/kernel/connectors/pec, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mq_notify -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mq_notify, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/truncate -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/truncate, dire
 ctory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/timerfd -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/timerfd, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/munlockall -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/munlockall, directory renamed /usr/src/debug/ltp/20240524/testcases/misc/math/float/trigo -> /usr/src/debug/ltp/20240930/testcases/misc/math/float/trigo, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getdetachstate -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_setspecific, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setdetachstate -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setdetachstate, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conforma
 nce/interfaces/pthread_barrierattr_init -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/strncpy, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy/speculative -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy/speculative, directory renamed /usr/src/debug/ltp/20240524/testcases/network/nfsv4/locks -> /usr/src/debug/ltp/20240930/testcases/network/nfsv4/locks, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstacksize -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/strcpy, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstacksize -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstacksize, directory rena
 med /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval/speculative -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/munlockall, directory renamed /usr/src/debug/ltp/20240524/testcases/realtime/func/hrtimer-prio -> /usr/src/debug/ltp/20240930/testcases/realtime/func/hrtimer-prio, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getresuid -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getresuid, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setresuid -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setresuid, directory renamed /usr/src/debug/ltp/20240524/testcases/realtime/func/thread_clock -> /usr/src/debug/ltp/20240930/testcases/realtime/func/thread_clock, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_wait -> /usr/src/debug/ltp/20240930/testcases/open_posix_tes
 tsuite/conformance/interfaces/sem_close, directory renamed /usr/src/debug/ltp/20240524/testcases/network/lib6 -> /usr/src/debug/ltp/20240930/testcases/network/lib6, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/timer_create -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/timer_create, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/timer_delete -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/timer_delete, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_detach -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_detach, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/rt_sigprocmask -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/rt_sigprocmask, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcancelstate -> /usr/src/debug/ltp
 /20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcancelstate, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_wait -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_wait, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/io_destroy -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/io_destroy, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sem_getvalue -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sem_getvalue, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/mem/hugetlb/hugeshmctl -> /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugeshmctl, directory renamed /usr/src/debug/ltp/20240524/testcases/realtime/func/sched_jitter -> /usr/src/debug/ltp/20240930/testcases/realtime/func/sched_jitter, directory ren
 amed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sem_destroy -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sem_destroy, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_getpshared -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_getpshared, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/security/aslr -> /usr/src/debug/ltp/20240930/testcases/kernel/security/aslr, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_setpshared -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/strchr, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/functional/timers/timers -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/functional/timers/timers, d
 irectory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getsid -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getsid, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mallopt -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mallopt, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sched_get_priority_max -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sched_get_priority_max, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setsid -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setsid, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/fs/lftest -> /usr/src/debug/ltp/20240930/testcases/kernel/fs/lftest, directory renamed /usr/src/debug/ltp/20240524/lib -> /usr/src/debug/ltp/20240930/lib, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getxattr -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getxattr, directory renamed /usr
 /src/debug/ltp/20240524/testcases/kernel/controllers/memcg -> /usr/src/debug/ltp/20240930/testcases/kernel/controllers/memcg, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setxattr -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setxattr, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sigwait -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sigwait, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/device-drivers/tbio/tbio_kernel -> /usr/src/debug/ltp/20240930/testcases/kernel/device-drivers/tbio/tbio_kernel, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/sched/autogroup -> /usr/src/debug/ltp/20240930/testcases/kernel/sched/autogroup, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/aio_fsync -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/aio_fsync, directory renamed /usr/src/debug/ltp/20240524/testc
 ases/kernel/firmware/fw_load_user -> /usr/src/debug/ltp/20240930/testcases/kernel/firmware/fw_load_user, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getcontext -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getcontext, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mlockall -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mlockall, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/chdir -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/chdir, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/mem/tunable -> /usr/src/debug/ltp/20240930/testcases/kernel/mem/tunable, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mkdir -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mkdir, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/rmdir -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/rmdir, directory renamed /usr/src/deb
 ug/ltp/20240524/testcases/kernel/controllers/cpuset/cpuset_memory_test -> /usr/src/debug/ltp/20240930/testcases/kernel/controllers/cpuset/cpuset_memory_test, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/device-drivers/block/block_dev_user -> /usr/src/debug/ltp/20240930/testcases/kernel/device-drivers/block/block_dev_user, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sigaltstack -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sigaltstack, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/clock_getres -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/clock_getres, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/epoll -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/epoll, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ppoll -> /usr/src/d
 ebug/ltp/20240930/testcases/kernel/syscalls/ppoll, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/munmap -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/munmap, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/device-drivers/acpi -> /usr/src/debug/ltp/20240930/testcases/kernel/device-drivers/acpi, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/sched/tool -> /usr/src/debug/ltp/20240930/testcases/kernel/sched/tool, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/behavior/timers -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sigfillset, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/crypto -> /usr/src/debug/ltp/20240930/testcases/kernel/crypto, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/device-drivers/pci/tpci_kernel -> /usr/src/debug/ltp/20240930/testcas
 es/kernel/device-drivers/pci/tpci_kernel, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/eventfd2 -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/eventfd2, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sigtimedwait -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sigtimedwait, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/speculative -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/speculative, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mlockall/speculative -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interf
 aces/mlockall/speculative, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getcwd -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getcwd, directory renamed /usr/src/debug/ltp/20240524/testcases/realtime/func/prio-preempt -> /usr/src/debug/ltp/20240930/testcases/realtime/func/prio-preempt, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/readlinkat -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/readlinkat, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sched_getparam -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sched_getparam, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sched_setparam -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sched_setparam, directory renamed /usr/src/debug/ltp/20240524/testcases/realtime/include -> /usr/src/debug/ltp/20240930/testcases/realtime/include, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscall
 s/io_submit -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/io_submit, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/clock_nanosleep -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/clock_nanosleep, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/set_thread_area -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/set_thread_area, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/definitions/mqueue_h -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/asctime, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/socketcall -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/socketcall, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsu
 ite/conformance/interfaces/pthread_cond_broadcast, directory renamed /usr/src/debug/ltp/20240524/testcases/misc/math/nextafter -> /usr/src/debug/ltp/20240930/testcases/misc/math/nextafter, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/io/ltp-aiodio -> /usr/src/debug/ltp/20240930/testcases/kernel/io/ltp-aiodio, directory renamed /usr/src/debug/ltp/20240524/testcases/network/iptables -> /usr/src/debug/ltp/20240930/testcases/network/iptables, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime/speculative -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime/speculative, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mp
 rotect -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mprotect, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/set_mempolicy -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/set_mempolicy, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/timer_create/speculative -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/timer_create/speculative, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/lseek -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/lseek, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend/speculative -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend/speculative, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/aio_suspend -> /usr/src/debug/ltp/20240930/testcase
 s/open_posix_testsuite/conformance/interfaces/aio_suspend, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/waitpid -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/waitpid, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ipc/shmat -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ipc/shmat, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ipc/semctl -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ipc/semctl, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid/speculative -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid/speculative, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/preadv -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/preadv, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mallinfo -> /usr/src
 /debug/ltp/20240930/testcases/kernel/syscalls/mallinfo, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_wrlock -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_wrlock, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/readlink -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/readlink, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/sched/nptl -> /usr/src/debug/ltp/20240930/testcases/kernel/sched/nptl, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/clock_getres -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/clock_getres, directory renamed /usr/src/debug/ltp/20240524/testcases/realtime/perf/latency -> /usr/src/debug/ltp/20240930/testcases/realtime/perf/latency, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/munmap -> /usr/src/debug/ltp/20240930/testcases/kernel/sysc
 alls/munmap, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/accept4 -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/accept4, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype/speculative -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype/speculative, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getppid -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getppid, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sync_file_range -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sync_file_range, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/umount -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/umount, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_join -> /usr/src
 /debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_join, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/controllers/freezer -> /usr/src/debug/ltp/20240930/testcases/kernel/controllers/freezer, directory renamed /usr/src/debug/ltp/20240524/testcases/commands/ldd/datafiles -> /usr/src/debug/ltp/20240930/testcases/commands/ldd/datafiles, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getclock -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getclock, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setclock -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setclock, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/controllers/memcg/stress -> /usr/src/debug/ltp/20240930/testcases/kernel/c
 ontrollers/memcg/stress, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/mem/hugetlb/lib -> /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/lib, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sendmsg -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sendmsg, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/munlockall -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create/speculative, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/mem/hugetlb/hugeshmdt -> /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugeshmdt, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fpathconf -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fpathconf, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/umask -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/umask, direct
 ory renamed /usr/src/debug/ltp/20240524/testcases/kernel/controllers/pids -> /usr/src/debug/ltp/20240930/testcases/kernel/controllers/pids, directory renamed /usr/src/debug/ltp/20240524/testcases/network/stress/ns-tools -> /usr/src/debug/ltp/20240930/testcases/network/stress/ns-tools, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/stress/mqueues -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/stress/mqueues, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/stress/signals -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/stress/signals, directory renamed /usr/src/debug/ltp/20240524/testcases/network/tcp_cmds/include -> /usr/src/debug/ltp/20240930/testcases/network/tcp_cmds/include, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait, directory
  renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getpgrp -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getpgrp, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setpgrp -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setpgrp, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fadvise -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fadvise, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/madvise -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/madvise, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/statx -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/statx, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/waitid -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/waitid, directory renamed /usr/src/debug/ltp/20240524/testcases/realtime/func/sched_latency -> /usr/src/debug/ltp/20240930/testcases/realtime/fu
 nc/sched_latency, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/swapoff -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/swapoff, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/containers/utsname -> /usr/src/debug/ltp/20240930/testcases/kernel/containers/utsname, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/sched/hyperthreading/ht_affinity -> /usr/src/debug/ltp/20240930/testcases/kernel/sched/hyperthreading/ht_affinity, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/copy_file_range -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/copy_file_range, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ioprio -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioprio, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/move_mount -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/move_mount, directory renamed /usr/src/debug/ltp/20240524/t
 estcases/misc/math/float/iperb -> /usr/src/debug/ltp/20240930/testcases/misc/math/float/iperb, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/arch_prctl -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/arch_prctl, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ipc/msgctl -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ipc/msgctl, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/security/umip -> /usr/src/debug/ltp/20240930/testcases/kernel/security/umip, directory renamed /usr/src/debug/ltp/20240524/testcases/realtime/func/sched_football -> /usr/src/debug/ltp/20240930/testcases/realtime/func/sched_football, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/io_setup -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/io_setup, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mlock/speculative -> /usr/src/debug/ltp/20240930/testc
 ases/open_posix_testsuite/conformance/interfaces/mlock/speculative, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ipc/msgstress -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ipc/msgstress, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/profil -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/profil, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/recvfrom -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/recvfrom, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/tools -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/tools, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/close -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/close, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/controllers/libcontrollers -> /usr/src/debug/ltp/20240930/testcases/kernel/controllers/libcontrollers, directory renamed /
 usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sigprocmask -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sigprocmask, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/vhangup -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/vhangup, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/fs/inode -> /usr/src/debug/ltp/20240930/testcases/kernel/fs/inode, directory renamed /usr/src/debug/ltp/20240524/testcases/realtime/func/matrix_mult -> /usr/src/debug/ltp/20240930/testcases/realtime/func/matrix_mult, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_init -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_getspecific, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/controllers/cpuctl -> /usr/src/debug/ltp/20240930/testcases/kernel/controllers/cpuctl, directory renamed /usr/src/debug/ltp/20240524/testcases/k
 ernel/syscalls/getdents -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getdents, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sighold -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sighold, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/io/aio -> /usr/src/debug/ltp/20240930/testcases/kernel/io/aio, directory renamed /usr/src/debug/ltp/20240524/libs/libltpuinput -> /usr/src/debug/ltp/20240930/libs/uinput, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mkdirat -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mkdirat, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sem_open -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sem_open, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/controllers/cpuset/cpuset_hotplug_test -> /usr/src/debug/ltp/20240930/testcases/kernel/controllers/cpuset/cpuset_
 hotplug_test, directory renamed /usr/src/debug/ltp/20240524/libs/libltpswap -> /usr/src/debug/ltp/20240930/libs/swap, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/shm_open -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/shm_open, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_getpshared -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_init, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_setpshared -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_init, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/raise -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/r
 aise, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_min -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_min, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/fs/fsx-linux -> /usr/src/debug/ltp/20240930/testcases/kernel/fs/fsx-linux, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setinheritsched -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setinheritsched, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getinheritsched -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_setprioceiling, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/signalfd4 -> /usr/src/debug/ltp/20240930/testcases/kernel/sys
 calls/signalfd4, directory renamed /usr/src/debug/ltp/20240524/testcases/misc/crash -> /usr/src/debug/ltp/20240930/testcases/misc/crash, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/open_by_handle_at -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/open_by_handle_at, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/epoll_ctl -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/epoll_ctl, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/fs/fs_perms -> /usr/src/debug/ltp/20240930/testcases/kernel/fs/fs_perms, directory renamed /usr/src/debug/ltp/20240524/testcases/cve -> /usr/src/debug/ltp/20240930/testcases/cve, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/controllers/cgroup_xattr ->
  /usr/src/debug/ltp/20240930/testcases/kernel/controllers/cgroup_xattr, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/clock_nanosleep -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/clock_nanosleep, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fchdir -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fchdir, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/pwrite -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/pwrite, directory renamed /usr/src/debug/ltp/20240524/testcases/commands/eject -> /usr/src/debug/ltp/20240930/testcases/commands/eject, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/listxattr -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/listxattr, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/fs/fs_fill -> /usr/src/debug/ltp/20240930/testcases/kernel/fs/fs_fill, directory renamed /usr/src/debug/ltp/20240524/testcases/open_po
 six_testsuite/conformance/interfaces/pthread_create -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_create, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_kill -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_kill, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sem_close -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_wait, directory renamed /usr/src/debug/ltp/20240524/testcases/network/nfsv4/acl -> /usr/src/debug/ltp/20240930/testcases/network/nfsv4/acl, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/add_key -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/add_key, directory renamed /usr/src/debug/ltp/20240524/utils/sctp/lib -> /usr/src/debug/ltp/20240930/utils/sctp/lib, directory renamed /usr/src/
 debug/ltp/20240524/testcases/kernel/syscalls/socketpair -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/socketpair, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getpriority -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getpriority, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setpriority -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setpriority, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/gethostname -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/gethostname, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getpagesize -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getpagesize, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getpeername -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getpeername, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/se
 m_unlink -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sem_unlink, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/shm_unlink -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/shm_unlink, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fstat -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fstat, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ustat -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ustat, directory renamed /usr/src/debug/ltp/20240524/testcases/misc/math/float/bessel -> /usr/src/debug/ltp/20240930/testcases/misc/math/float/bessel, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/userfaultfd -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/userfaultfd, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sendto -> /usr/src/debug/ltp/
 20240930/testcases/kernel/syscalls/sendto, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/inotify -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/inotify, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/sched/sched_stress -> /usr/src/debug/ltp/20240930/testcases/kernel/sched/sched_stress, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/include -> /usr/src/debug/ltp/20240930/testcases/kernel/include, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/adjtimex -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/adjtimex, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/mem/vma -> /usr/src/debug/ltp/20240930/testcases/kernel/mem/vma, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/definitions/errno_h -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/definitions/errno_h, directory renamed /usr/src/debug/ltp/20240524/test
 cases/open_posix_testsuite/conformance/definitions/sched_h -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/definitions/sched_h, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/memcmp -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/memcmp, directory renamed /usr/src/debug/ltp/20240524/testcases/network/can/cve -> /usr/src/debug/ltp/20240930/testcases/network/can/cve, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/containers/netns -> /usr/src/debug/ltp/20240930/testcases/kernel/containers/netns, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sched_yield -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sched_yield, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/io_pgetevents -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/io_pgetevents, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getpgid -> /usr/src/debug/ltp/20240930/
 testcases/kernel/syscalls/getpgid, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setpgid -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setpgid, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mremap -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mremap, directory renamed /usr/src/debug/ltp/20240524/libs/libltpipc -> /usr/src/debug/ltp/20240930/libs/ipc, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/controllers/memcg/regression -> /usr/src/debug/ltp/20240930/testcases/kernel/controllers/memcg/regression, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_init -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_init, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mq_timedsend -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mq_timedsend, directory rena
 med /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mq_open -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mq_open, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/localtime -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstacksize, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sched_getscheduler -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sched_getscheduler, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sched_get_priority_min -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sched_get_priority_min, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/utimensat -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/utimensat, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getdomainname -> /usr
 /src/debug/ltp/20240930/testcases/kernel/syscalls/getdomainname, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setdomainname -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setdomainname, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/nftw -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/nftw, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_destroy -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedprio, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/controllers/cpuset/cpuset_memory_pressure_test -> /usr/src/debug/ltp/20240930/testcases/kernel/controllers/cpuset/cpuset_memory_pressure_test, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprotocol -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/c
 onformance/interfaces/pthread_mutexattr_getprotocol, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprotocol -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprotocol, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_destroy -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_init, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sched_setparam -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sched_setparam, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/delete_module -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/delete_module, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/sched/hyperthreading/ht_enabl
 ed -> /usr/src/debug/ltp/20240930/testcases/kernel/sched/hyperthreading/ht_enabled, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive/speculative -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive/speculative, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sysinfo -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sysinfo, directory renamed /usr/src/debug/ltp/20240524/testcases/realtime/func/gtod_latency -> /usr/src/debug/ltp/20240930/testcases/realtime/func/gtod_latency, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/confstr -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/confstr, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/mem/hugetlb/hugefallocate -> /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugefallocate, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/
 syscalls/signal -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/signal, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/io/writetest -> /usr/src/debug/ltp/20240930/testcases/kernel/io/writetest, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/clock_getcpuclockid -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/clock_getcpuclockid, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/eventfd -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/eventfd, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam/speculative -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam/speculative, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/rt_sigaction -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/rt_sigaction, directory 
 renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/aio_cancel -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/aio_cancel, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/definitions/signal_h -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/definitions/signal_h, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/timer_getoverrun -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/timer_getoverrun, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getrandom -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getrandom, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/include -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/include, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getscope -
 > /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/getpid, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setscope -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setscope, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/controllers/cpuset/cpuset_load_balance_test -> /usr/src/debug/ltp/20240930/testcases/kernel/controllers/cpuset/cpuset_load_balance_test, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sem_init -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sem_init, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sem_wait -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sem_wait, directory renamed /usr/src/debug/ltp/20240524/testcases/realtime/fu
 nc/periodic_cpu_load -> /usr/src/debug/ltp/20240930/testcases/realtime/func/periodic_cpu_load, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ipc/msgrcv -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ipc/msgrcv, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mktime -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/definitions/mqueue_h, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/access -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/access, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/nice -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/nice, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_equal -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_delete, directory renamed /usr/src/debug/ltp/2024052
 4/testcases/kernel/syscalls/ipc/semget -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ipc/semget, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/acct -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/acct, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/recv -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/recv, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/quotactl -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/quotactl, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setfsgid -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setfsgid, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/clock_gettime -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/clock_gettime, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces
 /timer_gettime -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/sched/sysctl -> /usr/src/debug/ltp/20240930/testcases/kernel/sched/sysctl, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/clone -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/clone, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mq_close -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mq_close, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedprio -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_setpshared, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sigpause -> /usr/src/debug/ltp/20240930/testcases/open_posix_
 testsuite/conformance/interfaces/sigpause, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/mem/mem -> /usr/src/debug/ltp/20240930/testcases/kernel/mem/mem, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sigrelse -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/aio_error, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/sched/cfs-scheduler -> /usr/src/debug/ltp/20240930/testcases/kernel/sched/cfs-scheduler, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_destroy -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_destroy, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/mem/thp -> /usr/src/debug/ltp/20240930/testcases/kernel/mem/thp, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/sched/clisrv -> /usr/src/debug/ltp/2024093
 0/testcases/kernel/sched/clisrv, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sem_post -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/killpg, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/controllers/io -> /usr/src/debug/ltp/20240930/testcases/kernel/controllers/io, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/input -> /usr/src/debug/ltp/20240930/testcases/kernel/input, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/functional/threads/schedule -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/timer_delete, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/time -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getinheritsched, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/
 memfd_create -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/memfd_create, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getrlimit -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getrlimit, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setrlimit -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setrlimit, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/accept -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/accept, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/clock -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_getpshared, directory renamed /usr/src/debug/ltp/20240524/testcases/misc/math/float/power -> /usr/src/debug/ltp/20240930/testcases/misc/math/float/power, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sigt
 imedwait -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sigtimedwait, directory renamed /usr/src/debug/ltp/20240524/testcases/realtime/func/async_handler -> /usr/src/debug/ltp/20240930/testcases/realtime/func/async_handler, directory renamed /usr/src/debug/ltp/20240524/testcases/commands/file/datafiles -> /usr/src/debug/ltp/20240930/testcases/commands/file/datafiles, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/execv -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/execv, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/execve -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/execve, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/pipe2 -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/pipe2, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/controllers/cpuset/cpuset_lib -> /usr/src/debug/ltp/20240930/testcases/kernel/controllers/cpuset/c
 puset_lib, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/gettid -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/gettid, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getsockopt -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getsockopt, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/device-drivers/cpufreq -> /usr/src/debug/ltp/20240930/testcases/kernel/device-drivers/cpufreq, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fgetxattr -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fgetxattr, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fsetxattr -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fsetxattr, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/lgetxattr -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/lgetxattr, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/recvmsg ->
  /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/recvmsg, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setsockopt -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setsockopt, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_init -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_init, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/execvp -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/execvp, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/fs/stream -> /usr/src/debug/ltp/20240930/testcases/kernel/fs/stream, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sched_getscheduler -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sched_getscheduler, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sched_setscheduler -> /usr/src/debug/lt
 p/20240930/testcases/kernel/syscalls/sched_setscheduler, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/geteuid -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/geteuid, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/execl -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/execl, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ipc/shmdt -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ipc/shmdt, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setregid -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setregid, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_getspecific -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_destroy, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_setspecific -> /usr
 /src/debug/ltp/20240930/testcases/open_posix_testsuite/functional/threads/schedule, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/rt_sigtimedwait -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/rt_sigtimedwait, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/security/dirtyc0w -> /usr/src/debug/ltp/20240930/testcases/kernel/security/dirtyc0w, directory renamed /usr/src/debug/ltp/20240524/testcases/network/netstress -> /usr/src/debug/ltp/20240930/testcases/network/netstress, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/exit -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/exit, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fchmod -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fchmod, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/wait -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/wait, directory renamed /usr/src/debug/ltp/20240524
 /testcases/misc/math/fptests -> /usr/src/debug/ltp/20240930/testcases/misc/math/fptests, directory renamed /usr/src/debug/ltp/20240524/testcases/network/tcp_cmds/sendfile -> /usr/src/debug/ltp/20240930/testcases/network/tcp_cmds/sendfile, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fsopen -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fsopen, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/times -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/times, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/fork -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/fork, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/containers/pidns -> /usr/src/debug/ltp/20240930/testcases/kernel/containers/pidns, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_self -> /usr/src/debug
 /ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_destroy, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/alarm -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/alarm, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/faccessat -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/faccessat, directory renamed /usr/src/debug/ltp/20240524/testcases/network/nfs/nfs_stress -> /usr/src/debug/ltp/20240930/testcases/network/nfs/nfs_stress, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/epoll_pwait -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/epoll_pwait, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fchownat -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fchownat, directory renamed /usr/src/debug/ltp/20240524/tools/apicmds -> /usr/src/debug/ltp/20240930/tools/apicmds, directory renamed /usr/src/debug/ltp/20240524/testcases/
 kernel/fs/fs_di -> /usr/src/debug/ltp/20240930/testcases/kernel/fs/fs_di, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/modify_ldt -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/modify_ldt, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/fs/doio/include -> /usr/src/debug/ltp/20240930/testcases/kernel/fs/doio/include, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/set_tid_address -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/set_tid_address, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sched_getaffinity -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sched_getaffinity, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/process_madvise -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/process_madvise, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sched_setaffinity -> /usr/src/debug/ltp/20240930/testcases/kernel
 /syscalls/sched_setaffinity, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_testcancel -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_setpshared, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/mem/page -> /usr/src/debug/ltp/20240930/testcases/kernel/mem/page, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sigignore -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sigignore, directory renamed /usr/src/debug/ltp/20240524/tools/genload -> /usr/src/debug/ltp/20240930/tools/genload, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/statfs -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/statfs, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_destroy -> /usr/src/debug/ltp/
 20240930/testcases/open_posix_testsuite/conformance/interfaces/clock, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_max -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_max, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fmtmsg -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fmtmsg, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mmap -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mmap, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/abort -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/abort, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/capset -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/capset, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscal
 ls/reboot -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/reboot, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/vfork -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/vfork, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_signal -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_signal, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/listen -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/listen, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ipc/msgsnd -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ipc/msgsnd, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/strcpy -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_self, directory renamed /usr/src/debug/ltp/20240524/testca
 ses/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedpolicy -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/definitions/aio_h, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedpolicy -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedpolicy, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/futimesat -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/futimesat, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fremovexattr -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fremovexattr, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/lremovexattr -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/lremovexattr, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/behavior/WIFEXITED -> /usr/src/debu
 g/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_getschedparam, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/timer_create -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/timer_create, directory renamed /usr/src/debug/ltp/20240524/testcases/realtime/stress/pi-tests -> /usr/src/debug/ltp/20240930/testcases/realtime/stress/pi-tests, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mknod -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mknod, directory renamed /usr/src/debug/ltp/20240524/testcases/network/multicast/mc_commo -> /usr/src/debug/ltp/20240930/testcases/network/multicast/mc_commo, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/exit_group -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/exit_group, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/kill -> /usr/src/debug/ltp/
 20240930/testcases/kernel/syscalls/kill, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/open_tree -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/open_tree, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/security/kallsyms -> /usr/src/debug/ltp/20240930/testcases/kernel/security/kallsyms, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/capget -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/capget, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/poll -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/poll, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setreuid -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setreuid, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/fs/fsstress -> /usr/src/debug/ltp/20240930/testcases/kernel/fs/fsstress, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/i
 nterfaces/sigpending -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sigpending, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/security/dirtypipe -> /usr/src/debug/ltp/20240930/testcases/kernel/security/dirtypipe, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/kvm -> /usr/src/debug/ltp/20240930/testcases/kernel/kvm, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/pause -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/pause, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sigaddset -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sigaddset, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sigdelset -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sigdelset, directory renamed /usr/src/debug/ltp/20240524/testcases
 /open_posix_testsuite/conformance/interfaces/pthread_cancel -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_cancel, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_sigmask -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_sigmask, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/connect -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/connect, directory renamed /usr/src/debug/ltp/20240524/libs/libltpnewipc -> /usr/src/debug/ltp/20240930/libs/newipc, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/memset -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/memset, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/symlink -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/symlink, directory renamed /usr/src/debug/ltp/20240524/testcases/realtime/func/prio
 -wake -> /usr/src/debug/ltp/20240930/testcases/realtime/func/prio-wake, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_trylock -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_trylock, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/move_pages -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/move_pages, directory renamed /usr/src/debug/ltp/20240524/pan -> /usr/src/debug/ltp/20240930/pan, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedrdlock -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedrdlock, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedwrlock -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthre
 ad_rwlock_timedwrlock, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_trylock -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_trylock, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sysconf -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sysconf, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/pidfd_getfd -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/pidfd_getfd, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/fs/doio -> /usr/src/debug/ltp/20240930/testcases/kernel/fs/doio, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_lock -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_lock, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/pty -> /usr/src/debug/ltp/20240
 930/testcases/kernel/pty, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/nanosleep -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/nanosleep, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ipc/shmget -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ipc/shmget, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/kvm/include -> /usr/src/debug/ltp/20240930/testcases/kernel/kvm/include, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/mem/include -> /usr/src/debug/ltp/20240930/testcases/kernel/mem/include, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstack -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/localtime, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/aio_return -> /usr/src/
 debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/aio_return, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/writev -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/writev, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstack -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstack, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/clock_settime -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/clock_settime, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/timer_settime -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/timer_settime, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/gethostbyname_r -> /usr/src/debug/ltp/
 20240930/testcases/kernel/syscalls/gethostbyname_r, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/readdir -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/readdir, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mlock2 -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mlock2, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/statvfs -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/statvfs, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sockioctl -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sockioctl, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/clock_settime/speculative -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/clock_settime/speculative, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/timer_settime/specula
 tive -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/timer_settime/speculative, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/chown -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/chown, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fcntl, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/signal -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/signal, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fspick -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fspick, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mq_unlink -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mq_unlink, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/controllers/cpuset/cpuset_syscall_test 
 -> /usr/src/debug/ltp/20240930/testcases/kernel/controllers/cpuset/cpuset_syscall_test, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sched_setscheduler -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sched_setscheduler, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/munlock -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/munlock, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/pidfd_send_signal -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/pidfd_send_signal, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sigwaitinfo -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sigwaitinfo, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy/speculative -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/p
 thread_cond_destroy/speculative, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/controllers/cpuset/cpuset_memory_spread_test -> /usr/src/debug/ltp/20240930/testcases/kernel/controllers/cpuset/cpuset_memory_spread_test, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/clone3 -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/clone3, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/io_cancel -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/io_cancel, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ioperm -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioperm, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/migrate_pages -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/migrate_pages, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/select -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/select, directory renamed /usr
 /src/debug/ltp/20240524/testcases/kernel/fs/openfile -> /usr/src/debug/ltp/20240930/testcases/kernel/fs/openfile, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/containers/timens -> /usr/src/debug/ltp/20240930/testcases/kernel/containers/timens, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getuid -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getuid, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setuid -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setuid, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_rdlock -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_rdlock, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getgroups -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getgroups, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/sysc
 alls/setgroups -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setgroups, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/gmtime -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sched_yield, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_unlock -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_unlock, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_timedwait -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_timedwait, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/sound -> /usr/src/debug/ltp/20240930/testcases/kernel/sound, directory renamed /usr/src/debug/ltp/20240524/testcases/network/sockets -> /usr/src/debug/ltp/20240930/testcases/network/sock
 ets, directory renamed /usr/src/debug/ltp/20240524/testcases/network/can/filter-tests -> /usr/src/debug/ltp/20240930/testcases/network/can/filter-tests, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getegid -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getegid, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sbrk -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sbrk, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fsync -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fsync, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/msync -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/msync, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setegid -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setegid, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_tryrdlock -> 
 /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_tryrdlock, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/aio_read -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/aio_read, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/stime -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/stime, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/utime -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/utime, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/mem/ksm -> /usr/src/debug/ltp/20240930/testcases/kernel/mem/ksm, directory renamed /usr/src/debug/ltp/
 20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam/speculative -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam/speculative, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/fs/proc -> /usr/src/debug/ltp/20240930/testcases/kernel/fs/proc, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/removexattr -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/removexattr, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr/speculative -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr/speculative, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mq_open/speculative -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mq_open/speculative, directory renamed /usr/src/deb
 ug/ltp/20240524/testcases/kernel/syscalls/getsockname -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getsockname, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/nanosleep -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/nanosleep, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/execveat -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/execveat, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getpshared -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcanceltype, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setpshared -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_equal, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_exi
 t -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_exit, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/aio_error -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sighold, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_destroy -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_destroy, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_destroy -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_destroy, direct
 ory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mlockall -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mlockall, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/preadv2 -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/preadv2, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/getpid -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/difftime, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/finit_module -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/finit_module, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/security/integrity/ima/src -> /usr/src/debug/ltp/20240930/testcases/kernel/security/integrity/ima/src, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/socket -> /usr/src/debug/ltp/20240930/testcases/kernel/sy
 scalls/socket, directory renamed /usr/src/debug/ltp/20240524/testcases/network/multicast/mc_opts -> /usr/src/debug/ltp/20240930/testcases/network/multicast/mc_opts, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/strncpy -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_testcancel, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sigwait -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sigwait, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/timer_delete -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getdetachstate, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/fs/squashfs -> /usr/src/debug/ltp/20240930/testcases/kernel/fs/squashfs, directory renamed /usr/src/debug/ltp/20240524/testcase
 s/open_posix_testsuite/conformance/interfaces/mq_open -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mq_open, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/readv -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/readv, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/munlock -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/munlock, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/strchr -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getscope, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sighold -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sigrelse, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformanc
 e/interfaces/mq_send -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mq_send, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fchown -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fchown, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fallocate -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fallocate, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/lchown -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/lchown, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getpid -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getpid, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/chroot -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/chroot, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/vmsplice -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/vmsplice, director
 y renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/asctime -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstack, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mmap -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mmap, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_delete -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getpshared, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_once -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_once, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/controllers/memctl -> /usr/src/debug/ltp/20240930/testcases/kernel/controllers/memctl, directory renamed /usr/src/debug/ltp/20240524/testcase
 s/kernel/syscalls/syscall -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/syscall, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sigrelse -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sigrelse, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/read -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/read, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/sched/pthreads -> /usr/src/debug/ltp/20240930/testcases/kernel/sched/pthreads, directory renamed /usr/src/debug/ltp/20240524/utils/sctp/testlib -> /usr/src/debug/ltp/20240930/utils/sctp/testlib, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_getschedparam -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_push, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/pselect -> /usr/src/debug/ltp/20240930/testcases/kernel/sy
 scalls/pselect, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedparam -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedparam, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mount -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mount, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/pathconf -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/pathconf, directory renamed /usr/src/debug/ltp/20240524/utils/sctp/include/netinet -> /usr/src/debug/ltp/20240930/utils/sctp/include/netinet, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sigwaitinfo -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sigwaitinfo, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/fs/read_all -> /usr/src/debug/ltp/20240930/testcases/ker
 nel/fs/read_all, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/name_to_handle_at -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/name_to_handle_at, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/logging/kmsg -> /usr/src/debug/ltp/20240930/testcases/kernel/logging/kmsg, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprioceiling -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprioceiling, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sigpending -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sigpending, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprioceiling -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprioceiling, directory renamed /u
 sr/src/debug/ltp/20240524/testcases/kernel/syscalls/write -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/write, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/ipc/pipeio -> /usr/src/debug/ltp/20240930/testcases/kernel/ipc/pipeio, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getresgid -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getresgid, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setresgid -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/setresgid, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink/speculative -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink/speculative, directory renamed /usr/src/debug/ltp/20240524/testcases/network/multicast/mc_member -> /usr/src/debug/ltp/20240930/testcases/network/multicast/mc_member, directory renamed /usr/src/debug/ltp/20240524/testcases/o
 pen_posix_testsuite/conformance/interfaces/sched_rr_get_interval -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/strftime, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/mem/mtest05 -> /usr/src/debug/ltp/20240930/testcases/kernel/mem/mtest05, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/mem/mtest06 -> /usr/src/debug/ltp/20240930/testcases/kernel/mem/mtest06, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/mem/mtest07 -> /usr/src/debug/ltp/20240930/testcases/kernel/mem/mtest07, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_pop -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_pop, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/mem/mtest01 -> /usr/src/debug/ltp/20240930/testcases/kernel/mem/mtest01, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_
 testsuite/conformance/interfaces/sigqueue -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sigqueue, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/functional/threads/condvar -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/functional/threads/condvar, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sigismember -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sigismember, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun, directory renamed /usr/src/debug/ltp/20240524/testcases/realtime/func/pi_perf -> /usr/src/debug/ltp/20240930/testcases/realtime/func/pi_perf, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mincore -> /usr/src/de
 bug/ltp/20240930/testcases/kernel/syscalls/mincore, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/mem/lib -> /usr/src/debug/ltp/20240930/testcases/kernel/mem/lib, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/fs/ftest -> /usr/src/debug/ltp/20240930/testcases/kernel/fs/ftest, directory renamed /usr/src/debug/ltp/20240524/testcases/realtime/func/rt-migrate -> /usr/src/debug/ltp/20240930/testcases/realtime/func/rt-migrate, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/unshare -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/unshare, directory renamed /usr/src/debug/ltp/20240524/testcases/realtime/func/pthread_kill_latency -> /usr/src/debug/ltp/20240930/testcases/realtime/func/pthread_kill_latency, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/link -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/link, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fsmount -> /u
 sr/src/debug/ltp/20240930/testcases/kernel/syscalls/fsmount, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/bind -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/bind, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/send -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/send, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sync -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sync, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_unlock -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_unlock, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sigaction -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sigaction, directory renamed /usr/src/debug/ltp/20240524/testcases/misc/math/float -> /usr/src/debug/ltp/20240930/testcases/misc/math/float, direct
 ory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_init -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/gmtime, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/execlp -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/execlp, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/newuname -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/newuname, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/pwritev -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/pwritev, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/execle -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/execle, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcanceltype -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfac
 es/pthread_condattr_setpshared, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fsconfig -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fsconfig, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/wait4 -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/wait4, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_destroy -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sigemptyset, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/flock -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/flock, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mlock -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mlock, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/controllers/memcg/control -> /usr/src/debug/ltp/20240930/testcases/kernel/controllers/memcg/control, di
 rectory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/time, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/flistxattr -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/flistxattr, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/llistxattr -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/llistxattr, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sigprocmask -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sigprocmask, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive, directory renamed /usr/src/debug/ltp/20240524/testcase
 s/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getpshared -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getpshared, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setpshared -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setpshared, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/timer_gettime -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/timer_gettime, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/timer_settime -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/timer_settime, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/device-drivers/zram -> /usr/src/debug/ltp/20240930/testcases/kernel/device-drivers/zram, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interf
 aces/timer_delete/speculative -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/timer_delete/speculative, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/security/prot_hsymlinks -> /usr/src/debug/ltp/20240930/testcases/kernel/security/prot_hsymlinks, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/security/securebits -> /usr/src/debug/ltp/20240930/testcases/kernel/security/securebits, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/swapon -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/swapon, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fstatfs -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fstatfs, directory renamed /usr/src/debug/ltp/20240524/utils/benchmark/ebizzy-0.3 -> /usr/src/debug/ltp/20240930/utils/benchmark/ebizzy-0.3, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/controllers/cgroup_fj -> /usr/src/debug/ltp/20240930/testca
 ses/kernel/controllers/cgroup_fj, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/controllers/cpuctl_fj -> /usr/src/debug/ltp/20240930/testcases/kernel/controllers/cpuctl_fj, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/mem/hugetlb/hugemmap -> /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugemmap, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/linkat -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/linkat, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/mem/hugetlb/hugefork -> /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugefork, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/symlinkat -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/symlinkat, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/functional/semaphores -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/functional/semaphores, directory renamed /us
 r/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_setprioceiling -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedparam, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/numa -> /usr/src/debug/ltp/20240930/testcases/kernel/numa, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/mem/mmapstress -> /usr/src/debug/ltp/20240930/testcases/kernel/mem/mmapstress, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/realpath -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/realpath, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mq_receive -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mq_receive, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_init -> /usr/src/debug/ltp/20240930/test
 cases/open_posix_testsuite/conformance/interfaces/pthread_barrier_init, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/mem/shmt -> /usr/src/debug/ltp/20240930/testcases/kernel/mem/shmt, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/mem/vmtests -> /usr/src/debug/ltp/20240930/testcases/kernel/mem/vmtests, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/pwritev2 -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/pwritev2, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/rt_tgsigqueueinfo -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/rt_tgsigqueueinfo, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock/speculative -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock/speculative, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/epoll_create 
 -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/epoll_create, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/umount2 -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/umount2, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/io/direct_io -> /usr/src/debug/ltp/20240930/testcases/kernel/io/direct_io, directory renamed /usr/src/debug/ltp/20240524/testcases/misc/math/abs -> /usr/src/debug/ltp/20240930/testcases/misc/math/abs, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/fsync -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/fsync, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/membarrier -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/membarrier, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/power_management -> /usr/src/debug/ltp/20240930/testcases/kernel/power_management, directory renamed /u
 sr/src/debug/ltp/20240524/testcases/kernel/syscalls/ptrace -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ptrace, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/utimes -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/utimes, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create/speculative -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval/speculative, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/unlinkat -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/unlinkat, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/remap_file_pages -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/remap_file_pages, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/clock_adjtime -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/clock_adjtime, director
 y renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/clock_gettime -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/clock_gettime, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mallinfo2 -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mallinfo2, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/clock_settime -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/clock_settime, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/epoll_wait -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/epoll_wait, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getgid -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getgid, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/llseek -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/llseek, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setgid -> /usr/src/debug/lt
 p/20240930/testcases/kernel/syscalls/setgid, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/time -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/time, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/aio_write -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/aio_write, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedparam -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/gettimeofday -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/gettimeofday, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/settimeofday -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/settimeofday, directory renamed /usr/src/debug/ltp/20240524/testcases/ope
 n_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getrusage -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getrusage, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ipc/msgget -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ipc/msgget, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/kcmp -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/kcmp, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fstatat -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fstatat, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/device-drivers/pci/tpci_user -> /usr/src/debug/ltp/20240930/testcases/kernel/device-drivers/pci/tpci_user, directory renamed /usr/src/debug/ltp/20240524/testcases/ke
 rnel/syscalls/tgkill -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/tgkill, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/mem/oom -> /usr/src/debug/ltp/20240930/testcases/kernel/mem/oom, directory renamed /usr/src/debug/ltp/20240524/testcases/network/packet -> /usr/src/debug/ltp/20240930/testcases/network/packet, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/dup -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/dup, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/containers/sysvipc -> /usr/src/debug/ltp/20240930/testcases/kernel/containers/sysvipc, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mknodat -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mknodat, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr, directory ren
 amed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mq_setattr -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mq_setattr, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sched_rr_get_interval -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sched_rr_get_interval, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sendfile -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sendfile, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/brk -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/brk, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/cma -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/cma, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/io_getevents -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/io_getevents, directory renamed /usr/src/debug/ltp/20240524/te
 stcases/kernel/syscalls/tee -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/tee, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/bpf -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/bpf, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/close_range -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/close_range, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fdatasync -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fdatasync, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/splice -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/splice, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sigaltstack -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sigaltstack, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/lib -> /usr/src/debug/ltp/20240930/testcases/kernel/lib, directory renamed /usr/src/debug/ltp/20240524/t
 estcases/kernel/syscalls/renameat2 -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/renameat2, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mq_notify -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/mq_notify, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/gethostid -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/gethostid, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam, directory renamed /usr/src/debug/ltp/20240524/testcases/realtime/func/measurement -> /usr/src/debug/ltp/20240930/testcases/realtime/func/measurement, directory renamed /usr/src/debug/ltp/20240524/utils/sctp/func_tests -> /usr/src/debug/ltp/20240930/utils/sctp/func_tests, directory renamed /usr/src/debug/ltp/20240524/test
 cases/misc/math/atof -> /usr/src/debug/ltp/20240930/testcases/misc/math/atof, directory renamed /usr/src/debug/ltp/20240524/testcases/realtime/func/pi-tests -> /usr/src/debug/ltp/20240930/testcases/realtime/func/pi-tests, directory renamed /usr/src/debug/ltp/20240524/testcases/realtime/lib -> /usr/src/debug/ltp/20240930/testcases/realtime/lib, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/uname -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/uname, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/security/dirtyc0w_shmem -> /usr/src/debug/ltp/20240930/testcases/kernel/security/dirtyc0w_shmem, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ftruncate -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ftruncate, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/memcpy -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/memcpy, directory renamed /usr/src/debug/ltp/20240524/testcases
 /open_posix_testsuite/conformance/interfaces/sigaction -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sigaction, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/device-drivers/uaccess -> /usr/src/debug/ltp/20240930/testcases/kernel/device-drivers/uaccess, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/mem/swapping -> /usr/src/debug/ltp/20240930/testcases/kernel/mem/swapping, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/hotplug/memory_hotplug -> /usr/src/debug/ltp/20240930/testcases/kernel/hotplug/memory_hotplug, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/rt_sigsuspend -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/rt_sigsuspend, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sigsuspend -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/sigsuspend, directory renamed /usr/src
 /debug/ltp/20240524/testcases/kernel/syscalls/ipc/shmctl -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ipc/shmctl, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy, directory renamed /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/functional/timers/clocks -> /usr/src/debug/ltp/20240930/testcases/open_posix_testsuite/functional/timers/clocks, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/perf_event_open -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/perf_event_open, directory renamed /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ssetmask -> /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ssetmask, removed "/usr/src/debug/ltp/20240524/testcases/kernel/syscalls/rename/rename12.c /usr/src/debug/ltp/20240524/include/lapi/quotactl.h /usr/src
 /debug/ltp/20240524/testcases/lib/tst_timeout_kill.c /usr/src/debug/ltp/20240524/testcases/lib/tst_get_free_pids.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ioctl/ioctl_ns02.c /usr/src/debug/ltp/20240524/testcases/lib/tst_check_kconfigs.c /usr/src/debug/ltp/20240524/include/tst_safe_clocks.h /usr/src/debug/ltp/20240524/include/tst_safe_timerfd.h /usr/src/debug/ltp/20240524/testcases/lib/tst_fsfreeze.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getcpu/getcpu01.c /usr/src/debug/ltp/20240524/include/tst_checksum.h /usr/src/debug/ltp/20240524/include/lapi/fs.h /usr/src/debug/ltp/20240524/include/tst_clone.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ioctl/ioctl_ns04.c /usr/src/debug/ltp/20240524/include/tst_sys_conf.h /usr/src/debug/ltp/20240524/include/tst_checkpoint_fn.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/open/open07.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/unlink/unlink08.c /usr/src/debug/ltp/20240524/testcases/lib/t
 st_getconf.c /usr/src/debug/ltp/20240524/include/tst_safe_posix_ipc.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fork/fork04.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fork/fork14.c /usr/src/debug/ltp/20240524/include/tst_mkfs.h /usr/src/debug/ltp/20240524/testcases/lib/tst_hexdump.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/rename/rename14.c /usr/src/debug/ltp/20240524/include/lapi/membarrier.h /usr/src/debug/ltp/20240524/include/tst_cgroup.h /usr/src/debug/ltp/20240524/testcases/lib/tst_random.c /usr/src/debug/ltp/20240524/testcases/lib/tst_rod.c /usr/src/debug/ltp/20240524/include/old/safe_macros.h /usr/src/debug/ltp/20240524/include/old/cleanup.c /usr/src/debug/ltp/20240524/include/tst_safe_macros.h /usr/src/debug/ltp/20240524/include/tst_process_state.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/request_key/request_key01.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/request_key/request_key02.c /usr/src/debug/ltp/20240524/
 testcases/kernel/syscalls/request_key/request_key03.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/request_key/request_key04.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ioctl/ioctl_ns06.c /usr/src/debug/ltp/20240524/include/tst_device.h /usr/src/debug/ltp/20240524/include/lapi/fanotify.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/request_key/request_key05.c /usr/src/debug/ltp/20240524/include/tst_kvercmp.h /usr/src/debug/ltp/20240524/testcases/lib/tst_net_ip_prefix.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/open/open04.c /usr/src/debug/ltp/20240524/include/tst_clocks.h /usr/src/debug/ltp/20240524/include/tst_safe_file_ops.h /usr/src/debug/ltp/20240524/testcases/lib/tst_cgctl.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/chmod/chmod07.c /usr/src/debug/ltp/20240524/include/libsigwait.h /usr/src/debug/ltp/20240524/include/tst_cpu.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/chmod/chmod06.c /usr/src/debug/ltp/20240524/inc
 lude/tst_epoll.h /usr/src/debug/ltp/20240524/testcases/lib/tst_get_median.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/chmod/chmod01.c /usr/src/debug/ltp/20240524/include/tst_ansi_color.h /usr/src/debug/ltp/20240524/include/tst_uid.h /usr/src/debug/ltp/20240524/include/tst_timer_test.h /usr/src/debug/ltp/20240524/include/tst_bool_expr.h /usr/src/debug/ltp/20240524/include/tst_capability.h /usr/src/debug/ltp/20240524/include/lapi/sched.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/chmod/chmod03.c /usr/src/debug/ltp/20240524/include/tst_pid.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fork/fork03.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fork/fork13.c /usr/src/debug/ltp/20240524/include/tst_netlink.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/rename/rename13.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/rename/rename01.c /usr/src/debug/ltp/20240524/include/old/tlibio.h /usr/src/debug/ltp/20240524/testcases/kernel/sysca
 lls/sigsuspend/sigsuspend01.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ioctl/ioctl01.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/prctl/prctl01.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/prctl/prctl06_execve.c /usr/src/debug/ltp/20240524/include/tst_safe_file_at.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ioctl/ioctl09.c /usr/src/debug/ltp/20240524/include/lapi/sem.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/prctl/prctl09.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/rename/rename07.c /usr/src/debug/ltp/20240524/include/tst_wallclock.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/open/open06.c /usr/src/debug/ltp/20240524/include/lapi/close_range.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/pkeys/pkey01.c /usr/src/debug/ltp/20240524/include/safe_file_ops_fn.h /usr/src/debug/ltp/20240524/include/safe_stdio_fn.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/unlink/unlink09.c /usr/src/debu
 g/ltp/20240524/testcases/kernel/syscalls/fork/fork08.c /usr/src/debug/ltp/20240524/include/lapi/name_to_handle_at.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/open/open08.c /usr/src/debug/ltp/20240524/testcases/lib/tst_checkpoint.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ioctl/ioctl07.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fork/fork05.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/prctl/prctl07.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/rename/rename05.c /usr/src/debug/ltp/20240524/include/tst_net.h /usr/src/debug/ltp/20240524/include/tst_netdevice.h /usr/src/debug/ltp/20240524/testcases/lib/tst_lockdown_enabled.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ioctl/ioctl_loop06.c /usr/src/debug/ltp/20240524/include/time64_variants.h /usr/src/debug/ltp/20240524/include/tst_af_alg.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/lstat/lstat02.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/open/open
 09.c /usr/src/debug/ltp/20240524/testcases/lib/tst_device.c /usr/src/debug/ltp/20240524/testcases/lib/tst_net_vars.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/stat/stat01.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/open/open01.c /usr/src/debug/ltp/20240524/include/tst_arch.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/open/open11.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/rename/rename10.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fork/fork10.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/open/open12_child.c /usr/src/debug/ltp/20240524/testcases/lib/tst_get_unused_port.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/stat/stat03.c /usr/src/debug/ltp/20240524/include/tst_rtctime.h /usr/src/debug/ltp/20240524/include/tst_sched.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/open/open03.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/open/open13.c /usr/src/debug/ltp/20240524/include/lapi/watch_qu
 eue.h /usr/src/debug/ltp/20240524/include/old/old_tmpdir.h /usr/src/debug/ltp/20240524/include/tst_res_flags.h /usr/src/debug/ltp/20240524/include/lapi/io_uring.h /usr/src/debug/ltp/20240524/include/old/old_device.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ioctl/ioctl05.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/prctl/prctl05.c /usr/src/debug/ltp/20240524/include/lapi/openat2.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/rename/rename03.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ioctl/ioctl03.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/prctl/prctl03.c /usr/src/debug/ltp/20240524/include/old/ltp_priv.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/pkeys/pkey.h /usr/src/debug/ltp/20240524/testcases/lib/tst_sleep.c /usr/src/debug/ltp/20240524/include/tst_safe_pthread.h /usr/src/debug/ltp/20240524/include/safe_net_fn.h /usr/src/debug/ltp/20240524/include/old/usctest.h /usr/src/debug/ltp/20240524/include/tst_coredump.h 
 /usr/src/debug/ltp/20240524/include/tst_safe_sysv_ipc.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/prctl/prctl10.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ioctl/ioctl08.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/prctl/prctl08.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/rename/rename06.c /usr/src/debug/ltp/20240524/include/tst_kernel.h /usr/src/debug/ltp/20240524/include/tst_checkpoint.h /usr/src/debug/ltp/20240524/include/tst_crypto.h /usr/src/debug/ltp/20240524/include/old/random_range.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ioctl/ioctl06.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/prctl/prctl06.c /usr/src/debug/ltp/20240524/include/tst_timer.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/signalfd/signalfd01.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fork/fork09.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/prctl/prctl06.h /usr/src/debug/ltp/20240524/include/libnewipc.h /us
 r/src/debug/ltp/20240524/testcases/lib/tst_supported_fs.c /usr/src/debug/ltp/20240524/include/old/ltp_cpuid.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ioctl/ioctl04.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/prctl/prctl04.c /usr/src/debug/ltp/20240524/include/old/test.h /usr/src/debug/ltp/20240524/include/tst_test.h /usr/src/debug/ltp/20240524/include/tst_private.h /usr/src/debug/ltp/20240524/include/tst_get_bad_addr.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/rename/rename04.c /usr/src/debug/ltp/20240524/include/parse_vdso.h /usr/src/debug/ltp/20240524/include/lapi/rt_sigaction.h /usr/src/debug/ltp/20240524/include/lapi/ustat.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fork/fork07.c /usr/src/debug/ltp/20240524/include/tst_kconfig.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fork/fork01.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/rename/rename11.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/stat/stat0
 2.c /usr/src/debug/ltp/20240524/include/tst_safe_prw.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/rename/rename09.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/lstat/lstat01.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/open/open10.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/rename/rename08.c /usr/src/debug/ltp/20240524/include/tst_memutils.h /usr/src/debug/ltp/20240524/testcases/lib/tst_net_iface_prefix.c /usr/src/debug/ltp/20240524/testcases/lib/tst_ns_common.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/open/open02.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/open/open12.c /usr/src/debug/ltp/20240524/testcases/lib/tst_ns_ifmove.c /usr/src/debug/ltp/20240524/include/lapi/safe_rt_signal.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ioctl/ioctl_loop07.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/open/open14.c /usr/src/debug/ltp/20240524/testcases/lib/tst_ns_create.c /usr/src/debug/ltp/20240524/testc
 ases/kernel/syscalls/ioctl/ioctl_loop01.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ioctl/ioctl_loop02.c /usr/src/debug/ltp/20240524/include/tst_fs.h /usr/src/debug/ltp/20240524/include/tst_assert.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ioctl/ioctl_loop03.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ioctl/ioctl_loop04.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ioctl/ioctl_loop05.c /usr/src/debug/ltp/20240524/include/ipcmsg.h /usr/src/debug/ltp/20240524/include/lapi/futex.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ioctl/ioctl02.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/prctl/prctl02.c /usr/src/debug/ltp/20240524/include/tst_cmd.h /usr/src/debug/ltp/20240524/include/tst_path_has_mnt_flags.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ioctl/ioctl_sg01.c /usr/src/debug/ltp/20240524/include/lapi/pidfd.h /usr/src/debug/ltp/20240524/testcases/lib/tst_check_drivers.c /usr/src/debug/ltp/20240524/include/
 tst_fuzzy_sync.h /usr/src/debug/ltp/20240524/include/old/old_resource.h /usr/src/debug/ltp/20240524/include/tst_module.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ioctl/ioctl_ns03.c /usr/src/debug/ltp/20240524/include/ipcsem.h /usr/src/debug/ltp/20240524/include/tst_atomic.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/unlink/unlink07.c /usr/src/debug/ltp/20240524/include/tst_buffers.h /usr/src/debug/ltp/20240524/include/tst_taint.h /usr/src/debug/ltp/20240524/include/tst_sig_proc.h /usr/src/debug/ltp/20240524/include/lapi/keyctl.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ioctl/ioctl_ns05.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/unlink/unlink05.c /usr/src/debug/ltp/20240524/include/tst_hugepage.h /usr/src/debug/ltp/20240524/testcases/lib/tst_ns_exec.c /usr/src/debug/ltp/20240524/include/tst_rand_data.h /usr/src/debug/ltp/20240524/include/tst_parse.h /usr/src/debug/ltp/20240524/include/lapi/kcmp.h /usr/src/debug/ltp/20240524/include/ol
 d/old_module.h /usr/src/debug/ltp/20240524/include/lapi/epoll.h /usr/src/debug/ltp/20240524/include/tst_uinput.h /usr/src/debug/ltp/20240524/testcases/lib/tst_kvcmp.c /usr/src/debug/ltp/20240524/include/lapi/io_pgetevents.h /usr/src/debug/ltp/20240524/include/lapi/faccessat.h /usr/src/debug/ltp/20240524/include/lapi/init_module.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ioctl/ioctl_ns07.c /usr/src/debug/ltp/20240524/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget01.c /usr/src/debug/ltp/20240524/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget02.c /usr/src/debug/ltp/20240524/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c /usr/src/debug/ltp/20240524/include/tst_safe_macros_inline.h /usr/src/debug/ltp/20240524/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget05.c /usr/src/debug/ltp/20240524/include/tst_fd.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fork/fork_procs.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/chmod/chmod05.c /usr/src/deb
 ug/ltp/20240524/include/lapi/common_timers.h /usr/src/debug/ltp/20240524/include/lapi/fsmount.h /usr/src/debug/ltp/20240524/include/lapi/readdir.h /usr/src/debug/ltp/20240524/include/libswap.h /usr/src/debug/ltp/20240524/include/safe_macros_fn.h /usr/src/debug/ltp/20240524/include/tst_safe_io_uring.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ioctl/ioctl_ns01.c /usr/src/debug/ltp/20240524/include/lapi/bpf.h /usr/src/debug/ltp/20240524/testcases/lib/tst_secureboot_enabled.c /usr/src/debug/ltp/20240524/include/tst_test_macros.h /usr/src/debug/ltp/20240524/include/tst_security.h", added "/usr/src/debug/ltp/20240930/testcases/kernel/syscalls/rename/rename09.c /usr/src/debug/ltp/20240930/include/tst_checksum.h /usr/src/debug/ltp/20240930/include/tst_cpu.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/rename/rename10.c /usr/src/debug/ltp/20240930/libs/ujson/ujson_reader.c /usr/src/debug/ltp/20240930/libs/ujson/ujson_common.c /usr/src/debug/ltp/20240930/testcases/kernel/
 syscalls/fork/fork10.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioctl/ioctl04.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fork/fork08.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/rename/rename12.c /usr/src/debug/ltp/20240930/include/tst_capability.h /usr/src/debug/ltp/20240930/include/tst_uinput.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioctl/ioctl02.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/prctl/prctl02.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/rename/rename14.c /usr/src/debug/ltp/20240930/include/tst_private.h /usr/src/debug/ltp/20240930/include/tst_safe_sysv_ipc.h /usr/src/debug/ltp/20240930/include/tst_safe_pthread.h /usr/src/debug/ltp/20240930/testcases/lib/tst_get_free_pids.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/rename/rename07.c /usr/src/debug/ltp/20240930/testcases/lib/tst_check_drivers.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sigsuspend/sigsuspend02.c /usr/src/debu
 g/ltp/20240930/include/tst_get_bad_addr.h /usr/src/debug/ltp/20240930/include/safe_macros_fn.h /usr/src/debug/ltp/20240930/include/lapi/syscalls.h /usr/src/debug/ltp/20240930/include/tst_cmd.h /usr/src/debug/ltp/20240930/include/lapi/sched.h /usr/src/debug/ltp/20240930/include/tst_cgroup.h /usr/src/debug/ltp/20240930/include/tst_pid.h /usr/src/debug/ltp/20240930/include/lapi/io_uring.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/open/open09.c /usr/src/debug/ltp/20240930/include/tst_wallclock.h /usr/src/debug/ltp/20240930/include/tst_memutils.h /usr/src/debug/ltp/20240930/include/lapi/close_range.h /usr/src/debug/ltp/20240930/include/tst_netdevice.h /usr/src/debug/ltp/20240930/include/lapi/landlock.h /usr/src/debug/ltp/20240930/include/ipcmsg.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mseal/mseal01.c /usr/src/debug/ltp/20240930/include/tst_module.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/lstat/lstat03.c /usr/src/debug/ltp/20240930/include/old/old_
 device.h /usr/src/debug/ltp/20240930/testcases/lib/tst_hexdump.c /usr/src/debug/ltp/20240930/include/lapi/openat2.h /usr/src/debug/ltp/20240930/include/ipcsem.h /usr/src/debug/ltp/20240930/include/tst_assert.h /usr/src/debug/ltp/20240930/testcases/lib/tst_res_.c /usr/src/debug/ltp/20240930/include/tst_net.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/lstat/lstat01.c /usr/src/debug/ltp/20240930/include/lapi/rt_sigaction.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/prctl/prctl06.h /usr/src/debug/ltp/20240930/include/tst_safe_file_ops.h /usr/src/debug/ltp/20240930/include/lapi/keyctl.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/prctl/prctl06.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioctl/ioctl06.c /usr/src/debug/ltp/20240930/include/lapi/fs.h /usr/src/debug/ltp/20240930/include/time64_variants.h /usr/src/debug/ltp/20240930/include/tst_ansi_color.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fork/fork03.c /usr/src/debug/ltp/202409
 30/testcases/kernel/syscalls/shutdown/shutdown01.c /usr/src/debug/ltp/20240930/include/lapi/watch_queue.h /usr/src/debug/ltp/20240930/include/safe_net_fn.h /usr/src/debug/ltp/20240930/include/tst_mkfs.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/landlock/landlock05.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/open/open07.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/cachestat/cachestat02.c /usr/src/debug/ltp/20240930/include/old/safe_macros.h /usr/src/debug/ltp/20240930/include/tst_safe_macros.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/prctl/prctl06_execve.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/rename/rename11.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/rename/rename06.c /usr/src/debug/ltp/20240930/include/tst_epoll.h /usr/src/debug/ltp/20240930/include/tst_safe_io_uring.h /usr/src/debug/ltp/20240930/testcases/lib/tst_ns_exec.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/rename/rename13.c /usr/src/de
 bug/ltp/20240930/testcases/kernel/syscalls/landlock/landlock07.c /usr/src/debug/ltp/20240930/include/tst_safe_macros_inline.h /usr/src/debug/ltp/20240930/include/ujson_common.h /usr/src/debug/ltp/20240930/include/ujson_reader.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/prctl/prctl07.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fork/fork09.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/open/open01.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/open/open11.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/rename/rename04.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/rename/rename05.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/stat/stat01.c /usr/src/debug/ltp/20240930/include/tst_kconfig.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/getcpu/getcpu02.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/rename/rename15.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/rename/rename03.c /usr/src/debug/lt
 p/20240930/testcases/kernel/syscalls/open/open03.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fchmodat2/fchmodat2_01.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/landlock/landlock01.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/open/open13.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/stat/stat03.c /usr/src/debug/ltp/20240930/include/tst_process_state.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioctl/ioctl_sg01.c /usr/src/debug/ltp/20240930/testcases/lib/tst_getconf.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/rename/rename01.c /usr/src/debug/ltp/20240930/include/parse_vdso.h /usr/src/debug/ltp/20240930/include/lapi/futex.h /usr/src/debug/ltp/20240930/include/tst_fuzzy_sync.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/open/open08.c /usr/src/debug/ltp/20240930/include/tst_rand_data.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioctl/ioctl_ns05.c /usr/src/debug/ltp/20240930/testcases/lib/tst_rod.c /u
 sr/src/debug/ltp/20240930/include/lapi/pkey.h /usr/src/debug/ltp/20240930/include/lapi/init_module.h /usr/src/debug/ltp/20240930/include/libswap.h /usr/src/debug/ltp/20240930/include/tst_crypto.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioctl/ioctl_ns07.c /usr/src/debug/ltp/20240930/include/lapi/bpf.h /usr/src/debug/ltp/20240930/include/safe_file_ops_fn.h /usr/src/debug/ltp/20240930/include/old/old_module.h /usr/src/debug/ltp/20240930/include/tst_af_alg.h /usr/src/debug/ltp/20240930/include/tst_hugepage.h /usr/src/debug/ltp/20240930/include/lapi/faccessat.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/mseal/mseal02.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioctl/ioctl_ns01.c /usr/src/debug/ltp/20240930/testcases/lib/tests/shell_test01.c /usr/src/debug/ltp/20240930/include/tst_atomic.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/unlink/unlink08.c /usr/src/debug/ltp/20240930/include/tst_buffers.h /usr/src/debug/ltp/20240930/testcases/kerne
 l/syscalls/fork/fork01.c /usr/src/debug/ltp/20240930/include/lapi/ustat.h /usr/src/debug/ltp/20240930/include/lapi/safe_rt_signal.h /usr/src/debug/ltp/20240930/testcases/lib/tests/shell_test03.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/cachestat/cachestat03.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/landlock/landlock_exec.c /usr/src/debug/ltp/20240930/include/tst_clone.h /usr/src/debug/ltp/20240930/include/lapi/common_timers.h /usr/src/debug/ltp/20240930/include/tst_coredump.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/chmod/chmod07.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/landlock/landlock04.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget01.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget02.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget05.c /usr/src/de
 bug/ltp/20240930/include/lapi/kcmp.h /usr/src/debug/ltp/20240930/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget06.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fork/fork04.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fork/fork14.c /usr/src/debug/ltp/20240930/include/tst_bool_expr.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/cachestat/cachestat01.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/shutdown/shutdown02.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/landlock/landlock06.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/unlink/unlink05.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioctl/ioctl09.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/prctl/prctl09.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/rename/rename08.c /usr/src/debug/ltp/20240930/include/lapi/io_pgetevents.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/cachestat/cachestat04.c /usr/src/debug/ltp/20240930/testcases/ke
 rnel/syscalls/getcpu/getcpu01.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/landlock/landlock03.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/open/open10.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/unlink/unlink10.c /usr/src/debug/ltp/20240930/include/lapi/quotactl.h /usr/src/debug/ltp/20240930/testcases/lib/tst_device.c /usr/src/debug/ltp/20240930/testcases/lib/tst_random.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/open/open02.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/open/open12.c /usr/src/debug/ltp/20240930/include/old/ltp_cpuid.h /usr/src/debug/ltp/20240930/include/lapi/pidfd.h /usr/src/debug/ltp/20240930/include/tst_timer_test.h /usr/src/debug/ltp/20240930/include/tst_uid.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/chmod/chmod09.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fchmodat2/fchmodat2_02.c /usr/src/debug/ltp/20240930/include/tst_safe_file_at.h /usr/src/debug/ltp/20240930/testcases/kernel/sy
 scalls/chmod/chmod01.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioctl/ioctl_ficlonerange01.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioctl/ioctl_ficlonerange02.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/prctl/prctl10.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fork/fork_procs.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/stat/stat02.c /usr/src/debug/ltp/20240930/testcases/lib/tst_net_iface_prefix.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioctl/ioctl_ns04.c /usr/src/debug/ltp/20240930/testcases/lib/tst_checkpoint.c /usr/src/debug/ltp/20240930/include/lapi/stat.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/request_key/request_key01.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/request_key/request_key02.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioctl/ioctl_ficlone02.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/request_key/request_key03.c /usr/src/debug/ltp/20240930/i
 nclude/tst_safe_clocks.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/request_key/request_key04.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/request_key/request_key05.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/request_key/request_key06.c /usr/src/debug/ltp/20240930/include/tst_safe_prw.h /usr/src/debug/ltp/20240930/include/tst_security.h /usr/src/debug/ltp/20240930/include/tst_sig_proc.h /usr/src/debug/ltp/20240930/include/tst_sys_conf.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioctl/ioctl_ns06.c /usr/src/debug/ltp/20240930/testcases/lib/tst_cgctl.c /usr/src/debug/ltp/20240930/include/ujson_utf.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/open/open15.c /usr/src/debug/ltp/20240930/include/old/old_tmpdir.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioctl/ioctl_ns03.c /usr/src/debug/ltp/20240930/include/tst_fs.h /usr/src/debug/ltp/20240930/include/lapi/fsmount.h /usr/src/debug/ltp/20240930/include/lapi/readdir.h /usr/s
 rc/debug/ltp/20240930/testcases/lib/tests/shell_test06.c /usr/src/debug/ltp/20240930/testcases/lib/tests/shell_test05.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/signalfd/signalfd02.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/cachestat/cachestat.h /usr/src/debug/ltp/20240930/testcases/lib/tst_check_kconfigs.c /usr/src/debug/ltp/20240930/include/tst_test_macros.h /usr/src/debug/ltp/20240930/include/lapi/sem.h /usr/src/debug/ltp/20240930/testcases/lib/tests/shell_test02.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/unlink/unlink09.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioctl/ioctl07.c /usr/src/debug/ltp/20240930/include/tst_device.h /usr/src/debug/ltp/20240930/testcases/lib/tst_net_ip_prefix.c /usr/src/debug/ltp/20240930/include/tst_checkpoint_fn.h /usr/src/debug/ltp/20240930/include/old/test.h /usr/src/debug/ltp/20240930/include/tst_kernel.h /usr/src/debug/ltp/20240930/include/tst_safe_posix_ipc.h /usr/src/debug/ltp/20240930/include/
 tst_checkpoint.h /usr/src/debug/ltp/20240930/include/tst_test.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/chmod/chmod06.c /usr/src/debug/ltp/20240930/testcases/lib/tst_fsfreeze.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioctl/ioctl05.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/prctl/prctl05.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/chmod/chmod08.c /usr/src/debug/ltp/20240930/include/lapi/fanotify.h /usr/src/debug/ltp/20240930/include/tst_path_has_mnt_flags.h /usr/src/debug/ltp/20240930/include/tst_timer.h /usr/src/debug/ltp/20240930/include/tst_arch.h /usr/src/debug/ltp/20240930/include/tst_parse.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/fork/fork07.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioctl/ioctl08.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/landlock/landlock02.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/prctl/prctl08.c /usr/src/debug/ltp/20240930/testcases/lib/tst_secureboot
 _enabled.c /usr/src/debug/ltp/20240930/testcases/lib/tst_timeout_kill.c /usr/src/debug/ltp/20240930/include/tst_rtctime.h /usr/src/debug/ltp/20240930/include/tst_kvercmp.h /usr/src/debug/ltp/20240930/include/tst_res_flags.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/open/open12_child.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/sigsuspend/sigsuspend01.c /usr/src/debug/ltp/20240930/include/tst_taint.h /usr/src/debug/ltp/20240930/testcases/lib/tst_run_shell.c /usr/src/debug/ltp/20240930/testcases/lib/tst_get_unused_port.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioctl/ioctl_loop01.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioctl/ioctl_loop02.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioctl/ioctl_loop03.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioctl/ioctl_loop04.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioctl/ioctl_loop05.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioctl/ioctl_loop06.c
  /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioctl/ioctl_loop07.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/unlink/unlink07.c /usr/src/debug/ltp/20240930/include/libsigwait.h /usr/src/debug/ltp/20240930/include/tst_tmpdir.h /usr/src/debug/ltp/20240930/include/libnewipc.h /usr/src/debug/ltp/20240930/include/tst_fd.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioctl/ioctl03.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/prctl/prctl03.c /usr/src/debug/ltp/20240930/include/lapi/name_to_handle_at.h /usr/src/debug/ltp/20240930/include/tst_safe_timerfd.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioctl/ioctl_ficlone03.c /usr/src/debug/ltp/20240930/include/safe_stdio_fn.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/stat/stat04.c /usr/src/debug/ltp/20240930/testcases/lib/tst_kvcmp.c /usr/src/debug/ltp/20240930/include/lapi/epoll.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/open/open04.c /usr/src/debug/ltp/20240930/testc
 ases/kernel/syscalls/chmod/chmod03.c /usr/src/debug/ltp/20240930/include/old/ltp_priv.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/open/open14.c /usr/src/debug/ltp/20240930/include/old/old_resource.h /usr/src/debug/ltp/20240930/testcases/lib/tst_lockdown_enabled.c /usr/src/debug/ltp/20240930/testcases/lib/tst_ns_common.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/chmod/chmod05.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioctl/ioctl_ficlone01.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/open/open06.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/lstat/lstat02.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/signalfd/signalfd01.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/landlock/landlock_tester.h /usr/src/debug/ltp/20240930/include/old/tlibio.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioctl/ioctl_ficlone04.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioctl/ioctl_ns02.c /usr/src/debug/ltp/2
 0240930/testcases/kernel/syscalls/landlock/landlock_common.h /usr/src/debug/ltp/20240930/testcases/lib/tst_ns_create.c /usr/src/debug/ltp/20240930/testcases/lib/tst_net_vars.c /usr/src/debug/ltp/20240930/testcases/lib/tst_ns_ifmove.c /usr/src/debug/ltp/20240930/include/old/random_range.h /usr/src/debug/ltp/20240930/include/tst_clocks.h /usr/src/debug/ltp/20240930/testcases/lib/tests/shell_test04.c /usr/src/debug/ltp/20240930/include/lapi/membarrier.h /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/ioctl/ioctl01.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/pkeys/pkey01.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/prctl/prctl01.c /usr/src/debug/ltp/20240930/testcases/kernel/syscalls/seccomp/seccomp01.c /usr/src/debug/ltp/20240930/testcases/lib/tst_get_median.c /usr/src/debug/ltp/20240930/testcases/lib/tst_supported_fs.c /usr/src/debug/ltp/20240930/include/lapi/mman.h /usr/src/debug/ltp/20240930/testcases/lib/tst_sleep.c /usr/src/debug/ltp/20240930/testcases
 /kernel/syscalls/fork/fork13.c /usr/src/debug/ltp/20240930/include/old/usctest.h /usr/src/debug/ltp/20240930/include/tst_sched.h /usr/src/debug/ltp/20240930/include/tst_netlink.h"
packages/core2-64-poky-linux/ltp/ltp-staticdev: PKGV changed from 20240524 [default] to 20240930 [default]
packages/core2-64-poky-linux/ltp/ltp-staticdev: PV changed from "20240524" to "20240930"
packages/core2-64-poky-linux/ltp/ltp: PKGV changed from 20240524 [default] to 20240930 [default]
packages/core2-64-poky-linux/ltp/ltp: PKGSIZE changed from 439302540 to 453267618 (+3%)
packages/core2-64-poky-linux/ltp/ltp: PV changed from "20240524" to "20240930"
packages/core2-64-poky-linux/ltp/ltp: FILELIST: removed "/opt/ltp/testcases/realtime/func/sched_football/run_auto.sh /opt/ltp/testcases/realtime/func/sched_football/sched_football /opt/ltp/testcases/bin/prctl04", added "/opt/ltp/testcases/bin/unlink10 /opt/ltp/testcases/bin/seccomp01 /opt/ltp/testcases/bin/hugeshmget06 /opt/ltp/testcases/bin/getcpu02 /opt/ltp/testcases/bin/tst_res_ /opt/ltp/testcases/bin/cachestat04 /opt/ltp/testcases/bin/cachestat02 /opt/ltp/testcases/bin/cachestat03 /opt/ltp/testcases/bin/cachestat01 /opt/ltp/testcases/bin/ioctl_ficlone03 /opt/ltp/testcases/bin/signalfd02 /opt/ltp/testcases/bin/landlock_exec /opt/ltp/testcases/bin/tst_env.sh /opt/ltp/testcases/bin/landlock05 /opt/ltp/testcases/bin/landlock04 /opt/ltp/testcases/bin/landlock07 /opt/ltp/testcases/bin/landlock06 /opt/ltp/testcases/bin/fchmodat2_02 /opt/ltp/testcases/bin/landlock01 /opt/ltp/testcases/bin/landlock03 /opt/ltp/testcases/bin/fchmodat2_01 /opt/ltp/testcases/bin/landlock02 /opt/ltp/testcases/
 bin/request_key06 /opt/ltp/testcases/bin/tst_run_shell /opt/ltp/testcases/bin/stat04 /opt/ltp/testcases/bin/open15 /opt/ltp/testcases/bin/tst_loader.sh /opt/ltp/testcases/bin/nfsstat02.sh /opt/ltp/testcases/bin/shell_test01 /opt/ltp/testcases/bin/shell_test02 /opt/ltp/testcases/bin/shell_test03 /opt/ltp/testcases/bin/shell_test04 /opt/ltp/testcases/bin/shell_test05 /opt/ltp/testcases/bin/shell_test06 /opt/ltp/testcases/bin/chmod09 /opt/ltp/testcases/bin/chmod08 /opt/ltp/testcases/bin/shutdown02 /opt/ltp/testcases/bin/mseal02 /opt/ltp/testcases/bin/sched_football /opt/ltp/testcases/bin/shutdown01 /opt/ltp/testcases/bin/mseal01 /opt/ltp/testcases/bin/ioctl_ficlonerange01 /opt/ltp/testcases/bin/ioctl_ficlonerange02 /opt/ltp/testcases/bin/lstat03 /opt/ltp/testcases/bin/run_tests.sh /opt/ltp/testcases/bin/lstat03_64 /opt/ltp/testcases/bin/ioctl_ficlone04 /opt/ltp/testcases/bin/sigsuspend02 /opt/ltp/testcases/bin/rename15 /opt/ltp/testcases/bin/ioctl_ficlone01 /opt/ltp/testcases/bin/ioctl
 _ficlone02 /opt/ltp/testcases/bin/stat04_64"
Changes to packages/core2-64-poky-linux/ltp (sysroot):
  /opt/ltp/include/tst_tmpdir.h was added
  /opt/ltp/include/ujson_common.h was added
  /opt/ltp/include/ujson.h was added
  /opt/ltp/include/ujson_reader.h was added
  /opt/ltp/include/ujson_utf.h was added
  /opt/ltp/include/ujson_writer.h was added

--===============9072073258114988110==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ltp-upgrade-20240524-20240930.patch"

RnJvbSAyODhkN2FmODliZTE5Mjc0NDMxOWJkZjgwNjFjNTE2ZmNiODBjYTgwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMDM6MzI6MzIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
dHA6IHVwZ3JhZGUgMjAyNDA1MjQgLT4gMjAyNDA5MzAKCi0tLQogLi4uL2x0cC9sdHAvMDAwMS1B
ZGQtX19jbGVhcl9jYWNoZS1kZWNsYXJhdGlvbi1mb3ItY2xhbmcucGF0Y2ggIHwgMiArLQogLi4u
L2x0cC9sdHAvMDAwMS1SZW1vdmUtT09NLXRlc3RzLWZyb20tcnVudGVzdC1tbS5wYXRjaCAgICAg
ICAgIHwgMiArLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC97bHRwXzIwMjQwNTI0LmJiID0+
IGx0cF8yMDI0MDkzMC5iYn0gIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC97bHRw
XzIwMjQwNTI0LmJiID0+IGx0cF8yMDI0MDkzMC5iYn0gKDk5JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbHRwL2x0cC8wMDAxLUFkZC1fX2NsZWFyX2NhY2hlLWRlY2xhcmF0
aW9uLWZvci1jbGFuZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sdHAvbHRwLzAwMDEt
QWRkLV9fY2xlYXJfY2FjaGUtZGVjbGFyYXRpb24tZm9yLWNsYW5nLnBhdGNoCmluZGV4IGFkZTZh
NTJiNjMuLmZkNzFjZDg1ZjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sdHAv
bHRwLzAwMDEtQWRkLV9fY2xlYXJfY2FjaGUtZGVjbGFyYXRpb24tZm9yLWNsYW5nLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sdHAvbHRwLzAwMDEtQWRkLV9fY2xlYXJfY2FjaGUt
ZGVjbGFyYXRpb24tZm9yLWNsYW5nLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyZDM4NGYy
Njg3OTFlY2Q1ZmYwZjI2YzgxMzdkZDRkZTBhMWM0NTY2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSA0NzRmZjNjNGYxMTc1Y2MwMjU0OGEzMTEwZmFiOTU3OWNhNDJkYTFmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERh
dGU6IE1vbiwgMTAgSnVuIDIwMjQgMjI6NTI6NTYgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gQWRk
IF9fY2xlYXJfY2FjaGUgZGVjbGFyYXRpb24gZm9yIGNsYW5nCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvbHRwL2x0cC8wMDAxLVJlbW92ZS1PT00tdGVzdHMtZnJvbS1ydW50ZXN0
LW1tLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9sdHAvMDAwMS1SZW1vdmUtT09N
LXRlc3RzLWZyb20tcnVudGVzdC1tbS5wYXRjaAppbmRleCA1YjZjNzgwYmVjLi45N2YyNjFlNWU5
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHRwL2x0cC8wMDAxLVJlbW92ZS1P
T00tdGVzdHMtZnJvbS1ydW50ZXN0LW1tLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9sdHAvbHRwLzAwMDEtUmVtb3ZlLU9PTS10ZXN0cy1mcm9tLXJ1bnRlc3QtbW0ucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIDc2ODE1OWFhNTMyNTdkMjQ3NjQ1YTEyNTE4Nzc4ZjUwYjhmZGY1
NzggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGQ2ZTJkOWU3M2RhZDkyMGI1ZTQ5YWFh
OTRmODZiYWIyNzc5YzMzNjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiAiTWluZ2Rl
IChNYXR0aGV3KSBaZW5nIiA8bWF0dGhld3ptZEBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDI5IEp1
bCAyMDIwIDA4OjQ3OjA5IC0wNDAwCiBTdWJqZWN0OiBbUEFUQ0hdIFJlbW92ZSBPT00gdGVzdHMg
ZnJvbSBydW50ZXN0L21tCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHRwL2x0
cF8yMDI0MDUyNC5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sdHAvbHRwXzIwMjQwOTMwLmJi
CnNpbWlsYXJpdHkgaW5kZXggOTklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9s
dHAvbHRwXzIwMjQwNTI0LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHRwL2x0
cF8yMDI0MDkzMC5iYgppbmRleCA2YjQ2NzIzNDc4Li5hYzhiZWE0MjQ0IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHRwL2x0cF8yMDI0MDUyNC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvbHRwL2x0cF8yMDI0MDkzMC5iYgpAQCAtMjQsNyArMjQsNyBAQCBUVU5FX0ND
QVJHUzpyZW1vdmU6eDg2LTY0ID0gIi1tZnBtYXRoPXNzZSIKIAogQ0ZMQUdTOmFwcGVuZDpwb3dl
cnBjNjQgPSAiIC1EX19TQU5FX1VTRVJTUEFDRV9UWVBFU19fIgogQ0ZMQUdTOmFwcGVuZDptaXBz
YXJjaG42NCA9ICIgLURfX1NBTkVfVVNFUlNQQUNFX1RZUEVTX18iCi1TUkNSRVYgPSAiOGYyMWVi
YmE0MjIxNmRiYjdlOGQ0NGMyM2I0YTk3N2Q2ODIzZjdhMSIKK1NSQ1JFViA9ICI2MGY4MTQxOWM0
M2Y5NGVjMTgyODI3ZWYwYjllYjViYWViMzAzNDE5IgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1
Yi5jb20vbGludXgtdGVzdC1wcm9qZWN0L2x0cC5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1o
dHRwcyBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLVJlbW92ZS1PT00tdGVzdHMtZnJvbS1ydW50
ZXN0LW1tLnBhdGNoIFwKLS0gCjIuNDQuMQoK

--===============9072073258114988110==--

