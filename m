Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADED2C7EE2F
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:41 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.7616.1685693430297923997
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Lk99eS+2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101887b289289-c94a5577-35db-4b37-9219-f35509dce8cf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693436;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WDqarY2hD//eMnAvCNCm4LgNLxfXTbI7bpkcF3ymDoI=;
	b=Lk99eS+2bw3+VPKFerr1F64vidmbynekAVJCBBrZZ2KNxnh8cSqUo36kEpvlrLyu
	0Ir96n7p4kAYbxUTtAGWMtBLLcwTq55rxnMZ6nDmaDpQsHeMEUP9ECvbJcHUrTtZJNl
	omH3Yl7q2xg79F8glA3VPed56XQLCVv67FM8RgZg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693436;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WDqarY2hD//eMnAvCNCm4LgNLxfXTbI7bpkcF3ymDoI=;
	b=kucH2+5BE63KYTeW/l5GU6N0xY3FOG8PsNbtkHMeKt5+vIGfl0lvgXIx9woakC4A
	nyNhxz45kkIrmkkUNSuZ12kRwy6dFLEDg143NCGaaA0neLzo1Y11Ls9/xkI31z8o4El
	fFqb9TBo0662eUeyQjdznQuHdm65R0zaUrQKgnFI=
Content-Type: multipart/mixed; boundary="===============6583109124285498915=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcap: upgrading to 2.69 SUCCEEDED
Message-ID: <010101887b289289-c94a5577-35db-4b37-9219-f35509dce8cf-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182276

--===============6583109124285498915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libcap* to *2.69* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libcap-upgrade-2.68-2.69.patch
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
--===============6583109124285498915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libcap/libcap: FILELIST: removed "/usr/lib/libpsx.so.2.68 /lib/libcap.so.2.68", added "/usr/lib/libpsx.so.2.69 /lib/libcap.so.2.69"
Changes to packages/core2-32-poky-linux/libcap (sysroot):
  /lib/libcap.so.2 changed symlink target from libcap.so.2.68 to libcap.so.2.69
  /usr/lib/libpsx.so.2 changed symlink target from libpsx.so.2.68 to libpsx.so.2.69
  /lib/libcap.so.2.68 moved to /lib/libcap.so.2.69
  /usr/lib/libpsx.so.2.68 moved to /usr/lib/libpsx.so.2.69
Changes to packages/x86_64-linux/libcap-native (sysroot):
  /usr/lib/libcap.so.2 changed symlink target from libcap.so.2.68 to libcap.so.2.69
  /usr/lib/libpsx.so.2 changed symlink target from libpsx.so.2.68 to libpsx.so.2.69
  /usr/lib/libcap.so.2.68 moved to /usr/lib/libcap.so.2.69
  /usr/lib/libpsx.so.2.68 moved to /usr/lib/libpsx.so.2.69

--===============6583109124285498915==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libcap-upgrade-2.68-2.69.patch"

