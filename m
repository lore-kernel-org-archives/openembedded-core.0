Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A46C41513
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:19 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.1124.1714579215999617592
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=f95Z6hWf;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=a/ZNvLOA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018f34e29970-e6212fc0-7a2a-48ef-845a-58bc39b68293-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579216;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uk2+5Fb7TynCAdagOoIHPdp6h4YfX7LXiYt3fn4pWeU=;
	b=f95Z6hWfbArkgDt/dcD49ISP2LvGLSniImI3jj8/dqtzC2xWDJ5PnuMY0vr6qOCG
	zUbB9KsvHgpcVdJdbwK/z7qs2+NA+emk0jg+Evzdfur+DYV8zEhsvK9SlEguA/XdH90
	4+0o2CO3Ihrzj8xFFgMaCOGQUoVk1n6WggC0HWms=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579216;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uk2+5Fb7TynCAdagOoIHPdp6h4YfX7LXiYt3fn4pWeU=;
	b=a/ZNvLOAY2BAJvpvaGj20OYUMsPBJDQFZXlCJjxgSmwbpTWOu3t/Ay32Je5QwvH0
	Dho2W+PguIjYyJrx3UlntbJuH27z6YvVhf6kjVlye9J6uNnigEFHbxJIIXdT9NVMxYB
	0tM2pN43su22xTnvW7ozb6bSE5BU9nLtjj28fTd4=
Content-Type: multipart/mixed; boundary="===============6262803867806281738=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vte: upgrading to 0.76.1 FAILED
Message-ID: <0101018f34e29970-e6212fc0-7a2a-48ef-845a-58bc39b68293-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198881

