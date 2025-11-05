Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54FECCD4855
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:49 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2379.1762384603751662187
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hg3i4vuq;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=I8j+Y87z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019a564ee725-aa883d21-a743-4764-99ce-4954522ef479-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384603;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MmAqM/vfVWeBC8LULGlN7dc/3OA/w98Xvf/gT3PsxDI=;
	b=hg3i4vuqN5Re4jDiQSkFCyzr8BANEDjHPp5fbhjPJ2rMDg79JOJx9OIGIMywrE5p
	pyVkUCh0BwhzaPvIJpo2zEq0zM9G2QZUqwI6fEiszG+CYZ72gOjLCK8ZeWxrw3zS9He
	Q0Phw8NYjzEOCzQTCNIKYUFjCyvL7MO9Gn3alM1s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384603;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MmAqM/vfVWeBC8LULGlN7dc/3OA/w98Xvf/gT3PsxDI=;
	b=I8j+Y87zxsMci9Xs53SPHH6PF8zOkWcjTtG2eldRN/qQMQ+EzHiPtwJw8SY6q0RF
	yeAz9WRtKZL6uf3tBuAgtXChgwtwJEPUsO1+uEmRtA3CrCJq47yL51b9JitXnX56nIb
	NAf8nYrXMZDHRxZFj2cPs/67DLbJy0OXsnSHLunA=
Content-Type: multipart/mixed; boundary="===============8925242384854682456=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] x264: upgrading to b35605ace3ddf7c1a5d67a2eb553f034aef41d55
 FAILED
Message-ID: <0101019a564ee725-aa883d21-a743-4764-99ce-4954522ef479-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225906

--===============8925242384854682456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *x264* to *b35605ace3ddf7c1a5d67a2eb553f034aef41d55* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-x264-upgrade-to-latest-revision.patch
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
From 0381ed7a2b4cfa6c92ae6b18f31e5be3d26ee147 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 21:59:06 +0000
Subject: [PATCH] x264: upgrade to latest revision

---
 meta/recipes-multimedia/x264/x264_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index eb72ba006a..23f280a95e 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -8,12 +8,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "nasm-native"
 
-SRC_URI = "git://code.videolan.org/videolan/x264.git;branch=stable;protocol=https \
-    file://32c3b801191522961102d4bea292cdb61068d0dd.patch \
+SRC_URI = "git://code.videolan.org/videolan/x264.git;branch=master;protocol=https \
+           file://32c3b801191522961102d4bea292cdb61068d0dd.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "31e19f92f00c7003fa115047ce50978bc98c3a0d"
+SRCREV = "b35605ace3ddf7c1a5d67a2eb553f034aef41d55"
 
 PV = "r3039+git"
 
-- 
2.47.1


--===============8925242384854682456==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-x264-upgrade-to-latest-revision.patch"

RnJvbSAwMzgxZWQ3YTJiNGNmYTZjOTJhZTZiMThmMzFlNWJlM2QyNmVlMTQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAyMTo1OTowNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHgy
NjQ6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1tdWx0aW1l
ZGlhL3gyNjQveDI2NF9naXQuYmIgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGlt
ZWRpYS94MjY0L3gyNjRfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEveDI2NC94MjY0
X2dpdC5iYgppbmRleCBlYjcyYmEwMDZhLi4yM2YyODBhOTVlIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS94MjY0L3gyNjRfZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0
aW1lZGlhL3gyNjQveDI2NF9naXQuYmIKQEAgLTgsMTIgKzgsMTIgQEAgTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vQ09QWUlORzttZDU9OTRkNTVkNTEyYTliYTM2Y2FhOWI3ZGYwNzliYWUxOWYi
CiAKIERFUEVORFMgPSAibmFzbS1uYXRpdmUiCiAKLVNSQ19VUkkgPSAiZ2l0Oi8vY29kZS52aWRl
b2xhbi5vcmcvdmlkZW9sYW4veDI2NC5naXQ7YnJhbmNoPXN0YWJsZTtwcm90b2NvbD1odHRwcyBc
Ci0gICAgZmlsZTovLzMyYzNiODAxMTkxNTIyOTYxMTAyZDRiZWEyOTJjZGI2MTA2OGQwZGQucGF0
Y2ggXAorU1JDX1VSSSA9ICJnaXQ6Ly9jb2RlLnZpZGVvbGFuLm9yZy92aWRlb2xhbi94MjY0Lmdp
dDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIFwKKyAgICAgICAgICAgZmlsZTovLzMyYzNi
ODAxMTkxNTIyOTYxMTAyZDRiZWEyOTJjZGI2MTA2OGQwZGQucGF0Y2ggXAogICAgICAgICAgICAi
CiBVUFNUUkVBTV9DSEVDS19DT01NSVRTID0gIjEiCiAKLVNSQ1JFViA9ICIzMWUxOWY5MmYwMGM3
MDAzZmExMTUwNDdjZTUwOTc4YmM5OGMzYTBkIgorU1JDUkVWID0gImIzNTYwNWFjZTNkZGY3YzFh
NWQ2N2EyZWI1NTNmMDM0YWVmNDFkNTUiCiAKIFBWID0gInIzMDM5K2dpdCIKIAotLSAKMi40Ny4x
Cgo=

--===============8925242384854682456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1945 entries from dependency cache.
Parsing recipes...done.
Parsing of 948 .bb files complete (947 cached, 1 parsed). 1945 targets, 47 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-e6a36552581c10afd2dcf873e755ad0cf166689c"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:e6a36552581c10afd2dcf873e755ad0cf166689c"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 156 Local 145 Mirrors 0 Missed 11 Current 335 (92% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 484 of 491 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_recipe_qa_setscene)
NOTE: recipe x264-r3039+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe x264-r3039+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1382 of 1401 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_fetch)
NOTE: recipe x264-r3039+git-r0: task do_fetch: Started
NOTE: recipe x264-r3039+git-r0: task do_fetch: Succeeded
NOTE: Running task 1383 of 1401 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_unpack)
NOTE: Running task 1384 of 1401 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe x264-r3039+git-r0: task do_unpack: Started
NOTE: recipe x264-r3039+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe x264-r3039+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe x264-r3039+git-r0: task do_unpack: Succeeded
NOTE: Running task 1385 of 1401 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_patch)
NOTE: Running task 1386 of 1401 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_collect_spdx_deps)
NOTE: recipe x264-r3039+git-r0: task do_patch: Started
NOTE: recipe x264-r3039+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe x264-r3039+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe x264-r3039+git-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1386 tasks of which 1381 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105215852.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105215852.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/x264/r3039+git/temp/log.do_patch.4016437
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: x264-r3039+git-r0 do_patch: Applying patch '32c3b801191522961102d4bea292cdb61068d0dd.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/x264/r3039+git/sources/x264-r3039+git'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/x264/r3039+git/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 32c3b801191522961102d4bea292cdb61068d0dd.patch
patching file input/lavf.c
Hunk #1 FAILED at 33.
Hunk #2 FAILED at 141.
2 out of 2 hunks FAILED -- rejects in file input/lavf.c
Patch 32c3b801191522961102d4bea292cdb61068d0dd.patch can be reverse-applied

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/x264/r3039+git/temp/log.do_patch.4016437
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_patch) failed with exit code '1'

--===============8925242384854682456==--

