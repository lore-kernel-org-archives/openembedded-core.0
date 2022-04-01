Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C5C3C4321E
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 13:23:41 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web09.10395.1648819420026726458
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 06:23:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=nMDCFJ3J;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 0101017fe54bb56e-bf03b649-a694-4f0a-b7f8-6e64217302d5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1648819419;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tCgvp1fe9W5OdC8nbdlM7WpPd9zyAoV/PyX6HlmjY8A=;
	b=nMDCFJ3Jh9fRkadFxj3h+mMrYnXPBZFAj4acwPYy5iruWMJWae2k0lRsYsW4Szle
	r5KphBkk9bx86IFYn2wyMxILhKT0MeNu5FrbyVtYKMGHMCKhgl/G8nZuDZ7c6RZKshE
	kUOP89k+FWq/gZv9zabiV8jAq8NnherykXoIKLE0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1648819419;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tCgvp1fe9W5OdC8nbdlM7WpPd9zyAoV/PyX6HlmjY8A=;
	b=eKVhQM5pk1j8CayhZQOhiO6fmlzJD+22dTq+WVJ3sh0aaLQ8YBMg17IG7mM7zxNH
	mI4vLmrZkGo137IVhjiPBTzmjUwrJe/kVqnb8t2Hnp+LQQkpHpFI2EZFO9/F+oApXbu
	gs8+7U9PR6aPckYiuBsX+VNoBCZ1Idmytz6Isi8E=
Content-Type: multipart/mixed; boundary="===============8330132453415009841=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysvinit: upgrading to 3.02 FAILED
Message-ID: 
 <0101017fe54bb56e-bf03b649-a694-4f0a-b7f8-6e64217302d5-000000@us-west-2.amazonses.com>
Date: Fri, 1 Apr 2022 13:23:38 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 13:23:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163889

--===============8330132453415009841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sysvinit* to *3.02* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-sysvinit-upgrade-3.01-3.02.patch
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
--===============8330132453415009841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/sysvinit: PKGV changed from 3.01 [default] to 3.02 [default]
packages/core2-32-poky-linux/sysvinit: SRC_URI changed from "https://download.savannah.gnu.org/releases/sysvinit/sysvinit-3.01.tar.xz file://install.patch file://crypt-lib.patch file://pidof-add-m-option.patch file://realpath.patch file://0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch file://rcS-default file://rc file://rcS file://bootlogd.init file://01_bootlogd" to "https://download.savannah.gnu.org/releases/sysvinit/sysvinit-3.02.tar.xz file://install.patch file://crypt-lib.patch file://pidof-add-m-option.patch file://realpath.patch file://0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch file://rcS-default file://rc file://rcS file://bootlogd.init file://01_bootlogd"
packages/core2-32-poky-linux/sysvinit: PV changed from "3.01" to "3.02"
packages/core2-32-poky-linux/sysvinit/sysvinit-dbg: PKGV changed from 3.01 [default] to 3.02 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit-dbg: PV changed from "3.01" to "3.02"
packages/core2-32-poky-linux/sysvinit/sysvinit-dbg: PKGSIZE changed from 487324 to 492116 (+1%)
packages/core2-32-poky-linux/sysvinit/sysvinit-dev: PKGV changed from 3.01 [default] to 3.02 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit-dev: PV changed from "3.01" to "3.02"
packages/core2-32-poky-linux/sysvinit/sysvinit-doc: PKGV changed from 3.01 [default] to 3.02 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit-doc: PV changed from "3.01" to "3.02"
packages/core2-32-poky-linux/sysvinit/sysvinit-doc: PKGSIZE changed from 76140 to 78058 (+3%)
packages/core2-32-poky-linux/sysvinit/sysvinit-locale: PKGV changed from 3.01 [default] to 3.02 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit-locale: PV changed from "3.01" to "3.02"
packages/core2-32-poky-linux/sysvinit/sysvinit-pidof: PKGV changed from 3.01 [default] to 3.02 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit-pidof: PV changed from "3.01" to "3.02"
packages/core2-32-poky-linux/sysvinit/sysvinit-src: PKGV changed from 3.01 [default] to 3.02 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit-src: PV changed from "3.01" to "3.02"
packages/core2-32-poky-linux/sysvinit/sysvinit-src: PKGSIZE changed from 267051 to 267960 (+0%)
packages/core2-32-poky-linux/sysvinit/sysvinit-staticdev: PKGV changed from 3.01 [default] to 3.02 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit-staticdev: PV changed from "3.01" to "3.02"
packages/core2-32-poky-linux/sysvinit/sysvinit-sulogin: PKGV changed from 3.01 [default] to 3.02 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit-sulogin: PV changed from "3.01" to "3.02"
packages/core2-32-poky-linux/sysvinit/sysvinit: PKGV changed from 3.01 [default] to 3.02 [default]
packages/core2-32-poky-linux/sysvinit/sysvinit: PV changed from "3.01" to "3.02"