--===============6262803867806281738==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
ICp2dGUqIHRvICowLjc2LjEqIGhhcyBGYWlsZWQoZG9fY29tcGlsZSkuCgpEZXRhaWxlZCBlcnJv
ciBpbmZvcm1hdGlvbjoKCmRvX2NvbXBpbGUgZmFpbGVkCgoKCk5leHQgc3RlcHM6CiAgICAtIGFw
cGx5IHRoZSBwYXRjaDogZ2l0IGFtIDAwMDEtdnRlLXVwZ3JhZGUtMC43NC4yLTAuNzYuMS5wYXRj
aAogICAgLSBjaGVjayB0aGUgY2hhbmdlcyB0byB1cHN0cmVhbSBwYXRjaGVzIGFuZCBzdW1tYXJp
emUgdGhlbSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UsCiAgICAtIGNvbXBpbGUgYW4gaW1hZ2UgdGhh
dCBjb250YWlucyB0aGUgcGFja2FnZQogICAgLSBwZXJmb3JtIHNvbWUgYmFzaWMgc2FuaXR5IHRl
c3RzCiAgICAtIGFtZW5kIHRoZSBwYXRjaCBhbmQgc2lnbiBpdCBvZmY6IGdpdCBjb21taXQgLXMg
LS1yZXNldC1hdXRob3IgLS1hbWVuZAogICAgLSBzZW5kIGl0IHRvIHRoZSBhcHByb3ByaWF0ZSBt
YWlsaW5nIGxpc3QKCkFsdGVybmF0aXZlbHksIGlmIHlvdSBiZWxpZXZlIHRoZSByZWNpcGUgc2hv
dWxkIG5vdCBiZSB1cGdyYWRlZCBhdCB0aGlzIHRpbWUsCnlvdSBjYW4gZmlsbCBSRUNJUEVfTk9f
VVBEQVRFX1JFQVNPTiBpbiByZXNwZWN0aXZlIHJlY2lwZSBmaWxlIHNvIHRoYXQKYXV0b21hdGlj
IHVwZ3JhZGVzIHdvdWxkIG5vIGxvbmdlciBiZSBhdHRlbXB0ZWQuCgpQbGVhc2UgcmV2aWV3IHRo
ZSBhdHRhY2hlZCBmaWxlcyBmb3IgZnVydGhlciBpbmZvcm1hdGlvbiBhbmQgYnVpbGQvdXBkYXRl
IGZhaWx1cmVzLgpBbnkgcHJvYmxlbSBwbGVhc2UgZmlsZSBhIGJ1ZyBhdCBodHRwczovL2J1Z3pp
bGxhLnlvY3RvcHJvamVjdC5vcmcvZW50ZXJfYnVnLmNnaT9wcm9kdWN0PUF1dG9tYXRlZCUyMFVw
ZGF0ZSUyMEhhbmRsZXIKClJlZ2FyZHMsClRoZSBVcGdyYWRlIEhlbHBlcgoKLS0gPjggLS0KRnJv
bSBjODgyOWY4YjNkODgyMzY3N2RmOWJlOTQxYTg1M2QzNWNjNmM2Zjc5IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+CkRh
dGU6IFdlZCwgMSBNYXkgMjAyNCAxNTo1MzoyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ0ZTog
dXBncmFkZSAwLjc0LjIgLT4gMC43Ni4xCgotLS0KIC4uLjEtQWRkLVdfRVhJVENPREUtbWFjcm8t
Zm9yLW5vbi1nbGliYy1zeXN0ZW1zLnBhdGNoIHwgMTEgKysrKy0tLS0tLS0KIC4uLi92dGUve3Z0
ZV8wLjc0LjIuYmIgPT4gdnRlXzAuNzYuMS5iYn0gICAgICAgICAgICAgIHwgIDIgKy0KIDIgZmls
ZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L3Z0ZS97dnRlXzAuNzQuMi5iYiA9PiB2dGVfMC43Ni4xLmJifSAoOTYl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAwMS1BZGQtV19F
WElUQ09ERS1tYWNyby1mb3Itbm9uLWdsaWJjLXN5c3RlbXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC92dGUvdnRlLzAwMDEtQWRkLVdfRVhJVENPREUtbWFjcm8tZm9yLW5vbi1nbGliYy1z
eXN0ZW1zLnBhdGNoCmluZGV4IDg5MzRkNWY4MGEuLmZkYWRlNTE4NGUgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAwMS1BZGQtV19FWElUQ09ERS1tYWNyby1mb3It
bm9uLWdsaWJjLXN5c3RlbXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0
ZS8wMDAxLUFkZC1XX0VYSVRDT0RFLW1hY3JvLWZvci1ub24tZ2xpYmMtc3lzdGVtcy5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gZGU5NjM5YmFhYzc5MjMyN2M3MDFlNTA5MjU4YjhhMTNmNjk1
OWU4MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMzAxMjljYjQyMDVkM2NhOWFiNGJl
MjkyM2UxZjM2MTViMTQ5OWEzMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IERhbmls
byBTcGluZWxsYSA8ZGFueXNwaW45N0Bwcm90b25tYWlsLmNvbT4KIERhdGU6IFRodSwgMjEgTWFy
IDIwMTkgMTQ6MTk6MjYgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gQWRkIFdfRVhJVENPREUgbWFj
cm8gZm9yIG5vbi1nbGliYyBzeXN0ZW1zCkBAIC0xMiwxMSArMTIsMTEgQEAgU2lnbmVkLW9mZi1i
eTogQW5kcmVhcyBNw7xsbGVyIDxzY2huaXR6ZWx0b255QGdtYWlsLmNvbT4KIAogWzFdIGh0dHBz
Oi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS92dGUvaXNzdWVzLzcyCiAtLS0KLSBzcmMvd2lkZ2V0
LmNjICB8IDQgKysrCi0gMSBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKKyBzcmMvd2lk
Z2V0LmNjIHwgNCArKysrCisgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQogCiBkaWZm
IC0tZ2l0IGEvc3JjL3dpZGdldC5jYyBiL3NyYy93aWRnZXQuY2MKLWluZGV4IDA3ZjdjYWJmLi4z
MWE3N2Y2OCAxMDA2NDQKK2luZGV4IGI4ZGFhNWMuLmMzNTc5NjAgMTAwNjQ0CiAtLS0gYS9zcmMv
d2lkZ2V0LmNjCiArKysgYi9zcmMvd2lkZ2V0LmNjCiBAQCAtMTYsNiArMTYsMTAgQEAKQEAgLTMw
LDYgKzMwLDMgQEAgaW5kZXggMDdmN2NhYmYuLjMxYTc3ZjY4IDEwMDY0NAogICNpbmNsdWRlICJj
b25maWcuaCIKICAKICAjaW5jbHVkZSAid2lkZ2V0LmhoIgotLS0gCi0yLjQyLjAKLQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZV8wLjc0LjIuYmIgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC92dGUvdnRlXzAuNzYuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlXzAuNzQuMi5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZV8wLjc2LjEuYmIKaW5kZXggZDhlYWZkZTJmYi4uMGU1
NTJkNDU2MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZV8wLjc0LjIu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZV8wLjc2LjEuYmIKQEAgLTE5LDcg
KzE5LDcgQEAgR0lET0NHRU5fTUVTT05fT1BUSU9OID0gImRvY3MiCiBpbmhlcml0IGdub21lYmFz
ZSBnaS1kb2NnZW4gZmVhdHVyZXNfY2hlY2sgdXBzdHJlYW0tdmVyc2lvbi1pcy1ldmVuIGdvYmpl
Y3QtaW50cm9zcGVjdGlvbiBzeXN0ZW1kIHZhbGEKIAogU1JDX1VSSSArPSAiZmlsZTovLzAwMDEt
QWRkLVdfRVhJVENPREUtbWFjcm8tZm9yLW5vbi1nbGliYy1zeXN0ZW1zLnBhdGNoIgotU1JDX1VS
SVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiYTUzNWZiMmE5OGZlYThhMjQ0OWNkMWEwMmNjY2Y1MTkw
MTMxZGRkZmY1MmU3MTVhZmRhY2UzZmViNTM2ZWFlNyIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZz
dW1dID0gIjA4NGU4M2VmNzY1Nzc0MjY5YTRiMjlkZjk3Y2EyMmVkYzM0M2I5YTFkODE0MzNkMzAw
YjhjYjJkMDg3YTFlYzIiCiAKIEFOWV9PRl9ESVNUUk9fRkVBVFVSRVMgPSAiJHtHVEszRElTVFJP
RkVBVFVSRVN9IgogCi0tIAoyLjQ0LjAKCg==

