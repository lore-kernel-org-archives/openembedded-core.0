Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E8AD5E143
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:40 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17195.1765872154046813139
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=z0pGtVuM;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=mY69yL0p;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019b262ec292-350916c7-2821-4c18-b77f-6b1d0089f7bb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872157;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zno7c73atuXBb6LNJiyRxNAsew2IRugJC0q9zlbK/ag=;
	b=z0pGtVuMY3LT56Skmb7OSYOOtwWEYKzBPi/Smo98LUG35gNJkt3P7f9XXgWU29c/
	Mrqq0soqFAb1+jHb9NFtz0XkhZH4R0E5+2YPFD53e1pvXWnNDU+kFZ5l1E2G4s1jfvG
	ZF++eWVwlWQm9pDMX4TCnGBRz4NQnY9aq5oQ53rw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872157;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zno7c73atuXBb6LNJiyRxNAsew2IRugJC0q9zlbK/ag=;
	b=mY69yL0p8lXwwlxg07auUDZQO0O3d5+INDWscsF2qyu/Sai6ehadP4oOdh1k8hAg
	RZcO52rPoa0ThB0j6zOj4Y7QQHCG8aCShiARUokcKrYylVfVdGhrjX6m8/2aIrWe9mt
	SvCnzWoNFjZdCmar7yd3Gacgs1aqbJ3ZaA737M54=
Content-Type: multipart/mixed; boundary="===============0011554466018557186=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] freetype: upgrading to 2.14.1 SUCCEEDED
Message-ID: <0101019b262ec292-350916c7-2821-4c18-b77f-6b1d0089f7bb-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227861

