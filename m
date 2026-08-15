Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10AA6C5DF6A
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 05:30:43 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3800.1786771838581933630
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 22:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gjbsXr9M;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=oi+tOVHA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a003e69350-aa8df6dd-eb11-48d8-b004-da9840868a1b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786771837;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KpWrwHB/R/2hr4gOZqR2LCDzcHaICqNHSOg04JGAaXc=;
	b=gjbsXr9M5YlNS+j/FVriYmOmaX/FKWfMcJmcG/qClxL7DEKCoIz+jTQLeUBRzoEh
	0l1hh3qikyjg2oGanlqfd2sJh5JqzX/e2zav9eBjhxiMoWa07BeTkXbGpxgKhhJonYu
	SihWxan8K5XLNNFFB4WsR8wE3kgjqYFdGtDbPIxo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786771837;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KpWrwHB/R/2hr4gOZqR2LCDzcHaICqNHSOg04JGAaXc=;
	b=oi+tOVHAwEt4eg0zZ2bLatiK/hkbJ3VuKaGoKCyMnLI0CfZ4PHLeVBKySZP3jhHB
	On8h0y4znj7/AIn44PVHA/QG5dCCRnVi74CN3Y/QG2QAdMw6gU16SonTzltMHHGOgO1
	p7DKybPfSQP2nJUrtPscKLeaWXrcDa+cJYMgtsQc=
Content-Type: multipart/mixed; boundary="===============7803735213296277243=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 328 FAILED
Message-ID: <010101a003e69350-aa8df6dd-eb11-48d8-b004-da9840868a1b-000000@us-west-2.amazonses.com>
Date: Sat, 15 Aug 2026 05:30:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 05:30:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243474

--===============7803735213296277243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *328* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-327-328.patch
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
From ed22bd3eac0d14835dddd4dd2bd5cd44e24fe08e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Aug 2026 05:27:19 +0000
Subject: [PATCH] diffoscope: upgrade 327 -> 328

