Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64ABFC47255
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:05 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.4645.1704114721462275955
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:12:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YB4w4c8t;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=i5AKCF5B;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018cc5270ffa-6278b423-95ae-4d2c-abf4-4413a52956ad-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=46lUUiGWRVVVT6x3tWe4Vq8rjPD5Ti53u+ZvwmQjeAY=;
	b=YB4w4c8tR7GkJ+X079g14olJq6go6F4HOxhRkEFsq8ilgYene32rJtTJzaSFb1kn
	jiIhICv9740VnKEYrwEu10uO+o7C+CHZNPob3zTLJdV9bnlm3/mKPFqURTOjLHdzCZt
	deERdHjOVXj7e745xq40BdDjekZz6wSvL2F11EZM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=46lUUiGWRVVVT6x3tWe4Vq8rjPD5Ti53u+ZvwmQjeAY=;
	b=i5AKCF5BKNlfwP1XKU7y4YiuC1RT8fpfwh3Oax2a0gm7nFvDQzo3HQPXG0ldphKE
	sfAJ/ErQbHiNjn9vFTUXSuAg9V5oxgi/+sUTYGQqmWQwvLdzb5GQWKy7a+Db6bsY2g5
	U9u/cYNjAwCya64UVRF/9BIAz29dcopeSakvjWzo=
Content-Type: multipart/mixed; boundary="===============7961205644986009664=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vte: upgrading to 0.74.2 SUCCEEDED
Message-ID: <0101018cc5270ffa-6278b423-95ae-4d2c-abf4-4413a52956ad-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:12:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193185

