Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9923EC5478D
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:31 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.20157.1708018344555640532
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=A8XSbVI0;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=oMDByLrp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018dadd3ac25-68b3f777-a66d-4971-82ee-0434de751671-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018347;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wmtyu4TzvpLfVhVo6dvS9SHNGh1Chj2X40VzpbMgcuk=;
	b=A8XSbVI0kzyypk0bEMcV12RgMgIEgO9h6tm7R33ub8PtP2NS8woBYlzdcEd9BQlB
	96aH++ut5U0+B/01qxImFpgpXhY30KEJ4lMWWuN93vwaPOtIv9J02nQ5BlQePFEOefV
	P0KgOlqVrC+XRcE2DpMEPlB430AdYxImJUw2+T+U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018347;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wmtyu4TzvpLfVhVo6dvS9SHNGh1Chj2X40VzpbMgcuk=;
	b=oMDByLrpLHPT6C+uc8OXD1ze3qu31xgGoWx3GciAP3wHYB4va+OgK8tYuKUNTA1w
	mJzVfCHQ16X+gVno0k4ldiD8zEspLVOskqwDLwcI9EOf8Vr7ZlS/+qeEnI60rEvpcfN
	F/4qxb+7hO358JY7xxUY1maVypQzk8yX2frz/e2U=
Content-Type: multipart/mixed; boundary="===============7144792071270838838=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to 7a93ae5d3c90cb5d1d8d775a8cd9d30bc745f658
 SUCCEEDED
Message-ID: <0101018dadd3ac25-68b3f777-a66d-4971-82ee-0434de751671-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:27 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195663

