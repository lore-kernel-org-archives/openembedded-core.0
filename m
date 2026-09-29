Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FAC9CA5FB2
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 06:18:52 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1852.1790662724696126699
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 23:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BxBAMqMm;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qdLUXXP7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a0ebd0c8ac-eb5bb15f-1ee1-428a-87b3-8630d466157c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790662723;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=O++fvPZgsTLpFM8N/OQBic4KvKoCL0YxURMN1MihWn0=;
	b=BxBAMqMmEJTyPqd++5oX5ZDiNjNqnPhcy7YxMx8+oKpJIp7WTg64gmoe2aw8JHej
	XKsyaDwS5DHbXXCWC+tane2Gc/Dk1m2jXzl5UVTFr4zkU+M7tWD2rmxGAGUwvWGqiQp
	xolZeGk/058/QPZyVF7lFmZyGcmdnqxokGEHn7pQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790662723;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=O++fvPZgsTLpFM8N/OQBic4KvKoCL0YxURMN1MihWn0=;
	b=qdLUXXP7FV2W0RzXSXdRhq3TTea4XH6FTg7FUd+t+ftwN/arfWLRH9nLodVNFMfB
	AsubzzRSJlqH5IZkb3/ujsN7k49wT1ARcDI35RDjRFGlEO5lnc/MCTWMC7lg3ERxOoJ
	uvHoywxRpNpHlcSKSY3+cILjuecAcO4oEB6V3JhU=
Content-Type: multipart/mixed; boundary="===============3663864618714242119=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-tools: upgrading to 1.4.363.0 FAILED
Message-ID: <010101a0ebd0c8ac-eb5bb15f-1ee1-428a-87b3-8630d466157c-000000@us-west-2.amazonses.com>
Date: Tue, 29 Sep 2026 06:18:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.29-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 06:18:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246833

--===============3663864618714242119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-tools* to *1.4.363.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-tools-upgrade-1.4.357.0-1.4.363.0.patch
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
From a42c1301174484ea65d9a6a5bcd5976f44a3d0d0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 29 Sep 2026 05:51:35 +0000
Subject: [PATCH] vulkan-tools: upgrade 1.4.357.0 -> 1.4.363.0

