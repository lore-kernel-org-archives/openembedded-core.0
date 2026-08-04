Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3161C55ABA
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 06:24:06 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10869.1785824638804288677
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 23:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KauYf9+f;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=XtIVX7yR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019fcb71732d-bea2fae7-b4a9-4108-ba41-b0e4d3ca8060-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785824637;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uXAH5EMUgUcarlnWkX5hyaAxoFO25m5H6DuuciWJnlw=;
	b=KauYf9+fHesxuSEkpieLo2dHH1IDXZ5UYvgiO60ha7xl869Tn39s6TIYaz1HeL2C
	VgMAx1eG8IQiqi4tJ4w8H1CK1aAHDkNxVrxMPppO07P9BGQ3kLPIlaZak8SnHHNSq0C
	rg8M7ZbxqwxwtDcVwK7jNOaStomVYGVZrVgoRrKU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785824637;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uXAH5EMUgUcarlnWkX5hyaAxoFO25m5H6DuuciWJnlw=;
	b=XtIVX7yRLQNSaAhQeeRCViYq/A6ofGW2RQLDruxXXXhOor6NuSXe6PG04cJzkh6s
	yD90YWA4Il2DBeSamDqwkAHlQVyQZeCtPlnMU6Le1Zf6h1gAnhRryonfDhqLyBWOcy+
	XbC6KovoO6cPoLbc1pDYjkdxaowsq+h4EIFLuwUc=
Content-Type: multipart/mixed; boundary="===============0175293621365522871=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Simone_Wei=C3=9F_=3Csimone=2Ep=2Eweiss=40posteo=2Ecom=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libadwaita: upgrading to 1.9.3 SUCCEEDED
Message-ID: <0101019fcb71732d-bea2fae7-b4a9-4108-ba41-b0e4d3ca8060-000000@us-west-2.amazonses.com>
Date: Tue, 4 Aug 2026 06:23:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.04-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 06:24:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242708

