Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA94CD4F5E
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:34 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34755.1778851226141477919
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=V5i0mwhy;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=SKj01bhO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019e2bcb9ebe-99b21e3b-835c-48e9-a05d-3596f29e500c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851225;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JYFBKSx/UzpiOfTo4S2uxbmzcGGx4tiTCFxho2F8D+Q=;
	b=V5i0mwhymQLLEUUFzg4hAeRcXMF6ay4n+OFsf7Fj2AlOETsAQr0SLE/BG/axzyEc
	I1NnKgPKON5l/rlsvIbayL7V808SzB6GOoavTlbPNTODoxTj4lMtiJn5Rdgooh8hExK
	1PEpfJufNM7iMDjGD3tgwoSRIV60ZWwd+k1IdvZc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851225;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JYFBKSx/UzpiOfTo4S2uxbmzcGGx4tiTCFxho2F8D+Q=;
	b=SKj01bhOS2FORMZfH1t8QBbbeSdxVnk/K4nGNGfVz/7/SITZ7cpTuTR9ucDEjBd+
	qqBDeJYySZVpULh2DSLnzMqPJXicFMxETlQokL11FdhfGNXfM52khT93APC5MomE7nL
	iRwNj8eF94zpgU9uxHW/EWt1N6AmygZw+MkAScl0=
Content-Type: multipart/mixed; boundary="===============6732039759464361137=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xrandr,mkfontscale: upgrading to 1.5.4,1.2.4 SUCCEEDED
Message-ID: <0101019e2bcb9ebe-99b21e3b-835c-48e9-a05d-3596f29e500c-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237097

