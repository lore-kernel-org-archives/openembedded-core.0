Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C8E0D5E147
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:40 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17182.1765872136269594598
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=kM0KP2tu;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Lkr4NVnr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019b262ecadd-4dee46c3-c427-4054-95ba-5298b0d77e63-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872159;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Hwr+zRCCBqP7sNs4t4Xhf8QMVzpVX3NEvffV2k68Ak8=;
	b=kM0KP2tuE6+stC/4qiHbQvEKX8J9lKApFttbMGQdfS7Aq0yhbiRF6qmwdWNR2ev4
	cm5/TBUgojraUPvoFdiMdPzlAG8H7J+BaR/SAhgwzlcmWMoXK+bG8yxnSG5YxE0FU5Z
	sHODQjFIkcQcJVmHGczzq/3psCci4P7hvFI7V9gs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872159;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Hwr+zRCCBqP7sNs4t4Xhf8QMVzpVX3NEvffV2k68Ak8=;
	b=Lkr4NVnrnhU2ThJ6Uh130CKDx4J8rWqjKKeIDxh04N1vHQQRsqQXPEgfxqyYD3JF
	f9Tpv0bZn8tcD+j6XfIuHh175mMyVBAi8VUtj5FB8GH9iIkumpxxWGiZ/iqUCT+2iw2
	SOafu9pFc8MdgfINwnf82zdna2KMun4qdT5tBuuA=
Content-Type: multipart/mixed; boundary="===============5804256403168798158=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-llvm-translator: upgrading to 21.1.3 SUCCEEDED
Message-ID: <0101019b262ecadd-4dee46c3-c427-4054-95ba-5298b0d77e63-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227869

--===============5804256403168798158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *spirv-llvm-translator* to *21.1.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-llvm-translator-upgrade-21.1.2-21.1.3.patch
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
From 71d13b0526a8d0cdae1043d1894ff2434270d198 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 04:44:48 +0000
Subject: [PATCH] spirv-llvm-translator: upgrade 21.1.2 -> 21.1.3

---
 ...lvm-translator_21.1.2.bb => spirv-llvm-translator_21.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-llvm-translator_21.1.2.bb => spirv-llvm-translator_21.1.3.bb} (94%)

diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.2.bb b/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb
similarity index 94%
rename from meta/recipes-graphics/spir/spirv-llvm-translator_21.1.2.bb
rename to meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb
index 763afbd608..f8a7b8f32e 100644
--- a/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.2.bb
+++ b/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
 
 # pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
 SPIRV_BRANCH = "llvm_release_${@oe.utils.trim_version('${PV}', 1).replace('.', '')}0"
-SRCREV = "a37544fc0bb90b4e8b8d755580119c018891dfa4"
+SRCREV = "a79c852b36785588032a2dd7c39aa15ec4d24b20"
 SRC_URI = " \
     git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;tag=v${PV};branch=${SPIRV_BRANCH} \
 "
-- 
2.47.1


--===============5804256403168798158==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-llvm-translator-upgrade-21.1.2-21.1.3.patch"

