Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD26FCA9EA3
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:43 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.7643.1685693435384899348
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bnWfmKag;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101887b288b30-c5c27480-1393-4320-a2bd-178aa8141ddf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693434;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8Zhm5Q3vFvFGPVsrHyo2Qpz7Mp++5ovrp0DvAWsoNPY=;
	b=bnWfmKagAS+LELF/ueU5sPWs82xEuPcT2GmTUqAb9WtTIIGuY0aTDf9zDpAYQ8TI
	ogTgWHj52qs28gWjgfMNDwMsFK0wovclY2QBLl0cTT8nuVH1XMGgVyJpRXBvYqM8tWC
	Wu5UE/Trua+BUtru/NNU4xQ8NXqSopXUGnVRc3NY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693434;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8Zhm5Q3vFvFGPVsrHyo2Qpz7Mp++5ovrp0DvAWsoNPY=;
	b=Isj5SR9mP2KbxF2rSP0yWFA1milvFV/sB84MzS9Q25ewe1O2W/i8GEG7WxmX8xoF
	w4dKiRTx+wDKWjqP2dOxx6eP7niodtfEiH7WiE/zm5PsGm1ceZ+KAA2RCkFyAa8Bq8P
	YBd19av6kOCRurj+C5fb21CC95lkGzBK+7jVqnb8=
Content-Type: multipart/mixed; boundary="===============7042263443824148374=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2023.4 SUCCEEDED
Message-ID: <010101887b288b30-c5c27480-1393-4320-a2bd-178aa8141ddf-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182236

--===============7042263443824148374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *shaderc* to *2023.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-shaderc-upgrade-2023.2-2023.4.patch
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
--===============7042263443824148374==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shaderc-upgrade-2023.2-2023.4.patch"