--===============6732039759464361137==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICp4cmFuZHIsbWtmb250c2NhbGUqIHRvICoxLjUuNCwxLjIuNCogaGFzIFN1Y2NlZWRlZC4K
Ck5leHQgc3RlcHM6CiAgICAtIGFwcGx5IHRoZSBwYXRjaDogZ2l0IGFtIDAwMDEteHJhbmRyLW1r
Zm9udHNjYWxlLXVwZ3JhZGUtMS41LjMtMS41LjQtMS4yLjMtMS4yLjQucGF0Y2gKICAgIC0gY2hl
Y2sgdGhlIGNoYW5nZXMgdG8gdXBzdHJlYW0gcGF0Y2hlcyBhbmQgc3VtbWFyaXplIHRoZW0gaW4g
dGhlIGNvbW1pdCBtZXNzYWdlLAogICAgLSBjb21waWxlIGFuIGltYWdlIHRoYXQgY29udGFpbnMg
dGhlIHBhY2thZ2UKICAgIC0gcGVyZm9ybSBzb21lIGJhc2ljIHNhbml0eSB0ZXN0cwogICAgLSBh
bWVuZCB0aGUgcGF0Y2ggYW5kIHNpZ24gaXQgb2ZmOiBnaXQgY29tbWl0IC1zIC0tcmVzZXQtYXV0
aG9yIC0tYW1lbmQKICAgIC0gc2VuZCBpdCB0byB0aGUgYXBwcm9wcmlhdGUgbWFpbGluZyBsaXN0
CgpBbHRlcm5hdGl2ZWx5LCBpZiB5b3UgYmVsaWV2ZSB0aGUgcmVjaXBlIHNob3VsZCBub3QgYmUg
dXBncmFkZWQgYXQgdGhpcyB0aW1lLAp5b3UgY2FuIGZpbGwgUkVDSVBFX05PX1VQREFURV9SRUFT
T04gaW4gcmVzcGVjdGl2ZSByZWNpcGUgZmlsZSBzbyB0aGF0CmF1dG9tYXRpYyB1cGdyYWRlcyB3
b3VsZCBubyBsb25nZXIgYmUgYXR0ZW1wdGVkLgoKUGxlYXNlIHJldmlldyB0aGUgYXR0YWNoZWQg
ZmlsZXMgZm9yIGZ1cnRoZXIgaW5mb3JtYXRpb24gYW5kIGJ1aWxkL3VwZGF0ZSBmYWlsdXJlcy4K
QW55IHByb2JsZW0gcGxlYXNlIGZpbGUgYSBidWcgYXQgaHR0cHM6Ly9idWd6aWxsYS55b2N0b3By
b2plY3Qub3JnL2VudGVyX2J1Zy5jZ2k/cHJvZHVjdD1BdXRvbWF0ZWQlMjBVcGRhdGUlMjBIYW5k
bGVyCgpSZWdhcmRzLApUaGUgVXBncmFkZSBIZWxwZXIKCi0tID44IC0tCkZyb20gMzE5OTU4NjI0
OGFkNjM5YTkzYmRkM2RjOGIwOTg3ZjAwZTQ5OTY5NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
RnJvbTogVXBncmFkZSBIZWxwZXIgPGF1aEB5b2N0b3Byb2plY3Qub3JnPgpEYXRlOiBGcmksIDE1
IE1heSAyMDI2IDA2OjE4OjMyICswMDAwClN1YmplY3Q6IFtQQVRDSF0geHJhbmRyLG1rZm9udHNj
YWxlOiB1cGdyYWRlIDEuNS4zIC0+IDEuNS40LDEuMi4zIC0+IDEuMi40CgotLS0KIC4uLm9udHNj
YWxlXzEuMi4zLmJiID0+IG1rZm9udHNjYWxlXzEuMi40LmJifSB8ICAyICstCiAuLi4ve3hyYW5k
cl8xLjUuMy5iYiA9PiB4cmFuZHJfMS41LjQuYmJ9ICAgICAgfCAyNiArKysrKysrKysrKysrKysr
Ky0tCiAyIGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3tta2ZvbnRzY2FsZV8xLjIuMy5i
YiA9PiBta2ZvbnRzY2FsZV8xLjIuNC5iYn0gKDg4JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MveG9yZy1hcHAve3hyYW5kcl8xLjUuMy5iYiA9PiB4cmFuZHJfMS41LjQuYmJ9ICgyNyUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL21rZm9udHNjYWxl
XzEuMi4zLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL21rZm9udHNjYWxlXzEu
Mi40LmJiCnNpbWlsYXJpdHkgaW5kZXggODglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy94b3JnLWFwcC9ta2ZvbnRzY2FsZV8xLjIuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3hvcmctYXBwL21rZm9udHNjYWxlXzEuMi40LmJiCmluZGV4IGFhNzk5MDJhMzQu
LjQyODY3ZGI2NWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC9t
a2ZvbnRzY2FsZV8xLjIuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAv
bWtmb250c2NhbGVfMS4yLjQuYmIKQEAgLTE4LDQgKzE4LDQgQEAgQkJDTEFTU0VYVEVORCA9ICJu
YXRpdmUiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT01YTYwYzU5NmQx
YjVmM2RlZTlmMDA1YjcwM2IzMTgwZCIKIAogU1JDX1VSSV9FWFQgPSAieHoiCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiMjkyMWNkYzM0NGYxYWNlZTA0YmNkNmVhMWUyOTU2NWMxMzA4MjYzMDA2ZTEz
NGE5ZWUzOGNmOWM5ZDZmZTc1ZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhMDE0OTJhMTdhOWI2
YzBlZTNmOTJlZTU3ODg1MGUzMDUzMTViOWYyOThkYTVmMDA2YTFjZDRiNTFkYjAxYTVlIgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hyYW5kcl8xLjUuMy5iYiBi
L21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94cmFuZHJfMS41LjQuYmIKc2ltaWxhcml0
eSBpbmRleCAyNyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hy
YW5kcl8xLjUuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hy
YW5kcl8xLjUuNC5iYgppbmRleCA3NTY1NmFmOWVhLi44YjU4MWYxMTNhIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveHJhbmRyXzEuNS4zLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94cmFuZHJfMS41LjQuYmIKQEAgLTEsMyArMSwyNSBA
QAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVk
IGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNl
IGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRh
dGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2Vz
IGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAo
ZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIwor
IyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIENPUFlJTkcKKyMgKysrIENPUFlJTkcKKyMgQEAgLTEs
NiArMSw4IEBACisjICBDb3B5cmlnaHQgwqkgMjAwMSBLZWl0aCBQYWNrYXJkLCBtZW1iZXIgb2Yg
VGhlIFhGcmVlODYgUHJvamVjdCwgSW5jLgorIyAgQ29weXJpZ2h0IMKpIDIwMDIgSGV3bGV0dCBQ
YWNrYXJkIENvbXBhbnksIEluYy4KKyMgIENvcHlyaWdodCDCqSAyMDA2IEludGVsIENvcnBvcmF0
aW9uCisjICtDb3B5cmlnaHQgwqkgMjAwOCBLZWl0aCBQYWNrYXJkCisjICtDb3B5cmlnaHQgwqkg
MjAxMyBOVklESUEgQ29ycG9yYXRpb24KKyMgIAorIyAgUGVybWlzc2lvbiB0byB1c2UsIGNvcHks
IG1vZGlmeSwgZGlzdHJpYnV0ZSwgYW5kIHNlbGwgdGhpcyBzb2Z0d2FyZSBhbmQgaXRzCisjICBk
b2N1bWVudGF0aW9uIGZvciBhbnkgcHVycG9zZSBpcyBoZXJlYnkgZ3JhbnRlZCB3aXRob3V0IGZl
ZSwgcHJvdmlkZWQgdGhhdAorIyAKKyMKKwogcmVxdWlyZSB4b3JnLWFwcC1jb21tb24uaW5jCiAK
IFNVTU1BUlkgPSAiWFJhbmRSOiBYIFJlc2l6ZSwgUm90YXRlIGFuZCBSZWZsZWN0IGV4dGVuc2lv
biBjb21tYW5kIgpAQCAtNywxMSArMjksMTEgQEAgcmVmbGVjdGlvbiBvZiB0aGUgb3V0cHV0cyBm
b3IgYSBzY3JlZW4uIEl0IGNhbiBhbHNvIHNldCB0aGUgc2NyZWVuIFwKIHNpemUuIgogCiBMSUNF
TlNFID0gIk1JVCIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWZlMTYw
OGJkYjMzY2Y4YzYyYTQ0MzhmN2QzNDY3OWIzIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
Q09QWUlORzttZDU9OTdhMzZkNWM2Njk2NWIxY2VhNDY2NmIzNzA4Y2E2ZTgiCiBERVBFTkRTICs9
ICJsaWJ4cmFuZHIgbGlieHJlbmRlciIKIFBFID0gIjEiCiAKIFNSQ19VUklfRVhUID0gInh6Igot
U1JDX1VSSVtzaGEyNTZzdW1dID0gImY4ZGQ3NTY2YWRiNzQxNDdmYWI5OTY0NjgwYjZiYmFkZWU4
N2NmNDA2YTdmY2ZmNTE3MThhNWU2OTQ5Yjg0MWMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMmNh
ZmNjYjJhYWYyNDkxYTQwNjg2NzYxMTdhMGQ0ZjkwYWIzMDc3MjRiOTZmZmZjNTRjZDFkYTk1Mzc3
OTQwMCIKIAogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgotLSAKMi40Ny4xCgo=

