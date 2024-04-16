Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6283C3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:14 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.13450.1713248041096109880
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=K0tvYlGs;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=AGJXrIv/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018ee58aa18f-33ca7345-f267-4373-9e04-e7f311d1c8c5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248051;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4cRO0oyHlPJmj3Hj2X+IoM4sKwZ7sbD6v1r/RNA4xbk=;
	b=K0tvYlGsQwQPVQU0zGEYffHqdx3oby89cDtDfxwTWek9aQ8mh3/899jegL9JgCXj
	8NTinhHpdgyEajh9+QdoQTo69q0ffCqILPG3PoeY+9L5xIzQxBxEftdMxKlT9Hbv5r6
	UDaP9MNewIIneY2NSqqEg+JCIyERPyFAgJ/Sanu4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248051;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4cRO0oyHlPJmj3Hj2X+IoM4sKwZ7sbD6v1r/RNA4xbk=;
	b=AGJXrIv/8dQxPO/9AFh5257WCLah0OlEO5E13hHtQ9ho1tdxCsm7/qH4zxde9u82
	GelOxy18X3SS9X1a8qWQ236tjMZOqAkPocvljXfH4Yuus5BMnyysNMVyidxieZjwISy
	KbyvCrs2bfjlrzGsQPA/t20SJqJqFUPQKIo6aNXI=
Content-Type: multipart/mixed; boundary="===============2063211171682898221=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to fd304c53cc45dc05b3f95c20a466e20a7e1c9194
 SUCCEEDED
Message-ID: <0101018ee58aa18f-33ca7345-f267-4373-9e04-e7f311d1c8c5-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198406

--===============2063211171682898221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *puzzles* to *fd304c53cc45dc05b3f95c20a466e20a7e1c9194* has Succeeded.

Next steps:
    - apply the patch: git am 0001-puzzles-upgrade-to-latest-revision.patch
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
From 7b88f370d04954ebb56f6b7c7a2f13f19c544e20 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Apr 2024 02:17:14 +0000
Subject: [PATCH] puzzles: upgrade to latest revision

---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index e9403ee130..0ed066a5b5 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "80aac3104096aee4057b675c53ece8e60793aa90"
+SRCREV = "fd304c53cc45dc05b3f95c20a466e20a7e1c9194"
 PE = "2"
 PV = "0.0+git"
 
-- 
2.42.0


--===============2063211171682898221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc

--===============2063211171682898221==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSA3Yjg4ZjM3MGQwNDk1NGViYjU2ZjZiN2M3YTJmMTNmMTljNTQ0ZTIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgQXByIDIwMjQgMDI6MTc6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
dXp6bGVzOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtc2F0
by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXNhdG8vcHV6
emxlcy9wdXp6bGVzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6emxlc19n
aXQuYmIKaW5kZXggZTk0MDNlZTEzMC4uMGVkMDY2YTViNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc2F0by9w
dXp6bGVzL3B1enpsZXNfZ2l0LmJiCkBAIC0xMCw3ICsxMCw3IEBAIFJFUVVJUkVEX0RJU1RST19G
RUFUVVJFUyA9ICJ4MTEiCiBTUkNfVVJJID0gImdpdDovL2dpdC50YXJ0YXJ1cy5vcmcvc2ltb24v
cHV6emxlcy5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHMiCiAKIFVQU1RSRUFNX0NIRUNL
X0NPTU1JVFMgPSAiMSIKLVNSQ1JFViA9ICI4MGFhYzMxMDQwOTZhZWU0MDU3YjY3NWM1M2VjZThl
NjA3OTNhYTkwIgorU1JDUkVWID0gImZkMzA0YzUzY2M0NWRjMDViM2Y5NWMyMGE0NjZlMjBhN2Ux
YzkxOTQiCiBQRSA9ICIyIgogUFYgPSAiMC4wK2dpdCIKIAotLSAKMi40Mi4wCgo=

--===============2063211171682898221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 19535232 to 19535272 (+0%)
packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3838603 to 3839116 (+0%)
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc

--===============2063211171682898221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (0 cached, 922 parsed). 1879 targets, 46 skipped, 0 masked, 0 errors.
Removing 89 recipes from the core2-64 sysroot...done.
Removing 89 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-7170031b052d709d17d6e8d986b40443b6d4c321"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7170031b052d709d17d6e8d986b40443b6d4c321"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 667 Local 654 Mirrors 0 Missed 13 Current 346 (98% match, 98% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 1 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 355 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.41.bb:do_create_spdx_setscene)
NOTE: Running setscene task 362 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic_setscene)
NOTE: Running setscene task 364 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 365 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_lic_setscene: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk+3-3.24.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 482 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_recipe_qa_setscene)
NOTE: recipe gtk+3-3.24.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 484 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.41.bb:do_packagedata_setscene)
NOTE: recipe puzzles-2_0.0+git-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 564 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe puzzles-2_0.0+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1095 of 2809 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe gtk+3-3.24.41-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 571 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_fetch: Succeeded
NOTE: Running task 1096 of 2809 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 575 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe puzzles-2_0.0+git-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk+3-3.24.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 580 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 581 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 583 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.41.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 584 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 585 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 586 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 588 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 590 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 592 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 594 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.52.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.52.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe at-spi2-core-2.50.1-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.50.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_unpack: Succeeded
NOTE: Running task 1468 of 2809 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe gtk+3-3.24.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 597 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.2.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libxcursor/1.2.1/temp/log.do_packagedata_setscene.2495969
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/pango/1.52.0/temp/log.do_packagedata_setscene.2495965
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 599 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_package_setscene)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe puzzles-2_0.0+git-r0: task do_patch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libxkbcommon/1.6.0/temp/log.do_packagedata_setscene.2495971
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_patch: Succeeded
NOTE: recipe mesa-2_24.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.50.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.52.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 601 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 602 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.0.bb:do_package_setscene)
NOTE: Running setscene task 605 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 606 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_package_setscene)
NOTE: Running task 1477 of 2809 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: recipe mesa-2_24.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 608 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 610 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_generate_toolchain_file: Started
NOTE: recipe mesa-2_24.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.50.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 615 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 617 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 618 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 622 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 623 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 624 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.275.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 629 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.1.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 635 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_24.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 636 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 638 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 640 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe at-spi2-core-2.50.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.18-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 645 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 646 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.50.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package_setscene: Started
NOTE: Running setscene task 647 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 648 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 649 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_24.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 651 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_package_setscene: Started
NOTE: recipe pango-1.52.0-r0: task do_package_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 653 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 655 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 657 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_24.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 661 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 664 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 666 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 668 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 670 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 672 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 674 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 676 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 678 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 680 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 681 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 682 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 683 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.275.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 685 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 687 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 688 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 689 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 691 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 692 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 694 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 696 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.33-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 698 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 699 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 702 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 703 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 705 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 706 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.52.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 707 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 709 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.33-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 710 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 712 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 718 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 720 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.275.0.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-8.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 721 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 723 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-8.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 725 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 726 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 728 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 729 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 731 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 732 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.52.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 734 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 736 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 737 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 739 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.52.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 740 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 741 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 742 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 743 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 745 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 746 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 747 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 749 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-8.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 750 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-74-1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 751 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 753 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 755 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 758 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 760 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 761 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 762 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 763 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 766 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 769 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe icu-74-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 772 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 774 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: Running task 1509 of 2809 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe harfbuzz-8.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-74-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 777 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: Running task 1625 of 2809 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running setscene task 779 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1627 of 2809 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 781 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 784 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 785 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 786 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 787 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 788 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe icu-74-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 790 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 792 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 793 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 794 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 795 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 797 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1705 of 2809 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 799 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.42.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 801 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 802 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe icu-74-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.12.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.12.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.42-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1718 of 2809 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 804 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 806 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 807 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe icu-74-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 809 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 811 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 812 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libxml2-2.12.5-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libpng/1.6.42/temp/log.do_packagedata_setscene.2498832
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.42.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 814 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 815 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.42.bb:do_package_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.12.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 818 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 819 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1730 of 2809 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.42-r0: task do_package_setscene: Started
NOTE: Running setscene task 821 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 822 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 823 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 824 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.12.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 826 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 827 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 828 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1751 of 2809 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.12.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 830 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 831 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.42.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 836 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 837 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 840 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 841 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 842 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 843 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_packagedata_setscene)
NOTE: Running setscene task 844 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.42-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 845 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 846 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 848 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 849 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 851 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.43-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 852 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 854 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 855 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 856 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 857 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 858 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 862 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.42.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 863 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 864 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 865 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 866 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 868 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 869 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libpng-1.6.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 870 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 872 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 875 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 877 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 879 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 881 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 883 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 885 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 886 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 888 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 890 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 892 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 893 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 895 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 896 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 898 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 899 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 902 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 904 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 906 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 908 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 910 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.43-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 912 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 913 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.45.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 916 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1845 of 2809 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 919 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 921 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 923 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 926 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 927 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 928 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 929 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 931 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 932 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 933 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 934 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 935 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 936 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 937 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 939 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 944 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 947 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 948 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 949 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 951 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 953 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 956 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 958 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 959 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 961 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 963 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 964 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 969 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 971 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 973 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 974 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1931 of 2809 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 976 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 978 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 979 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Running setscene task 981 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3827d1886d21fc285ddcf2fcb9cb1cc58679b8245b5b8a3c52f01f2714d587ae
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash b2cb1d7c3a428612d86b152196c9543e7d5bfa144d8becf5807038d7108cd7d1 to hashserv.yocto.io:8686 ({'taskhash': '021e5f9565539f3300555d5e830448fbf001b870c5fd126c3748d164cb60b447', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'b2cb1d7c3a428612d86b152196c9543e7d5bfa144d8becf5807038d7108cd7d1'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 021e5f9565539f3300555d5e830448fbf001b870c5fd126c3748d164cb60b447 -> b2cb1d7c3a428612d86b152196c9543e7d5bfa144d8becf5807038d7108cd7d1 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 983 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 984 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 985 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 986 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 988 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 992 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 993 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 995 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1000 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1002 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1003 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1006 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1008 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1009 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1011 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1013 of 1013 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2385 of 2809 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2397 of 2809 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.42.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.42-r0: task do_packagedata: Started
NOTE: Running task 2671 of 2809 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_packagedata)
NOTE: Running task 2672 of 2809 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.42-r0: task do_packagedata: Succeeded
NOTE: Running task 2750 of 2809 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.0.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 5009bfdce64be5968dd9927eeb08146bbc59582b45f2dbfd597d0d6515f565bd
NOTE: Running task 2785 of 2809 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.52.0-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.52.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2796 of 2809 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2797 of 2809 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_configure: Succeeded
NOTE: Running task 2798 of 2809 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+git-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_compile: Succeeded
NOTE: Running task 2799 of 2809 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+git-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_install: Succeeded
NOTE: Running task 2800 of 2809 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2801 of 2809 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+git-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_package: Succeeded
NOTE: Running task 2802 of 2809 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+git-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata unihash changed to b9b1ffc6890641712e7855213cac5829eededdac6265bb502bf213276adbdd31
NOTE: Setscene tasks completed
NOTE: Running task 2803 of 2809 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_create_spdx)
NOTE: Running task 2804 of 2809 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_ipk)
NOTE: Running task 2805 of 2809 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_deb)
NOTE: Running task 2806 of 2809 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2807 of 2809 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_write_ipk: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_write_deb: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_ipk unihash changed to e4f4ce313ef062de4692a0d88718ec5dd6ce239a2aa895f21e3981461abd024e
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa unihash changed to 21428335f7443254df49f6512d606b089b4e063fd9ed9a93e7a7b67607d55378
NOTE: recipe puzzles-2_0.0+git-r0: task do_create_spdx: Succeeded
NOTE: Running task 2808 of 2809 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_create_runtime_spdx)
NOTE: recipe puzzles-2_0.0+git-r0: task do_create_runtime_spdx: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm unihash changed to 353169516a15ae78f4f5505b5d74d807461247b79be5cd138dea0150b2481ae9
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_deb unihash changed to 00ce4270c95f11b420b8f09a95d4db4726a6b1bb1d7f6fd056b47b8ebd6d1a2f
NOTE: Running noexec task 2809 of 2809 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2809 tasks of which 2776 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

