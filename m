Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C92C54FCC
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 07:24:33 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6131.1785309872867524505
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 00:24:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JDqCbCPb;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=JHWdYKc9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019facc2be94-a34909d7-9f38-4e78-bf90-31454fec601c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785309871;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=qI5huZS/4G0i9sJ6q6H2l2P1wbYLZuuZ/Yyo6YhHMyk=;
	b=JDqCbCPbZPGt8qXijgo/nDZ585fgWefkQ1cKAyJW6Mo4xypIiF6EAi5iV0/CBL20
	3JKjZ72yzIWJ1/Clon//tQp1uxgRRsOmp38TQgA2oYFaPlxVGu3LQPhn4DhOoXBZbTr
	Wl3yv1ygpABNqmPxVtT5IfETHOqJeUL5StyP9ke4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785309871;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=qI5huZS/4G0i9sJ6q6H2l2P1wbYLZuuZ/Yyo6YhHMyk=;
	b=JHWdYKc9kkzHZR4xww+im3gli0Hu6DkCV1pOWd2Ron9iHZ3rZhxz8aNKvlaQbJmK
	2/twAaaobIUhI49YZmtRC3VnEcHater9R1s3FkTHTCW0WFllG2Ad94TATHECSSBBWZ/
	vqtGKejVZuVdUql0EHSNwqmnnGNKtpWJt6C4JvE8=
Content-Type: multipart/mixed; boundary="===============3736929291081303641=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-volk: upgrading to 1.4.357.0 SUCCEEDED
Message-ID: <0101019facc2be94-a34909d7-9f38-4e78-bf90-31454fec601c-000000@us-west-2.amazonses.com>
Date: Wed, 29 Jul 2026 07:24:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.29-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 07:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242253

--===============3736929291081303641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-volk* to *1.4.357.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-volk-upgrade-1.4.350.1-1.4.357.0.patch
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
From a64346dfa12b87efe9efc85502cb53b7bf67136b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 29 Jul 2026 06:43:28 +0000
Subject: [PATCH] vulkan-volk: upgrade 1.4.350.1 -> 1.4.357.0