RnJvbSA5NDNlZjJjYjcxZTBmZDhhZTc4YTQzOTc2NDA3NDg4NjlhMzFiNTRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMiBKdW4gMjAyMyAwNjozNjozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmNhcDogdXBncmFkZSAyLjY4IC0+IDIuNjkKCi0tLQogLi4ubmF0aXZlc2RrLWxpYmNhcC1SYWlz
ZS10aGUtc2l6ZS1vZi1hcnJheXMtY29udGFpbmluZy5wYXRjaCB8IDQgKystLQogLi4uL3JlY2lw
ZXMtc3VwcG9ydC9saWJjYXAve2xpYmNhcF8yLjY4LmJiID0+IGxpYmNhcF8yLjY5LmJifSB8IDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC97bGliY2FwXzIuNjguYmIgPT4gbGliY2Fw
XzIuNjkuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2Fw
L2ZpbGVzLzAwMDEtbmF0aXZlc2RrLWxpYmNhcC1SYWlzZS10aGUtc2l6ZS1vZi1hcnJheXMtY29u
dGFpbmluZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC9maWxlcy8wMDAxLW5h
dGl2ZXNkay1saWJjYXAtUmFpc2UtdGhlLXNpemUtb2YtYXJyYXlzLWNvbnRhaW5pbmcucGF0Y2gK
aW5kZXggMmFjMWU2ZTU2MC4uYjViYzk0MzI2MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGliY2FwL2ZpbGVzLzAwMDEtbmF0aXZlc2RrLWxpYmNhcC1SYWlzZS10aGUtc2l6ZS1v
Zi1hcnJheXMtY29udGFpbmluZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJj
YXAvZmlsZXMvMDAwMS1uYXRpdmVzZGstbGliY2FwLVJhaXNlLXRoZS1zaXplLW9mLWFycmF5cy1j
b250YWluaW5nLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3MDlhYThlMTU2NDE1MjE1YjBi
YjAzNGQwNWIyYWEyZjQ0YmUwNDRlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkMjhi
ZWJhY2YwYmM2YWJjMmUxMTRlZTU1N2U4MzdkOTY0MGQzYmNmIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTog
VGh1LCAxNCBPY3QgMjAyMSAxNTo1NzozNiArMDgwMAogU3ViamVjdDogW1BBVENIXSBuYXRpdmVz
ZGstbGliY2FwOiBSYWlzZSB0aGUgc2l6ZSBvZiBhcnJheXMgY29udGFpbmluZyBkbApAQCAtMjAs
NyArMjAsNyBAQCBTaWduZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZl
ci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAK
IGRpZmYgLS1naXQgYS9saWJjYXAvZXhlY2FibGUuaCBiL2xpYmNhcC9leGVjYWJsZS5oCi1pbmRl
eCBmZWUxN2I0Li41YmIwYzU1IDEwMDY0NAoraW5kZXggN2EyZDI0Ny4uNjgyZTBlZSAxMDA2NDQK
IC0tLSBhL2xpYmNhcC9leGVjYWJsZS5oCiArKysgYi9saWJjYXAvZXhlY2FibGUuaAogQEAgLTIz
LDcgKzIzLDcgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC9saWJj
YXBfMi42OC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC9saWJjYXBfMi42OS5iYgpz
aW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJj
YXAvbGliY2FwXzIuNjguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC9s
aWJjYXBfMi42OS5iYgppbmRleCBhMzAyYzVhMzY3Li45MmZhNzY2ZDM3IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAvbGliY2FwXzIuNjguYmIKKysrIGIvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvbGliY2FwL2xpYmNhcF8yLjY5LmJiCkBAIC0xOSw3ICsxOSw3IEBAIFNSQ19V
UkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9saW51eC9saWJzL3NlY3VyaXR5L2xpbnV4LXByaXZz
LyR7QlBOfTIvJHtCUE59LSR7CiBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmVzZGsgPSAiIFwK
ICAgICAgICAgICAgZmlsZTovLzAwMDEtbmF0aXZlc2RrLWxpYmNhcC1SYWlzZS10aGUtc2l6ZS1v
Zi1hcnJheXMtY29udGFpbmluZy5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICI5MGJlM2I2ZDQxYmU1ZjgxYWU0YjAzZWM3NjAxMmIwZDI3YzgyOTI5MzY4NGY2YzA1
YjY1ZDVmOWNjZTcyNGIyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImYzMTFmOGYzZGFkODQ2OTlk
MDU2NmQxZDZmN2VjOTQzYTkyOThiMjhmNzE0Y2FlM2M5MzFkZmQ1NzQ5MmQ3ZWIiCiAKIFVQU1RS
RUFNX0NIRUNLX1VSSSA9ICJodHRwczovL3d3dy5rZXJuZWwub3JnL3B1Yi9saW51eC9saWJzL3Nl
Y3VyaXR5L2xpbnV4LXByaXZzLyR7QlBOfTIvIgogCi0tIAoyLjM5LjIKCg==