--===============8330132453415009841==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-sysvinit-upgrade-3.01-3.02.patch"

From b56bdfa1145f3bbf7407695d209950de526f22dd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Apr 2022 06:16:57 +0000
Subject: [PATCH] sysvinit: upgrade 3.01 -> 3.02

---
 .../sysvinit/sysvinit/pidof-add-m-option.patch         | 10 +++++-----
 .../sysvinit/{sysvinit_3.01.bb => sysvinit_3.02.bb}    |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-core/sysvinit/{sysvinit_3.01.bb => sysvinit_3.02.bb} (98%)

diff --git a/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch b/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
index 4386e6f832..f4937d1f4e 100644
--- a/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
+++ b/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
@@ -1,4 +1,4 @@
-From 96fb53ef2ccd2580cf0aa565ef1629cb05eae50a Mon Sep 17 00:00:00 2001
+From 4ab08d461daad709c6620a33d12b949d7f05008e Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 24 Jul 2013 17:07:22 +0800
 Subject: [PATCH] pidof: add -m option
@@ -21,10 +21,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  2 files changed, 65 insertions(+), 3 deletions(-)
 
 diff --git a/man/pidof.8 b/man/pidof.8
-index 84ed1e4..ac184da 100644
+index 6866cb3..a87d878 100644
 --- a/man/pidof.8
 +++ b/man/pidof.8
-@@ -25,6 +25,7 @@ pidof -- find the process ID of a running program.
+@@ -25,6 +25,7 @@ pidof - find the process ID of a running program
  .RB [ \-n ]
  .RB [ \-x ]
  .RB [ \-z ]
