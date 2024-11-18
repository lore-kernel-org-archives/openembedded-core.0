Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D30E7D6207C
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:53 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.4798.1731964613643664920
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=aZO12gPL;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=IYWdDgnm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019341237bb8-b2f75ec2-47a2-47ff-98ae-d8a476fe97a5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964664;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YcAQ8a2M/TH7PLXT6TKFtGKaD7RvTWtfSVbVIXmHYeU=;
	b=aZO12gPLWB8UxIr5hvmf4Rfz+42SXwxbwmyEi6+Nkr+H/qqq7d8/QWIMfkkO7D/m
	Kk8gNES+k7AgpCPS6U/leiUNlg/nYwmLxwGRZ2fDCrMQxXGvXD012xu4JarEgtBj1xa
	b2qELkGLaxv2uCrAwRqf9FvuDPVtJuSNiQme3gIQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964664;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YcAQ8a2M/TH7PLXT6TKFtGKaD7RvTWtfSVbVIXmHYeU=;
	b=IYWdDgnmhtvd19UJGon/3KHI8XuN07X/Qp70JzKSiz+aAfq2+dfvNBChcq/y8g3N
	i7/PT5ZDNRnVlbGDskEdJcHPkHUeAdG5X1bjib4uJ9A0+UO8N6KmfG32mATva54eEnd
	1dP9AgV9i8ViUpty80heGBAc2KBEoRfrHvsJAtIQ=
Content-Type: multipart/mixed; boundary="===============8656020183587224448=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-tools: upgrading to 1.3.296.0 FAILED
Message-ID: <0101019341237bb8-b2f75ec2-47a2-47ff-98ae-d8a476fe97a5-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207328

--===============8656020183587224448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *spirv-tools* to *1.3.296.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-spirv-tools-upgrade-1.3.290.0-1.3.296.0.patch
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
From be442eb44819b93a9eeae128b67d7e59830e5784 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 17 Nov 2024 23:45:29 +0000
Subject: [PATCH] spirv-tools: upgrade 1.3.290.0 -> 1.3.296.0

---
 .../spir/{spirv-tools_1.3.290.0.bb => spirv-tools_1.3.296.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-tools_1.3.290.0.bb => spirv-tools_1.3.296.0.bb} (97%)

diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.290.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.296.0.bb
similarity index 97%
rename from meta/recipes-graphics/spir/spirv-tools_1.3.290.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.3.296.0.bb
index d0f1c387f1..c817af9908 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.290.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.296.0.bb
@@ -7,7 +7,7 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "0cfe9e7219148716dfd30b37f4d21753f098707a"
+SRCREV = "6dcc7e350a0b9871a825414d42329e44b0eb8109"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https \
            file://0001-update_build_version.py-support-an-envvar-to-force-t.patch \
            "
-- 
2.44.1


--===============8656020183587224448==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-tools-upgrade-1.3.290.0-1.3.296.0.patch"