--===============0011554466018557186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpmcmVldHlwZSogdG8gKjIuMTQuMSogaGFzIFN1Y2NlZWRlZC4KCk5leHQgc3RlcHM6CiAg
ICAtIGFwcGx5IHRoZSBwYXRjaDogZ2l0IGFtIDAwMDEtZnJlZXR5cGUtdXBncmFkZS0yLjEzLjMt
Mi4xNC4xLnBhdGNoCiAgICAtIGNoZWNrIHRoZSBjaGFuZ2VzIHRvIHVwc3RyZWFtIHBhdGNoZXMg
YW5kIHN1bW1hcml6ZSB0aGVtIGluIHRoZSBjb21taXQgbWVzc2FnZSwKICAgIC0gY29tcGlsZSBh
biBpbWFnZSB0aGF0IGNvbnRhaW5zIHRoZSBwYWNrYWdlCiAgICAtIHBlcmZvcm0gc29tZSBiYXNp
YyBzYW5pdHkgdGVzdHMKICAgIC0gYW1lbmQgdGhlIHBhdGNoIGFuZCBzaWduIGl0IG9mZjogZ2l0
IGNvbW1pdCAtcyAtLXJlc2V0LWF1dGhvciAtLWFtZW5kCiAgICAtIHNlbmQgaXQgdG8gdGhlIGFw
cHJvcHJpYXRlIG1haWxpbmcgbGlzdAoKQWx0ZXJuYXRpdmVseSwgaWYgeW91IGJlbGlldmUgdGhl
IHJlY2lwZSBzaG91bGQgbm90IGJlIHVwZ3JhZGVkIGF0IHRoaXMgdGltZSwKeW91IGNhbiBmaWxs
IFJFQ0lQRV9OT19VUERBVEVfUkVBU09OIGluIHJlc3BlY3RpdmUgcmVjaXBlIGZpbGUgc28gdGhh
dAphdXRvbWF0aWMgdXBncmFkZXMgd291bGQgbm8gbG9uZ2VyIGJlIGF0dGVtcHRlZC4KClBsZWFz
ZSByZXZpZXcgdGhlIGF0dGFjaGVkIGZpbGVzIGZvciBmdXJ0aGVyIGluZm9ybWF0aW9uIGFuZCBi
dWlsZC91cGRhdGUgZmFpbHVyZXMuCkFueSBwcm9ibGVtIHBsZWFzZSBmaWxlIGEgYnVnIGF0IGh0
dHBzOi8vYnVnemlsbGEueW9jdG9wcm9qZWN0Lm9yZy9lbnRlcl9idWcuY2dpP3Byb2R1Y3Q9QXV0
b21hdGVkJTIwVXBkYXRlJTIwSGFuZGxlcgoKUmVnYXJkcywKVGhlIFVwZ3JhZGUgSGVscGVyCgot
LSA+OCAtLQpGcm9tIDJiZjY4ZWNkNzVkNWZhNGZiOTAxZWM1ZDk0ODM3ODk2ZTgzZjQzOTQgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCkZyb206IFVwZ3JhZGUgSGVscGVyIDxhdWhAeW9jdG9wcm9q
ZWN0Lm9yZz4KRGF0ZTogVHVlLCAxNiBEZWMgMjAyNSAwNDowODozMSArMDAwMApTdWJqZWN0OiBb
UEFUQ0hdIGZyZWV0eXBlOiB1cGdyYWRlIDIuMTMuMyAtPiAyLjE0LjEKCi0tLQogLi4ue2ZyZWV0
eXBlXzIuMTMuMy5iYiA9PiBmcmVldHlwZV8yLjE0LjEuYmJ9IHwgNTMgKysrKysrKysrKysrKysr
KystLQogMSBmaWxlIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ZyZWV0eXBlL3tmcmVldHlwZV8yLjEzLjMuYmIg
PT4gZnJlZXR5cGVfMi4xNC4xLmJifSAoNDclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1n
cmFwaGljcy9mcmVldHlwZS9mcmVldHlwZV8yLjEzLjMuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvZnJlZXR5cGUvZnJlZXR5cGVfMi4xNC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggNDclCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9mcmVldHlwZS9mcmVldHlwZV8yLjEzLjMuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9mcmVldHlwZS9mcmVldHlwZV8yLjE0LjEu
YmIKaW5kZXggZGJmZmZkYjY1Zi4uYjZlMzNjODI3NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL2ZyZWV0eXBlL2ZyZWV0eXBlXzIuMTMuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvZnJlZXR5cGUvZnJlZXR5cGVfMi4xNC4xLmJiCkBAIC0xLDMgKzEsNTAgQEAKKyMg
RklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAn
ZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3
ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRo
ZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgor
IyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1w
bGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhl
IGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNFLlRYVAorIyArKysgTElDRU5TRS5UWFQKKyMgQEAg
LTM1LDkgKzM1LDEwIEBACisjICBUaGUgZ3ppcCAgbW9kdWxlIHVzZXMgdGhlICB6bGliIGxpY2Vu
c2UgKHNlZSAgYHNyYy9nemlwL3psaWIuaGApIHdoaWNoCisjICB0b28gaXMgY29tcGF0aWJsZSB0
byB0aGUgYWJvdmUgdHdvIGxpY2Vuc2VzLgorIyAgCisjIC1UaGUgZmlsZXMgYHNyYy9hdXRvZml0
L2Z0LWhiLmNgIGFuZCBgc3JjL2F1dG9maXQvZnQtaGIuaGAgY29udGFpbiBjb2RlCisjIC10YWtl
biBhbG1vc3QgIHZlcmJhdGltIGZyb20gdGhlICBIYXJmQnV6eiBmaWxlIGBoYi1mdC5jY2AsICB3
aGljaCB1c2VzCisjIC10aGUgJ09sZCBNSVQnIGxpY2Vuc2UsIGNvbXBhdGlibGUgdG8gdGhlIGFi
b3ZlIHR3byBsaWNlbnNlcy4KKyMgK1RoZSAgIGZpbGVzICAgYHNyYy9hdXRvZml0L2Z0LWhiLWZ0
LmNgLCAgIGBzcmMvYXV0b2ZpdC9mdC1oYi1kZWNscy5oYCwKKyMgK2BzcmMvYXV0b2ZpdC9mdC1o
Yi10eXBlcy5oYCwgICAgIGFuZCAgICBgc3JjL2F1dG9maXQvaGItc2NyaXB0LWxpc3QuaGAKKyMg
K2NvbnRhaW4gY29kZSB0YWtlbiAoYWxtb3N0KSB2ZXJiYXRpbSAgZnJvbSB0aGUgSGFyZkJ1enog
bGlicmFyeSwgd2hpY2gKKyMgK3VzZXMgdGhlICdPbGQgTUlUJyBsaWNlbnNlIGNvbXBhdGlibGUg
dG8gdGhlIGFib3ZlIHR3byBsaWNlbnNlcy4KKyMgIAorIyAgVGhlICBNRDUgY2hlY2tzdW0gIHN1
cHBvcnQgIChvbmx5IHVzZWQgIGZvciAgZGVidWdnaW5nIGluICBkZXZlbG9wbWVudAorIyAgYnVp
bGRzKSBpcyBpbiB0aGUgcHVibGljIGRvbWFpbi4KKyMgLS0tIGRvY3MvRlRMLlRYVAorIyArKysg
ZG9jcy9GVEwuVFhUCisjIEBAIC00OSw3ICs0OSw3IEBACisjICAKKyMgICAgICIiIgorIyAgICAg
IFBvcnRpb25zIG9mIHRoaXMgc29mdHdhcmUgYXJlIGNvcHlyaWdodCDCqSA8eWVhcj4gVGhlIEZy
ZWVUeXBlCisjIC0gICAgUHJvamVjdCAod3d3LmZyZWV0eXBlLm9yZykuICBBbGwgcmlnaHRzIHJl
c2VydmVkLgorIyArICAgIFByb2plY3QgKGh0dHBzOi8vZnJlZXR5cGUub3JnKS4gIEFsbCByaWdo
dHMgcmVzZXJ2ZWQuCisjICAgICAiIiIKKyMgIAorIyAgICBQbGVhc2UgcmVwbGFjZSA8eWVhcj4g
d2l0aCB0aGUgdmFsdWUgZnJvbSB0aGUgRnJlZVR5cGUgdmVyc2lvbiB5b3UKKyMgQEAgLTE2Myw3
ICsxNjMsNyBAQAorIyAgCisjICAgIE91ciBob21lIHBhZ2UgY2FuIGJlIGZvdW5kIGF0CisjICAK
KyMgLSAgICBodHRwczovL3d3dy5mcmVldHlwZS5vcmcKKyMgKyAgICBodHRwczovL2ZyZWV0eXBl
Lm9yZworIyAgCisjICAKKyMgIC0tLSBlbmQgb2YgRlRMLlRYVCAtLS0KKyMgCisjCisKIFNVTU1B
UlkgPSAiRnJlZXR5cGUgZm9udCByZW5kZXJpbmcgbGlicmFyeSIKIERFU0NSSVBUSU9OID0gIkZy
ZWVUeXBlIGlzIGEgc29mdHdhcmUgZm9udCBlbmdpbmUgdGhhdCBpcyBkZXNpZ25lZCB0byBiZSBz
bWFsbCwgZWZmaWNpZW50LCBcCiBoaWdobHkgY3VzdG9taXphYmxlLCBhbmQgcG9ydGFibGUgd2hp
bGUgY2FwYWJsZSBvZiBwcm9kdWNpbmcgaGlnaC1xdWFsaXR5IG91dHB1dCAoZ2x5cGggXApAQCAt
OCwxMyArNTUsMTMgQEAgQlVHVFJBQ0tFUiA9ICJodHRwczovL3NhdmFubmFoLm5vbmdudS5vcmcv
YnVncy8/Z3JvdXA9ZnJlZXR5cGUiCiBTRUNUSU9OID0gImxpYnMiCiAKIExJQ0VOU0UgPSAiKEZU
TCB8IEdQTC0yLjAtb3ItbGF0ZXIpICYgTUlUIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
TElDRU5TRS5UWFQ7bWQ1PTg0M2I2ZWZjMTZmNmIxNjUyZWM5N2Y4OWQ1YTUxNmMwIFwKLSAgICAg
ICAgICAgICAgICAgICAgZmlsZTovL2RvY3MvRlRMLlRYVDttZDU9OWYzN2I0ZTZhZmEzZmVmOWRi
YTg5MzJiMTZiZDNmOTcgXAorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5UWFQ7
bWQ1PWVlYjA3M2Q1ZmI4NmQyM2M1MmJiOWI4NGFhMjU2MzA3IFwKKyAgICAgICAgICAgICAgICAg
ICAgZmlsZTovL2RvY3MvRlRMLlRYVDttZDU9NzJkODQ0Y2QyZjNiY2FmNmE4NTI0NGI1MDgwMzJi
ZTcgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vZG9jcy9HUEx2Mi5UWFQ7bWQ1PThlZjM4
MDQ3NmY2NDJjMjBlYmY0MGZlY2IwYWRkMmVjIFwKICAgICAgICAgICAgICAgICAgICAgIgogCiBT
UkNfVVJJID0gIiR7U0FWQU5OQUhfTk9OR05VX01JUlJPUn0vJHtCUE59LyR7QlB9LnRhci54eiIK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwNTUwMzUwNjY2ZDQyN2M3NGRhZWI4NWQ1YWM3YmIzNTNh
Y2JhNWY3Njk1NjM5NTk5NTMxMWE5YzZmMDYzMjg5IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjMy
NDI3ZThjNDcxYWMwOTU4NTMyMTJhMzdhZWY4MTZjNjBiNDIwNTJkNGQ5ZTQ4MjMwYmFiM2JkZjI5
MzZjY2MiCiAKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gImZyZWV0eXBlLSg/UDxwdmVyPlxkKyhc
LlxkKykrKSIKIAotLSAKMi40Ny4xCgo=