--===============7144792071270838838==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
ICpwdXp6bGVzKiB0byAqN2E5M2FlNWQzYzkwY2I1ZDFkOGQ3NzVhOGNkOWQzMGJjNzQ1ZjY1OCog
aGFzIFN1Y2NlZWRlZC4KCk5leHQgc3RlcHM6CiAgICAtIGFwcGx5IHRoZSBwYXRjaDogZ2l0IGFt
IDAwMDEtcHV6emxlcy11cGdyYWRlLXRvLWxhdGVzdC1yZXZpc2lvbi5wYXRjaAogICAgLSBjaGVj
ayB0aGUgY2hhbmdlcyB0byB1cHN0cmVhbSBwYXRjaGVzIGFuZCBzdW1tYXJpemUgdGhlbSBpbiB0
aGUgY29tbWl0IG1lc3NhZ2UsCiAgICAtIGNvbXBpbGUgYW4gaW1hZ2UgdGhhdCBjb250YWlucyB0
aGUgcGFja2FnZQogICAgLSBwZXJmb3JtIHNvbWUgYmFzaWMgc2FuaXR5IHRlc3RzCiAgICAtIGFt
ZW5kIHRoZSBwYXRjaCBhbmQgc2lnbiBpdCBvZmY6IGdpdCBjb21taXQgLXMgLS1yZXNldC1hdXRo
b3IgLS1hbWVuZAogICAgLSBzZW5kIGl0IHRvIHRoZSBhcHByb3ByaWF0ZSBtYWlsaW5nIGxpc3QK
CkFsdGVybmF0aXZlbHksIGlmIHlvdSBiZWxpZXZlIHRoZSByZWNpcGUgc2hvdWxkIG5vdCBiZSB1
cGdyYWRlZCBhdCB0aGlzIHRpbWUsCnlvdSBjYW4gZmlsbCBSRUNJUEVfTk9fVVBEQVRFX1JFQVNP
TiBpbiByZXNwZWN0aXZlIHJlY2lwZSBmaWxlIHNvIHRoYXQKYXV0b21hdGljIHVwZ3JhZGVzIHdv
dWxkIG5vIGxvbmdlciBiZSBhdHRlbXB0ZWQuCgpQbGVhc2UgcmV2aWV3IHRoZSBhdHRhY2hlZCBm
aWxlcyBmb3IgZnVydGhlciBpbmZvcm1hdGlvbiBhbmQgYnVpbGQvdXBkYXRlIGZhaWx1cmVzLgpB
bnkgcHJvYmxlbSBwbGVhc2UgZmlsZSBhIGJ1ZyBhdCBodHRwczovL2J1Z3ppbGxhLnlvY3RvcHJv
amVjdC5vcmcvZW50ZXJfYnVnLmNnaT9wcm9kdWN0PUF1dG9tYXRlZCUyMFVwZGF0ZSUyMEhhbmRs
ZXIKClJlZ2FyZHMsClRoZSBVcGdyYWRlIEhlbHBlcgoKLS0gPjggLS0KRnJvbSA1ODFlZmM0ZWY2
ZjUyNDcwZGFjYzY0NmVjYzhhMzNjNDY4NDg3MzU2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpG
cm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+CkRhdGU6IFRodSwgMTUg
RmViIDIwMjQgMTU6MjU6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBwdXp6bGVzOiB1cGdyYWRl
IHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtc2F0by9wdXp6bGVzL3B1enps
ZXNfZ2l0LmJiIHwgMjMgKysrKysrKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
MSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1zYXRvL3B1enpsZXMvcHV6emxlc19naXQuYmIgYi9tZXRhL3JlY2lwZXMtc2F0by9wdXp6bGVz
L3B1enpsZXNfZ2l0LmJiCmluZGV4IGFiNGIyMzk0YjguLjYxMDE2MzVmNTYgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6emxlc19naXQuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dpdC5iYgpAQCAtMSw4ICsxLDI3IEBACisjIEZJWE1F
OiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRv
b2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0
aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElD
RU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhl
IGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAn
TGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFu
Z2VzOgorIworIyAtLS0gTElDRU5DRQorIyArKysgTElDRU5DRQorIyBAQCAtMSw0ICsxLDQgQEAK
KyMgLVRoaXMgc29mdHdhcmUgaXMgY29weXJpZ2h0IChjKSAyMDA0LTIwMjMgU2ltb24gVGF0aGFt
LgorIyArVGhpcyBzb2Z0d2FyZSBpcyBjb3B5cmlnaHQgKGMpIDIwMDQtMjAyNCBTaW1vbiBUYXRo
YW0uCisjICAKKyMgIFBvcnRpb25zIGNvcHlyaWdodCBSaWNoYXJkIEJvdWx0b24sIEphbWVzIEhh
cnZleSwgTWlrZSBQaW5uYSwgSm9uYXMKKyMgIEvDtmxrZXIsIERhcml1c3ogT2xzemV3c2tpLCBN
aWNoYWVsIFNjaGllcmwsIExhbWJyb3MgTGFtYnJvdSwgQmVybmQKKyMgCisjCisKIFNVTU1BUlkg
PSAiU2ltb24gVGF0aGFtJ3MgUG9ydGFibGUgUHV6emxlIENvbGxlY3Rpb24iCiBERVNDUklQVElP
TiA9ICJDb2xsZWN0aW9uIG9mIHNtYWxsIGNvbXB1dGVyIHByb2dyYW1zIHdoaWNoIGltcGxlbWVu
dCBvbmUtcGxheWVyIHB1enpsZSBnYW1lcy4iCiBIT01FUEFHRSA9ICJodHRwOi8vd3d3LmNoaWFy
ay5ncmVlbmVuZC5vcmcudWsvfnNndGF0aGFtL3B1enpsZXMvIgogTElDRU5TRSA9ICJNSVQiCi1M
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTkNFO21kNT05MmQyYjdhMmZjOTZiNWY3ZjE3
MTAxZGY3ZGIxZmVmYSIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOQ0U7bWQ1PTE5
MTU0MmIzMjM3N2JkZTI1NGU5Nzk5ZTBhNDZmMThiIgogCiAjIGd0ayBzdXBwb3J0IGluY2x1ZGVz
IGEgYnVuY2ggb2YgeDExIGhlYWRlcnMKIFJFUVVJUkVEX0RJU1RST19GRUFUVVJFUyA9ICJ4MTEi
CkBAIC0xMCw3ICsyOSw3IEBAIFJFUVVJUkVEX0RJU1RST19GRUFUVVJFUyA9ICJ4MTEiCiBTUkNf
VVJJID0gImdpdDovL2dpdC50YXJ0YXJ1cy5vcmcvc2ltb24vcHV6emxlcy5naXQ7YnJhbmNoPW1h
aW47cHJvdG9jb2w9aHR0cHMiCiAKIFVQU1RSRUFNX0NIRUNLX0NPTU1JVFMgPSAiMSIKLVNSQ1JF
ViA9ICIwODM2NWZiMjYwYWU2ZTMyNDQyZGQ5ZjE5NmU2NWQxM2ZhY2I0YjMzIgorU1JDUkVWID0g
IjdhOTNhZTVkM2M5MGNiNWQxZDhkNzc1YThjZDlkMzBiYzc0NWY2NTgiCiBQRSA9ICIyIgogUFYg
PSAiMC4wK2dpdCIKIAotLSAKMi40Mi4wCgo=