RnJvbSBlZjc4ZTFlN2IzZTM1NmMyM2FhZWFiOGI0MWIxN2Q5MjI1MTdlMzFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMiBKdW4gMjAyMyAwMTozMDo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNo
YWRlcmM6IHVwZ3JhZGUgMjAyMy4yIC0+IDIwMjMuNAoKLS0tCiAuLi5pc2FibGUtYnVpbGRpbmct
ZXh0ZXJuYWwtZGVwZW5kZW5jaWVzLnBhdGNoIHwgMTggKysrKysrKystLS0tLS0tLS0tCiAuLi4v
e3NoYWRlcmNfMjAyMy4yLmJiID0+IHNoYWRlcmNfMjAyMy40LmJifSAgIHwgIDIgKy0KIDIgZmls
ZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy97c2hhZGVyY18yMDIzLjIuYmIgPT4gc2hhZGVyY18y
MDIzLjQuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRl
cmMvZmlsZXMvMDAwMS1jbWFrZS1kaXNhYmxlLWJ1aWxkaW5nLWV4dGVybmFsLWRlcGVuZGVuY2ll
cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL2ZpbGVzLzAwMDEtY21ha2Ut
ZGlzYWJsZS1idWlsZGluZy1leHRlcm5hbC1kZXBlbmRlbmNpZXMucGF0Y2gKaW5kZXggY2M5YTQw
MDAyOC4uMzU4NTViZDgzMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRl
cmMvZmlsZXMvMDAwMS1jbWFrZS1kaXNhYmxlLWJ1aWxkaW5nLWV4dGVybmFsLWRlcGVuZGVuY2ll
cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAxLWNt
YWtlLWRpc2FibGUtYnVpbGRpbmctZXh0ZXJuYWwtZGVwZW5kZW5jaWVzLnBhdGNoCkBAIC0xLDcg
KzEsNyBAQAotRnJvbSAwNzFhOWQ3MWJlYTkxYmJlZmNmMTVlMDYxZmM4N2U1MzU2OGYzMTg4IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkM2ZiZDZiOTQyN2YyOTYwNjU0MDUyOGQxN2Zl
MDI5MzBjZDc4ZDBjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSm9zZSBRdWFyZXNt
YSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiBEYXRlOiBTYXQsIDEzIEZlYiAyMDIxIDAwOjQ1
OjU2ICswMDAwCi1TdWJqZWN0OiBbUEFUQ0ggMS8zXSBjbWFrZTogZGlzYWJsZSBidWlsZGluZyBl
eHRlcm5hbCBkZXBlbmRlbmNpZXMKK1N1YmplY3Q6IFtQQVRDSF0gY21ha2U6IGRpc2FibGUgYnVp
bGRpbmcgZXh0ZXJuYWwgZGVwZW5kZW5jaWVzCiAKIC0gYWRkIGNtYWtlIG9wdGlvbiB0byBkaXNh
YmxlIHRoZSBidWlsZCBvZiB0aGUgdGhpcmRfcGFydHkgZGVwZW5kZW5jaWVzCiAtIGNoYW5nZSB0
aGUgdXBkYXRlX2J1aWxkX3ZlcnNpb24ucHkgdG8gdXNlIHBrZy1jb25maWcgd2hlbiB0aGlyZF9w
YXJ0eSBkZXBlbmRlbmNpZXMgbm90IGZvdW5kCkBAIC05LDI0ICs5LDI1IEBAIFN1YmplY3Q6IFtQ
QVRDSCAxLzNdIGNtYWtlOiBkaXNhYmxlIGJ1aWxkaW5nIGV4dGVybmFsIGRlcGVuZGVuY2llcwog
VXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtPRS1jb3JlIHNwZWNpZmljXQogCiBTaWdu
ZWQtb2ZmLWJ5OiBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KKwogLS0t
CiAgQ01ha2VMaXN0cy50eHQgICAgICAgICAgICAgICAgfCAxMyArKysrKysrKysrLS0tCiAgdXRp
bHMvdXBkYXRlX2J1aWxkX3ZlcnNpb24ucHkgfCAyMiArKysrKysrKysrKysrKystLS0tLS0tCiAg
MiBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKIAogZGlm
ZiAtLWdpdCBhL0NNYWtlTGlzdHMudHh0IGIvQ01ha2VMaXN0cy50eHQKLWluZGV4IDVjNzRjZDgu
LmIzNThmNmIgMTAwNjQ0CitpbmRleCA2MzNjMjQ0Li43NWIwMWRhIDEwMDY0NAogLS0tIGEvQ01h
a2VMaXN0cy50eHQKICsrKyBiL0NNYWtlTGlzdHMudHh0Ci1AQCAtNDEsNiArNDEsNyBAQCBlbHNl
KCkKK0BAIC02Nyw2ICs2Nyw3IEBAIGVsc2UoKQogIGVuZGlmKCkKICAKICBvcHRpb24oU0hBREVS
Q19FTkFCTEVfV0VSUk9SX0NPTVBJTEUgIkVuYWJsZSBwYXNzaW5nIC1XZXJyb3IgdG8gY29tcGls
ZXIsIGlmIGF2YWlsYWJsZSIgT04pCiArb3B0aW9uKEJVSUxEX0VYVEVSTkFMICJCdWlsZCBleHRl
cm5hbCBkZXBlbmRlbmNpZXMgaW4gL3RoaXJkX3BhcnR5IiBPTikKICAKLSBzZXQgKENNQUtFX0NY
WF9TVEFOREFSRCAxMSkKKyBzZXQgKENNQUtFX0NYWF9TVEFOREFSRCAxNykKICAKLUBAIC0xMDEs
OCArMTAyLDE0IEBAIGVuZGlmKE1TVkMpCitAQCAtMTI5LDggKzEzMCwxNCBAQCBlbmRpZihNU1ZD
KQogIAogIAogICMgQ29uZmlndXJlIHN1YmRpcmVjdG9yaWVzLgpAQCAtNDMsNyArNDQsNyBAQCBp
bmRleCA1Yzc0Y2Q4Li5iMzU4ZjZiIDEwMDY0NAogIAogIGFkZF9zdWJkaXJlY3RvcnkobGlic2hh
ZGVyY191dGlsKQogIGFkZF9zdWJkaXJlY3RvcnkobGlic2hhZGVyYykKLUBAIC0xMTIsNyArMTE5
LDcgQEAgYWRkX3N1YmRpcmVjdG9yeShleGFtcGxlcykKK0BAIC0xNDIsNyArMTQ5LDcgQEAgZW5k
aWYoKQogIGFkZF9jdXN0b21fdGFyZ2V0KGJ1aWxkLXZlcnNpb24KICAgICR7UFlUSE9OX0VYRUNV
VEFCTEV9CiAgICAke0NNQUtFX0NVUlJFTlRfU09VUkNFX0RJUn0vdXRpbHMvdXBkYXRlX2J1aWxk
X3ZlcnNpb24ucHkKQEAgLTEwNCw2ICsxMDUsMyBAQCBpbmRleCA1Nzg1MzkwLi5mNzJiNzYyIDEw
MDc1NQogICAgICBta2Rpcl9wKG9zLnBhdGguZGlybmFtZShvdXRwdXRfZmlsZSkpCiAgCiAgICAg
IGlmIG9zLnBhdGguaXNmaWxlKG91dHB1dF9maWxlKToKLS0tIAotMi4zMC4xCi0KZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL3NoYWRlcmNfMjAyMy4yLmJiIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVyY18yMDIzLjQuYmIKc2ltaWxhcml0eSBp
bmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVy
Y18yMDIzLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL3NoYWRl
cmNfMjAyMy40LmJiCmluZGV4IDA3ZmFlMGJiN2UuLjczOWU3YWU4MWMgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL3NoYWRlcmNfMjAyMy4yLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL3NoYWRlcmNfMjAyMy40LmJiCkBAIC02LDcgKzYsNyBA
QCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vZ29vZ2xlL3NoYWRlcmMiCiBMSUNFTlNF
ID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT04
NmQzZjNhOTVjMzI0Yzk0NzliZDg5ODY5NjhmNDMyNyIKIAotU1JDUkVWID0gIjU1ZjRiYmQ5OTNk
ZTNhM2NhZDM0Y2I0MWNkMDdiODJmYTFjNzdkZDYiCitTUkNSRVYgPSAiN2E4YjNkYTA1ODM0MjVj
ZjUxMTMzNmNmM2FmYmRjZjJlYmM4YjM2YiIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9n
b29nbGUvc2hhZGVyYy5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4gXAogICAgICAgICAg
ICBmaWxlOi8vMDAwMS1jbWFrZS1kaXNhYmxlLWJ1aWxkaW5nLWV4dGVybmFsLWRlcGVuZGVuY2ll
cy5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAyLWxpYnNoYWRlcmNfdXRpbC1maXgtZ2xz
bGFuZy1oZWFkZXItZmlsZS1sb2NhdGlvbi5wYXRjaCBcCi0tIAoyLjM5LjIKCg==

