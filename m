Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CDDDC47258
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:33:58 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.88287.1705340030380468216
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=K/Rwd+tJ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=aA7W9axi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018d0e2fd123-f5bc2a70-a339-488b-86af-5dd747303a6d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340031;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FVqq8fzvMIl/FwRf76LKXdIR8GW2v3MaheVtECJ8Vi0=;
	b=K/Rwd+tJ76daURkMikvVkupkcUtXJU8bh4o1dA8hRG1w7cJQ9jqlk1SeDw05CFYy
	4ZA2KjN+3ajFrDQ4vhJC/K6P47u9fmEyXI87RtAC/R8LB9g+jAJg3bZW6oNqNOorW8A
	1YhmP3J2HhcKrJomIN8WtaHTLqKQiiShbBfq/bvs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340031;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FVqq8fzvMIl/FwRf76LKXdIR8GW2v3MaheVtECJ8Vi0=;
	b=aA7W9axiAoronX7mNzqBQVBITu2Sec2KK00qEcW3/aFP2CgBzLrspA0Nirc9/gaf
	0gYDty5lPc2J4DSy8/9LqI5y+oGU4X7M/yBvCHYJCIw0oXZLl1TlaBroGw63mT5NiwO
	PHD7tRQetKL5gLSUjqtp68c1JHbjz236dljBNnxw=
Content-Type: multipart/mixed; boundary="===============5902781178279699554=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iso-codes: upgrading to 4.16.0 SUCCEEDED
Message-ID: <0101018d0e2fd123-f5bc2a70-a339-488b-86af-5dd747303a6d-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:51 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193788

--===============5902781178279699554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *iso-codes* to *4.16.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-iso-codes-upgrade-4.15.0-4.16.0.patch
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
From dbb6fbc156d1f75526e039d411e08f3ce2517fdc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jan 2024 16:59:38 +0000
Subject: [PATCH] iso-codes: upgrade 4.15.0 -> 4.16.0