--===============0011554466018557186==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-freetype-upgrade-2.13.3-2.14.1.patch"

RnJvbSAyYmY2OGVjZDc1ZDVmYTRmYjkwMWVjNWQ5NDgzNzg5NmU4M2Y0Mzk0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDQ6MDg6MzEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBm
cmVldHlwZTogdXBncmFkZSAyLjEzLjMgLT4gMi4xNC4xCgotLS0KIC4uLntmcmVldHlwZV8yLjEz
LjMuYmIgPT4gZnJlZXR5cGVfMi4xNC4xLmJifSB8IDUzICsrKysrKysrKysrKysrKysrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy9mcmVldHlwZS97ZnJlZXR5cGVfMi4xMy4zLmJiID0+IGZyZWV0
eXBlXzIuMTQuMS5iYn0gKDQ3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
ZnJlZXR5cGUvZnJlZXR5cGVfMi4xMy4zLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ZyZWV0
eXBlL2ZyZWV0eXBlXzIuMTQuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDQ3JQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZnJlZXR5cGUvZnJlZXR5cGVfMi4xMy4zLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZnJlZXR5cGUvZnJlZXR5cGVfMi4xNC4xLmJiCmluZGV4
IGRiZmZmZGI2NWYuLmI2ZTMzYzgyNzQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9mcmVldHlwZS9mcmVldHlwZV8yLjEzLjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L2ZyZWV0eXBlL2ZyZWV0eXBlXzIuMTQuMS5iYgpAQCAtMSwzICsxLDUwIEBACisjIEZJWE1FOiB0
aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wg
dXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUg
b2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5T
RSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNv
bW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGlj
ZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2Vz
OgorIworIyAtLS0gTElDRU5TRS5UWFQKKyMgKysrIExJQ0VOU0UuVFhUCisjIEBAIC0zNSw5ICsz
NSwxMCBAQAorIyAgVGhlIGd6aXAgIG1vZHVsZSB1c2VzIHRoZSAgemxpYiBsaWNlbnNlIChzZWUg
IGBzcmMvZ3ppcC96bGliLmhgKSB3aGljaAorIyAgdG9vIGlzIGNvbXBhdGlibGUgdG8gdGhlIGFi
b3ZlIHR3byBsaWNlbnNlcy4KKyMgIAorIyAtVGhlIGZpbGVzIGBzcmMvYXV0b2ZpdC9mdC1oYi5j
YCBhbmQgYHNyYy9hdXRvZml0L2Z0LWhiLmhgIGNvbnRhaW4gY29kZQorIyAtdGFrZW4gYWxtb3N0
ICB2ZXJiYXRpbSBmcm9tIHRoZSAgSGFyZkJ1enogZmlsZSBgaGItZnQuY2NgLCAgd2hpY2ggdXNl
cworIyAtdGhlICdPbGQgTUlUJyBsaWNlbnNlLCBjb21wYXRpYmxlIHRvIHRoZSBhYm92ZSB0d28g
bGljZW5zZXMuCisjICtUaGUgICBmaWxlcyAgIGBzcmMvYXV0b2ZpdC9mdC1oYi1mdC5jYCwgICBg
c3JjL2F1dG9maXQvZnQtaGItZGVjbHMuaGAsCisjICtgc3JjL2F1dG9maXQvZnQtaGItdHlwZXMu
aGAsICAgICBhbmQgICAgYHNyYy9hdXRvZml0L2hiLXNjcmlwdC1saXN0LmhgCisjICtjb250YWlu
IGNvZGUgdGFrZW4gKGFsbW9zdCkgdmVyYmF0aW0gIGZyb20gdGhlIEhhcmZCdXp6IGxpYnJhcnks
IHdoaWNoCisjICt1c2VzIHRoZSAnT2xkIE1JVCcgbGljZW5zZSBjb21wYXRpYmxlIHRvIHRoZSBh
Ym92ZSB0d28gbGljZW5zZXMuCisjICAKKyMgIFRoZSAgTUQ1IGNoZWNrc3VtICBzdXBwb3J0ICAo
b25seSB1c2VkICBmb3IgIGRlYnVnZ2luZyBpbiAgZGV2ZWxvcG1lbnQKKyMgIGJ1aWxkcykgaXMg
aW4gdGhlIHB1YmxpYyBkb21haW4uCisjIC0tLSBkb2NzL0ZUTC5UWFQKKyMgKysrIGRvY3MvRlRM
LlRYVAorIyBAQCAtNDksNyArNDksNyBAQAorIyAgCisjICAgICAiIiIKKyMgICAgICBQb3J0aW9u
cyBvZiB0aGlzIHNvZnR3YXJlIGFyZSBjb3B5cmlnaHQgwqkgPHllYXI+IFRoZSBGcmVlVHlwZQor
IyAtICAgIFByb2plY3QgKHd3dy5mcmVldHlwZS5vcmcpLiAgQWxsIHJpZ2h0cyByZXNlcnZlZC4K
KyMgKyAgICBQcm9qZWN0IChodHRwczovL2ZyZWV0eXBlLm9yZykuICBBbGwgcmlnaHRzIHJlc2Vy
dmVkLgorIyAgICAgIiIiCisjICAKKyMgICAgUGxlYXNlIHJlcGxhY2UgPHllYXI+IHdpdGggdGhl
IHZhbHVlIGZyb20gdGhlIEZyZWVUeXBlIHZlcnNpb24geW91CisjIEBAIC0xNjMsNyArMTYzLDcg
QEAKKyMgIAorIyAgICBPdXIgaG9tZSBwYWdlIGNhbiBiZSBmb3VuZCBhdAorIyAgCisjIC0gICAg
aHR0cHM6Ly93d3cuZnJlZXR5cGUub3JnCisjICsgICAgaHR0cHM6Ly9mcmVldHlwZS5vcmcKKyMg
IAorIyAgCisjICAtLS0gZW5kIG9mIEZUTC5UWFQgLS0tCisjIAorIworCiBTVU1NQVJZID0gIkZy
ZWV0eXBlIGZvbnQgcmVuZGVyaW5nIGxpYnJhcnkiCiBERVNDUklQVElPTiA9ICJGcmVlVHlwZSBp
cyBhIHNvZnR3YXJlIGZvbnQgZW5naW5lIHRoYXQgaXMgZGVzaWduZWQgdG8gYmUgc21hbGwsIGVm
ZmljaWVudCwgXAogaGlnaGx5IGN1c3RvbWl6YWJsZSwgYW5kIHBvcnRhYmxlIHdoaWxlIGNhcGFi
bGUgb2YgcHJvZHVjaW5nIGhpZ2gtcXVhbGl0eSBvdXRwdXQgKGdseXBoIFwKQEAgLTgsMTMgKzU1
LDEzIEBAIEJVR1RSQUNLRVIgPSAiaHR0cHM6Ly9zYXZhbm5haC5ub25nbnUub3JnL2J1Z3MvP2dy
b3VwPWZyZWV0eXBlIgogU0VDVElPTiA9ICJsaWJzIgogCiBMSUNFTlNFID0gIihGVEwgfCBHUEwt
Mi4wLW9yLWxhdGVyKSAmIE1JVCIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0Uu
VFhUO21kNT04NDNiNmVmYzE2ZjZiMTY1MmVjOTdmODlkNWE1MTZjMCBcCi0gICAgICAgICAgICAg
ICAgICAgIGZpbGU6Ly9kb2NzL0ZUTC5UWFQ7bWQ1PTlmMzdiNGU2YWZhM2ZlZjlkYmE4OTMyYjE2
YmQzZjk3IFwKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UuVFhUO21kNT1lZWIw
NzNkNWZiODZkMjNjNTJiYjliODRhYTI1NjMwNyBcCisgICAgICAgICAgICAgICAgICAgIGZpbGU6
Ly9kb2NzL0ZUTC5UWFQ7bWQ1PTcyZDg0NGNkMmYzYmNhZjZhODUyNDRiNTA4MDMyYmU3IFwKICAg
ICAgICAgICAgICAgICAgICAgZmlsZTovL2RvY3MvR1BMdjIuVFhUO21kNT04ZWYzODA0NzZmNjQy
YzIwZWJmNDBmZWNiMGFkZDJlYyBcCiAgICAgICAgICAgICAgICAgICAgICIKIAogU1JDX1VSSSA9
ICIke1NBVkFOTkFIX05PTkdOVV9NSVJST1J9LyR7QlBOfS8ke0JQfS50YXIueHoiCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMDU1MDM1MDY2NmQ0MjdjNzRkYWViODVkNWFjN2JiMzUzYWNiYTVmNzY5
NTYzOTU5OTUzMTFhOWM2ZjA2MzI4OSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzMjQyN2U4YzQ3
MWFjMDk1ODUzMjEyYTM3YWVmODE2YzYwYjQyMDUyZDRkOWU0ODIzMGJhYjNiZGYyOTM2Y2NjIgog
CiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJmcmVldHlwZS0oP1A8cHZlcj5cZCsoXC5cZCspKyki
CiAKLS0gCjIuNDcuMQoK