--===============7961205644986009664==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
ICp2dGUqIHRvICowLjc0LjIqIGhhcyBTdWNjZWVkZWQuCgpOZXh0IHN0ZXBzOgogICAgLSBhcHBs
eSB0aGUgcGF0Y2g6IGdpdCBhbSAwMDAxLXZ0ZS11cGdyYWRlLTAuNzQuMS0wLjc0LjIucGF0Y2gK
ICAgIC0gY2hlY2sgdGhlIGNoYW5nZXMgdG8gdXBzdHJlYW0gcGF0Y2hlcyBhbmQgc3VtbWFyaXpl
IHRoZW0gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLAogICAgLSBjb21waWxlIGFuIGltYWdlIHRoYXQg
Y29udGFpbnMgdGhlIHBhY2thZ2UKICAgIC0gcGVyZm9ybSBzb21lIGJhc2ljIHNhbml0eSB0ZXN0
cwogICAgLSBhbWVuZCB0aGUgcGF0Y2ggYW5kIHNpZ24gaXQgb2ZmOiBnaXQgY29tbWl0IC1zIC0t
cmVzZXQtYXV0aG9yIC0tYW1lbmQKICAgIC0gc2VuZCBpdCB0byB0aGUgYXBwcm9wcmlhdGUgbWFp
bGluZyBsaXN0CgpBbHRlcm5hdGl2ZWx5LCBpZiB5b3UgYmVsaWV2ZSB0aGUgcmVjaXBlIHNob3Vs
ZCBub3QgYmUgdXBncmFkZWQgYXQgdGhpcyB0aW1lLAp5b3UgY2FuIGZpbGwgUkVDSVBFX05PX1VQ
REFURV9SRUFTT04gaW4gcmVzcGVjdGl2ZSByZWNpcGUgZmlsZSBzbyB0aGF0CmF1dG9tYXRpYyB1
cGdyYWRlcyB3b3VsZCBubyBsb25nZXIgYmUgYXR0ZW1wdGVkLgoKUGxlYXNlIHJldmlldyB0aGUg
YXR0YWNoZWQgZmlsZXMgZm9yIGZ1cnRoZXIgaW5mb3JtYXRpb24gYW5kIGJ1aWxkL3VwZGF0ZSBm
YWlsdXJlcy4KQW55IHByb2JsZW0gcGxlYXNlIGZpbGUgYSBidWcgYXQgaHR0cHM6Ly9idWd6aWxs
YS55b2N0b3Byb2plY3Qub3JnL2VudGVyX2J1Zy5jZ2k/cHJvZHVjdD1BdXRvbWF0ZWQlMjBVcGRh
dGUlMjBIYW5kbGVyCgpSZWdhcmRzLApUaGUgVXBncmFkZSBIZWxwZXIKCi0tID44IC0tCkZyb20g
YTczYzhmYjcyM2QyMTIzNDY2ZGUyY2JhOTRmYmM4ZDI3NWRmMjhkOSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKRnJvbTogVXBncmFkZSBIZWxwZXIgPGF1aEB5b2N0b3Byb2plY3Qub3JnPgpEYXRl
OiBNb24sIDEgSmFuIDIwMjQgMTM6MDY6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2dGU6IHVw
Z3JhZGUgMC43NC4xIC0+IDAuNzQuMgoKLS0tCiAuLi4tQWRkLVdfRVhJVENPREUtbWFjcm8tZm9y
LW5vbi1nbGliYy1zeXN0ZW1zLnBhdGNoIHwgMTIgKysrKystLS0tLS0tCiAuLi4vdnRlL3t2dGVf
MC43NC4xLmJiID0+IHZ0ZV8wLjc0LjIuYmJ9ICAgICAgICAgICAgIHwgIDIgKy0KIDIgZmlsZXMg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L3Z0ZS97dnRlXzAuNzQuMS5iYiA9PiB2dGVfMC43NC4yLmJifSAoOTYlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAwMS1BZGQtV19FWElU
Q09ERS1tYWNyby1mb3Itbm9uLWdsaWJjLXN5c3RlbXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC92dGUvdnRlLzAwMDEtQWRkLVdfRVhJVENPREUtbWFjcm8tZm9yLW5vbi1nbGliYy1zeXN0
ZW1zLnBhdGNoCmluZGV4IDg5MzRkNWY4MGEuLjVmM2VmMWFlMDMgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAwMS1BZGQtV19FWElUQ09ERS1tYWNyby1mb3Itbm9u
LWdsaWJjLXN5c3RlbXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZS8w
MDAxLUFkZC1XX0VYSVRDT0RFLW1hY3JvLWZvci1ub24tZ2xpYmMtc3lzdGVtcy5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gZGU5NjM5YmFhYzc5MjMyN2M3MDFlNTA5MjU4YjhhMTNmNjk1OWU4
MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNjNlZmU4N2Y0MGM2NTI2MzhhMzkwYTNk
MTI4MTJlODY2MmFkMGMwMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IERhbmlsbyBT
cGluZWxsYSA8ZGFueXNwaW45N0Bwcm90b25tYWlsLmNvbT4KIERhdGU6IFRodSwgMjEgTWFyIDIw
MTkgMTQ6MTk6MjYgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gQWRkIFdfRVhJVENPREUgbWFjcm8g
Zm9yIG5vbi1nbGliYyBzeXN0ZW1zCkBAIC0xMSwxMiArMTEsMTMgQEAgVXBzdHJlYW0tU3RhdHVz
OiBTdWJtaXR0ZWQgWzFdCiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWFzIE3DvGxsZXIgPHNjaG5pdHpl
bHRvbnlAZ21haWwuY29tPgogCiBbMV0gaHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL3Z0
ZS9pc3N1ZXMvNzIKKwogLS0tCi0gc3JjL3dpZGdldC5jYyAgfCA0ICsrKwotIDEgZmlsZXMgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspCisgc3JjL3dpZGdldC5jYyB8IDQgKysrKworIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL3NyYy93aWRnZXQuY2MgYi9z
cmMvd2lkZ2V0LmNjCi1pbmRleCAwN2Y3Y2FiZi4uMzFhNzdmNjggMTAwNjQ0CitpbmRleCAwN2Y3
Y2FiLi4zMWE3N2Y2IDEwMDY0NAogLS0tIGEvc3JjL3dpZGdldC5jYwogKysrIGIvc3JjL3dpZGdl
dC5jYwogQEAgLTE2LDYgKzE2LDEwIEBACkBAIC0zMCw2ICszMSwzIEBAIGluZGV4IDA3ZjdjYWJm
Li4zMWE3N2Y2OCAxMDA2NDQKICAjaW5jbHVkZSAiY29uZmlnLmgiCiAgCiAgI2luY2x1ZGUgIndp
ZGdldC5oaCIKLS0tIAotMi40Mi4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0
L3Z0ZS92dGVfMC43NC4xLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZV8wLjc0LjIu
YmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQv
dnRlL3Z0ZV8wLjc0LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVf
MC43NC4yLmJiCmluZGV4IDA3MWY2Njg0NjQuLmQ4ZWFmZGUyZmIgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43NC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBw
b3J0L3Z0ZS92dGVfMC43NC4yLmJiCkBAIC0xOSw3ICsxOSw3IEBAIEdJRE9DR0VOX01FU09OX09Q
VElPTiA9ICJkb2NzIgogaW5oZXJpdCBnbm9tZWJhc2UgZ2ktZG9jZ2VuIGZlYXR1cmVzX2NoZWNr
IHVwc3RyZWFtLXZlcnNpb24taXMtZXZlbiBnb2JqZWN0LWludHJvc3BlY3Rpb24gc3lzdGVtZCB2
YWxhCiAKIFNSQ19VUkkgKz0gImZpbGU6Ly8wMDAxLUFkZC1XX0VYSVRDT0RFLW1hY3JvLWZvci1u
b24tZ2xpYmMtc3lzdGVtcy5wYXRjaCIKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjIz
MjhjM2YxYzk5ODM1MGExOGUwZTUxMzM0OGU5ZmM1ODFkNTdlYTRlN2I4OWFlZGYxMWUwZTNjNjUw
NDJiNGYiCitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICJhNTM1ZmIyYTk4ZmVhOGEyNDQ5
Y2QxYTAyY2NjZjUxOTAxMzFkZGRmZjUyZTcxNWFmZGFjZTNmZWI1MzZlYWU3IgogCiBBTllfT0Zf
RElTVFJPX0ZFQVRVUkVTID0gIiR7R1RLM0RJU1RST0ZFQVRVUkVTfSIKIAotLSAKMi40Mi4wCgo=

