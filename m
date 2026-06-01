Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DECD2CD6E6E
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:36:02 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1556.1780328132368531067
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RyKenJni;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hii7GeX+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019e83d3b9a8-7eafd51e-83fa-4c82-878d-550322eb2280-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328151;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jYkVREUuprCDgEtwNxsf9f+rZ/Aod9F+QPMLYYhXhPY=;
	b=RyKenJniLBa7VWDut8vMwh+HVD+RaSiR680N9OSixXODxCQF+sGIL8FP4/nhFS8Z
	dcALc+wlsbNMFXiZMuzj/Uuv7H2HDiC9VS1PKGPzq/ZLEGZrofg5kSL4oKjfTvW3EBT
	+SLey7ZZL/uF4PIb1veCcJYs1+n4lJp/biI9d/jQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328151;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jYkVREUuprCDgEtwNxsf9f+rZ/Aod9F+QPMLYYhXhPY=;
	b=hii7GeX+TYBunEa3KWPNAlPCmNvHHXDv3jSpTgp6WsRpPqApL1iHplOB8LO8MQDX
	k0RcZsoke2uoW52WTHkUGRk0en1beT8+ADItkX0CnlWlpeXLqx8evXur1hPDhtYMTKr
	bcixM79exj61Azalq6N7ScGyXZREXDOsXyLipsx4=
Content-Type: multipart/mixed; boundary="===============2143132000022880531=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] vulkan-loader: upgrading to 1.4.350.0 FAILED
Message-ID: <0101019e83d3b9a8-7eafd51e-83fa-4c82-878d-550322eb2280-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237929

--===============2143132000022880531==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-loader* to *1.4.350.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-loader-upgrade-1.4.341.0-1.4.350.0.patch
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
From d374f9688ff73c266a64ab1399906ced37fb19f5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 11:44:01 +0000
Subject: [PATCH] vulkan-loader: upgrade 1.4.341.0 -> 1.4.350.0