@@ -32,9 +32,9 @@ index 84ed1e4..ac184da 100644
  .RB [ \-o
  .IR omitpid[,omitpid...] ]
  .RB [ \-o
-@@ -79,6 +80,11 @@ is shown. The default separator is a space.
+@@ -77,6 +78,11 @@ is shown. The default separator is a space.
  Tells \fIpidof\fP to omit processes with that process id. The special
- pid \fB%PPID\fP can be used to name the parent process of the \fIpidof\fP
+ pid \fB%PPID\fP can be used to name the parent process of the \fBpidof\fP
  program, in other words the calling shell or shell script.
 +.IP -m
 +When used with -o, will also omit any processes that have the same
diff --git a/meta/recipes-core/sysvinit/sysvinit_3.01.bb b/meta/recipes-core/sysvinit/sysvinit_3.02.bb
similarity index 98%
rename from meta/recipes-core/sysvinit/sysvinit_3.01.bb
rename to meta/recipes-core/sysvinit/sysvinit_3.02.bb
index 844f5f0175..6e77003e08 100644
--- a/meta/recipes-core/sysvinit/sysvinit_3.01.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_3.02.bb
@@ -21,7 +21,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.xz \
            file://bootlogd.init \
            file://01_bootlogd \
            "
-SRC_URI[sha256sum] = "68b11a4772cdacce5fb65a4cbead324a2ce3999d138b4ff61dc2d59e57ef5793"
+SRC_URI[sha256sum] = "4ca03ffdbefb5a99a60b94a021693686c2b498a08ff8aa4e859821fa7c39a792"
 
 S = "${WORKDIR}/sysvinit-${PV}"
 
-- 
2.27.0


--===============8330132453415009841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1641 targets, 50 skipped, 0 masked, 0 errors.
Removing 11 recipes from the core2-32 sysroot...done.
Removing 11 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3a2ed8326ca381d0ae3b6d8cb86531ae9563140c"
workspace            = "master:ee5f9d9fdd7d09aa3a86a19d07e3e64851ddc686"

Initialising tasks...done.
Sstate summary: Wanted 60 Local 37 Mirrors 0 Missed 23 Current 124 (61% match, 87% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 148 of 184 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 149 of 184 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 150 of 184 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 541 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_fetch)
NOTE: Running task 545 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_3.02.bb:do_fetch)
NOTE: Running task 546 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: Running task 547 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_fetch)
NOTE: Running task 554 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.62.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_fetch: Started
NOTE: recipe initscripts-1.0-r155: task do_fetch: Started
NOTE: recipe init-system-helpers-1.62-r0: task do_fetch: Started
NOTE: recipe sysvinit-3.02-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_fetch: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_fetch: Succeeded
NOTE: Running task 564 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_unpack)
NOTE: Running task 565 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-passwd-3.5.29-r0: task do_fetch: Succeeded
NOTE: recipe init-system-helpers-1.62-r0: task do_fetch: Succeeded
NOTE: recipe sysvinit-3.02-r0: task do_fetch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_fetch: Succeeded
NOTE: Running task 566 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_unpack)
NOTE: Running task 567 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_3.02.bb:do_unpack)
NOTE: Running task 568 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.62.bb:do_unpack)
NOTE: Running task 569 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: Running task 570 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_unpack: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe init-system-helpers-1.62-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_unpack: Started
NOTE: recipe sysvinit-3.02-r0: task do_unpack: Started
NOTE: Running setscene task 152 of 184 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_packagedata_setscene)
NOTE: Running task 571 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_patch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 154 of 184 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_unpack: Succeeded
NOTE: Running task 580 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_patch)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_patch: Started
NOTE: recipe init-system-helpers-1.62-r0: task do_unpack: Succeeded
NOTE: Running task 581 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.62.bb:do_patch)
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_patch: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_patch: Succeeded
NOTE: recipe init-system-helpers-1.62-r0: task do_patch: Started
NOTE: recipe sysvinit-3.02-r0: task do_unpack: Succeeded
NOTE: Running task 582 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_deploy_source_date_epoch)
NOTE: Running task 583 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_3.02.bb:do_patch)
NOTE: recipe initscripts-1.0-r155: task do_unpack: Succeeded
NOTE: Running task 584 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe init-system-helpers-1.62-r0: task do_patch: Succeeded
NOTE: Running task 585 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.62.bb:do_deploy_source_date_epoch)
NOTE: recipe sysvinit-3.02-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_patch: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 157 of 184 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_packagedata_setscene)
NOTE: recipe init-system-helpers-1.62-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 159 of 184 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 588 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_configure)
NOTE: recipe initscripts-1.0-r155: task do_patch: Succeeded
NOTE: Running task 589 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe init-system-helpers-1.62-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 161 of 184 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_configure: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_patch: Succeeded
NOTE: Running task 590 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_configure: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+6d8a515796-r0: task do_packagedata_setscene: Started
NOTE: recipe sysvinit-3.02-r0: task do_patch: Succeeded
NOTE: Running task 591 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_compile)
NOTE: Running task 592 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_3.02.bb:do_deploy_source_date_epoch)
NOTE: Running task 593 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_3.02.bb:do_populate_lic)
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 162 of 184 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_compile: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sysvinit-3.02-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sysvinit-3.02-r0: task do_populate_lic: Started
NOTE: Running task 596 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_configure)
NOTE: recipe musl-1.2.2+gitAUTOINC+6d8a515796-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_compile: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+6d8a515796-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 165 of 184 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 166 of 184 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 167 of 184 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: Running task 597 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_install)
NOTE: recipe initscripts-1.0-r155: task do_configure: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sysvinit-3.02-r0: task do_populate_lic: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_configure: Succeeded
NOTE: recipe sysvinit-3.02-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+6d8a515796-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_3.02.bb:do_populate_lic unihash changed to 761b16d1353d5e5d2212fc6b9f972fdeb0195a3817bb1fe9065e8647fdea5e78
NOTE: Running setscene task 169 of 184 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 171 of 184 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running task 604 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_compile)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_compile: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_install: Started
NOTE: recipe initscripts-1.0-r155: task do_compile: Succeeded
NOTE: Running task 605 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_install)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 177 of 184 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_install: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_install: Succeeded
NOTE: Running task 620 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_package)
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package: Started
NOTE: recipe initscripts-1.0-r155: task do_install: Succeeded
NOTE: Running task 621 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package)
NOTE: recipe initscripts-1.0-r155: task do_package: Started
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 181 of 184 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 182 of 184 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package: Succeeded
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 638 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_packagedata)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_packagedata: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 694 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_prepare_recipe_sysroot)
NOTE: Running task 706 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.62.bb:do_prepare_recipe_sysroot)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_packagedata: Succeeded
NOTE: Running task 707 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_package_write_rpm)
NOTE: recipe init-system-helpers-1.62-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package_write_rpm: Started
NOTE: recipe init-system-helpers-1.62-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 708 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.62.bb:do_configure)
NOTE: Running noexec task 709 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.62.bb:do_compile)
NOTE: Running task 710 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.62.bb:do_install)
NOTE: recipe base-passwd-3.5.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 711 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_configure)
NOTE: recipe init-system-helpers-1.62-r0: task do_install: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_configure: Started
NOTE: recipe init-system-helpers-1.62-r0: task do_install: Succeeded
NOTE: Running task 712 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.62.bb:do_package)
NOTE: recipe sysvinit-inittab-2.88dsf-r10: task do_package_write_rpm: Succeeded
NOTE: recipe init-system-helpers-1.62-r0: task do_package: Started
NOTE: recipe initscripts-1.0-r155: task do_package: Succeeded
NOTE: Running task 713 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata)
NOTE: recipe initscripts-1.0-r155: task do_packagedata: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata: Succeeded
NOTE: recipe init-system-helpers-1.62-r0: task do_package: Succeeded
NOTE: Running task 714 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.62.bb:do_packagedata)
NOTE: recipe init-system-helpers-1.62-r0: task do_packagedata: Started
NOTE: recipe init-system-helpers-1.62-r0: task do_packagedata: Succeeded
NOTE: Running task 715 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm)
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_configure: Succeeded
NOTE: Running task 716 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_compile)
NOTE: recipe base-passwd-3.5.29-r0: task do_compile: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_compile: Succeeded
NOTE: Running task 717 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_install)
NOTE: recipe base-passwd-3.5.29-r0: task do_install: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_install: Succeeded
NOTE: Running task 718 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot)
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 719 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package)
NOTE: Running task 720 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_3.02.bb:do_prepare_recipe_sysroot)
NOTE: recipe sysvinit-3.02-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package: Started
NOTE: recipe sysvinit-3.02-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 721 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_3.02.bb:do_configure)
NOTE: recipe sysvinit-3.02-r0: task do_configure: Started
NOTE: recipe sysvinit-3.02-r0: task do_configure: Succeeded
NOTE: Running task 722 of 731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_3.02.bb:do_compile)
NOTE: recipe sysvinit-3.02-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 56 base_bindir=/bin base_sbindir=/sbin bindir=/usr/bin sbindir=/usr/sbin sysconfdir=/etc includedir=/usr/include mandir=/usr/share/man MNTPOINT=yes
| make VERSION=3.02 -C man all
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/sysvinit-3.02/man'
| sed --in-place=.orig --separate 's/\@VERSION\@/3.02/g' bootlogd.8 fstab-decode.8 halt.8 init.8 initctl.5 initscript.5 inittab.5 killall5.8 last.1 lastb.1 logsave.8 mesg.1 mountpoint.1 pidof.8 poweroff.8 readbootlog.1 reboot.8 runlevel.8 shutdown.8 sulogin.8 telinit.8 utmpdump.1 wall.1
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/sysvinit-3.02/man'
| make VERSION=3.02 -C src all
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/sysvinit-3.02/src'
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot -D_GNU_SOURCE  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recip
 e-sysroot-native=  -ansi -fomit-frame-pointer -fstack-protector-strong -W -Wall -Wunreachable-code -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2 -D_XOPEN_SOURCE -D_GNU_SOURCE -DVERSION=\"3.02\"    -c -o mountpoint.o mountpoint.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot -D_GNU_SOURCE  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recip
 e-sysroot-native=  -ansi -fomit-frame-pointer -fstack-protector-strong -W -Wall -Wunreachable-code -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2 -D_XOPEN_SOURCE -D_GNU_SOURCE -DVERSION=\"3.02\"    -c -o init.o init.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot -D_GNU_SOURCE  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recip
 e-sysroot-native=  -ansi -fomit-frame-pointer -fstack-protector-strong -W -Wall -Wunreachable-code -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2 -D_XOPEN_SOURCE -D_GNU_SOURCE -DVERSION=\"3.02\"  -DINIT_MAIN -c -o init_utmp.o utmp.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot -D_GNU_SOURCE  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recip
 e-sysroot-native=  -ansi -fomit-frame-pointer -fstack-protector-strong -W -Wall -Wunreachable-code -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2 -D_XOPEN_SOURCE -D_GNU_SOURCE -DVERSION=\"3.02\"    -c -o runlevellog.o runlevellog.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot -D_GNU_SOURCE  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recip
 e-sysroot-native=  -ansi -fomit-frame-pointer -fstack-protector-strong -W -Wall -Wunreachable-code -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2 -D_XOPEN_SOURCE -D_GNU_SOURCE -DVERSION=\"3.02\"    -c -o halt.o halt.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot -D_GNU_SOURCE  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recip
 e-sysroot-native=  -ansi -fomit-frame-pointer -fstack-protector-strong -W -Wall -Wunreachable-code -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2 -D_XOPEN_SOURCE -D_GNU_SOURCE -DVERSION=\"3.02\"    -c -o ifdown.o ifdown.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot -D_GNU_SOURCE  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recip
 e-sysroot-native=  -ansi -fomit-frame-pointer -fstack-protector-strong -W -Wall -Wunreachable-code -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2 -D_XOPEN_SOURCE -D_GNU_SOURCE -DVERSION=\"3.02\"    -c -o hddown.o hddown.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot -D_GNU_SOURCE  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recip
 e-sysroot-native=  -ansi -fomit-frame-pointer -fstack-protector-strong -W -Wall -Wunreachable-code -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2 -D_XOPEN_SOURCE -D_GNU_SOURCE -DVERSION=\"3.02\"    -c -o utmp.o utmp.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot -D_GNU_SOURCE  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recip
 e-sysroot-native=  -ansi -fomit-frame-pointer -fstack-protector-strong -W -Wall -Wunreachable-code -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2 -D_XOPEN_SOURCE -D_GNU_SOURCE -DVERSION=\"3.02\"    -c -o shutdown.o shutdown.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot -D_GNU_SOURCE  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recip
 e-sysroot-native=  -ansi -fomit-frame-pointer -fstack-protector-strong -W -Wall -Wunreachable-code -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2 -D_XOPEN_SOURCE -D_GNU_SOURCE -DVERSION=\"3.02\"    -c -o dowall.o dowall.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot -D_GNU_SOURCE  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recip
 e-sysroot-native=  -ansi -fomit-frame-pointer -fstack-protector-strong -W -Wall -Wunreachable-code -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2 -D_XOPEN_SOURCE -D_GNU_SOURCE -DVERSION=\"3.02\"    -c -o runlevel.o runlevel.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot -D_GNU_SOURCE  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recip
 e-sysroot-native=  -ansi -fomit-frame-pointer -fstack-protector-strong -W -Wall -Wunreachable-code -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2 -D_XOPEN_SOURCE -D_GNU_SOURCE -DVERSION=\"3.02\"   -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now  killall5.c   -o killall5
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot -D_GNU_SOURCE  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recip
 e-sysroot-native=  -ansi -fomit-frame-pointer -fstack-protector-strong -W -Wall -Wunreachable-code -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2 -D_XOPEN_SOURCE -D_GNU_SOURCE -DVERSION=\"3.02\"    -c -o fstab-decode.o fstab-decode.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot -D_GNU_SOURCE  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recip
 e-sysroot-native=  -ansi -fomit-frame-pointer -fstack-protector-strong -W -Wall -Wunreachable-code -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2 -D_XOPEN_SOURCE -D_GNU_SOURCE -DVERSION=\"3.02\"    -c -o logsave.o logsave.c