RnJvbSA3MWQxM2IwNTI2YThkMGNkYWUxMDQzZDE4OTRmZjI0MzQyNzBkMTk4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDQ6NDQ6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cGlydi1sbHZtLXRyYW5zbGF0b3I6IHVwZ3JhZGUgMjEuMS4yIC0+IDIxLjEuMwoKLS0tCiAuLi5s
dm0tdHJhbnNsYXRvcl8yMS4xLjIuYmIgPT4gc3BpcnYtbGx2bS10cmFuc2xhdG9yXzIxLjEuMy5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci97c3BpcnYtbGx2bS10cmFuc2xhdG9y
XzIxLjEuMi5iYiA9PiBzcGlydi1sbHZtLXRyYW5zbGF0b3JfMjEuMS4zLmJifSAoOTQlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWxsdm0tdHJhbnNsYXRv
cl8yMS4xLjIuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi1sbHZtLXRyYW5z
bGF0b3JfMjEuMS4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWxsdm0tdHJhbnNsYXRvcl8yMS4xLjIuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWxsdm0tdHJhbnNsYXRvcl8yMS4x
LjMuYmIKaW5kZXggNzYzYWZiZDYwOC4uZjhhN2I4ZjMyZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtbGx2bS10cmFuc2xhdG9yXzIxLjEuMi5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi1sbHZtLXRyYW5zbGF0b3JfMjEuMS4zLmJi
CkBAIC02LDcgKzYsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLlRYVDtt
ZDU9NDdlMzExYWE5Y2FlZGQxYjNhYmYwOThiZDc4MTRkMWQiCiAKICMgcGF0dGVybjogbGx2bV9i
cmFuY2hfMjAwLCBjdXJyZW50bHkgdGhlcmUgYXJlIG5vIG1pbm9yIHJlbGVhc2VzLCBzbywgbm8g
bGx2bV9icmFuY2hfMjAxCiBTUElSVl9CUkFOQ0ggPSAibGx2bV9yZWxlYXNlXyR7QG9lLnV0aWxz
LnRyaW1fdmVyc2lvbignJHtQVn0nLCAxKS5yZXBsYWNlKCcuJywgJycpfTAiCi1TUkNSRVYgPSAi
YTM3NTQ0ZmMwYmI5MGI0ZThiOGQ3NTU1ODAxMTljMDE4ODkxZGZhNCIKK1NSQ1JFViA9ICJhNzlj
ODUyYjM2Nzg1NTg4MDMyYTJkZDdjMzlhYTE1ZWM0ZDI0YjIwIgogU1JDX1VSSSA9ICIgXAogICAg
IGdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1NQSVJWLUxMVk0tVHJhbnNsYXRvcjtwcm90
b2NvbD1odHRwczt0YWc9diR7UFZ9O2JyYW5jaD0ke1NQSVJWX0JSQU5DSH0gXAogIgotLSAKMi40
Ny4xCgo=

--===============5804256403168798158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/spirv-llvm-translator: SRC_URI changed from "git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;tag=v21.1.2;branch=llvm_release_210" to "git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;tag=v21.1.3;branch=llvm_release_210"
packages/x86-64-v3-poky-linux/spirv-llvm-translator: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator: PV changed from "21.1.2" to "21.1.3"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-bin: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-bin: PV changed from "21.1.2" to "21.1.3"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dbg: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dbg: PKGSIZE changed from 131553632 to 132397224 (+1%)
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dbg: PV changed from "21.1.2" to "21.1.3"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dev: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dev: PKGSIZE changed from 26184 to 26345 (+1%)
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dev: PV changed from "21.1.2" to "21.1.3"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-doc: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-doc: PV changed from "21.1.2" to "21.1.3"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-locale: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-locale: PV changed from "21.1.2" to "21.1.3"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-src: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-src: PKGSIZE changed from 2383817 to 2415102 (+1%)
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-src: PV changed from "21.1.2" to "21.1.3"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-src: FILELIST: directory renamed /usr/src/debug/spirv-llvm-translator/21.1.2/lib/SPIRV/Mangler -> /usr/src/debug/spirv-llvm-translator/21.1.3/lib/SPIRV/Mangler, directory renamed /usr/src/debug/spirv-llvm-translator/21.1.2/include -> /usr/src/debug/spirv-llvm-translator/21.1.3/include, directory renamed /usr/src/debug/spirv-llvm-translator/21.1.2/lib/SPIRV -> /usr/src/debug/spirv-llvm-translator/21.1.3/lib/SPIRV, directory renamed /usr/src/debug/spirv-llvm-translator/21.1.2/tools/llvm-spirv -> /usr/src/debug/spirv-llvm-translator/21.1.3/tools/llvm-spirv, directory renamed /usr/src/debug/spirv-llvm-translator/21.1.2/lib/SPIRV/libSPIRV -> /usr/src/debug/spirv-llvm-translator/21.1.3/lib/SPIRV/libSPIRV
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-staticdev: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-staticdev: PV changed from "21.1.2" to "21.1.3"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator: PKGV changed from 21.1.2 [default] to 21.1.3 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator: PKGSIZE changed from 5833136 to 5890576 (+1%)
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator: PV changed from "21.1.2" to "21.1.3"

