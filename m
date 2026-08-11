Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA06C5CFC0
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 07:24:00 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49083.1786433035683175570
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 00:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QOwlxJn3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NHTc//I2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019fefb4db91-24d04525-fb2d-43b5-98dd-2146f1841b04-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786433035;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=xzS4t9acbkQImAVoiffFsyprwRkYfyxkMxQBK9kES1s=;
	b=QOwlxJn3Q0p5poXMXyeaskc3bwCPd8qBYpziF9Qaf5QWpTrVFhZHVHl+d8DXyW3J
	3MJ5ghvF0ONNzlyL9JQaRuRRNGURlDZQy9ZMRaBvz5iHOE+v9qcn4bZ++Lx+nSU3zM3
	9e+nS3ltkDblahGV1P/wkPBWCd80a5Kah3KAYRZU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786433035;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=xzS4t9acbkQImAVoiffFsyprwRkYfyxkMxQBK9kES1s=;
	b=NHTc//I2N8lY2g4VXvO0NNGty6n6BMZp+aoDnF58o0szxTxYrpO0h7p30ZrI0q9G
	zd2fBMcuvEK4XgpVJmBbxnNaN280f6Q/cVJ3sXPVneNAJAS8UNIbSfl7TBEaAk6XZNj
	iEGq82n3zxCo8EM9DMoJDj2fQUrTbP3QjUvTUNVQ=
Content-Type: multipart/mixed; boundary="===============5136750270392222875=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libpsl: upgrading to 0.23.2 SUCCEEDED
Message-ID: <0101019fefb4db91-24d04525-fb2d-43b5-98dd-2146f1841b04-000000@us-west-2.amazonses.com>
Date: Tue, 11 Aug 2026 07:23:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.11-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 07:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243164

--===============5136750270392222875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libpsl* to *0.23.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpsl-upgrade-0.23.1-0.23.2.patch
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
From f40b9f43b5dfacae6bcf7491ff21b3d5a9610e4c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 11 Aug 2026 07:23:44 +0000
Subject: [PATCH] libpsl: upgrade 0.23.1 -> 0.23.2

Source: NEWS

10.08.2026 Release V0.23.2
  * meson: Use compatible C code instead of 'date'
  * configure.ac: Fix typo that broke SOURCE_DATE_EPOCH for COPYRIGHT_YEAR
