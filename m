Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD3CC77B6F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:36 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.144489.1671136350181511172
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=N+Q7soJn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010185177d1d5e-f2d12d13-f2ef-4af1-92d0-340a1064d3df-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136353;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TPAFZAINAJPdGK23JWOWHTcWy/nhXt3Oeq2s70pKC/k=;
	b=N+Q7soJnKyokyqofBro5Qe8bcgcwLH7Ypfj6jLm3UX/MTdEC2xadUJpr2Bp8SHSk
	cJgi6n42K98asI6yMms0R9eyTUWo9Gkk7wqoCBCACfJ6irKArMmVK3Gb4dIdqBLbUWD
	9x9YtGWentvikb4qj9dNrI4QCILnFLeoFXyR4ipU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136353;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TPAFZAINAJPdGK23JWOWHTcWy/nhXt3Oeq2s70pKC/k=;
	b=Slf1Pg42N6IB+ATuasxu80SxuI3tIPbK88TT3c7mcYPigap6kNjgUlhQJZsssx2l
	rzvownN62O5Omr8xFjDHqPg24hoMQmzbFSUx2WgPXvKNehgrjHsTPMgKjJmzvs4klzk
	zRUc39sRw8KECXNI8Qlk1z1iFBkwhiMl36AnCjv8=
Content-Type: multipart/mixed; boundary="===============0787504321700162589=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Victor Kamensky <victor.kamensky7@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemtap-uprobes: upgrading to 4.8 SUCCEEDED
Message-ID: <01010185177d1d5e-f2d12d13-f2ef-4af1-92d0-340a1064d3df-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174714

--===============0787504321700162589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemtap-uprobes* to *4.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-systemtap-uprobes-upgrade-4.7-4.8.patch
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
--===============0787504321700162589==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-systemtap-uprobes-upgrade-4.7-4.8.patch"