--===============0011554466018557186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/freetype/freetype: FILELIST: removed "/usr/lib/libfreetype.so.6.20.2", added "/usr/lib/libfreetype.so.6.20.4"
Changes to packages/x86-64-v3-poky-linux/freetype (sysroot):
  /usr/lib/libfreetype.so.6 changed symlink target from libfreetype.so.6.20.2 to libfreetype.so.6.20.4
  /usr/lib/libfreetype.so changed symlink target from libfreetype.so.6.20.2 to libfreetype.so.6.20.4
  /usr/lib/libfreetype.so.6.20.2 moved to /usr/lib/libfreetype.so.6.20.4

--===============0011554466018557186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/freetype/freetype-dbg: PV changed from "2.13.3" to "2.14.1"
packages/x86-64-v3-poky-linux/freetype/freetype-dbg: FILELIST: removed "/usr/lib/.debug/libfreetype.so.6.20.2", added "/usr/lib/.debug/libfreetype.so.6.20.4"
packages/x86-64-v3-poky-linux/freetype/freetype-dbg: PKGSIZE changed from 2685504 to 2705448 (+1%)
packages/x86-64-v3-poky-linux/freetype/freetype-dbg: PKGV changed from 2.13.3 [default] to 2.14.1 [default]
packages/x86-64-v3-poky-linux/freetype/freetype-dev: PV changed from "2.13.3" to "2.14.1"
packages/x86-64-v3-poky-linux/freetype/freetype-dev: PKGSIZE changed from 879678 to 885623 (+1%)
packages/x86-64-v3-poky-linux/freetype/freetype-dev: PKGV changed from 2.13.3 [default] to 2.14.1 [default]
packages/x86-64-v3-poky-linux/freetype/freetype-doc: PV changed from "2.13.3" to "2.14.1"
packages/x86-64-v3-poky-linux/freetype/freetype-doc: PKGV changed from 2.13.3 [default] to 2.14.1 [default]
packages/x86-64-v3-poky-linux/freetype/freetype-locale: PV changed from "2.13.3" to "2.14.1"
packages/x86-64-v3-poky-linux/freetype/freetype-locale: PKGV changed from 2.13.3 [default] to 2.14.1 [default]
packages/x86-64-v3-poky-linux/freetype/freetype-src: PV changed from "2.13.3" to "2.14.1"
packages/x86-64-v3-poky-linux/freetype/freetype-src: FILELIST: directory renamed /usr/src/debug/freetype/2.13.3/src/pcf -> /usr/src/debug/freetype/2.14.1/src/pcf, directory renamed /usr/src/debug/freetype/2.13.3/src/psnames -> /usr/src/debug/freetype/2.14.1/src/psnames, directory renamed /usr/src/debug/freetype/2.13.3/src/psaux -> /usr/src/debug/freetype/2.14.1/src/psaux, directory renamed /usr/src/debug/freetype/2.13.3/src/truetype -> /usr/src/debug/freetype/2.14.1/src/truetype, directory renamed /usr/src/debug/freetype/2.13.3/include/freetype -> /usr/src/debug/freetype/2.14.1/include/freetype, directory renamed /usr/src/debug/freetype/2.13.3/src/sfnt -> /usr/src/debug/freetype/2.14.1/src/sfnt, directory renamed /usr/src/debug/freetype/2.13.3/include/freetype/config -> /usr/src/debug/freetype/2.14.1/include/freetype/config, directory renamed /usr/src/debug/freetype/2.13.3/src/svg -> /usr/src/debug/freetype/2.14.1/src/svg, directory renamed /usr/src/debug/freetype/2.13.3/include/free
 type/internal/services -> /usr/src/debug/freetype/2.14.1/include/freetype/internal/services, directory renamed /usr/src/debug/freetype/2.13.3/src/raster -> /usr/src/debug/freetype/2.14.1/src/raster, directory renamed /usr/src/debug/freetype/2.13.3/src/sdf -> /usr/src/debug/freetype/2.14.1/src/sdf, directory renamed /usr/src/debug/freetype/2.13.3/src/base -> /usr/src/debug/freetype/2.14.1/src/base, directory renamed /usr/src/debug/freetype/2.13.3/src/smooth -> /usr/src/debug/freetype/2.14.1/src/smooth, directory renamed /usr/src/debug/freetype/2.13.3/src/cid -> /usr/src/debug/freetype/2.14.1/src/cid, directory renamed /usr/src/debug/freetype/2.13.3/src/gzip -> /usr/src/debug/freetype/2.14.1/src/gzip, directory renamed /usr/src/debug/freetype/2.13.3/src/winfonts -> /usr/src/debug/freetype/2.14.1/src/winfonts, directory renamed /usr/src/debug/freetype/2.13.3/src/pfr -> /usr/src/debug/freetype/2.14.1/src/pfr, directory renamed /usr/src/debug/freetype/2.13.3/src/pshinter -> /usr/src/debu
 g/freetype/2.14.1/src/pshinter, directory renamed /usr/src/debug/freetype/2.13.3/src/lzw -> /usr/src/debug/freetype/2.14.1/src/lzw, directory renamed /usr/src/debug/freetype/2.13.3/builds/unix -> /usr/src/debug/freetype/2.14.1/builds/unix, directory renamed /usr/src/debug/freetype/2.13.3/src/type1 -> /usr/src/debug/freetype/2.14.1/src/type1, directory renamed /usr/src/debug/freetype/2.13.3/src/type42 -> /usr/src/debug/freetype/2.14.1/src/type42, directory renamed /usr/src/debug/freetype/2.13.3/include/freetype/internal -> /usr/src/debug/freetype/2.14.1/include/freetype/internal, directory renamed /usr/src/debug/freetype/2.13.3 -> /usr/src/debug/freetype/2.14.1, directory renamed /usr/src/debug/freetype/2.13.3/src/cache -> /usr/src/debug/freetype/2.14.1/src/cache, directory renamed /usr/src/debug/freetype/2.13.3/src/bzip2 -> /usr/src/debug/freetype/2.14.1/src/bzip2, directory renamed /usr/src/debug/freetype/2.13.3/src/bdf -> /usr/src/debug/freetype/2.14.1/src/bdf, directory renamed /
 usr/src/debug/freetype/2.13.3/src/cff -> /usr/src/debug/freetype/2.14.1/src/cff, removed "/usr/src/debug/freetype/2.13.3/src/autofit/afcjk.c /usr/src/debug/freetype/2.13.3/src/autofit/aftypes.h /usr/src/debug/freetype/2.13.3/src/autofit/afcjk.h /usr/src/debug/freetype/2.13.3/src/autofit/aflatin.h /usr/src/debug/freetype/2.13.3/src/autofit/afloader.c /usr/src/debug/freetype/2.13.3/src/autofit/aflatin.c /usr/src/debug/freetype/2.13.3/src/autofit/afloader.h /usr/src/debug/freetype/2.13.3/src/autofit/afranges.c /usr/src/debug/freetype/2.13.3/src/autofit/afblue.h /usr/src/debug/freetype/2.13.3/src/autofit/afblue.c /usr/src/debug/freetype/2.13.3/src/autofit/afscript.h /usr/src/debug/freetype/2.13.3/src/autofit/afdummy.c /usr/src/debug/freetype/2.13.3/src/autofit/afdummy.h /usr/src/debug/freetype/2.13.3/src/autofit/afmodule.c /usr/src/debug/freetype/2.13.3/src/autofit/afmodule.h /usr/src/debug/freetype/2.13.3/src/autofit/afindic.h /usr/src/debug/freetype/2.13.3/src/autofit/afindic.c /usr/s
 rc/debug/freetype/2.13.3/src/autofit/afhints.c /usr/src/debug/freetype/2.13.3/src/autofit/afglobal.c /usr/src/debug/freetype/2.13.3/src/autofit/afhints.h /usr/src/debug/freetype/2.13.3/src/autofit/afglobal.h /usr/src/debug/freetype/2.13.3/src/autofit/afshaper.c /usr/src/debug/freetype/2.13.3/src/autofit/afstyles.h", added "/usr/src/debug/freetype/2.14.1/src/autofit/afcjk.c /usr/src/debug/freetype/2.14.1/src/autofit/ft-hb.c /usr/src/debug/freetype/2.14.1/src/autofit/aftypes.h /usr/src/debug/freetype/2.14.1/src/autofit/afcjk.h /usr/src/debug/freetype/2.14.1/src/autofit/aflatin.h /usr/src/debug/freetype/2.14.1/src/autofit/afloader.c /usr/src/debug/freetype/2.14.1/src/autofit/aflatin.c /usr/src/debug/freetype/2.14.1/src/autofit/afloader.h /usr/src/debug/freetype/2.14.1/src/autofit/afranges.c /usr/src/debug/freetype/2.14.1/src/autofit/afblue.h /usr/src/debug/freetype/2.14.1/src/autofit/afblue.c /usr/src/debug/freetype/2.14.1/src/autofit/afscript.h /usr/src/debug/freetype/2.14.1/src/autof
 it/afdummy.c /usr/src/debug/freetype/2.14.1/src/autofit/afdummy.h /usr/src/debug/freetype/2.14.1/src/autofit/afmodule.c /usr/src/debug/freetype/2.14.1/src/autofit/afmodule.h /usr/src/debug/freetype/2.14.1/src/autofit/afindic.h /usr/src/debug/freetype/2.14.1/src/autofit/afadjust.c /usr/src/debug/freetype/2.14.1/src/autofit/afindic.c /usr/src/debug/freetype/2.14.1/src/autofit/afhints.c /usr/src/debug/freetype/2.14.1/src/autofit/afglobal.c /usr/src/debug/freetype/2.14.1/src/autofit/afhints.h /usr/src/debug/freetype/2.14.1/src/autofit/afglobal.h /usr/src/debug/freetype/2.14.1/src/autofit/afshaper.c /usr/src/debug/freetype/2.14.1/src/autofit/afstyles.h"
