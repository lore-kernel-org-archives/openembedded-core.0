Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3649C54EF3
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:21 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.36640.1709330717358521387
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dTomx9fw;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZTOs+Jey;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018dfc0cdba2-b15e8419-896f-49b9-a6ab-587663966d28-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330717;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Zlr6SzUhljyO4RTL75/NZL3jRmAtZFOMqbvdj5X48ww=;
	b=dTomx9fwKzdBh8xhtBcxki40ETyA9MjECx6oRizax543dDYv04+4+f6iQeMF8YBt
	adnliO9Dv0+FoL6y0HqFmggmVYj38341qm+BmLuso6swWax0S1hcSc6YHA9EASyoJu1
	umlEt4szJhYrRKxh4VnMMdGl6aecBpXh9TxADOSg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330717;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Zlr6SzUhljyO4RTL75/NZL3jRmAtZFOMqbvdj5X48ww=;
	b=ZTOs+Jeye0jNhuAnj3vzwCNw0n/Pbd/QYi5BK2GjhdbkeC9Di03cLWrcvWT8N2TY
	a1r3zlnOsj0n+3NEdlSK6yvioe1ETvqQAwerYMoJA3DhSswUHe2OpC9/7qDYCYT8l9Y
	XNgBfkYIktK3Me4qGr3jUSaHjS0Rr+04jDmcewfg=
Content-Type: multipart/mixed; boundary="===============7134731083880117918=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] nghttp2: upgrading to 1.60.0 SUCCEEDED
Message-ID: <0101018dfc0cdba2-b15e8419-896f-49b9-a6ab-587663966d28-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:17 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196536