--===============6262803867806281738==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vte-upgrade-0.74.2-0.76.1.patch"

RnJvbSBjODgyOWY4YjNkODgyMzY3N2RmOWJlOTQxYTg1M2QzNWNjNmM2Zjc5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXkgMjAyNCAxNTo1MzoyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ0
ZTogdXBncmFkZSAwLjc0LjIgLT4gMC43Ni4xCgotLS0KIC4uLjEtQWRkLVdfRVhJVENPREUtbWFj
cm8tZm9yLW5vbi1nbGliYy1zeXN0ZW1zLnBhdGNoIHwgMTEgKysrKy0tLS0tLS0KIC4uLi92dGUv
e3Z0ZV8wLjc0LjIuYmIgPT4gdnRlXzAuNzYuMS5iYn0gICAgICAgICAgICAgIHwgIDIgKy0KIDIg
ZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS97dnRlXzAuNzQuMi5iYiA9PiB2dGVfMC43Ni4xLmJifSAo
OTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAwMS1BZGQt
V19FWElUQ09ERS1tYWNyby1mb3Itbm9uLWdsaWJjLXN5c3RlbXMucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC92dGUvdnRlLzAwMDEtQWRkLVdfRVhJVENPREUtbWFjcm8tZm9yLW5vbi1nbGli
Yy1zeXN0ZW1zLnBhdGNoCmluZGV4IDg5MzRkNWY4MGEuLmZkYWRlNTE4NGUgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAwMS1BZGQtV19FWElUQ09ERS1tYWNyby1m
b3Itbm9uLWdsaWJjLXN5c3RlbXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRl
L3Z0ZS8wMDAxLUFkZC1XX0VYSVRDT0RFLW1hY3JvLWZvci1ub24tZ2xpYmMtc3lzdGVtcy5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZGU5NjM5YmFhYzc5MjMyN2M3MDFlNTA5MjU4YjhhMTNm
Njk1OWU4MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMzAxMjljYjQyMDVkM2NhOWFi
NGJlMjkyM2UxZjM2MTViMTQ5OWEzMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IERh
bmlsbyBTcGluZWxsYSA8ZGFueXNwaW45N0Bwcm90b25tYWlsLmNvbT4KIERhdGU6IFRodSwgMjEg
TWFyIDIwMTkgMTQ6MTk6MjYgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gQWRkIFdfRVhJVENPREUg
bWFjcm8gZm9yIG5vbi1nbGliYyBzeXN0ZW1zCkBAIC0xMiwxMSArMTIsMTEgQEAgU2lnbmVkLW9m
Zi1ieTogQW5kcmVhcyBNw7xsbGVyIDxzY2huaXR6ZWx0b255QGdtYWlsLmNvbT4KIAogWzFdIGh0
dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS92dGUvaXNzdWVzLzcyCiAtLS0KLSBzcmMvd2lk
Z2V0LmNjICB8IDQgKysrCi0gMSBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKKyBzcmMv
d2lkZ2V0LmNjIHwgNCArKysrCisgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQogCiBk
aWZmIC0tZ2l0IGEvc3JjL3dpZGdldC5jYyBiL3NyYy93aWRnZXQuY2MKLWluZGV4IDA3ZjdjYWJm
Li4zMWE3N2Y2OCAxMDA2NDQKK2luZGV4IGI4ZGFhNWMuLmMzNTc5NjAgMTAwNjQ0CiAtLS0gYS9z
cmMvd2lkZ2V0LmNjCiArKysgYi9zcmMvd2lkZ2V0LmNjCiBAQCAtMTYsNiArMTYsMTAgQEAKQEAg
LTMwLDYgKzMwLDMgQEAgaW5kZXggMDdmN2NhYmYuLjMxYTc3ZjY4IDEwMDY0NAogICNpbmNsdWRl
ICJjb25maWcuaCIKICAKICAjaW5jbHVkZSAid2lkZ2V0LmhoIgotLS0gCi0yLjQyLjAKLQpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZV8wLjc0LjIuYmIgYi9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC92dGUvdnRlXzAuNzYuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlXzAuNzQuMi5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZV8wLjc2LjEuYmIKaW5kZXggZDhlYWZkZTJmYi4u
MGU1NTJkNDU2MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZV8wLjc0
LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZV8wLjc2LjEuYmIKQEAgLTE5
LDcgKzE5LDcgQEAgR0lET0NHRU5fTUVTT05fT1BUSU9OID0gImRvY3MiCiBpbmhlcml0IGdub21l
YmFzZSBnaS1kb2NnZW4gZmVhdHVyZXNfY2hlY2sgdXBzdHJlYW0tdmVyc2lvbi1pcy1ldmVuIGdv
YmplY3QtaW50cm9zcGVjdGlvbiBzeXN0ZW1kIHZhbGEKIAogU1JDX1VSSSArPSAiZmlsZTovLzAw
MDEtQWRkLVdfRVhJVENPREUtbWFjcm8tZm9yLW5vbi1nbGliYy1zeXN0ZW1zLnBhdGNoIgotU1JD
X1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiYTUzNWZiMmE5OGZlYThhMjQ0OWNkMWEwMmNjY2Y1
MTkwMTMxZGRkZmY1MmU3MTVhZmRhY2UzZmViNTM2ZWFlNyIKK1NSQ19VUklbYXJjaGl2ZS5zaGEy
NTZzdW1dID0gIjA4NGU4M2VmNzY1Nzc0MjY5YTRiMjlkZjk3Y2EyMmVkYzM0M2I5YTFkODE0MzNk
MzAwYjhjYjJkMDg3YTFlYzIiCiAKIEFOWV9PRl9ESVNUUk9fRkVBVFVSRVMgPSAiJHtHVEszRElT
VFJPRkVBVFVSRVN9IgogCi0tIAoyLjQ0LjAKCg==