--===============7961205644986009664==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vte-upgrade-0.74.1-0.74.2.patch"

RnJvbSBhNzNjOGZiNzIzZDIxMjM0NjZkZTJjYmE5NGZiYzhkMjc1ZGYyOGQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKYW4gMjAyNCAxMzowNjowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ0
ZTogdXBncmFkZSAwLjc0LjEgLT4gMC43NC4yCgotLS0KIC4uLi1BZGQtV19FWElUQ09ERS1tYWNy
by1mb3Itbm9uLWdsaWJjLXN5c3RlbXMucGF0Y2ggfCAxMiArKysrKy0tLS0tLS0KIC4uLi92dGUv
e3Z0ZV8wLjc0LjEuYmIgPT4gdnRlXzAuNzQuMi5iYn0gICAgICAgICAgICAgfCAgMiArLQogMiBm
aWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3t2dGVfMC43NC4xLmJiID0+IHZ0ZV8wLjc0LjIuYmJ9ICg5
NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZS8wMDAxLUFkZC1X
X0VYSVRDT0RFLW1hY3JvLWZvci1ub24tZ2xpYmMtc3lzdGVtcy5wYXRjaCBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L3Z0ZS92dGUvMDAwMS1BZGQtV19FWElUQ09ERS1tYWNyby1mb3Itbm9uLWdsaWJj
LXN5c3RlbXMucGF0Y2gKaW5kZXggODkzNGQ1ZjgwYS4uNWYzZWYxYWUwMyAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZS8wMDAxLUFkZC1XX0VYSVRDT0RFLW1hY3JvLWZv
ci1ub24tZ2xpYmMtc3lzdGVtcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUv
dnRlLzAwMDEtQWRkLVdfRVhJVENPREUtbWFjcm8tZm9yLW5vbi1nbGliYy1zeXN0ZW1zLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkZTk2MzliYWFjNzkyMzI3YzcwMWU1MDkyNThiOGExM2Y2
OTU5ZTgyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2M2VmZTg3ZjQwYzY1MjYzOGEz
OTBhM2QxMjgxMmU4NjYyYWQwYzAxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogRGFu
aWxvIFNwaW5lbGxhIDxkYW55c3Bpbjk3QHByb3Rvbm1haWwuY29tPgogRGF0ZTogVGh1LCAyMSBN
YXIgMjAxOSAxNDoxOToyNiArMDEwMAogU3ViamVjdDogW1BBVENIXSBBZGQgV19FWElUQ09ERSBt
YWNybyBmb3Igbm9uLWdsaWJjIHN5c3RlbXMKQEAgLTExLDEyICsxMSwxMyBAQCBVcHN0cmVhbS1T
dGF0dXM6IFN1Ym1pdHRlZCBbMV0KIFNpZ25lZC1vZmYtYnk6IEFuZHJlYXMgTcO8bGxlciA8c2No
bml0emVsdG9ueUBnbWFpbC5jb20+CiAKIFsxXSBodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05P
TUUvdnRlL2lzc3Vlcy83MgorCiAtLS0KLSBzcmMvd2lkZ2V0LmNjICB8IDQgKysrCi0gMSBmaWxl
cyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKKyBzcmMvd2lkZ2V0LmNjIHwgNCArKysrCisgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvc3JjL3dpZGdldC5j
YyBiL3NyYy93aWRnZXQuY2MKLWluZGV4IDA3ZjdjYWJmLi4zMWE3N2Y2OCAxMDA2NDQKK2luZGV4
IDA3ZjdjYWIuLjMxYTc3ZjYgMTAwNjQ0CiAtLS0gYS9zcmMvd2lkZ2V0LmNjCiArKysgYi9zcmMv
d2lkZ2V0LmNjCiBAQCAtMTYsNiArMTYsMTAgQEAKQEAgLTMwLDYgKzMxLDMgQEAgaW5kZXggMDdm
N2NhYmYuLjMxYTc3ZjY4IDEwMDY0NAogICNpbmNsdWRlICJjb25maWcuaCIKICAKICAjaW5jbHVk
ZSAid2lkZ2V0LmhoIgotLS0gCi0yLjQyLjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvdnRlL3Z0ZV8wLjc0LjEuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlXzAu
NzQuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC92dGUvdnRlXzAuNzQuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRl
L3Z0ZV8wLjc0LjIuYmIKaW5kZXggMDcxZjY2ODQ2NC4uZDhlYWZkZTJmYiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZV8wLjc0LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvdnRlL3Z0ZV8wLjc0LjIuYmIKQEAgLTE5LDcgKzE5LDcgQEAgR0lET0NHRU5fTUVT
T05fT1BUSU9OID0gImRvY3MiCiBpbmhlcml0IGdub21lYmFzZSBnaS1kb2NnZW4gZmVhdHVyZXNf
Y2hlY2sgdXBzdHJlYW0tdmVyc2lvbi1pcy1ldmVuIGdvYmplY3QtaW50cm9zcGVjdGlvbiBzeXN0
ZW1kIHZhbGEKIAogU1JDX1VSSSArPSAiZmlsZTovLzAwMDEtQWRkLVdfRVhJVENPREUtbWFjcm8t
Zm9yLW5vbi1nbGliYy1zeXN0ZW1zLnBhdGNoIgotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0g
PSAiMjMyOGMzZjFjOTk4MzUwYTE4ZTBlNTEzMzQ4ZTlmYzU4MWQ1N2VhNGU3Yjg5YWVkZjExZTBl
M2M2NTA0MmI0ZiIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gImE1MzVmYjJhOThmZWE4
YTI0NDljZDFhMDJjY2NmNTE5MDEzMWRkZGZmNTJlNzE1YWZkYWNlM2ZlYjUzNmVhZTciCiAKIEFO
WV9PRl9ESVNUUk9fRkVBVFVSRVMgPSAiJHtHVEszRElTVFJPRkVBVFVSRVN9IgogCi0tIAoyLjQy
LjAKCg==

