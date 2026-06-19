Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A59CDB470
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 06:18:31 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37023.1781849908719637935
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 23:18:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=n6ynDEBn;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jOB9Eln6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019ede87e22f-df2f114f-6d73-466e-addb-ee99fb2f92b0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781849907;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QKKUXg84xnY483VXlxguRLrsVuoOW8DtHMv9kAJqD7Q=;
	b=n6ynDEBnAecOx7qMvnxaT1Gib5hT/yrgO3B9LP2IxpXNhloarce+s77orRkgAIQx
	zKBStZlexe1tsPyr5yIlYi7loXjkwBPxkCRXbn2KmwGgf5Dwp2TYEqgjmlCQRNgQyhY
	pQ7H/KBhc33MCUd0Me0hnnzIVYRq2QX0g5DPrcrk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781849907;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QKKUXg84xnY483VXlxguRLrsVuoOW8DtHMv9kAJqD7Q=;
	b=jOB9Eln6rnmQLFx7SpcnGQSZL2N7hmNStbudvo5FLI222TmUYwWzkomCBIlie2xk
	gov5zgJAPmoACRNGINmC4uI2IABiTiozdn2kSHK/0S65sznKnyeVV+NY+GcsV4tKfIw
	YZXcEmKDDPPUbOmpGr+XDmfL0CmcPO5EvCpL3RX4=
Content-Type: multipart/mixed; boundary="===============1501753295971038225=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.4.350.1 SUCCEEDED
Message-ID: <0101019ede87e22f-df2f114f-6d73-466e-addb-ee99fb2f92b0-000000@us-west-2.amazonses.com>
Date: Fri, 19 Jun 2026 06:18:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.19-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 06:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239121

--===============1501753295971038225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *glslang* to *1.4.350.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glslang-upgrade-1.4.350.0-1.4.350.1.patch
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
From 0e68e9495032a01c63734e37c4c06d5b7bb4b1db Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 19 Jun 2026 05:42:29 +0000
Subject: [PATCH] glslang: upgrade 1.4.350.0 -> 1.4.350.1

---
 .../glslang/glslang/0001-generate-glslang-pkg-config.patch      | 2 +-
 .../glslang/{glslang_1.4.350.0.bb => glslang_1.4.350.1.bb}      | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/glslang/{glslang_1.4.350.0.bb => glslang_1.4.350.1.bb} (100%)

diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
index d74f37db91..f06f12b303 100644
--- a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
+++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
@@ -1,4 +1,4 @@
-From ee46f2f608ccbe9617ce41235d047f080d972ff7 Mon Sep 17 00:00:00 2001
+From 2c7e21605b0324b4afd51270592bc6cb0a0cca5f Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 7 Feb 2021 01:30:39 +0000
 Subject: [PATCH] generate glslang pkg-config
diff --git a/meta/recipes-graphics/glslang/glslang_1.4.350.0.bb b/meta/recipes-graphics/glslang/glslang_1.4.350.1.bb
similarity index 100%
rename from meta/recipes-graphics/glslang/glslang_1.4.350.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.4.350.1.bb
-- 
2.47.1


--===============1501753295971038225==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glslang-upgrade-1.4.350.0-1.4.350.1.patch"

RnJvbSAwZTY4ZTk0OTUwMzJhMDFjNjM3MzRlMzdjNGMwNmQ1YjdiYjRiMWRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTkgSnVuIDIwMjYgMDU6NDI6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bHNsYW5nOiB1cGdyYWRlIDEuNC4zNTAuMCAtPiAxLjQuMzUwLjEKCi0tLQogLi4uL2dsc2xhbmcv
Z2xzbGFuZy8wMDAxLWdlbmVyYXRlLWdsc2xhbmctcGtnLWNvbmZpZy5wYXRjaCAgICAgIHwgMiAr
LQogLi4uL2dsc2xhbmcve2dsc2xhbmdfMS40LjM1MC4wLmJiID0+IGdsc2xhbmdfMS40LjM1MC4x
LmJifSAgICAgIHwgMAogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL3tnbHNsYW5nXzEuNC4z
NTAuMC5iYiA9PiBnbHNsYW5nXzEuNC4zNTAuMS5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZy8wMDAxLWdlbmVyYXRlLWdsc2xhbmct
cGtnLWNvbmZpZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmcv
MDAwMS1nZW5lcmF0ZS1nbHNsYW5nLXBrZy1jb25maWcucGF0Y2gKaW5kZXggZDc0ZjM3ZGI5MS4u
ZjA2ZjEyYjMwMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xz
bGFuZy8wMDAxLWdlbmVyYXRlLWdsc2xhbmctcGtnLWNvbmZpZy5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nLzAwMDEtZ2VuZXJhdGUtZ2xzbGFuZy1wa2ct
Y29uZmlnLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlZTQ2ZjJmNjA4Y2NiZTk2MTdjZTQx
MjM1ZDA0N2YwODBkOTcyZmY3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyYzdlMjE2
MDViMDMyNGI0YWZkNTEyNzA1OTJiYzZjYjBhMGNjYTVmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiBEYXRlOiBT
dW4sIDcgRmViIDIwMjEgMDE6MzA6MzkgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gZ2VuZXJhdGUg
Z2xzbGFuZyBwa2ctY29uZmlnCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xz
bGFuZy9nbHNsYW5nXzEuNC4zNTAuMC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5n
L2dsc2xhbmdfMS40LjM1MC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nXzEuNC4zNTAuMC5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjQuMzUwLjEuYmIKLS0g
CjIuNDcuMQoK