--===============7134731083880117918==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
ICpuZ2h0dHAyKiB0byAqMS42MC4wKiBoYXMgU3VjY2VlZGVkLgoKTmV4dCBzdGVwczoKICAgIC0g
YXBwbHkgdGhlIHBhdGNoOiBnaXQgYW0gMDAwMS1uZ2h0dHAyLXVwZ3JhZGUtMS41OS4wLTEuNjAu
MC5wYXRjaAogICAgLSBjaGVjayB0aGUgY2hhbmdlcyB0byB1cHN0cmVhbSBwYXRjaGVzIGFuZCBz
dW1tYXJpemUgdGhlbSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UsCiAgICAtIGNvbXBpbGUgYW4gaW1h
Z2UgdGhhdCBjb250YWlucyB0aGUgcGFja2FnZQogICAgLSBwZXJmb3JtIHNvbWUgYmFzaWMgc2Fu
aXR5IHRlc3RzCiAgICAtIGFtZW5kIHRoZSBwYXRjaCBhbmQgc2lnbiBpdCBvZmY6IGdpdCBjb21t
aXQgLXMgLS1yZXNldC1hdXRob3IgLS1hbWVuZAogICAgLSBzZW5kIGl0IHRvIHRoZSBhcHByb3By
aWF0ZSBtYWlsaW5nIGxpc3QKCkFsdGVybmF0aXZlbHksIGlmIHlvdSBiZWxpZXZlIHRoZSByZWNp
cGUgc2hvdWxkIG5vdCBiZSB1cGdyYWRlZCBhdCB0aGlzIHRpbWUsCnlvdSBjYW4gZmlsbCBSRUNJ
UEVfTk9fVVBEQVRFX1JFQVNPTiBpbiByZXNwZWN0aXZlIHJlY2lwZSBmaWxlIHNvIHRoYXQKYXV0
b21hdGljIHVwZ3JhZGVzIHdvdWxkIG5vIGxvbmdlciBiZSBhdHRlbXB0ZWQuCgpQbGVhc2UgcmV2
aWV3IHRoZSBhdHRhY2hlZCBmaWxlcyBmb3IgZnVydGhlciBpbmZvcm1hdGlvbiBhbmQgYnVpbGQv
dXBkYXRlIGZhaWx1cmVzLgpBbnkgcHJvYmxlbSBwbGVhc2UgZmlsZSBhIGJ1ZyBhdCBodHRwczov
L2J1Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcvZW50ZXJfYnVnLmNnaT9wcm9kdWN0PUF1dG9tYXRl
ZCUyMFVwZGF0ZSUyMEhhbmRsZXIKClJlZ2FyZHMsClRoZSBVcGdyYWRlIEhlbHBlcgoKLS0gPjgg
LS0KRnJvbSBjMDJhNjNmNDIyOGM2YTk5YjJmOWYxMWM4YTE5OTU1OThiMmMxZmQyIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5v
cmc+CkRhdGU6IEZyaSwgMSBNYXIgMjAyNCAyMTo1NTowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hd
IG5naHR0cDI6IHVwZ3JhZGUgMS41OS4wIC0+IDEuNjAuMAoKLS0tCiAuLi4wMDAxLWZldGNoLW9j
c3AtcmVzcG9uc2UtdXNlLXB5dGhvbjMucGF0Y2ggfCAyNyAtLS0tLS0tLS0tLS0tLS0tLS0tCiAu
Li4ve25naHR0cDJfMS41OS4wLmJiID0+IG5naHR0cDJfMS42MC4wLmJifSAgfCAgNyArKy0tLQog
MiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMyIGRlbGV0aW9ucygtKQogZGVsZXRl
IG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L25naHR0cDIvbmdodHRwMi8wMDAxLWZl
dGNoLW9jc3AtcmVzcG9uc2UtdXNlLXB5dGhvbjMucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9uZ2h0dHAyL3tuZ2h0dHAyXzEuNTkuMC5iYiA9PiBuZ2h0dHAyXzEuNjAuMC5iYn0g
KDc5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9uZ2h0dHAyL25naHR0cDIv
MDAwMS1mZXRjaC1vY3NwLXJlc3BvbnNlLXVzZS1weXRob24zLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbmdodHRwMi9uZ2h0dHAyLzAwMDEtZmV0Y2gtb2NzcC1yZXNwb25zZS11c2UtcHl0
aG9uMy5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggZTRkYjA5NjM4Zi4uMDAw
MDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9uZ2h0dHAyL25naHR0cDIvMDAwMS1m
ZXRjaC1vY3NwLXJlc3BvbnNlLXVzZS1weXRob24zLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEs
MjcgKzAsMCBAQAotRnJvbSA3M2VjNzk0MzJmYzU1N2E4YmU0ZjE1MDA5ODJiMWMwZjVmZGYxMmE5
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogPT9VVEYtOD9xP0FuZHI9QzM9QTk9MjBE
cmFzemlrPz0gPGFuZHJlLmRyYXN6aWtAamNpLmNvbT4KLURhdGU6IFRodSwgNyBOb3YgMjAxOSAw
OTo1ODo1MiArMDAwMAotU3ViamVjdDogW1BBVENIXSBmZXRjaC1vY3NwLXJlc3BvbnNlOiB1c2Ug
cHl0aG9uMwotTUlNRS1WZXJzaW9uOiAxLjAKLUNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hh
cnNldD1VVEYtOAotQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAotCi1VcHN0cmVhbS1T
dGF0dXM6IEluYXBwcm9wcmlhdGUgW29lIHNwZWNpZmljXQotU2lnbmVkLW9mZi1ieTogQW5kcsOp
IERyYXN6aWsgPGdpdEBhbmRyZWQubmV0PgotLS0tCi0gc2NyaXB0L2ZldGNoLW9jc3AtcmVzcG9u
c2UgfCAyICstCi0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Ci0KLWRpZmYgLS1naXQgYS9zY3JpcHQvZmV0Y2gtb2NzcC1yZXNwb25zZSBiL3NjcmlwdC9mZXRj
aC1vY3NwLXJlc3BvbnNlCi1pbmRleCAwZmY3NDYxLi4xODUxMTZiIDEwMDc1NQotLS0tIGEvc2Ny
aXB0L2ZldGNoLW9jc3AtcmVzcG9uc2UKLSsrKyBiL3NjcmlwdC9mZXRjaC1vY3NwLXJlc3BvbnNl
Ci1AQCAtMSw0ICsxLDQgQEAKLS0jIS91c3IvYmluL2VudiBweXRob24KLSsjIS91c3IvYmluL2Vu
diBweXRob24zCi0gIyAtKi0gY29kaW5nOiB1dGYtOCAtKi0KLSAKLSAjIG5naHR0cDIgLSBIVFRQ
LzIgQyBMaWJyYXJ5Ci0tLSAKLTIuMjMuMC5yYzEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbmdodHRwMi9uZ2h0dHAyXzEuNTkuMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0
L25naHR0cDIvbmdodHRwMl8xLjYwLjAuYmIKc2ltaWxhcml0eSBpbmRleCA3OSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmdodHRwMi9uZ2h0dHAyXzEuNTkuMC5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmdodHRwMi9uZ2h0dHAyXzEuNjAuMC5iYgppbmRleCBm
YTAwMTNjYTljLi5jZjYyYzMyZDhiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9u
Z2h0dHAyL25naHR0cDJfMS41OS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L25naHR0
cDIvbmdodHRwMl8xLjYwLjAuYmIKQEAgLTQsMTEgKzQsOCBAQCBTRUNUSU9OID0gImxpYnMiCiBM
SUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTc2
NGFiZGYzMGIyZWFkZDM3Y2U0N2RjYmNlMGVhMWVjIgogCi1TUkNfVVJJID0gIlwKLSAgICAke0dJ
VEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9L25naHR0cDItJHtQVn0udGFyLnh6IFwKLSAg
ICBmaWxlOi8vMDAwMS1mZXRjaC1vY3NwLXJlc3BvbnNlLXVzZS1weXRob24zLnBhdGNoIFwKLSIK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmZGM5YmQ3MWY1Y2Y4ZDNmZGZiNjMwNjZiODkzNjRjMTBl
YjJmZGVhYjU1ZjNjNjc1NWNkNzkxN2IyZWM0ZmZiIgorU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNF
X1VSSX0vZG93bmxvYWQvdiR7UFZ9L25naHR0cDItJHtQVn0udGFyLnh6IgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjYyNWQ2YzNkYTFkOWNhNGZkNjQzYTYzODI1NjQzMWFlNjhmZDE5MDE2NTNiMmE2
MWEyNDVlZWE3YjI2MWJmNGUiCiAKIGluaGVyaXQgY21ha2UgbWFucGFnZXMgcHl0aG9uM25hdGl2
ZSBnaXRodWItcmVsZWFzZXMKIFBBQ0tBR0VDT05GSUdbbWFucGFnZXNdID0gIiIKLS0gCjIuNDIu
MAoK

