Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51426C55175
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 06:05:28 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.937.1785564322637423081
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 23:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QIZMqYhf;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=P6kbl/cy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019fbbed5758-9549ba79-7ff5-428b-b02e-b2fa98cbdd77-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785564321;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qxkaKxWlQ9w6qKEIFVlTFgR35UXfYFWrRcQYtC7+EMA=;
	b=QIZMqYhfL+976YVE9x9DoYJcWU1M7BYLapKzeDoPxdPRexpgLm9560hShjwegA77
	fd1rnJRWt8UJxuDJ82pP5/1sxQFo5CTN/thpFo2W9FdjiBA+EiUuBOP194BR1tf67EM
	wwhjsVusixmBJVR/uKBllSnueJt+0M2VsZ7jhCHY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785564321;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qxkaKxWlQ9w6qKEIFVlTFgR35UXfYFWrRcQYtC7+EMA=;
	b=P6kbl/cy2/5Nw9VqlGcW/BFUhgAQdjwm9e7GfFqVNgeaz88ukjCN8MMdCzoixJVv
	RO2uen1YmWTsJj8IP42BgnmcZKwwS5fqxl2Z0rPMWHwoVFApGTnVFjOhLT+oTG5qPCg
	ipifCpz1iAQqZTnbXCRTIzEFzggOQJS66U060O8w=
Content-Type: multipart/mixed; boundary="===============6196719699603698994=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-llvm-translator: upgrading to 22.1.5 SUCCEEDED
Message-ID: <0101019fbbed5758-9549ba79-7ff5-428b-b02e-b2fa98cbdd77-000000@us-west-2.amazonses.com>
Date: Sat, 1 Aug 2026 06:05:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 06:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242466

--===============6196719699603698994==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *spirv-llvm-translator* to *22.1.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-llvm-translator-upgrade-22.1.2-22.1.5.patch
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
From 352d10c83ab909776f7c15dcef6048562cadf91b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Aug 2026 06:02:39 +0000
Subject: [PATCH] spirv-llvm-translator: upgrade 22.1.2 -> 22.1.5