--===============7144792071270838838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-dev: RRECOMMENDS: removed "puzzles (['= 2:0.0+git0+08365fb260-r0'])", added "puzzles (['= 2:0.0+git0+7a93ae5d3c-r0'])"
packages/core2-64-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3838531 to 3838603 (+0%)
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+08365fb260-r0'])", added "puzzles-dev (['= 2:0.0+git0+7a93ae5d3c-r0'])"
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c

--===============7144792071270838838==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSA1ODFlZmM0ZWY2ZjUyNDcwZGFjYzY0NmVjYzhhMzNjNDY4NDg3MzU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMTU6MjU6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
dXp6bGVzOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtc2F0
by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiIHwgMjMgKysrKysrKysrKysrKysrKysrKysrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6emxlc19naXQuYmIgYi9tZXRhL3JlY2lw
ZXMtc2F0by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiCmluZGV4IGFiNGIyMzk0YjguLjYxMDE2MzVm
NTYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6emxlc19naXQuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dpdC5iYgpAQCAtMSw4ICsx
LDI3IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVw
ZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZl
cmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNl
IHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNo
YW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcu
CisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicp
CisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5DRQorIyArKysgTElDRU5DRQorIyBA
QCAtMSw0ICsxLDQgQEAKKyMgLVRoaXMgc29mdHdhcmUgaXMgY29weXJpZ2h0IChjKSAyMDA0LTIw
MjMgU2ltb24gVGF0aGFtLgorIyArVGhpcyBzb2Z0d2FyZSBpcyBjb3B5cmlnaHQgKGMpIDIwMDQt
MjAyNCBTaW1vbiBUYXRoYW0uCisjICAKKyMgIFBvcnRpb25zIGNvcHlyaWdodCBSaWNoYXJkIEJv
dWx0b24sIEphbWVzIEhhcnZleSwgTWlrZSBQaW5uYSwgSm9uYXMKKyMgIEvDtmxrZXIsIERhcml1
c3ogT2xzemV3c2tpLCBNaWNoYWVsIFNjaGllcmwsIExhbWJyb3MgTGFtYnJvdSwgQmVybmQKKyMg
CisjCisKIFNVTU1BUlkgPSAiU2ltb24gVGF0aGFtJ3MgUG9ydGFibGUgUHV6emxlIENvbGxlY3Rp
b24iCiBERVNDUklQVElPTiA9ICJDb2xsZWN0aW9uIG9mIHNtYWxsIGNvbXB1dGVyIHByb2dyYW1z
IHdoaWNoIGltcGxlbWVudCBvbmUtcGxheWVyIHB1enpsZSBnYW1lcy4iCiBIT01FUEFHRSA9ICJo
dHRwOi8vd3d3LmNoaWFyay5ncmVlbmVuZC5vcmcudWsvfnNndGF0aGFtL3B1enpsZXMvIgogTElD
RU5TRSA9ICJNSVQiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTkNFO21kNT05MmQy
YjdhMmZjOTZiNWY3ZjE3MTAxZGY3ZGIxZmVmYSIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0xJQ0VOQ0U7bWQ1PTE5MTU0MmIzMjM3N2JkZTI1NGU5Nzk5ZTBhNDZmMThiIgogCiAjIGd0ayBz
dXBwb3J0IGluY2x1ZGVzIGEgYnVuY2ggb2YgeDExIGhlYWRlcnMKIFJFUVVJUkVEX0RJU1RST19G
RUFUVVJFUyA9ICJ4MTEiCkBAIC0xMCw3ICsyOSw3IEBAIFJFUVVJUkVEX0RJU1RST19GRUFUVVJF
UyA9ICJ4MTEiCiBTUkNfVVJJID0gImdpdDovL2dpdC50YXJ0YXJ1cy5vcmcvc2ltb24vcHV6emxl
cy5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHMiCiAKIFVQU1RSRUFNX0NIRUNLX0NPTU1J
VFMgPSAiMSIKLVNSQ1JFViA9ICIwODM2NWZiMjYwYWU2ZTMyNDQyZGQ5ZjE5NmU2NWQxM2ZhY2I0
YjMzIgorU1JDUkVWID0gIjdhOTNhZTVkM2M5MGNiNWQxZDhkNzc1YThjZDlkMzBiYzc0NWY2NTgi
CiBQRSA9ICIyIgogUFYgPSAiMC4wK2dpdCIKIAotLSAKMi40Mi4wCgo=