--===============5804256403168798158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1951 targets, 71 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-a9fbb9dde2bde64d8cfabdd1fdf9b47b5d2142b9"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:a9fbb9dde2bde64d8cfabdd1fdf9b47b5d2142b9"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 156 Local 147 Mirrors 0 Missed 9 Current 199 (94% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 244 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 260 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 266 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 269 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe llvm-21.1.7-r1: task do_create_spdx_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 270 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 271 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 272 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 273 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb:do_packagedata_setscene)
NOTE: recipe llvm-21.1.7-r1: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 275 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 278 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm_git.bb:do_packagedata_setscene)
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_packagedata_setscene: Started
NOTE: recipe llvm-21.1.7-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe llvm-21.1.7-r1: task do_packagedata_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 789 of 1043 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb:do_fetch)
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 281 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 283 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb:do_packagedata_setscene)
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 285 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 286 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_fetch: Started
NOTE: recipe llvm-21.1.7-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 288 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 290 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 292 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_recipe_qa_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/spirv-headers/1.4.328.1/temp/log.do_packagedata_setscene.2567941
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 293 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb:do_package_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_fetch: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 298 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running task 796 of 1043 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb:do_unpack)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_package_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 797 of 1043 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb:do_patch)
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 303 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_patch: Succeeded
NOTE: Running task 799 of 1043 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb:do_generate_toolchain_file)
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 307 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 309 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe llvm-21.1.7-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 310 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 311 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 312 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 313 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm_git.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe llvm-21.1.7-r1: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 316 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe llvm-21.1.7-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 320 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.15.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 321 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 328 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 332 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 334 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 336 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 337 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 338 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 339 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 341 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 342 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 345 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 348 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 351 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 353 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 355 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 988 of 1043 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb:do_packagedata)
NOTE: Running task 1011 of 1043 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_packagedata: Started
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_packagedata: Succeeded
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1030 of 1043 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb:do_collect_spdx_deps)
NOTE: Running task 1031 of 1043 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb:do_configure)
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_configure: Started
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_configure: Succeeded
NOTE: Running task 1032 of 1043 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb:do_compile)
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_compile: Started
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1033 of 1043 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb:do_install)
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_install: Started
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_install: Succeeded
NOTE: Running task 1034 of 1043 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb:do_package)
NOTE: Running task 1035 of 1043 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb:do_populate_sysroot)
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_package: Started
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb:do_populate_sysroot unihash changed to 6ef9f91e5ef1bbc0883a6bdaf67f2e285af1ee0892ad1a23377e2ae39ada709a
NOTE: Setscene tasks completed
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb:do_package unihash changed to cbbb42046052d2084e2abdf43b9ba526101c5af90f53915b78d96233c1b8cd3e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb:do_package_write_rpm became valid
NOTE: Running setscene task 349 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 350 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 352 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_package_write_deb_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 355 of 355 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb:do_packagedata_setscene)
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1037 of 1043 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb:do_create_spdx)
NOTE: Running task 1041 of 1043 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb:do_package_qa)
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_create_spdx: Started
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_package_qa: Started
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1042 of 1043 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb:do_create_package_spdx)
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb:do_package_qa unihash changed to 974864655bcc8cf983c37632912d759e623a8539863794ad4d6ffaa151ef969c
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_create_package_spdx: Started
NOTE: recipe spirv-llvm-translator-21.1.3-r0: task do_create_package_spdx: Succeeded
NOTE: Running noexec task 1043 of 1043 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb:do_build)
NOTE: Tasks Summary: Attempted 1043 tasks of which 1027 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: spirv-headers-1_1.4.328.1-r0 do_packagedata_setscene: QA Issue: Package version for package spirv-headers-src went backwards which would break package feeds (from 1:1.4.335.0-r0 to 1:1.4.328.1-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.4.328.1-r0 do_packagedata_setscene: QA Issue: Package version for package spirv-headers-dbg went backwards which would break package feeds (from 1:1.4.335.0-r0 to 1:1.4.328.1-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.4.328.1-r0 do_packagedata_setscene: QA Issue: Package version for package spirv-headers-staticdev went backwards which would break package feeds (from 1:1.4.335.0-r0 to 1:1.4.328.1-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.4.328.1-r0 do_packagedata_setscene: QA Issue: Package version for package spirv-headers-dev went backwards which would break package feeds (from 1:1.4.335.0-r0 to 1:1.4.328.1-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.4.328.1-r0 do_packagedata_setscene: QA Issue: Package version for package spirv-headers-doc went backwards which would break package feeds (from 1:1.4.335.0-r0 to 1:1.4.328.1-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.4.328.1-r0 do_packagedata_setscene: QA Issue: Package version for package spirv-headers-locale went backwards which would break package feeds (from 1:1.4.335.0-r0 to 1:1.4.328.1-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.4.328.1-r0 do_packagedata_setscene: QA Issue: Package version for package spirv-headers went backwards which would break package feeds (from 1:1.4.335.0-r0 to 1:1.4.328.1-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.4.328.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5804256403168798158==--