---
 .../libpsl/{libpsl_0.23.1.bb => libpsl_0.23.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libpsl/{libpsl_0.23.1.bb => libpsl_0.23.2.bb} (91%)

diff --git a/meta/recipes-support/libpsl/libpsl_0.23.1.bb b/meta/recipes-support/libpsl/libpsl_0.23.2.bb
similarity index 91%
rename from meta/recipes-support/libpsl/libpsl_0.23.1.bb
rename to meta/recipes-support/libpsl/libpsl_0.23.2.bb
index 3baeb9d77a..d4e0056514 100644
--- a/meta/recipes-support/libpsl/libpsl_0.23.1.bb
+++ b/meta/recipes-support/libpsl/libpsl_0.23.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=49296c1806ef92c28297fb264163d81e \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "8fbb03054556498ba9c4cc48fcaa36a4483748c6504a65bdb9ba348f555b0e56"
+SRC_URI[sha256sum] = "f2ea0e59bffb36597a872f6ef89893ffa4c30196c87eff7aeb2c47e4e8c98133"
 
 GITHUB_BASE_URI = "https://github.com/rockdaboot/libpsl/releases"
 
-- 
2.47.1


--===============5136750270392222875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libpsl-changelog.txt"

Changelog for libpsl: 0.23.1 -> 0.23.2
Source: NEWS

10.08.2026 Release V0.23.2
  * meson: Use compatible C code instead of 'date'
  * configure.ac: Fix typo that broke SOURCE_DATE_EPOCH for COPYRIGHT_YEAR

--===============5136750270392222875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libpsl: PV changed from "0.23.1" to "0.23.2"
packages/x86-64-v3-poky-linux/libpsl: SRC_URI changed from "https://github.com/rockdaboot/libpsl/releases/download/0.23.1/libpsl-0.23.1.tar.gz" to "https://github.com/rockdaboot/libpsl/releases/download/0.23.2/libpsl-0.23.2.tar.gz"
packages/x86-64-v3-poky-linux/libpsl: PKGV changed from 0.23.1 [default] to 0.23.2 [default]
packages/x86-64-v3-poky-linux/libpsl/libpsl-bin: PV changed from "0.23.1" to "0.23.2"
packages/x86-64-v3-poky-linux/libpsl/libpsl-bin: PKGV changed from 0.23.1 [default] to 0.23.2 [default]
packages/x86-64-v3-poky-linux/libpsl/libpsl-dbg: PV changed from "0.23.1" to "0.23.2"
packages/x86-64-v3-poky-linux/libpsl/libpsl-dbg: PKGV changed from 0.23.1 [default] to 0.23.2 [default]
packages/x86-64-v3-poky-linux/libpsl/libpsl-dbg: PKGSIZE changed from 158520 to 158440 (-0%)
packages/x86-64-v3-poky-linux/libpsl/libpsl-dev: PV changed from "0.23.1" to "0.23.2"
packages/x86-64-v3-poky-linux/libpsl/libpsl-dev: PKGV changed from 0.23.1 [default] to 0.23.2 [default]
packages/x86-64-v3-poky-linux/libpsl/libpsl-doc: PV changed from "0.23.1" to "0.23.2"
packages/x86-64-v3-poky-linux/libpsl/libpsl-doc: PKGV changed from 0.23.1 [default] to 0.23.2 [default]
packages/x86-64-v3-poky-linux/libpsl/libpsl-locale: PV changed from "0.23.1" to "0.23.2"
packages/x86-64-v3-poky-linux/libpsl/libpsl-locale: PKGV changed from 0.23.1 [default] to 0.23.2 [default]
packages/x86-64-v3-poky-linux/libpsl/libpsl-src: PV changed from "0.23.1" to "0.23.2"
packages/x86-64-v3-poky-linux/libpsl/libpsl-src: FILELIST: directory renamed /usr/src/debug/libpsl/0.23.1/src -> /usr/src/debug/libpsl/0.23.2/src, directory renamed /usr/src/debug/libpsl/0.23.1/include -> /usr/src/debug/libpsl/0.23.2/include, directory renamed /usr/src/debug/libpsl/0.23.1/tools -> /usr/src/debug/libpsl/0.23.2/tools
packages/x86-64-v3-poky-linux/libpsl/libpsl-src: PKGV changed from 0.23.1 [default] to 0.23.2 [default]
packages/x86-64-v3-poky-linux/libpsl/libpsl-staticdev: PV changed from "0.23.1" to "0.23.2"
packages/x86-64-v3-poky-linux/libpsl/libpsl-staticdev: PKGV changed from 0.23.1 [default] to 0.23.2 [default]
packages/x86-64-v3-poky-linux/libpsl/libpsl: PV changed from "0.23.1" to "0.23.2"
packages/x86-64-v3-poky-linux/libpsl/libpsl: PKGV changed from 0.23.1 [default] to 0.23.2 [default]

--===============5136750270392222875==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpsl-upgrade-0.23.1-0.23.2.patch"

RnJvbSBmNDBiOWY0M2I1ZGZhY2FlNmJjZjc0OTFmZjIxYjNkNWE5NjEwZTRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTEgQXVnIDIwMjYgMDc6MjM6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJwc2w6IHVwZ3JhZGUgMC4yMy4xIC0+IDAuMjMuMgoKU291cmNlOiBORVdTCgoxMC4wOC4yMDI2
IFJlbGVhc2UgVjAuMjMuMgogICogbWVzb246IFVzZSBjb21wYXRpYmxlIEMgY29kZSBpbnN0ZWFk
IG9mICdkYXRlJwogICogY29uZmlndXJlLmFjOiBGaXggdHlwbyB0aGF0IGJyb2tlIFNPVVJDRV9E
QVRFX0VQT0NIIGZvciBDT1BZUklHSFRfWUVBUgotLS0KIC4uLi9saWJwc2wve2xpYnBzbF8wLjIz
LjEuYmIgPT4gbGlicHNsXzAuMjMuMi5iYn0gICAgICAgICAgICAgICB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1zdXBwb3J0L2xpYnBzbC97bGlicHNsXzAuMjMuMS5iYiA9PiBsaWJwc2xfMC4yMy4yLmJifSAo
OTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnBzbC9saWJwc2xfMC4y
My4xLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicHNsL2xpYnBzbF8wLjIzLjIuYmIKc2lt
aWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicHNs
L2xpYnBzbF8wLjIzLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnBzbC9s
aWJwc2xfMC4yMy4yLmJiCmluZGV4IDNiYWViOWQ3N2EuLmQ0ZTAwNTY1MTQgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnBzbC9saWJwc2xfMC4yMy4xLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYnBzbC9saWJwc2xfMC4yMy4yLmJiCkBAIC0xMiw3ICsxMiw3IEBA
IExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTQ5Mjk2YzE4MDZlZjkyYzI4
Mjk3ZmIyNjQxNjNkODFlIFwKICAgICAgICAgICAgICAgICAgICAgIgogCiBTUkNfVVJJID0gIiR7
R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC8ke1BWfS8ke0JQfS50YXIuZ3oiCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiOGZiYjAzMDU0NTU2NDk4YmE5YzRjYzQ4ZmNhYTM2YTQ0ODM3NDhjNjUwNGE2
NWJkYjliYTM0OGY1NTViMGU1NiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmMmVhMGU1OWJmZmIz
NjU5N2E4NzJmNmVmODk4OTNmZmE0YzMwMTk2Yzg3ZWZmN2FlYjJjNDdlNGU4Yzk4MTMzIgogCiBH
SVRIVUJfQkFTRV9VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL3JvY2tkYWJvb3QvbGlicHNsL3Jl
bGVhc2VzIgogCi0tIAoyLjQ3LjEKCg==

--===============5136750270392222875==--

