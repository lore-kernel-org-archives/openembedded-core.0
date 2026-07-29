Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F29C54FDF
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 07:24:34 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6064.1785309865377282701
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 00:24:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=D55qBedc;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=yjwTGQpQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019facc2be6d-319eee66-19c4-46e2-9a19-a1afb1b06d6a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785309871;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=8d1PFEwH2EpIkHo6xqm1DgQyS5PckPDYJvtiTa4zsHk=;
	b=D55qBedcgDPN61eXwL6ogV+o7Yf2NJrzo1BAt0NgLkqBWXj5R9G6H2z7/1RULPoA
	2vZI1nhTwp042Wz/biLPIIytHi1pPs4e0agqfNqBSV9+hF28QeDiIuPNzFHLqRblu0Y
	tEj4hXSxT6j89uxBNCgGMp1kXanSueL0YbIZtGGE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785309871;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=8d1PFEwH2EpIkHo6xqm1DgQyS5PckPDYJvtiTa4zsHk=;
	b=yjwTGQpQoB9Kbhp6KtTwVykklGelSFxpMlzm+37/EboAgq0RoRtHrNWfGgq4HBaK
	0Ywi72msZPObV87hNc8xP+amqTUdlCs1kUl1kgRMVeiuhKq6cJek/4B3wn4GNS0luna
	VSR4w42D67Edo4Ub9CAPLKtY902PJmyg3BFX+QHA=
Content-Type: multipart/mixed; boundary="===============8731574825918910716=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-tools: upgrading to 1.4.357.0 FAILED
Message-ID: <0101019facc2be6d-319eee66-19c4-46e2-9a19-a1afb1b06d6a-000000@us-west-2.amazonses.com>
Date: Wed, 29 Jul 2026 07:24:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.29-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 07:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242248

--===============8731574825918910716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-tools* to *1.4.357.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-tools-upgrade-1.4.350.1-1.4.357.0.patch
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
From 6cd7a91f3247b789c695be3bd82b0f75a48b8fad Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 29 Jul 2026 06:29:37 +0000
Subject: [PATCH] vulkan-tools: upgrade 1.4.350.1 -> 1.4.357.0