--===============7042263443824148374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1803 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (896 cached, 1 parsed). 1801 targets, 36 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:eea87d4f89bfde4bab0c215e3872f346d63049db"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 28 Local 9 Mirrors 0 Missed 19 Current 150 (32% match, 89% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 662 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_fetch)
NOTE: Running task 676 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_fetch)
NOTE: Running task 677 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_fetch)
NOTE: Running task 682 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_fetch)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_fetch: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_fetch: Started
NOTE: recipe shaderc-2023.4-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_fetch: Succeeded
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_fetch: Succeeded
NOTE: recipe shaderc-2023.4-r0: task do_fetch: Succeeded
NOTE: Running task 683 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_unpack)
NOTE: Running task 684 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_unpack)
NOTE: Running task 685 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 686 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_unpack)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_fetch: Succeeded
NOTE: Running task 687 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_unpack)
NOTE: Running task 688 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shaderc-2023.4-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_unpack: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 689 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_patch)
NOTE: recipe shaderc-2023.4-r0: task do_unpack: Succeeded
NOTE: Running task 690 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_patch: Started
NOTE: recipe shaderc-2023.4-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_patch: Succeeded
NOTE: Running task 691 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_generate_toolchain_file)
NOTE: Running task 692 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_unpack: Succeeded
NOTE: Running task 693 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_patch: Succeeded
NOTE: Running task 694 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_generate_toolchain_file)
NOTE: recipe shaderc-2023.4-r0: task do_patch: Succeeded
NOTE: Running task 695 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 696 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_deploy_source_date_epoch)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_unpack: Succeeded
NOTE: Running task 697 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_generate_toolchain_file)
NOTE: Running task 698 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_populate_lic)
NOTE: Running task 699 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 700 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2023.4-r0: task do_populate_lic: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe shaderc-2023.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_configure: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_patch: Succeeded
NOTE: recipe shaderc-2023.4-r0: task do_populate_lic: Succeeded
NOTE: Running task 701 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_generate_toolchain_file)
NOTE: Running task 702 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_deploy_source_date_epoch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_populate_lic unihash changed to 6f08dfc672cde0bca12e544eaa67004eb0d351fb0de78bbed6fe34a7f8ba8913
NOTE: recipe shaderc-2023.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 703 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_configure: Succeeded
NOTE: Running task 704 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_compile: Succeeded
NOTE: Running task 705 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_install)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_configure: Succeeded
NOTE: Running task 706 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_install: Succeeded
NOTE: Running task 707 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_populate_sysroot)
NOTE: Running task 708 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 709 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 710 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_package: Succeeded
NOTE: Running task 711 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_packagedata)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_configure: Succeeded
NOTE: Running task 712 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_packagedata: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_compile: Succeeded
NOTE: Running task 713 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_install)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_install: Succeeded
NOTE: Running task 714 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_populate_sysroot)
NOTE: Running task 715 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_package)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_package: Succeeded
NOTE: Running task 716 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_packagedata)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_compile: Succeeded
NOTE: Running task 717 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_install)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_install: Succeeded
NOTE: Tasks Summary: Attempted 717 tasks of which 678 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glslang/1_1.3.243.0-r0/temp/log.do_packagedata.2433479
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_packagedata) failed with exit code '1'