--===============7134731083880117918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/nghttp2: PKGV changed from 1.59.0 [default] to 1.60.0 [default]
packages/core2-64-poky-linux/nghttp2: SRC_URI changed from "https://github.com/nghttp2/nghttp2/releases//download/v1.59.0/nghttp2-1.59.0.tar.xz file://0001-fetch-ocsp-response-use-python3.patch" to "https://github.com/nghttp2/nghttp2/releases//download/v1.60.0/nghttp2-1.60.0.tar.xz"
packages/core2-64-poky-linux/nghttp2: PV changed from "1.59.0" to "1.60.0"
packages/core2-64-poky-linux/nghttp2/libnghttp2: FILELIST: removed "/usr/lib/libnghttp2.so.14.26.0", added "/usr/lib/libnghttp2.so.14.27.0"
packages/core2-64-poky-linux/nghttp2/libnghttp2: PKGV changed from 1.59.0 [default] to 1.60.0 [default]
packages/core2-64-poky-linux/nghttp2/libnghttp2: PV changed from "1.59.0" to "1.60.0"
packages/core2-64-poky-linux/nghttp2/nghttp2-dbg: FILELIST: removed "/usr/lib/.debug/libnghttp2.so.14.26.0", added "/usr/lib/.debug/libnghttp2.so.14.27.0"
packages/core2-64-poky-linux/nghttp2/nghttp2-dbg: PKGV changed from 1.59.0 [default] to 1.60.0 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-dbg: PKGSIZE changed from 544080 to 555984 (+2%)
packages/core2-64-poky-linux/nghttp2/nghttp2-dbg: PV changed from "1.59.0" to "1.60.0"
packages/core2-64-poky-linux/nghttp2/nghttp2-dev: FILELIST: added "/usr/lib/cmake/nghttp2/nghttp2-targets-relwithdebinfo.cmake /usr/lib/cmake/nghttp2/nghttp2-targets.cmake"
packages/core2-64-poky-linux/nghttp2/nghttp2-dev: PKGV changed from 1.59.0 [default] to 1.60.0 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-dev: PKGSIZE changed from 211952 to 257271 (+21%)
packages/core2-64-poky-linux/nghttp2/nghttp2-dev: PV changed from "1.59.0" to "1.60.0"
packages/core2-64-poky-linux/nghttp2/nghttp2-doc: PKGV changed from 1.59.0 [default] to 1.60.0 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-doc: PKGSIZE changed from 174189 to 174067 (-0%)
packages/core2-64-poky-linux/nghttp2/nghttp2-doc: PV changed from "1.59.0" to "1.60.0"
packages/core2-64-poky-linux/nghttp2/nghttp2-locale: PKGV changed from 1.59.0 [default] to 1.60.0 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-locale: PV changed from "1.59.0" to "1.60.0"
packages/core2-64-poky-linux/nghttp2/nghttp2-proxy: PKGV changed from 1.59.0 [default] to 1.60.0 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-proxy: PV changed from "1.59.0" to "1.60.0"
packages/core2-64-poky-linux/nghttp2/nghttp2-src: FILELIST: directory renamed /usr/src/debug/nghttp2/1.59.0/lib/includes/nghttp2 -> /usr/src/debug/nghttp2/1.60.0/lib/includes/nghttp2, removed "/usr/src/debug/nghttp2/1.59.0/lib/nghttp2_map.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_map.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_extpri.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_helper.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_option.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_stream.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_alpn.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_extpri.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_option.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_stream.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_submit.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_helper.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_http.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_session.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_version.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_http.h
  /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_session.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_hd_huffman.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_priority_spec.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_ratelim.h /usr/src/debug/nghttp2/1.59.0/lib/sfparse.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_priority_spec.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_hd_huffman.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_ratelim.c /usr/src/debug/nghttp2/1.59.0/lib/sfparse.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_callbacks.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_callbacks.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_outbound_item.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_hd_huffman_data.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_pq.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_mem.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_frame.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_mem.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_queue.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_rcbuf.h /usr/sr
 c/debug/nghttp2/1.59.0/lib/nghttp2_outbound_item.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_frame.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_debug.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_pq.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_queue.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_rcbuf.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_buf.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_buf.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_hd.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_time.c /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_time.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_hd.h /usr/src/debug/nghttp2/1.59.0/lib/nghttp2_int.h", added "/usr/src/debug/nghttp2/1.60.0/lib/nghttp2_map.c /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_map.h /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_extpri.h /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_helper.h /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_option.h /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_stream.h /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_submit.h /us
 r/src/debug/nghttp2/1.60.0/lib/nghttp2_alpn.c /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_extpri.c /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_option.c /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_stream.c /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_submit.c /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_helper.c /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_http.c /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_session.c /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_version.c /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_http.h /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_session.h /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_hd_huffman.c /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_priority_spec.c /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_ratelim.h /usr/src/debug/nghttp2/1.60.0/lib/sfparse.h /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_priority_spec.h /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_hd_huffman.h /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_ratelim.c /usr/src/debug/nghttp2/1.60.0/lib/sfparse.c /usr/src/debug/nghttp2/1
 .60.0/lib/nghttp2_callbacks.h /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_callbacks.c /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_outbound_item.c /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_hd_huffman_data.c /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_pq.h /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_mem.h /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_frame.h /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_mem.c /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_queue.h /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_rcbuf.h /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_outbound_item.h /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_debug.c /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_frame.c /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_pq.c /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_queue.c /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_rcbuf.c /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_buf.c /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_buf.h /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_hd.c /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_time.c /usr/
 src/debug/nghttp2/1.60.0/lib/nghttp2_time.h /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_hd.h /usr/src/debug/nghttp2/1.60.0/lib/nghttp2_int.h"