--===============6732039759464361137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/mkfontscale: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/x86-64-v3-poky-linux/mkfontscale: SRC_URI changed from "https://www.x.org/releases//individual/app/mkfontscale-1.2.3.tar.xz" to "https://www.x.org/releases//individual/app/mkfontscale-1.2.4.tar.xz"
packages/x86-64-v3-poky-linux/mkfontscale: PV changed from "1.2.3" to "1.2.4"
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-dbg: PKGSIZE changed from 105272 to 105536 (+0%)
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-dbg: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-dbg: PV changed from "1.2.3" to "1.2.4"
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-dev: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-dev: PV changed from "1.2.3" to "1.2.4"
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-doc: PKGSIZE changed from 10302 to 10284 (-0%)
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-doc: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-doc: PV changed from "1.2.3" to "1.2.4"
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-locale: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-locale: PV changed from "1.2.3" to "1.2.4"
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-src: FILELIST: directory renamed /usr/src/debug/mkfontscale/1.2.3 -> /usr/src/debug/mkfontscale/1.2.4
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-src: PKGSIZE changed from 74994 to 75264 (+0%)
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-src: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-src: PV changed from "1.2.3" to "1.2.4"
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-staticdev: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-staticdev: PV changed from "1.2.3" to "1.2.4"
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale: PV changed from "1.2.3" to "1.2.4"
packages/x86-64-v3-poky-linux/xrandr: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/x86-64-v3-poky-linux/xrandr: SRC_URI changed from "https://www.x.org/releases//individual/app/xrandr-1.5.3.tar.xz" to "https://www.x.org/releases//individual/app/xrandr-1.5.4.tar.xz"
packages/x86-64-v3-poky-linux/xrandr: PV changed from "1.5.3" to "1.5.4"
packages/x86-64-v3-poky-linux/xrandr/xrandr-dbg: PKGSIZE changed from 195296 to 196192 (+0%)
packages/x86-64-v3-poky-linux/xrandr/xrandr-dbg: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/x86-64-v3-poky-linux/xrandr/xrandr-dbg: PV changed from "1.5.3" to "1.5.4"
packages/x86-64-v3-poky-linux/xrandr/xrandr-dev: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/x86-64-v3-poky-linux/xrandr/xrandr-dev: PV changed from "1.5.3" to "1.5.4"
packages/x86-64-v3-poky-linux/xrandr/xrandr-doc: PKGSIZE changed from 18402 to 20292 (+10%)
packages/x86-64-v3-poky-linux/xrandr/xrandr-doc: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/x86-64-v3-poky-linux/xrandr/xrandr-doc: PV changed from "1.5.3" to "1.5.4"
packages/x86-64-v3-poky-linux/xrandr/xrandr-locale: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/x86-64-v3-poky-linux/xrandr/xrandr-locale: PV changed from "1.5.3" to "1.5.4"
packages/x86-64-v3-poky-linux/xrandr/xrandr-src: FILELIST: directory renamed /usr/src/debug/xrandr/1.5.3 -> /usr/src/debug/xrandr/1.5.4
packages/x86-64-v3-poky-linux/xrandr/xrandr-src: PKGSIZE changed from 111036 to 111623 (+1%)
packages/x86-64-v3-poky-linux/xrandr/xrandr-src: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/x86-64-v3-poky-linux/xrandr/xrandr-src: PV changed from "1.5.3" to "1.5.4"
packages/x86-64-v3-poky-linux/xrandr/xrandr-staticdev: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/x86-64-v3-poky-linux/xrandr/xrandr-staticdev: PV changed from "1.5.3" to "1.5.4"
packages/x86-64-v3-poky-linux/xrandr/xrandr: PKGSIZE changed from 80606 to 80578 (-0%)
packages/x86-64-v3-poky-linux/xrandr/xrandr: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/x86-64-v3-poky-linux/xrandr/xrandr: PV changed from "1.5.3" to "1.5.4"