--===============7042263443824148374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 54 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:eea87d4f89bfde4bab0c215e3872f346d63049db"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 29 Local 10 Mirrors 0 Missed 19 Current 149 (34% match, 89% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 662 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_fetch)
NOTE: Running task 676 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_fetch)
NOTE: Running task 677 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_fetch)
NOTE: Running task 682 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_fetch)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_fetch: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_fetch: Started
NOTE: recipe shaderc-2023.4-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_fetch: Succeeded
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_fetch: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_fetch: Succeeded
NOTE: recipe shaderc-2023.4-r0: task do_fetch: Succeeded
NOTE: Running task 683 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_unpack)
NOTE: Running task 684 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_unpack)
NOTE: Running task 685 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 686 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_unpack)
NOTE: Running task 687 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_unpack)
NOTE: Running task 688 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shaderc-2023.4-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_unpack: Succeeded
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 689 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_patch)
NOTE: recipe shaderc-2023.4-r0: task do_unpack: Succeeded
NOTE: Running task 690 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_patch)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_patch: Started
NOTE: recipe shaderc-2023.4-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_patch: Succeeded
NOTE: Running task 691 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_generate_toolchain_file)
NOTE: Running task 692 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_unpack: Succeeded
NOTE: Running task 693 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_patch: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_unpack: Succeeded
NOTE: Running task 694 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_patch: Succeeded
NOTE: Running task 695 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_generate_toolchain_file)
NOTE: Running task 696 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shaderc-2023.4-r0: task do_patch: Succeeded
NOTE: Running task 697 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 698 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_generate_toolchain_file)
NOTE: Running task 699 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_populate_lic)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 700 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_configure)
NOTE: recipe shaderc-2023.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.4-r0: task do_populate_lic: Started
NOTE: recipe shaderc-2023.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_patch: Succeeded
NOTE: Running task 701 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_generate_toolchain_file)
NOTE: Running task 702 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe shaderc-2023.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_configure: Started
NOTE: recipe shaderc-2023.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_populate_lic unihash changed to 6f08dfc672cde0bca12e544eaa67004eb0d351fb0de78bbed6fe34a7f8ba8913
NOTE: recipe glslang-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shaderc-2023.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 703 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_configure: Succeeded
NOTE: Running task 704 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_compile: Succeeded
NOTE: Running task 705 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_install)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_configure: Succeeded
NOTE: Running task 706 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_install: Succeeded
NOTE: Running task 707 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_populate_sysroot)
NOTE: Running task 708 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 709 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 710 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_package: Succeeded
NOTE: Running task 711 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_packagedata)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_configure: Succeeded
NOTE: Running task 712 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_packagedata: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_compile: Succeeded
NOTE: Running task 713 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_install)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_install: Succeeded
NOTE: Running task 714 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_populate_sysroot)
NOTE: Running task 715 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_package)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_compile: Succeeded
NOTE: Running task 716 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_install: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_install: Succeeded
NOTE: Running task 717 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_populate_sysroot)
NOTE: Running task 718 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_package)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_package: Succeeded
NOTE: Running task 719 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_packagedata)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_packagedata: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 719 tasks of which 678 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/glslang/1_1.3.243.0-r0/temp/log.do_packagedata.2534538
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_packagedata) failed with exit code '1'

