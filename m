Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 907BBC2FC23
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:40 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.5935.1689456453502472703
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FrRWiI/5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101895b73a326-7cfabf9d-c318-4200-93c0-a35820020088-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456452;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=irVzaeeugzIGyolFPwTp8BiXdYQhkjwh4UEHBBn6ea0=;
	b=FrRWiI/57hvDZMX6rvlpdA1Hokbhk9Ka3EOqLOJm39eX/SSdVOevueWVAe1/WdNR
	SUsAxqolled01l4ujJbXFMkcxG24Tbiud+PrPSXKEDEDhLy7eXfY2LT0KyvbLw11TxA
	D/OmHgEzLcfuGH1veQhagTlKb4jE/0x0VXQQ+RR4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456452;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=irVzaeeugzIGyolFPwTp8BiXdYQhkjwh4UEHBBn6ea0=;
	b=KfdfjSbTSH9N7q9w3tFAmFLrE57/g0rhnRPVGG/Kk9bkIwsEPGXEmqmweEUL2+vV
	mCyUhW9FVYHFMVvg0T4vpdSmUsZWR2nzgGnaup/G5ZFOVLlj5WkDoM6SIC+e1rebJsN
	CbvfZq7A6jVVQkY5HOBT6XUzBfVosiIMFkawrwh8=
Content-Type: multipart/mixed; boundary="===============0515384683769983722=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] u-boot: upgrading to 2023.07.02 FAILED
Message-ID: <010101895b73a326-7cfabf9d-c318-4200-93c0-a35820020088-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184315

--===============0515384683769983722==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *u-boot* to *2023.07.02* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-u-boot-upgrade-2023.04-2023.07.02.patch
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
From 5e17bba788679486aeb800668a88df32eeccb960 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 06:05:50 +0000
Subject: [PATCH] u-boot: upgrade 2023.04 -> 2023.07.02

