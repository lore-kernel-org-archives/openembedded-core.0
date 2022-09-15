Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0478C6FA95
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:42 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.10627.1663251514557180012
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=n3RsRaKP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 0101018341840274-a7e6281d-9687-4289-b55d-94ea9eb4af58-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251514;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ntlE9Bm1w9iR3XFlVOAC+APoU5ZwU1MJGhBzY1OwugI=;
	b=n3RsRaKPDQnmRl6B0Juheoo3YgJBtH1HvrMoVEzEtcwaNE8jtE1cQsXoz/rtlVIm
	kqyzUCx649oCeGOVDKcOdlfi57BB+R7enMtIcIKgjAflu3tae6SRlty2lmNHKzNO8Lg
	xC4lBqX4zA+IvS/HR1rDu/Qnd32HO1qgxy0TU8g8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251514;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ntlE9Bm1w9iR3XFlVOAC+APoU5ZwU1MJGhBzY1OwugI=;
	b=iKPVb0PTTnNbNAi5hX4S3VDLeJTJopbs7Fol7F8RCy/4KFpYQQir6Zr55qqgzSGf
	EAIllJa2oMksnW1lBeBBXv6710+kbhfqZrXCzbjaYAcSsbGoEUG5he2MvvMcaG3LmHJ
	GNFR7gSKyB0jwzk+i5NMya5O21BV2Ph1728W8ixo=
Content-Type: multipart/mixed; boundary="===============9208822837615883860=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libpng: upgrading to 1.6.38 SUCCEEDED
Message-ID: 
 <0101018341840274-a7e6281d-9687-4289-b55d-94ea9eb4af58-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:34 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170759

--===============9208822837615883860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libpng* to *1.6.38* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpng-upgrade-1.6.37-1.6.38.patch
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
--===============9208822837615883860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libpng/libpng-dev: RDEPENDS: removed "zlib-dev"
packages/core2-32-poky-linux/libpng/libpng: FILELIST: removed "/usr/lib/libpng16.so.16.37.0", added "/usr/lib/libpng16.so.16.38.0"
Changes to packages/core2-32-poky-linux/libpng (sysroot):
  /usr/lib/libpng16.so.16 changed symlink target from libpng16.so.16.37.0 to libpng16.so.16.38.0
  /usr/lib/libpng16.so changed symlink target from libpng16.so.16.37.0 to libpng16.so.16.38.0
  /usr/lib/libpng16.so.16.37.0 moved to /usr/lib/libpng16.so.16.38.0