RnJvbSAzYTY0N2FhMDljNjYxOTg1NTI0MDg3MmMzZjI0ZTFiOWZhYTE0Y2NjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTg6MzM6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
eXN0ZW10YXAtdXByb2JlczogdXBncmFkZSA0LjcgLT4gNC44CgotLS0KIC4uLi9zeXN0ZW10YXAv
c3lzdGVtdGFwLXVwcm9iZXNfZ2l0LmJiICAgICAgICB8ICAxICsKIC4uLi9zeXN0ZW10YXAvc3lz
dGVtdGFwL3B5dGhvbi0zLjExLnBhdGNoICAgICB8IDM3IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4u
Li9zeXN0ZW10YXAvc3lzdGVtdGFwX2dpdC5pbmMgICAgICAgICAgICAgICB8ICA1ICstLQogMyBm
aWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQwIGRlbGV0aW9ucygtKQogZGVsZXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcC9weXRob24t
My4xMS5wYXRjaAoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5
c3RlbXRhcC11cHJvYmVzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5
c3RlbXRhcC11cHJvYmVzX2dpdC5iYgppbmRleCAyMTgxZTQ1YThkLi5hYWMyYjg3MWE3IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10YXAtdXByb2Jlc19n
aXQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwLXVwcm9i
ZXNfZ2l0LmJiCkBAIC0zOCwzICszOCw0IEBAIGRvX2luc3RhbGwoKSB7CiAJCWluc3RhbGwgLW0g
MDY0NCAke1N9L3J1bnRpbWUvdXByb2Jlcy91cHJvYmVzLmtvICR7RH0ke2RhdGFkaXJ9L3N5c3Rl
bXRhcC9ydW50aW1lL3Vwcm9iZXMvCiAJZmkKIH0KKwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwL3B5dGhvbi0zLjExLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwL3B5dGhvbi0zLjExLnBhdGNoCmRlbGV0ZWQg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCA2ZTBjOTdiOGQ2Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEv
cmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcC9weXRob24tMy4xMS5wYXRjaAorKysg
L2Rldi9udWxsCkBAIC0xLDM3ICswLDAgQEAKLUZyb20gMDY5ZTEwOWM5NWQxYWZjYTE3Y2QzNzgx
YjM5ZjIyMGNmOGIzOTk3OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IFN0YW4gQ294
IDxzY294QHJlZGhhdC5jb20+Ci1EYXRlOiBXZWQsIDEzIEp1bCAyMDIyIDA5OjQ5OjUxIC0wNDAw
Ci1TdWJqZWN0OiBbUEFUQ0ggMS8xXSBweXRob24gMy4xMSByZW1vdmVkIGRpcmVjdCBhY2Nlc3Mg
dG8gUHlGcmFtZU9iamVjdAotIG1lbWJlcnMKLQotVGFrZSBpbnRvIGFjY291bnQgdGhlIGNoYW5n
ZSBpbiBQeUZyYW1lT2JqZWN0IGRlZmluaXRpb24gdG8gYWxsb3cKLWJ1aWxkaW5nIHN5c3RlbXRh
cCB3aXRoIHB5dGhvbiAzLjExLiAgQWRkaXRpb25hbCBzdXBwb3J0IGZvciBweXRob24KLTMuMTEg
aXMgZm9ydGhjb21pbmcuCi0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vc291
cmNld2FyZS5vcmcvZ2l0Lz9wPXN5c3RlbXRhcC5naXQ7YT1jb21taXQ7aD0wNjllMTA5Yzk1ZDFh
ZmNhMTdjZDM3ODFiMzlmMjIwY2Y4YjM5OTc4XQotU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEth
bmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KLS0tLQotIHB5dGhvbi9IZWxwZXJTRFQvX0hlbHBl
clNEVC5jIHwgNiArKysrKysKLSAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCi0KLWRp
ZmYgLS1naXQgYS9weXRob24vSGVscGVyU0RUL19IZWxwZXJTRFQuYyBiL3B5dGhvbi9IZWxwZXJT
RFQvX0hlbHBlclNEVC5jCi1pbmRleCA5NjdjYjYwNzcuLjRkMjg3MTMyZSAxMDA2NDQKLS0tLSBh
L3B5dGhvbi9IZWxwZXJTRFQvX0hlbHBlclNEVC5jCi0rKysgYi9weXRob24vSGVscGVyU0RUL19I
ZWxwZXJTRFQuYwotQEAgLTE0LDcgKzE0LDEzIEBACi0gLy8gUFIyNTg0MTogZW5zdXJlIHRoYXQg
dGhlIGxpYkhlbHBlclNEVC5zbyBmaWxlIGNvbnRhaW5zIGRlYnVnaW5mbwotIC8vIGZvciB0aGUg
dGFwc2V0IGhlbHBlciBmdW5jdGlvbnMsIHNvIHRoZXkgZG9uJ3QgaGF2ZSB0byBsb29rIGludG8g
bGlicHl0aG9uKgotICNpbmNsdWRlIDxmcmFtZW9iamVjdC5oPgotKy8vIHB5dGhvbiAzLjExIHJl
bW92ZWQgZGlyZWN0IGFjY2VzcyB0byBQeUZyYW1lT2JqZWN0IG1lbWJlcnMKLSsvLyBodHRwczov
L2RvY3MucHl0aG9uLm9yZy8zLjExL3doYXRzbmV3LzMuMTEuaHRtbCNjLWFwaS1jaGFuZ2VzCi0r
I2lmIFBZX01BSk9SX1ZFUlNJT04gPD0gMyAmJiBQWV9NSU5PUl9WRVJTSU9OIDwgMTEKLSBQeUZy
YW1lT2JqZWN0IF9kdW1teV9mcmFtZTsKLSsjZWxzZQotKy8vUHlGcmFtZU9iamVjdCAqX2R1bW15
X2ZyYW1lOwotKyNlbmRpZgotICNpbmNsdWRlIDxvYmplY3QuaD4KLSBQeVZhck9iamVjdCBfZHVt
bXlfdmFyOwotICNpbmNsdWRlIDxkaWN0b2JqZWN0Lmg+Ci0tLSAKLTIuMzEuMQotCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10YXBfZ2l0LmluYyBiL21l
dGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcF9naXQuaW5jCmluZGV4IGIwNWE1
YTJiMGQuLmQzMDlhODk0OTYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVt
dGFwL3N5c3RlbXRhcF9naXQuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFw
L3N5c3RlbXRhcF9naXQuaW5jCkBAIC0xLDEzICsxLDEyIEBACiBMSUNFTlNFID0gIkdQTC0yLjAt
b25seSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWIyMzRlZTRkNjlm
NWZjZTQ0ODZhODBmZGFmNGE0MjYzIgotU1JDUkVWID0gIjBjMzM1YTc1YTc4OWZmNDRiNTE0ZTU2
N2Q0NTg4ODFlMTVjYzI4M2QiCi1QViA9ICI0LjciCitTUkNSRVYgPSAiYjE3NmFmYjJlNDkxMTll
Zjg0NGQxOTNkMjdiMDc1MmE2ZDg0ZmU4ZiIKK1BWID0gIjQuOCIKIAogU1JDX1VSSSA9ICJnaXQ6
Ly9zb3VyY2V3YXJlLm9yZy9naXQvc3lzdGVtdGFwLmdpdDticmFuY2g9bWFzdGVyIFwKICAgICAg
ICAgICAgZmlsZTovLzAwMDEtRG8tbm90LWxldC1jb25maWd1cmUtd3JpdGUtYS1weXRob24tbG9j
YXRpb24taW50by10aC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLUluc3RhbGwtcHl0
aG9uLW1vZHVsZXMtdG8tY29ycmVjdC1saWJyYXJ5LWRpci5wYXRjaCBcCiAgICAgICAgICAgIGZp
bGU6Ly8wMDAxLXN0YXBydW4tc3RhcGJwZi1kb24tdC1zdXBwb3J0LWluc3RhbGxpbmctYS1ub24t
cm9vdC5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly9weXRob24tMy4xMS5wYXRjaCBcCiAgICAg
ICAgICAgICIKIAogQ09NUEFUSUJMRV9IT1NUID0gJyh4ODZfNjR8aS44Nnxwb3dlcnBjfGFybXxh
YXJjaDY0fG1pY3JvYmxhemVlbHxtaXBzfHJpc2N2NjQpLiotbGludXgnCi0tIAoyLjM3LjMKCg==