--===============7961205644986009664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/vte/libvte: FILELIST: removed "/usr/lib/libvte-2.91.so.0.7400.1", added "/usr/lib/libvte-2.91.so.0.7400.2"
Changes to packages/core2-64-poky-linux/vte (sysroot):
  /usr/lib/libvte-2.91.so.0 changed symlink target from libvte-2.91.so.0.7400.1 to libvte-2.91.so.0.7400.2
  /usr/lib/libvte-2.91.so.0.7400.1 moved to /usr/lib/libvte-2.91.so.0.7400.2

--===============7961205644986009664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/vte: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte: SRC_URI changed from "https://download.gnome.org/sources//vte/0.74/vte-0.74.1.tar.xz;name=archive file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch" to "https://download.gnome.org/sources//vte/0.74/vte-0.74.2.tar.xz;name=archive file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
packages/core2-64-poky-linux/vte: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/libvte-gtk4: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/libvte-gtk4: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/libvte: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/libvte: FILELIST: removed "/usr/lib/libvte-2.91.so.0.7400.1", added "/usr/lib/libvte-2.91.so.0.7400.2"
packages/core2-64-poky-linux/vte/libvte: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
Changes to packages/core2-64-poky-linux/vte (sysroot):
  /usr/lib/libvte-2.91.so.0 changed symlink target from libvte-2.91.so.0.7400.1 to libvte-2.91.so.0.7400.2
  /usr/lib/libvte-2.91.so.0.7400.1 moved to /usr/lib/libvte-2.91.so.0.7400.2