286299bb build(deps): bump actions/setup-python from 6 to 7
8c66b352 build: Update to header v1.4.357
2a863f5a vulkaninfo: Make vulkan entry point variables static
6d586e9a build: Update to header v1.4.356
be84f565 vulkaninfo: QNX changes to check for Screen windowing system availability
a3431de1 build: Update to header v1.4.355
b7ae55b3 build(deps): bump actions/checkout from 6 to 7
db008c1a vulkaninfo: Add VK_KHR_display support and related fixes
ec6931a3 build: Update to header v1.4.354
68749eaf build: Update to header v1.4.353
e3d18f90 build(deps): bump actions/checkout from 4 to 6
822a2d8e build: Update to header v1.4.352
225242ea chore: Improve REUSE compliance
ead00c13 chore: Add REUSE.toml for REUSE 3.3 spec compliance
353f23f2 build: Update to header v1.4.351
d2994039 Add AI-Assisted Contributions to CONTRIBUTING
5d407496 cube: Print physical device API and driver version
c23b309b cube: Fix leaks in demo_create_xcb_window
---
 .../{vulkan-tools_1.4.350.1.bb => vulkan-tools_1.4.357.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.4.350.1.bb => vulkan-tools_1.4.357.0.bb} (96%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.1.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.357.0.bb
similarity index 96%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.4.357.0.bb
index ece9961c71..cafd3e7a0a 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.357.0.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
-SRCREV = "1cb3a319969cf0d3e2315b0a87a27447f55b4167"
+SRCREV = "286299bb6b732e4b22771cfb9d7d421542d40501"
 
 inherit cmake features_check pkgconfig
 ANY_OF_DISTRO_FEATURES = "x11 wayland"
-- 
2.47.1


--===============8731574825918910716==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.4.350.1-1.4.357.0.patch"

RnJvbSA2Y2Q3YTkxZjMyNDdiNzg5YzY5NWJlM2JkODJiMGY3NWE0OGI4ZmFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjkgSnVsIDIwMjYgMDY6Mjk6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdG9vbHM6IHVwZ3JhZGUgMS40LjM1MC4xIC0+IDEuNC4zNTcuMAoKMjg2Mjk5YmIgYnVp
bGQoZGVwcyk6IGJ1bXAgYWN0aW9ucy9zZXR1cC1weXRob24gZnJvbSA2IHRvIDcKOGM2NmIzNTIg
YnVpbGQ6IFVwZGF0ZSB0byBoZWFkZXIgdjEuNC4zNTcKMmE4NjNmNWEgdnVsa2FuaW5mbzogTWFr
ZSB2dWxrYW4gZW50cnkgcG9pbnQgdmFyaWFibGVzIHN0YXRpYwo2ZDU4NmU5YSBidWlsZDogVXBk
YXRlIHRvIGhlYWRlciB2MS40LjM1NgpiZTg0ZjU2NSB2dWxrYW5pbmZvOiBRTlggY2hhbmdlcyB0
byBjaGVjayBmb3IgU2NyZWVuIHdpbmRvd2luZyBzeXN0ZW0gYXZhaWxhYmlsaXR5CmEzNDMxZGUx
IGJ1aWxkOiBVcGRhdGUgdG8gaGVhZGVyIHYxLjQuMzU1CmI3YWU1NWIzIGJ1aWxkKGRlcHMpOiBi
dW1wIGFjdGlvbnMvY2hlY2tvdXQgZnJvbSA2IHRvIDcKZGIwMDhjMWEgdnVsa2FuaW5mbzogQWRk
IFZLX0tIUl9kaXNwbGF5IHN1cHBvcnQgYW5kIHJlbGF0ZWQgZml4ZXMKZWM2OTMxYTMgYnVpbGQ6
IFVwZGF0ZSB0byBoZWFkZXIgdjEuNC4zNTQKNjg3NDllYWYgYnVpbGQ6IFVwZGF0ZSB0byBoZWFk
ZXIgdjEuNC4zNTMKZTNkMThmOTAgYnVpbGQoZGVwcyk6IGJ1bXAgYWN0aW9ucy9jaGVja291dCBm
cm9tIDQgdG8gNgo4MjJhMmQ4ZSBidWlsZDogVXBkYXRlIHRvIGhlYWRlciB2MS40LjM1MgoyMjUy
NDJlYSBjaG9yZTogSW1wcm92ZSBSRVVTRSBjb21wbGlhbmNlCmVhZDAwYzEzIGNob3JlOiBBZGQg
UkVVU0UudG9tbCBmb3IgUkVVU0UgMy4zIHNwZWMgY29tcGxpYW5jZQozNTNmMjNmMiBidWlsZDog
VXBkYXRlIHRvIGhlYWRlciB2MS40LjM1MQpkMjk5NDAzOSBBZGQgQUktQXNzaXN0ZWQgQ29udHJp
YnV0aW9ucyB0byBDT05UUklCVVRJTkcKNWQ0MDc0OTYgY3ViZTogUHJpbnQgcGh5c2ljYWwgZGV2
aWNlIEFQSSBhbmQgZHJpdmVyIHZlcnNpb24KYzIzYjMwOWIgY3ViZTogRml4IGxlYWtzIGluIGRl
bW9fY3JlYXRlX3hjYl93aW5kb3cKLS0tCiAuLi4ve3Z1bGthbi10b29sc18xLjQuMzUwLjEuYmIg
PT4gdnVsa2FuLXRvb2xzXzEuNC4zNTcuMC5iYn0gICAgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdnVsa2FuL3t2dWxrYW4tdG9vbHNfMS40LjM1MC4xLmJiID0+IHZ1bGthbi10b29sc18xLjQu
MzU3LjAuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGth
bi92dWxrYW4tdG9vbHNfMS40LjM1MC4xLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGth
bi92dWxrYW4tdG9vbHNfMS40LjM1Ny4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXRvb2xzXzEuNC4zNTAuMS5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdG9vbHNfMS40
LjM1Ny4wLmJiCmluZGV4IGVjZTk5NjFjNzEuLmNhZmQzZTdhMGEgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXRvb2xzXzEuNC4zNTAuMS5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi10b29sc18xLjQuMzU3LjAuYmIKQEAg
LTcsNyArNyw3IEBAIFNFQ1RJT04gPSAibGlicyIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT0zYjgzZWY5NjM4N2YxNDY1
NWZjODU0ZGRjM2M2YmQ1NyIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3Jv
dXAvVnVsa2FuLVRvb2xzLmdpdDticmFuY2g9bWFpbjtwcm90b2NvbD1odHRwczt0YWc9dnVsa2Fu
LXNkay0ke1BWfSIKLVNSQ1JFViA9ICIxY2IzYTMxOTk2OWNmMGQzZTIzMTViMGE4N2EyNzQ0N2Y1
NWI0MTY3IgorU1JDUkVWID0gIjI4NjI5OWJiNmI3MzJlNGIyMjc3MWNmYjlkN2Q0MjE1NDJkNDA1
MDEiCiAKIGluaGVyaXQgY21ha2UgZmVhdHVyZXNfY2hlY2sgcGtnY29uZmlnCiBBTllfT0ZfRElT
VFJPX0ZFQVRVUkVTID0gIngxMSB3YXlsYW5kIgotLSAKMi40Ny4xCgo=

--===============8731574825918910716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="vulkan-tools-changelog.txt"

Changelog for vulkan-tools: 1.4.350.1 -> 1.4.357.0

286299bb build(deps): bump actions/setup-python from 6 to 7
8c66b352 build: Update to header v1.4.357
2a863f5a vulkaninfo: Make vulkan entry point variables static
6d586e9a build: Update to header v1.4.356
be84f565 vulkaninfo: QNX changes to check for Screen windowing system availability
a3431de1 build: Update to header v1.4.355
b7ae55b3 build(deps): bump actions/checkout from 6 to 7
db008c1a vulkaninfo: Add VK_KHR_display support and related fixes
ec6931a3 build: Update to header v1.4.354
68749eaf build: Update to header v1.4.353
e3d18f90 build(deps): bump actions/checkout from 4 to 6
822a2d8e build: Update to header v1.4.352
225242ea chore: Improve REUSE compliance
ead00c13 chore: Add REUSE.toml for REUSE 3.3 spec compliance
353f23f2 build: Update to header v1.4.351
d2994039 Add AI-Assisted Contributions to CONTRIBUTING
5d407496 cube: Print physical device API and driver version
c23b309b cube: Fix leaks in demo_create_xcb_window

--===============8731574825918910716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 954 .bb files complete (0 cached, 954 parsed). 1983 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "6.0.99+snapshot-4fb4aef64c22c9708a49aa2fffd47af9666f30d4"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:4fb4aef64c22c9708a49aa2fffd47af9666f30d4"
meta-yocto-bsp       
meta-poky            = "master:e4690557fb0fffcb5e9a86d1c1ebc550bb0da090"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 168 Local 155 Mirrors 0 Missed 13 Current 408 (92% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 553 of 576 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 565 of 576 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 1296 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.357.0.bb:do_recipe_qa)
NOTE: recipe vulkan-volk-1.4.350.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.350.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vulkan-tools-1.4.357.0-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-volk-1.4.350.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.350.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1398 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.357.0.bb:do_create_recipe_spdx)
NOTE: recipe vulkan-tools-1.4.357.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1399 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.357.0.bb:do_fetch)
NOTE: recipe vulkan-tools-1.4.357.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe vulkan-tools-1.4.357.0-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.4.357.0-r0: task do_fetch: Succeeded
NOTE: Running task 1400 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.357.0.bb:do_unpack)
NOTE: Running task 1401 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.357.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-tools-1.4.357.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe vulkan-tools-1.4.357.0-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.4.357.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.4.357.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-tools-1.4.357.0-r0: task do_unpack: Succeeded
NOTE: Running task 1402 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.357.0.bb:do_patch)
NOTE: recipe vulkan-tools-1.4.357.0-r0: task do_patch: Started
NOTE: recipe vulkan-tools-1.4.357.0-r0: task do_patch: Succeeded
NOTE: Running task 1403 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.357.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1404 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.357.0.bb:do_generate_toolchain_file)
NOTE: Running task 1405 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.357.0.bb:do_populate_lic)
NOTE: recipe vulkan-tools-1.4.357.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.4.357.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-tools-1.4.357.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-tools-1.4.357.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-tools-1.4.357.0-r0: task do_populate_lic: Succeeded
NOTE: recipe vulkan-tools-1.4.357.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1406 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.357.0.bb:do_configure)
NOTE: recipe vulkan-tools-1.4.357.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.4.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-w
 orker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/l
 ayers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_3.0.4.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['expat', 'gettext-minimal-native', 'glibc', 'libxml2', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 'vulkan-headers', 'vulkan-loader', 'vulkan-volk', 'wayland', 'libpthread-stubs', 'libx11', 'libxau', 'libxcb', 'libxdmcp', 'libxext', 'libxrandr', 'libxrender', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'linux-libc-headers', 'libffi', 'openssl-native', 'ncurses-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'make-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconf-native', 'pseudo-native', 'bzip2-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libmpc-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| The no-dev option is deprecated.  Use -Wno-author instead.
| -- The C compiler identification is GNU 16.1.0
| -- The CXX compiler identification is GNU 16.1.0
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Check for working C compiler: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.357.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc - skipped
| -- Detecting C compile features
| -- Detecting C compile features - done
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working CXX compiler: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.357.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ - skipped
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| CMake Error at CMakeLists.txt:59 (find_package):
|   Could not find a configuration file for package "VulkanHeaders" that is
|   compatible with requested version "1.4.357".
| 
|   The following configuration files were considered but not accepted:
| 
|     /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.357.0/recipe-sysroot/usr/share/cmake/VulkanHeaders/VulkanHeadersConfig.cmake, version: 1.4.350
|       The version found is not compatible with the version requested.
| 
| 
| 
| -- Configuring incomplete, errors occurred!
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.357.0/temp/run.do_configure.4088143:161 exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja $oecmake_sitefile /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.357.0/sources/vulkan-tools-1.4.357.0 -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include -DCMAKE_INSTALL_DATAROOTDIR:PATH=share -DPYTHON_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython3_EXECUTABLE:PATH=/srv/pokybuild/yo
 cto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.357.0/toolchain.cmake -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON -DBUILD_TESTS=OFF -DBUILD_CUBE=OFF -DPYTHON_EXECUTABLE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/python3 -DBUILD_WSI_WAYLAND_SUPPORT=ON -DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON -Wno-dev'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.357.0/temp/run.do_configure.4088143, line 161
| 	#2: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.357.0/temp/run.do_configure.4088143, line 140
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.357.0/temp/run.do_configure.4088143, line 179
NOTE: recipe vulkan-tools-1.4.357.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1406 tasks of which 1396 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260729062923.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260729062923.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.357.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.357.0/temp/log.do_configure.4088143
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-tools-1.4.357.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.357.0/temp/run.do_configure.4088143' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-tools/1.4.357.0/temp/log.do_configure.4088143
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.357.0.bb:do_configure) failed with exit code '1'

--===============8731574825918910716==--