---
 .../diffoscope/{diffoscope_327.bb => diffoscope_328.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_327.bb => diffoscope_328.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_327.bb b/meta/recipes-support/diffoscope/diffoscope_328.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_327.bb
rename to meta/recipes-support/diffoscope/diffoscope_328.bb
index 30d33732f6..7b4bd7640b 100644
--- a/meta/recipes-support/diffoscope/diffoscope_327.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_328.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b5a398de17b180637cf091ba5c3c9fecde9dc8f5c2c80204ff8dd78e1b9d5358"
+SRC_URI[sha256sum] = "8480ddffa8cc4860c6ada3c9c80a8169e75d6a39ad971662851f1ad776512870"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.47.1


--===============7803735213296277243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-327.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-328.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/diffoscope-327.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-328.dist-info
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-327.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-328.dist-info

--===============7803735213296277243==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-327-328.patch"

RnJvbSBlZDIyYmQzZWFjMGQxNDgzNWRkZGQ0ZGQyYmQ1Y2Q0NGUyNGZlMDhlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXVnIDIwMjYgMDU6Mjc6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDMyNyAtPiAzMjgKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMzI3LmJiID0+IGRpZmZvc2NvcGVfMzI4LmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8zMjcuYmIgPT4gZGlmZm9zY29wZV8z
MjguYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzMyNy5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8zMjguYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMyNy5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMyOC5iYgppbmRleCAzMGQzMzcz
MmY2Li43YjRiZDc2NDBiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMzI3LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8zMjguYmIKQEAgLTEwLDcgKzEwLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vQ09QWUlORzttZDU9ZDMyMjM5YmNiNjczNDYzYWI4NzRlODBkNDdmYWU1MDQiCiAK
IGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjVhMzk4
ZGUxN2IxODA2MzdjZjA5MWJhNWMzYzlmZWNkZTlkYzhmNWMyYzgwMjA0ZmY4ZGQ3OGUxYjlkNTM1
OCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4NDgwZGRmZmE4Y2M0ODYwYzZhZGEzYzljODBhODE2
OWU3NWQ2YTM5YWQ5NzE2NjI4NTFmMWFkNzc2NTEyODcwIgogCiBSREVQRU5EUzoke1BOfSArPSAi
XAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjQ3LjEKCg==

--===============7803735213296277243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PV changed from "327" to "328"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 327 [default] to 328 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PV changed from "327" to "328"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 327 [default] to 328 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PV changed from "327" to "328"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 327 [default] to 328 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PV changed from "327" to "328"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 327 [default] to 328 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PV changed from "327" to "328"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PKGV changed from 327 [default] to 328 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "327" to "328"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 327 [default] to 328 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-327.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-328.dist-info, directory renamed /usr/lib/python3.14/site-packages/diffoscope-327.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-328.dist-info/licenses
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PV changed from "327" to "328"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1413166 to 1413236 (+0%)
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGV changed from 327 [default] to 328 [default]
packages/x86-64-v3-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-327.tar.gz;downloadfilename=diffoscope-327.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-328.tar.gz;downloadfilename=diffoscope-328.tar.gz"
packages/x86-64-v3-poky-linux/diffoscope: PV changed from "327" to "328"
packages/x86-64-v3-poky-linux/diffoscope: PKGV changed from 327 [default] to 328 [default]
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-327.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-328.dist-info

--===============7803735213296277243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 955 .bb files complete (0 cached, 955 parsed). 1984 targets, 63 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-dd7290a538d29d48cb9f12af47047140c1a1a5dc"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:dd7290a538d29d48cb9f12af47047140c1a1a5dc"
meta-yocto-bsp       
meta-poky            = "master:30756f716a1f527a74a9e12bad8f6e0e756ed9a4"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 871 Local 736 Mirrors 0 Missed 135 Current 199 (84% match, 87% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 215 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_328.bb:do_populate_lic_setscene)
NOTE: Running setscene task 261 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 320 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 329 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 336 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 337 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 340 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 341 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 342 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patchelf/patchelf_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 349 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_create_spdx_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe diffoscope-328-r0: task do_populate_lic_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.44.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.19-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe vim-9.2.0843-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gnu-config-native-20260629+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe patchelf-native-0.19.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe diffoscope-328-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 355 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 360 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_create_spdx_setscene)
NOTE: recipe popt-1.19-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 361 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_create_spdx_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe binutils-2.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnu-config-native-20260629+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 365 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_create_spdx_setscene)
NOTE: Running setscene task 369 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 376 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 382 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 386 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe patchelf-native-0.19.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 387 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 388 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_create_spdx_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 390 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patchelf/patchelf_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 398 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 402 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 403 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_create_spdx_setscene)
NOTE: recipe lz4-1_1.10.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 404 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 406 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 408 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 409 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 412 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_create_spdx_setscene)
NOTE: Running setscene task 415 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 417 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/debugedit/debugedit_5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 421 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 422 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 424 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xxhash-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe patchelf-native-0.19.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe lua-5.5.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe curl-8.21.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe debugedit-5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lua-5.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vim-9.2.0843-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 426 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe patchelf-native-0.19.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 429 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_create_spdx_setscene)
NOTE: Running setscene task 431 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_create_spdx_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lua-5.5.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-libarchive-c-5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 432 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 434 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 435 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 436 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe debugedit-5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 437 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 439 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 440 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_create_spdx_setscene)
NOTE: recipe xxhash-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lz4-1_1.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 446 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 453 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 455 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.48-r0: task do_create_spdx_setscene: Started
NOTE: recipe lua-5.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 456 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 458 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vim-9.2.0843-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.48-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 463 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 469 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 470 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fts-1.2.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 472 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 475 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 476 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe util-linux-2.42.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 477 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 479 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 485 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: recipe libxt-1_1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 486 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rpm-1_4.20.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 487 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vim-9.2.0843-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 489 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 493 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_spdx_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.42.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 498 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 500 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_create_spdx_setscene)
NOTE: recipe rpm-1_4.20.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 502 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_create_recipe_spdx_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 503 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 508 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.21.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 509 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_create_spdx_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 511 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 514 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/debugedit/debugedit_5.3.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xxhash-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 515 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 517 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 519 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 520 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 521 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.4.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe vim-9.2.0843-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xxhash-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe debugedit-5.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 522 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe attr-2.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 524 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_recipe_qa_setscene)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 526 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pytest-9.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 531 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 532 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_create_recipe_spdx_setscene)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vim-9.2.0843-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 535 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 538 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe debugedit-5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 539 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 541 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_create_spdx_setscene)
NOTE: recipe lua-5.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 542 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_create_spdx_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 543 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 545 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 547 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 552 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_spdx_setscene)
NOTE: recipe file-5.48-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe lua-5.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 553 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe elfutils-0.195-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 554 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_create_spdx_setscene)
NOTE: recipe expat-2.8.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 558 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.48-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 562 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 564 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 565 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 566 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe elfutils-0.195-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 567 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 568 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe rpm-1_4.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 570 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_spdx_setscene)
NOTE: recipe expat-2.8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 572 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 573 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 584 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 585 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_packagedata_setscene)
NOTE: recipe lua-5.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 586 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 587 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 588 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 589 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lua-5.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 590 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 591 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 593 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 594 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 595 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 596 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 597 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 598 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lz4-1_1.10.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 599 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe elfutils-0.195-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 601 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 602 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 604 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 605 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lz4-1_1.10.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 608 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 609 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 611 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.0.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 612 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_recipe_spdx_setscene)
NOTE: recipe elfutils-0.195-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 613 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_create_spdx_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 614 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_package_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xxhash-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe qemu-native-11.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.42.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xxhash-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe qemu-native-11.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 616 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 619 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_create_spdx_setscene)
NOTE: Running setscene task 621 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 622 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 627 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 628 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 631 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 634 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_package_setscene)
NOTE: Running setscene task 638 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 640 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.42.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 641 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 647 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxt-1_1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-2.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lz4-1_1.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 648 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 651 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 652 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 653 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 656 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 660 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 664 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 665 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 666 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 667 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 669 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 674 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 675 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 676 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 677 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 682 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 683 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.0.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 685 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 687 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 691 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.0.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 693 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_package_setscene: Started
NOTE: Running setscene task 695 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe qemu-native-11.0.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 696 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_package_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 698 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 699 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 700 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe qemu-native-11.0.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 701 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 703 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe meson-native-1.12.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 705 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 707 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 708 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 709 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 711 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 712 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe meson-native-1.12.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 714 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 717 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 720 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 723 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 724 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_package_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 728 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 730 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 731 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 733 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 734 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/gettext/gettext_1.0.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 736 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 737 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 738 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 743 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.19-r0: task do_package_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 745 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 746 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 747 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 748 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gettext-native-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe file-5.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 749 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 750 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 751 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 752 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_package_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 753 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gettext-native-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 754 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 757 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 758 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 759 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_package_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 762 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 763 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 765 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpsl-0.23.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 766 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 768 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 770 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 773 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 776 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_recipe_qa_setscene)
NOTE: recipe meson-native-1.12.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 778 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/gettext/gettext_1.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 781 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe meson-native-1.12.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 782 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpsl-0.23.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 784 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 785 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 786 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_recipe_qa_setscene)
NOTE: recipe gettext-native-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 787 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.44.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 788 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 790 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 791 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 792 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_package_setscene)
NOTE: Running setscene task 798 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 799 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 800 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 801 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe gettext-native-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 802 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.23.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 803 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 804 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_package_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 805 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe util-linux-2.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 806 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 810 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 811 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.7-r0: task do_package_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 814 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 815 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 817 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 820 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 821 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 822 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 823 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 826 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 827 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 831 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 832 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-native-5.44.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 834 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 835 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 838 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 839 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 841 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 842 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 844 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 845 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe perl-native-5.44.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 849 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 852 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_package_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 855 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 856 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 857 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 858 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 860 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe libpsl-0.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 861 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 863 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 864 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 868 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 870 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-native-5.44.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpsl-0.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 871 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 873 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 875 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 876 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 877 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-native-5.44.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 879 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 886 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 887 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 888 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 890 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 892 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 893 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 894 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 897 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 901 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/bison/bison_3.8.2.bb:do_create_spdx_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 906 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: recipe libcap-ng-0.9.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 913 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 915 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 919 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bison-native-3.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-native-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 921 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe bison-native-3.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 932 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/flex/flex_2.6.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 933 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/bison/bison_3.8.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe zlib-native-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 935 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 457 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_fetch)
NOTE: Running task 461 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch)
NOTE: Running task 465 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_fetch)
NOTE: Running task 467 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_fetch)
NOTE: Running task 497 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_fetch)
NOTE: Running task 502 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_fetch)
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 512 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_fetch)
NOTE: Running task 515 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_fetch)
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 938 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 940 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: Running task 530 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bison-native-3.8.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 534 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_fetch)
NOTE: recipe zlib-native-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe flex-native-2.6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Started
NOTE: recipe json-c-0.19-r0: task do_fetch: Started
NOTE: recipe libarchive-3.8.9-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.13-r0: task do_fetch: Started
NOTE: recipe qemu-native-11.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Succeeded
NOTE: recipe json-c-0.19-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.195-r0: task do_fetch: Started
NOTE: Running task 535 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_unpack)
NOTE: Running task 536 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_unpack)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.13-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: Running task 537 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_unpack)
NOTE: Running task 538 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_unpack)
NOTE: recipe bison-native-3.8.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-native-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 539 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_fetch)
NOTE: recipe flex-native-2.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe elfutils-0.195-r0: task do_fetch: Succeeded
NOTE: Running setscene task 943 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb:do_create_spdx_setscene)
NOTE: Running setscene task 944 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/flex/flex_2.6.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe lua-5.5.0-r0: task do_fetch: Started
NOTE: Running task 555 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_unpack)
NOTE: recipe texinfo-dummy-native-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_unpack: Started
NOTE: Running task 570 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_write_config)
NOTE: recipe lz4-1_1.10.0-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.13-r0: task do_unpack: Started
NOTE: recipe elfutils-0.195-r0: task do_unpack: Started
NOTE: recipe json-c-0.19-r0: task do_unpack: Succeeded
NOTE: Running task 572 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_fetch)
NOTE: recipe flex-native-2.6.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe texinfo-dummy-native-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_write_config: Started
NOTE: recipe flex-native-2.6.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 947 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-native_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_write_config: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe libtool-native-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 882 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_patch)
NOTE: Running task 886 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_patch)
NOTE: Running task 900 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_patch)
NOTE: Running task 920 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_write_config)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_fetch: Succeeded
NOTE: recipe qemu-native-11.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 949 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 950 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-native-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 951 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/automake/automake_1.18.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_fetch: Succeeded
NOTE: Running task 928 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_unpack)
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_patch: Started
NOTE: recipe json-c-0.19-r0: task do_patch: Started
NOTE: recipe qemu-native-11.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_write_config: Started
NOTE: recipe meson-native-1.12.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe qemu-native-11.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe automake-native-1.18.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_unpack: Started
NOTE: Running task 937 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_unpack)
NOTE: recipe json-c-0.19-r0: task do_patch: Succeeded
NOTE: Running task 943 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_fetch)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_patch: Succeeded
NOTE: Running task 960 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_fetch)
NOTE: Running task 973 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_fetch)
NOTE: recipe automake-native-1.18.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 952 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf/autoconf_2.73.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 975 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_fetch)
NOTE: recipe libice-1_1.1.2-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_fetch: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_fetch: Started
NOTE: Running task 976 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.28-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_fetch: Started
NOTE: recipe meson-native-1.12.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 954 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.0.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_unpack: Succeeded
NOTE: recipe autoconf-native-2.73-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 977 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_patch)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_unpack: Succeeded
NOTE: Running task 978 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_patch)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_unpack: Started
NOTE: recipe autoconf-native-2.73-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 957 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb:do_create_recipe_spdx_setscene)
NOTE: recipe meson-native-1.12.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_patch: Started
NOTE: recipe gnutls-3.8.13-r0: task do_unpack: Succeeded
NOTE: Running setscene task 958 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe texinfo-dummy-native-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe meson-native-1.12.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1061 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_patch)
NOTE: recipe texinfo-dummy-native-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_patch: Succeeded
NOTE: Running task 1083 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_328.bb:do_recipe_qa)
NOTE: Running task 1086 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_fetch)
NOTE: recipe gnu-config-native-20260629+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gnu-config-native-20260629+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_patch: Started
NOTE: recipe diffoscope-328-r0: task do_recipe_qa: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_patch: Succeeded
NOTE: Running task 1184 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_check_backend)
NOTE: Running task 1189 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: recipe elfutils-0.195-r0: task do_unpack: Succeeded
NOTE: Running task 1190 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_patch)
NOTE: recipe lua-5.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 1191 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_unpack)
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_check_backend: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_check_backend: Succeeded
NOTE: Running task 1206 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_fetch)
NOTE: recipe elfutils-0.195-r0: task do_patch: Started
NOTE: recipe diffoscope-328-r0: task do_recipe_qa: Succeeded
NOTE: recipe lua-5.5.0-r0: task do_unpack: Started
NOTE: Running task 1207 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_328.bb:do_fetch)
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_unpack: Succeeded
NOTE: Running task 1209 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_patch)
NOTE: recipe lua-5.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1225 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_fetch)
NOTE: Running task 1226 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_patch)
NOTE: recipe binutils-2.47-r0: task do_fetch: Started
NOTE: recipe diffoscope-328-r0: task do_fetch: Started
NOTE: recipe binutils-2.47-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-328-r0: task do_fetch: Succeeded
NOTE: Running task 1227 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_fetch)
NOTE: Running task 1228 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_328.bb:do_unpack)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_fetch: Started
NOTE: recipe lua-5.5.0-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_patch: Started
NOTE: recipe gnutls-3.8.13-r0: task do_patch: Succeeded
NOTE: Running task 1230 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: recipe diffoscope-328-r0: task do_unpack: Started
NOTE: recipe vim-9.2.0843-r0: task do_fetch: Started
NOTE: recipe lua-5.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1236 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe diffoscope-328-r0: task do_unpack: Succeeded
NOTE: Running task 1237 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_328.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: Running task 1238 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1245 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_unpack)
NOTE: recipe diffoscope-328-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe binutils-2.47-r0: task do_unpack: Started
NOTE: recipe diffoscope-328-r0: task do_patch: Succeeded
NOTE: Running task 1252 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_write_config)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: Running task 1255 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe elfutils-0.195-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_write_config: Started
NOTE: Running task 1271 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_fetch)
NOTE: recipe desktop-file-utils-0.28-r0: task do_write_config: Succeeded
NOTE: Running task 1301 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_328.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1302 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe xxhash-0.8.3-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: Running task 1303 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: recipe diffoscope-328-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1320 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: Running task 1321 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-328-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: Running task 1332 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_328.bb:do_check_backend)
NOTE: Running task 1333 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_check_backend)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1334 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe desktop-file-utils-0.28-r0: task do_fetch: Succeeded
NOTE: Running task 1335 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_unpack)
NOTE: recipe diffoscope-328-r0: task do_check_backend: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_check_backend: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_check_backend: Succeeded
NOTE: recipe diffoscope-328-r0: task do_check_backend: Succeeded
NOTE: recipe lz4-1_1.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 1352 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_fetch)
NOTE: Running task 1353 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_fetch)
NOTE: Running task 1354 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/debugedit/debugedit_5.3.bb:do_fetch)
NOTE: Running task 1355 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_unpack: Started
NOTE: Running task 1356 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe desktop-file-utils-0.28-r0: task do_unpack: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_fetch: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_fetch: Started
NOTE: Running task 1357 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_patch)
NOTE: recipe debugedit-5.3-r0: task do_fetch: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1362 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_create_recipe_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1363 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libtasn1-4.21.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_patch: Succeeded
NOTE: Running task 1370 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_create_recipe_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_fetch: Succeeded
NOTE: Running task 1390 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_unpack)
NOTE: recipe libarchive-3.8.9-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_unpack: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1391 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_unpack)
NOTE: recipe libtasn1-4.21.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1392 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_create_recipe_spdx)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_unpack: Started
NOTE: recipe libarchive-3.8.9-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1396 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_patch)
NOTE: recipe libice-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 1397 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_unpack)
NOTE: recipe gnutls-3.8.13-r0: task do_create_recipe_spdx: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 1398 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_unpack)
NOTE: Running task 1423 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-pytest-9.1.1-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 1424 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_patch)
NOTE: recipe libxt-1_1.3.1-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1425 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1426 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_unpack)
NOTE: Running task 1433 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_create_recipe_spdx)
NOTE: recipe lz4-1_1.10.0-r0: task do_patch: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1434 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_patch)
NOTE: Running task 1435 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_create_recipe_spdx)
NOTE: recipe libice-1_1.1.2-r0: task do_patch: Started
NOTE: recipe python3-3.14.7-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 959 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_unpack: Started
NOTE: recipe json-c-0.19-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_create_recipe_spdx: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_unpack: Succeeded
NOTE: Running setscene task 960 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 961 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe lz4-1_1.10.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 962 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 963 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxt-1_1.3.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 964 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 965 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running setscene task 966 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 967 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 968 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.14.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running setscene task 969 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 970 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 971 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xxhash-0.8.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 972 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 973 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 974 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 977 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 978 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 979 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 980 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 981 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 982 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 983 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 985 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 992 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 995 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 998 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 999 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1000 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1001 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1003 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1004 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1007 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1012 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1013 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1015 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1017 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1019 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1463 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_fetch)
NOTE: Running task 1470 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1478 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1489 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_patch)
NOTE: Running task 1515 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_create_recipe_spdx)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1020 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xxhash-0.8.3-r0: task do_unpack: Started
NOTE: Running setscene task 1022 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1023 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_fetch: Started
NOTE: Running task 1526 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_unpack)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_patch: Started
NOTE: Running setscene task 1025 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.195-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-3.14.7-r0: task do_fetch: Succeeded
NOTE: Running task 1527 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_unpack)
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running noexec task 1533 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_fetch)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_unpack: Started
NOTE: Running task 1568 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_create_recipe_spdx)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_patch: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1570 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_create_recipe_spdx)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1027 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1577 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_328.bb:do_create_recipe_spdx)
NOTE: recipe python3-3.14.7-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_create_recipe_spdx: Started
NOTE: Running setscene task 1029 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxt-1_1.3.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe diffoscope-328-r0: task do_create_recipe_spdx: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1031 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.195-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running setscene task 1032 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1585 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_create_recipe_spdx)
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe debugedit-5.3-r0: task do_fetch: Succeeded
NOTE: Running task 1586 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/debugedit/debugedit_5.3.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.28-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-libarchive-c-5.1-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1592 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_create_recipe_spdx)
NOTE: Running task 1593 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_create_recipe_spdx)
NOTE: recipe diffoscope-328-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1595 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_create_recipe_spdx)
NOTE: recipe libxt-1_1.3.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1596 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_create_recipe_spdx)
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1034 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe debugedit-5.3-r0: task do_unpack: Started
NOTE: recipe binutils-2.47-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_create_recipe_spdx: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe debugedit-5.3-r0: task do_unpack: Succeeded
NOTE: Running task 1597 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/debugedit/debugedit_5.3.bb:do_patch)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe vim-9.2.0843-r0: task do_create_recipe_spdx: Started
NOTE: recipe xxhash-0.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 1598 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_patch)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1036 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1037 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe debugedit-5.3-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe xxhash-0.8.3-r0: task do_patch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1599 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running setscene task 1039 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1040 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running setscene task 1041 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe vim-9.2.0843-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe xxhash-0.8.3-r0: task do_patch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1600 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe binutils-2.47-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe debugedit-5.3-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_patch: Started
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1042 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1043 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.7.5-r0: task do_patch: Succeeded
NOTE: Running task 1606 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 01601c830bf0505dffefe38b59daca3ab016e10d573425e9e20abf8724f20aa7
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-2.47-r0: task do_patch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1049 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1050 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1055 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1056 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1060 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1062 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1069 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-3.14.7-r0: task do_unpack: Succeeded
NOTE: Running task 1862 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_patch)
NOTE: Running task 1911 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1915 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2018 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2019 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2020 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2140 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2195 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.8.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.14.7-r0: task do_patch: Started
NOTE: Running task 2244 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2275 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_create_spdx)
NOTE: recipe python3-3.14.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2280 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_create_spdx)
NOTE: Running task 2283 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_create_spdx)
NOTE: recipe binutils-2.47-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xxhash-0.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-16.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_create_spdx: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-c-0.19-r0: task do_create_spdx: Started
NOTE: recipe lua-5.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_create_spdx: Started
NOTE: Running task 2287 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_configure)
NOTE: Running task 2288 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_configure)
NOTE: recipe xxhash-0.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2289 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_configure)
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lz4-1_1.10.0-r0: task do_configure: Started
NOTE: recipe lua-5.5.0-r0: task do_configure: Started
NOTE: Running task 2290 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: recipe xxhash-0.8.3-r0: task do_configure: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 2291 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_configure_ptest_base)
NOTE: recipe libxt-1_1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xxhash-0.8.3-r0: task do_configure: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe lua-5.5.0-r0: task do_configure: Succeeded
NOTE: Running task 2292 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_compile)
NOTE: recipe gcc-16.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2293 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_configure)
NOTE: Running task 2294 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_configure_ptest_base)
NOTE: Running task 2295 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_configure)
NOTE: recipe libice-1_1.1.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2296 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_spdx)
NOTE: recipe lz4-1_1.10.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gnutls-3.8.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_create_spdx: Succeeded
NOTE: recipe xxhash-0.8.3-r0: task do_compile: Started
NOTE: recipe json-c-0.19-r0: task do_create_spdx: Succeeded
NOTE: Running task 2297 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_configure)
NOTE: recipe lz4-1_1.10.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_configure: Started
NOTE: recipe python3-3.14.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.5.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 2298 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_compile)
NOTE: recipe gcc-16.1.0-r0: task do_configure: Started
NOTE: recipe lua-5.5.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx: Started
NOTE: Running task 2299 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_compile)
NOTE: recipe python3-3.14.7-r0: task do_patch: Succeeded
NOTE: Running task 2301 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_configure)
NOTE: recipe gnutls-3.8.13-r0: task do_configure: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_compile: Started
NOTE: recipe lua-5.5.0-r0: task do_compile: Started
NOTE: recipe python3-3.14.7-r0: task do_configure: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx: Succeeded
NOTE: recipe lua-5.5.0-r0: task do_compile: Succeeded
NOTE: Running task 2302 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_compile_ptest_base)
NOTE: recipe lua-5.5.0-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.5.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2303 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_install)
NOTE: recipe lua-5.5.0-r0: task do_install: Started
NOTE: recipe lua-5.5.0-r0: task do_install: Succeeded
NOTE: Running task 2304 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_install_ptest_base)
NOTE: recipe lua-5.5.0-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.5.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2305 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_package)
NOTE: recipe lua-5.5.0-r0: task do_package: Started
NOTE: recipe gcc-16.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2307 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_compile)
NOTE: recipe gcc-16.1.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_fetch: Succeeded
NOTE: Running task 2308 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_unpack)
NOTE: recipe lua-5.5.0-r0: task do_package: Succeeded
NOTE: recipe rpm-1_4.20.1-r0: task do_unpack: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_package unihash changed to 6ad7a3f2c795f87f2ae23c440ee4155a016840914584c9af19b07388b00eb688
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_create_spdx became valid
NOTE: Running setscene task 1059 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_create_spdx_setscene)
NOTE: recipe lua-5.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe lua-5.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1070 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_packagedata_setscene)
NOTE: recipe xxhash-0.8.3-r0: task do_compile: Succeeded
NOTE: Running task 2309 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_install)
NOTE: recipe lua-5.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xxhash-0.8.3-r0: task do_install: Started
NOTE: recipe lua-5.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe rpm-1_4.20.1-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2312 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_patch)
NOTE: recipe xxhash-0.8.3-r0: task do_install: Succeeded
NOTE: Running task 2314 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_package)
NOTE: recipe rpm-1_4.20.1-r0: task do_patch: Started
NOTE: recipe xxhash-0.8.3-r0: task do_package: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_patch: Succeeded
NOTE: Running task 2316 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_generate_toolchain_file)
NOTE: recipe rpm-1_4.20.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: Running task 2317 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2318 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe xxhash-0.8.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_package unihash changed to 4b1eb06708bc39abba404d7f678820a853e832ed27a9fe6b1c37b4c21d4267c3
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_packagedata became valid
NOTE: Running setscene task 1070 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_packagedata_setscene)
NOTE: recipe xxhash-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xxhash-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxt-1_1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 2320 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_compile)
NOTE: recipe libxt-1_1.3.1-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 2321 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2322 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 2323 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2324 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: recipe libxt-1_1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 2326 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_install: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_install: Succeeded
NOTE: Running task 2327 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_package)
NOTE: recipe libxt-1_1.3.1-r0: task do_package: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2329 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_compile_ptest_base)
NOTE: recipe lz4-1_1.10.0-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_package unihash changed to 3c53a0b22d42baf33efb6be97261d6df343cbf9ef49c5ceaf40f131fab6c8f0c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx became valid
NOTE: Running setscene task 1067 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx_setscene)
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Started
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1070 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_packagedata_setscene)
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_package unihash changed to d49cec41e4ac79dff5fec19b0dcb83f9bfe0faa1f2c09bfb674f23f8fbb36609
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_packagedata became valid
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1069 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe libxt-1_1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2333 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_create_spdx)
NOTE: recipe libxt-1_1.3.1-r0: task do_create_spdx: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_create_spdx: Succeeded
NOTE: recipe lz4-1_1.10.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2334 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_install)
NOTE: recipe lz4-1_1.10.0-r0: task do_install: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_install: Succeeded
NOTE: Running task 2335 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_install_ptest_base)
NOTE: recipe lz4-1_1.10.0-r0: task do_install_ptest_base: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2336 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_package)
NOTE: Running task 2338 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2339 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_configure)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_configure: Succeeded
NOTE: Running task 2340 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_compile)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_compile: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_package unihash changed to 390653dcdceb024fa2b64a02fdbc35acac4a06030b42889c3ee622a7d793813c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_packagedata became valid
NOTE: Running setscene task 1068 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_create_spdx_setscene)
NOTE: recipe lz4-1_1.10.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1070 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_packagedata_setscene)
NOTE: recipe lz4-1_1.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe squashfs-tools-4.7.5-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2343 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_install)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_install: Succeeded
NOTE: Running task 2344 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_package)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_package unihash changed to b42f1bb3aaaaf725036e3a772b2f670aa1089c3228c8079736d8373fb989b767
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_package_write_ipk became valid
NOTE: Running setscene task 1062 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 1065 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_package_qa_setscene)
NOTE: Running setscene task 1067 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 1069 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_create_spdx_setscene)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_package_qa_setscene: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe squashfs-tools-4.7.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe squashfs-tools-4.7.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe squashfs-tools-4.7.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 1070 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_packagedata_setscene)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2350 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_package_write_rpm)
NOTE: recipe vim-9.2.0843-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.7.5-r0: task do_package_write_rpm: Started
NOTE: Setscene tasks completed
NOTE: Running task 2352 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_unpack)
NOTE: recipe vim-9.2.0843-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_package_write_rpm unihash changed to 2ecd27338b20e93e3d0117e365cbbb31dabb5c4798b708e88223e1e61c49c2ef
NOTE: recipe vim-9.2.0843-r0: task do_unpack: Succeeded
NOTE: Running task 2353 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_patch)
NOTE: recipe vim-9.2.0843-r0: task do_patch: Started
NOTE: recipe vim-9.2.0843-r0: task do_patch: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_configure: Succeeded
NOTE: Running task 2355 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_configure_ptest_base)
NOTE: recipe python3-3.14.7-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.14.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2356 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_compile)
NOTE: recipe python3-3.14.7-r0: task do_compile: Started
WARNING: libarchive-3.8.9-r0 do_fetch: Failed to fetch URL https://libarchive.org/downloads/libarchive-3.8.9.tar.gz, attempting MIRRORS if available
NOTE: recipe libarchive-3.8.9-r0: task do_fetch: Failed
NOTE: recipe python3-3.14.7-r0: task do_compile: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_configure: Succeeded
NOTE: recipe gcc-16.1.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2356 tasks of which 2190 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260815052316.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260815052316.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libarchive/3.8.9/temp/log.do_fetch.558967
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libarchive-3.8.9-r0 do_fetch: Fetcher failure: Fetch command ['wget', '--tries=2', '--timeout=100', '--output-document=/srv/pokybuild/yocto-worker/auh/build/build/downloads/libarchive-3.8.9.tar.gz.tmp', '--continue', '--directory-prefix=/srv/pokybuild/yocto-worker/auh/build/build/downloads', 'https://libarchive.org/downloads/libarchive-3.8.9.tar.gz', '--progress=dot', '--verbose'] failed with exit code 4, see logfile for output
ERROR: libarchive-3.8.9-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://libarchive.org/downloads/libarchive-3.8.9.tar.gz')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libarchive/3.8.9/temp/log.do_fetch.558967
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch) failed with exit code '1'

--===============7803735213296277243==--