--===============6583109124285498915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libcap: PKGV changed from 2.68 [default] to 2.69 [default]
packages/core2-32-poky-linux/libcap: PV changed from "2.68" to "2.69"
packages/core2-32-poky-linux/libcap: SRC_URI changed from "https://cdn.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.68.tar.xz file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch file://0002-tests-do-not-run-target-executables.patch" to "https://cdn.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.69.tar.xz file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch file://0002-tests-do-not-run-target-executables.patch"
packages/core2-32-poky-linux/libcap/libcap-bin: PKGV changed from 2.68 [default] to 2.69 [default]
packages/core2-32-poky-linux/libcap/libcap-bin: PV changed from "2.68" to "2.69"
packages/core2-32-poky-linux/libcap/libcap-dbg: PKGV changed from 2.68 [default] to 2.69 [default]
packages/core2-32-poky-linux/libcap/libcap-dbg: PKGSIZE changed from 259224 to 260544 (+1%)
packages/core2-32-poky-linux/libcap/libcap-dbg: PV changed from "2.68" to "2.69"
packages/core2-32-poky-linux/libcap/libcap-dbg: FILELIST: removed "/usr/lib/.debug/libpsx.so.2.68 /lib/.debug/libcap.so.2.68", added "/usr/lib/.debug/libpsx.so.2.69 /lib/.debug/libcap.so.2.69"
packages/core2-32-poky-linux/libcap/libcap-dev: PKGV changed from 2.68 [default] to 2.69 [default]
packages/core2-32-poky-linux/libcap/libcap-dev: PV changed from "2.68" to "2.69"
packages/core2-32-poky-linux/libcap/libcap-doc: PKGV changed from 2.68 [default] to 2.69 [default]
packages/core2-32-poky-linux/libcap/libcap-doc: PKGSIZE changed from 78206 to 78200 (-0%)
packages/core2-32-poky-linux/libcap/libcap-doc: PV changed from "2.68" to "2.69"
packages/core2-32-poky-linux/libcap/libcap-locale: PKGV changed from 2.68 [default] to 2.69 [default]
packages/core2-32-poky-linux/libcap/libcap-locale: PV changed from "2.68" to "2.69"
packages/core2-32-poky-linux/libcap/libcap-src: PKGV changed from 2.68 [default] to 2.69 [default]
packages/core2-32-poky-linux/libcap/libcap-src: PKGSIZE changed from 218354 to 219353 (+0%)
packages/core2-32-poky-linux/libcap/libcap-src: PV changed from "2.68" to "2.69"
packages/core2-32-poky-linux/libcap/libcap-staticdev: PKGV changed from 2.68 [default] to 2.69 [default]
packages/core2-32-poky-linux/libcap/libcap-staticdev: PKGSIZE changed from 152760 to 152816 (+0%)
packages/core2-32-poky-linux/libcap/libcap-staticdev: PV changed from "2.68" to "2.69"
packages/core2-32-poky-linux/libcap/libcap: PKGV changed from 2.68 [default] to 2.69 [default]
packages/core2-32-poky-linux/libcap/libcap: PV changed from "2.68" to "2.69"
packages/core2-32-poky-linux/libcap/libcap: FILELIST: removed "/usr/lib/libpsx.so.2.68 /lib/libcap.so.2.68", added "/usr/lib/libpsx.so.2.69 /lib/libcap.so.2.69"
Changes to packages/core2-32-poky-linux/libcap (sysroot):
  /lib/libcap.so.2 changed symlink target from libcap.so.2.68 to libcap.so.2.69
  /usr/lib/libpsx.so.2 changed symlink target from libpsx.so.2.68 to libpsx.so.2.69
  /lib/libcap.so.2.68 moved to /lib/libcap.so.2.69
  /usr/lib/libpsx.so.2.68 moved to /usr/lib/libpsx.so.2.69
Changes to packages/x86_64-linux/libcap-native (sysroot):
  /usr/lib/libcap.so.2 changed symlink target from libcap.so.2.68 to libcap.so.2.69
  /usr/lib/libpsx.so.2 changed symlink target from libpsx.so.2.68 to libpsx.so.2.69
  /usr/lib/libcap.so.2.68 moved to /usr/lib/libcap.so.2.69
  /usr/lib/libpsx.so.2.68 moved to /usr/lib/libpsx.so.2.69

--===============6583109124285498915==--

