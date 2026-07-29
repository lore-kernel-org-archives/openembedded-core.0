Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F2FBC54FD2
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 07:24:34 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6129.1785309872101667238
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 00:24:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=kgQAwlcV;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=UfUPaz1S;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019facc2bcdc-8831ad92-4e15-4fb3-a231-00fe3214ea3c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785309871;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=T5bgkCwaWDbuyEqHmLL4tGegpKxQ1B3dK1WN+L98Ao8=;
	b=kgQAwlcVgNOs6LS+XsuW1jP8v3pg9FQna4hpurnblFVDVF/Gq4AaDcFaRc7vumRA
	H8IOBbV2n82zXu4ijcngF0GHfVAZR0tU8MBR79+mqjWlETgxmVuJDEWxNxy8hPl2Tz9
	2xiTYfLFu21e+AUlseBeK4ZRi1REDftANlGupukc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785309871;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=T5bgkCwaWDbuyEqHmLL4tGegpKxQ1B3dK1WN+L98Ao8=;
	b=UfUPaz1SumMndsdlzw7VMjkPw2qVOKVyrlWd5d/J9BryYjUbyHMyVEDw2GqxIB/5
	U3gqeAujiQ6NWNN/W51x0GUb5SZHkb4pUNRK/vI/lQPHp9dD3i6PHTyaSy5xQaJ18UH
	Nr44yiVcIzBoFk6oPQJNaRHp4ZZtzNcW/qIOT/Pg=
Content-Type: multipart/mixed; boundary="===============6217845533787349778=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-utility-libraries: upgrading to 1.4.357.0 FAILED
Message-ID: <0101019facc2bcdc-8831ad92-4e15-4fb3-a231-00fe3214ea3c-000000@us-west-2.amazonses.com>
Date: Wed, 29 Jul 2026 07:24:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.29-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 07:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242250

--===============6217845533787349778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-utility-libraries* to *1.4.357.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-utility-libraries-upgrade-1.4.350.1-1.4.357.0.patch
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
From 058fecb998b6c0a453b4860c18cffe007bd60f2d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 29 Jul 2026 06:31:57 +0000
Subject: [PATCH] vulkan-utility-libraries: upgrade 1.4.350.1 -> 1.4.357.0

e9585c3 build(deps): Bump actions/setup-python from 6 to 7
c279fa4 build: Update to header v1.4.357
b856ffc ci: Re-enable chromium build check
c0e15b2 build: Update to header v1.4.356
ba45022 build: Update to header v1.4.355
c64d92a build(deps): Bump actions/checkout from 6 to 7
8183a0b build: Update to header v1.4.354
e491037 Revert "utility: Use insert_or_assign in concurrent unordered map"
53f287e utility: Use insert_or_assign in concurrent unordered map
1eb9fdd build: Update to header v1.4.353
8383c46 scripts: Improve SafePNextCopy for unknown structs
28d3b59 build: Update to header v1.4.352
ca09359 chore: Cleanup REUSE
8752119 build: Update to header v1.4.351
d88097b Add missing CC-BY-4.0 license covering CONTRIBUTING.md
04201f7 Remove extra reuse-compliance workflow
668991b Add REUSE compliance infrastructure
---
 ...aries_1.4.350.1.bb => vulkan-utility-libraries_1.4.357.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-utility-libraries_1.4.350.1.bb => vulkan-utility-libraries_1.4.357.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.1.bb b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.357.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.357.0.bb
index 600d88dcea..c750428d09 100644
--- a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.357.0.bb
@@ -10,7 +10,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ca2d6799091aaa98a8520f1b793939b"
 
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
-SRCREV = "a96bd4933c6adfc21329d15e9999791a0153bbf3"
+SRCREV = "e9585c3e3d41ab608ee3b098ce4721d357308fc8"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
-- 
2.47.1


--===============6217845533787349778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="vulkan-utility-libraries-changelog.txt"

Changelog for vulkan-utility-libraries: 1.4.350.1 -> 1.4.357.0