RnJvbSBiZTQ0MmViNDQ4MTliOTNhOWVlYWUxMjhiNjdkN2U1OTgzMGU1Nzg0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTcgTm92IDIwMjQgMjM6NDU6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cGlydi10b29sczogdXBncmFkZSAxLjMuMjkwLjAgLT4gMS4zLjI5Ni4wCgotLS0KIC4uLi9zcGly
L3tzcGlydi10b29sc18xLjMuMjkwLjAuYmIgPT4gc3BpcnYtdG9vbHNfMS4zLjI5Ni4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3tzcGlydi10b29sc18xLjMuMjkwLjAuYmIg
PT4gc3BpcnYtdG9vbHNfMS4zLjI5Ni4wLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LXRvb2xzXzEuMy4yOTAuMC5iYiBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9zcGlyL3NwaXJ2LXRvb2xzXzEuMy4yOTYuMC5iYgpzaW1pbGFyaXR5IGluZGV4
IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi10b29sc18x
LjMuMjkwLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LXRv
b2xzXzEuMy4yOTYuMC5iYgppbmRleCBkMGYxYzM4N2YxLi5jODE3YWY5OTA4IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi10b29sc18xLjMuMjkwLjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtdG9vbHNfMS4zLjI5Ni4wLmJiCkBA
IC03LDcgKzcsNyBAQCBTRUNUSU9OID0gImdyYXBoaWNzIgogTElDRU5TRSAgPSAiQXBhY2hlLTIu
MCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTNiODNlZjk2Mzg3ZjE0
NjU1ZmM4NTRkZGMzYzZiZDU3IgogCi1TUkNSRVYgPSAiMGNmZTllNzIxOTE0ODcxNmRmZDMwYjM3
ZjRkMjE3NTNmMDk4NzA3YSIKK1NSQ1JFViA9ICI2ZGNjN2UzNTBhMGI5ODcxYTgyNTQxNGQ0MjMy
OWU0NGIwZWI4MTA5IgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL0tocm9ub3NHcm91cC9T
UElSVi1Ub29scy5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHMgXAogICAgICAgICAgICBm
aWxlOi8vMDAwMS11cGRhdGVfYnVpbGRfdmVyc2lvbi5weS1zdXBwb3J0LWFuLWVudnZhci10by1m
b3JjZS10LnBhdGNoIFwKICAgICAgICAgICAgIgotLSAKMi40NC4xCgo=

--===============8656020183587224448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1882 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1880 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:e1d8d0aa5a6290940eecb85a318f78f709fd519e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 216 Local 204 Mirrors 0 Missed 12 Current 244 (94% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 294 of 460 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.3.290.0.bb:do_create_spdx_setscene)
NOTE: Running task 787 of 1338 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.3.296.0.bb:do_recipe_qa)
NOTE: recipe spirv-headers-1_1.3.290.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-tools-1_1.3.296.0-r0: task do_recipe_qa: Started
NOTE: recipe spirv-headers-1_1.3.290.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 429 of 460 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe spirv-tools-1_1.3.296.0-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.3.296.0.bb:do_recipe_qa unihash changed to 2e3305fdda12893c3e5a9745e977330830a5d50f962b0b776e6c880f8c63a694
NOTE: Running task 934 of 1338 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.3.296.0.bb:do_fetch)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-tools-1_1.3.296.0-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 434 of 460 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_create_spdx_setscene)
NOTE: recipe spirv-tools-1_1.3.296.0-r0: task do_fetch: Succeeded
NOTE: Running task 937 of 1338 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.3.296.0.bb:do_unpack)
NOTE: recipe glibc-2.40+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-tools-1_1.3.296.0-r0: task do_unpack: Started
NOTE: recipe glibc-2.40+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 441 of 460 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 446 of 460 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-tools-1_1.3.296.0-r0: task do_unpack: Succeeded
NOTE: Running task 1020 of 1338 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.3.296.0.bb:do_patch)
NOTE: recipe spirv-tools-1_1.3.296.0-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 457 of 460 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1229 of 1338 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.3.296.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1313 of 1338 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.3.296.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.296.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.296.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.296.0-r0: task do_patch: Failed
NOTE: recipe spirv-tools-1_1.3.296.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.296.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Tasks Summary: Attempted 1322 tasks of which 1316 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 10 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241117234437.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241117234437.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.3.296.0.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/spirv-tools/1.3.296.0/temp/log.do_patch.1615775
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: spirv-tools-1_1.3.296.0-r0 do_patch: Applying patch '0001-update_build_version.py-support-an-envvar-to-force-t.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/spirv-tools/1.3.296.0/git'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/spirv-tools/1.3.296.0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-update_build_version.py-support-an-envvar-to-force-t.patch
patching file utils/update_build_version.py
Hunk #1 FAILED at 24.
Hunk #2 FAILED at 150.
2 out of 2 hunks FAILED -- rejects in file utils/update_build_version.py
Patch 0001-update_build_version.py-support-an-envvar-to-force-t.patch can be reverse-applied

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/spirv-tools/1.3.296.0/temp/log.do_patch.1615775
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.3.296.0.bb:do_patch) failed with exit code '1'

--===============8656020183587224448==--