--===============7042263443824148374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 48 skipped, 0 masked, 0 errors.
Removing 8 recipes from the core2-32 sysroot...done.
Removing 8 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:eea87d4f89bfde4bab0c215e3872f346d63049db"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 55 Local 36 Mirrors 0 Missed 19 Current 128 (65% match, 89% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 144 of 183 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 147 of 183 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 596 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_fetch)
NOTE: Running task 597 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_fetch)
NOTE: Running task 598 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_fetch)
NOTE: Running task 599 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_fetch)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_fetch: Started
NOTE: recipe shaderc-2023.4-r0: task do_fetch: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_fetch: Succeeded
NOTE: Running task 600 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_unpack)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_fetch: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_fetch: Succeeded
NOTE: Running task 601 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_unpack)
NOTE: recipe shaderc-2023.4-r0: task do_fetch: Succeeded
NOTE: Running task 602 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_unpack)
NOTE: Running task 603 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_unpack)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_unpack: Started
NOTE: recipe shaderc-2023.4-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 156 of 183 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 158 of 183 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 160 of 183 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_unpack: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Started
NOTE: Running task 605 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_patch)
NOTE: recipe shaderc-2023.4-r0: task do_unpack: Succeeded
NOTE: Running task 606 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_patch)
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 161 of 183 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_patch: Started
NOTE: recipe shaderc-2023.4-r0: task do_patch: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_unpack: Succeeded
NOTE: Running task 608 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_patch)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 164 of 183 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 165 of 183 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 166 of 183 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_patch: Succeeded
NOTE: Running task 609 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_generate_toolchain_file)
NOTE: Running task 610 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_unpack: Succeeded
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 611 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_patch)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_patch: Succeeded
NOTE: Running task 612 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_generate_toolchain_file)
NOTE: Running task 613 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_deploy_source_date_epoch)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 167 of 183 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 168 of 183 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_patch: Started
NOTE: recipe shaderc-2023.4-r0: task do_patch: Succeeded
NOTE: Running task 619 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 620 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_generate_toolchain_file)
NOTE: Running task 621 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_populate_lic)
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shaderc-2023.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.4-r0: task do_populate_lic: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe shaderc-2023.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_patch: Succeeded
NOTE: Running task 622 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_generate_toolchain_file)
NOTE: Running task 623 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shaderc-2023.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 176 of 183 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shaderc-2023.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_populate_lic unihash changed to 6f08dfc672cde0bca12e544eaa67004eb0d351fb0de78bbed6fe34a7f8ba8913
NOTE: recipe glslang-1_1.3.243.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 180 of 183 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 181 of 183 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 708 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 713 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 714 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_configure)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_configure: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 715 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_configure: Succeeded
NOTE: Running task 716 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_compile: Succeeded
NOTE: Running task 717 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_install)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_configure: Succeeded
NOTE: Running task 718 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_install: Succeeded
NOTE: Running task 719 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_populate_sysroot)
NOTE: Running task 720 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 721 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 722 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_package: Succeeded
NOTE: Running task 723 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_configure: Succeeded
NOTE: Running task 724 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_packagedata: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_compile: Succeeded
NOTE: Running task 725 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_install)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_install: Succeeded
NOTE: Running task 726 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_populate_sysroot)
NOTE: Running task 727 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_package)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_package: Succeeded
NOTE: Running task 728 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_packagedata)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_packagedata: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 728 tasks of which 690 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/glslang/1_1.3.243.0-r0/temp/log.do_packagedata.2888279
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_packagedata) failed with exit code '1'