---
 .../iso-codes/{iso-codes_4.15.0.bb => iso-codes_4.16.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/iso-codes/{iso-codes_4.15.0.bb => iso-codes_4.16.0.bb} (94%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.16.0.bb
similarity index 94%
rename from meta/recipes-support/iso-codes/iso-codes_4.15.0.bb
rename to meta/recipes-support/iso-codes/iso-codes_4.16.0.bb
index 6ae6fdf8cb..f33cce1a9d 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.16.0.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=https;branch=main;"
-SRCREV = "69ba16daef3c5c5e3c18f2d919e25296a4b946be"
+SRCREV = "c2fcaadc832ed9f858950a43994973442d85ef4f"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.42.0


--===============5902781178279699554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/iso-codes/iso-codes-locale-he: PKGSIZE changed from 81194 to 90579 (+12%)
packages/all-poky-linux/iso-codes/iso-codes-locale-hy: FILELIST: added "/usr/share/locale/hy/LC_MESSAGES/iso_639-2.mo /usr/share/locale/hy/LC_MESSAGES/iso_639.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-hy: PKGSIZE changed from 34054 to 63315 (+86%)
packages/all-poky-linux/iso-codes/iso-codes-locale-km: FILELIST: added "/usr/share/locale/km/LC_MESSAGES/iso_3166_2.mo /usr/share/locale/km/LC_MESSAGES/iso_3166-2.mo /usr/share/locale/km/LC_MESSAGES/iso_4217.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-km: PKGSIZE changed from 39888 to 46145 (+16%)
packages/all-poky-linux/iso-codes/iso-codes-locale-lt: FILELIST: added "/usr/share/locale/lt/LC_MESSAGES/iso_639_5.mo /usr/share/locale/lt/LC_MESSAGES/iso_639-5.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-nb-no: FILELIST: added "/usr/share/locale/nb_NO/LC_MESSAGES/iso_3166-1.mo /usr/share/locale/nb_NO/LC_MESSAGES/iso_3166-3.mo /usr/share/locale/nb_NO/LC_MESSAGES/iso_639_3.mo /usr/share/locale/nb_NO/LC_MESSAGES/iso_639-2.mo /usr/share/locale/nb_NO/LC_MESSAGES/iso_639.mo /usr/share/locale/nb_NO/LC_MESSAGES/iso_4217.mo /usr/share/locale/nb_NO/LC_MESSAGES/iso_639-3.mo /usr/share/locale/nb_NO/LC_MESSAGES/iso_3166.mo /usr/share/locale/nb_NO/LC_MESSAGES/iso_15924.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-nb-no: PKGSIZE changed from 2556 to 54247 (+2022%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ro-md: FILELIST: added "/usr/share/locale/ro_MD/LC_MESSAGES/iso_3166.mo /usr/share/locale/ro_MD/LC_MESSAGES/iso_3166-1.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-ro-md: PKGSIZE changed from 681 to 2473 (+263%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ro: FILELIST: added "/usr/share/locale/ro/LC_MESSAGES/iso_639_5.mo /usr/share/locale/ro/LC_MESSAGES/iso_639-5.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-ro: PKGSIZE changed from 102871 to 322751 (+214%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ta: FILELIST: added "/usr/share/locale/ta/LC_MESSAGES/iso_3166-2.mo /usr/share/locale/ta/LC_MESSAGES/iso_3166_2.mo /usr/share/locale/ta/LC_MESSAGES/iso_4217.mo /usr/share/locale/ta/LC_MESSAGES/iso_15924.mo /usr/share/locale/ta/LC_MESSAGES/iso_639_5.mo /usr/share/locale/ta/LC_MESSAGES/iso_639-5.mo"
packages/all-poky-linux/iso-codes: PACKAGES: removed "iso-codes-locale-mo iso-codes-locale-nb"

--===============5902781178279699554==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-iso-codes-upgrade-4.15.0-4.16.0.patch"

RnJvbSBkYmI2ZmJjMTU2ZDFmNzU1MjZlMDM5ZDQxMWUwOGYzY2UyNTE3ZmRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSmFuIDIwMjQgMTY6NTk6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBp
c28tY29kZXM6IHVwZ3JhZGUgNC4xNS4wIC0+IDQuMTYuMAoKLS0tCiAuLi4vaXNvLWNvZGVzL3tp
c28tY29kZXNfNC4xNS4wLmJiID0+IGlzby1jb2Rlc180LjE2LjAuYmJ9ICAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtc3VwcG9ydC9pc28tY29kZXMve2lzby1jb2Rlc180LjE1LjAuYmIgPT4gaXNvLWNv
ZGVzXzQuMTYuMC5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9p
c28tY29kZXMvaXNvLWNvZGVzXzQuMTUuMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2lzby1j
b2Rlcy9pc28tY29kZXNfNC4xNi4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2lzby1jb2Rlcy9pc28tY29kZXNfNC4xNS4wLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9pc28tY29kZXMvaXNvLWNvZGVzXzQuMTYuMC5iYgpp
bmRleCA2YWU2ZmRmOGNiLi5mMzNjY2UxYTlkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9pc28tY29kZXMvaXNvLWNvZGVzXzQuMTUuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9pc28tY29kZXMvaXNvLWNvZGVzXzQuMTYuMC5iYgpAQCAtOSw3ICs5LDcgQEAgTElDRU5T
RSA9ICJMR1BMLTIuMS1vbmx5IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORztt
ZDU9NGZiZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUxNmMiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8v
c2Fsc2EuZGViaWFuLm9yZy9pc28tY29kZXMtdGVhbS9pc28tY29kZXMuZ2l0O3Byb3RvY29sPWh0
dHBzO2JyYW5jaD1tYWluOyIKLVNSQ1JFViA9ICI2OWJhMTZkYWVmM2M1YzVlM2MxOGYyZDkxOWUy
NTI5NmE0Yjk0NmJlIgorU1JDUkVWID0gImMyZmNhYWRjODMyZWQ5Zjg1ODk1MGE0Mzk5NDk3MzQ0
MmQ4NWVmNGYiCiAKICMgaW5oZXJpdCBnZXR0ZXh0IGNhbm5vdCBiZSB1c2VkLCBiZWNhdXNlIGl0
IGFkZHMgZ2V0dGV4dC1uYXRpdmUgdG8gQkFTRURFUEVORFMgd2hpY2gKICMgYXJlIGluaGliaXRl
ZCBieSBhbGxhcmNoCi0tIAoyLjQyLjAKCg==

--===============5902781178279699554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/iso-codes/iso-codes-dbg: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-dbg: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-dev: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-dev: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-doc: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-doc: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ab: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ab: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ace: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ace: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ach: PKGSIZE changed from 9101 to 9157 (+1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ach: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ach: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-af: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-af: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ak: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ak: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-am: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-am: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-an: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-an: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ar: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ar: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-as: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-as: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ast: PKGSIZE changed from 360952 to 364609 (+1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ast: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ast: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ay: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ay: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-az: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-az: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ba: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ba: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bar: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bar: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-be: PKGSIZE changed from 316015 to 309384 (-2%)
packages/all-poky-linux/iso-codes/iso-codes-locale-be: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-be: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bg: PKGSIZE changed from 89119 to 90031 (+1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-bg: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bg: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bi: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bi: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-bd: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-bd: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-in: PKGSIZE changed from 39817 to 40119 (+1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-in: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-in: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bn: PKGSIZE changed from 177101 to 181584 (+3%)
packages/all-poky-linux/iso-codes/iso-codes-locale-bn: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bn: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-br: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-br: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bs: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bs: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-byn: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-byn: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ca: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ca: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ce: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ce: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ch: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ch: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-chr: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-chr: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ckb: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ckb: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-crh: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-crh: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-cs: PKGSIZE changed from 94308 to 97908 (+4%)
packages/all-poky-linux/iso-codes/iso-codes-locale-cs: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-cs: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-csb: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-csb: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-cv: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-cv: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-cy: PKGSIZE changed from 99148 to 99533 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-cy: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-cy: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-da: PKGSIZE changed from 224055 to 226193 (+1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-da: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-da: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-de: PKGSIZE changed from 693125 to 685942 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-de: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-de: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-dv: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-dv: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-dz: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-dz: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ee: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ee: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-el: PKGSIZE changed from 123242 to 123682 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-el: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-el: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-en: PKGSIZE changed from 91240 to 90781 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-en: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-en: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-eo: PKGSIZE changed from 166469 to 167062 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-eo: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-eo: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-es: PKGSIZE changed from 118198 to 119403 (+1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-es: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-es: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-et: PKGSIZE changed from 110292 to 119170 (+8%)
packages/all-poky-linux/iso-codes/iso-codes-locale-et: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-et: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-eu: PKGSIZE changed from 104421 to 104394 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-eu: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-eu: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fa: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fa: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ff: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ff: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fi: PKGSIZE changed from 81132 to 81143 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-fi: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fi: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fil: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fil: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fo: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fo: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fr: PKGSIZE changed from 650891 to 658048 (+1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-fr: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fr: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-frp: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-frp: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fur: PKGSIZE changed from 55564 to 57420 (+3%)
packages/all-poky-linux/iso-codes/iso-codes-locale-fur: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fur: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fy: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fy: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ga: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ga: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gez: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gez: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gl: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gl: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gn: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gn: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gu: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gu: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gv: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gv: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ha: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ha: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-haw: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-haw: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-he: PKGSIZE changed from 81194 to 90579 (+12%)
packages/all-poky-linux/iso-codes/iso-codes-locale-he: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-he: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hi: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hi: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hr: PKGSIZE changed from 149022 to 148792 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-hr: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hr: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ht: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ht: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hu: PKGSIZE changed from 183373 to 184137 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-hu: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hu: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hy: PKGSIZE changed from 34054 to 63315 (+86%)
packages/all-poky-linux/iso-codes/iso-codes-locale-hy: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hy: FILELIST: added "/usr/share/locale/hy/LC_MESSAGES/iso_639.mo /usr/share/locale/hy/LC_MESSAGES/iso_639-2.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-hy: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ia: PKGSIZE changed from 34114 to 34123 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ia: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ia: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-id: PKGSIZE changed from 532883 to 527478 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-id: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-id: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-io: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-io: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-is: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-is: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-it: PKGSIZE changed from 607938 to 602379 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-it: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-it: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-iu: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-iu: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ja: PKGSIZE changed from 182503 to 181848 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ja: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ja: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-jam: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-jam: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ka: PKGSIZE changed from 194747 to 199113 (+2%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ka: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ka: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kab: PKGSIZE changed from 17662 to 18189 (+3%)
packages/all-poky-linux/iso-codes/iso-codes-locale-kab: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kab: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ki: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ki: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kk: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kk: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kl: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kl: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-km: PKGSIZE changed from 39888 to 46145 (+16%)
packages/all-poky-linux/iso-codes/iso-codes-locale-km: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-km: FILELIST: added "/usr/share/locale/km/LC_MESSAGES/iso_3166-2.mo /usr/share/locale/km/LC_MESSAGES/iso_4217.mo /usr/share/locale/km/LC_MESSAGES/iso_3166_2.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-km: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kmr: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kmr: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kn: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kn: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ko: PKGSIZE changed from 85254 to 87810 (+3%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ko: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ko: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kok: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kok: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kv: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kv: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kw: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kw: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ky: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ky: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-lo: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-lo: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-lt: PKGSIZE changed from 170068 to 185532 (+9%)
packages/all-poky-linux/iso-codes/iso-codes-locale-lt: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-lt: FILELIST: added "/usr/share/locale/lt/LC_MESSAGES/iso_639_5.mo /usr/share/locale/lt/LC_MESSAGES/iso_639-5.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-lt: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-lv: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-lv: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mai: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mai: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mhr: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mhr: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mi: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mi: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mk: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mk: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ml: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ml: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mn: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mn: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mr: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mr: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ms: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ms: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mt: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mt: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-my: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-my: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-na: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-na: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nah: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nah: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nb-no: PKGSIZE changed from 2556 to 54247 (+2022%)
packages/all-poky-linux/iso-codes/iso-codes-locale-nb-no: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nb-no: FILELIST: added "/usr/share/locale/nb_NO/LC_MESSAGES/iso_639.mo /usr/share/locale/nb_NO/LC_MESSAGES/iso_3166-1.mo /usr/share/locale/nb_NO/LC_MESSAGES/iso_3166-3.mo /usr/share/locale/nb_NO/LC_MESSAGES/iso_639_3.mo /usr/share/locale/nb_NO/LC_MESSAGES/iso_4217.mo /usr/share/locale/nb_NO/LC_MESSAGES/iso_639-2.mo /usr/share/locale/nb_NO/LC_MESSAGES/iso_15924.mo /usr/share/locale/nb_NO/LC_MESSAGES/iso_639-3.mo /usr/share/locale/nb_NO/LC_MESSAGES/iso_3166.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-nb-no: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ne: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ne: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nl: PKGSIZE changed from 378006 to 379512 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-nl: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nl: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nn: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nn: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nso: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nso: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nv: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nv: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-oc: PKGSIZE changed from 43975 to 43947 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-oc: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-oc: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-or: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-or: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pa-pk: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pa-pk: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pa: PKGSIZE changed from 475892 to 476542 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-pa: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pa: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pap: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pap: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pi: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pi: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pl: PKGSIZE changed from 388605 to 403900 (+4%)
packages/all-poky-linux/iso-codes/iso-codes-locale-pl: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pl: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ps: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ps: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pt-br: PKGSIZE changed from 95868 to 96014 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-pt-br: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pt-br: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pt: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pt: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ro-md: PKGSIZE changed from 681 to 2473 (+263%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ro-md: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ro-md: FILELIST: added "/usr/share/locale/ro_MD/LC_MESSAGES/iso_3166.mo /usr/share/locale/ro_MD/LC_MESSAGES/iso_3166-1.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-ro-md: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ro: PKGSIZE changed from 102871 to 322751 (+214%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ro: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ro: FILELIST: added "/usr/share/locale/ro/LC_MESSAGES/iso_639_5.mo /usr/share/locale/ro/LC_MESSAGES/iso_639-5.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-ro: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ru: PKGSIZE changed from 226909 to 220699 (-3%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ru: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ru: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-rw: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-rw: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sc: PKGSIZE changed from 203610 to 198279 (-3%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sc: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sc: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sd: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sd: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-si: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-si: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sk: PKGSIZE changed from 81937 to 83028 (+1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sk: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sk: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sl: PKGSIZE changed from 156835 to 156437 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sl: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sl: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-so: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-so: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-son: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-son: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sq: PKGSIZE changed from 52835 to 56274 (+7%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sq: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sq: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sr+latin: PKGSIZE changed from 208622 to 209589 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sr+latin: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sr+latin: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sr: PKGSIZE changed from 250906 to 252163 (+1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sr: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sr: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sv: PKGSIZE changed from 639609 to 634272 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sv: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sv: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sw: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sw: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ta: PKGSIZE changed from 507609 to 555373 (+9%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ta: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ta: FILELIST: added "/usr/share/locale/ta/LC_MESSAGES/iso_4217.mo /usr/share/locale/ta/LC_MESSAGES/iso_15924.mo /usr/share/locale/ta/LC_MESSAGES/iso_639-5.mo /usr/share/locale/ta/LC_MESSAGES/iso_3166-2.mo /usr/share/locale/ta/LC_MESSAGES/iso_639_5.mo /usr/share/locale/ta/LC_MESSAGES/iso_3166_2.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-ta: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-te: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-te: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tg: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tg: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-th: PKGSIZE changed from 214856 to 213964 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-th: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-th: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ti: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ti: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tig: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tig: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tk: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tk: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tl: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tl: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tr: PKGSIZE changed from 498536 to 497947 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-tr: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tr: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tt+iqtelif: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tt+iqtelif: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tt: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tt: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tzm: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tzm: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ug: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ug: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-uk: PKGSIZE changed from 873721 to 864464 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-uk: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-uk: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ur: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ur: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-uz: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-uz: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ve: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ve: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-vi: PKGSIZE changed from 222943 to 222409 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-vi: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-vi: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-wa: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-wa: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-wal: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-wal: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-wo: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-wo: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-xh: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-xh: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-yo: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-yo: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-cn: PKGSIZE changed from 198605 to 198069 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-cn: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-cn: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hans: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hans: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hant: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hant: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hk: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hk: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-tw: PKGSIZE changed from 121665 to 121592 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-tw: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-tw: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zu: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zu: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-src: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-src: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-staticdev: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes-staticdev: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes/iso-codes: PKGSIZE changed from 3012718 to 3009238 (-0%)
packages/all-poky-linux/iso-codes/iso-codes: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes/iso-codes: PKGV changed from 4.15.0 [default] to 4.16.0 [default]
packages/all-poky-linux/iso-codes: PACKAGES: removed "iso-codes-locale-mo iso-codes-locale-nb"
packages/all-poky-linux/iso-codes: PV changed from "4.15.0" to "4.16.0"
packages/all-poky-linux/iso-codes: PKGV changed from 4.15.0 [default] to 4.16.0 [default]

--===============5902781178279699554==--