---
 meta/recipes-bsp/u-boot/u-boot-common.inc                     | 4 ++--
 .../u-boot/{u-boot_2023.04.bb => u-boot_2023.07.02.bb}        | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/u-boot/{u-boot_2023.04.bb => u-boot_2023.07.02.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 8a2e9aef94..111914827d 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,9 +12,9 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "fd4ed6b7e83ec3aea9a2ce21baea8ca9676f40dd"
+SRCREV = "83cdab8b2c6ea0fc0860f8444d083353b47f1d5c"
 
-SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
+SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=u-boot-2023.07.y"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
diff --git a/meta/recipes-bsp/u-boot/u-boot_2023.04.bb b/meta/recipes-bsp/u-boot/u-boot_2023.07.02.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2023.04.bb
rename to meta/recipes-bsp/u-boot/u-boot_2023.07.02.bb
-- 
2.39.2


--===============0515384683769983722==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/qemux86-poky-linux/u-boot: SRC_URI changed from "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master" to "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=u-boot-2023.07.y"
packages/qemux86-poky-linux/u-boot: PKGV changed from 2023.04 [default] to 2023.07.02 [default]
packages/qemux86-poky-linux/u-boot: PV changed from "2023.04" to "2023.07.02"
Changes to packages/qemux86-poky-linux/u-boot (sysroot):
  /boot/u-boot.bin changed symlink target from u-boot-qemux86-2023.04-r0.bin to u-boot-qemux86-2023.07.02-r0.bin
  /boot/u-boot-qemux86-2023.07.02-r0.bin was added
  /boot/u-boot-qemux86-2023.04-r0.bin was removed
packages/qemux86-poky-linux/u-boot/u-boot-dbg: PKGV changed from 2023.04 [default] to 2023.07.02 [default]
packages/qemux86-poky-linux/u-boot/u-boot-dbg: PV changed from "2023.04" to "2023.07.02"
packages/qemux86-poky-linux/u-boot/u-boot-dev: PKGV changed from 2023.04 [default] to 2023.07.02 [default]
packages/qemux86-poky-linux/u-boot/u-boot-dev: PV changed from "2023.04" to "2023.07.02"
packages/qemux86-poky-linux/u-boot/u-boot-doc: PKGV changed from 2023.04 [default] to 2023.07.02 [default]
packages/qemux86-poky-linux/u-boot/u-boot-doc: PV changed from "2023.04" to "2023.07.02"
packages/qemux86-poky-linux/u-boot/u-boot-env: PKGV changed from 2023.04 [default] to 2023.07.02 [default]
packages/qemux86-poky-linux/u-boot/u-boot-env: FILELIST: removed "/etc/u-boot-initial-env-qemux86-2023.04-r0", added "/etc/u-boot-initial-env-qemux86-2023.07.02-r0"
packages/qemux86-poky-linux/u-boot/u-boot-env: PKGSIZE changed from 4711 to 4717 (+0%)
packages/qemux86-poky-linux/u-boot/u-boot-env: PV changed from "2023.04" to "2023.07.02"
packages/qemux86-poky-linux/u-boot/u-boot-extlinux: PKGV changed from 2023.04 [default] to 2023.07.02 [default]
packages/qemux86-poky-linux/u-boot/u-boot-extlinux: PV changed from "2023.04" to "2023.07.02"
packages/qemux86-poky-linux/u-boot/u-boot-locale: PKGV changed from 2023.04 [default] to 2023.07.02 [default]
packages/qemux86-poky-linux/u-boot/u-boot-locale: PV changed from "2023.04" to "2023.07.02"
packages/qemux86-poky-linux/u-boot/u-boot-src: PKGV changed from 2023.04 [default] to 2023.07.02 [default]
packages/qemux86-poky-linux/u-boot/u-boot-src: PV changed from "2023.04" to "2023.07.02"
packages/qemux86-poky-linux/u-boot/u-boot-staticdev: PKGV changed from 2023.04 [default] to 2023.07.02 [default]
packages/qemux86-poky-linux/u-boot/u-boot-staticdev: PV changed from "2023.04" to "2023.07.02"
packages/qemux86-poky-linux/u-boot/u-boot: PKGV changed from 2023.04 [default] to 2023.07.02 [default]
packages/qemux86-poky-linux/u-boot/u-boot: FILELIST: removed "/boot/u-boot-qemux86-2023.04-r0.bin", added "/boot/u-boot-qemux86-2023.07.02-r0.bin"
packages/qemux86-poky-linux/u-boot/u-boot: PKGSIZE changed from 752911 to 759580 (+1%)
packages/qemux86-poky-linux/u-boot/u-boot: PV changed from "2023.04" to "2023.07.02"

--===============0515384683769983722==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/qemux86-poky-linux/u-boot (sysroot):
  /boot/u-boot.bin changed symlink target from u-boot-qemux86-2023.04-r0.bin to u-boot-qemux86-2023.07.02-r0.bin
  /boot/u-boot-qemux86-2023.07.02-r0.bin was added
  /boot/u-boot-qemux86-2023.04-r0.bin was removed
packages/qemux86-poky-linux/u-boot/u-boot-env: FILELIST: removed "/etc/u-boot-initial-env-qemux86-2023.04-r0", added "/etc/u-boot-initial-env-qemux86-2023.07.02-r0"
packages/qemux86-poky-linux/u-boot/u-boot: FILELIST: removed "/boot/u-boot-qemux86-2023.04-r0.bin", added "/boot/u-boot-qemux86-2023.07.02-r0.bin"

--===============0515384683769983722==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 70 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'u-boot'
u-boot was skipped: Either UBOOT_MACHINE or UBOOT_CONFIG must be set in the qemuppc machine configuration.

--===============0515384683769983722==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-u-boot-upgrade-2023.04-2023.07.02.patch"

RnJvbSA1ZTE3YmJhNzg4Njc5NDg2YWViODAwNjY4YTg4ZGYzMmVlY2NiOTYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMDY6MDU6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
LWJvb3Q6IHVwZ3JhZGUgMjAyMy4wNCAtPiAyMDIzLjA3LjAyCgotLS0KIG1ldGEvcmVjaXBlcy1i
c3AvdS1ib290L3UtYm9vdC1jb21tb24uaW5jICAgICAgICAgICAgICAgICAgICAgfCA0ICsrLS0K
IC4uLi91LWJvb3Qve3UtYm9vdF8yMDIzLjA0LmJiID0+IHUtYm9vdF8yMDIzLjA3LjAyLmJifSAg
ICAgICAgfCAwCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC97dS1ib290XzIwMjMuMDQuYmIgPT4g
dS1ib290XzIwMjMuMDcuMDIuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1i
c3AvdS1ib290L3UtYm9vdC1jb21tb24uaW5jIGIvbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvdS1i
b290LWNvbW1vbi5pbmMKaW5kZXggOGEyZTlhZWY5NC4uMTExOTE0ODI3ZCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290LWNvbW1vbi5pbmMKKysrIGIvbWV0YS9yZWNp
cGVzLWJzcC91LWJvb3QvdS1ib290LWNvbW1vbi5pbmMKQEAgLTEyLDkgKzEyLDkgQEAgUEUgPSAi
MSIKIAogIyBXZSB1c2UgdGhlIHJldmlzaW9uIGluIG9yZGVyIHRvIGF2b2lkIGhhdmluZyB0byBm
ZXRjaCBpdCBmcm9tIHRoZQogIyByZXBvIGR1cmluZyBwYXJzZQotU1JDUkVWID0gImZkNGVkNmI3
ZTgzZWMzYWVhOWEyY2UyMWJhZWE4Y2E5Njc2ZjQwZGQiCitTUkNSRVYgPSAiODNjZGFiOGIyYzZl
YTBmYzA4NjBmODQ0NGQwODMzNTNiNDdmMWQ1YyIKIAotU1JDX1VSSSA9ICJnaXQ6Ly9zb3VyY2Uu
ZGVueC5kZS91LWJvb3QvdS1ib290LmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyIgor
U1JDX1VSSSA9ICJnaXQ6Ly9zb3VyY2UuZGVueC5kZS91LWJvb3QvdS1ib290LmdpdDtwcm90b2Nv
bD1odHRwczticmFuY2g9dS1ib290LTIwMjMuMDcueSIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIK
IEIgPSAiJHtXT1JLRElSfS9idWlsZCIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ic3AvdS1i
b290L3UtYm9vdF8yMDIzLjA0LmJiIGIvbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290XzIw
MjMuMDcuMDIuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1ic3AvdS1ib290L3UtYm9vdF8yMDIzLjA0LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtYnNw
L3UtYm9vdC91LWJvb3RfMjAyMy4wNy4wMi5iYgotLSAKMi4zOS4yCgo=

--===============0515384683769983722==--