packages/core2-64-poky-linux/vte/vte-dbg: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-dbg: PKGSIZE changed from 14127200 to 14127104 (-0%)
packages/core2-64-poky-linux/vte/vte-dbg: FILELIST: removed "/usr/lib/.debug/libvte-2.91.so.0.7400.1", added "/usr/lib/.debug/libvte-2.91.so.0.7400.2"
packages/core2-64-poky-linux/vte/vte-dbg: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-dev: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-dev: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-doc: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-doc: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-gtk4-dev: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-gtk4-dev: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-gtk4: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-gtk4: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ab: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-ab: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-am: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-am: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-an: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-an: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ang: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-ang: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ar: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-ar: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-as: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-as: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ast: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-ast: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-az: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-az: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-be+latin: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-be+latin: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-be: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-be: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-bg: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-bg: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-bn-in: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-bn-in: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-bn: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-bn: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-bs: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-bs: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ca+valencia: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-ca+valencia: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ca: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-ca: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ckb: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-ckb: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-cs: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-cs: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-cy: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-cy: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-da: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-da: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-de: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-de: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-dz: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-dz: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-el: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-el: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-en+shaw: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-en+shaw: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-en-ca: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-en-ca: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-en-gb: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-en-gb: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-eo: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-eo: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-es: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-es: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-et: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-et: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-eu: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-eu: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-fa: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-fa: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-fi: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-fi: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-fr: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-fr: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-fur: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-fur: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ga: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-ga: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-gd: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-gd: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-gl: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-gl: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-gu: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-gu: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-he: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-he: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-hi: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-hi: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-hr: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-hr: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-hu: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-hu: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-id: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-id: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-is: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-is: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-it: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-it: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ja: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-ja: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ka: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-ka: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-kk: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-kk: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-kn: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-kn: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ko: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-ko: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ku: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-ku: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ky: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-ky: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-li: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-li: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-lt: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-lt: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-lv: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-lv: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-mai: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-mai: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-mi: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-mi: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-mjw: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-mjw: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-mk: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-mk: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ml: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-ml: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-mn: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-mn: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-mr: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-mr: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ms: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-ms: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-nb: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-nb: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-nds: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-nds: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ne: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-ne: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-nl: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-nl: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-nn: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-nn: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-oc: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-oc: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-or: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-or: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-pa: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-pa: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-pl: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-pl: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-pt-br: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-pt-br: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-pt: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-pt: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ro: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-ro: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ru: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-ru: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-rw: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-rw: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-si: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-si: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-sk: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-sk: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-sl: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-sl: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-sq: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-sq: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-sr+latin: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-sr+latin: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-sr: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-sr: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-sv: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-sv: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ta: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-ta: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-te: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-te: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-tg: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-tg: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-th: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-th: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-tr: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-tr: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-ug: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-ug: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-uk: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-uk: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-uz+cyrillic: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-uz+cyrillic: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-vi: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-vi: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-wa: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-wa: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-xh: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-xh: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-zh-cn: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-zh-cn: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-zh-hk: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-zh-hk: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-locale-zh-tw: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-locale-zh-tw: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-prompt: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-prompt: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-src: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-src: PKGSIZE changed from 2264941 to 2265065 (+0%)
packages/core2-64-poky-linux/vte/vte-src: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte-staticdev: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte-staticdev: PKGV changed from 0.74.1 [default] to 0.74.2 [default]
packages/core2-64-poky-linux/vte/vte: PV changed from "0.74.1" to "0.74.2"
packages/core2-64-poky-linux/vte/vte: PKGV changed from 0.74.1 [default] to 0.74.2 [default]