e9585c3 build(deps): Bump actions/setup-python from 6 to 7
c279fa4 build: Update to header v1.4.357
b856ffc ci: Re-enable chromium build check
c0e15b2 build: Update to header v1.4.356
ba45022 build: Update to header v1.4.355
c64d92a build(deps): Bump actions/checkout from 6 to 7
8183a0b build: Update to header v1.4.354
e491037 Revert "utility: Use insert_or_assign in concurrent unordered map"
53f287e utility: Use insert_or_assign in concurrent unordered map
1eb9fdd build: Update to header v1.4.353
8383c46 scripts: Improve SafePNextCopy for unknown structs
28d3b59 build: Update to header v1.4.352
ca09359 chore: Cleanup REUSE
8752119 build: Update to header v1.4.351
d88097b Add missing CC-BY-4.0 license covering CONTRIBUTING.md
04201f7 Remove extra reuse-compliance workflow
668991b Add REUSE compliance infrastructure

--===============6217845533787349778==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-utility-libraries-upgrade-1.4.350.1-1.4.357.0.patch"

RnJvbSAwNThmZWNiOTk4YjZjMGE0NTNiNDg2MGMxOGNmZmUwMDdiZDYwZjJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjkgSnVsIDIwMjYgMDY6MzE6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdXRpbGl0eS1saWJyYXJpZXM6IHVwZ3JhZGUgMS40LjM1MC4xIC0+IDEuNC4zNTcuMAoK
ZTk1ODVjMyBidWlsZChkZXBzKTogQnVtcCBhY3Rpb25zL3NldHVwLXB5dGhvbiBmcm9tIDYgdG8g
NwpjMjc5ZmE0IGJ1aWxkOiBVcGRhdGUgdG8gaGVhZGVyIHYxLjQuMzU3CmI4NTZmZmMgY2k6IFJl
LWVuYWJsZSBjaHJvbWl1bSBidWlsZCBjaGVjawpjMGUxNWIyIGJ1aWxkOiBVcGRhdGUgdG8gaGVh
ZGVyIHYxLjQuMzU2CmJhNDUwMjIgYnVpbGQ6IFVwZGF0ZSB0byBoZWFkZXIgdjEuNC4zNTUKYzY0
ZDkyYSBidWlsZChkZXBzKTogQnVtcCBhY3Rpb25zL2NoZWNrb3V0IGZyb20gNiB0byA3CjgxODNh
MGIgYnVpbGQ6IFVwZGF0ZSB0byBoZWFkZXIgdjEuNC4zNTQKZTQ5MTAzNyBSZXZlcnQgInV0aWxp
dHk6IFVzZSBpbnNlcnRfb3JfYXNzaWduIGluIGNvbmN1cnJlbnQgdW5vcmRlcmVkIG1hcCIKNTNm
Mjg3ZSB1dGlsaXR5OiBVc2UgaW5zZXJ0X29yX2Fzc2lnbiBpbiBjb25jdXJyZW50IHVub3JkZXJl
ZCBtYXAKMWViOWZkZCBidWlsZDogVXBkYXRlIHRvIGhlYWRlciB2MS40LjM1Mwo4MzgzYzQ2IHNj
cmlwdHM6IEltcHJvdmUgU2FmZVBOZXh0Q29weSBmb3IgdW5rbm93biBzdHJ1Y3RzCjI4ZDNiNTkg
YnVpbGQ6IFVwZGF0ZSB0byBoZWFkZXIgdjEuNC4zNTIKY2EwOTM1OSBjaG9yZTogQ2xlYW51cCBS
RVVTRQo4NzUyMTE5IGJ1aWxkOiBVcGRhdGUgdG8gaGVhZGVyIHYxLjQuMzUxCmQ4ODA5N2IgQWRk
IG1pc3NpbmcgQ0MtQlktNC4wIGxpY2Vuc2UgY292ZXJpbmcgQ09OVFJJQlVUSU5HLm1kCjA0MjAx
ZjcgUmVtb3ZlIGV4dHJhIHJldXNlLWNvbXBsaWFuY2Ugd29ya2Zsb3cKNjY4OTkxYiBBZGQgUkVV
U0UgY29tcGxpYW5jZSBpbmZyYXN0cnVjdHVyZQotLS0KIC4uLmFyaWVzXzEuNC4zNTAuMS5iYiA9
PiB2dWxrYW4tdXRpbGl0eS1saWJyYXJpZXNfMS40LjM1Ny4wLmJifSB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi11dGlsaXR5LWxpYnJhcmllc18xLjQuMzUwLjEuYmIg
PT4gdnVsa2FuLXV0aWxpdHktbGlicmFyaWVzXzEuNC4zNTcuMC5iYn0gKDk1JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi11dGlsaXR5LWxpYnJhcmll
c18xLjQuMzUwLjEuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi11dGls
aXR5LWxpYnJhcmllc18xLjQuMzU3LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdXRpbGl0eS1saWJyYXJpZXNf
MS40LjM1MC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGth
bi11dGlsaXR5LWxpYnJhcmllc18xLjQuMzU3LjAuYmIKaW5kZXggNjAwZDg4ZGNlYS4uYzc1MDQy
OGQwOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdXRp
bGl0eS1saWJyYXJpZXNfMS40LjM1MC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92
dWxrYW4vdnVsa2FuLXV0aWxpdHktbGlicmFyaWVzXzEuNC4zNTcuMC5iYgpAQCAtMTAsNyArMTAs
NyBAQCBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFLm1kO21kNT00Y2EyZDY3OTkwOTFhYWE5OGE4NTIwZjFiNzkzOTM5YiIKIAogU1JDX1VS
SSA9ICJnaXQ6Ly9naXRodWIuY29tL0tocm9ub3NHcm91cC9WdWxrYW4tVXRpbGl0eS1MaWJyYXJp
ZXMuZ2l0O2JyYW5jaD1tYWluO3Byb3RvY29sPWh0dHBzO3RhZz12dWxrYW4tc2RrLSR7UFZ9Igot
U1JDUkVWID0gImE5NmJkNDkzM2M2YWRmYzIxMzI5ZDE1ZTk5OTk3OTFhMDE1M2JiZjMiCitTUkNS
RVYgPSAiZTk1ODVjM2UzZDQxYWI2MDhlZTNiMDk4Y2U0NzIxZDM1NzMwOGZjOCIKIAogUkVRVUlS
RURfRElTVFJPX0ZFQVRVUkVTID0gInZ1bGthbiIKIAotLSAKMi40Ny4xCgo=