--===============7042263443824148374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 64 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:eea87d4f89bfde4bab0c215e3872f346d63049db"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 29 Local 10 Mirrors 0 Missed 19 Current 149 (34% match, 89% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 662 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_fetch)
NOTE: Running task 676 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_fetch)
NOTE: Running task 677 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_fetch)
NOTE: Running task 682 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_fetch)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_fetch: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_fetch: Started
NOTE: recipe shaderc-2023.4-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_fetch: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_fetch: Succeeded
NOTE: Running task 683 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_unpack)
NOTE: Running task 684 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe shaderc-2023.4-r0: task do_fetch: Succeeded
NOTE: Running task 685 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_unpack)
NOTE: Running task 686 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 687 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_unpack)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_fetch: Succeeded
NOTE: Running task 688 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_unpack)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shaderc-2023.4-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_unpack: Succeeded
NOTE: Running task 689 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_patch)
NOTE: recipe shaderc-2023.4-r0: task do_unpack: Succeeded
NOTE: Running task 690 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_patch: Started
NOTE: recipe shaderc-2023.4-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_patch: Succeeded
NOTE: Running task 691 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_generate_toolchain_file)
NOTE: Running task 692 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_unpack: Succeeded
NOTE: Running task 693 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_unpack: Succeeded
NOTE: Running task 694 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_patch)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_patch: Succeeded
NOTE: Running task 695 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_generate_toolchain_file)
NOTE: Running task 696 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shaderc-2023.4-r0: task do_patch: Succeeded
NOTE: Running task 697 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 698 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_generate_toolchain_file)
NOTE: Running task 699 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_populate_lic)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 700 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.4-r0: task do_populate_lic: Started
NOTE: recipe shaderc-2023.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_patch: Succeeded
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 701 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_generate_toolchain_file)
NOTE: Running task 702 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_configure: Started
NOTE: recipe shaderc-2023.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe shaderc-2023.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_populate_lic unihash changed to 6f08dfc672cde0bca12e544eaa67004eb0d351fb0de78bbed6fe34a7f8ba8913
NOTE: recipe glslang-1_1.3.243.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shaderc-2023.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 703 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_configure: Succeeded
NOTE: Running task 704 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_compile: Succeeded
NOTE: Running task 705 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_install)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_configure: Succeeded
NOTE: Running task 706 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_install: Succeeded
NOTE: Running task 707 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_populate_sysroot)
NOTE: Running task 708 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 709 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 710 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_configure: Succeeded
NOTE: Running task 711 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_package: Succeeded
NOTE: Running task 712 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_packagedata)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_packagedata: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_packagedata: Succeeded
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_compile: Succeeded
NOTE: Running task 713 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_compile: Succeeded
NOTE: Running task 714 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_install)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_install: Succeeded
NOTE: Running task 715 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_populate_sysroot)
NOTE: Running task 716 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_package)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_install: Succeeded
NOTE: Running task 717 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_populate_sysroot)
NOTE: Running task 718 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_package)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_package: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 719 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe shaderc-2023.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shaderc-2023.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 720 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_configure)
NOTE: recipe shaderc-2023.4-r0: task do_configure: Started
NOTE: recipe shaderc-2023.4-r0: task do_configure: Succeeded
NOTE: Running task 721 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_compile)
NOTE: recipe shaderc-2023.4-r0: task do_compile: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_package: Succeeded
NOTE: Running task 722 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_packagedata)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_packagedata: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_packagedata: Failed
NOTE: recipe shaderc-2023.4-r0: task do_compile: Succeeded
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 722 tasks of which 678 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/glslang/1_1.3.243.0-r0/temp/log.do_packagedata.2644249
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_packagedata) failed with exit code '1'