--===============7961205644986009664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 913 .bb files complete (0 cached, 913 parsed). 1848 targets, 49 skipped, 0 masked, 0 errors.
Removing 123 recipes from the core2-64 sysroot...done.
Removing 123 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-55511d8bd5059d2fa4a5611a72738a4e3ed0e877"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:55511d8bd5059d2fa4a5611a72738a4e3ed0e877"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 911 Local 891 Mirrors 0 Missed 20 Current 381 (97% match, 98% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 389 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 390 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 402 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 403 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 404 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk4-4.12.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk4-4.12.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 523 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 524 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_packagedata_setscene)
NOTE: recipe gtk4-4.12.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 530 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 533 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 534 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 542 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 543 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 547 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 559 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 564 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_create_spdx_setscene)
NOTE: recipe gnutls-3.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk4-4.12.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk4-4.12.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1390 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_fetch)
NOTE: Running task 1405 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.74.2.bb:do_recipe_qa)
NOTE: Running task 1408 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_write_config)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1429 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.74.2.bb:do_write_config)
NOTE: recipe pango-1.51.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 574 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 577 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 586 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 588 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 589 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: recipe gtk+3-3.24.38-r0: task do_fetch: Started
NOTE: recipe vte-0.74.2-r0: task do_recipe_qa: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_write_config: Started
NOTE: recipe gnutls-3.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_fetch: Succeeded
NOTE: Running setscene task 593 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe icu-74-1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 594 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 596 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 598 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vte-0.74.2-r0: task do_write_config: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_write_config: Succeeded
NOTE: recipe vte-0.74.2-r0: task do_write_config: Succeeded
NOTE: Running task 1480 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_unpack)
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe icu-74-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 600 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_create_spdx_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 601 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.1.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vte-0.74.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1500 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.74.2.bb:do_fetch)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 606 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_create_spdx_setscene)
NOTE: recipe gnutls-3.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vte-0.74.2-r0: task do_fetch: Started
NOTE: Running setscene task 609 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 612 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vte-0.74.2-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 614 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 615 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 617 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 619 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1506 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.74.2.bb:do_unpack)
NOTE: recipe mesa-2_23.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 623 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_create_spdx_setscene)
NOTE: Running setscene task 624 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 627 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 628 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 637 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_create_spdx_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vte-0.74.2-r0: task do_unpack: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk4-4.12.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 639 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 642 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 643 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 645 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 647 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 648 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 649 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 650 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 661 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gi-docgen-2023.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 662 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 665 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_create_spdx_setscene)
NOTE: recipe vte-0.74.2-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 666 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk4-4.12.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 668 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 670 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 672 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.8.bb:do_packagedata_setscene)
NOTE: recipe gi-docgen-2023.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk4-4.12.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 674 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 676 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 677 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 678 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 680 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 683 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 686 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 688 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 691 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 693 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gi-docgen-2023.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_packagedata_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1541 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.74.2.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 697 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_create_spdx_setscene)
NOTE: recipe gi-docgen-2023.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 699 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe vte-0.74.2-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 702 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 712 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe vte-0.74.2-r0: task do_patch: Succeeded
NOTE: Running task 1590 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.74.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1591 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.74.2.bb:do_populate_lic)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vte-0.74.2-r0: task do_populate_lic: Started
NOTE: recipe vte-0.74.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_unpack: Succeeded
NOTE: Running task 1602 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_patch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 715 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe gtk+3-3.24.38-r0: task do_patch: Started
NOTE: recipe vte-0.74.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.74.2.bb:do_populate_lic unihash changed to ad10e91adbaab39d4775678930cf98164e4c64f6e427855448307b8e893e9600
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 717 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 718 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 720 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_recipe_qa_setscene)
NOTE: recipe vte-0.74.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_patch: Succeeded
NOTE: Running setscene task 724 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 726 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 732 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.71.bb:do_packagedata_setscene)
NOTE: Running setscene task 733 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.71.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 734 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata_setscene)
NOTE: Running setscene task 735 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 736 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 737 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 738 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 739 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 740 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 742 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 744 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 745 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 746 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 747 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 748 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.71-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.71-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 750 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 751 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 752 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 754 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_packagedata_setscene)
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 756 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 758 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.71-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 760 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 761 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 763 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe libwebp-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 765 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.71-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 767 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.71.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 768 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.40-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 769 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 770 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 772 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.74.1.bb:do_packagedata_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.74.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.71-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 774 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: recipe libwebp-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 775 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 777 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 779 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 780 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.71-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.74.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 783 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 784 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 788 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: recipe curl-8.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libstd-rs-1.74.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 789 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 791 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 792 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.74.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 795 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 797 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 801 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 803 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 804 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 805 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 808 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe libwebp-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 809 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 810 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 811 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 812 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 813 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 815 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 816 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_packagedata_setscene)
NOTE: recipe libwebp-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 817 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 820 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 823 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 824 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libstd-rs-1.74.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 826 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 828 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 830 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.74.1.bb:do_recipe_qa_setscene)
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 832 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 833 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 836 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.51.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 838 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 840 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 841 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.74.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 843 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 844 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 845 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 847 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 848 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-8.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.74.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 851 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 853 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 854 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 856 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 857 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 860 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 861 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 862 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 864 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 866 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-8.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 868 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 869 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 870 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 871 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 873 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 874 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 877 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-8.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 878 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 880 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 882 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 885 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 886 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 888 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 890 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 892 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 894 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 895 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-8.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 896 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 898 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 899 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.1.bb:do_packagedata_setscene)
NOTE: recipe curl-8.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 900 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 901 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 904 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 905 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 907 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 908 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 911 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 912 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 913 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 914 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 917 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 920 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 922 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 924 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 925 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 927 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 928 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 930 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 931 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 933 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 934 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 936 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.119.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 938 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe icu-74-1-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 939 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 940 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 941 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 943 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 945 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 948 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.119-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 949 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.119.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 952 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 953 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-74-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 954 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 955 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 956 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.119-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 957 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 958 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 960 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 961 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 963 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.119-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 965 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 967 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 969 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 970 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 972 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 974 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 975 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.119-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 977 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.119.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 978 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 980 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 981 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 983 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 984 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.119-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 988 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 989 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 991 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 993 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 995 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 997 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 999 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.119-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1001 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1003 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1005 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1006 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1008 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1010 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1014 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1017 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1019 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1020 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-74-1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1022 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1023 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1025 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1027 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1029 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1031 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1032 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1034 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1035 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1037 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1039 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1041 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1042 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1043 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1049 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1050 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-74-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1052 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1054 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1055 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1056 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1058 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1060 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 1061 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: Running task 1730 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-74-1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1063 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1064 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1066 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-74-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1067 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1069 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_recipe_qa_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1769 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1805 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1073 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1074 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1075 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1078 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1080 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1082 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1083 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1084 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1944 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1086 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1087 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1088 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1089 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1092 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1094 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1095 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1097 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1098 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1099 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1100 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1103 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2056 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1107 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1108 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1111 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1112 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1113 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1115 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1116 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1117 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1119 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running task 2078 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1121 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1123 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1125 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1126 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 2089 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1132 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1133 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1134 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1136 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1137 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1138 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1139 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1140 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1141 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1143 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1144 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1145 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1146 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1147 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1148 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1150 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1152 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1155 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1157 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1159 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1161 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1162 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1165 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1166 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1167 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1168 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1170 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1171 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1173 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1176 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1177 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1178 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1179 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running setscene task 1180 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1182 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2158 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1185 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1187 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1190 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1192 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libpcre2/10.42/temp/log.do_packagedata_setscene.2946067
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1193 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_package_setscene)
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1196 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_package_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1198 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1200 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1201 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1202 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1203 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1205 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1206 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1207 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1208 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1209 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1210 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1211 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1216 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1218 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1221 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1223 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1224 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1225 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1227 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1229 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1230 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1232 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1235 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1236 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1238 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1240 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1242 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1243 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1248 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2257 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1250 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1252 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1253 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1255 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e644ec3722734ea60494db1182afab8d0334f493c3dc1fb845b731f7ca727b46
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash ee867b8e117e812d25fbf7f46d6dac09c33c727dcaccf2a99b58e0b0d2fd2bfb to hashserv.yocto.io:8686 ({'taskhash': '12fd6b6b68e64bd275f6dadde8e4aab6d420ed4d2a82249c976404c2a4020e61', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'ee867b8e117e812d25fbf7f46d6dac09c33c727dcaccf2a99b58e0b0d2fd2bfb'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 12fd6b6b68e64bd275f6dadde8e4aab6d420ed4d2a82249c976404c2a4020e61 -> ee867b8e117e812d25fbf7f46d6dac09c33c727dcaccf2a99b58e0b0d2fd2bfb as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1257 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1258 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1260 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1261 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1263 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1265 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1266 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1267 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1271 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1272 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1274 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1279 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1281 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1282 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1285 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1287 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1288 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1290 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1292 of 1292 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2755 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2823 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 5009bfdce64be5968dd9927eeb08146bbc59582b45f2dbfd597d0d6515f565bd
NOTE: Running task 3448 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3497 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_collect_spdx_deps)
NOTE: recipe gtk+3-3.24.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3499 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_configure)
NOTE: recipe gtk+3-3.24.38-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_configure: Succeeded
NOTE: Running task 3500 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_compile)
NOTE: recipe gtk+3-3.24.38-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_compile: Succeeded
NOTE: Running task 3501 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_install)
NOTE: recipe gtk+3-3.24.38-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_install: Succeeded
NOTE: Running task 3502 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_package)
NOTE: Running task 3503 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.38-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3504 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.74.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vte-0.74.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vte-0.74.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3505 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.74.2.bb:do_configure)
NOTE: recipe vte-0.74.2-r0: task do_configure: Started
NOTE: recipe vte-0.74.2-r0: task do_configure: Succeeded
NOTE: Running task 3506 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.74.2.bb:do_compile)
NOTE: recipe vte-0.74.2-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_package: Succeeded
NOTE: Running task 3507 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.38-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_packagedata unihash changed to 94d22f711f477d929a54f714b120c798d26dfe83e8832d5b2e8c91e98fee23f0
NOTE: Setscene tasks completed
NOTE: Running task 3508 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx)
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx: Succeeded
NOTE: Running task 3509 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.74.2.bb:do_collect_spdx_deps)
NOTE: recipe vte-0.74.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe vte-0.74.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vte-0.74.2-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3510 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.74.2.bb:do_install)
NOTE: recipe vte-0.74.2-r0: task do_install: Started
NOTE: recipe vte-0.74.2-r0: task do_install: Succeeded
NOTE: Running task 3511 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.74.2.bb:do_package)
NOTE: Running task 3512 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.74.2.bb:do_populate_sysroot)
NOTE: recipe vte-0.74.2-r0: task do_package: Started
NOTE: recipe vte-0.74.2-r0: task do_populate_sysroot: Started
NOTE: recipe vte-0.74.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vte-0.74.2-r0: task do_package: Succeeded
NOTE: Running task 3513 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.74.2.bb:do_packagedata)
NOTE: recipe vte-0.74.2-r0: task do_packagedata: Started
NOTE: recipe vte-0.74.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3514 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.74.2.bb:do_create_spdx)
NOTE: Running task 3515 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.74.2.bb:do_package_write_ipk)
NOTE: Running task 3516 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.74.2.bb:do_package_write_deb)
NOTE: Running task 3517 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.74.2.bb:do_package_write_rpm)
NOTE: Running task 3518 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.74.2.bb:do_package_qa)
NOTE: recipe vte-0.74.2-r0: task do_create_spdx: Started
NOTE: recipe vte-0.74.2-r0: task do_package_write_ipk: Started
NOTE: recipe vte-0.74.2-r0: task do_package_write_deb: Started
NOTE: recipe vte-0.74.2-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.74.2-r0: task do_package_qa: Started
NOTE: recipe vte-0.74.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3519 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.74.2.bb:do_create_runtime_spdx)
NOTE: recipe vte-0.74.2-r0: task do_package_qa: Succeeded
NOTE: recipe vte-0.74.2-r0: task do_create_runtime_spdx: Started
NOTE: recipe vte-0.74.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe vte-0.74.2-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe vte-0.74.2-r0: task do_package_write_deb: Succeeded
NOTE: recipe vte-0.74.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3520 of 3520 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.74.2.bb:do_build)
NOTE: Tasks Summary: Attempted 3520 tasks of which 3474 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 14 ERROR messages, returning a non-zero exit code.
ERROR: libpcre2-10.42-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre2-src went backwards which would break package feeds (from 0:10.43-RC1-r0 to 0:10.42-r0) [version-going-backwards]
ERROR: libpcre2-10.42-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre2-dbg went backwards which would break package feeds (from 0:10.43-RC1-r0 to 0:10.42-r0) [version-going-backwards]
ERROR: libpcre2-10.42-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre2-16 went backwards which would break package feeds (from 0:10.43-RC1-r0 to 0:10.42-r0) [version-going-backwards]
ERROR: libpcre2-10.42-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre2-32 went backwards which would break package feeds (from 0:10.43-RC1-r0 to 0:10.42-r0) [version-going-backwards]
ERROR: libpcre2-10.42-r0 do_packagedata_setscene: QA Issue: Package version for package pcre2grep went backwards which would break package feeds (from 0:10.43-RC1-r0 to 0:10.42-r0) [version-going-backwards]
ERROR: libpcre2-10.42-r0 do_packagedata_setscene: QA Issue: Package version for package pcre2grep-doc went backwards which would break package feeds (from 0:10.43-RC1-r0 to 0:10.42-r0) [version-going-backwards]
ERROR: libpcre2-10.42-r0 do_packagedata_setscene: QA Issue: Package version for package pcre2test went backwards which would break package feeds (from 0:10.43-RC1-r0 to 0:10.42-r0) [version-going-backwards]
ERROR: libpcre2-10.42-r0 do_packagedata_setscene: QA Issue: Package version for package pcre2test-doc went backwards which would break package feeds (from 0:10.43-RC1-r0 to 0:10.42-r0) [version-going-backwards]
ERROR: libpcre2-10.42-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre2-staticdev went backwards which would break package feeds (from 0:10.43-RC1-r0 to 0:10.42-r0) [version-going-backwards]
ERROR: libpcre2-10.42-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre2-dev went backwards which would break package feeds (from 0:10.43-RC1-r0 to 0:10.42-r0) [version-going-backwards]
ERROR: libpcre2-10.42-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre2-doc went backwards which would break package feeds (from 0:10.43-RC1-r0 to 0:10.42-r0) [version-going-backwards]
ERROR: libpcre2-10.42-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre2-locale went backwards which would break package feeds (from 0:10.43-RC1-r0 to 0:10.42-r0) [version-going-backwards]
ERROR: libpcre2-10.42-r0 do_packagedata_setscene: QA Issue: Package version for package libpcre2 went backwards which would break package feeds (from 0:10.43-RC1-r0 to 0:10.42-r0) [version-going-backwards]
ERROR: libpcre2-10.42-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7961205644986009664==--

