Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F7FFC5AD5A
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 05:30:43 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3799.1786771838469669150
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 22:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NcLWWzaZ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=4jMI953r;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a003e692d4-ac920552-ac8f-4870-9201-c1a0658301ea-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786771837;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=6d48XOYqoVb675qQkZP49Z4TxydInZXAp0VHiQejU4M=;
	b=NcLWWzaZkNHkTAo+I980q3bcR85ZIN1jXSZru4gO2WVlUcJL4b8JjF598HbTDagy
	Q8IoSd+RFfMAl9YsJE/JWBQCmQQxGQQrR7uz4fWA7z8H9WJORYP+Hv4KMRsI78xsxuc
	rBd0Au7ohGtpjSkgrldAq6uHvbVlR+/KL/iw7Km8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786771837;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=6d48XOYqoVb675qQkZP49Z4TxydInZXAp0VHiQejU4M=;
	b=4jMI953rQgpQJmjiLWfmM8zXbVMQcdiL3VNaqplr4Lehy/z2jTPqHWZ464s3GR3x
	PJs+JNfnyIGCfYBdyG/DB+7qz8+hStZf5/9Mwq1tYOpIMtyJRFrnc2Rk3z1Z8x2WMfk
	N41Vlm2zuXBeeiJAmpMWCPRIlrrtgghUp9fsXCAs=
Content-Type: multipart/mixed; boundary="===============9008838270443896408=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libpsl: upgrading to 0.23.3 SUCCEEDED
Message-ID: <010101a003e692d4-ac920552-ac8f-4870-9201-c1a0658301ea-000000@us-west-2.amazonses.com>
Date: Sat, 15 Aug 2026 05:30:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 05:30:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243473

--===============9008838270443896408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libpsl* to *0.23.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpsl-upgrade-0.23.1-0.23.3.patch
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
From 3a4679a5026e7a9c9efc65a064d5ea9c3c91c3b9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Aug 2026 05:30:31 +0000
Subject: [PATCH] libpsl: upgrade 0.23.1 -> 0.23.3

Source: NEWS

14.08.2026 Release V0.23.3
  * meson: make copyright_prog work for cross builds

10.08.2026 Release V0.23.2
  * meson: Use compatible C code instead of 'date'
  * configure.ac: Fix typo that broke SOURCE_DATE_EPOCH for COPYRIGHT_YEAR