--===============7144792071270838838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-dev: RRECOMMENDS: removed "puzzles (['= 2:0.0+git0+08365fb260-r0'])", added "puzzles (['= 2:0.0+git0+7a93ae5d3c-r0'])"
packages/core2-64-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+08365fb260-r0'])", added "puzzles-dev (['= 2:0.0+git0+7a93ae5d3c-r0'])"
packages/core2-64-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+08365fb260 to 0.0+git0+7a93ae5d3c

--===============7144792071270838838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1858 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (913 cached, 1 parsed). 1857 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-b7e29840db99b212fea1b1aa2367fe2a98d07755"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:b7e29840db99b212fea1b1aa2367fe2a98d07755"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 431 Local 421 Mirrors 0 Missed 10 Current 629 (97% match, 99% complete)
Removing 10 stale sstate objects for arch core2-64...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 757 of 1060 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic_setscene)
NOTE: Running setscene task 759 of 1060 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_lic_setscene: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_lic_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2594 of 2935 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+git-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_fetch: Succeeded
NOTE: Running task 2916 of 2935 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: Running task 2917 of 2935 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+git-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_unpack: Succeeded
NOTE: Running task 2918 of 2935 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: Running task 2919 of 2935 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+git-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_patch: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2921 of 2935 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: recipe puzzles-2_0.0+git-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2923 of 2935 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+git-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_configure: Succeeded
NOTE: Running task 2924 of 2935 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+git-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_compile: Succeeded
NOTE: Running task 2925 of 2935 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+git-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_install: Succeeded
NOTE: Running task 2926 of 2935 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2927 of 2935 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot unihash changed to f192b9149b493ab4f32847e8f715444834da1eb5e70893af056e35916b8fe547
NOTE: recipe puzzles-2_0.0+git-r0: task do_package: Succeeded
NOTE: Running task 2928 of 2935 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+git-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2928 tasks of which 2916 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240215152413.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240215152413.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-src went backwards which would break package feeds (from 2:0.0+git0+08365fb260-r0 to 2:0.0+git0+7a93ae5d3c-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-dbg went backwards which would break package feeds (from 2:0.0+git0+08365fb260-r0 to 2:0.0+git0+7a93ae5d3c-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-staticdev went backwards which would break package feeds (from 2:0.0+git0+08365fb260-r0 to 2:0.0+git0+7a93ae5d3c-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-dev went backwards which would break package feeds (from 2:0.0+git0+08365fb260-r0 to 2:0.0+git0+7a93ae5d3c-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-doc went backwards which would break package feeds (from 2:0.0+git0+08365fb260-r0 to 2:0.0+git0+7a93ae5d3c-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-locale went backwards which would break package feeds (from 2:0.0+git0+08365fb260-r0 to 2:0.0+git0+7a93ae5d3c-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles went backwards which would break package feeds (from 2:0.0+git0+08365fb260-r0 to 2:0.0+git0+7a93ae5d3c-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/puzzles/0.0+git/temp/log.do_packagedata.419190
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata) failed with exit code '1'

--===============7144792071270838838==--

