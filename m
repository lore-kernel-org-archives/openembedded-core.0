Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A9E9CCF2DE
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 06:03:02 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28426.1792389773540639184
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2026 23:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QRCBkM/Z;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mxmKERCP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a152c174b1-a17095ce-4697-4db9-937f-398dd34aee1c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792389772;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hQejpJskwRrYMoLTo0014hgW/H0alHJl0XIY8UAO3Oo=;
	b=QRCBkM/ZbouA5Fbj2+1cjnw3x0+mgDhpfyPaV7hC+OmuPPl+fho9EU3PC0PEnZMw
	XUtUEUlq1u7FnHmhIhMrgZnws4JlX132MVqNdrz885nk+Dcv7PrqYYrCSjx6PKU18By
	peNnj3K6/sCmxSaENxiTbY97TxOIR6CwINWLukow=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792389772;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hQejpJskwRrYMoLTo0014hgW/H0alHJl0XIY8UAO3Oo=;
	b=mxmKERCPB8Ju5fdJ6IygAfatyto2TmYbNBLA7m3TePrwZmZVRSC7rzux/N6/Fg5k
	W0QLVlpRN8ORykjcmvkLotFaWADGk171bO7chcPw/wkHN29Ad/Vcf8FCGfSC4B843NW
	OltmjPFD9CV12IEoDEa28afjLm2fEjFksl5Gs0c4=
Content-Type: multipart/mixed; boundary="===============5289320848008605569=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pkgconf: upgrading to 3.0.10 SUCCEEDED
Message-ID: <010101a152c174b1-a17095ce-4697-4db9-937f-398dd34aee1c-000000@us-west-2.amazonses.com>
Date: Mon, 19 Oct 2026 06:02:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.19-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 06:03:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248122

--===============5289320848008605569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *pkgconf* to *3.0.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pkgconf-upgrade-3.0.8-3.0.10.patch
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
From 6131bd41e1d5eec8a0b5d2e9f108377adfae903a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 19 Oct 2026 05:28:28 +0000
Subject: [PATCH] pkgconf: upgrade 3.0.8 -> 3.0.10

Changes from 3.0.9 to 3.0.10:
-----------------------------