build: Update to header v1.4.363
vulkaninfo: add missing <ctime> include
build: Update to header v1.4.362
build: Update to header v1.4.361
vulkaninfo: Include extended flags in video format props output
Update known_good.json
build: Update to header v1.4.360
build: Update to header v1.4.359
build: Avoid AppleClang using the wrong headers
vulkaninfo: Fix 32-bit image usage flags upper bound
build: Update to header v1.4.358
vulkaninfo: VK_KHR_extended_flags interaction with video
Add VK_EXT_display_surface_counter instance extension
vulkaninfo: Enable more instance extensions
---
 .../{vulkan-tools_1.4.357.0.bb => vulkan-tools_1.4.363.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.4.357.0.bb => vulkan-tools_1.4.363.0.bb} (96%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.357.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.363.0.bb
similarity index 96%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.4.357.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.4.363.0.bb
index cafd3e7a0a..b987c1af7f 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.357.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.363.0.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
-SRCREV = "286299bb6b732e4b22771cfb9d7d421542d40501"
+SRCREV = "6fe2055cf2fa921d52a4c6a31528cfc279a6977f"
 
 inherit cmake features_check pkgconfig
 ANY_OF_DISTRO_FEATURES = "x11 wayland"
-- 
2.47.1


--===============3663864618714242119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="vulkan-tools-changelog.txt"

build: Update to header v1.4.363
vulkaninfo: add missing <ctime> include
build: Update to header v1.4.362
build: Update to header v1.4.361
vulkaninfo: Include extended flags in video format props output
Update known_good.json
build: Update to header v1.4.360
build: Update to header v1.4.359
build: Avoid AppleClang using the wrong headers
vulkaninfo: Fix 32-bit image usage flags upper bound
build: Update to header v1.4.358
vulkaninfo: VK_KHR_extended_flags interaction with video
Add VK_EXT_display_surface_counter instance extension
vulkaninfo: Enable more instance extensions

--===============3663864618714242119==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.4.357.0-1.4.363.0.patch"

RnJvbSBhNDJjMTMwMTE3NDQ4NGVhNjVkOWE2YTViY2Q1OTc2ZjQ0YTNkMGQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjkgU2VwIDIwMjYgMDU6NTE6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdG9vbHM6IHVwZ3JhZGUgMS40LjM1Ny4wIC0+IDEuNC4zNjMuMAoKYnVpbGQ6IFVwZGF0
ZSB0byBoZWFkZXIgdjEuNC4zNjMKdnVsa2FuaW5mbzogYWRkIG1pc3NpbmcgPGN0aW1lPiBpbmNs
dWRlCmJ1aWxkOiBVcGRhdGUgdG8gaGVhZGVyIHYxLjQuMzYyCmJ1aWxkOiBVcGRhdGUgdG8gaGVh
ZGVyIHYxLjQuMzYxCnZ1bGthbmluZm86IEluY2x1ZGUgZXh0ZW5kZWQgZmxhZ3MgaW4gdmlkZW8g
Zm9ybWF0IHByb3BzIG91dHB1dApVcGRhdGUga25vd25fZ29vZC5qc29uCmJ1aWxkOiBVcGRhdGUg
dG8gaGVhZGVyIHYxLjQuMzYwCmJ1aWxkOiBVcGRhdGUgdG8gaGVhZGVyIHYxLjQuMzU5CmJ1aWxk
OiBBdm9pZCBBcHBsZUNsYW5nIHVzaW5nIHRoZSB3cm9uZyBoZWFkZXJzCnZ1bGthbmluZm86IEZp
eCAzMi1iaXQgaW1hZ2UgdXNhZ2UgZmxhZ3MgdXBwZXIgYm91bmQKYnVpbGQ6IFVwZGF0ZSB0byBo
ZWFkZXIgdjEuNC4zNTgKdnVsa2FuaW5mbzogVktfS0hSX2V4dGVuZGVkX2ZsYWdzIGludGVyYWN0
aW9uIHdpdGggdmlkZW8KQWRkIFZLX0VYVF9kaXNwbGF5X3N1cmZhY2VfY291bnRlciBpbnN0YW5j
ZSBleHRlbnNpb24KdnVsa2FuaW5mbzogRW5hYmxlIG1vcmUgaW5zdGFuY2UgZXh0ZW5zaW9ucwot
LS0KIC4uLi97dnVsa2FuLXRvb2xzXzEuNC4zNTcuMC5iYiA9PiB2dWxrYW4tdG9vbHNfMS40LjM2
My4wLmJifSAgICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi10b29s
c18xLjQuMzU3LjAuYmIgPT4gdnVsa2FuLXRvb2xzXzEuNC4zNjMuMC5iYn0gKDk2JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi10b29sc18xLjQuMzU3
LjAuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi10b29sc18xLjQuMzYz
LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3Z1bGthbi92dWxrYW4tdG9vbHNfMS40LjM1Ny4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi10b29sc18xLjQuMzYzLjAuYmIKaW5kZXggY2FmZDNl
N2EwYS4uYjk4N2MxYWY3ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGth
bi92dWxrYW4tdG9vbHNfMS40LjM1Ny4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92
dWxrYW4vdnVsa2FuLXRvb2xzXzEuNC4zNjMuMC5iYgpAQCAtNyw3ICs3LDcgQEAgU0VDVElPTiA9
ICJsaWJzIgogTElDRU5TRSA9ICJBcGFjaGUtMi4wIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxl
Oi8vTElDRU5TRS50eHQ7bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogU1JD
X1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL0tocm9ub3NHcm91cC9WdWxrYW4tVG9vbHMuZ2l0O2Jy
YW5jaD1tYWluO3Byb3RvY29sPWh0dHBzO3RhZz12dWxrYW4tc2RrLSR7UFZ9IgotU1JDUkVWID0g
IjI4NjI5OWJiNmI3MzJlNGIyMjc3MWNmYjlkN2Q0MjE1NDJkNDA1MDEiCitTUkNSRVYgPSAiNmZl
MjA1NWNmMmZhOTIxZDUyYTRjNmEzMTUyOGNmYzI3OWE2OTc3ZiIKIAogaW5oZXJpdCBjbWFrZSBm
ZWF0dXJlc19jaGVjayBwa2djb25maWcKIEFOWV9PRl9ESVNUUk9fRkVBVFVSRVMgPSAieDExIHdh
eWxhbmQiCi0tIAoyLjQ3LjEKCg==

--===============3663864618714242119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1991 targets, 43 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-3ff4fe21c9d23a3a4f5771fcdf7b18d147d85ec2"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:3ff4fe21c9d23a3a4f5771fcdf7b18d147d85ec2"
meta-yocto-bsp       
meta-poky            = "master:d36c827e02ab138b446386792fd7588b5a041507"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 244 Local 231 Mirrors 0 Missed 13 Current 328 (94% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 531 of 572 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 533 of 572 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.357.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 1258 of 1414 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.363.0.bb:do_recipe_qa)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vulkan-volk-1.4.357.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vulkan-tools-1.4.363.0-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 553 of 572 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 554 of 572 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe vulkan-volk-1.4.357.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 555 of 572 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe wayland-1.26.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 558 of 572 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_recipe_spdx_setscene)
NOTE: recipe wayland-1.26.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe vulkan-tools-1.4.363.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 1366 of 1414 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.363.0.bb:do_fetch)
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 565 of 572 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe vulkan-tools-1.4.363.0-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1395 of 1414 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.363.0.bb:do_create_recipe_spdx)
NOTE: recipe vulkan-tools-1.4.363.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe vulkan-tools-1.4.363.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe vulkan-tools-1.4.363.0-r0: task do_fetch: Succeeded
NOTE: Running task 1396 of 1414 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.363.0.bb:do_unpack)
NOTE: Running task 1397 of 1414 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.363.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-tools-1.4.363.0-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.4.363.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.4.363.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-tools-1.4.363.0-r0: task do_unpack: Succeeded
NOTE: Running task 1398 of 1414 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.363.0.bb:do_patch)
NOTE: recipe vulkan-tools-1.4.363.0-r0: task do_patch: Started
NOTE: recipe vulkan-tools-1.4.363.0-r0: task do_patch: Succeeded
NOTE: Running task 1399 of 1414 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.363.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1400 of 1414 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.363.0.bb:do_generate_toolchain_file)
NOTE: Running task 1401 of 1414 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.363.0.bb:do_populate_lic)
NOTE: recipe vulkan-tools-1.4.363.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.4.363.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-tools-1.4.363.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-tools-1.4.363.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-tools-1.4.363.0-r0: task do_populate_lic: Succeeded
NOTE: recipe vulkan-tools-1.4.363.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1402 of 1414 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.363.0.bb:do_configure)
NOTE: recipe vulkan-tools-1.4.363.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.4.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-w
 orker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.357.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/l
 ayers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_3.0.7.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['expat', 'gettext-minimal-native', 'glibc', 'libxml2', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 'vulkan-headers', 'vulkan-loader', 'vulkan-volk', 'wayland', 'libpthread-stubs', 'libx11', 'libxau', 'libxcb', 'libxdmcp', 'libxext', 'libxrandr', 'libxrender', 'xtrans', 'xcb-proto', 'xorgproto', 'linux-libc-headers', 'libffi', 'openssl-native', 'ncurses-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'make-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconf-native', 'pseudo-native', 'bzip2-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libmpc-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| The no-dev option is deprecated.  Use -Wno-author instead.
| -- The C compiler identification is GNU 16.2.0
| -- The CXX compiler identification is GNU 16.2.0
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Check for working C compiler: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.363.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc - skipped
| -- Detecting C compile features
| -- Detecting C compile features - done
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working CXX compiler: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.363.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ - skipped
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| CMake Error at CMakeLists.txt:59 (find_package):
|   Could not find a configuration file for package "VulkanHeaders" that is
|   compatible with requested version "1.4.363".
| 
|   The following configuration files were considered but not accepted:
| 
|     /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.363.0/recipe-sysroot/usr/share/cmake/VulkanHeaders/VulkanHeadersConfig.cmake, version: 1.4.357
|       The version found is not compatible with the version requested.
| 
| 
| 
| -- Configuring incomplete, errors occurred!
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.363.0/temp/run.do_configure.978486:161 exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja $oecmake_sitefile /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.363.0/sources/vulkan-tools-1.4.363.0 -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include -DCMAKE_INSTALL_DATAROOTDIR:PATH=share -DPYTHON_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython3_EXECUTABLE:PATH=/srv/pokybuild/yoc
 to-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.363.0/toolchain.cmake -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON -DBUILD_TESTS=OFF -DBUILD_CUBE=OFF -DPYTHON_EXECUTABLE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/python3 -DBUILD_WSI_WAYLAND_SUPPORT=ON -DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON -Wno-dev'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.363.0/temp/run.do_configure.978486, line 161
| 	#2: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.363.0/temp/run.do_configure.978486, line 140
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.363.0/temp/run.do_configure.978486, line 179
NOTE: recipe vulkan-tools-1.4.363.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1402 tasks of which 1392 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260929055117.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260929055117.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.363.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.363.0/temp/log.do_configure.978486
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-tools-1.4.363.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.363.0/temp/run.do_configure.978486' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.363.0/temp/log.do_configure.978486
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.363.0.bb:do_configure) failed with exit code '1'

--===============3663864618714242119==--