| mountpoint.c: In function 'main':
| mountpoint.c:172:9: warning: 'strncat' specified bound 3 equals source length [-Wstringop-overflow=]
|   172 |         strncat(buf, "/..", 3);
|       |         ^~~~~~~~~~~~~~~~~~~~~~
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot -D_GNU_SOURCE  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recip
 e-sysroot-native=  -ansi -fomit-frame-pointer -fstack-protector-strong -W -Wall -Wunreachable-code -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2 -D_XOPEN_SOURCE -D_GNU_SOURCE -DVERSION=\"3.02\"    -c -o sulogin.o sulogin.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot -D_GNU_SOURCE  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recip
 e-sysroot-native=  -ansi -fomit-frame-pointer -fstack-protector-strong -W -Wall -Wunreachable-code -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2 -D_XOPEN_SOURCE -D_GNU_SOURCE -DVERSION=\"3.02\"    -c -o consoles.o consoles.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot -D_GNU_SOURCE  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recip
 e-sysroot-native=  -ansi -fomit-frame-pointer -fstack-protector-strong -W -Wall -Wunreachable-code -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2 -D_XOPEN_SOURCE -D_GNU_SOURCE -DVERSION=\"3.02\"    -c -o bootlogd.o bootlogd.c
| utmp.c: In function 'write_wtmp':
| utmp.c:70:24: warning: unused variable 'tv' [-Wunused-variable]
|    70 |         struct timeval tv;
|       |                        ^~
| utmp.c: In function 'write_utmp':
| utmp.c:162:24: warning: unused variable 'tv' [-Wunused-variable]
|   162 |         struct timeval tv;
|       |                        ^~
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot -D_GNU_SOURCE  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recip
 e-sysroot-native=  -ansi -fomit-frame-pointer -fstack-protector-strong -W -Wall -Wunreachable-code -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2 -D_XOPEN_SOURCE -D_GNU_SOURCE -DVERSION=\"3.02\"    -c -o last.o last.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot -D_GNU_SOURCE  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recip
 e-sysroot-native=  -ansi -fomit-frame-pointer -fstack-protector-strong -W -Wall -Wunreachable-code -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2 -D_XOPEN_SOURCE -D_GNU_SOURCE -DVERSION=\"3.02\"    -c -o mesg.o mesg.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot -D_GNU_SOURCE  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recip
 e-sysroot-native=  -ansi -fomit-frame-pointer -fstack-protector-strong -W -Wall -Wunreachable-code -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2 -D_XOPEN_SOURCE -D_GNU_SOURCE -DVERSION=\"3.02\"    -c -o readbootlog.o readbootlog.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot -D_GNU_SOURCE  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recip
 e-sysroot-native=  -ansi -fomit-frame-pointer -fstack-protector-strong -W -Wall -Wunreachable-code -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2 -D_XOPEN_SOURCE -D_GNU_SOURCE -DVERSION=\"3.02\"    -c -o utmpdump.o utmpdump.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot -D_GNU_SOURCE  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recip
 e-sysroot-native=  -ansi -fomit-frame-pointer -fstack-protector-strong -W -Wall -Wunreachable-code -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2 -D_XOPEN_SOURCE -D_GNU_SOURCE -DVERSION=\"3.02\"    -c -o wall.o wall.c
