Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C42B5CEDD97
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:17 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12121.1763224723505291008
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:39:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=eRxw6qz4;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=X6MEWkfE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019a88629439-fe341bbb-c85e-4eb7-99e0-5eccaadc27d5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224753;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Cmz0hy9CKIio2JV7n0N9AoDsajj5UoYKJ0GKn/zhUEA=;
	b=eRxw6qz4Aclks1k/Qrac08eo9rbiFqy+OHbSgz1Kiqb7kGt2ypryMIUGez3aVR+A
	UMIZhCeGJAOk5oHLiZqCT/tyXA6MoIMg/T6SX+YpDOcQX5+QcIADm/4iqpealhVRakJ
	/HBWqHPWir1vGF1zxhivr1V8bsZcKsoLIb7NLOS4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224753;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Cmz0hy9CKIio2JV7n0N9AoDsajj5UoYKJ0GKn/zhUEA=;
	b=X6MEWkfEDNQ+7jYPPKeuqK+eWIYurGfCGn5guVSZPej5P5jmYCPSr+v+rVsDlrPa
	d7a+npEAcJ5yKowVgU9FCAurAPG5yTdFl2IA6gS7iIpXi/a0k7ct4T9+9HDea/yfiT0
	xHxhyrCrjJ1ekqPR3UZH/y2FFWsUC0q2R34AuQo4=
Content-Type: multipart/mixed; boundary="===============8274752142461392078=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iso-codes: upgrading to 4.19.0 SUCCEEDED
Message-ID: <0101019a88629439-fe341bbb-c85e-4eb7-99e0-5eccaadc27d5-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:39:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226451

--===============8274752142461392078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *iso-codes* to *4.19.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-iso-codes-upgrade-4.18.0-4.19.0.patch
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
From 4dfb606ac4b55a64079d544eeb87716b87d2f0dd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 15:58:05 +0000
Subject: [PATCH] iso-codes: upgrade 4.18.0 -> 4.19.0

