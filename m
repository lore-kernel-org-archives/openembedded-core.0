Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEFFFC636F9
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 13:05:45 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web09.5198.1668517536655909183
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 05:05:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=d5NzRX8q;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101847b6524af-a2dc4e0c-98ad-4160-b39f-ad6127b7e195-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1668517537;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yRylICQqmqrbpZN/g49bGUrLXIDUKaeeQLydxrHaREU=;
	b=d5NzRX8qMzGTElmA/ES5wWJJ/mwql0v9n+qeUI/QJ0l4IqClLsAuGYUuGrCWQHX3
	6hX1TTmI4RA32fg0tJCHsLzHGeC12EnHeLBBqSgzamHaCyUNAbz2qVODMLM2EitLa+U
	aYs6u38Estw8yVDSyFtybqKgubqXdgglOQ+k5Y7g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1668517537;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yRylICQqmqrbpZN/g49bGUrLXIDUKaeeQLydxrHaREU=;
	b=hEYAwZ4kYJsgist133TQeuU+P1WgeChdV2+xNyg4Zh0kOL35m1vDtYa9wyRvsApB
	p0TeQrTqxe9NVcwonLs6Cw4pCmSZYMphpiaRr85vY3/l74uNXJD2yas1FE0tgFQq1MD
	mKbj37GD16qV2CAUj4Jus6Ul+Is4OwppvkJihXk8=
Content-Type: multipart/mixed; boundary="===============2401304040456938818=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@cn.ujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iso-codes: upgrading to 4.12.0 SUCCEEDED
Message-ID: <010101847b6524af-a2dc4e0c-98ad-4160-b39f-ad6127b7e195-000000@us-west-2.amazonses.com>
Date: Tue, 15 Nov 2022 13:05:37 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 13:05:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173340

--===============2401304040456938818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *iso-codes* to *4.12.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-iso-codes-upgrade-4.11.0-4.12.0.patch
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
--===============2401304040456938818==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-iso-codes-upgrade-4.11.0-4.12.0.patch"

RnJvbSBhMzcyMGQzZGEwNGEwNDQ5OWIzODdlZmNlNmNlY2E2MThiNzhlNjYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgTm92IDIwMjIgMTI6NDc6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBp
c28tY29kZXM6IHVwZ3JhZGUgNC4xMS4wIC0+IDQuMTIuMAoKLS0tCiAuLi4vaXNvLWNvZGVzL3tp
c28tY29kZXNfNC4xMS4wLmJiID0+IGlzby1jb2Rlc180LjEyLjAuYmJ9ICAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtc3VwcG9ydC9pc28tY29kZXMve2lzby1jb2Rlc180LjExLjAuYmIgPT4gaXNvLWNv
ZGVzXzQuMTIuMC5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9p
c28tY29kZXMvaXNvLWNvZGVzXzQuMTEuMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2lzby1j
b2Rlcy9pc28tY29kZXNfNC4xMi4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2lzby1jb2Rlcy9pc28tY29kZXNfNC4xMS4wLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9pc28tY29kZXMvaXNvLWNvZGVzXzQuMTIuMC5iYgpp
bmRleCBiZTU3Mzk4MWIwLi5lYTdjNDNjZGFlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9pc28tY29kZXMvaXNvLWNvZGVzXzQuMTEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9pc28tY29kZXMvaXNvLWNvZGVzXzQuMTIuMC5iYgpAQCAtOSw3ICs5LDcgQEAgTElDRU5T
RSA9ICJMR1BMLTIuMS1vbmx5IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORztt
ZDU9NGZiZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUxNmMiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8v
c2Fsc2EuZGViaWFuLm9yZy9pc28tY29kZXMtdGVhbS9pc28tY29kZXMuZ2l0O3Byb3RvY29sPWh0
dHBzO2JyYW5jaD1tYWluOyIKLVNSQ1JFViA9ICIyNjUxZDdmZTY1NTgyMjYzYzU3Mzg1YTg1MmIw
YzZkOGE0OWY2OTg1IgorU1JDUkVWID0gIjVlNGRkZGJkMWY4OTAyYWIwMjUyY2NiYjE5Yjc4M2Nj
MDM1OTUwNWEiCiAKICMgaW5oZXJpdCBnZXR0ZXh0IGNhbm5vdCBiZSB1c2VkLCBiZWNhdXNlIGl0
IGFkZHMgZ2V0dGV4dC1uYXRpdmUgdG8gQkFTRURFUEVORFMgd2hpY2gKICMgYXJlIGluaGliaXRl
ZCBieSBhbGxhcmNoCi0tIAoyLjMxLjEKCg==