| utmp.c: In function 'write_wtmp':
| utmp.c:70:24: warning: unused variable 'tv' [-Wunused-variable]
|    70 |         struct timeval tv;
|       |                        ^~
| utmp.c: In function 'write_utmp':
| utmp.c:162:24: warning: unused variable 'tv' [-Wunused-variable]
|   162 |         struct timeval tv;
|       |                        ^~
| utmp.c:209:9: warning: 'strncpy' specified bound 4 equals destination size [-Wstringop-truncation]
|   209 |         strncpy(utmp.ut_id, id, sizeof(utmp.ut_id));
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| utmp.c:217:9: warning: 'strncpy' specified bound 32 equals destination size [-Wstringop-truncation]
|   217 |         strncpy(utmp.ut_user, user, UT_NAMESIZE);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| utmp.c:209:9: warning: 'strncpy' specified bound 4 equals destination size [-Wstringop-truncation]
|   209 |         strncpy(utmp.ut_id, id, sizeof(utmp.ut_id));
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| utmp.c:217:9: warning: 'strncpy' specified bound 32 equals destination size [-Wstringop-truncation]
|   217 |         strncpy(utmp.ut_user, user, UT_NAMESIZE);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| utmp.c:218:19: warning: 'strncpy' specified bound 32 equals destination size [-Wstringop-truncation]
|   218 |         if (line) strncpy(utmp.ut_line, line, UT_LINESIZE);
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| utmp.c: In function 'write_utmp.constprop':
| utmp.c:209:9: warning: 'strncpy' specified bound 4 equals destination size [-Wstringop-truncation]
|   209 |         strncpy(utmp.ut_id, id, sizeof(utmp.ut_id));
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| utmp.c:217:9: warning: 'strncpy' specified bound 32 equals destination size [-Wstringop-truncation]
|   217 |         strncpy(utmp.ut_user, user, UT_NAMESIZE);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| utmp.c:218:19: warning: 'strncpy' specified bound 32 equals destination size [-Wstringop-truncation]
|   218 |         if (line) strncpy(utmp.ut_line, line, UT_LINESIZE);
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0=/usr/src/debug/sysvinit/3.02-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/recipe-sysroot-nati
 ve=  -Wl,-z,relro,-z,now  runlevel.o runlevellog.o   -o runlevel