---
 .../iso-codes/{iso-codes_4.18.0.bb => iso-codes_4.19.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/iso-codes/{iso-codes_4.18.0.bb => iso-codes_4.19.0.bb} (94%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.18.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.19.0.bb
similarity index 94%
rename from meta/recipes-support/iso-codes/iso-codes_4.18.0.bb
rename to meta/recipes-support/iso-codes/iso-codes_4.19.0.bb
index 1ee9f5a8f5..413c7991d6 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.18.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.19.0.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21"
 
 SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "5be4d112d420706eacd913a3ebd85549fe9eeae4"
+SRCREV = "0f3a862394265a31d8465fc5e627d6429bbd8394"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.47.1


--===============8274752142461392078==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-iso-codes-upgrade-4.18.0-4.19.0.patch"

RnJvbSA0ZGZiNjA2YWM0YjU1YTY0MDc5ZDU0NGVlYjg3NzE2Yjg3ZDJmMGRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTU6NTg6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBp
c28tY29kZXM6IHVwZ3JhZGUgNC4xOC4wIC0+IDQuMTkuMAoKLS0tCiAuLi4vaXNvLWNvZGVzL3tp
c28tY29kZXNfNC4xOC4wLmJiID0+IGlzby1jb2Rlc180LjE5LjAuYmJ9ICAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtc3VwcG9ydC9pc28tY29kZXMve2lzby1jb2Rlc180LjE4LjAuYmIgPT4gaXNvLWNv
ZGVzXzQuMTkuMC5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9p
c28tY29kZXMvaXNvLWNvZGVzXzQuMTguMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2lzby1j
b2Rlcy9pc28tY29kZXNfNC4xOS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2lzby1jb2Rlcy9pc28tY29kZXNfNC4xOC4wLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9pc28tY29kZXMvaXNvLWNvZGVzXzQuMTkuMC5iYgpp
bmRleCAxZWU5ZjVhOGY1Li40MTNjNzk5MWQ2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9pc28tY29kZXMvaXNvLWNvZGVzXzQuMTguMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9pc28tY29kZXMvaXNvLWNvZGVzXzQuMTkuMC5iYgpAQCAtOSw3ICs5LDcgQEAgTElDRU5T
RSA9ICJMR1BMLTIuMS1vbmx5IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORztt
ZDU9NGJmNjYxYzFlMzc5M2U1NWM4ZDEwNTFiYzVlMGFlMjEiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8v
c2Fsc2EuZGViaWFuLm9yZy9pc28tY29kZXMtdGVhbS9pc28tY29kZXMuZ2l0O3Byb3RvY29sPWh0
dHBzO2JyYW5jaD1tYWluO3RhZz12JHtQVn0iCi1TUkNSRVYgPSAiNWJlNGQxMTJkNDIwNzA2ZWFj
ZDkxM2EzZWJkODU1NDlmZTllZWFlNCIKK1NSQ1JFViA9ICIwZjNhODYyMzk0MjY1YTMxZDg0NjVm
YzVlNjI3ZDY0MjliYmQ4Mzk0IgogCiAjIGluaGVyaXQgZ2V0dGV4dCBjYW5ub3QgYmUgdXNlZCwg
YmVjYXVzZSBpdCBhZGRzIGdldHRleHQtbmF0aXZlIHRvIEJBU0VERVBFTkRTIHdoaWNoCiAjIGFy
ZSBpbmhpYml0ZWQgYnkgYWxsYXJjaAotLSAKMi40Ny4xCgo=

--===============8274752142461392078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/iso-codes/iso-codes-dbg: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-dbg: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-dev: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-dev: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-doc: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-doc: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ab: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ab: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ace: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ace: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ach: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ach: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-af: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-af: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-af: PKGSIZE changed from 35671 to 35598 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ak: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ak: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-am: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-am: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-an: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-an: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ar: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ar: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ar: PKGSIZE changed from 62883 to 62177 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-as: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-as: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-as: PKGSIZE changed from 73123 to 71907 (-2%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ast: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ast: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ast: PKGSIZE changed from 364609 to 363473 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ay: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ay: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-az: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-az: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ba: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ba: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ba: FILELIST: added "/usr/share/locale/ba/LC_MESSAGES/iso_639.mo /usr/share/locale/ba/LC_MESSAGES/iso_3166_2.mo /usr/share/locale/ba/LC_MESSAGES/iso_4217.mo /usr/share/locale/ba/LC_MESSAGES/iso_639-3.mo /usr/share/locale/ba/LC_MESSAGES/iso_639_5.mo /usr/share/locale/ba/LC_MESSAGES/iso_3166-3.mo /usr/share/locale/ba/LC_MESSAGES/iso_639-5.mo /usr/share/locale/ba/LC_MESSAGES/iso_3166-2.mo /usr/share/locale/ba/LC_MESSAGES/iso_639-2.mo /usr/share/locale/ba/LC_MESSAGES/iso_15924.mo /usr/share/locale/ba/LC_MESSAGES/iso_639_3.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-ba: PKGSIZE changed from 539 to 828047 (+153527%)
packages/all-poky-linux/iso-codes/iso-codes-locale-bar: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bar: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bar: PKGSIZE changed from 6877 to 7179 (+4%)
packages/all-poky-linux/iso-codes/iso-codes-locale-be: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-be: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-be: PKGSIZE changed from 309384 to 307241 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-bg: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bg: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bg: PKGSIZE changed from 91222 to 93302 (+2%)
packages/all-poky-linux/iso-codes/iso-codes-locale-bi: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bi: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-bd: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-bd: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-bd: PKGSIZE changed from 21006 to 20568 (-2%)
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-in: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-in: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bn: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bn: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bn: PKGSIZE changed from 181584 to 179349 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-br: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-br: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-br: FILELIST: added "/usr/share/locale/br/LC_MESSAGES/iso_3166-2.mo /usr/share/locale/br/LC_MESSAGES/iso_3166_2.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-br: PKGSIZE changed from 67063 to 81360 (+21%)
packages/all-poky-linux/iso-codes/iso-codes-locale-bs: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bs: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-byn: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-byn: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ca: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ca: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ca: PKGSIZE changed from 93552 to 120156 (+28%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ce: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ce: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ch: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ch: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-chr: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-chr: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ckb: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ckb: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-crh: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-crh: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-crh: PKGSIZE changed from 304507 to 303353 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-cs: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-cs: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-cs: PKGSIZE changed from 97908 to 96547 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-csb: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-csb: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-cv: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-cv: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-cv: PKGSIZE changed from 37697 to 37438 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-cy: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-cy: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-cy: PKGSIZE changed from 99533 to 99241 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-da: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-da: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-da: PKGSIZE changed from 226193 to 224552 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-de: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-de: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-de: PKGSIZE changed from 685942 to 679982 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-dv: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-dv: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-dz: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-dz: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ee: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ee: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-el: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-el: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-el: PKGSIZE changed from 123682 to 123069 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-en: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-en: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-en: PKGSIZE changed from 90781 to 90829 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-eo: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-eo: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-eo: PKGSIZE changed from 167062 to 163524 (-2%)
packages/all-poky-linux/iso-codes/iso-codes-locale-es: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-es: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-es: PKGSIZE changed from 119714 to 118576 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-et: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-et: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-et: PKGSIZE changed from 119429 to 119354 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-eu: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-eu: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-eu: PKGSIZE changed from 104394 to 103292 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-fa: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fa: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fa: PKGSIZE changed from 60712 to 60577 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ff: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ff: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fi: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fi: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fi: PKGSIZE changed from 81143 to 81075 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-fil: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fil: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fil: PKGSIZE changed from 37390 to 37084 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-fo: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fo: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fr: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fr: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fr: PKGSIZE changed from 658048 to 655082 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-frp: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-frp: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fur: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fur: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fur: PKGSIZE changed from 57420 to 57875 (+1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-fy: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fy: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ga: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ga: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ga: PKGSIZE changed from 697077 to 690737 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-gez: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gez: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gl: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gl: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gl: PKGSIZE changed from 366633 to 364652 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-gn: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gn: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gu: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gu: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gu: PKGSIZE changed from 115686 to 114304 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-gv: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gv: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ha: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ha: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-haw: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-haw: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-he: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-he: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-he: PKGSIZE changed from 90921 to 90529 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-hi: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hi: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hi: PKGSIZE changed from 991188 to 975760 (-2%)
packages/all-poky-linux/iso-codes/iso-codes-locale-hr: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hr: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hr: PKGSIZE changed from 149019 to 147760 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ht: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ht: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hu: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hu: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hu: PKGSIZE changed from 705506 to 695624 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-hy: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hy: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hy: PKGSIZE changed from 64911 to 64319 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ia: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ia: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ia: PKGSIZE changed from 34123 to 33948 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-id: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-id: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-id: PKGSIZE changed from 532028 to 532841 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-io: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-io: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-is: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-is: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-is: PKGSIZE changed from 236096 to 235527 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-it: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-it: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-it: PKGSIZE changed from 602577 to 598306 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-iu: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-iu: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ja: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ja: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ja: PKGSIZE changed from 182209 to 181775 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-jam: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-jam: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-jam: PKGSIZE changed from 8334 to 9133 (+10%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ka: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ka: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ka: PKGSIZE changed from 199113 to 204205 (+3%)
packages/all-poky-linux/iso-codes/iso-codes-locale-kab: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kab: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kab: FILELIST: added "/usr/share/locale/kab/LC_MESSAGES/iso_3166-3.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-kab: PKGSIZE changed from 18731 to 23144 (+24%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ki: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ki: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kk: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kk: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kl: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kl: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-km: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-km: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-km: PKGSIZE changed from 46145 to 45976 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-kmr: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kmr: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kn: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kn: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kn: PKGSIZE changed from 452876 to 450493 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ko: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ko: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ko: PKGSIZE changed from 87810 to 86213 (-2%)
packages/all-poky-linux/iso-codes/iso-codes-locale-kok: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kok: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kv: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kv: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kw: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kw: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ky: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ky: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-lo: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-lo: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-lt: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-lt: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-lt: PKGSIZE changed from 185603 to 184270 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-lv: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-lv: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-lv: PKGSIZE changed from 77306 to 76649 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-mai: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mai: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mhr: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mhr: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mi: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mi: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mk: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mk: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ml: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ml: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ml: PKGSIZE changed from 74723 to 73750 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-mn: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mn: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mn: PKGSIZE changed from 28320 to 28258 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-mr: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mr: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mr: PKGSIZE changed from 496426 to 493528 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ms: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ms: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mt: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mt: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mt: PKGSIZE changed from 29398 to 29338 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-my: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-my: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-na: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-na: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nah: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nah: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nb-no: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nb-no: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nb-no: PKGSIZE changed from 54703 to 54261 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ne: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ne: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nl: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nl: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nl: PKGSIZE changed from 379512 to 372461 (-2%)
packages/all-poky-linux/iso-codes/iso-codes-locale-nn: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nn: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nn: PKGSIZE changed from 52923 to 52699 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-nso: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nso: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nv: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nv: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-oc: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-oc: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-oc: PKGSIZE changed from 44208 to 46796 (+6%)
packages/all-poky-linux/iso-codes/iso-codes-locale-or: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-or: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-or: PKGSIZE changed from 288278 to 286308 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-pa-pk: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pa-pk: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pa-pk: PKGSIZE changed from 17929 to 17771 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-pa: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pa: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pa: PKGSIZE changed from 476542 to 473711 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-pap: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pap: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pi: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pi: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pl: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pl: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pl: PKGSIZE changed from 416644 to 407723 (-2%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ps: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ps: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pt-br: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pt-br: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pt-br: PKGSIZE changed from 96014 to 94696 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-pt: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pt: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pt: FILELIST: added "/usr/share/locale/pt/LC_MESSAGES/iso_3166-2.mo /usr/share/locale/pt/LC_MESSAGES/iso_3166_2.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-pt: PKGSIZE changed from 87122 to 86260 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ro-md: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ro-md: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ro-md: PKGSIZE changed from 2465 to 2692 (+9%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ro: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ro: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ro: PKGSIZE changed from 319449 to 351354 (+10%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ru: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ru: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ru: PKGSIZE changed from 234105 to 225486 (-4%)
packages/all-poky-linux/iso-codes/iso-codes-locale-rw: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-rw: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-rw: PKGSIZE changed from 57632 to 57487 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sc: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sc: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sc: PKGSIZE changed from 198279 to 196562 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sd: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sd: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sd: PKGSIZE changed from 3798 to 3777 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-si: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-si: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sk: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sk: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sk: PKGSIZE changed from 84008 to 86577 (+3%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sl: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sl: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sl: PKGSIZE changed from 156654 to 155891 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-so: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-so: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-so: PKGSIZE changed from 9402 to 9363 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-son: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-son: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sq: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sq: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sq: PKGSIZE changed from 56465 to 56118 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sr+latin: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sr+latin: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sr+latin: PKGSIZE changed from 209589 to 208116 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sr: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sr: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sr: PKGSIZE changed from 252163 to 250332 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sv: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sv: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sv: PKGSIZE changed from 634272 to 631569 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sw: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sw: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ta: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ta: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ta: PKGSIZE changed from 1026293 to 1010316 (-2%)
packages/all-poky-linux/iso-codes/iso-codes-locale-te: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-te: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-te: PKGSIZE changed from 71624 to 70819 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-tg: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tg: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tg: PKGSIZE changed from 33996 to 34120 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-th: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-th: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-th: PKGSIZE changed from 229165 to 228304 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ti: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ti: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tig: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tig: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tk: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tk: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tl: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tl: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tr: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tr: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tr: PKGSIZE changed from 497947 to 495070 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-tt+iqtelif: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tt+iqtelif: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tt: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tt: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tzm: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tzm: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tzm: PKGSIZE changed from 2436 to 2401 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ug: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ug: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ug: FILELIST: added "/usr/share/locale/ug/LC_MESSAGES/iso_639.mo /usr/share/locale/ug/LC_MESSAGES/iso_3166_2.mo /usr/share/locale/ug/LC_MESSAGES/iso_4217.mo /usr/share/locale/ug/LC_MESSAGES/iso_639-3.mo /usr/share/locale/ug/LC_MESSAGES/iso_639_5.mo /usr/share/locale/ug/LC_MESSAGES/iso_639-5.mo /usr/share/locale/ug/LC_MESSAGES/iso_3166-2.mo /usr/share/locale/ug/LC_MESSAGES/iso_639-2.mo /usr/share/locale/ug/LC_MESSAGES/iso_15924.mo /usr/share/locale/ug/LC_MESSAGES/iso_639_3.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-ug: PKGSIZE changed from 33292 to 95759 (+188%)
packages/all-poky-linux/iso-codes/iso-codes-locale-uk: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-uk: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-uk: PKGSIZE changed from 869036 to 872703 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ur: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ur: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-uz: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-uz: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ve: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ve: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-vi: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-vi: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-vi: PKGSIZE changed from 222409 to 221525 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-wa: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-wa: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-wa: PKGSIZE changed from 63193 to 62748 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-wal: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-wal: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-wo: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-wo: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-xh: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-xh: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-yo: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-yo: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-cn: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-cn: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-cn: PKGSIZE changed from 278408 to 276580 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hk: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hk: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hk: PKGSIZE changed from 64060 to 62944 (-2%)
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-tw: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-tw: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-tw: PKGSIZE changed from 129028 to 127755 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-zu: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zu: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-src: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-src: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes-staticdev: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-staticdev: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes/iso-codes: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes/iso-codes: PKGSIZE changed from 3008762 to 3019416 (+0%)
packages/all-poky-linux/iso-codes: PKGV changed from 4.18.0 [default] to 4.19.0 [default]
packages/all-poky-linux/iso-codes: PV changed from "4.18.0" to "4.19.0"
packages/all-poky-linux/iso-codes: SRC_URI changed from "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=https;branch=main;tag=v4.18.0" to "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=https;branch=main;tag=v4.19.0"
packages/all-poky-linux/iso-codes: PACKAGES: added "iso-codes-locale-ota"

--===============8274752142461392078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/iso-codes/iso-codes-locale-ba: FILELIST: added "/usr/share/locale/ba/LC_MESSAGES/iso_3166-3.mo /usr/share/locale/ba/LC_MESSAGES/iso_15924.mo /usr/share/locale/ba/LC_MESSAGES/iso_4217.mo /usr/share/locale/ba/LC_MESSAGES/iso_639.mo /usr/share/locale/ba/LC_MESSAGES/iso_639_3.mo /usr/share/locale/ba/LC_MESSAGES/iso_639-3.mo /usr/share/locale/ba/LC_MESSAGES/iso_639-5.mo /usr/share/locale/ba/LC_MESSAGES/iso_639_5.mo /usr/share/locale/ba/LC_MESSAGES/iso_639-2.mo /usr/share/locale/ba/LC_MESSAGES/iso_3166_2.mo /usr/share/locale/ba/LC_MESSAGES/iso_3166-2.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-ba: PKGSIZE changed from 539 to 828047 (+153527%)
packages/all-poky-linux/iso-codes/iso-codes-locale-br: FILELIST: added "/usr/share/locale/br/LC_MESSAGES/iso_3166_2.mo /usr/share/locale/br/LC_MESSAGES/iso_3166-2.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-br: PKGSIZE changed from 67063 to 81360 (+21%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ca: PKGSIZE changed from 93552 to 120156 (+28%)
packages/all-poky-linux/iso-codes/iso-codes-locale-kab: FILELIST: added "/usr/share/locale/kab/LC_MESSAGES/iso_3166-3.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-kab: PKGSIZE changed from 18731 to 23144 (+24%)
packages/all-poky-linux/iso-codes/iso-codes-locale-pt: FILELIST: added "/usr/share/locale/pt/LC_MESSAGES/iso_3166_2.mo /usr/share/locale/pt/LC_MESSAGES/iso_3166-2.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-ug: FILELIST: added "/usr/share/locale/ug/LC_MESSAGES/iso_15924.mo /usr/share/locale/ug/LC_MESSAGES/iso_639.mo /usr/share/locale/ug/LC_MESSAGES/iso_639_3.mo /usr/share/locale/ug/LC_MESSAGES/iso_639-5.mo /usr/share/locale/ug/LC_MESSAGES/iso_3166_2.mo /usr/share/locale/ug/LC_MESSAGES/iso_639_5.mo /usr/share/locale/ug/LC_MESSAGES/iso_639-3.mo /usr/share/locale/ug/LC_MESSAGES/iso_639-2.mo /usr/share/locale/ug/LC_MESSAGES/iso_4217.mo /usr/share/locale/ug/LC_MESSAGES/iso_3166-2.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-ug: PKGSIZE changed from 33292 to 95759 (+188%)
packages/all-poky-linux/iso-codes: PACKAGES: added "iso-codes-locale-ota"

--===============8274752142461392078==--