--===============6732039759464361137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/xrandr/xrandr-doc: PKGSIZE changed from 18402 to 20292 (+10%)

--===============6732039759464361137==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xrandr-mkfontscale-upgrade-1.5.3-1.5.4-1.2.3-1.2.4.patch"

RnJvbSAzMTk5NTg2MjQ4YWQ2MzlhOTNiZGQzZGM4YjA5ODdmMDBlNDk5Njk3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMDY6MTg6MzIgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
cmFuZHIsbWtmb250c2NhbGU6IHVwZ3JhZGUgMS41LjMgLT4gMS41LjQsMS4yLjMgLT4gMS4yLjQK
Ci0tLQogLi4ub250c2NhbGVfMS4yLjMuYmIgPT4gbWtmb250c2NhbGVfMS4yLjQuYmJ9IHwgIDIg
Ky0KIC4uLi97eHJhbmRyXzEuNS4zLmJiID0+IHhyYW5kcl8xLjUuNC5iYn0gICAgICB8IDI2ICsr
KysrKysrKysrKysrKysrLS0KIDIgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAve21rZm9u
dHNjYWxlXzEuMi4zLmJiID0+IG1rZm9udHNjYWxlXzEuMi40LmJifSAoODglKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC97eHJhbmRyXzEuNS4zLmJiID0+IHhyYW5kcl8x
LjUuNC5iYn0gKDI3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1h
cHAvbWtmb250c2NhbGVfMS4yLjMuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAv
bWtmb250c2NhbGVfMS4yLjQuYmIKc2ltaWxhcml0eSBpbmRleCA4OCUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL21rZm9udHNjYWxlXzEuMi4zLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAvbWtmb250c2NhbGVfMS4yLjQuYmIKaW5k
ZXggYWE3OTkwMmEzNC4uNDI4NjdkYjY1ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3hvcmctYXBwL21rZm9udHNjYWxlXzEuMi4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFw
aGljcy94b3JnLWFwcC9ta2ZvbnRzY2FsZV8xLjIuNC5iYgpAQCAtMTgsNCArMTgsNCBAQCBCQkNM
QVNTRVhURU5EID0gIm5hdGl2ZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7
bWQ1PTVhNjBjNTk2ZDFiNWYzZGVlOWYwMDViNzAzYjMxODBkIgogCiBTUkNfVVJJX0VYVCA9ICJ4
eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyOTIxY2RjMzQ0ZjFhY2VlMDRiY2Q2ZWExZTI5NTY1
YzEzMDgyNjMwMDZlMTM0YTllZTM4Y2Y5YzlkNmZlNzVlIgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImEwMTQ5MmExN2E5YjZjMGVlM2Y5MmVlNTc4ODUwZTMwNTMxNWI5ZjI5OGRhNWYwMDZhMWNkNGI1
MWRiMDFhNWUiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveHJh
bmRyXzEuNS4zLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hyYW5kcl8xLjUu
NC5iYgpzaW1pbGFyaXR5IGluZGV4IDI3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MveG9yZy1hcHAveHJhbmRyXzEuNS4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MveG9yZy1hcHAveHJhbmRyXzEuNS40LmJiCmluZGV4IDc1NjU2YWY5ZWEuLjhiNTgxZjExM2Eg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94cmFuZHJfMS41LjMu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hyYW5kcl8xLjUuNC5iYgpA
QCAtMSwzICsxLDI1IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2
ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMg
dGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4K
KyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJp
emUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRh
dGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1
cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORworIyArKysgQ09Q
WUlORworIyBAQCAtMSw2ICsxLDggQEAKKyMgIENvcHlyaWdodCDCqSAyMDAxIEtlaXRoIFBhY2th
cmQsIG1lbWJlciBvZiBUaGUgWEZyZWU4NiBQcm9qZWN0LCBJbmMuCisjICBDb3B5cmlnaHQgwqkg
MjAwMiBIZXdsZXR0IFBhY2thcmQgQ29tcGFueSwgSW5jLgorIyAgQ29weXJpZ2h0IMKpIDIwMDYg
SW50ZWwgQ29ycG9yYXRpb24KKyMgK0NvcHlyaWdodCDCqSAyMDA4IEtlaXRoIFBhY2thcmQKKyMg
K0NvcHlyaWdodCDCqSAyMDEzIE5WSURJQSBDb3Jwb3JhdGlvbgorIyAgCisjICBQZXJtaXNzaW9u
IHRvIHVzZSwgY29weSwgbW9kaWZ5LCBkaXN0cmlidXRlLCBhbmQgc2VsbCB0aGlzIHNvZnR3YXJl
IGFuZCBpdHMKKyMgIGRvY3VtZW50YXRpb24gZm9yIGFueSBwdXJwb3NlIGlzIGhlcmVieSBncmFu
dGVkIHdpdGhvdXQgZmVlLCBwcm92aWRlZCB0aGF0CisjIAorIworCiByZXF1aXJlIHhvcmctYXBw
LWNvbW1vbi5pbmMKIAogU1VNTUFSWSA9ICJYUmFuZFI6IFggUmVzaXplLCBSb3RhdGUgYW5kIFJl
ZmxlY3QgZXh0ZW5zaW9uIGNvbW1hbmQiCkBAIC03LDExICsyOSwxMSBAQCByZWZsZWN0aW9uIG9m
IHRoZSBvdXRwdXRzIGZvciBhIHNjcmVlbi4gSXQgY2FuIGFsc28gc2V0IHRoZSBzY3JlZW4gXAog
c2l6ZS4iCiAKIExJQ0VOU0UgPSAiTUlUIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09Q
WUlORzttZDU9ZmUxNjA4YmRiMzNjZjhjNjJhNDQzOGY3ZDM0Njc5YjMiCitMSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT05N2EzNmQ1YzY2OTY1YjFjZWE0NjY2YjM3MDhjYTZl
OCIKIERFUEVORFMgKz0gImxpYnhyYW5kciBsaWJ4cmVuZGVyIgogUEUgPSAiMSIKIAogU1JDX1VS
SV9FWFQgPSAieHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjhkZDc1NjZhZGI3NDE0N2ZhYjk5
NjQ2ODBiNmJiYWRlZTg3Y2Y0MDZhN2ZjZmY1MTcxOGE1ZTY5NDliODQxYyIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICIyY2FmY2NiMmFhZjI0OTFhNDA2ODY3NjExN2EwZDRmOTBhYjMwNzcyNGI5NmZm
ZmM1NGNkMWRhOTUzNzc5NDAwIgogCiBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsi
Ci0tIAoyLjQ3LjEKCg==

--===============6732039759464361137==--