--===============0787504321700162589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/systemtap: SRC_URI changed from "git://sourceware.org/git/systemtap.git;branch=master file://0001-Do-not-let-configure-write-a-python-location-into-th.patch file://0001-Install-python-modules-to-correct-library-dir.patch file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch file://python-3.11.patch file://0001-improve-reproducibility-for-c-compiling.patch file://0001-staprun-address-ncurses-6.3-failures.patch" to "git://sourceware.org/git/systemtap.git;branch=master file://0001-Do-not-let-configure-write-a-python-location-into-th.patch file://0001-Install-python-modules-to-correct-library-dir.patch file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch file://0001-improve-reproducibility-for-c-compiling.patch file://0001-staprun-address-ncurses-6.3-failures.patch"
packages/core2-32-poky-linux/systemtap: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap: PV changed from "4.7" to "4.8"
Changes to packages/core2-32-poky-linux/systemtap (sysroot):
  /usr/share/systemtap/examples/general/pyexample.stp was added
  /usr/share/systemtap/examples/security-band-aids/cve-2016-0728-templatized.stp was added
  /usr/share/systemtap/examples/security-band-aids/cve-2018-6485-templatized.stp was added
  /usr/share/systemtap/examples/security-band-aids/security-bandaid-template.stp was added
  /usr/share/systemtap/tapset/livepatch.stp was added
  /usr/share/systemtap/examples/general/py2example.stp was removed
  /usr/share/systemtap/examples/general/py3example.stp was removed
  /usr/share/systemtap/examples/general/tapset was removed
  /usr/share/systemtap/examples/general/tapset/python2_local.stp was removed
  /usr/share/systemtap/examples/general/tapset/python3_local.stp was removed
  /usr/share/systemtap/examples/general/tapset/python_local.stpm was removed