packages/x86-64-v3-poky-linux/freetype/freetype-src: PKGSIZE changed from 5535548 to 5628258 (+2%)
packages/x86-64-v3-poky-linux/freetype/freetype-src: PKGV changed from 2.13.3 [default] to 2.14.1 [default]
packages/x86-64-v3-poky-linux/freetype/freetype-staticdev: PV changed from "2.13.3" to "2.14.1"
packages/x86-64-v3-poky-linux/freetype/freetype-staticdev: PKGV changed from 2.13.3 [default] to 2.14.1 [default]
packages/x86-64-v3-poky-linux/freetype/freetype: PV changed from "2.13.3" to "2.14.1"
packages/x86-64-v3-poky-linux/freetype/freetype: FILELIST: removed "/usr/lib/libfreetype.so.6.20.2", added "/usr/lib/libfreetype.so.6.20.4"
packages/x86-64-v3-poky-linux/freetype/freetype: PKGSIZE changed from 772093 to 776189 (+1%)
packages/x86-64-v3-poky-linux/freetype/freetype: PKGV changed from 2.13.3 [default] to 2.14.1 [default]
packages/x86-64-v3-poky-linux/freetype: PV changed from "2.13.3" to "2.14.1"
packages/x86-64-v3-poky-linux/freetype: PKGV changed from 2.13.3 [default] to 2.14.1 [default]
packages/x86-64-v3-poky-linux/freetype: SRC_URI changed from "https://download.savannah.nongnu.org/releases/freetype/freetype-2.13.3.tar.xz" to "https://download.savannah.nongnu.org/releases/freetype/freetype-2.14.1.tar.xz"
Changes to packages/x86-64-v3-poky-linux/freetype (sysroot):
  /usr/lib/libfreetype.so.6 changed symlink target from libfreetype.so.6.20.2 to libfreetype.so.6.20.4
  /usr/lib/libfreetype.so changed symlink target from libfreetype.so.6.20.2 to libfreetype.so.6.20.4
  /usr/lib/libfreetype.so.6.20.2 moved to /usr/lib/libfreetype.so.6.20.4

--===============0011554466018557186==--

