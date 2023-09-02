Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1763CA1004
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:13 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.5667.1693650552335893680
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JOf111oH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=eMLZ1hW5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018a55708300-b0f13031-effb-4b71-b75b-a5268b7938b9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650551;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0U3HfviP7PbePDKD9XSWzib5LCylDul3/TtXcL8Zozg=;
	b=JOf111oHUd4E9kIVJmCX4Jhz6/op18qdw6sCJySOcY8+4pZOONzfxrhlpxI7Vcyk
	Th+31rLVTj+0UaCMv1EeJvQdaKmooRjDs/vMYgcyjuzGWd1sIxLgIVdlLR2+EgtR9uB
	orXe/bJOJxm8gQ28oi8PoNFP38RUOUyl/n5Sx/mU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650551;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0U3HfviP7PbePDKD9XSWzib5LCylDul3/TtXcL8Zozg=;
	b=eMLZ1hW54HLDsJqNNWtcqeET/+YVGqeCM/mWuidtGTmKAN3l/aqBbrJFPNQlICRo
	GL8Syf5q1Dv6xEj/PcHWNGL7wizMHdmZGQJGuZRCpJefUOxSNZ4SZphmRB0etqApphY
	uvcWaHiOkt3FSKGt39JY3Zxd6S88Grp2NlH2pIw0=
Content-Type: multipart/mixed; boundary="===============2821002834042634789=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] kbd: upgrading to 2.6.2 SUCCEEDED
Message-ID: <0101018a55708300-b0f13031-effb-4b71-b75b-a5268b7938b9-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187036

--===============2821002834042634789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *kbd* to *2.6.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kbd-upgrade-2.6.1-2.6.2.patch
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
From 69ef256894a8433b26a0e7236aa161bbd5f41755 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Sep 2023 09:21:33 +0000
Subject: [PATCH] kbd: upgrade 2.6.1 -> 2.6.2