--===============1501753295971038225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/glslang/glslang-dbg: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-dbg: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/glslang/glslang-dev: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-dev: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/glslang/glslang-doc: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-doc: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/glslang/glslang-locale: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-locale: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/glslang/glslang-src: FILELIST: directory renamed /usr/src/debug/glslang/1.4.350.0/glslang/MachineIndependent -> /usr/src/debug/glslang/1.4.350.1/glslang/MachineIndependent, directory renamed /usr/src/debug/glslang/1.4.350.0/glslang/CInterface -> /usr/src/debug/glslang/1.4.350.1/glslang/CInterface, directory renamed /usr/src/debug/glslang/1.4.350.0/glslang -> /usr/src/debug/glslang/1.4.350.1/glslang, directory renamed /usr/src/debug/glslang/1.4.350.0/glslang/Public -> /usr/src/debug/glslang/1.4.350.1/glslang/Public, directory renamed /usr/src/debug/glslang/1.4.350.0/glslang/ResourceLimits -> /usr/src/debug/glslang/1.4.350.1/glslang/ResourceLimits, directory renamed /usr/src/debug/glslang/1.4.350.0/glslang/OSDependent -> /usr/src/debug/glslang/1.4.350.1/glslang/OSDependent, directory renamed /usr/src/debug/glslang/1.4.350.0/glslang/HLSL -> /usr/src/debug/glslang/1.4.350.1/glslang/HLSL, directory renamed /usr/src/debug/glslang/1.4.350.0/glslang/GenericCodeG
 en -> /usr/src/debug/glslang/1.4.350.1/glslang/GenericCodeGen, directory renamed /usr/src/debug/glslang/1.4.350.0/SPIRV/CInterface -> /usr/src/debug/glslang/1.4.350.1/SPIRV/CInterface, directory renamed /usr/src/debug/glslang/1.4.350.0/SPIRV -> /usr/src/debug/glslang/1.4.350.1/SPIRV, directory renamed /usr/src/debug/glslang/1.4.350.0/StandAlone -> /usr/src/debug/glslang/1.4.350.1/StandAlone, directory renamed /usr/src/debug/glslang/1.4.350.0/glslang/Include -> /usr/src/debug/glslang/1.4.350.1/glslang/Include, directory renamed /usr/src/debug/glslang/1.4.350.0/glslang/MachineIndependent/preprocessor -> /usr/src/debug/glslang/1.4.350.1/glslang/MachineIndependent/preprocessor, directory renamed /usr/src/debug/glslang/1.4.350.0/include/glslang -> /usr/src/debug/glslang/1.4.350.1/include/glslang, directory renamed /usr/src/debug/glslang/1.4.350.0/glslang/OSDependent/Unix -> /usr/src/debug/glslang/1.4.350.1/glslang/OSDependent/Unix
packages/x86-64-v3-poky-linux/glslang/glslang-src: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-src: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/glslang/glslang-staticdev: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-staticdev: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/glslang/glslang: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/glslang/glslang: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/glslang: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/glslang: SRC_URI changed from "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main;tag=vulkan-sdk-1.4.350.0 file://0001-generate-glslang-pkg-config.patch" to "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main;tag=vulkan-sdk-1.4.350.1 file://0001-generate-glslang-pkg-config.patch"
packages/x86-64-v3-poky-linux/glslang: PV changed from "1.4.350.0" to "1.4.350.1"

--===============1501753295971038225==--