Changes from 3.0.8 to 3.0.9:
----------------------------
---
 .../pkgconf/{pkgconf_3.0.8.bb => pkgconf_3.0.10.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_3.0.8.bb => pkgconf_3.0.10.bb} (97%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_3.0.8.bb b/meta/recipes-devtools/pkgconf/pkgconf_3.0.10.bb
similarity index 97%
rename from meta/recipes-devtools/pkgconf/pkgconf_3.0.8.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_3.0.10.bb
index cd55484c30..e8746c1ceb 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_3.0.8.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_3.0.10.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "943f0bc88bcaeceb630b00262e2a8ad5ea4fac3fba72a4267d8b9ec6b35d1194"
+SRC_URI[sha256sum] = "9371b2f6372da574d4c6dc96fe9b1463037bcf6afcb6671c1555afde7b17e2de"
 UPSTREAM_CHECK_REGEX = "pkgconf-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)\.tar"
 
 inherit autotools pkgconfig
-- 
2.47.1


--===============5289320848008605569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added

--===============5289320848008605569==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pkgconf-upgrade-3.0.8-3.0.10.patch"

RnJvbSA2MTMxYmQ0MWUxZDVlZWM4YTBiNWQyZTlmMTA4Mzc3YWRmYWU5MDNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTkgT2N0IDIwMjYgMDU6Mjg6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
a2djb25mOiB1cGdyYWRlIDMuMC44IC0+IDMuMC4xMAoKQ2hhbmdlcyBmcm9tIDMuMC45IHRvIDMu
MC4xMDoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCkNoYW5nZXMgZnJvbSAzLjAuOCB0
byAzLjAuOToKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQotLS0KIC4uLi9wa2djb25mL3tw
a2djb25mXzMuMC44LmJiID0+IHBrZ2NvbmZfMy4wLjEwLmJifSAgICAgICAgICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3twa2djb25mXzMuMC44LmJiID0+IHBrZ2NvbmZf
My4wLjEwLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2dj
b25mL3BrZ2NvbmZfMy4wLjguYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2dj
b25mXzMuMC4xMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcGtnY29uZi9wa2djb25mXzMuMC44LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcGtnY29uZi9wa2djb25mXzMuMC4xMC5iYgppbmRleCBjZDU1NDg0YzMwLi5l
ODc0NmMxY2ViIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2dj
b25mXzMuMC44LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3BrZ2NvbmZf
My4wLjEwLmJiCkBAIC0yMCw3ICsyMCw3IEBAIFNSQ19VUkkgPSAiXAogICAgIGZpbGU6Ly9wa2ct
Y29uZmlnLW5hdGl2ZS5pbiBcCiAgICAgZmlsZTovL3BrZy1jb25maWctZXNkay5pbiBcCiAiCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiOTQzZjBiYzg4YmNhZWNlYjYzMGIwMDI2MmUyYThhZDVlYTRm
YWMzZmJhNzJhNDI2N2Q4YjllYzZiMzVkMTE5NCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5Mzcx
YjJmNjM3MmRhNTc0ZDRjNmRjOTZmZTliMTQ2MzAzN2JjZjZhZmNiNjY3MWMxNTU1YWZkZTdiMTdl
MmRlIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicGtnY29uZi0oP1A8cHZlcj5cZCtcLlxkK1wu
KD8hOVxkKylcZCspXC50YXIiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZwotLSAKMi40
Ny4xCgo=

--===============5289320848008605569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/pkgconf: PV changed from "3.0.8" to "3.0.10"
packages/x86-64-v3-poky-linux/pkgconf: SRC_URI changed from "https://distfiles.ariadne.space/pkgconf/pkgconf-3.0.8.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in" to "https://distfiles.ariadne.space/pkgconf/pkgconf-3.0.10.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in"
packages/x86-64-v3-poky-linux/pkgconf: PKGV changed from 3.0.8 [default] to 3.0.10 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PV changed from "3.0.8" to "3.0.10"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PKGV changed from 3.0.8 [default] to 3.0.10 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PKGSIZE changed from 793328 to 793384 (+0%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PV changed from "3.0.8" to "3.0.10"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PKGV changed from 3.0.8 [default] to 3.0.10 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PKGSIZE changed from 45425 to 45427 (+0%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PV changed from "3.0.8" to "3.0.10"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PKGV changed from 3.0.8 [default] to 3.0.10 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-locale: PV changed from "3.0.8" to "3.0.10"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-locale: PKGV changed from 3.0.8 [default] to 3.0.10 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: FILELIST: directory renamed /usr/src/debug/pkgconf/3.0.8/cli -> /usr/src/debug/pkgconf/3.0.10/cli, directory renamed /usr/src/debug/pkgconf/3.0.8/cli/pccritic -> /usr/src/debug/pkgconf/3.0.10/cli/pccritic, directory renamed /usr/src/debug/pkgconf/3.0.8/cli/bomtool -> /usr/src/debug/pkgconf/3.0.10/cli/bomtool, directory renamed /usr/src/debug/pkgconf/3.0.8/cli/spdxtool -> /usr/src/debug/pkgconf/3.0.10/cli/spdxtool, directory renamed /usr/src/debug/pkgconf/3.0.8/libpkgconf -> /usr/src/debug/pkgconf/3.0.10/libpkgconf
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PV changed from "3.0.8" to "3.0.10"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PKGV changed from 3.0.8 [default] to 3.0.10 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PKGSIZE changed from 575604 to 575605 (+0%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-staticdev: PV changed from "3.0.8" to "3.0.10"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-staticdev: PKGV changed from 3.0.8 [default] to 3.0.10 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: PV changed from "3.0.8" to "3.0.10"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: PKGV changed from 3.0.8 [default] to 3.0.10 [default]
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added

--===============5289320848008605569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="pkgconf-changelog.txt"

Changes from 3.0.9 to 3.0.10:
-----------------------------

Changes from 3.0.8 to 3.0.9:
----------------------------

--===============5289320848008605569==--