---
 meta/recipes-core/kbd/{kbd_2.6.1.bb => kbd_2.6.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/kbd/{kbd_2.6.1.bb => kbd_2.6.2.bb} (94%)

diff --git a/meta/recipes-core/kbd/kbd_2.6.1.bb b/meta/recipes-core/kbd/kbd_2.6.2.bb
similarity index 94%
rename from meta/recipes-core/kbd/kbd_2.6.1.bb
rename to meta/recipes-core/kbd/kbd_2.6.2.bb
index 112039b919..abd039f7a9 100644
--- a/meta/recipes-core/kbd/kbd_2.6.1.bb
+++ b/meta/recipes-core/kbd/kbd_2.6.2.bb
@@ -16,7 +16,7 @@ RCONFLICTS:${PN} = "console-tools"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
            "
 
-SRC_URI[sha256sum] = "2eb6c6c972be9589bab733275bf020beb5f644d5f9439737920e701af6cf3485"
+SRC_URI[sha256sum] = "33e3bb3c3f55933b10f053b14b5f69a2e24c28543e9ec7690246fe47628dd94f"
 
 EXTRA_OECONF = "--disable-tests"
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
-- 
2.39.2


--===============2821002834042634789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/kbd/kbd-consolefonts: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-consolefonts: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-consoletrans: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-consoletrans: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-dbg: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-dbg: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-dbg: PKGSIZE changed from 1126732 to 1126756 (+0%)
packages/core2-32-poky-linux/kbd/kbd-dev: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-dev: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-doc: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-doc: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-keymaps: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-keymaps: FILELIST: added "/usr/share/keymaps/i386/colemak/mod-dh-matrix-us.map.gz /usr/share/keymaps/i386/colemak/mod-dh-iso-us-wide.map.gz /usr/share/keymaps/i386/colemak/mod-dh-iso-uk-wide.map.gz /usr/share/keymaps/i386/colemak/mod-dh-ansi-us-awing.map.gz /usr/share/keymaps/i386/colemak/mod-dh-ansi-us-fatz.map.gz /usr/share/keymaps/i386/colemak/mod-dh-iso-uk.map.gz /usr/share/keymaps/i386/colemak/mod-dh-iso-us.map.gz /usr/share/keymaps/i386/colemak/mod-dh-ansi-us-wide.map.gz /usr/share/keymaps/i386/colemak/mod-dh-ansi-us.map.gz /usr/share/keymaps/i386/colemak/mod-dh-ansi-us-fatz-wide.map.gz"
packages/core2-32-poky-linux/kbd/kbd-keymaps: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-keymaps: PKGSIZE changed from 556775 to 570294 (+2%)
packages/core2-32-poky-linux/kbd/kbd-locale-cs: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-cs: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-da: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-da: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-de: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-de: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-el: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-el: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-eo: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-eo: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-es: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-es: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-fr: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-fr: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-gr: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-gr: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-id: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-id: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-it: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-it: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-nl: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-nl: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-pl: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-pl: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-pt-br: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-pt-br: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-pt: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-pt: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-ro: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-ro: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-ru: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-ru: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-sr: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-sr: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-sv: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-sv: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-tr: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-tr: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-uk: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-uk: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-vi: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-vi: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-locale-zh-cn: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-locale-zh-cn: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-src: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-src: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-src: PKGSIZE changed from 583574 to 583569 (-0%)
packages/core2-32-poky-linux/kbd/kbd-staticdev: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-staticdev: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd-unimaps: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd-unimaps: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd/kbd: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd/kbd: PV changed from "2.6.1" to "2.6.2"
packages/core2-32-poky-linux/kbd: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-32-poky-linux/kbd: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/kbd/kbd-2.6.1.tar.xz" to "https://cdn.kernel.org/pub/linux/utils/kbd/kbd-2.6.2.tar.xz"
packages/core2-32-poky-linux/kbd: PV changed from "2.6.1" to "2.6.2"
Changes to packages/core2-32-poky-linux/kbd (sysroot):
  /usr/share/keymaps/i386/colemak/mod-dh-ansi-us-awing.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-ansi-us-fatz.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-ansi-us-fatz-wide.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-ansi-us.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-ansi-us-wide.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-iso-uk.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-iso-uk-wide.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-iso-us.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-iso-us-wide.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-matrix-us.map.gz was added

--===============2821002834042634789==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-kbd-upgrade-2.6.1-2.6.2.patch"

RnJvbSA2OWVmMjU2ODk0YTg0MzNiMjZhMGU3MjM2YWExNjFiYmQ1ZjQxNzU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAwOToyMTozMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGti
ZDogdXBncmFkZSAyLjYuMSAtPiAyLjYuMgoKLS0tCiBtZXRhL3JlY2lwZXMtY29yZS9rYmQve2ti
ZF8yLjYuMS5iYiA9PiBrYmRfMi42LjIuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUva2JkL3tr
YmRfMi42LjEuYmIgPT4ga2JkXzIuNi4yLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb3JlL2tiZC9rYmRfMi42LjEuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9rYmQva2JkXzIu
Ni4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3Jl
L2tiZC9rYmRfMi42LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL2tiZC9rYmRfMi42
LjIuYmIKaW5kZXggMTEyMDM5YjkxOS4uYWJkMDM5ZjdhOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWNvcmUva2JkL2tiZF8yLjYuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9rYmQva2Jk
XzIuNi4yLmJiCkBAIC0xNiw3ICsxNiw3IEBAIFJDT05GTElDVFM6JHtQTn0gPSAiY29uc29sZS10
b29scyIKIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9saW51eC91dGlscy8ke0JQTn0v
JHtCUH0udGFyLnh6IFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMmVi
NmM2Yzk3MmJlOTU4OWJhYjczMzI3NWJmMDIwYmViNWY2NDRkNWY5NDM5NzM3OTIwZTcwMWFmNmNm
MzQ4NSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzM2UzYmIzYzNmNTU5MzNiMTBmMDUzYjE0YjVm
NjlhMmUyNGMyODU0M2U5ZWM3NjkwMjQ2ZmU0NzYyOGRkOTRmIgogCiBFWFRSQV9PRUNPTkYgPSAi
LS1kaXNhYmxlLXRlc3RzIgogUEFDS0FHRUNPTkZJRyA/PSAiJHtAYmIudXRpbHMuZmlsdGVyKCdE
SVNUUk9fRkVBVFVSRVMnLCAncGFtJywgZCl9IFwKLS0gCjIuMzkuMgoK

--===============2821002834042634789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/kbd/kbd-keymaps: FILELIST: added "/usr/share/keymaps/i386/colemak/mod-dh-ansi-us-fatz.map.gz /usr/share/keymaps/i386/colemak/mod-dh-ansi-us-awing.map.gz /usr/share/keymaps/i386/colemak/mod-dh-ansi-us-fatz-wide.map.gz /usr/share/keymaps/i386/colemak/mod-dh-ansi-us-wide.map.gz /usr/share/keymaps/i386/colemak/mod-dh-iso-us-wide.map.gz /usr/share/keymaps/i386/colemak/mod-dh-iso-uk-wide.map.gz /usr/share/keymaps/i386/colemak/mod-dh-matrix-us.map.gz /usr/share/keymaps/i386/colemak/mod-dh-ansi-us.map.gz /usr/share/keymaps/i386/colemak/mod-dh-iso-us.map.gz /usr/share/keymaps/i386/colemak/mod-dh-iso-uk.map.gz"
Changes to packages/core2-32-poky-linux/kbd (sysroot):
  /usr/share/keymaps/i386/colemak/mod-dh-ansi-us-awing.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-ansi-us-fatz.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-ansi-us-fatz-wide.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-ansi-us.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-ansi-us-wide.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-iso-uk.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-iso-uk-wide.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-iso-us.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-iso-us-wide.map.gz was added
  /usr/share/keymaps/i386/colemak/mod-dh-matrix-us.map.gz was added

--===============2821002834042634789==--