Summary: There were 38 ERROR messages, returning a non-zero exit code.
ERROR: libxcursor-1_1.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcursor-src went backwards which would break package feeds (from 1:1.2.2-r0 to 1:1.2.1-r0) [version-going-backwards]
ERROR: libxcursor-1_1.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcursor-dbg went backwards which would break package feeds (from 1:1.2.2-r0 to 1:1.2.1-r0) [version-going-backwards]
ERROR: libxkbcommon-1.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxkbcommon-src went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.0-r0) [version-going-backwards]
ERROR: pango-1.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.52.2-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: libxcursor-1_1.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcursor-staticdev went backwards which would break package feeds (from 1:1.2.2-r0 to 1:1.2.1-r0) [version-going-backwards]
ERROR: pango-1.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.52.2-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: libxkbcommon-1.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxkbcommon-dbg went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.0-r0) [version-going-backwards]
ERROR: libxcursor-1_1.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcursor-dev went backwards which would break package feeds (from 1:1.2.2-r0 to 1:1.2.1-r0) [version-going-backwards]
ERROR: pango-1.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.52.2-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: libxkbcommon-1.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxkbcommon-staticdev went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.0-r0) [version-going-backwards]
ERROR: pango-1.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.52.2-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: libxcursor-1_1.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcursor-doc went backwards which would break package feeds (from 1:1.2.2-r0 to 1:1.2.1-r0) [version-going-backwards]
ERROR: libxkbcommon-1.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxkbcommon-dev went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.0-r0) [version-going-backwards]
ERROR: pango-1.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.52.2-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: libxcursor-1_1.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcursor-locale went backwards which would break package feeds (from 1:1.2.2-r0 to 1:1.2.1-r0) [version-going-backwards]
ERROR: pango-1.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.52.2-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: libxkbcommon-1.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxkbcommon-doc went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.0-r0) [version-going-backwards]
ERROR: libxcursor-1_1.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcursor went backwards which would break package feeds (from 1:1.2.2-r0 to 1:1.2.1-r0) [version-going-backwards]
ERROR: pango-1.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.52.2-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: libxcursor-1_1.2.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libxkbcommon-1.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxkbcommon-locale went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.0-r0) [version-going-backwards]
ERROR: pango-1.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.52.2-r0 to 0:1.52.0-r0) [version-going-backwards]
ERROR: pango-1.52.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libxkbcommon-1.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package xkbcli went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.0-r0) [version-going-backwards]
ERROR: libxkbcommon-1.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxkbcommon went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.0-r0) [version-going-backwards]
ERROR: libxkbcommon-1.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxkbcommon-bash-completion went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.0-r0) [version-going-backwards]
ERROR: libxkbcommon-1.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxkbcommon-x11 went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.0-r0) [version-going-backwards]
ERROR: libxkbcommon-1.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxkbregistry went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.0-r0) [version-going-backwards]
ERROR: libxkbcommon-1.6.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libpng-1.6.42-r0 do_packagedata_setscene: QA Issue: Package version for package libpng-src went backwards which would break package feeds (from 0:1.6.43-r0 to 0:1.6.42-r0) [version-going-backwards]
ERROR: libpng-1.6.42-r0 do_packagedata_setscene: QA Issue: Package version for package libpng-dbg went backwards which would break package feeds (from 0:1.6.43-r0 to 0:1.6.42-r0) [version-going-backwards]
ERROR: libpng-1.6.42-r0 do_packagedata_setscene: QA Issue: Package version for package libpng-tools went backwards which would break package feeds (from 0:1.6.43-r0 to 0:1.6.42-r0) [version-going-backwards]
ERROR: libpng-1.6.42-r0 do_packagedata_setscene: QA Issue: Package version for package libpng-staticdev went backwards which would break package feeds (from 0:1.6.43-r0 to 0:1.6.42-r0) [version-going-backwards]
ERROR: libpng-1.6.42-r0 do_packagedata_setscene: QA Issue: Package version for package libpng-dev went backwards which would break package feeds (from 0:1.6.43-r0 to 0:1.6.42-r0) [version-going-backwards]
ERROR: libpng-1.6.42-r0 do_packagedata_setscene: QA Issue: Package version for package libpng-doc went backwards which would break package feeds (from 0:1.6.43-r0 to 0:1.6.42-r0) [version-going-backwards]
ERROR: libpng-1.6.42-r0 do_packagedata_setscene: QA Issue: Package version for package libpng-locale went backwards which would break package feeds (from 0:1.6.43-r0 to 0:1.6.42-r0) [version-going-backwards]
ERROR: libpng-1.6.42-r0 do_packagedata_setscene: QA Issue: Package version for package libpng went backwards which would break package feeds (from 0:1.6.43-r0 to 0:1.6.42-r0) [version-going-backwards]
ERROR: libpng-1.6.42-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2063211171682898221==--