| bootlogd.c: In function 'chdir_int':
| bootlogd.c:120:26: error: 'PATH_MAX' undeclared (first use in this function)
|   120 |                 char msg[PATH_MAX + sizeof(msgprefix)];
|       |                          ^~~~~~~~
| bootlogd.c:120:26: note: each undeclared identifier is reported only once for each function it appears in
| bootlogd.c:120:22: warning: unused variable 'msg' [-Wunused-variable]
|   120 |                 char msg[PATH_MAX + sizeof(msgprefix)];
|       |                      ^~~
| utmp.c: In function 'write_wtmp':
| utmp.c:131:9: warning: 'strncpy' specified bound 32 equals destination size [-Wstringop-truncation]
|   131 |         strncpy(utmp.ut_name, user, sizeof(utmp.ut_name));
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| utmp.c:132:9: warning: 'strncpy' specified bound 4 equals destination size [-Wstringop-truncation]
|   132 |         strncpy(utmp.ut_id  , id  , sizeof(utmp.ut_id  ));
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| utmp.c:133:9: warning: 'strncpy' specified bound 32 equals destination size [-Wstringop-truncation]
|   133 |         strncpy(utmp.ut_line, line, sizeof(utmp.ut_line));
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| last.c: In function 'list':
| last.c:462:64: warning: pointer targets in passing argument 4 of 'dns_lookup' differ in signedness [-Wpointer-sign]
|   462 |                 r = dns_lookup(domain, sizeof(domain), useip, p->ut_addr_v6);
|       |                                                               ~^~~~~~~~~~~~
|       |                                                                |
|       |                                                                unsigned int *
| last.c:320:60: note: expected 'int32_t *' {aka 'int *'} but argument is of type 'unsigned int *'
|   320 | int dns_lookup(char *result, int size, int useip, int32_t *a)
|       |                                                   ~~~~~~~~~^
| utmp.c: In function 'write_wtmp':
| utmp.c:131:9: warning: 'strncpy' specified bound 32 equals destination size [-Wstringop-truncation]
|   131 |         strncpy(utmp.ut_name, user, sizeof(utmp.ut_name));
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| utmp.c:132:9: warning: 'strncpy' specified bound 4 equals destination size [-Wstringop-truncation]
|   132 |         strncpy(utmp.ut_id  , id  , sizeof(utmp.ut_id  ));
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| utmp.c:133:9: warning: 'strncpy' specified bound 32 equals destination size [-Wstringop-truncation]
|   133 |         strncpy(utmp.ut_line, line, sizeof(utmp.ut_line));
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| make[1]: *** [<builtin>: bootlogd.o] Error 1
| make[1]: *** Waiting for unfinished jobs....
| last.c: In function 'main':
| last.c:849:33: warning: 'strncpy' output truncated before terminating nul copying 11 bytes from a string of the same length [-Wstringop-truncation]
|   849 |                                 strncpy(ut.ut_line, "system down", OLD_LINESIZE - 1);
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| last.c:865:25: warning: 'strncpy' output truncated before terminating nul copying 11 bytes from a string of the same length [-Wstringop-truncation]
|   865 |                         strncpy(ut.ut_line, "system boot", OLD_LINESIZE - 1);
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| utmpdump.c: In function 'newtoold':
| utmpdump.c:70:9: warning: 'strncpy' output may be truncated copying 12 bytes from a string of length 31 [-Wstringop-truncation]
|    70 |         strncpy(dest.ut_line, src.ut_line, OLD_LINESIZE);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| utmpdump.c:71:9: warning: 'strncpy' output may be truncated copying 8 bytes from a string of length 31 [-Wstringop-truncation]
|    71 |         strncpy(dest.ut_user, src.ut_user, OLD_NAMESIZE);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| utmpdump.c:72:9: warning: 'strncpy' output may be truncated copying 16 bytes from a string of length 255 [-Wstringop-truncation]
|    72 |         strncpy(dest.ut_host, src.ut_host, OLD_HOSTSIZE);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| dowall.c: In function 'wall':
| dowall.c:161:34: warning: variable 'tp' might be clobbered by 'longjmp' or 'vfork' [-Wclobbered]
|   161 |         FILE                    *tp;
|       |                                  ^~
| dowall.c:170:33: warning: variable 'fd' might be clobbered by 'longjmp' or 'vfork' [-Wclobbered]
|   170 |         int                     fd, flags;
|       |                                 ^~
| killall5.c: In function 'check4nfs':
| killall5.c:457:12: warning: 'strncpy' output may be truncated copying 4096 bytes from a string of length 4096 [-Wstringop-truncation]
|   457 |            strncpy(real, curr, PATH_MAX);
|       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| last.c: In function 'list':
| last.c:467:17: warning: 'strncat' output may be truncated copying 255 bytes from a string of length 255 [-Wstringop-truncation]
|   467 |                 strncat(domain, p->ut_host, len);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'check_kernel_console',
|     inlined from 'read_inittab' at init.c:1702:3:
| init.c:1396:41: warning: 'strncpy' output may be truncated copying 8 bytes from a string of length 31 [-Wstringop-truncation]
|  1396 |                                         strncpy(id, dev, sizeof(id));
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| init.c:1394:41: warning: 'strncpy' output may be truncated copying 8 bytes from a string of length 28 [-Wstringop-truncation]
|  1394 |                                         strncpy(id, dev+3, sizeof(id));
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/sysvinit-3.02/src'
| make: *** [Makefile:7: all] Error 2
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/temp/run.do_compile.1102153:184 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/temp/run.do_compile.1102153, line 184
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/temp/run.do_compile.1102153, line 169
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/temp/run.do_compile.1102153, line 174
| 	#4: base_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/temp/run.do_compile.1102153, line 152
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/temp/run.do_compile.1102153, line 146
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/temp/run.do_compile.1102153, line 194
NOTE: recipe sysvinit-3.02-r0: task do_compile: Failed
NOTE: recipe base-passwd-3.5.29-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 722 tasks of which 672 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_3.02.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: sysvinit-3.02-r0 do_compile: oe_runmake failed
ERROR: sysvinit-3.02-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/temp/run.do_compile.1102153', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sysvinit/3.02-r0/temp/log.do_compile.1102153
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/sysvinit/sysvinit_3.02.bb:do_compile) failed with exit code '1'

--===============8330132453415009841==--