packages/core2-64-poky-linux/nghttp2/nghttp2-src: PKGV changed from 1.59.0 [default] to 1.60.0 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-src: PKGSIZE changed from 1034913 to 1087354 (+5%)
packages/core2-64-poky-linux/nghttp2/nghttp2-src: PV changed from "1.59.0" to "1.60.0"
packages/core2-64-poky-linux/nghttp2/nghttp2-staticdev: PKGV changed from 1.59.0 [default] to 1.60.0 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-staticdev: PV changed from "1.59.0" to "1.60.0"
packages/core2-64-poky-linux/nghttp2/nghttp2: PKGV changed from 1.59.0 [default] to 1.60.0 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2: PV changed from "1.59.0" to "1.60.0"
Changes to packages/core2-64-poky-linux/nghttp2 (sysroot):
  /usr/lib/libnghttp2.so.14 changed symlink target from libnghttp2.so.14.26.0 to libnghttp2.so.14.27.0
  /usr/lib/libnghttp2.so.14.26.0 moved to /usr/lib/libnghttp2.so.14.27.0
  /usr/lib/cmake was added
  /usr/lib/cmake/nghttp2 was added
  /usr/lib/cmake/nghttp2/nghttp2-targets.cmake was added
  /usr/lib/cmake/nghttp2/nghttp2-targets-relwithdebinfo.cmake was added