7768933 Merge pull request #303 from zeux/update/357
11f5a1b Update generated source with the new exclusion rules
1bb1f65 Update extension version filtering mechanism to be more generic
94d905c Update to 1.4.357
3b00554 Merge pull request #302 from zeux/update/356
f5e6b44 Update to 1.4.356
91e0d29 Merge pull request #301 from zeux/update/355
2ad9fb2 Update to 1.4.355
477a354 Merge pull request #300 from zeux/update/354
e2e6d51 Update to 1.4.354
9aa85bf Merge pull request #299 from zeux/update/353
6a8a2d5 Update to 1.4.353
47cddf7 Merge pull request #298 from zeux/update/352
40a3321 Update to 1.4.352
916c68b Merge pull request #297 from zeux/update/351
44a84ca Update to 1.4.351
---
 .../{vulkan-volk_1.4.350.1.bb => vulkan-volk_1.4.357.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-volk_1.4.350.1.bb => vulkan-volk_1.4.357.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.1.bb b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.357.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-volk_1.4.357.0.bb
index 4541b71a98..4e8504ed66 100644
--- a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.357.0.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=cfcbdd69e15396e371f639c69acf40bf"
 
 SRC_URI = "git://github.com/zeux/volk.git;branch=master;protocol=https;tag=vulkan-sdk-${PV}"
-SRCREV = "3ca312a4f38baa63d8006b6905abbeeb89c8087d"
+SRCREV = "776893306c5d3b22b6185b5d4a258b81d94572bf"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
-- 
2.47.1


--===============3736929291081303641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="vulkan-volk-changelog.txt"

Changelog for vulkan-volk: 1.4.350.1 -> 1.4.357.0

7768933 Merge pull request #303 from zeux/update/357
11f5a1b Update generated source with the new exclusion rules
1bb1f65 Update extension version filtering mechanism to be more generic
94d905c Update to 1.4.357
3b00554 Merge pull request #302 from zeux/update/356
f5e6b44 Update to 1.4.356
91e0d29 Merge pull request #301 from zeux/update/355
2ad9fb2 Update to 1.4.355
477a354 Merge pull request #300 from zeux/update/354
e2e6d51 Update to 1.4.354
9aa85bf Merge pull request #299 from zeux/update/353
6a8a2d5 Update to 1.4.353
47cddf7 Merge pull request #298 from zeux/update/352
40a3321 Update to 1.4.352
916c68b Merge pull request #297 from zeux/update/351
44a84ca Update to 1.4.351

--===============3736929291081303641==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-volk-upgrade-1.4.350.1-1.4.357.0.patch"

RnJvbSBhNjQzNDZkZmExMmI4N2VmZTllZmM4NTUwMmNiNTNiN2JmNjcxMzZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjkgSnVsIDIwMjYgMDY6NDM6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdm9sazogdXBncmFkZSAxLjQuMzUwLjEgLT4gMS40LjM1Ny4wCgo3NzY4OTMzIE1lcmdl
IHB1bGwgcmVxdWVzdCAjMzAzIGZyb20gemV1eC91cGRhdGUvMzU3CjExZjVhMWIgVXBkYXRlIGdl
bmVyYXRlZCBzb3VyY2Ugd2l0aCB0aGUgbmV3IGV4Y2x1c2lvbiBydWxlcwoxYmIxZjY1IFVwZGF0
ZSBleHRlbnNpb24gdmVyc2lvbiBmaWx0ZXJpbmcgbWVjaGFuaXNtIHRvIGJlIG1vcmUgZ2VuZXJp
Ywo5NGQ5MDVjIFVwZGF0ZSB0byAxLjQuMzU3CjNiMDA1NTQgTWVyZ2UgcHVsbCByZXF1ZXN0ICMz
MDIgZnJvbSB6ZXV4L3VwZGF0ZS8zNTYKZjVlNmI0NCBVcGRhdGUgdG8gMS40LjM1Ngo5MWUwZDI5
IE1lcmdlIHB1bGwgcmVxdWVzdCAjMzAxIGZyb20gemV1eC91cGRhdGUvMzU1CjJhZDlmYjIgVXBk
YXRlIHRvIDEuNC4zNTUKNDc3YTM1NCBNZXJnZSBwdWxsIHJlcXVlc3QgIzMwMCBmcm9tIHpldXgv
dXBkYXRlLzM1NAplMmU2ZDUxIFVwZGF0ZSB0byAxLjQuMzU0CjlhYTg1YmYgTWVyZ2UgcHVsbCBy
ZXF1ZXN0ICMyOTkgZnJvbSB6ZXV4L3VwZGF0ZS8zNTMKNmE4YTJkNSBVcGRhdGUgdG8gMS40LjM1
Mwo0N2NkZGY3IE1lcmdlIHB1bGwgcmVxdWVzdCAjMjk4IGZyb20gemV1eC91cGRhdGUvMzUyCjQw
YTMzMjEgVXBkYXRlIHRvIDEuNC4zNTIKOTE2YzY4YiBNZXJnZSBwdWxsIHJlcXVlc3QgIzI5NyBm
cm9tIHpldXgvdXBkYXRlLzM1MQo0NGE4NGNhIFVwZGF0ZSB0byAxLjQuMzUxCi0tLQogLi4uL3t2
dWxrYW4tdm9sa18xLjQuMzUwLjEuYmIgPT4gdnVsa2FuLXZvbGtfMS40LjM1Ny4wLmJifSAgICAg
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2FuLXZvbGtfMS40LjM1MC4x
LmJiID0+IHZ1bGthbi12b2xrXzEuNC4zNTcuMC5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12b2xrXzEuNC4zNTAuMS5iYiBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXZvbGtfMS40LjM1Ny4wLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVs
a2FuLXZvbGtfMS40LjM1MC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVs
a2FuL3Z1bGthbi12b2xrXzEuNC4zNTcuMC5iYgppbmRleCA0NTQxYjcxYTk4Li40ZTg1MDRlZDY2
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12b2xrXzEu
NC4zNTAuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12b2xr
XzEuNC4zNTcuMC5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UubWQ7bWQ1PWNmY2JkZDY5ZTE1Mzk2ZTM3MWY2Mzlj
NjlhY2Y0MGJmIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vemV1eC92b2xrLmdpdDti
cmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzO3RhZz12dWxrYW4tc2RrLSR7UFZ9IgotU1JDUkVW
ID0gIjNjYTMxMmE0ZjM4YmFhNjNkODAwNmI2OTA1YWJiZWViODljODA4N2QiCitTUkNSRVYgPSAi
Nzc2ODkzMzA2YzVkM2IyMmI2MTg1YjVkNGEyNThiODFkOTQ1NzJiZiIKIAogUkVRVUlSRURfRElT
VFJPX0ZFQVRVUkVTID0gInZ1bGthbiIKIAotLSAKMi40Ny4xCgo=

--===============3736929291081303641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/vulkan-volk: PKGV changed from 1.4.350.1 [default] to 1.4.357.0 [default]
packages/x86-64-v3-poky-linux/vulkan-volk: PV changed from "1.4.350.1" to "1.4.357.0"
packages/x86-64-v3-poky-linux/vulkan-volk: SRC_URI changed from "git://github.com/zeux/volk.git;branch=master;protocol=https;tag=vulkan-sdk-1.4.350.1" to "git://github.com/zeux/volk.git;branch=master;protocol=https;tag=vulkan-sdk-1.4.357.0"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-dbg: PKGV changed from 1.4.350.1 [default] to 1.4.357.0 [default]
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-dbg: PV changed from "1.4.350.1" to "1.4.357.0"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-dev: PKGV changed from 1.4.350.1 [default] to 1.4.357.0 [default]
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-dev: PKGSIZE changed from 540197 to 550163 (+2%)
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-dev: PV changed from "1.4.350.1" to "1.4.357.0"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-doc: PKGV changed from 1.4.350.1 [default] to 1.4.357.0 [default]
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-doc: PV changed from "1.4.350.1" to "1.4.357.0"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-locale: PKGV changed from 1.4.350.1 [default] to 1.4.357.0 [default]
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-locale: PV changed from "1.4.350.1" to "1.4.357.0"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-src: PKGV changed from 1.4.350.1 [default] to 1.4.357.0 [default]
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-src: PKGSIZE changed from 532084 to 542050 (+2%)
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-src: PV changed from "1.4.350.1" to "1.4.357.0"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-src: FILELIST: directory renamed /usr/src/debug/vulkan-volk/1.4.350.1 -> /usr/src/debug/vulkan-volk/1.4.357.0
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-staticdev: PKGV changed from 1.4.350.1 [default] to 1.4.357.0 [default]
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-staticdev: PKGSIZE changed from 833716 to 833852 (+0%)
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-staticdev: PV changed from "1.4.350.1" to "1.4.357.0"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk: PKGV changed from 1.4.350.1 [default] to 1.4.357.0 [default]
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk: PV changed from "1.4.350.1" to "1.4.357.0"

--===============3736929291081303641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 954 .bb files complete (0 cached, 954 parsed). 1983 targets, 63 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-f304d768a6f579c50816bbae56fa5f2ad5f94de3"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:f304d768a6f579c50816bbae56fa5f2ad5f94de3"
meta-yocto-bsp       
meta-poky            = "master:e4690557fb0fffcb5e9a86d1c1ebc550bb0da090"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 151 Local 133 Mirrors 0 Missed 18 Current 237 (88% match, 95% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 294 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.357.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 325 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 337 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-volk-1.4.357.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe vulkan-headers-1.4.350.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-volk-1.4.357.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.350.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 895 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.357.0.bb:do_recipe_qa)
NOTE: Running task 897 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb:do_fetch)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 339 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 342 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 343 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe vulkan-volk-1.4.357.0-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-headers-1.4.350.1-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 349 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 351 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-volk-1.4.357.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 914 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb:do_create_recipe_spdx)
NOTE: recipe vulkan-headers-1.4.350.1-r0: task do_fetch: Succeeded
NOTE: Running task 915 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.357.0.bb:do_fetch)
NOTE: Running task 916 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb:do_unpack)
NOTE: recipe vulkan-headers-1.4.350.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe vulkan-volk-1.4.357.0-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 360 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 361 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.4.350.1-r0: task do_unpack: Started
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 364 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.350.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe vulkan-volk-1.4.357.0-r0: task do_fetch: Succeeded
NOTE: Running task 919 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.357.0.bb:do_create_recipe_spdx)
NOTE: Running task 920 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.357.0.bb:do_unpack)
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 366 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 367 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-volk-1.4.357.0-r0: task do_create_recipe_spdx: Started
NOTE: Running setscene task 369 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe vulkan-volk-1.4.357.0-r0: task do_unpack: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 375 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 377 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 379 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 382 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-volk-1.4.357.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 384 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 386 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 388 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.350.1-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-volk-1.4.357.0-r0: task do_unpack: Succeeded
NOTE: Running task 957 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb:do_patch)
NOTE: Running task 958 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.357.0.bb:do_patch)
NOTE: recipe vulkan-headers-1.4.350.1-r0: task do_patch: Started
NOTE: recipe vulkan-volk-1.4.357.0-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1016 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-volk-1.4.357.0-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.4.350.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.4.350.1-r0: task do_patch: Succeeded
NOTE: Running task 1022 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.357.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1023 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.357.0.bb:do_generate_toolchain_file)
NOTE: Running task 1025 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1026 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb:do_generate_toolchain_file)
NOTE: recipe vulkan-volk-1.4.357.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-volk-1.4.357.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.4.350.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.4.350.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.4.350.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-volk-1.4.357.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-headers-1.4.350.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.4.350.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb:do_deploy_source_date_epoch unihash changed to d5cfc868ff23bf787e987093be5213c07c913c626be3dff71e3dbb0caee68678
NOTE: recipe vulkan-volk-1.4.357.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1027 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb:do_configure)
NOTE: recipe vulkan-headers-1.4.350.1-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.4.350.1-r0: task do_configure: Succeeded
NOTE: Running task 1028 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb:do_compile)
NOTE: recipe vulkan-headers-1.4.350.1-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.4.350.1-r0: task do_compile: Succeeded
NOTE: Running task 1029 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb:do_install)
NOTE: recipe vulkan-headers-1.4.350.1-r0: task do_install: Started
NOTE: recipe vulkan-headers-1.4.350.1-r0: task do_install: Succeeded
NOTE: Running task 1030 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb:do_package)
NOTE: Running task 1031 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb:do_populate_sysroot)
NOTE: recipe vulkan-headers-1.4.350.1-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.4.350.1-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.4.350.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb:do_populate_sysroot unihash changed to e72168e9d087f6bf855eb45ca476bfeede2fd412e324eb47c0d6334015fccf54
NOTE: Setscene tasks completed
NOTE: Running task 1032 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.357.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-volk-1.4.357.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-volk-1.4.357.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1033 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.357.0.bb:do_configure)
NOTE: recipe vulkan-volk-1.4.357.0-r0: task do_configure: Started
NOTE: recipe vulkan-volk-1.4.357.0-r0: task do_configure: Succeeded
NOTE: Running task 1034 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.357.0.bb:do_compile)
NOTE: recipe vulkan-volk-1.4.357.0-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.4.350.1-r0: task do_package: Succeeded
NOTE: Running task 1035 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.4.350.1-r0: task do_packagedata: Started
NOTE: recipe vulkan-volk-1.4.357.0-r0: task do_compile: Succeeded
NOTE: Running task 1036 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.357.0.bb:do_install)
NOTE: recipe vulkan-volk-1.4.357.0-r0: task do_install: Started
NOTE: recipe vulkan-volk-1.4.357.0-r0: task do_install: Succeeded
NOTE: Running task 1037 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.357.0.bb:do_populate_sysroot)
NOTE: recipe vulkan-volk-1.4.357.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-volk-1.4.357.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.4.350.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1037 tasks of which 1012 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260729064242.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260729064242.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/vulkan-headers/1.4.350.1/temp/log.do_packagedata.2010378
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.4.350.1-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.4.357.0-r0 to 0:1.4.350.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.350.1-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.4.357.0-r0 to 0:1.4.350.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.350.1-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.4.357.0-r0 to 0:1.4.350.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.350.1-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.4.357.0-r0 to 0:1.4.350.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.350.1-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.4.357.0-r0 to 0:1.4.350.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.350.1-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.4.357.0-r0 to 0:1.4.350.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.350.1-r0 do_packagedata: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.4.357.0-r0 to 0:1.4.350.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.350.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/vulkan-headers/1.4.350.1/temp/log.do_packagedata.2010378
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb:do_packagedata) failed with exit code '1'

--===============3736929291081303641==--