--===============6217845533787349778==
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
DISTRO_VERSION       = "6.0.99+snapshot-5e817737e0f3477aa80e0cb0190ecce017c57eb8"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:5e817737e0f3477aa80e0cb0190ecce017c57eb8"
meta-yocto-bsp       
meta-poky            = "master:e4690557fb0fffcb5e9a86d1c1ebc550bb0da090"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 103 Local 90 Mirrors 0 Missed 13 Current 279 (87% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 917 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.357.0.bb:do_recipe_qa)
NOTE: Running task 996 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.357.0.bb:do_create_recipe_spdx)
NOTE: recipe vulkan-utility-libraries-1.4.357.0-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-utility-libraries-1.4.357.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe vulkan-utility-libraries-1.4.357.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1015 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.357.0.bb:do_fetch)
NOTE: recipe vulkan-utility-libraries-1.4.357.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe vulkan-utility-libraries-1.4.357.0-r0: task do_fetch: Started
NOTE: recipe vulkan-utility-libraries-1.4.357.0-r0: task do_fetch: Succeeded
NOTE: Running task 1016 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.357.0.bb:do_unpack)
NOTE: Running task 1017 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.357.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-utility-libraries-1.4.357.0-r0: task do_unpack: Started
NOTE: recipe vulkan-utility-libraries-1.4.357.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-utility-libraries-1.4.357.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-utility-libraries-1.4.357.0-r0: task do_unpack: Succeeded
NOTE: Running task 1018 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.357.0.bb:do_patch)
NOTE: recipe vulkan-utility-libraries-1.4.357.0-r0: task do_patch: Started
NOTE: recipe vulkan-utility-libraries-1.4.357.0-r0: task do_patch: Succeeded
NOTE: Running task 1019 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.357.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1020 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.357.0.bb:do_generate_toolchain_file)
NOTE: Running task 1021 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.357.0.bb:do_populate_lic)
NOTE: recipe vulkan-utility-libraries-1.4.357.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-utility-libraries-1.4.357.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-utility-libraries-1.4.357.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-utility-libraries-1.4.357.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-utility-libraries-1.4.357.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-utility-libraries-1.4.357.0-r0: task do_populate_lic: Succeeded
NOTE: Running task 1022 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.357.0.bb:do_configure)
NOTE: recipe vulkan-utility-libraries-1.4.357.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.4.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot', 'virtual:native:/srv
 /pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_3.0.4.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'glibc', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 'vulkan-headers', 'linux-libc-headers', 'openssl-native', 'ncurses-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'make-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconf-native', 'pseudo-native', 'bzip2-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libmpc-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| The no-dev option is deprecated.  Use -Wno-author instead.