--===============6262803867806281738==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (919 cached, 1 parsed). 1876 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-952afae4a5ca5f1743eb8ebb72ff41063b06790f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:952afae4a5ca5f1743eb8ebb72ff41063b06790f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 541 Local 528 Mirrors 0 Missed 13 Current 770 (97% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 3237 of 3589 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.76.1.bb:do_recipe_qa)
NOTE: Running task 3435 of 3589 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.76.1.bb:do_write_config)
NOTE: recipe vte-0.76.1-r0: task do_recipe_qa: Started
NOTE: recipe vte-0.76.1-r0: task do_write_config: Started
NOTE: recipe vte-0.76.1-r0: task do_write_config: Succeeded
NOTE: recipe vte-0.76.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3570 of 3589 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.76.1.bb:do_fetch)
NOTE: recipe vte-0.76.1-r0: task do_fetch: Started
NOTE: recipe vte-0.76.1-r0: task do_fetch: Succeeded
NOTE: Running task 3571 of 3589 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.76.1.bb:do_unpack)
NOTE: Running task 3572 of 3589 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.76.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vte-0.76.1-r0: task do_unpack: Started
NOTE: recipe vte-0.76.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vte-0.76.1-r0: task do_unpack: Succeeded
NOTE: Running task 3573 of 3589 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.76.1.bb:do_patch)
NOTE: Running task 3574 of 3589 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.76.1.bb:do_collect_spdx_deps)
NOTE: recipe vte-0.76.1-r0: task do_patch: Started
NOTE: recipe vte-0.76.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe vte-0.76.1-r0: task do_patch: Succeeded
NOTE: Running task 3575 of 3589 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.76.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3576 of 3589 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.76.1.bb:do_populate_lic)
NOTE: recipe vte-0.76.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.76.1-r0: task do_populate_lic: Started
NOTE: recipe vte-0.76.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vte-0.76.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vte-0.76.1-r0: task do_populate_lic: Succeeded
NOTE: recipe vte-0.76.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3577 of 3589 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.76.1.bb:do_configure)
NOTE: recipe vte-0.76.1-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd-systemctl-native.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.2.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_populate_sysroo
 t', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.41.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.3.1.bb
 :do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.12.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gperf/gperf_3.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot', 'virtual:na
 tive:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['bluez5', 'openssl', 'base-files', 'base-passwd', 'dbus', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'initscripts', 'libxcrypt', 'libxml2', 'ncurses', 'readline', 'systemd-systemctl-native', 'systemd', 'update-rc.d', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'orc', 'python3', 'qemu-native', 'quilt-native', 'libstd-rs', 'vala', 'bzip2', 'cracklib', 'libidn2', 'libnsl2', 'libtirpc', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'zstd', 'gdk-pixbuf', 'gi-docgen', 'gobject-introspection', 'gtk+3', 'gtk4', 'libgudev', 'librsvg', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'graphene', 'harfbuzz', 'libjpeg-turbo', 'libepoxy', 'libglu', 'mesa', 'pango', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libice', 'libpciaccess', 'libpthread-s
 tubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxcomposite', 'libxcursor', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxft', 'libxi', 'libxinerama', 'libxkbcommon', 'libxrandr', 'libxrender', 'libxshmfence', 'libxtst', 'libxv', 'libxxf86vm', 'pixman', 'xkeyboard-config', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'kmod', 'linux-libc-headers', 'alsa-lib', 'flac', 'gstreamer1.0-plugins-bad', 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'libogg', 'libpng', 'libsndfile1', 'libtheora', 'tiff', 'libvorbis', 'sbc', 'libwebp', 'at-spi2-core', 'acl', 'attr', 'bash-completion', 'curl', 'fribidi', 'gdbm', 'gmp', 'gnutls', 'libtasn1', 'icu', 'iso-codes', 'libcap-ng', 'libcap', 'libffi', 'libical', 'libpcre2', 'libseccomp', 'libunistring', 'libusb1', 'nettle', 'shared-mime-info', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'libxml2-native', 'ncurses-native', 'util-linux-libuuid-native', 'util-linux-native', 'zlib-native', 'flex-native', '
 gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'vala-native', 'bzip2-native', 'gperf-native', 'libnsl2-native', 'libtirpc-native', 'shadow-native', 'unzip-native', 'xz-native', 'zstd-native', 'gobject-introspection-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libbsd-native', 'libcap-ng-native', 'libffi-native', 'libmd-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dgir=true -Ddocs=false -Dvapi=true -Dfribidi=false -Dgnutls=true -Dgtk4=true -D_systemd=true...
| The Meson build system
| Version: 1.3.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vte/0.76.1/vte-0.76.1
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vte/0.76.1/build
| Build type: cross build
| Project name: vte
| Project version: 0.76.1
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vte/0.76.1/recipe-sysroot (gcc 13.2.0 "x86_64-poky-linux-gcc (GCC) 13.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vte/0.76.1/recipe-sysroot ld.bfd 2.42.0.20240216
| C++ compiler for the host machine: x86_64-poky-linux-g++ -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vte/0.76.1/recipe-sysroot (gcc 13.2.0 "x86_64-poky-linux-g++ (GCC) 13.2.0")
| C++ linker for the host machine: x86_64-poky-linux-g++ -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vte/0.76.1/recipe-sysroot ld.bfd 2.42.0.20240216
| C compiler for the build machine: gcc (gcc 13.2.0 "gcc (GCC) 13.2.0")
| C linker for the build machine: gcc ld.bfd 2.42.0.20240216
| C++ compiler for the build machine: g++ (gcc 13.2.0 "g++ (GCC) 13.2.0")
| C++ linker for the build machine: g++ ld.bfd 2.42.0.20240216
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Compiler for C supports arguments -std=gnu11: YES
| ../vte-0.76.1/meson.build:143: WARNING: Consider using the built-in option for language standard version instead of using "-std=gnu11".
| Compiler for C++ supports arguments -std=gnu++20: YES
| ../vte-0.76.1/meson.build:151: WARNING: Consider using the built-in option for language standard version instead of using "-std=gnu++20".
| Program python3 (dataclasses) found: YES (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vte/0.76.1/recipe-sysroot-native/usr/bin/nativepython3) modules: dataclasses
| Header "sys/ioctl.h" has symbol "TIOCGWINSZ" : YES
| Library m found: YES
| Checking if "fork" compiles: YES
| Checking if "grantpt" compiles: YES
| Checking if "posix_openpt" compiles: YES
| Checking if "ptsname" compiles: YES
| Checking if "tcgetattr" compiles: YES
| Checking if "unlockpt" compiles: YES
| Checking if "explicit_bzero" compiles: YES
| Checking if "fdwalk" compiles: NO
| Checking if "pread" compiles: YES
| Checking if "pwrite" compiles: YES
| Checking if "strchrnul" compiles: YES
| Checking if "close_range" compiles: YES
| Checking if "ceil" with dependency -lm compiles: YES
| Checking if "floor" with dependency -lm compiles: YES
| Checking if "round" with dependency -lm compiles: YES
| Compiler for C supports arguments -Wall: YES
| Compiler for C supports arguments -Wextra: YES
| Compiler for C supports arguments -Wcast-align: YES
| Compiler for C supports arguments -Wcast-function-type: YES
| Compiler for C supports arguments -Wclobbered: YES
| Compiler for C supports arguments -Wempty-body: YES
| Compiler for C supports arguments -Wendif-labels: YES
| Compiler for C supports arguments -Werror=init-self: YES
| Compiler for C supports arguments -Werror=missing-include-dirs: YES
| Compiler for C supports arguments -Werror=pointer-arith: YES
| Compiler for C supports arguments -Wfloat-equal: YES
| Compiler for C supports arguments -Wignored-qualifiers: YES
| Compiler for C supports arguments -Winvalid-pch: YES
| Compiler for C supports arguments -Wlogical-op: YES
| Compiler for C supports arguments -Wmisleading-indentation: YES
| Compiler for C supports arguments -Wmissing-declarations: YES
| Compiler for C supports arguments -Wmissing-field-initializers: YES
| Compiler for C supports arguments -Wmissing-format-attribute: YES
| Compiler for C supports arguments -Wmissing-include-dirs: YES
| Compiler for C supports arguments -Wmissing-noreturn: YES
| Compiler for C supports arguments -Wno-deprecated-declarations: YES
| Compiler for C supports arguments -Wno-address-of-packed-member: YES
| Compiler for C supports arguments -Wno-c99-designator: NO
| Compiler for C supports arguments -Wno-missing-field-initializers: YES
| Compiler for C supports arguments -Wno-packed: YES
| Compiler for C supports arguments -Wno-switch-enum: YES
| Compiler for C supports arguments -Wno-unused-parameter: YES
| Compiler for C supports arguments -Wno-volatile: NO
| Compiler for C supports arguments -Wshadow: YES
| Compiler for C supports arguments -Wshift-negative-value: YES
| Compiler for C supports arguments -Wsign-compare: YES
| Compiler for C supports arguments -Wstrict-aliasing=2: YES
| Compiler for C supports arguments -Wtype-limits: YES
| Compiler for C supports arguments -Wundef: YES
| Compiler for C supports arguments -Wuninitialized: YES
| Compiler for C supports arguments -Wuninitialized: YES (cached)
| Compiler for C supports arguments -Wunsafe-loop-optimizations: YES
| Compiler for C supports arguments -Wunused: YES
| Compiler for C supports arguments -Wunused-but-set-parameter: YES
| Compiler for C supports arguments -Wunused-but-set-variable: YES
| Compiler for C supports arguments -Wunused-function: YES
| Compiler for C supports arguments -Wunused-label: YES
| Compiler for C supports arguments -Wunused-local-typedefs: YES
| Compiler for C supports arguments -Wunused-value: YES
| Compiler for C supports arguments -Wunused-variable: YES
| Compiler for C supports arguments -Wvla: YES
| Compiler for C supports arguments -Wwrite-strings: YES
| Compiler for C supports arguments -fdiagnostics-show-option: YES
| Compiler for C supports arguments -fno-common: YES
| Compiler for C supports arguments -fno-semantic-interposition: YES
| Compiler for C supports arguments -fno-strict-aliasing: YES
| Compiler for C supports arguments -Waggregate-return: YES
| Compiler for C supports arguments -Werror=implicit-function-declaration: YES
| Compiler for C supports arguments -Werror=missing-prototypes: YES
| Compiler for C supports arguments -Wimplicit: YES
| Compiler for C supports arguments -Wimplicit-fallthrough=3: YES
| Compiler for C supports arguments -Wmissing-parameter-type: YES
| Compiler for C supports arguments -Wnested-externs: YES
| Compiler for C supports arguments -Wold-style-declaration: YES
| Compiler for C supports arguments -Wold-style-definition: YES
| Compiler for C supports arguments -Woverride-init: YES
| Compiler for C supports arguments -Wsign-compare: YES (cached)
| Compiler for C supports arguments -Wstrict-prototypes: YES
| Compiler for C++ supports arguments -Wall: YES
| Compiler for C++ supports arguments -Wextra: YES
| Compiler for C++ supports arguments -Wcast-align: YES
| Compiler for C++ supports arguments -Wcast-function-type: YES
| Compiler for C++ supports arguments -Wclobbered: YES
| Compiler for C++ supports arguments -Wempty-body: YES
| Compiler for C++ supports arguments -Wendif-labels: YES
| Compiler for C++ supports arguments -Werror=init-self: YES
| Compiler for C++ supports arguments -Werror=missing-include-dirs: YES
| Compiler for C++ supports arguments -Werror=pointer-arith: YES
| Compiler for C++ supports arguments -Wfloat-equal: YES
| Compiler for C++ supports arguments -Wignored-qualifiers: YES
| Compiler for C++ supports arguments -Winvalid-pch: YES
| Compiler for C++ supports arguments -Wlogical-op: YES
| Compiler for C++ supports arguments -Wmisleading-indentation: YES
| Compiler for C++ supports arguments -Wmissing-declarations: YES
| Compiler for C++ supports arguments -Wmissing-field-initializers: YES
| Compiler for C++ supports arguments -Wmissing-format-attribute: YES
| Compiler for C++ supports arguments -Wmissing-include-dirs: YES
| Compiler for C++ supports arguments -Wmissing-noreturn: YES
| Compiler for C++ supports arguments -Wno-deprecated-declarations: YES
| Compiler for C++ supports arguments -Wno-address-of-packed-member: YES
| Compiler for C++ supports arguments -Wno-c99-designator: NO
| Compiler for C++ supports arguments -Wno-missing-field-initializers: YES
| Compiler for C++ supports arguments -Wno-packed: YES
| Compiler for C++ supports arguments -Wno-switch-enum: YES
| Compiler for C++ supports arguments -Wno-unused-parameter: YES
| Compiler for C++ supports arguments -Wno-volatile: YES
| Compiler for C++ supports arguments -Wshadow: YES
| Compiler for C++ supports arguments -Wshift-negative-value: YES
| Compiler for C++ supports arguments -Wsign-compare: YES
| Compiler for C++ supports arguments -Wstrict-aliasing=2: YES
| Compiler for C++ supports arguments -Wtype-limits: YES
| Compiler for C++ supports arguments -Wundef: YES
| Compiler for C++ supports arguments -Wuninitialized: YES
| Compiler for C++ supports arguments -Wuninitialized: YES (cached)
| Compiler for C++ supports arguments -Wunsafe-loop-optimizations: YES
| Compiler for C++ supports arguments -Wunused: YES
| Compiler for C++ supports arguments -Wunused-but-set-parameter: YES
| Compiler for C++ supports arguments -Wunused-but-set-variable: YES
| Compiler for C++ supports arguments -Wunused-function: YES
| Compiler for C++ supports arguments -Wunused-label: YES
| Compiler for C++ supports arguments -Wunused-local-typedefs: YES
| Compiler for C++ supports arguments -Wunused-value: YES
| Compiler for C++ supports arguments -Wunused-variable: YES
| Compiler for C++ supports arguments -Wvla: YES
| Compiler for C++ supports arguments -Wwrite-strings: YES
| Compiler for C++ supports arguments -fdiagnostics-show-option: YES
| Compiler for C++ supports arguments -fno-common: YES
| Compiler for C++ supports arguments -fno-semantic-interposition: YES
| Compiler for C++ supports arguments -fno-strict-aliasing: YES
| Compiler for C++ supports arguments -Wimplicit-fallthrough=5: YES
| Compiler for C++ supports arguments -Wnon-virtual-dtor: YES
| Compiler for C++ supports arguments -Wstrict-null-sentinel: YES
| Compiler for C++ supports arguments -fvisibility-inlines-hidden: YES
| Compiler for C++ supports arguments -fvisibility=hidden: YES
| Compiler for C++ supports arguments -fvisibility-inlines-hidden: YES (cached)
| Compiler for C++ supports arguments -fvisibility=hidden: YES (cached)
| Compiler for C supports arguments -Werror=format=2 -Werror=format-nonliteral -Werror=format-security: YES
| Compiler for C++ supports arguments -Werror=format=2 -Werror=format-nonliteral -Werror=format-security: YES
| ../vte-0.76.1/meson.build:577: WARNING: Consider using the built-in warning_level option instead of using "-Wall".
| ../vte-0.76.1/meson.build:577: WARNING: Consider using the built-in warning_level option instead of using "-Wextra".
| ../vte-0.76.1/meson.build:578: WARNING: Consider using the built-in warning_level option instead of using "-Wall".
| ../vte-0.76.1/meson.build:578: WARNING: Consider using the built-in warning_level option instead of using "-Wextra".
| Compiler for C supports link arguments -Wl,-Bsymbolic: YES
| Compiler for C++ supports link arguments -Wl,-Bsymbolic: YES
| Compiler for C supports link arguments -Wl,-Bsymbolic-functions: YES
| Compiler for C++ supports link arguments -Wl,-Bsymbolic-functions: YES
| Compiler for C supports link arguments -fstack-protector: YES
| Compiler for C++ supports link arguments -fstack-protector: YES
| Compiler for C supports link arguments -fstack-protector-strong: YES
| Compiler for C++ supports link arguments -fstack-protector-strong: YES
| Found pkg-config: YES (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vte/0.76.1/recipe-sysroot-native/usr/bin/pkg-config) 0.29.2
| Run-time dependency cairo found: YES 1.18.0
| Run-time dependency cairo-gobject found: YES 1.18.0
| Run-time dependency gio-2.0 found: YES 2.78.4
| Run-time dependency glib-2.0 found: YES 2.78.4
| Run-time dependency gobject-2.0 found: YES 2.78.4
| Run-time dependency pango found: YES 1.52.2
| Run-time dependency libpcre2-8 found: YES 10.43
| Run-time dependency threads found: YES
| Found CMake: NO
| Run-time dependency liblz4 found: NO (tried pkgconfig)
| 
| ../vte-0.76.1/meson.build:615:20: ERROR: Dependency "liblz4" not found, tried pkgconfig
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vte/0.76.1/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vte/0.76.1/temp/run.do_configure.3119251:177 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vte/0.76.1/temp/run.do_configure.3119251, line 177
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vte/0.76.1/temp/run.do_configure.3119251, line 166
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vte/0.76.1/temp/run.do_configure.3119251, line 155
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vte/0.76.1/temp/run.do_configure.3119251, line 190
NOTE: recipe vte-0.76.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3577 tasks of which 3567 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240501155253.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240501155253.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.76.1.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: vte-0.76.1-r0 do_configure: meson failed
ERROR: vte-0.76.1-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vte/0.76.1/temp/run.do_configure.3119251', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vte/0.76.1/temp/log.do_configure.3119251
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.76.1.bb:do_configure) failed with exit code '1'

--===============6262803867806281738==--