---
 .../{vulkan-loader_1.4.341.0.bb => vulkan-loader_1.4.350.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.4.341.0.bb => vulkan-loader_1.4.350.0.bb} (97%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb
similarity index 97%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb
index e6ad8738fc..1180cdc91c 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb
@@ -10,7 +10,7 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
-SRCREV = "32fcb949e253cbeb40cda7ea76122b492db579ae"
+SRCREV = "a9e72c66d5cb79911eb9a9063bf4016dd0a3a123"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
-- 
2.47.1


--===============2143132000022880531==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-loader-upgrade-1.4.341.0-1.4.350.0.patch"

RnJvbSBkMzc0Zjk2ODhmZjczYzI2NmE2NGFiMTM5OTkwNmNlZDM3ZmIxOWY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxMTo0NDowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi1sb2FkZXI6IHVwZ3JhZGUgMS40LjM0MS4wIC0+IDEuNC4zNTAuMAoKLS0tCiAuLi4ve3Z1
bGthbi1sb2FkZXJfMS40LjM0MS4wLmJiID0+IHZ1bGthbi1sb2FkZXJfMS40LjM1MC4wLmJifSAg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3t2dWxrYW4tbG9hZGVyXzEuNC4zNDEu
MC5iYiA9PiB2dWxrYW4tbG9hZGVyXzEuNC4zNTAuMC5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1sb2FkZXJfMS40LjM0MS4wLmJiIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tbG9hZGVyXzEuNC4zNTAuMC5iYgpz
aW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVs
a2FuL3Z1bGthbi1sb2FkZXJfMS40LjM0MS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvdnVsa2FuL3Z1bGthbi1sb2FkZXJfMS40LjM1MC4wLmJiCmluZGV4IGU2YWQ4NzM4ZmMu
LjExODBjZGM5MWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVs
a2FuLWxvYWRlcl8xLjQuMzQxLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGth
bi92dWxrYW4tbG9hZGVyXzEuNC4zNTAuMC5iYgpAQCAtMTAsNyArMTAsNyBAQCBTRUNUSU9OID0g
ImxpYnMiCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFLnR4dDttZDU9N2RiZWZlZDIzMjQyNzYwYWEzNDc1ZWU0MjgwMWM1YWMiCiBTUkNf
VVJJID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1Z1bGthbi1Mb2FkZXIuZ2l0O2Jy
YW5jaD1tYWluO3Byb3RvY29sPWh0dHBzO3RhZz12dWxrYW4tc2RrLSR7UFZ9IgotU1JDUkVWID0g
IjMyZmNiOTQ5ZTI1M2NiZWI0MGNkYTdlYTc2MTIyYjQ5MmRiNTc5YWUiCitTUkNSRVYgPSAiYTll
NzJjNjZkNWNiNzk5MTFlYjlhOTA2M2JmNDAxNmRkMGEzYTEyMyIKIAogUkVRVUlSRURfRElTVFJP
X0ZFQVRVUkVTID0gInZ1bGthbiIKIAotLSAKMi40Ny4xCgo=

--===============2143132000022880531==
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
DISTRO_VERSION       = "6.0.99+snapshot-9afd6d7e0ac4384f1fa4aeabbc156cdbf22c5e15"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:9afd6d7e0ac4384f1fa4aeabbc156cdbf22c5e15"
meta-yocto-bsp       
meta-poky            = "master:d13ca2a2e0f478046d920b8fc7dd3098952b5ad8"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 277 Local 258 Mirrors 0 Missed 19 Current 804 (93% match, 98% complete)
done.
Removing 8 stale sstate objects for arch x86-64-v3...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 823 of 1081 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 953 of 1081 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 955 of 1081 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.341.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 981 of 1081 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-tools-native.bb:do_create_spdx_setscene)
NOTE: Running setscene task 998 of 1081 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1004 of 1081 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1018 of 1081 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe mesa-tools-native-2_26.0.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glslang-native-1_1.4.341.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-tools-native-2_26.0.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1022 of 1081 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 1031 of 1081 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-tools-native.bb:do_create_recipe_spdx_setscene)
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1033 of 1081 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-tools-native.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1055 of 1081 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_recipe_qa_setscene)
NOTE: recipe glslang-native-1_1.4.341.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe mesa-2_26.0.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe mesa-tools-native-2_26.0.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe mesa-tools-native-2_26.0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe mesa-tools-native-2_26.0.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 1778 of 2556 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_fetch)
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_fetch: Started
NOTE: Running task 2023 of 2556 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: Running task 2306 of 2556 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_write_config)
NOTE: recipe mesa-tools-native-2_26.0.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_26.0.6-r0: task do_fetch: Started
NOTE: Running setscene task 1078 of 1081 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-tools-native.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1079 of 1081 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.133.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_26.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 2367 of 2556 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: Running task 2393 of 2556 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_create_recipe_spdx)
NOTE: recipe mesa-tools-native-2_26.0.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_write_config: Started
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-native-2.4.133-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2496 of 2556 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_unpack)
NOTE: Running task 2497 of 2556 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe mesa-tools-native-2_26.0.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_26.0.6-r0: task do_unpack: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-native-2.4.133-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1081 of 1081 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.133.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-native-2.4.133-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-native-2.4.133-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2523 of 2556 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_recipe_spdx)
NOTE: recipe mesa-2_26.0.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_unpack: Succeeded
NOTE: Running task 2524 of 2556 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_patch)
NOTE: recipe mesa-2_26.0.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_patch: Succeeded
NOTE: Running task 2526 of 2556 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_generate_toolchain_file)
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2528 of 2556 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_configure)
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_configure: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 2529 of 2556 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: recipe mesa-2_26.0.6-r0: task do_patch: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_patch: Succeeded
NOTE: Running task 2531 of 2556 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_rust_gen_targets)
NOTE: recipe mesa-2_26.0.6-r0: task do_rust_gen_targets: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_rust_gen_targets: Succeeded
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.3.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/au
 h/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['expat', 'gettext-minimal-native', 'glibc', 'libxml2', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 'vulkan-headers', 'wayland', 'libpthread-stubs', 'libx11', 'libxau', 'libxcb', 'libxdmcp', 'libxext', 'libxrandr', 'libxrender', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'linux-libc-headers', 'libffi', 'openssl-native', 'ncurses-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'make-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconf-native', 'pseudo-native', 'bzip2-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libmpc-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| -- The C compiler identification is GNU 16.1.0
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Check for working C compiler: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.350.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc - skipped
| -- Detecting C compile features
| -- Detecting C compile features - done
| CMake Error at CMakeLists.txt:56 (if):
|   if given arguments:
| 
|     "VERSION_GREATER" "1.4.350"
| 
|   Unknown arguments specified
| 
| 
| -- Configuring incomplete, errors occurred!
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.350.0/temp/run.do_configure.3478230:161 exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja $oecmake_sitefile /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.350.0/sources/vulkan-loader-1.4.350.0 -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include -DCMAKE_INSTALL_DATAROOTDIR:PATH=share -DPYTHON_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython3_EXECUTABLE:PATH=/srv/pokybuild
 /yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.350.0/toolchain.cmake -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON -DBUILD_TESTS=OFF -DPYTHON_EXECUTABLE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/python3 -DASSEMBLER_WORKS=FALSE -DVulkanHeaders_INCLUDE_DIR=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.350.0/recipe-sysroot/usr/include -DVulkanRegistry_DIR=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.350.0/recipe-sysroot//usr/share -DBUILD_WSI_WAYLAND_SUPPORT=ON -DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON -Wno-dev'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.350.0/temp/run.do_configure.3478230, line 161
| 	#2: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.350.0/temp/run.do_configure.3478230, line 140
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.350.0/temp/run.do_configure.3478230, line 179
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2531 tasks of which 2518 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601114347.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601114347.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.350.0/temp/log.do_configure.3478230
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-loader-1.4.350.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.350.0/temp/run.do_configure.3478230' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-loader/1.4.350.0/temp/log.do_configure.3478230
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_configure) failed with exit code '1'

--===============2143132000022880531==--