--===============7042263443824148374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:eea87d4f89bfde4bab0c215e3872f346d63049db"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 29 Local 10 Mirrors 0 Missed 19 Current 149 (34% match, 89% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 662 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_fetch)
NOTE: Running task 676 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_fetch)
NOTE: Running task 677 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_fetch)
NOTE: Running task 682 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_fetch)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_fetch: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_fetch: Started
NOTE: recipe shaderc-2023.4-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_fetch: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_fetch: Succeeded
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_fetch: Succeeded
NOTE: recipe shaderc-2023.4-r0: task do_fetch: Succeeded
NOTE: Running task 683 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_unpack)
NOTE: Running task 684 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 685 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_unpack)
NOTE: Running task 686 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_unpack)
NOTE: Running task 687 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_unpack)
NOTE: Running task 688 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_unpack: Started
NOTE: recipe shaderc-2023.4-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_unpack: Succeeded
NOTE: Running task 689 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_patch)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shaderc-2023.4-r0: task do_unpack: Succeeded
NOTE: Running task 690 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_patch: Started
NOTE: recipe shaderc-2023.4-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_patch: Succeeded
NOTE: Running task 691 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_generate_toolchain_file)
NOTE: Running task 692 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_unpack: Succeeded
NOTE: Running task 693 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_patch: Started
NOTE: recipe shaderc-2023.4-r0: task do_patch: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_unpack: Succeeded
NOTE: Running task 694 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 695 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_generate_toolchain_file)
NOTE: Running task 696 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_populate_lic)
NOTE: Running task 697 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 698 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_patch: Succeeded
NOTE: Running task 699 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_generate_toolchain_file)
NOTE: Running task 700 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shaderc-2023.4-r0: task do_populate_lic: Started
NOTE: recipe shaderc-2023.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_patch: Started
NOTE: recipe shaderc-2023.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe shaderc-2023.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe shaderc-2023.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_populate_lic unihash changed to 6f08dfc672cde0bca12e544eaa67004eb0d351fb0de78bbed6fe34a7f8ba8913
NOTE: recipe glslang-1_1.3.243.0-r0: task do_patch: Succeeded
NOTE: Running task 701 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_generate_toolchain_file)
NOTE: Running task 702 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shaderc-2023.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 703 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_configure: Succeeded
NOTE: Running task 704 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_compile: Succeeded
NOTE: Running task 705 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_install)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_configure: Succeeded
NOTE: Running task 706 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_install: Succeeded
NOTE: Running task 707 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_populate_sysroot)
NOTE: Running task 708 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 709 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 710 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_configure: Succeeded
NOTE: Running task 711 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_package: Succeeded
NOTE: Running task 712 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_packagedata: Started
NOTE: recipe spirv-headers-1_1.3.243.0-r0: task do_packagedata: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_compile: Succeeded
NOTE: Running task 713 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_install)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_install: Succeeded
NOTE: Running task 714 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_populate_sysroot)
NOTE: Running task 715 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_package)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_package: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_compile: Succeeded
NOTE: Running task 716 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_install: Succeeded
NOTE: Running task 717 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_populate_sysroot)
NOTE: Running task 718 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_package)
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_package: Started
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 719 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe shaderc-2023.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shaderc-2023.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 720 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.4.bb:do_configure)
NOTE: recipe shaderc-2023.4-r0: task do_configure: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_package: Succeeded
NOTE: Running task 721 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_packagedata)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_packagedata: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_packagedata: Failed
NOTE: recipe shaderc-2023.4-r0: task do_configure: Succeeded
NOTE: recipe spirv-tools-1_1.3.243.0-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 721 tasks of which 678 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: QA Issue: Package version for package glslang went backwards which would break package feeds (from 1:1.3.250.0-r0 to 1:1.3.243.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.243.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/glslang/1_1.3.243.0-r0/temp/log.do_packagedata.2756563
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_packagedata) failed with exit code '1'