--===============7134731083880117918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (0 cached, 916 parsed). 1864 targets, 46 skipped, 0 masked, 0 errors.
Removing 50 recipes from the core2-64 sysroot...done.
Removing 74 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-3c79eddb83d73aba0477f282e001f3da666026f7"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3c79eddb83d73aba0477f282e001f3da666026f7"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 409 Local 394 Mirrors 0 Missed 15 Current 219 (96% match, 97% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 220 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 221 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 222 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 226 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 227 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_create_spdx_setscene)
NOTE: Running task 577 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.60.0.bb:do_recipe_qa)
NOTE: recipe openssl-3.2.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe nghttp2-1.60.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-3.12.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 279 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_create_spdx_setscene)
NOTE: recipe nghttp2-1.60.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 700 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.60.0.bb:do_fetch)
NOTE: recipe openssl-3.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe nghttp2-1.60.0-r0: task do_fetch: Started
NOTE: recipe nghttp2-1.60.0-r0: task do_fetch: Succeeded
NOTE: Running task 714 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.60.0.bb:do_unpack)
NOTE: recipe openssl-3.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 295 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.12.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe nghttp2-1.60.0-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 297 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe nghttp2-1.60.0-r0: task do_unpack: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 301 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 795 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.60.0.bb:do_patch)
NOTE: recipe nghttp2-1.60.0-r0: task do_patch: Started
NOTE: recipe nghttp2-1.60.0-r0: task do_patch: Succeeded
NOTE: Running task 801 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.60.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 802 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.60.0.bb:do_generate_toolchain_file)
NOTE: Running task 803 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.60.0.bb:do_populate_lic)
NOTE: recipe nghttp2-1.60.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.60.0-r0: task do_populate_lic: Started
NOTE: recipe nghttp2-1.60.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe python3-3.12.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 310 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 316 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: recipe nghttp2-1.60.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 335 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 346 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 350 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 361 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 364 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 372 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 374 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 379 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 384 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 388 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.60.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.60.0.bb:do_populate_lic unihash changed to f03e225a341b7bfe493a5086aa3cc612510068217a437ac1ba6ebba86c6c22ce
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 415 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe nghttp2-1.60.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 422 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 438 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 447 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 451 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/acl/2.3.1/temp/log.do_packagedata_setscene.3013003
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 453 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_package_setscene)
NOTE: recipe curl-8.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.48-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 459 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 494 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 501 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_package_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 510 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 511 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 515 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 520 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 521 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 532 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 537 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1095 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 546 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1106 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1107 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1113 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1115 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1116 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 559 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1122 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1128 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe perl-5.38.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1129 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running setscene task 567 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3827d1886d21fc285ddcf2fcb9cb1cc58679b8245b5b8a3c52f01f2714d587ae
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 582 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 590 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 592 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 593 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 595 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 596 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 598 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 600 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 604 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 605 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 607 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 614 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 616 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 617 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 620 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 622 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 623 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 625 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 628 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1592 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.60.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1634 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata)
NOTE: Running task 1721 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.60.0.bb:do_collect_spdx_deps)
NOTE: recipe nghttp2-1.60.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.60.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe nghttp2-1.60.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe nghttp2-1.60.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1758 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.60.0.bb:do_configure)
NOTE: recipe nghttp2-1.60.0-r0: task do_configure: Started
NOTE: recipe nghttp2-1.60.0-r0: task do_configure: Succeeded
NOTE: Running task 1759 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.60.0.bb:do_compile)
NOTE: recipe nghttp2-1.60.0-r0: task do_compile: Started
NOTE: recipe nghttp2-1.60.0-r0: task do_compile: Succeeded
NOTE: Running task 1760 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.60.0.bb:do_install)
NOTE: recipe nghttp2-1.60.0-r0: task do_install: Started
NOTE: recipe nghttp2-1.60.0-r0: task do_install: Succeeded
NOTE: Running task 1761 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.60.0.bb:do_package)
NOTE: Running task 1762 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.60.0.bb:do_populate_sysroot)
NOTE: recipe nghttp2-1.60.0-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.60.0-r0: task do_package: Started
NOTE: recipe nghttp2-1.60.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nghttp2-1.60.0-r0: task do_package: Succeeded
NOTE: Running task 1763 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.60.0.bb:do_packagedata)
NOTE: recipe nghttp2-1.60.0-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.60.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1764 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.60.0.bb:do_create_spdx)
NOTE: Running task 1765 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.60.0.bb:do_package_write_ipk)
NOTE: Running task 1766 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.60.0.bb:do_package_write_deb)
NOTE: Running task 1767 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.60.0.bb:do_package_write_rpm)
NOTE: Running task 1768 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.60.0.bb:do_package_qa)
NOTE: recipe nghttp2-1.60.0-r0: task do_create_spdx: Started
NOTE: recipe nghttp2-1.60.0-r0: task do_package_write_ipk: Started
NOTE: recipe nghttp2-1.60.0-r0: task do_package_write_deb: Started
NOTE: recipe nghttp2-1.60.0-r0: task do_package_write_rpm: Started
NOTE: recipe nghttp2-1.60.0-r0: task do_package_qa: Started
NOTE: recipe nghttp2-1.60.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1769 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.60.0.bb:do_create_runtime_spdx)
NOTE: recipe nghttp2-1.60.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe nghttp2-1.60.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe nghttp2-1.60.0-r0: task do_package_qa: Succeeded
NOTE: recipe nghttp2-1.60.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe nghttp2-1.60.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe nghttp2-1.60.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1770 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.60.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1770 tasks of which 1738 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: acl-2.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package acl-src went backwards which would break package feeds (from 0:2.3.2-r0 to 0:2.3.1-r0) [version-going-backwards]
ERROR: acl-2.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package acl-dbg went backwards which would break package feeds (from 0:2.3.2-r0 to 0:2.3.1-r0) [version-going-backwards]
ERROR: acl-2.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libacl went backwards which would break package feeds (from 0:2.3.2-r0 to 0:2.3.1-r0) [version-going-backwards]
ERROR: acl-2.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package acl-ptest went backwards which would break package feeds (from 0:2.3.2-r0 to 0:2.3.1-r0) [version-going-backwards]
ERROR: acl-2.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package acl-staticdev went backwards which would break package feeds (from 0:2.3.2-r0 to 0:2.3.1-r0) [version-going-backwards]
ERROR: acl-2.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package acl-dev went backwards which would break package feeds (from 0:2.3.2-r0 to 0:2.3.1-r0) [version-going-backwards]
ERROR: acl-2.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package acl-doc went backwards which would break package feeds (from 0:2.3.2-r0 to 0:2.3.1-r0) [version-going-backwards]
ERROR: acl-2.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-de went backwards which would break package feeds (from 0:2.3.2-r0 to 0:2.3.1-r0) [version-going-backwards]
ERROR: acl-2.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-en+boldquot went backwards which would break package feeds (from 0:2.3.2-r0 to 0:2.3.1-r0) [version-going-backwards]
ERROR: acl-2.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-en+quot went backwards which would break package feeds (from 0:2.3.2-r0 to 0:2.3.1-r0) [version-going-backwards]
ERROR: acl-2.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-es went backwards which would break package feeds (from 0:2.3.2-r0 to 0:2.3.1-r0) [version-going-backwards]
ERROR: acl-2.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-fr went backwards which would break package feeds (from 0:2.3.2-r0 to 0:2.3.1-r0) [version-going-backwards]
ERROR: acl-2.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-gl went backwards which would break package feeds (from 0:2.3.2-r0 to 0:2.3.1-r0) [version-going-backwards]
ERROR: acl-2.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-pl went backwards which would break package feeds (from 0:2.3.2-r0 to 0:2.3.1-r0) [version-going-backwards]
ERROR: acl-2.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-sv went backwards which would break package feeds (from 0:2.3.2-r0 to 0:2.3.1-r0) [version-going-backwards]
ERROR: acl-2.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package acl went backwards which would break package feeds (from 0:2.3.2-r0 to 0:2.3.1-r0) [version-going-backwards]
ERROR: acl-2.3.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7134731083880117918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/nghttp2/libnghttp2: FILELIST: removed "/usr/lib/libnghttp2.so.14.26.0", added "/usr/lib/libnghttp2.so.14.27.0"
packages/core2-64-poky-linux/nghttp2/nghttp2-dev: PKGSIZE changed from 211952 to 257271 (+21%)
packages/core2-64-poky-linux/nghttp2/nghttp2-dev: FILELIST: added "/usr/lib/cmake/nghttp2/nghttp2-targets-relwithdebinfo.cmake /usr/lib/cmake/nghttp2/nghttp2-targets.cmake"
Changes to packages/core2-64-poky-linux/nghttp2 (sysroot):
  /usr/lib/libnghttp2.so.14 changed symlink target from libnghttp2.so.14.26.0 to libnghttp2.so.14.27.0
  /usr/lib/libnghttp2.so.14.26.0 moved to /usr/lib/libnghttp2.so.14.27.0
  /usr/lib/cmake was added
  /usr/lib/cmake/nghttp2 was added
  /usr/lib/cmake/nghttp2/nghttp2-targets.cmake was added
  /usr/lib/cmake/nghttp2/nghttp2-targets-relwithdebinfo.cmake was added