--===============0175293621365522871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpsaWJhZHdhaXRhKiB0byAqMS45LjMqIGhhcyBTdWNjZWVkZWQuCgpOZXh0IHN0ZXBzOgog
ICAgLSBhcHBseSB0aGUgcGF0Y2g6IGdpdCBhbSAwMDAxLWxpYmFkd2FpdGEtdXBncmFkZS0xLjku
Mi0xLjkuMy5wYXRjaAogICAgLSBjaGVjayB0aGUgY2hhbmdlcyB0byB1cHN0cmVhbSBwYXRjaGVz
IGFuZCBzdW1tYXJpemUgdGhlbSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UsCiAgICAtIGNvbXBpbGUg
YW4gaW1hZ2UgdGhhdCBjb250YWlucyB0aGUgcGFja2FnZQogICAgLSBwZXJmb3JtIHNvbWUgYmFz
aWMgc2FuaXR5IHRlc3RzCiAgICAtIGFtZW5kIHRoZSBwYXRjaCBhbmQgc2lnbiBpdCBvZmY6IGdp
dCBjb21taXQgLXMgLS1yZXNldC1hdXRob3IgLS1hbWVuZAogICAgLSBzZW5kIGl0IHRvIHRoZSBh
cHByb3ByaWF0ZSBtYWlsaW5nIGxpc3QKCkFsdGVybmF0aXZlbHksIGlmIHlvdSBiZWxpZXZlIHRo
ZSByZWNpcGUgc2hvdWxkIG5vdCBiZSB1cGdyYWRlZCBhdCB0aGlzIHRpbWUsCnlvdSBjYW4gZmls
bCBSRUNJUEVfTk9fVVBEQVRFX1JFQVNPTiBpbiByZXNwZWN0aXZlIHJlY2lwZSBmaWxlIHNvIHRo
YXQKYXV0b21hdGljIHVwZ3JhZGVzIHdvdWxkIG5vIGxvbmdlciBiZSBhdHRlbXB0ZWQuCgpQbGVh
c2UgcmV2aWV3IHRoZSBhdHRhY2hlZCBmaWxlcyBmb3IgZnVydGhlciBpbmZvcm1hdGlvbiBhbmQg
YnVpbGQvdXBkYXRlIGZhaWx1cmVzLgpBbnkgcHJvYmxlbSBwbGVhc2UgZmlsZSBhIGJ1ZyBhdCBo
dHRwczovL2J1Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcvZW50ZXJfYnVnLmNnaT9wcm9kdWN0PUF1
dG9tYXRlZCUyMFVwZGF0ZSUyMEhhbmRsZXIKClJlZ2FyZHMsClRoZSBVcGdyYWRlIEhlbHBlcgoK
LS0gPjggLS0KRnJvbSAzOTUxYWM3OTJmNzhjZTYwZjcyOWNiZGM1NDY4NmU4MTkzNjc1NzNjIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJv
amVjdC5vcmc+CkRhdGU6IFR1ZSwgNCBBdWcgMjAyNiAwNjoxNTo0MiArMDAwMApTdWJqZWN0OiBb
UEFUQ0hdIGxpYmFkd2FpdGE6IHVwZ3JhZGUgMS45LjIgLT4gMS45LjMKTUlNRS1WZXJzaW9uOiAx
LjAKQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CkNvbnRlbnQtVHJhbnNm
ZXItRW5jb2Rpbmc6IDhiaXQKClNvdXJjZTogTkVXUwoKPT09PT09PT09PT09PQpWZXJzaW9uIDEu
OS4zCj09PT09PT09PT09PT0KCi0gQWR3QWJvdXREaWFsb2cKICAtIEZpeCBhIGJ1ZyB3aXRoIGRl
c2VsZWN0aW5nIHRleHQgaW4gdGhlIGxlZ2FsIHNlY3Rpb24KLSBBZHdTaWRlYmFyCiAgLSBGaXgg
aXRlbSBzdWZmaXhlcyBlbmRpbmcgdXAgYWZ0ZXIgdGhlIGFycm93IGluIHBhZ2UgbW9kZQotIEFk
d1RhYk92ZXJ2aWV3CiAgLSBNYWtlIHN1cmUgd2UgZG9uJ3Qgcm91bmQgY29ybmVycyBpbiBhZGFw
dGl2ZSBwcmV2aWV3Ci0gQWR3V2luZG93L0Fkd0FwcGxpY2F0aW9uV2luZG93CiAgLSBGaXggZmFs
c2UgbWluaW11bSBzaXplIHdhcm5pbmdzIGluIGFkYXB0aXZlIHByZXZpZXcKLSBUcmFuc2xhdGlv
biB1cGRhdGVzCiAgLSBOb3J3ZWdpYW4gQm9rbcOlbAotLS0KIC4uLi9saWJhZHdhaXRhL3tsaWJh
ZHdhaXRhXzEuOS4yLmJiID0+IGxpYmFkd2FpdGFfMS45LjMuYmJ9ICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1nbm9tZS9saWJhZHdhaXRhL3tsaWJhZHdhaXRhXzEuOS4yLmJiID0+IGxpYmFkd2FpdGFf
MS45LjMuYmJ9ICg4OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYmFkd2Fp
dGEvbGliYWR3YWl0YV8xLjkuMi5iYiBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJhZHdhaXRhL2xp
YmFkd2FpdGFfMS45LjMuYmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWdub21lL2xpYmFkd2FpdGEvbGliYWR3YWl0YV8xLjkuMi5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWdub21lL2xpYmFkd2FpdGEvbGliYWR3YWl0YV8xLjkuMy5iYgppbmRleCA5YTQw
YzJlNDE1Li40NzUyMTQ3NDAyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGliYWR3
YWl0YS9saWJhZHdhaXRhXzEuOS4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJhZHdh
aXRhL2xpYmFkd2FpdGFfMS45LjMuYmIKQEAgLTEyLDcgKzEyLDcgQEAgREVQRU5EUyA9ICIgXAog
CiBpbmhlcml0IGdub21lYmFzZSBnb2JqZWN0LWludHJvc3BlY3Rpb24gZ2ktZG9jZ2VuIHZhbGEg
ZmVhdHVyZXNfY2hlY2sKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiNjkyMGY4MTNh
NzZjNDg1NjU5MWNhNTZlZTg0MmU5NGVmYmJlNzM2ZThjYTJmNDQ1YzllOWZjM2I0ZTcwNzZmMCIK
K1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gImZjNTliMzcwMjhmZTAxMjYzMDhlN2I4MDVk
MmY2ZTRlODAyMjcwODBhMTc5NzcxNWU1ZTYyODZiODExMWU3MjMiCiAKIEFOWV9PRl9ESVNUUk9f
RkVBVFVSRVMgPSAiJHtHVEszRElTVFJPRkVBVFVSRVN9IgogUkVRVUlSRURfRElTVFJPX0ZFQVRV
UkVTID0gIm9wZW5nbCIKLS0gCjIuNDcuMQoK