packages/core2-32-poky-linux/systemtap/systemtap-dbg: PKGSIZE changed from 58106208 to 58645120 (+1%)
packages/core2-32-poky-linux/systemtap/systemtap-dbg: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-dbg: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-dev: PKGSIZE changed from 22718 to 22433 (-1%)
packages/core2-32-poky-linux/systemtap/systemtap-dev: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-dev: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-doc: PKGSIZE changed from 468954 to 469215 (+0%)
packages/core2-32-poky-linux/systemtap/systemtap-doc: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-doc: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-examples: PKGSIZE changed from 1505292 to 1484450 (-1%)
packages/core2-32-poky-linux/systemtap/systemtap-examples: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-examples: FILELIST: removed "/usr/share/systemtap/examples/general/tapset/python_local.stpm /usr/share/systemtap/examples/general/py3example.stp /usr/share/systemtap/examples/general/tapset/python2_local.stp /usr/share/systemtap/examples/general/py2example.stp /usr/share/systemtap/examples/general/tapset/python3_local.stp", added "/usr/share/systemtap/examples/security-band-aids/cve-2016-0728-templatized.stp /usr/share/systemtap/examples/security-band-aids/security-bandaid-template.stp /usr/share/systemtap/examples/general/pyexample.stp /usr/share/systemtap/examples/security-band-aids/cve-2018-6485-templatized.stp"
packages/core2-32-poky-linux/systemtap/systemtap-examples: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-exporter: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-exporter: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-locale-cs: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-locale-cs: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-locale-en: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-locale-en: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-locale-fr: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-locale-fr: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-locale-pl: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-locale-pl: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-python: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-python: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-runtime: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-runtime: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-src: PKGSIZE changed from 2914280 to 2942351 (+1%)
packages/core2-32-poky-linux/systemtap/systemtap-src: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-src: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-staticdev: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-staticdev: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap: PKGSIZE changed from 9613929 to 9680063 (+1%)
packages/core2-32-poky-linux/systemtap/systemtap: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap: FILELIST: added "/usr/share/systemtap/tapset/livepatch.stp"
packages/core2-32-poky-linux/systemtap/systemtap: PV changed from "4.7" to "4.8"
packages/qemux86-poky-linux/systemtap-uprobes: SRC_URI changed from "git://sourceware.org/git/systemtap.git;branch=master file://0001-Do-not-let-configure-write-a-python-location-into-th.patch file://0001-Install-python-modules-to-correct-library-dir.patch file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch file://python-3.11.patch" to "git://sourceware.org/git/systemtap.git;branch=master file://0001-Do-not-let-configure-write-a-python-location-into-th.patch file://0001-Install-python-modules-to-correct-library-dir.patch file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch"
packages/qemux86-poky-linux/systemtap-uprobes: PKGV changed from 4.7 [default] to 4.8 [default]
packages/qemux86-poky-linux/systemtap-uprobes: PV changed from "4.7" to "4.8"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-dbg: PKGV changed from 4.7 [default] to 4.8 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-dbg: PV changed from "4.7" to "4.8"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-dev: PKGV changed from 4.7 [default] to 4.8 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-dev: PV changed from "4.7" to "4.8"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-doc: PKGV changed from 4.7 [default] to 4.8 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-doc: PV changed from "4.7" to "4.8"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-locale: PKGV changed from 4.7 [default] to 4.8 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-locale: PV changed from "4.7" to "4.8"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-src: PKGV changed from 4.7 [default] to 4.8 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-src: PV changed from "4.7" to "4.8"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-staticdev: PKGV changed from 4.7 [default] to 4.8 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-staticdev: PV changed from "4.7" to "4.8"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes: PKGV changed from 4.7 [default] to 4.8 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes: PV changed from "4.7" to "4.8"

--===============0787504321700162589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1673 targets, 49 skipped, 0 masked, 0 errors.
Removing 44 recipes from the core2-32 sysroot...done.
Removing 46 recipes from the qemux86 sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'systemtap-uprobes'
systemtap-uprobes was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============0787504321700162589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/systemtap (sysroot):
  /usr/share/systemtap/examples/general/pyexample.stp was added
  /usr/share/systemtap/examples/security-band-aids/cve-2016-0728-templatized.stp was added
  /usr/share/systemtap/examples/security-band-aids/cve-2018-6485-templatized.stp was added
  /usr/share/systemtap/examples/security-band-aids/security-bandaid-template.stp was added
  /usr/share/systemtap/tapset/livepatch.stp was added
  /usr/share/systemtap/examples/general/py2example.stp was removed
  /usr/share/systemtap/examples/general/py3example.stp was removed
  /usr/share/systemtap/examples/general/tapset was removed
  /usr/share/systemtap/examples/general/tapset/python2_local.stp was removed
  /usr/share/systemtap/examples/general/tapset/python3_local.stp was removed
  /usr/share/systemtap/examples/general/tapset/python_local.stpm was removed
packages/core2-32-poky-linux/systemtap/systemtap-examples: FILELIST: removed "/usr/share/systemtap/examples/general/py3example.stp /usr/share/systemtap/examples/general/tapset/python_local.stpm /usr/share/systemtap/examples/general/py2example.stp /usr/share/systemtap/examples/general/tapset/python3_local.stp /usr/share/systemtap/examples/general/tapset/python2_local.stp", added "/usr/share/systemtap/examples/general/pyexample.stp /usr/share/systemtap/examples/security-band-aids/cve-2016-0728-templatized.stp /usr/share/systemtap/examples/security-band-aids/security-bandaid-template.stp /usr/share/systemtap/examples/security-band-aids/cve-2018-6485-templatized.stp"
packages/core2-32-poky-linux/systemtap/systemtap: FILELIST: added "/usr/share/systemtap/tapset/livepatch.stp"

--===============0787504321700162589==--