---
 .../libpsl/{libpsl_0.23.1.bb => libpsl_0.23.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libpsl/{libpsl_0.23.1.bb => libpsl_0.23.3.bb} (91%)

diff --git a/meta/recipes-support/libpsl/libpsl_0.23.1.bb b/meta/recipes-support/libpsl/libpsl_0.23.3.bb
similarity index 91%
rename from meta/recipes-support/libpsl/libpsl_0.23.1.bb
rename to meta/recipes-support/libpsl/libpsl_0.23.3.bb
index 3baeb9d77a..1bba67ad96 100644
--- a/meta/recipes-support/libpsl/libpsl_0.23.1.bb
+++ b/meta/recipes-support/libpsl/libpsl_0.23.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=49296c1806ef92c28297fb264163d81e \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "8fbb03054556498ba9c4cc48fcaa36a4483748c6504a65bdb9ba348f555b0e56"
+SRC_URI[sha256sum] = "93941f85a1e7bd593fa94f299233cb5dfc91cd144fd9a78a6ceb75001c5b03be"
 
 GITHUB_BASE_URI = "https://github.com/rockdaboot/libpsl/releases"
 
-- 
2.47.1


--===============9008838270443896408==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpsl-upgrade-0.23.1-0.23.3.patch"

RnJvbSAzYTQ2NzlhNTAyNmU3YTljOWVmYzY1YTA2NGQ1ZWE5YzNjOTFjM2I5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXVnIDIwMjYgMDU6MzA6MzEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJwc2w6IHVwZ3JhZGUgMC4yMy4xIC0+IDAuMjMuMwoKU291cmNlOiBORVdTCgoxNC4wOC4yMDI2
IFJlbGVhc2UgVjAuMjMuMwogICogbWVzb246IG1ha2UgY29weXJpZ2h0X3Byb2cgd29yayBmb3Ig
Y3Jvc3MgYnVpbGRzCgoxMC4wOC4yMDI2IFJlbGVhc2UgVjAuMjMuMgogICogbWVzb246IFVzZSBj
b21wYXRpYmxlIEMgY29kZSBpbnN0ZWFkIG9mICdkYXRlJwogICogY29uZmlndXJlLmFjOiBGaXgg
dHlwbyB0aGF0IGJyb2tlIFNPVVJDRV9EQVRFX0VQT0NIIGZvciBDT1BZUklHSFRfWUVBUgotLS0K
IC4uLi9saWJwc2wve2xpYnBzbF8wLjIzLjEuYmIgPT4gbGlicHNsXzAuMjMuMy5iYn0gICAgICAg
ICAgICAgICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnBzbC97bGlicHNsXzAuMjMuMS5i
YiA9PiBsaWJwc2xfMC4yMy4zLmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2xpYnBzbC9saWJwc2xfMC4yMy4xLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGli
cHNsL2xpYnBzbF8wLjIzLjMuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbGlicHNsL2xpYnBzbF8wLjIzLjEuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYnBzbC9saWJwc2xfMC4yMy4zLmJiCmluZGV4IDNiYWViOWQ3N2Eu
LjFiYmE2N2FkOTYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnBzbC9saWJw
c2xfMC4yMy4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnBzbC9saWJwc2xfMC4y
My4zLmJiCkBAIC0xMiw3ICsxMiw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VO
U0U7bWQ1PTQ5Mjk2YzE4MDZlZjkyYzI4Mjk3ZmIyNjQxNjNkODFlIFwKICAgICAgICAgICAgICAg
ICAgICAgIgogCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC8ke1BWfS8k
e0JQfS50YXIuZ3oiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGZiYjAzMDU0NTU2NDk4YmE5YzRj
YzQ4ZmNhYTM2YTQ0ODM3NDhjNjUwNGE2NWJkYjliYTM0OGY1NTViMGU1NiIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICI5Mzk0MWY4NWExZTdiZDU5M2ZhOTRmMjk5MjMzY2I1ZGZjOTFjZDE0NGZkOWE3
OGE2Y2ViNzUwMDFjNWIwM2JlIgogCiBHSVRIVUJfQkFTRV9VUkkgPSAiaHR0cHM6Ly9naXRodWIu
Y29tL3JvY2tkYWJvb3QvbGlicHNsL3JlbGVhc2VzIgogCi0tIAoyLjQ3LjEKCg==

--===============9008838270443896408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libpsl-changelog.txt"

Changelog for libpsl: 0.23.1 -> 0.23.3
Source: NEWS

14.08.2026 Release V0.23.3
  * meson: make copyright_prog work for cross builds

10.08.2026 Release V0.23.2
  * meson: Use compatible C code instead of 'date'
  * configure.ac: Fix typo that broke SOURCE_DATE_EPOCH for COPYRIGHT_YEAR

--===============9008838270443896408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libpsl: SRC_URI changed from "https://github.com/rockdaboot/libpsl/releases/download/0.23.1/libpsl-0.23.1.tar.gz" to "https://github.com/rockdaboot/libpsl/releases/download/0.23.3/libpsl-0.23.3.tar.gz"
packages/x86-64-v3-poky-linux/libpsl: PV changed from "0.23.1" to "0.23.3"
packages/x86-64-v3-poky-linux/libpsl: PKGV changed from 0.23.1 [default] to 0.23.3 [default]
packages/x86-64-v3-poky-linux/libpsl/libpsl-bin: PV changed from "0.23.1" to "0.23.3"
packages/x86-64-v3-poky-linux/libpsl/libpsl-bin: PKGV changed from 0.23.1 [default] to 0.23.3 [default]
packages/x86-64-v3-poky-linux/libpsl/libpsl-dbg: PKGSIZE changed from 158520 to 158568 (+0%)
packages/x86-64-v3-poky-linux/libpsl/libpsl-dbg: PV changed from "0.23.1" to "0.23.3"
packages/x86-64-v3-poky-linux/libpsl/libpsl-dbg: PKGV changed from 0.23.1 [default] to 0.23.3 [default]
packages/x86-64-v3-poky-linux/libpsl/libpsl-dev: PV changed from "0.23.1" to "0.23.3"
packages/x86-64-v3-poky-linux/libpsl/libpsl-dev: PKGV changed from 0.23.1 [default] to 0.23.3 [default]
packages/x86-64-v3-poky-linux/libpsl/libpsl-doc: PV changed from "0.23.1" to "0.23.3"
packages/x86-64-v3-poky-linux/libpsl/libpsl-doc: PKGV changed from 0.23.1 [default] to 0.23.3 [default]
packages/x86-64-v3-poky-linux/libpsl/libpsl-locale: PV changed from "0.23.1" to "0.23.3"
packages/x86-64-v3-poky-linux/libpsl/libpsl-locale: PKGV changed from 0.23.1 [default] to 0.23.3 [default]
packages/x86-64-v3-poky-linux/libpsl/libpsl-src: FILELIST: directory renamed /usr/src/debug/libpsl/0.23.1/src -> /usr/src/debug/libpsl/0.23.3/src, directory renamed /usr/src/debug/libpsl/0.23.1/include -> /usr/src/debug/libpsl/0.23.3/include, directory renamed /usr/src/debug/libpsl/0.23.1/tools -> /usr/src/debug/libpsl/0.23.3/tools
packages/x86-64-v3-poky-linux/libpsl/libpsl-src: PV changed from "0.23.1" to "0.23.3"
packages/x86-64-v3-poky-linux/libpsl/libpsl-src: PKGV changed from 0.23.1 [default] to 0.23.3 [default]
packages/x86-64-v3-poky-linux/libpsl/libpsl-staticdev: PV changed from "0.23.1" to "0.23.3"
packages/x86-64-v3-poky-linux/libpsl/libpsl-staticdev: PKGV changed from 0.23.1 [default] to 0.23.3 [default]
packages/x86-64-v3-poky-linux/libpsl/libpsl: PV changed from "0.23.1" to "0.23.3"
packages/x86-64-v3-poky-linux/libpsl/libpsl: PKGV changed from 0.23.1 [default] to 0.23.3 [default]

--===============9008838270443896408==--