--===============0175293621365522871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="libadwaita-changelog.txt"

Q2hhbmdlbG9nIGZvciBsaWJhZHdhaXRhOiAxLjkuMiAtPiAxLjkuMwpTb3VyY2U6IE5FV1MKCj09
PT09PT09PT09PT0KVmVyc2lvbiAxLjkuMwo9PT09PT09PT09PT09CgotIEFkd0Fib3V0RGlhbG9n
CiAgLSBGaXggYSBidWcgd2l0aCBkZXNlbGVjdGluZyB0ZXh0IGluIHRoZSBsZWdhbCBzZWN0aW9u
Ci0gQWR3U2lkZWJhcgogIC0gRml4IGl0ZW0gc3VmZml4ZXMgZW5kaW5nIHVwIGFmdGVyIHRoZSBh
cnJvdyBpbiBwYWdlIG1vZGUKLSBBZHdUYWJPdmVydmlldwogIC0gTWFrZSBzdXJlIHdlIGRvbid0
IHJvdW5kIGNvcm5lcnMgaW4gYWRhcHRpdmUgcHJldmlldwotIEFkd1dpbmRvdy9BZHdBcHBsaWNh
dGlvbldpbmRvdwogIC0gRml4IGZhbHNlIG1pbmltdW0gc2l6ZSB3YXJuaW5ncyBpbiBhZGFwdGl2
ZSBwcmV2aWV3Ci0gVHJhbnNsYXRpb24gdXBkYXRlcwogIC0gTm9yd2VnaWFuIEJva23DpWwK