--===============2401304040456938818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/iso-codes/iso-codes-locale-ka: PKGSIZE changed from 37447 to 193949 (+418%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ka: FILELIST: added "/usr/share/locale/ka/LC_MESSAGES/iso_639-3.mo /usr/share/locale/ka/LC_MESSAGES/iso_15924.mo /usr/share/locale/ka/LC_MESSAGES/iso_639.mo /usr/share/locale/ka/LC_MESSAGES/iso_639_3.mo /usr/share/locale/ka/LC_MESSAGES/iso_3166_2.mo /usr/share/locale/ka/LC_MESSAGES/iso_639-2.mo /usr/share/locale/ka/LC_MESSAGES/iso_4217.mo /usr/share/locale/ka/LC_MESSAGES/iso_3166-2.mo /usr/share/locale/ka/LC_MESSAGES/iso_639_5.mo /usr/share/locale/ka/LC_MESSAGES/iso_639-5.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-tr: FILELIST: added "/usr/share/locale/tr/LC_MESSAGES/iso_639_5.mo /usr/share/locale/tr/LC_MESSAGES/iso_639-5.mo"
packages/all-poky-linux/iso-codes: PACKAGES: added "iso-codes-locale-pa-pk"

--===============2401304040456938818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/iso-codes/iso-codes-dbg: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-dbg: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-dev: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-dev: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-doc: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-doc: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ab: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ab: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ace: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ace: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ach: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ach: PKGSIZE changed from 9137 to 9101 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ach: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-af: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-af: PKGSIZE changed from 35757 to 35671 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-af: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ak: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ak: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-am: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-am: PKGSIZE changed from 18492 to 18459 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-am: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-an: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-an: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ar: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ar: PKGSIZE changed from 63124 to 63023 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ar: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-as: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-as: PKGSIZE changed from 69614 to 69484 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-as: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ast: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ast: PKGSIZE changed from 361177 to 361063 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ast: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ay: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ay: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-az: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-az: PKGSIZE changed from 16583 to 16550 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-az: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ba: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ba: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bar: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bar: PKGSIZE changed from 6907 to 6877 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-bar: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-be: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-be: PKGSIZE changed from 311488 to 315789 (+1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-be: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bg: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bg: PKGSIZE changed from 88971 to 88844 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-bg: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bi: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bi: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-bd: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-bd: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-in: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-in: PKGSIZE changed from 40165 to 40035 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-in: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bn: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bn: PKGSIZE changed from 177473 to 177319 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-bn: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-br: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-br: PKGSIZE changed from 64941 to 64911 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-br: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bs: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bs: PKGSIZE changed from 33084 to 33002 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-bs: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-byn: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-byn: PKGSIZE changed from 17604 to 17547 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-byn: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ca: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ca: PKGSIZE changed from 92136 to 92048 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ca: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ce: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ce: PKGSIZE changed from 10866 to 10832 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ce: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ch: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ch: PKGSIZE changed from 1483 to 1429 (-4%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ch: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-chr: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-chr: PKGSIZE changed from 5189 to 5156 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-chr: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ckb: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ckb: PKGSIZE changed from 10502 to 10442 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ckb: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-crh: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-crh: PKGSIZE changed from 304711 to 304615 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-crh: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-cs: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-cs: PKGSIZE changed from 93433 to 93348 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-cs: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-csb: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-csb: PKGSIZE changed from 4494 to 4461 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-csb: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-cv: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-cv: PKGSIZE changed from 21947 to 21905 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-cv: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-cy: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-cy: PKGSIZE changed from 36668 to 36586 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-cy: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-da: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-da: PKGSIZE changed from 224257 to 224171 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-da: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-de: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-de: PKGSIZE changed from 691316 to 691544 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-de: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-dv: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-dv: PKGSIZE changed from 11342 to 11270 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-dv: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-dz: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-dz: PKGSIZE changed from 45359 to 45217 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-dz: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ee: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ee: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-el: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-el: PKGSIZE changed from 123526 to 123408 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-el: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-en: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-en: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-eo: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-eo: PKGSIZE changed from 166686 to 166579 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-eo: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-es: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-es: PKGSIZE changed from 118324 to 118277 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-es: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-et: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-et: PKGSIZE changed from 110203 to 110208 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-et: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-eu: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-eu: PKGSIZE changed from 104642 to 104532 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-eu: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fa: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fa: PKGSIZE changed from 60931 to 60838 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-fa: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ff: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ff: PKGSIZE changed from 3765 to 3717 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ff: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fi: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fi: PKGSIZE changed from 81322 to 81240 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-fi: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fil: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fil: PKGSIZE changed from 37498 to 37390 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-fil: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fo: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fo: PKGSIZE changed from 6276 to 6243 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-fo: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fr: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fr: PKGSIZE changed from 651120 to 651007 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-fr: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-frp: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-frp: PKGSIZE changed from 9217 to 9186 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-frp: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fur: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fur: PKGSIZE changed from 55676 to 55564 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-fur: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fy: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fy: PKGSIZE changed from 9400 to 9369 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-fy: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ga: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ga: PKGSIZE changed from 56249 to 56163 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ga: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gez: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gez: PKGSIZE changed from 17662 to 17605 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-gez: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gl: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gl: PKGSIZE changed from 366750 to 366660 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-gl: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gn: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gn: PKGSIZE changed from 8995 to 8965 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-gn: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gu: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gu: PKGSIZE changed from 115951 to 115799 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-gu: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gv: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gv: PKGSIZE changed from 9028 to 8995 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-gv: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ha: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ha: PKGSIZE changed from 5180 to 5148 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ha: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-haw: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-haw: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-he: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-he: PKGSIZE changed from 80761 to 80763 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-he: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hi: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hi: PKGSIZE changed from 53604 to 53598 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-hi: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hr: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hr: PKGSIZE changed from 146690 to 149139 (+2%)
packages/all-poky-linux/iso-codes/iso-codes-locale-hr: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ht: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ht: PKGSIZE changed from 7785 to 7757 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ht: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hu: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hu: PKGSIZE changed from 183391 to 183295 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-hu: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hy: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hy: PKGSIZE changed from 34342 to 34219 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-hy: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ia: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ia: PKGSIZE changed from 34311 to 34224 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ia: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-id: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-id: PKGSIZE changed from 532185 to 532082 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-id: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-io: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-io: PKGSIZE changed from 9253 to 9223 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-io: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-is: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-is: PKGSIZE changed from 233363 to 234048 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-is: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-it: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-it: PKGSIZE changed from 605119 to 605031 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-it: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-iu: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-iu: PKGSIZE changed from 1680 to 1647 (-2%)
packages/all-poky-linux/iso-codes/iso-codes-locale-iu: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ja: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ja: PKGSIZE changed from 182705 to 182618 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ja: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-jam: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-jam: PKGSIZE changed from 8363 to 8334 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-jam: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ka: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ka: PKGSIZE changed from 37447 to 193949 (+418%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ka: FILELIST: added "/usr/share/locale/ka/LC_MESSAGES/iso_4217.mo /usr/share/locale/ka/LC_MESSAGES/iso_3166_2.mo /usr/share/locale/ka/LC_MESSAGES/iso_639-2.mo /usr/share/locale/ka/LC_MESSAGES/iso_639_5.mo /usr/share/locale/ka/LC_MESSAGES/iso_15924.mo /usr/share/locale/ka/LC_MESSAGES/iso_639-5.mo /usr/share/locale/ka/LC_MESSAGES/iso_639-3.mo /usr/share/locale/ka/LC_MESSAGES/iso_3166-2.mo /usr/share/locale/ka/LC_MESSAGES/iso_639_3.mo /usr/share/locale/ka/LC_MESSAGES/iso_639.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-ka: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kab: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kab: PKGSIZE changed from 17691 to 17662 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-kab: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ki: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ki: PKGSIZE changed from 5162 to 5132 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ki: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kk: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kk: PKGSIZE changed from 32168 to 32019 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-kk: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kl: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kl: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-km: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-km: PKGSIZE changed from 40207 to 40084 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-km: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kmr: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kmr: PKGSIZE changed from 25643 to 25562 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-kmr: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kn: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kn: PKGSIZE changed from 452988 to 452876 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-kn: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ko: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ko: PKGSIZE changed from 84017 to 83935 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ko: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kok: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kok: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kv: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kv: PKGSIZE changed from 5852 to 5816 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-kv: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kw: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kw: PKGSIZE changed from 9360 to 9323 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-kw: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ky: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ky: PKGSIZE changed from 30644 to 30514 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ky: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-lo: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-lo: PKGSIZE changed from 5823 to 5769 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-lo: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-lt: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-lt: PKGSIZE changed from 169956 to 169870 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-lt: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-lv: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-lv: PKGSIZE changed from 77553 to 77428 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-lv: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mai: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mai: PKGSIZE changed from 4603 to 4548 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-mai: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mhr: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mhr: PKGSIZE changed from 5685 to 5649 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-mhr: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mi: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mi: PKGSIZE changed from 14097 to 14017 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-mi: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mk: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mk: PKGSIZE changed from 35156 to 35049 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-mk: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ml: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ml: PKGSIZE changed from 75075 to 74919 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ml: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mn: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mn: PKGSIZE changed from 28352 to 28320 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-mn: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mo: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mo: PKGSIZE changed from 1826 to 1790 (-2%)
packages/all-poky-linux/iso-codes/iso-codes-locale-mo: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mr: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mr: PKGSIZE changed from 496740 to 496612 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-mr: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ms: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ms: PKGSIZE changed from 17864 to 17835 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ms: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mt: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mt: PKGSIZE changed from 29429 to 29398 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-mt: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-my: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-my: PKGSIZE changed from 15661 to 15601 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-my: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-na: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-na: PKGSIZE changed from 6616 to 6587 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-na: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nah: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nah: PKGSIZE changed from 8160 to 8129 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-nah: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nb-no: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nb-no: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nb: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nb: PKGSIZE changed from 51567 to 51459 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-nb: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ne: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ne: PKGSIZE changed from 36477 to 36365 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ne: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nl: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nl: PKGSIZE changed from 356239 to 360488 (+1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-nl: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nn: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nn: PKGSIZE changed from 53124 to 53040 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-nn: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nso: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nso: PKGSIZE changed from 14944 to 14914 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-nso: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nv: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nv: PKGSIZE changed from 5917 to 5821 (-2%)
packages/all-poky-linux/iso-codes/iso-codes-locale-nv: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-oc: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-oc: PKGSIZE changed from 43864 to 43776 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-oc: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-or: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-or: PKGSIZE changed from 288572 to 288451 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-or: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pa: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pa: PKGSIZE changed from 476141 to 476038 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-pa: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pap: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pap: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pi: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pi: PKGSIZE changed from 9325 to 9277 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-pi: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pl: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pl: PKGSIZE changed from 376065 to 388194 (+3%)
packages/all-poky-linux/iso-codes/iso-codes-locale-pl: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ps: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ps: PKGSIZE changed from 10969 to 10933 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ps: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pt-br: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pt-br: PKGSIZE changed from 95925 to 95813 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-pt-br: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pt: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pt: PKGSIZE changed from 83644 to 83556 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-pt: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ro: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ro: PKGSIZE changed from 103063 to 102981 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ro: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ru: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ru: PKGSIZE changed from 227206 to 227073 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ru: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-rw: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-rw: PKGSIZE changed from 57722 to 57632 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-rw: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sc: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sc: PKGSIZE changed from 203516 to 203521 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sc: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sd: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sd: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-si: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-si: PKGSIZE changed from 36638 to 36523 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-si: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sk: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sk: PKGSIZE changed from 82138 to 82053 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sk: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sl: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sl: PKGSIZE changed from 157076 to 156950 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sl: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-so: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-so: PKGSIZE changed from 8613 to 8584 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-so: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-son: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-son: PKGSIZE changed from 9325 to 9288 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-son: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sq: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sq: PKGSIZE changed from 28926 to 28841 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sq: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sr+latin: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sr+latin: PKGSIZE changed from 208821 to 208739 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sr+latin: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sr: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sr: PKGSIZE changed from 251170 to 251067 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sr: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sv: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sv: PKGSIZE changed from 639050 to 639094 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sv: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sw: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sw: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ta: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ta: PKGSIZE changed from 507922 to 507781 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ta: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-te: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-te: PKGSIZE changed from 71941 to 71813 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-te: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tg: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tg: PKGSIZE changed from 34097 to 33996 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-tg: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-th: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-th: PKGSIZE changed from 215150 to 215033 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-th: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ti: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ti: PKGSIZE changed from 23573 to 23819 (+1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ti: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tig: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tig: PKGSIZE changed from 17614 to 17557 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-tig: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tk: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tk: PKGSIZE changed from 18573 to 18458 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-tk: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tl: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tl: PKGSIZE changed from 21986 to 21901 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-tl: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tr: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tr: PKGSIZE changed from 490247 to 493947 (+1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-tr: FILELIST: added "/usr/share/locale/tr/LC_MESSAGES/iso_639_5.mo /usr/share/locale/tr/LC_MESSAGES/iso_639-5.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-tr: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tt+iqtelif: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tt+iqtelif: PKGSIZE changed from 31490 to 31400 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-tt+iqtelif: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tt: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tt: PKGSIZE changed from 36749 to 36644 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-tt: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tzm: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tzm: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ug: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ug: PKGSIZE changed from 33532 to 33421 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ug: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-uk: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-uk: PKGSIZE changed from 859635 to 873607 (+2%)
packages/all-poky-linux/iso-codes/iso-codes-locale-uk: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ur: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ur: PKGSIZE changed from 11756 to 11724 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ur: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-uz: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-uz: PKGSIZE changed from 8907 to 8876 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-uz: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ve: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ve: PKGSIZE changed from 13292 to 13262 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ve: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-vi: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-vi: PKGSIZE changed from 223200 to 223050 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-vi: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-wa: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-wa: PKGSIZE changed from 63394 to 63307 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-wa: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-wal: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-wal: PKGSIZE changed from 6259 to 6202 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-wal: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-wo: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-wo: PKGSIZE changed from 24460 to 24306 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-wo: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-xh: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-xh: PKGSIZE changed from 8253 to 8223 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-xh: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-yo: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-yo: PKGSIZE changed from 11076 to 11045 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-yo: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-cn: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-cn: PKGSIZE changed from 196135 to 198283 (+1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-cn: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hans: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hans: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hant: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hant: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hk: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hk: PKGSIZE changed from 57923 to 57836 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hk: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-tw: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-tw: PKGSIZE changed from 121074 to 120963 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-tw: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zu: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zu: PKGSIZE changed from 11298 to 11244 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-zu: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-src: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-src: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes-staticdev: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-staticdev: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes/iso-codes: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes/iso-codes: PKGSIZE changed from 3012056 to 3012064 (+0%)
packages/all-poky-linux/iso-codes/iso-codes: PV changed from "4.11.0" to "4.12.0"
packages/all-poky-linux/iso-codes: PKGV changed from 4.11.0 [default] to 4.12.0 [default]
packages/all-poky-linux/iso-codes: PACKAGES: added "iso-codes-locale-pa-pk"
packages/all-poky-linux/iso-codes: PV changed from "4.11.0" to "4.12.0"

--===============2401304040456938818==--