| -- The CXX compiler identification is GNU 16.1.0
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working CXX compiler: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.357.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ - skipped
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| CMake Warning at CMakeLists.txt:27 (find_package):
|   Could not find a configuration file for package "VulkanHeaders" that is
|   compatible with requested version "1.4.357".
| 
|   The following configuration files were considered but not accepted:
| 
|     /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.357.0/recipe-sysroot/usr/share/cmake/VulkanHeaders/VulkanHeadersConfig.cmake, version: 1.4.350
|       The version found is not compatible with the version requested.
| 
| 
| 
| -- Configuring done (0.3s)
| CMake Error at src/layer/CMakeLists.txt:20 (target_link_Libraries):
|   Target "VulkanLayerSettings" links to:
| 
|     Vulkan::Headers
| 
|   but the target was not found.  Possible reasons include:
| 
|     * There is a typo in the target name.
|     * A find_package call is missing for an IMPORTED target.
|     * An ALIAS target is missing.
| 
| 
| 
| CMake Error at src/vulkan/CMakeLists.txt:20 (target_link_Libraries):
|   Target "VulkanSafeStruct" links to:
| 
|     Vulkan::Headers
| 
|   but the target was not found.  Possible reasons include:
| 
|     * There is a typo in the target name.
|     * A find_package call is missing for an IMPORTED target.
|     * An ALIAS target is missing.
| 
| 
| 
| CMake Error at include/CMakeLists.txt:38 (target_link_libraries):
|   The link interface of target "VulkanUtilityHeaders" contains:
| 
|     Vulkan::Headers
| 
|   but the target was not found.  Possible reasons include:
| 
|     * There is a typo in the target name.
|     * A find_package call is missing for an IMPORTED target.
|     * An ALIAS target is missing.
| 
| 
| 
| -- Generating done (0.0s)
| CMake Warning (unused-cli):
|   Manually-specified variables were not used by the project:
| 
|     CMAKE_EXPORT_NO_PACKAGE_REGISTRY
|     FETCHCONTENT_FULLY_DISCONNECTED
|     LIB_SUFFIX
|     PYTHON_EXECUTABLE
|     Python3_EXECUTABLE
|     Python_EXECUTABLE
| 
| 
| CMake Generate step failed.  Build files cannot be regenerated correctly.
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.357.0/temp/run.do_configure.64040:161 exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja $oecmake_sitefile /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.357.0/sources/vulkan-utility-libraries-1.4.357.0 -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include -DCMAKE_INSTALL_DATAROOTDIR:PATH=share -DPYTHON_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython3
 _EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.357.0/toolchain.cmake -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON -DBUILD_TESTS=OFF -Wno-dev'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.357.0/temp/run.do_configure.64040, line 161
| 	#2: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.357.0/temp/run.do_configure.64040, line 140
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.357.0/temp/run.do_configure.64040, line 179
NOTE: recipe vulkan-utility-libraries-1.4.357.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1022 tasks of which 1012 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260729063140.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260729063140.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.357.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.357.0/temp/log.do_configure.64040
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-utility-libraries-1.4.357.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.357.0/temp/run.do_configure.64040' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.357.0/temp/log.do_configure.64040
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.357.0.bb:do_configure) failed with exit code '1'

--===============6217845533787349778==--