--===============9208822837615883860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libpng: SRC_URI changed from "https://downloads.sourceforge.net/libpng/libpng16/libpng-1.6.37.tar.xz" to "https://downloads.sourceforge.net/libpng/libpng16/libpng-1.6.38.tar.xz"
packages/core2-32-poky-linux/libpng: PKGV changed from 1.6.37 [default] to 1.6.38 [default]
packages/core2-32-poky-linux/libpng: PV changed from "1.6.37" to "1.6.38"
packages/core2-32-poky-linux/libpng/libpng-dbg: PKGSIZE changed from 670180 to 670800 (+0%)
packages/core2-32-poky-linux/libpng/libpng-dbg: PKGV changed from 1.6.37 [default] to 1.6.38 [default]
packages/core2-32-poky-linux/libpng/libpng-dbg: PV changed from "1.6.37" to "1.6.38"
packages/core2-32-poky-linux/libpng/libpng-dbg: FILELIST: removed "/usr/lib/.debug/libpng16.so.16.37.0", added "/usr/lib/.debug/libpng16.so.16.38.0"
packages/core2-32-poky-linux/libpng/libpng-dev: RDEPENDS: removed "zlib-dev"
packages/core2-32-poky-linux/libpng/libpng-dev: PKGSIZE changed from 173856 to 173836 (-0%)
packages/core2-32-poky-linux/libpng/libpng-dev: PKGV changed from 1.6.37 [default] to 1.6.38 [default]
packages/core2-32-poky-linux/libpng/libpng-dev: PV changed from "1.6.37" to "1.6.38"
packages/core2-32-poky-linux/libpng/libpng-doc: PKGSIZE changed from 269456 to 269466 (+0%)
packages/core2-32-poky-linux/libpng/libpng-doc: PKGV changed from 1.6.37 [default] to 1.6.38 [default]
packages/core2-32-poky-linux/libpng/libpng-doc: PV changed from "1.6.37" to "1.6.38"
packages/core2-32-poky-linux/libpng/libpng-locale: PKGV changed from 1.6.37 [default] to 1.6.38 [default]
packages/core2-32-poky-linux/libpng/libpng-locale: PV changed from "1.6.37" to "1.6.38"
packages/core2-32-poky-linux/libpng/libpng-src: PKGSIZE changed from 1398217 to 1397970 (-0%)
packages/core2-32-poky-linux/libpng/libpng-src: PKGV changed from 1.6.37 [default] to 1.6.38 [default]
packages/core2-32-poky-linux/libpng/libpng-src: PV changed from "1.6.37" to "1.6.38"
packages/core2-32-poky-linux/libpng/libpng-staticdev: PKGV changed from 1.6.37 [default] to 1.6.38 [default]
packages/core2-32-poky-linux/libpng/libpng-staticdev: PV changed from "1.6.37" to "1.6.38"
packages/core2-32-poky-linux/libpng/libpng-tools: PKGV changed from 1.6.37 [default] to 1.6.38 [default]
packages/core2-32-poky-linux/libpng/libpng-tools: PV changed from "1.6.37" to "1.6.38"
packages/core2-32-poky-linux/libpng/libpng: PKGV changed from 1.6.37 [default] to 1.6.38 [default]
packages/core2-32-poky-linux/libpng/libpng: PV changed from "1.6.37" to "1.6.38"
packages/core2-32-poky-linux/libpng/libpng: FILELIST: removed "/usr/lib/libpng16.so.16.37.0", added "/usr/lib/libpng16.so.16.38.0"
Changes to packages/core2-32-poky-linux/libpng (sysroot):
  /usr/lib/libpng16.so.16 changed symlink target from libpng16.so.16.37.0 to libpng16.so.16.38.0
  /usr/lib/libpng16.so changed symlink target from libpng16.so.16.37.0 to libpng16.so.16.38.0
  /usr/lib/libpng16.so.16.37.0 moved to /usr/lib/libpng16.so.16.38.0

--===============9208822837615883860==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpng-upgrade-1.6.37-1.6.38.patch"