27afcfe3 [Backport to 22] Read old SPV_INTEL_float4 type for StochasticRound*ToE2M1INTEL (#3926)
699789f4 [Backport to 22] Fix OpGroupNonUniformRotateKHR mangling (#3863) (#3905)
f167fe94 [Backport to 22] Add missing coverage for SPV_EXT_long_vector (#3889)
f172a708 [Backport to 22] Add 2 opcodes back from old SPV_INTEL_fp_conversions spec (#3880)
08310a8e [Backport to 22] Represent FP4 E2M1 with SPV_EXT_ocp_microscaling_types (#3867)
64fa6b0a [Backport to 22] Keep VectorAnyINTEL for VectorCompute modules with SPV_EXT_long_vector (#3829)
36e45764 [Backport to 22] Use SPV_EXT_long_vector extension for non-standard vector size (#3777)
e123849a [Backport to 22] Implement SPV_INTEL_subgroup_scaled_matrix_multiply_accumulate (#3831)
c88a2e4a [Backport to 22] Support SPV_INTEL_rounded_div_sqrt extension (#3770)
6c3fc37e [Backport to 22] Preventing generating FPRoundingMode for arithmetic constrained intrinsics (#3771)
9c688012 [Backport to 22] Update SPV_INTEL_fp_conversions to the latest spec revision (#3782)
521e409d [Backport to 22] Support `SaturatedToLargestFloat8NormalConversionEXT` decoration (#3767)
1d5546f5 [Backport to 22] [SPIRV->LLVM] Fix missing spir_func CC on builtin FP4/i4 conversion calls (#3746)
e10ca9b4 [LLVM 22] Add workaround to translate casts from target ext types to int (Originally: #3476) (#3684)
beefc64b [Backport to llvm_release_220] Remove internal values for SPV_INTEL_predicated_io (#3723)
---
 ...lvm-translator_22.1.2.bb => spirv-llvm-translator_22.1.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-llvm-translator_22.1.2.bb => spirv-llvm-translator_22.1.5.bb} (94%)

diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_22.1.2.bb b/meta/recipes-graphics/spir/spirv-llvm-translator_22.1.5.bb
similarity index 94%
rename from meta/recipes-graphics/spir/spirv-llvm-translator_22.1.2.bb
rename to meta/recipes-graphics/spir/spirv-llvm-translator_22.1.5.bb
index 2ee9819060..1f80c6a27f 100644
--- a/meta/recipes-graphics/spir/spirv-llvm-translator_22.1.2.bb
+++ b/meta/recipes-graphics/spir/spirv-llvm-translator_22.1.5.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
 
 # pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
 SPIRV_BRANCH = "llvm_release_220"
-SRCREV = "f676199fd00f2229fb35006d5124687c0785a01d"
+SRCREV = "27afcfe385cf542197dfde8c658e1f5ff53fc2fc"
 SRC_URI = " \
     git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;branch=${SPIRV_BRANCH};tag=v${PV} \
 "
-- 
2.47.1


--===============6196719699603698994==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="spirv-llvm-translator-changelog.txt"

Changelog for spirv-llvm-translator: 22.1.2 -> 22.1.5

27afcfe3 [Backport to 22] Read old SPV_INTEL_float4 type for StochasticRound*ToE2M1INTEL (#3926)
699789f4 [Backport to 22] Fix OpGroupNonUniformRotateKHR mangling (#3863) (#3905)
f167fe94 [Backport to 22] Add missing coverage for SPV_EXT_long_vector (#3889)
f172a708 [Backport to 22] Add 2 opcodes back from old SPV_INTEL_fp_conversions spec (#3880)
08310a8e [Backport to 22] Represent FP4 E2M1 with SPV_EXT_ocp_microscaling_types (#3867)
64fa6b0a [Backport to 22] Keep VectorAnyINTEL for VectorCompute modules with SPV_EXT_long_vector (#3829)
36e45764 [Backport to 22] Use SPV_EXT_long_vector extension for non-standard vector size (#3777)
e123849a [Backport to 22] Implement SPV_INTEL_subgroup_scaled_matrix_multiply_accumulate (#3831)
c88a2e4a [Backport to 22] Support SPV_INTEL_rounded_div_sqrt extension (#3770)
6c3fc37e [Backport to 22] Preventing generating FPRoundingMode for arithmetic constrained intrinsics (#3771)
9c688012 [Backport to 22] Update SPV_INTEL_fp_conversions to the latest spec revision (#3782)
521e409d [Backport to 22] Support `SaturatedToLargestFloat8NormalConversionEXT` decoration (#3767)
1d5546f5 [Backport to 22] [SPIRV->LLVM] Fix missing spir_func CC on builtin FP4/i4 conversion calls (#3746)
e10ca9b4 [LLVM 22] Add workaround to translate casts from target ext types to int (Originally: #3476) (#3684)
beefc64b [Backport to llvm_release_220] Remove internal values for SPV_INTEL_predicated_io (#3723)

--===============6196719699603698994==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/spirv-llvm-translator: PV changed from "22.1.2" to "22.1.5"
packages/x86-64-v3-poky-linux/spirv-llvm-translator: SRC_URI changed from "git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;branch=llvm_release_220;tag=v22.1.2" to "git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;branch=llvm_release_220;tag=v22.1.5"
packages/x86-64-v3-poky-linux/spirv-llvm-translator: PKGV changed from 22.1.2 [default] to 22.1.5 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-bin: PV changed from "22.1.2" to "22.1.5"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-bin: PKGV changed from 22.1.2 [default] to 22.1.5 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dbg: PKGSIZE changed from 134931800 to 135130664 (+0%)
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dbg: PV changed from "22.1.2" to "22.1.5"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dbg: PKGV changed from 22.1.2 [default] to 22.1.5 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dev: PKGSIZE changed from 26587 to 26741 (+1%)
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dev: PV changed from "22.1.2" to "22.1.5"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dev: PKGV changed from 22.1.2 [default] to 22.1.5 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-doc: PV changed from "22.1.2" to "22.1.5"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-doc: PKGV changed from 22.1.2 [default] to 22.1.5 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-locale: PV changed from "22.1.2" to "22.1.5"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-locale: PKGV changed from 22.1.2 [default] to 22.1.5 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-src: PKGSIZE changed from 2426218 to 2439431 (+1%)
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-src: FILELIST: directory renamed /usr/src/debug/spirv-llvm-translator/22.1.2/lib/SPIRV/Mangler -> /usr/src/debug/spirv-llvm-translator/22.1.5/lib/SPIRV/Mangler, directory renamed /usr/src/debug/spirv-llvm-translator/22.1.2/include -> /usr/src/debug/spirv-llvm-translator/22.1.5/include, directory renamed /usr/src/debug/spirv-llvm-translator/22.1.2/tools/llvm-spirv -> /usr/src/debug/spirv-llvm-translator/22.1.5/tools/llvm-spirv, directory renamed /usr/src/debug/spirv-llvm-translator/22.1.2/lib/SPIRV/libSPIRV -> /usr/src/debug/spirv-llvm-translator/22.1.5/lib/SPIRV/libSPIRV, directory renamed /usr/src/debug/spirv-llvm-translator/22.1.2/lib/SPIRV -> /usr/src/debug/spirv-llvm-translator/22.1.5/lib/SPIRV
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-src: PV changed from "22.1.2" to "22.1.5"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-src: PKGV changed from 22.1.2 [default] to 22.1.5 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-staticdev: PV changed from "22.1.2" to "22.1.5"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-staticdev: PKGV changed from 22.1.2 [default] to 22.1.5 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator: PKGSIZE changed from 6012304 to 6028720 (+0%)
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator: PV changed from "22.1.2" to "22.1.5"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator: PKGV changed from 22.1.2 [default] to 22.1.5 [default]

--===============6196719699603698994==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-llvm-translator-upgrade-22.1.2-22.1.5.patch"

RnJvbSAzNTJkMTBjODNhYjkwOTc3NmY3YzE1ZGNlZjYwNDg1NjJjYWRmOTFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBdWcgMjAyNiAwNjowMjozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNw
aXJ2LWxsdm0tdHJhbnNsYXRvcjogdXBncmFkZSAyMi4xLjIgLT4gMjIuMS41CgoyN2FmY2ZlMyBb
QmFja3BvcnQgdG8gMjJdIFJlYWQgb2xkIFNQVl9JTlRFTF9mbG9hdDQgdHlwZSBmb3IgU3RvY2hh
c3RpY1JvdW5kKlRvRTJNMUlOVEVMICgjMzkyNikKNjk5Nzg5ZjQgW0JhY2twb3J0IHRvIDIyXSBG
aXggT3BHcm91cE5vblVuaWZvcm1Sb3RhdGVLSFIgbWFuZ2xpbmcgKCMzODYzKSAoIzM5MDUpCmYx
NjdmZTk0IFtCYWNrcG9ydCB0byAyMl0gQWRkIG1pc3NpbmcgY292ZXJhZ2UgZm9yIFNQVl9FWFRf
bG9uZ192ZWN0b3IgKCMzODg5KQpmMTcyYTcwOCBbQmFja3BvcnQgdG8gMjJdIEFkZCAyIG9wY29k
ZXMgYmFjayBmcm9tIG9sZCBTUFZfSU5URUxfZnBfY29udmVyc2lvbnMgc3BlYyAoIzM4ODApCjA4
MzEwYThlIFtCYWNrcG9ydCB0byAyMl0gUmVwcmVzZW50IEZQNCBFMk0xIHdpdGggU1BWX0VYVF9v
Y3BfbWljcm9zY2FsaW5nX3R5cGVzICgjMzg2NykKNjRmYTZiMGEgW0JhY2twb3J0IHRvIDIyXSBL
ZWVwIFZlY3RvckFueUlOVEVMIGZvciBWZWN0b3JDb21wdXRlIG1vZHVsZXMgd2l0aCBTUFZfRVhU
X2xvbmdfdmVjdG9yICgjMzgyOSkKMzZlNDU3NjQgW0JhY2twb3J0IHRvIDIyXSBVc2UgU1BWX0VY
VF9sb25nX3ZlY3RvciBleHRlbnNpb24gZm9yIG5vbi1zdGFuZGFyZCB2ZWN0b3Igc2l6ZSAoIzM3
NzcpCmUxMjM4NDlhIFtCYWNrcG9ydCB0byAyMl0gSW1wbGVtZW50IFNQVl9JTlRFTF9zdWJncm91
cF9zY2FsZWRfbWF0cml4X211bHRpcGx5X2FjY3VtdWxhdGUgKCMzODMxKQpjODhhMmU0YSBbQmFj
a3BvcnQgdG8gMjJdIFN1cHBvcnQgU1BWX0lOVEVMX3JvdW5kZWRfZGl2X3NxcnQgZXh0ZW5zaW9u
ICgjMzc3MCkKNmMzZmMzN2UgW0JhY2twb3J0IHRvIDIyXSBQcmV2ZW50aW5nIGdlbmVyYXRpbmcg
RlBSb3VuZGluZ01vZGUgZm9yIGFyaXRobWV0aWMgY29uc3RyYWluZWQgaW50cmluc2ljcyAoIzM3
NzEpCjljNjg4MDEyIFtCYWNrcG9ydCB0byAyMl0gVXBkYXRlIFNQVl9JTlRFTF9mcF9jb252ZXJz
aW9ucyB0byB0aGUgbGF0ZXN0IHNwZWMgcmV2aXNpb24gKCMzNzgyKQo1MjFlNDA5ZCBbQmFja3Bv
cnQgdG8gMjJdIFN1cHBvcnQgYFNhdHVyYXRlZFRvTGFyZ2VzdEZsb2F0OE5vcm1hbENvbnZlcnNp
b25FWFRgIGRlY29yYXRpb24gKCMzNzY3KQoxZDU1NDZmNSBbQmFja3BvcnQgdG8gMjJdIFtTUElS
Vi0+TExWTV0gRml4IG1pc3Npbmcgc3Bpcl9mdW5jIENDIG9uIGJ1aWx0aW4gRlA0L2k0IGNvbnZl
cnNpb24gY2FsbHMgKCMzNzQ2KQplMTBjYTliNCBbTExWTSAyMl0gQWRkIHdvcmthcm91bmQgdG8g
dHJhbnNsYXRlIGNhc3RzIGZyb20gdGFyZ2V0IGV4dCB0eXBlcyB0byBpbnQgKE9yaWdpbmFsbHk6
ICMzNDc2KSAoIzM2ODQpCmJlZWZjNjRiIFtCYWNrcG9ydCB0byBsbHZtX3JlbGVhc2VfMjIwXSBS
ZW1vdmUgaW50ZXJuYWwgdmFsdWVzIGZvciBTUFZfSU5URUxfcHJlZGljYXRlZF9pbyAoIzM3MjMp
Ci0tLQogLi4ubHZtLXRyYW5zbGF0b3JfMjIuMS4yLmJiID0+IHNwaXJ2LWxsdm0tdHJhbnNsYXRv
cl8yMi4xLjUuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIve3NwaXJ2LWxsdm0t
dHJhbnNsYXRvcl8yMi4xLjIuYmIgPT4gc3BpcnYtbGx2bS10cmFuc2xhdG9yXzIyLjEuNS5iYn0g
KDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi1sbHZt
LXRyYW5zbGF0b3JfMjIuMS4yLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYt
bGx2bS10cmFuc2xhdG9yXzIyLjEuNS5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi1sbHZtLXRyYW5zbGF0b3JfMjIuMS4y
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi1sbHZtLXRyYW5z
bGF0b3JfMjIuMS41LmJiCmluZGV4IDJlZTk4MTkwNjAuLjFmODBjNmEyN2YgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWxsdm0tdHJhbnNsYXRvcl8yMi4xLjIu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtbGx2bS10cmFuc2xhdG9y
XzIyLjEuNS5iYgpAQCAtNiw3ICs2LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElD
RU5TRS5UWFQ7bWQ1PTQ3ZTMxMWFhOWNhZWRkMWIzYWJmMDk4YmQ3ODE0ZDFkIgogCiAjIHBhdHRl
cm46IGxsdm1fYnJhbmNoXzIwMCwgY3VycmVudGx5IHRoZXJlIGFyZSBubyBtaW5vciByZWxlYXNl
cywgc28sIG5vIGxsdm1fYnJhbmNoXzIwMQogU1BJUlZfQlJBTkNIID0gImxsdm1fcmVsZWFzZV8y
MjAiCi1TUkNSRVYgPSAiZjY3NjE5OWZkMDBmMjIyOWZiMzUwMDZkNTEyNDY4N2MwNzg1YTAxZCIK
K1NSQ1JFViA9ICIyN2FmY2ZlMzg1Y2Y1NDIxOTdkZmRlOGM2NThlMWY1ZmY1M2ZjMmZjIgogU1JD
X1VSSSA9ICIgXAogICAgIGdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1NQSVJWLUxMVk0t
VHJhbnNsYXRvcjtwcm90b2NvbD1odHRwczticmFuY2g9JHtTUElSVl9CUkFOQ0h9O3RhZz12JHtQ
Vn0gXAogIgotLSAKMi40Ny4xCgo=

--===============6196719699603698994==--