--===============0175293621365522871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libadwaita: SRC_URI changed from "https://download.gnome.org/sources//libadwaita/1.9/libadwaita-1.9.2.tar.xz;name=archive" to "https://download.gnome.org/sources//libadwaita/1.9/libadwaita-1.9.3.tar.xz;name=archive"
packages/x86-64-v3-poky-linux/libadwaita: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dbg: PKGSIZE changed from 6411064 to 6412864 (+0%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dbg: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dbg: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dev: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dev: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-doc: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-doc: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ab: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ab: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-be: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-be: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-bg: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-bg: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ca: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ca: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-cs: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-cs: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-da: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-da: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-de: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-de: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-el: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-el: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-en-gb: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-en-gb: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-eo: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-eo: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-es: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-es: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-eu: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-eu: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fa: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fa: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fi: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fi: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fil: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fil: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fr: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fr: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fur: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fur: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-gl: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-gl: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-he: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-he: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hi: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hi: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hr: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hr: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hu: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hu: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ia: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ia: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-id: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-id: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-it: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-it: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ja: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ja: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ka: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ka: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-kab: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-kab: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-kk: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-kk: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ko: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ko: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-lt: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-lt: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-lv: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-lv: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nb: PKGSIZE changed from 9731 to 9733 (+0%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nb: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nb: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ne: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ne: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nl: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nl: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nn: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nn: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-oc: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-oc: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pa: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pa: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pl: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pl: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pt-br: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pt-br: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pt: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pt: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ro: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ro: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ru: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ru: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sk: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sk: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sl: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sl: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sr+latin: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sr+latin: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sr: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sr: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sv: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sv: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-th: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-th: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-tr: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-tr: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ug: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ug: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-uk: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-uk: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-uz: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-uz: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-vi: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-vi: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-zh-cn: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-zh-cn: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-zh-tw: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-zh-tw: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-src: PKGSIZE changed from 7811796 to 7813132 (+0%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-src: FILELIST: directory renamed /usr/src/debug/libadwaita/1.9.2/src/stylesheet -> /usr/src/debug/libadwaita/1.9.3/src/stylesheet, directory renamed /usr/src/debug/libadwaita/1.9.2/src -> /usr/src/debug/libadwaita/1.9.3/src
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-src: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-src: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-staticdev: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-staticdev: PV changed from "1.9.2" to "1.9.3"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita: PV changed from "1.9.2" to "1.9.3"

--===============0175293621365522871==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libadwaita-upgrade-1.9.2-1.9.3.patch"

RnJvbSAzOTUxYWM3OTJmNzhjZTYwZjcyOWNiZGM1NDY4NmU4MTkzNjc1NzNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgNCBBdWcgMjAyNiAwNjoxNTo0MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmFkd2FpdGE6IHVwZ3JhZGUgMS45LjIgLT4gMS45LjMKTUlNRS1WZXJzaW9uOiAxLjAKQ29udGVu
dC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CkNvbnRlbnQtVHJhbnNmZXItRW5jb2Rp
bmc6IDhiaXQKClNvdXJjZTogTkVXUwoKPT09PT09PT09PT09PQpWZXJzaW9uIDEuOS4zCj09PT09
PT09PT09PT0KCi0gQWR3QWJvdXREaWFsb2cKICAtIEZpeCBhIGJ1ZyB3aXRoIGRlc2VsZWN0aW5n
IHRleHQgaW4gdGhlIGxlZ2FsIHNlY3Rpb24KLSBBZHdTaWRlYmFyCiAgLSBGaXggaXRlbSBzdWZm
aXhlcyBlbmRpbmcgdXAgYWZ0ZXIgdGhlIGFycm93IGluIHBhZ2UgbW9kZQotIEFkd1RhYk92ZXJ2
aWV3CiAgLSBNYWtlIHN1cmUgd2UgZG9uJ3Qgcm91bmQgY29ybmVycyBpbiBhZGFwdGl2ZSBwcmV2
aWV3Ci0gQWR3V2luZG93L0Fkd0FwcGxpY2F0aW9uV2luZG93CiAgLSBGaXggZmFsc2UgbWluaW11
bSBzaXplIHdhcm5pbmdzIGluIGFkYXB0aXZlIHByZXZpZXcKLSBUcmFuc2xhdGlvbiB1cGRhdGVz
CiAgLSBOb3J3ZWdpYW4gQm9rbcOlbAotLS0KIC4uLi9saWJhZHdhaXRhL3tsaWJhZHdhaXRhXzEu
OS4yLmJiID0+IGxpYmFkd2FpdGFfMS45LjMuYmJ9ICAgICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1nbm9t
ZS9saWJhZHdhaXRhL3tsaWJhZHdhaXRhXzEuOS4yLmJiID0+IGxpYmFkd2FpdGFfMS45LjMuYmJ9
ICg4OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYmFkd2FpdGEvbGliYWR3
YWl0YV8xLjkuMi5iYiBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJhZHdhaXRhL2xpYmFkd2FpdGFf
MS45LjMuYmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdu
b21lL2xpYmFkd2FpdGEvbGliYWR3YWl0YV8xLjkuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWdub21lL2xpYmFkd2FpdGEvbGliYWR3YWl0YV8xLjkuMy5iYgppbmRleCA5YTQwYzJlNDE1Li40
NzUyMTQ3NDAyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGliYWR3YWl0YS9saWJh
ZHdhaXRhXzEuOS4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJhZHdhaXRhL2xpYmFk
d2FpdGFfMS45LjMuYmIKQEAgLTEyLDcgKzEyLDcgQEAgREVQRU5EUyA9ICIgXAogCiBpbmhlcml0
IGdub21lYmFzZSBnb2JqZWN0LWludHJvc3BlY3Rpb24gZ2ktZG9jZ2VuIHZhbGEgZmVhdHVyZXNf
Y2hlY2sKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiNjkyMGY4MTNhNzZjNDg1NjU5
MWNhNTZlZTg0MmU5NGVmYmJlNzM2ZThjYTJmNDQ1YzllOWZjM2I0ZTcwNzZmMCIKK1NSQ19VUklb
YXJjaGl2ZS5zaGEyNTZzdW1dID0gImZjNTliMzcwMjhmZTAxMjYzMDhlN2I4MDVkMmY2ZTRlODAy
MjcwODBhMTc5NzcxNWU1ZTYyODZiODExMWU3MjMiCiAKIEFOWV9PRl9ESVNUUk9fRkVBVFVSRVMg
PSAiJHtHVEszRElTVFJPRkVBVFVSRVN9IgogUkVRVUlSRURfRElTVFJPX0ZFQVRVUkVTID0gIm9w
ZW5nbCIKLS0gCjIuNDcuMQoK

--===============0175293621365522871==--