--===============7134731083880117918==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-nghttp2-upgrade-1.59.0-1.60.0.patch"

RnJvbSBjMDJhNjNmNDIyOGM2YTk5YjJmOWYxMWM4YTE5OTU1OThiMmMxZmQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXIgMjAyNCAyMTo1NTowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG5n
aHR0cDI6IHVwZ3JhZGUgMS41OS4wIC0+IDEuNjAuMAoKLS0tCiAuLi4wMDAxLWZldGNoLW9jc3At
cmVzcG9uc2UtdXNlLXB5dGhvbjMucGF0Y2ggfCAyNyAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4v
e25naHR0cDJfMS41OS4wLmJiID0+IG5naHR0cDJfMS42MC4wLmJifSAgfCAgNyArKy0tLQogMiBm
aWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMyIGRlbGV0aW9ucygtKQogZGVsZXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L25naHR0cDIvbmdodHRwMi8wMDAxLWZldGNo
LW9jc3AtcmVzcG9uc2UtdXNlLXB5dGhvbjMucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9uZ2h0dHAyL3tuZ2h0dHAyXzEuNTkuMC5iYiA9PiBuZ2h0dHAyXzEuNjAuMC5iYn0gKDc5
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9uZ2h0dHAyL25naHR0cDIvMDAw
MS1mZXRjaC1vY3NwLXJlc3BvbnNlLXVzZS1weXRob24zLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbmdodHRwMi9uZ2h0dHAyLzAwMDEtZmV0Y2gtb2NzcC1yZXNwb25zZS11c2UtcHl0aG9u
My5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggZTRkYjA5NjM4Zi4uMDAwMDAw
MDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9uZ2h0dHAyL25naHR0cDIvMDAwMS1mZXRj
aC1vY3NwLXJlc3BvbnNlLXVzZS1weXRob24zLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMjcg
KzAsMCBAQAotRnJvbSA3M2VjNzk0MzJmYzU1N2E4YmU0ZjE1MDA5ODJiMWMwZjVmZGYxMmE5IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogPT9VVEYtOD9xP0FuZHI9QzM9QTk9MjBEcmFz
emlrPz0gPGFuZHJlLmRyYXN6aWtAamNpLmNvbT4KLURhdGU6IFRodSwgNyBOb3YgMjAxOSAwOTo1
ODo1MiArMDAwMAotU3ViamVjdDogW1BBVENIXSBmZXRjaC1vY3NwLXJlc3BvbnNlOiB1c2UgcHl0
aG9uMwotTUlNRS1WZXJzaW9uOiAxLjAKLUNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNl
dD1VVEYtOAotQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAotCi1VcHN0cmVhbS1TdGF0
dXM6IEluYXBwcm9wcmlhdGUgW29lIHNwZWNpZmljXQotU2lnbmVkLW9mZi1ieTogQW5kcsOpIERy
YXN6aWsgPGdpdEBhbmRyZWQubmV0PgotLS0tCi0gc2NyaXB0L2ZldGNoLW9jc3AtcmVzcG9uc2Ug
fCAyICstCi0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCi0K
LWRpZmYgLS1naXQgYS9zY3JpcHQvZmV0Y2gtb2NzcC1yZXNwb25zZSBiL3NjcmlwdC9mZXRjaC1v
Y3NwLXJlc3BvbnNlCi1pbmRleCAwZmY3NDYxLi4xODUxMTZiIDEwMDc1NQotLS0tIGEvc2NyaXB0
L2ZldGNoLW9jc3AtcmVzcG9uc2UKLSsrKyBiL3NjcmlwdC9mZXRjaC1vY3NwLXJlc3BvbnNlCi1A
QCAtMSw0ICsxLDQgQEAKLS0jIS91c3IvYmluL2VudiBweXRob24KLSsjIS91c3IvYmluL2VudiBw
eXRob24zCi0gIyAtKi0gY29kaW5nOiB1dGYtOCAtKi0KLSAKLSAjIG5naHR0cDIgLSBIVFRQLzIg
QyBMaWJyYXJ5Ci0tLSAKLTIuMjMuMC5yYzEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbmdodHRwMi9uZ2h0dHAyXzEuNTkuMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L25n
aHR0cDIvbmdodHRwMl8xLjYwLjAuYmIKc2ltaWxhcml0eSBpbmRleCA3OSUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbmdodHRwMi9uZ2h0dHAyXzEuNTkuMC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbmdodHRwMi9uZ2h0dHAyXzEuNjAuMC5iYgppbmRleCBmYTAw
MTNjYTljLi5jZjYyYzMyZDhiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9uZ2h0
dHAyL25naHR0cDJfMS41OS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L25naHR0cDIv
bmdodHRwMl8xLjYwLjAuYmIKQEAgLTQsMTEgKzQsOCBAQCBTRUNUSU9OID0gImxpYnMiCiBMSUNF
TlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTc2NGFi
ZGYzMGIyZWFkZDM3Y2U0N2RjYmNlMGVhMWVjIgogCi1TUkNfVVJJID0gIlwKLSAgICAke0dJVEhV
Ql9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9L25naHR0cDItJHtQVn0udGFyLnh6IFwKLSAgICBm
aWxlOi8vMDAwMS1mZXRjaC1vY3NwLXJlc3BvbnNlLXVzZS1weXRob24zLnBhdGNoIFwKLSIKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICJmZGM5YmQ3MWY1Y2Y4ZDNmZGZiNjMwNjZiODkzNjRjMTBlYjJm
ZGVhYjU1ZjNjNjc1NWNkNzkxN2IyZWM0ZmZiIgorU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VS
SX0vZG93bmxvYWQvdiR7UFZ9L25naHR0cDItJHtQVn0udGFyLnh6IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjYyNWQ2YzNkYTFkOWNhNGZkNjQzYTYzODI1NjQzMWFlNjhmZDE5MDE2NTNiMmE2MWEy
NDVlZWE3YjI2MWJmNGUiCiAKIGluaGVyaXQgY21ha2UgbWFucGFnZXMgcHl0aG9uM25hdGl2ZSBn
aXRodWItcmVsZWFzZXMKIFBBQ0tBR0VDT05GSUdbbWFucGFnZXNdID0gIiIKLS0gCjIuNDIuMAoK

--===============7134731083880117918==--