--===============7042263443824148374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/shaderc: PKGV changed from 2023.2 [default] to 2023.4 [default]
packages/core2-32-poky-linux/shaderc: PV changed from "2023.2" to "2023.4"
packages/core2-32-poky-linux/shaderc/shaderc-dbg: PKGSIZE changed from 6617884 to 6632116 (+0%)
packages/core2-32-poky-linux/shaderc/shaderc-dbg: PKGV changed from 2023.2 [default] to 2023.4 [default]
packages/core2-32-poky-linux/shaderc/shaderc-dbg: PV changed from "2023.2" to "2023.4"
packages/core2-32-poky-linux/shaderc/shaderc-dev: PKGSIZE changed from 62114 to 63477 (+2%)
packages/core2-32-poky-linux/shaderc/shaderc-dev: PKGV changed from 2023.2 [default] to 2023.4 [default]
packages/core2-32-poky-linux/shaderc/shaderc-dev: PV changed from "2023.2" to "2023.4"
packages/core2-32-poky-linux/shaderc/shaderc-doc: PKGV changed from 2023.2 [default] to 2023.4 [default]
packages/core2-32-poky-linux/shaderc/shaderc-doc: PV changed from "2023.2" to "2023.4"
packages/core2-32-poky-linux/shaderc/shaderc-locale: PKGV changed from 2023.2 [default] to 2023.4 [default]
packages/core2-32-poky-linux/shaderc/shaderc-locale: PV changed from "2023.2" to "2023.4"
packages/core2-32-poky-linux/shaderc/shaderc-src: PKGSIZE changed from 319425 to 323859 (+1%)
packages/core2-32-poky-linux/shaderc/shaderc-src: PKGV changed from 2023.2 [default] to 2023.4 [default]
packages/core2-32-poky-linux/shaderc/shaderc-src: PV changed from "2023.2" to "2023.4"
packages/core2-32-poky-linux/shaderc/shaderc-staticdev: PKGSIZE changed from 2466106 to 2474228 (+0%)
packages/core2-32-poky-linux/shaderc/shaderc-staticdev: PKGV changed from 2023.2 [default] to 2023.4 [default]
packages/core2-32-poky-linux/shaderc/shaderc-staticdev: PV changed from "2023.2" to "2023.4"
packages/core2-32-poky-linux/shaderc/shaderc: PKGSIZE changed from 298420 to 302516 (+1%)
packages/core2-32-poky-linux/shaderc/shaderc: PKGV changed from 2023.2 [default] to 2023.4 [default]
packages/core2-32-poky-linux/shaderc/shaderc: PV changed from "2023.2" to "2023.4"

--===============7042263443824148374==--