RnJvbSBhNzZlNTViNzZmMmFlNGY2ODE0MWQxNzRkODI4YjdlODUwYTE1YmY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMTI6NTM6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJwbmc6IHVwZ3JhZGUgMS42LjM3IC0+IDEuNi4zOAoKLS0tCiAuLi4ve2xpYnBuZ18xLjYuMzcu
YmIgPT4gbGlicG5nXzEuNi4zOC5iYn0gICAgfCAyOSArKysrKysrKysrKysrKysrKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9saWJwbmcve2xpYnBuZ18xLjYuMzcuYmIgPT4gbGlicG5nXzEu
Ni4zOC5iYn0gKDUxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJw
bmcvbGlicG5nXzEuNi4zNy5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnBuZy9saWJw
bmdfMS42LjM4LmJiCnNpbWlsYXJpdHkgaW5kZXggNTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2xpYnBuZy9saWJwbmdfMS42LjM3LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9saWJwbmcvbGlicG5nXzEuNi4zOC5iYgppbmRleCA2MWUzZDkyZTk1Li5l
ZDA3N2Y5ZjAwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJwbmcvbGli
cG5nXzEuNi4zNy5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJwbmcvbGlicG5n
XzEuNi4zOC5iYgpAQCAtMSwzICsxLDI3IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NV
TSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBm
b2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxp
Y2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQs
IGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAn
TGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHly
aWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5T
RQorIyArKysgTElDRU5TRQorIyBAQCAtNCw4ICs0LDggQEAKKyMgIFBORyBSZWZlcmVuY2UgTGli
cmFyeSBMaWNlbnNlIHZlcnNpb24gMgorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCisjICAKKyMgLSAqIENvcHlyaWdodCAoYykgMTk5NS0yMDE5IFRoZSBQTkcgUmVm
ZXJlbmNlIExpYnJhcnkgQXV0aG9ycy4KKyMgLSAqIENvcHlyaWdodCAoYykgMjAxOC0yMDE5IENv
c21pbiBUcnV0YS4KKyMgKyAqIENvcHlyaWdodCAoYykgMTk5NS0yMDIyIFRoZSBQTkcgUmVmZXJl
bmNlIExpYnJhcnkgQXV0aG9ycy4KKyMgKyAqIENvcHlyaWdodCAoYykgMjAxOC0yMDIyIENvc21p
biBUcnV0YS4KKyMgICAqIENvcHlyaWdodCAoYykgMjAwMC0yMDAyLCAyMDA0LCAyMDA2LTIwMTgg
R2xlbm4gUmFuZGVycy1QZWhyc29uLgorIyAgICogQ29weXJpZ2h0IChjKSAxOTk2LTE5OTcgQW5k
cmVhcyBEaWxnZXIuCisjICAgKiBDb3B5cmlnaHQgKGMpIDE5OTUtMTk5NiBHdXkgRXJpYyBTY2hh
bG5hdCwgR3JvdXAgNDIsIEluYy4KKyMgCisjCisKIFNVTU1BUlkgPSAiUE5HIGltYWdlIGZvcm1h
dCBkZWNvZGluZyBsaWJyYXJ5IgogREVTQ1JJUFRJT04gPSAiQW4gb3BlbiBzb3VyY2UgcHJvamVj
dCB0byBkZXZlbG9wIGFuZCBtYWludGFpbiB0aGUgcmVmZXJlbmNlIFwKIGxpYnJhcnkgZm9yIHVz
ZSBpbiBhcHBsaWNhdGlvbnMgdGhhdCByZWFkLCBjcmVhdGUsIGFuZCBtYW5pcHVsYXRlIFBORyBc
CkBAIC01LDE0ICsyOSwxMyBAQCBsaWJyYXJ5IGZvciB1c2UgaW4gYXBwbGljYXRpb25zIHRoYXQg
cmVhZCwgY3JlYXRlLCBhbmQgbWFuaXB1bGF0ZSBQTkcgXAogSE9NRVBBR0UgPSAiaHR0cDovL3d3
dy5saWJwbmcub3JnLyIKIFNFQ1RJT04gPSAibGlicyIKIExJQ0VOU0UgPSAiTGlicG5nIgotTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YjAwODUwNTFiZjI2NWJhYzJiZmMz
OGJjODlmNTAwMDAiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT01Yzkw
MGNjMTI0YmEzNWEyNzQwNzNiNWRlNzYzOWIxMyIKIERFUEVORFMgPSAiemxpYiIKIAogTElCViA9
ICIxNiIKIAogU1JDX1VSSSA9ICIke1NPVVJDRUZPUkdFX01JUlJPUn0vJHtCUE59LyR7QlBOfSR7
TElCVn0vJHtCUH0udGFyLnh6IgotU1JDX1VSSVttZDVzdW1dID0gIjAxNWU4ZTE1ZGIxZWVjZGU1
ZjJlYjllYjViNmU1OWU5IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjUwNWU3MDgzNGQzNTM4MzUz
N2I2NDkxZTdhZTg2NDFmMWE0YmVkMTg3NmRiZmUzNjEyMDFmYzgwODY4ZDg4Y2EiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiYjM2ODNlOGI4MTExZWJmNmYxYWMwMDRlYmI2YjBjOTc1Y2QzMTBlYzQ2
OWQ5ODM2NDM4OGU5Y2VkYmZhNjhiZSIKIAogTUlSUk9SUyArPSAiJHtTT1VSQ0VGT1JHRV9NSVJS
T1J9LyR7QlBOfS8ke0JQTn0ke0xJQlZ9LyAke1NPVVJDRUZPUkdFX01JUlJPUn0vJHtCUE59LyR7
QlBOfSR7TElCVn0vb2xkZXItcmVsZWFzZXMvIgogCi0tIAoyLjMxLjEKCg==

--===============9208822837615883860==--

