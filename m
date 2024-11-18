Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F723D60CFD
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:18:25 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.4679.1731964633083259581
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:18:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=P2SRTAbD;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=S36Ah4a2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101934123f96c-57a2c770-0d3e-4c02-bcac-64269add7e81-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964697;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2uKh8KBMuf3OyFVjjb43zOalwRShHzq7fNhFApKZ+0o=;
	b=P2SRTAbDEh9qu2PbGoJkdVcKKsKqGzBFMLnYCtuph8g5Rq5hIxJJGsYs84E9y0B5
	zVdBKnwGn5iW4zvBGr0LYdHlE3AUj1p3WpLtJ8eOElyhcdPRXBxul228CXw8b+X9cJJ
	3S6YjA0cs+4Q9sPMNd75KDX/YlxchA4imGxd9/EQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964697;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2uKh8KBMuf3OyFVjjb43zOalwRShHzq7fNhFApKZ+0o=;
	b=S36Ah4a2iPwpiSpQLtpNwYdV2N6ai+YpErAaSStC/tvV63JOFLUYEHPathM4b1Al
	+BIOrlVUeh03BtpefgO5GitzmuF+DXE1F9rB5sP2wpr5840Yg+PP1Y3EuZD/sFDYJlL
	OjNkV2a8HjBI114l3erraJrVHux+kR5uwQYWJ8cU=
Content-Type: multipart/mixed; boundary="===============2450611308414882973=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vte: upgrading to 0.78.1 SUCCEEDED
Message-ID: <010101934123f96c-57a2c770-0d3e-4c02-bcac-64269add7e81-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:18:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207372

--===============2450611308414882973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICp2dGUqIHRvICowLjc4LjEqIGhhcyBTdWNjZWVkZWQuCgpOZXh0IHN0ZXBzOgogICAgLSBh
cHBseSB0aGUgcGF0Y2g6IGdpdCBhbSAwMDAxLXZ0ZS11cGdyYWRlLTAuNzguMC0wLjc4LjEucGF0
Y2gKICAgIC0gY2hlY2sgdGhlIGNoYW5nZXMgdG8gdXBzdHJlYW0gcGF0Y2hlcyBhbmQgc3VtbWFy
aXplIHRoZW0gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLAogICAgLSBjb21waWxlIGFuIGltYWdlIHRo
YXQgY29udGFpbnMgdGhlIHBhY2thZ2UKICAgIC0gcGVyZm9ybSBzb21lIGJhc2ljIHNhbml0eSB0
ZXN0cwogICAgLSBhbWVuZCB0aGUgcGF0Y2ggYW5kIHNpZ24gaXQgb2ZmOiBnaXQgY29tbWl0IC1z
IC0tcmVzZXQtYXV0aG9yIC0tYW1lbmQKICAgIC0gc2VuZCBpdCB0byB0aGUgYXBwcm9wcmlhdGUg
bWFpbGluZyBsaXN0CgpBbHRlcm5hdGl2ZWx5LCBpZiB5b3UgYmVsaWV2ZSB0aGUgcmVjaXBlIHNo
b3VsZCBub3QgYmUgdXBncmFkZWQgYXQgdGhpcyB0aW1lLAp5b3UgY2FuIGZpbGwgUkVDSVBFX05P
X1VQREFURV9SRUFTT04gaW4gcmVzcGVjdGl2ZSByZWNpcGUgZmlsZSBzbyB0aGF0CmF1dG9tYXRp
YyB1cGdyYWRlcyB3b3VsZCBubyBsb25nZXIgYmUgYXR0ZW1wdGVkLgoKUGxlYXNlIHJldmlldyB0
aGUgYXR0YWNoZWQgZmlsZXMgZm9yIGZ1cnRoZXIgaW5mb3JtYXRpb24gYW5kIGJ1aWxkL3VwZGF0
ZSBmYWlsdXJlcy4KQW55IHByb2JsZW0gcGxlYXNlIGZpbGUgYSBidWcgYXQgaHR0cHM6Ly9idWd6
aWxsYS55b2N0b3Byb2plY3Qub3JnL2VudGVyX2J1Zy5jZ2k/cHJvZHVjdD1BdXRvbWF0ZWQlMjBV
cGRhdGUlMjBIYW5kbGVyCgpSZWdhcmRzLApUaGUgVXBncmFkZSBIZWxwZXIKCi0tID44IC0tCkZy
b20gZDY0MzJmNGU5YzI0MGUwMDdlNTRiMmUyMjMyZDkwM2JhNDM3NWNkYiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKRnJvbTogVXBncmFkZSBIZWxwZXIgPGF1aEB5b2N0b3Byb2plY3Qub3JnPgpE
YXRlOiBNb24sIDE4IE5vdiAyMDI0IDIxOjE2OjI4ICswMDAwClN1YmplY3Q6IFtQQVRDSF0gdnRl
OiB1cGdyYWRlIDAuNzguMCAtPiAwLjc4LjEKCi0tLQogLi4uRVhJVENPREUtbWFjcm8tZm9yLW5v
bi1nbGliYy1zeXN0ZW1zLnBhdGNoIHwgIDQgKy0KIC4uLjAxLXRlc3RzLVJlbW92ZS1leGNlc3Np
dmUtY29uc3RyZXhwci5wYXRjaCB8IDI2IC0tLS0tLS0tLS0tLQogLi4uL3Z0ZS92dGUvMDAwMi1s
aWItVHlwby1maXgucGF0Y2ggICAgICAgICAgIHwgIDQgKy0KIC4uLi92dGUvMDAwMy1BZGQtbWlz
c2luZy1zeXN0ZW0taGVhZGVycy5wYXRjaCB8IDQyIC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLmlu
Z2xlLWhlYWRlci1saWJyYXJ5LWZvci1mcm9tX2NoYXItaS5wYXRjaCB8ICA4ICsrLS0KIC4uLi1m
YXN0X2Zsb2F0LWltcGxlbWVudGF0aW9uLWZvci1mcm9tXy5wYXRjaCB8ICA5ICsrLS0KIC4uLi92
dGUve3Z0ZV8wLjc4LjAuYmIgPT4gdnRlXzAuNzguMS5iYn0gICAgICB8IDEyICsrKy0tLQogNyBm
aWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA4OCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBt
b2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlLzAwMDEtdGVzdHMtUmVtb3Zl
LWV4Y2Vzc2l2ZS1jb25zdHJleHByLnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvdnRlL3Z0ZS8wMDAzLUFkZC1taXNzaW5nLXN5c3RlbS1oZWFkZXJzLnBhdGNo
CiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3t2dGVfMC43OC4wLmJiID0+IHZ0ZV8w
Ljc4LjEuYmJ9ICg4NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0
ZS8wMDAxLUFkZC1XX0VYSVRDT0RFLW1hY3JvLWZvci1ub24tZ2xpYmMtc3lzdGVtcy5wYXRjaCBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAwMS1BZGQtV19FWElUQ09ERS1tYWNyby1m
b3Itbm9uLWdsaWJjLXN5c3RlbXMucGF0Y2gKaW5kZXggZTJjZmY2Y2Y3Ni4uMGZjNGRjZGIwYSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZS8wMDAxLUFkZC1XX0VYSVRD
T0RFLW1hY3JvLWZvci1ub24tZ2xpYmMtc3lzdGVtcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC92dGUvdnRlLzAwMDEtQWRkLVdfRVhJVENPREUtbWFjcm8tZm9yLW5vbi1nbGliYy1z
eXN0ZW1zLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiODc5NWRkYTYyOTYxNGNkODQyZmNi
YTFjNGI1MGJlNzU5YzIwZGE0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5MTBlZjI5
MDUwMTY3ODAzZTUxZmNjZTQyMzBjMTVkNjE1OWQ2ZDliIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogRGFuaWxvIFNwaW5lbGxhIDxkYW55c3Bpbjk3QHByb3Rvbm1haWwuY29tPgogRGF0
ZTogVGh1LCAyMSBNYXIgMjAxOSAxNDoxOToyNiArMDEwMAogU3ViamVjdDogW1BBVENIXSBBZGQg
V19FWElUQ09ERSBtYWNybyBmb3Igbm9uLWdsaWJjIHN5c3RlbXMKQEAgLTE2LDcgKzE2LDcgQEAg
U2lnbmVkLW9mZi1ieTogQW5kcmVhcyBNw7xsbGVyIDxzY2huaXR6ZWx0b255QGdtYWlsLmNvbT4K
ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9zcmMvd2lk
Z2V0LmNjIGIvc3JjL3dpZGdldC5jYwotaW5kZXggYjhkYWE1Yy4uYzM1Nzk2MCAxMDA2NDQKK2lu
ZGV4IDY2OTU1YTYuLmIzNTJjMTEgMTAwNjQ0CiAtLS0gYS9zcmMvd2lkZ2V0LmNjCiArKysgYi9z
cmMvd2lkZ2V0LmNjCiBAQCAtMTYsNiArMTYsMTAgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1zdXBwb3J0L3Z0ZS92dGUvMDAwMS10ZXN0cy1SZW1vdmUtZXhjZXNzaXZlLWNvbnN0cmV4cHIu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlLzAwMDEtdGVzdHMtUmVtb3ZlLWV4
Y2Vzc2l2ZS1jb25zdHJleHByLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA3
Nzk4MTRmMjU3Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUv
MDAwMS10ZXN0cy1SZW1vdmUtZXhjZXNzaXZlLWNvbnN0cmV4cHIucGF0Y2gKKysrIC9kZXYvbnVs
bApAQCAtMSwyNiArMCwwIEBACi1Gcm9tIDAxYTVjODIzNWY4YjNmN2M2OTE5MjExNjlhZDEyNWEz
OTUxODZiM2YgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBDaHJpc3RpYW4gUGVyc2No
IDxjaHBlQHNyYy5nbm9tZS5vcmc+Ci1EYXRlOiBUdWUsIDE3IFNlcCAyMDI0IDE4OjIxOjMyICsw
MjAwCi1TdWJqZWN0OiBbUEFUQ0ggMS8zXSB0ZXN0czogUmVtb3ZlIGV4Y2Vzc2l2ZSBjb25zdHJl
eHByCi0KLUZpeGVzOiBodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvdnRlLy0vaXNzdWVz
LzI4MTkKLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRsYWIuZ25vbWUu
b3JnL0dOT01FL3Z0ZS8tL2NvbW1pdC9jODgzODc3OWQ1ZjhjMGUwMzQxMWNlZjk3NzVjZDhmNWEx
MGE2MjA0XQotU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KLS0t
LQotIHNyYy9jb2xvci10ZXN0LmNjIHwgMiArLQotIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0IGEvc3JjL2NvbG9yLXRlc3QuY2MgYi9z
cmMvY29sb3ItdGVzdC5jYwotaW5kZXggMGVkOTA4OS4uMWJmYWQzMSAxMDA2NDQKLS0tLSBhL3Ny
Yy9jb2xvci10ZXN0LmNjCi0rKysgYi9zcmMvY29sb3ItdGVzdC5jYwotQEAgLTE2NSw3ICsxNjUs
NyBAQCBzdGF0aWMgdm9pZAotIHRlc3RfY29sb3JfdG9fc3RyaW5nICh2b2lkKQotIHsKLSAgICAg
ICAgIGF1dG8gdGVzdCA9IFtdKHN0ZDo6c3RyaW5nIHN0ciwKLS0gICAgICAgICAgICAgICAgICAg
ICAgIGJvb2wgYWxwaGEgPSBmYWxzZSkgY29uc3RleHByIG5vZXhjZXB0IC0+IHZvaWQKLSsgICAg
ICAgICAgICAgICAgICAgICAgIGJvb2wgYWxwaGEgPSBmYWxzZSkgbm9leGNlcHQgLT4gdm9pZAot
ICAgICAgICAgewotICAgICAgICAgICAgICAgICBhdXRvIGNvbnN0IHZhbHVlID0gcGFyc2U8cmdi
YT4oc3RyKTsKLSAgICAgICAgICAgICAgICAgYXNzZXJ0KHZhbHVlKTsKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAwMi1saWItVHlwby1maXgucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlLzAwMDItbGliLVR5cG8tZml4LnBhdGNoCmluZGV4IDQx
MGQ1MDY4MDYuLjc5YTljZmNkNjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0
ZS92dGUvMDAwMi1saWItVHlwby1maXgucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
dnRlL3Z0ZS8wMDAyLWxpYi1UeXBvLWZpeC5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gNmI3
NDQwOTk2ODE5YzEyZWMzMmJmYWY0ZTczYjI3YmFlYjI3MzIwNyBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gYTU5NTYzMzlhMDc4MGMyMjk0OGQ2ODllYTY0MjBkNjU5N2Q3YzEwMiBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENocmlzdGlhbiBQZXJzY2ggPGNocGVAc3JjLmdu
b21lLm9yZz4KIERhdGU6IFRodSwgNSBTZXAgMjAyNCAyMzo1OTowNSArMDIwMAotU3ViamVjdDog
W1BBVENIIDIvM10gbGliOiBUeXBvIGZpeAorU3ViamVjdDogW1BBVENIXSBsaWI6IFR5cG8gZml4
CiAKIEZpeGVzOiBodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvdnRlLy0vaXNzdWVzLzI4
MTYKIFVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9H
Tk9NRS92dGUvLS9jb21taXQvZTI0MDg3ZDk1M2Q5MzUyYzhiYzQ2MDc0ZTI2NjJjODBmOWJmYmMy
ZF0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAwMy1BZGQtbWlz
c2luZy1zeXN0ZW0taGVhZGVycy5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUv
MDAwMy1BZGQtbWlzc2luZy1zeXN0ZW0taGVhZGVycy5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggNjZkMmJlYjE1YS4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC92dGUvdnRlLzAwMDMtQWRkLW1pc3Npbmctc3lzdGVtLWhlYWRlcnMucGF0Y2gKKysrIC9k
ZXYvbnVsbApAQCAtMSw0MiArMCwwIEBACi1Gcm9tIGFkZDNkZDUyZDJlMmMxOWRmYTkzMTlkZThk
ODMzNWRjYTgwMmJhNWEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBLaGVtIFJhaiA8
cmFqLmtoZW1AZ21haWwuY29tPgotRGF0ZTogTW9uLCAzMCBTZXAgMjAyNCAyMjozNjowOSAtMDcw
MAotU3ViamVjdDogW1BBVENIIDMvM10gQWRkIG1pc3Npbmcgc3lzdGVtIGhlYWRlcnMKLQotVGhl
c2UgYXJlIGZvdW5kIG91dCB3aGVuIHVzaW5nIGNsYW5nIGxpYmMrKwotCi1hbGdvcml0aG0gaXMg
bmVlZGVkIGZvciBzdGQ6Om1heCBhbmQgc3RkOjptaW4KLXN0cmluZ192aWV3IGZvciBzdHJpbmdf
dmlldwotCi1VcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRsYWIuZ25vbWUu
b3JnL0dOT01FL3Z0ZS8tL2lzc3Vlcy8yODI0XQotU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJh
ai5raGVtQGdtYWlsLmNvbT4KLQotLS0tCi0gc3JjL2ljdS1nbHVlLmhoIHwgMSArCi0gc3JjL21p
bmlmb250LmNjIHwgMSArCi0gMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKLQotZGlm
ZiAtLWdpdCBhL3NyYy9pY3UtZ2x1ZS5oaCBiL3NyYy9pY3UtZ2x1ZS5oaAotaW5kZXggZjJjMzMz
MS4uZjcyOTk5YiAxMDA2NDQKLS0tLSBhL3NyYy9pY3UtZ2x1ZS5oaAotKysrIGIvc3JjL2ljdS1n
bHVlLmhoCi1AQCAtMjAsNiArMjAsNyBAQAotICNpbmNsdWRlIDxnbGliLmg+Ci0gI2luY2x1ZGUg
PG1lbW9yeT4KLSAjaW5jbHVkZSA8b3B0aW9uYWw+Ci0rI2luY2x1ZGUgPHN0cmluZ192aWV3Pgot
IAotIG5hbWVzcGFjZSB2dGU6OmJhc2UgewotIAotZGlmZiAtLWdpdCBhL3NyYy9taW5pZm9udC5j
YyBiL3NyYy9taW5pZm9udC5jYwotaW5kZXggOWJlOTZkNi4uZjRmZTBiZiAxMDA2NDQKLS0tLSBh
L3NyYy9taW5pZm9udC5jYwotKysrIGIvc3JjL21pbmlmb250LmNjCi1AQCAtMTgsNiArMTgsNyBA
QAotIAotICNpbmNsdWRlICJjb25maWcuaCIKLSAKLSsjaW5jbHVkZSA8YWxnb3JpdGhtPgotICNp
bmNsdWRlIDxjbWF0aD4KLSAKLSAjaW5jbHVkZSAiY2Fpcm8tZ2x1ZS5oaCIKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAwNC1mYXN0X2Zsb2F0LUFkZC1zaW5nbGUt
aGVhZGVyLWxpYnJhcnktZm9yLWZyb21fY2hhci1pLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvdnRlL3Z0ZS8wMDA0LWZhc3RfZmxvYXQtQWRkLXNpbmdsZS1oZWFkZXItbGlicmFyeS1mb3It
ZnJvbV9jaGFyLWkucGF0Y2gKaW5kZXggNzMxZGJhNzI5ZC4uNDZhMmQxNzZiNSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZS8wMDA0LWZhc3RfZmxvYXQtQWRkLXNpbmds
ZS1oZWFkZXItbGlicmFyeS1mb3ItZnJvbV9jaGFyLWkucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvdnRlL3Z0ZS8wMDA0LWZhc3RfZmxvYXQtQWRkLXNpbmdsZS1oZWFkZXItbGlicmFy
eS1mb3ItZnJvbV9jaGFyLWkucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIDJhMzJlNDNlNDNi
MDQ3NzFhMzM1N2QzZDRjY2JhZmE3NzE0ZTAxMTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDlkODk2ZDAyMGJmZWY5MTVkNTg2NDNiOTlmOGU4ZjkxNDA3Yzg0YzggTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTog
RnJpLCA0IE9jdCAyMDI0IDIxOjIxOjExIC0wNzAwCi1TdWJqZWN0OiBbUEFUQ0ggNC81XSBmYXN0
X2Zsb2F0OiBBZGQgc2luZ2xlIGhlYWRlciBsaWJyYXJ5IGZvciBmcm9tX2NoYXIKK1N1YmplY3Q6
IFtQQVRDSF0gZmFzdF9mbG9hdDogQWRkIHNpbmdsZSBoZWFkZXIgbGlicmFyeSBmb3IgZnJvbV9j
aGFyCiAgaW1wbGVtZW50YXRpb24KIAogRG9jdW1lbnQgdGhlIHByb2Nlc3MgdG8gcmUtZ2VuZXJh
dGUgdGhlIGZpbGUgd2hlbmV2ZXIgbmV3IHJlbGVhc2UKQEAgLTE4LDcgKzE4LDcgQEAgU2lnbmVk
LW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICBjcmVhdGUgbW9kZSAxMDA2
NDQgc3JjL2Zhc3RfZmxvYXQuaGgKIAogZGlmZiAtLWdpdCBhL1JFQURNRS5tZCBiL1JFQURNRS5t
ZAotaW5kZXggYTMyNDY1YTkuLjIwZWQ1YmEyIDEwMDY0NAoraW5kZXggYTMyNDY1YS4uMjBlZDVi
YSAxMDA2NDQKIC0tLSBhL1JFQURNRS5tZAogKysrIGIvUkVBRE1FLm1kCiBAQCAtMjEsNiArMjEs
MjMgQEAgb24gZG93bmxvYWQuZ25vbWUub3JnLCBidXQgcGxlYXNlIG5vdGUgdGhhdCBhbnkgdGFy
YmFsbCBmb3IgcmVsZWFzZXMKQEAgLTQ3LDcgKzQ3LDcgQEAgaW5kZXggYTMyNDY1YTkuLjIwZWQ1
YmEyIDEwMDY0NAogIAogZGlmZiAtLWdpdCBhL3NyYy9mYXN0X2Zsb2F0LmhoIGIvc3JjL2Zhc3Rf
ZmxvYXQuaGgKIG5ldyBmaWxlIG1vZGUgMTAwNjQ0Ci1pbmRleCAwMDAwMDAwMC4uZTBkNWRkNTMK
K2luZGV4IDAwMDAwMDAuLmUwZDVkZDUKIC0tLSAvZGV2L251bGwKICsrKyBiL3NyYy9mYXN0X2Zs
b2F0LmhoCiBAQCAtMCwwICsxLDM4NjkgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBw
b3J0L3Z0ZS92dGUvMDAwNS1jb2xvci1wYXJzZXItVXNlLWZhc3RfZmxvYXQtaW1wbGVtZW50YXRp
b24tZm9yLWZyb21fLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZS8wMDA1LWNv
bG9yLXBhcnNlci1Vc2UtZmFzdF9mbG9hdC1pbXBsZW1lbnRhdGlvbi1mb3ItZnJvbV8ucGF0Y2gK
aW5kZXggYjk1MWJiYWMxOC4uMGE0ODE4NmQ0NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvdnRlL3Z0ZS8wMDA1LWNvbG9yLXBhcnNlci1Vc2UtZmFzdF9mbG9hdC1pbXBsZW1lbnRh
dGlvbi1mb3ItZnJvbV8ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZS8w
MDA1LWNvbG9yLXBhcnNlci1Vc2UtZmFzdF9mbG9hdC1pbXBsZW1lbnRhdGlvbi1mb3ItZnJvbV8u
cGF0Y2gKQEAgLTEsOCArMSw3IEBACi1Gcm9tIDA4YjkwZDBhNWJmOGNlYjY4ZGQxYjRlOWRlZDBm
OGEyYjUyODdhNmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDlhMzhkZDJmODM2N2Q1
ZmEzNmZhMzAyMTIwMzhhM2UzYzkzNmM4OTEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogRnJpLCA0IE9jdCAyMDI0IDIx
OjIyOjUyIC0wNzAwCi1TdWJqZWN0OiBbUEFUQ0ggNS81XSBjb2xvci1wYXJzZXI6IFVzZSBmYXN0
X2Zsb2F0IGltcGxlbWVudGF0aW9uIGZvcgotIGZyb21fY2hhcnMKK1N1YmplY3Q6IFtQQVRDSF0g
Y29sb3ItcGFyc2VyOiBVc2UgZmFzdF9mbG9hdCBpbXBsZW1lbnRhdGlvbiBmb3IgZnJvbV9jaGFy
cwogCiBSZW1vdmVkIGRlcGVuZGVuY3kgb24gYysrIHJ1bnRpbWUgdG8gcHJvdmlkZSBpdC4KIApA
QCAtMTYsNyArMTUsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwu
Y29tPgogIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0p
CiAKIGRpZmYgLS1naXQgYS9zcmMvY29sb3ItcGFyc2VyLmNjIGIvc3JjL2NvbG9yLXBhcnNlci5j
YwotaW5kZXggMDJlYzVkM2EuLjQyYzUxOTY2IDEwMDY0NAoraW5kZXggMDJlYzVkMy4uNDJjNTE5
NiAxMDA2NDQKIC0tLSBhL3NyYy9jb2xvci1wYXJzZXIuY2MKICsrKyBiL3NyYy9jb2xvci1wYXJz
ZXIuY2MKIEBAIC0xNyw3ICsxNyw3IEBACkBAIC02NCw3ICs2Myw3IEBAIGluZGV4IDAyZWM1ZDNh
Li40MmM1MTk2NiAxMDA2NDQKICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gc3RkOjpu
dWxsb3B0OwogIAogZGlmZiAtLWdpdCBhL3NyYy90ZXJtcHJvcHMuaGggYi9zcmMvdGVybXByb3Bz
LmhoCi1pbmRleCAwZDNmMGY0Yy4uYTEwZmM3ZDEgMTAwNjQ0CitpbmRleCAwZDNmMGY0Li5hMTBm
YzdkIDEwMDY0NAogLS0tIGEvc3JjL3Rlcm1wcm9wcy5oaAogKysrIGIvc3JjL3Rlcm1wcm9wcy5o
aAogQEAgLTE3LDYgKzE3LDcgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0
ZS92dGVfMC43OC4wLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZV8wLjc4LjEuYmIK
c2ltaWxhcml0eSBpbmRleCA4NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRl
L3Z0ZV8wLjc4LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43
OC4xLmJiCmluZGV4IDlhZGE1M2E2MzQuLjU3MjNmMzViODMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43OC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0
L3Z0ZS92dGVfMC43OC4xLmJiCkBAIC0xOCwxMyArMTgsMTEgQEAgR0lET0NHRU5fTUVTT05fT1BU
SU9OID0gImRvY3MiCiBpbmhlcml0IGdub21lYmFzZSBnaS1kb2NnZW4gZmVhdHVyZXNfY2hlY2sg
dXBzdHJlYW0tdmVyc2lvbi1pcy1ldmVuIGdvYmplY3QtaW50cm9zcGVjdGlvbiBzeXN0ZW1kIHZh
bGEKIAogU1JDX1VSSSArPSAiZmlsZTovLzAwMDEtQWRkLVdfRVhJVENPREUtbWFjcm8tZm9yLW5v
bi1nbGliYy1zeXN0ZW1zLnBhdGNoIFwKLSAgICAgICAgICAgIGZpbGU6Ly8wMDAxLXRlc3RzLVJl
bW92ZS1leGNlc3NpdmUtY29uc3RyZXhwci5wYXRjaCBcCi0gICAgICAgICAgICBmaWxlOi8vMDAw
Mi1saWItVHlwby1maXgucGF0Y2ggXAotICAgICAgICAgICAgZmlsZTovLzAwMDMtQWRkLW1pc3Np
bmctc3lzdGVtLWhlYWRlcnMucGF0Y2ggXAotICAgICAgICAgICAgZmlsZTovLzAwMDQtZmFzdF9m
bG9hdC1BZGQtc2luZ2xlLWhlYWRlci1saWJyYXJ5LWZvci1mcm9tX2NoYXItaS5wYXRjaCBcCi0J
CQlmaWxlOi8vMDAwNS1jb2xvci1wYXJzZXItVXNlLWZhc3RfZmxvYXQtaW1wbGVtZW50YXRpb24t
Zm9yLWZyb21fLnBhdGNoIFwKLSIKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjA3ZjA5
YzYyMjhhOGJiM2MxNTk5ZGQwZjVhNmVjNzk3YjMwZDMwMTBjM2FjOTFjZjIxYjY5ZDk2MzVkZmFm
N2MiCisgICAgICAgICAgIGZpbGU6Ly8wMDAyLWxpYi1UeXBvLWZpeC5wYXRjaCBcCisgICAgICAg
ICAgIGZpbGU6Ly8wMDA0LWZhc3RfZmxvYXQtQWRkLXNpbmdsZS1oZWFkZXItbGlicmFyeS1mb3It
ZnJvbV9jaGFyLWkucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vMDAwNS1jb2xvci1wYXJzZXIt
VXNlLWZhc3RfZmxvYXQtaW1wbGVtZW50YXRpb24tZm9yLWZyb21fLnBhdGNoIFwKKyAgICAgICAg
ICAgIgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiNjQ5OWQyNTE3OTMxNTI1NWY5YmNm
Y2UwM2M2NmZiODRjMDNhZDMyNWRlYTIzZDBlMzcyMTc4NTIxZWNhNDJiNSIKIAogQU5ZX09GX0RJ
U1RST19GRUFUVVJFUyA9ICIke0dUSzNESVNUUk9GRUFUVVJFU30iCiAKLS0gCjIuNDQuMQoK

--===============2450611308414882973==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/vte/libvte: FILELIST: removed "/usr/lib/libvte-2.91.so.0.7800.0", added "/usr/lib/libvte-2.91.so.0.7800.1"
Changes to packages/core2-64-poky-linux/vte (sysroot):
  /usr/lib/libvte-2.91.so.0 changed symlink target from libvte-2.91.so.0.7800.0 to libvte-2.91.so.0.7800.1
  /usr/lib/libvte-2.91.so.0.7800.0 moved to /usr/lib/libvte-2.91.so.0.7800.1

--===============2450611308414882973==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/vte: SRC_URI changed from "https://download.gnome.org/sources//vte/0.78/vte-0.78.0.tar.xz;name=archive file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch file://0001-tests-Remove-excessive-constrexpr.patch file://0002-lib-Typo-fix.patch file://0003-Add-missing-system-headers.patch file://0004-fast_float-Add-single-header-library-for-from_char-i.patch file://0005-color-parser-Use-fast_float-implementation-for-from_.patch" to "https://download.gnome.org/sources//vte/0.78/vte-0.78.1.tar.xz;name=archive file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch file://0002-lib-Typo-fix.patch file://0004-fast_float-Add-single-header-library-for-from_char-i.patch file://0005-color-parser-Use-fast_float-implementation-for-from_.patch"
packages/core2-64-poky-linux/vte: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/libvte-gtk4: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/libvte-gtk4: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/libvte: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/libvte: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/libvte: FILELIST: removed "/usr/lib/libvte-2.91.so.0.7800.0", added "/usr/lib/libvte-2.91.so.0.7800.1"
Changes to packages/core2-64-poky-linux/vte (sysroot):
  /usr/lib/libvte-2.91.so.0 changed symlink target from libvte-2.91.so.0.7800.0 to libvte-2.91.so.0.7800.1
  /usr/lib/libvte-2.91.so.0.7800.0 moved to /usr/lib/libvte-2.91.so.0.7800.1
packages/core2-64-poky-linux/vte/vte-dbg: PKGSIZE changed from 21638320 to 21699400 (+0%)
packages/core2-64-poky-linux/vte/vte-dbg: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-dbg: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-dbg: FILELIST: removed "/usr/lib/.debug/libvte-2.91.so.0.7800.0", added "/usr/lib/.debug/libvte-2.91.so.0.7800.1"
packages/core2-64-poky-linux/vte/vte-dev: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-dev: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-doc: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-doc: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-gtk4-dev: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-gtk4-dev: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-gtk4: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-gtk4: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-ab: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-ab: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-am: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-am: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-an: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-an: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-ang: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-ang: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-ar: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-ar: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-as: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-as: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-ast: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-ast: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-az: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-az: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-be+latin: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-be+latin: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-be: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-be: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-bg: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-bg: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-bn-in: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-bn-in: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-bn: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-bn: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-bs: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-bs: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-ca+valencia: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-ca+valencia: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-ca: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-ca: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-ckb: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-ckb: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-cs: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-cs: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-cy: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-cy: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-da: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-da: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-de: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-de: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-dz: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-dz: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-el: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-el: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-en+shaw: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-en+shaw: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-en-ca: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-en-ca: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-en-gb: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-en-gb: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-eo: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-eo: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-es: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-es: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-et: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-et: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-eu: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-eu: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-fa: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-fa: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-fi: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-fi: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-fr: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-fr: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-fur: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-fur: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-ga: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-ga: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-gd: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-gd: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-gl: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-gl: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-gu: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-gu: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-he: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-he: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-hi: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-hi: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-hr: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-hr: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-hu: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-hu: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-id: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-id: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-is: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-is: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-it: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-it: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-ja: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-ja: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-ka: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-ka: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-kab: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-kab: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-kk: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-kk: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-kn: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-kn: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-ko: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-ko: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-ku: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-ku: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-ky: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-ky: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-li: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-li: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-lt: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-lt: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-lv: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-lv: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-mai: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-mai: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-mi: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-mi: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-mjw: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-mjw: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-mk: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-mk: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-ml: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-ml: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-mn: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-mn: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-mr: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-mr: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-ms: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-ms: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-nb: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-nb: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-nds: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-nds: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-ne: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-ne: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-nl: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-nl: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-nn: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-nn: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-oc: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-oc: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-or: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-or: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-pa: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-pa: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-pl: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-pl: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-pt-br: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-pt-br: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-pt: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-pt: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-ro: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-ro: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-ru: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-ru: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-rw: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-rw: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-si: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-si: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-sk: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-sk: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-sl: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-sl: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-sq: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-sq: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-sr+latin: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-sr+latin: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-sr: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-sr: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-sv: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-sv: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-ta: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-ta: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-te: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-te: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-tg: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-tg: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-th: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-th: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-tr: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-tr: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-ug: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-ug: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-uk: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-uk: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-uz+cyrillic: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-uz+cyrillic: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-vi: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-vi: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-wa: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-wa: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-xh: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-xh: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-zh-cn: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-zh-cn: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-zh-hk: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-zh-hk: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-locale-zh-tw: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-locale-zh-tw: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-prompt: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-prompt: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-src: PKGSIZE changed from 3436980 to 3441478 (+0%)
packages/core2-64-poky-linux/vte/vte-src: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-src: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte-staticdev: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte-staticdev: PV changed from "0.78.0" to "0.78.1"
packages/core2-64-poky-linux/vte/vte: PKGV changed from 0.78.0 [default] to 0.78.1 [default]
packages/core2-64-poky-linux/vte/vte: PV changed from "0.78.0" to "0.78.1"

--===============2450611308414882973==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vte-upgrade-0.78.0-0.78.1.patch"

RnJvbSBkNjQzMmY0ZTljMjQwZTAwN2U1NGIyZTIyMzJkOTAzYmE0Mzc1Y2RiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTggTm92IDIwMjQgMjE6MTY6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dGU6IHVwZ3JhZGUgMC43OC4wIC0+IDAuNzguMQoKLS0tCiAuLi5FWElUQ09ERS1tYWNyby1mb3It
bm9uLWdsaWJjLXN5c3RlbXMucGF0Y2ggfCAgNCArLQogLi4uMDEtdGVzdHMtUmVtb3ZlLWV4Y2Vz
c2l2ZS1jb25zdHJleHByLnBhdGNoIHwgMjYgLS0tLS0tLS0tLS0tCiAuLi4vdnRlL3Z0ZS8wMDAy
LWxpYi1UeXBvLWZpeC5wYXRjaCAgICAgICAgICAgfCAgNCArLQogLi4uL3Z0ZS8wMDAzLUFkZC1t
aXNzaW5nLXN5c3RlbS1oZWFkZXJzLnBhdGNoIHwgNDIgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4u
aW5nbGUtaGVhZGVyLWxpYnJhcnktZm9yLWZyb21fY2hhci1pLnBhdGNoIHwgIDggKystLQogLi4u
LWZhc3RfZmxvYXQtaW1wbGVtZW50YXRpb24tZm9yLWZyb21fLnBhdGNoIHwgIDkgKystLQogLi4u
L3Z0ZS97dnRlXzAuNzguMC5iYiA9PiB2dGVfMC43OC4xLmJifSAgICAgIHwgMTIgKysrLS0tCiA3
IGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDg4IGRlbGV0aW9ucygtKQogZGVsZXRl
IG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAwMS10ZXN0cy1SZW1v
dmUtZXhjZXNzaXZlLWNvbnN0cmV4cHIucGF0Y2gKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC92dGUvdnRlLzAwMDMtQWRkLW1pc3Npbmctc3lzdGVtLWhlYWRlcnMucGF0
Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUve3Z0ZV8wLjc4LjAuYmIgPT4gdnRl
XzAuNzguMS5iYn0gKDg0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUv
dnRlLzAwMDEtQWRkLVdfRVhJVENPREUtbWFjcm8tZm9yLW5vbi1nbGliYy1zeXN0ZW1zLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZS8wMDAxLUFkZC1XX0VYSVRDT0RFLW1hY3Jv
LWZvci1ub24tZ2xpYmMtc3lzdGVtcy5wYXRjaAppbmRleCBlMmNmZjZjZjc2Li4wZmM0ZGNkYjBh
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlLzAwMDEtQWRkLVdfRVhJ
VENPREUtbWFjcm8tZm9yLW5vbi1nbGliYy1zeXN0ZW1zLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L3Z0ZS92dGUvMDAwMS1BZGQtV19FWElUQ09ERS1tYWNyby1mb3Itbm9uLWdsaWJj
LXN5c3RlbXMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGI4Nzk1ZGRhNjI5NjE0Y2Q4NDJm
Y2JhMWM0YjUwYmU3NTljMjBkYTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDkxMGVm
MjkwNTAxNjc4MDNlNTFmY2NlNDIzMGMxNWQ2MTU5ZDZkOWIgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBEYW5pbG8gU3BpbmVsbGEgPGRhbnlzcGluOTdAcHJvdG9ubWFpbC5jb20+CiBE
YXRlOiBUaHUsIDIxIE1hciAyMDE5IDE0OjE5OjI2ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIEFk
ZCBXX0VYSVRDT0RFIG1hY3JvIGZvciBub24tZ2xpYmMgc3lzdGVtcwpAQCAtMTYsNyArMTYsNyBA
QCBTaWduZWQtb2ZmLWJ5OiBBbmRyZWFzIE3DvGxsZXIgPHNjaG5pdHplbHRvbnlAZ21haWwuY29t
PgogIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL3NyYy93
aWRnZXQuY2MgYi9zcmMvd2lkZ2V0LmNjCi1pbmRleCBiOGRhYTVjLi5jMzU3OTYwIDEwMDY0NAor
aW5kZXggNjY5NTVhNi4uYjM1MmMxMSAxMDA2NDQKIC0tLSBhL3NyYy93aWRnZXQuY2MKICsrKyBi
L3NyYy93aWRnZXQuY2MKIEBAIC0xNiw2ICsxNiwxMCBAQApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvdnRlL3Z0ZS8wMDAxLXRlc3RzLVJlbW92ZS1leGNlc3NpdmUtY29uc3RyZXhw
ci5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAwMS10ZXN0cy1SZW1vdmUt
ZXhjZXNzaXZlLWNvbnN0cmV4cHIucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDc3OTgxNGYyNTcuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0
ZS8wMDAxLXRlc3RzLVJlbW92ZS1leGNlc3NpdmUtY29uc3RyZXhwci5wYXRjaAorKysgL2Rldi9u
dWxsCkBAIC0xLDI2ICswLDAgQEAKLUZyb20gMDFhNWM4MjM1ZjhiM2Y3YzY5MTkyMTE2OWFkMTI1
YTM5NTE4NmIzZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IENocmlzdGlhbiBQZXJz
Y2ggPGNocGVAc3JjLmdub21lLm9yZz4KLURhdGU6IFR1ZSwgMTcgU2VwIDIwMjQgMTg6MjE6MzIg
KzAyMDAKLVN1YmplY3Q6IFtQQVRDSCAxLzNdIHRlc3RzOiBSZW1vdmUgZXhjZXNzaXZlIGNvbnN0
cmV4cHIKLQotRml4ZXM6IGh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS92dGUvLS9pc3N1
ZXMvMjgxOQotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dpdGxhYi5nbm9t
ZS5vcmcvR05PTUUvdnRlLy0vY29tbWl0L2M4ODM4Nzc5ZDVmOGMwZTAzNDExY2VmOTc3NWNkOGY1
YTEwYTYyMDRdCi1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgot
LS0tCi0gc3JjL2NvbG9yLXRlc3QuY2MgfCAyICstCi0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCi0KLWRpZmYgLS1naXQgYS9zcmMvY29sb3ItdGVzdC5jYyBi
L3NyYy9jb2xvci10ZXN0LmNjCi1pbmRleCAwZWQ5MDg5Li4xYmZhZDMxIDEwMDY0NAotLS0tIGEv
c3JjL2NvbG9yLXRlc3QuY2MKLSsrKyBiL3NyYy9jb2xvci10ZXN0LmNjCi1AQCAtMTY1LDcgKzE2
NSw3IEBAIHN0YXRpYyB2b2lkCi0gdGVzdF9jb2xvcl90b19zdHJpbmcgKHZvaWQpCi0gewotICAg
ICAgICAgYXV0byB0ZXN0ID0gW10oc3RkOjpzdHJpbmcgc3RyLAotLSAgICAgICAgICAgICAgICAg
ICAgICAgYm9vbCBhbHBoYSA9IGZhbHNlKSBjb25zdGV4cHIgbm9leGNlcHQgLT4gdm9pZAotKyAg
ICAgICAgICAgICAgICAgICAgICAgYm9vbCBhbHBoYSA9IGZhbHNlKSBub2V4Y2VwdCAtPiB2b2lk
Ci0gICAgICAgICB7Ci0gICAgICAgICAgICAgICAgIGF1dG8gY29uc3QgdmFsdWUgPSBwYXJzZTxy
Z2JhPihzdHIpOwotICAgICAgICAgICAgICAgICBhc3NlcnQodmFsdWUpOwpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZS8wMDAyLWxpYi1UeXBvLWZpeC5wYXRjaCBiL21l
dGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAwMi1saWItVHlwby1maXgucGF0Y2gKaW5kZXgg
NDEwZDUwNjgwNi4uNzlhOWNmY2Q2OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
dnRlL3Z0ZS8wMDAyLWxpYi1UeXBvLWZpeC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC92dGUvdnRlLzAwMDItbGliLVR5cG8tZml4LnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSA2
Yjc0NDA5OTY4MTljMTJlYzMyYmZhZjRlNzNiMjdiYWViMjczMjA3IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSBhNTk1NjMzOWEwNzgwYzIyOTQ4ZDY4OWVhNjQyMGQ2NTk3ZDdjMTAyIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hyaXN0aWFuIFBlcnNjaCA8Y2hwZUBzcmMu
Z25vbWUub3JnPgogRGF0ZTogVGh1LCA1IFNlcCAyMDI0IDIzOjU5OjA1ICswMjAwCi1TdWJqZWN0
OiBbUEFUQ0ggMi8zXSBsaWI6IFR5cG8gZml4CitTdWJqZWN0OiBbUEFUQ0hdIGxpYjogVHlwbyBm
aXgKIAogRml4ZXM6IGh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS92dGUvLS9pc3N1ZXMv
MjgxNgogVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRsYWIuZ25vbWUub3Jn
L0dOT01FL3Z0ZS8tL2NvbW1pdC9lMjQwODdkOTUzZDkzNTJjOGJjNDYwNzRlMjY2MmM4MGY5YmZi
YzJkXQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZS8wMDAzLUFkZC1t
aXNzaW5nLXN5c3RlbS1oZWFkZXJzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0
ZS8wMDAzLUFkZC1taXNzaW5nLXN5c3RlbS1oZWFkZXJzLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCA2NmQyYmViMTVhLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1z
dXBwb3J0L3Z0ZS92dGUvMDAwMy1BZGQtbWlzc2luZy1zeXN0ZW0taGVhZGVycy5wYXRjaAorKysg
L2Rldi9udWxsCkBAIC0xLDQyICswLDAgQEAKLUZyb20gYWRkM2RkNTJkMmUyYzE5ZGZhOTMxOWRl
OGQ4MzM1ZGNhODAyYmE1YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEtoZW0gUmFq
IDxyYWoua2hlbUBnbWFpbC5jb20+Ci1EYXRlOiBNb24sIDMwIFNlcCAyMDI0IDIyOjM2OjA5IC0w
NzAwCi1TdWJqZWN0OiBbUEFUQ0ggMy8zXSBBZGQgbWlzc2luZyBzeXN0ZW0gaGVhZGVycwotCi1U
aGVzZSBhcmUgZm91bmQgb3V0IHdoZW4gdXNpbmcgY2xhbmcgbGliYysrCi0KLWFsZ29yaXRobSBp
cyBuZWVkZWQgZm9yIHN0ZDo6bWF4IGFuZCBzdGQ6Om1pbgotc3RyaW5nX3ZpZXcgZm9yIHN0cmlu
Z192aWV3Ci0KLVVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dpdGxhYi5nbm9t
ZS5vcmcvR05PTUUvdnRlLy0vaXNzdWVzLzI4MjRdCi1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8
cmFqLmtoZW1AZ21haWwuY29tPgotCi0tLS0KLSBzcmMvaWN1LWdsdWUuaGggfCAxICsKLSBzcmMv
bWluaWZvbnQuY2MgfCAxICsKLSAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQotCi1k
aWZmIC0tZ2l0IGEvc3JjL2ljdS1nbHVlLmhoIGIvc3JjL2ljdS1nbHVlLmhoCi1pbmRleCBmMmMz
MzMxLi5mNzI5OTliIDEwMDY0NAotLS0tIGEvc3JjL2ljdS1nbHVlLmhoCi0rKysgYi9zcmMvaWN1
LWdsdWUuaGgKLUBAIC0yMCw2ICsyMCw3IEBACi0gI2luY2x1ZGUgPGdsaWIuaD4KLSAjaW5jbHVk
ZSA8bWVtb3J5PgotICNpbmNsdWRlIDxvcHRpb25hbD4KLSsjaW5jbHVkZSA8c3RyaW5nX3ZpZXc+
Ci0gCi0gbmFtZXNwYWNlIHZ0ZTo6YmFzZSB7Ci0gCi1kaWZmIC0tZ2l0IGEvc3JjL21pbmlmb250
LmNjIGIvc3JjL21pbmlmb250LmNjCi1pbmRleCA5YmU5NmQ2Li5mNGZlMGJmIDEwMDY0NAotLS0t
IGEvc3JjL21pbmlmb250LmNjCi0rKysgYi9zcmMvbWluaWZvbnQuY2MKLUBAIC0xOCw2ICsxOCw3
IEBACi0gCi0gI2luY2x1ZGUgImNvbmZpZy5oIgotIAotKyNpbmNsdWRlIDxhbGdvcml0aG0+Ci0g
I2luY2x1ZGUgPGNtYXRoPgotIAotICNpbmNsdWRlICJjYWlyby1nbHVlLmhoIgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZS8wMDA0LWZhc3RfZmxvYXQtQWRkLXNpbmds
ZS1oZWFkZXItbGlicmFyeS1mb3ItZnJvbV9jaGFyLWkucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC92dGUvdnRlLzAwMDQtZmFzdF9mbG9hdC1BZGQtc2luZ2xlLWhlYWRlci1saWJyYXJ5LWZv
ci1mcm9tX2NoYXItaS5wYXRjaAppbmRleCA3MzFkYmE3MjlkLi40NmEyZDE3NmI1IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlLzAwMDQtZmFzdF9mbG9hdC1BZGQtc2lu
Z2xlLWhlYWRlci1saWJyYXJ5LWZvci1mcm9tX2NoYXItaS5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC92dGUvdnRlLzAwMDQtZmFzdF9mbG9hdC1BZGQtc2luZ2xlLWhlYWRlci1saWJy
YXJ5LWZvci1mcm9tX2NoYXItaS5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gMmEzMmU0M2U0
M2IwNDc3MWEzMzU3ZDNkNGNjYmFmYTc3MTRlMDExNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gOWQ4OTZkMDIwYmZlZjkxNWQ1ODY0M2I5OWY4ZThmOTE0MDdjODRjOCBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRl
OiBGcmksIDQgT2N0IDIwMjQgMjE6MjE6MTEgLTA3MDAKLVN1YmplY3Q6IFtQQVRDSCA0LzVdIGZh
c3RfZmxvYXQ6IEFkZCBzaW5nbGUgaGVhZGVyIGxpYnJhcnkgZm9yIGZyb21fY2hhcgorU3ViamVj
dDogW1BBVENIXSBmYXN0X2Zsb2F0OiBBZGQgc2luZ2xlIGhlYWRlciBsaWJyYXJ5IGZvciBmcm9t
X2NoYXIKICBpbXBsZW1lbnRhdGlvbgogCiBEb2N1bWVudCB0aGUgcHJvY2VzcyB0byByZS1nZW5l
cmF0ZSB0aGUgZmlsZSB3aGVuZXZlciBuZXcgcmVsZWFzZQpAQCAtMTgsNyArMTgsNyBAQCBTaWdu
ZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIGNyZWF0ZSBtb2RlIDEw
MDY0NCBzcmMvZmFzdF9mbG9hdC5oaAogCiBkaWZmIC0tZ2l0IGEvUkVBRE1FLm1kIGIvUkVBRE1F
Lm1kCi1pbmRleCBhMzI0NjVhOS4uMjBlZDViYTIgMTAwNjQ0CitpbmRleCBhMzI0NjVhLi4yMGVk
NWJhIDEwMDY0NAogLS0tIGEvUkVBRE1FLm1kCiArKysgYi9SRUFETUUubWQKIEBAIC0yMSw2ICsy
MSwyMyBAQCBvbiBkb3dubG9hZC5nbm9tZS5vcmcsIGJ1dCBwbGVhc2Ugbm90ZSB0aGF0IGFueSB0
YXJiYWxsIGZvciByZWxlYXNlcwpAQCAtNDcsNyArNDcsNyBAQCBpbmRleCBhMzI0NjVhOS4uMjBl
ZDViYTIgMTAwNjQ0CiAgCiBkaWZmIC0tZ2l0IGEvc3JjL2Zhc3RfZmxvYXQuaGggYi9zcmMvZmFz
dF9mbG9hdC5oaAogbmV3IGZpbGUgbW9kZSAxMDA2NDQKLWluZGV4IDAwMDAwMDAwLi5lMGQ1ZGQ1
MworaW5kZXggMDAwMDAwMC4uZTBkNWRkNQogLS0tIC9kZXYvbnVsbAogKysrIGIvc3JjL2Zhc3Rf
ZmxvYXQuaGgKIEBAIC0wLDAgKzEsMzg2OSBAQApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvdnRlL3Z0ZS8wMDA1LWNvbG9yLXBhcnNlci1Vc2UtZmFzdF9mbG9hdC1pbXBsZW1lbnRh
dGlvbi1mb3ItZnJvbV8ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlLzAwMDUt
Y29sb3ItcGFyc2VyLVVzZS1mYXN0X2Zsb2F0LWltcGxlbWVudGF0aW9uLWZvci1mcm9tXy5wYXRj
aAppbmRleCBiOTUxYmJhYzE4Li4wYTQ4MTg2ZDQ3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC92dGUvdnRlLzAwMDUtY29sb3ItcGFyc2VyLVVzZS1mYXN0X2Zsb2F0LWltcGxlbWVu
dGF0aW9uLWZvci1mcm9tXy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUvdnRl
LzAwMDUtY29sb3ItcGFyc2VyLVVzZS1mYXN0X2Zsb2F0LWltcGxlbWVudGF0aW9uLWZvci1mcm9t
Xy5wYXRjaApAQCAtMSw4ICsxLDcgQEAKLUZyb20gMDhiOTBkMGE1YmY4Y2ViNjhkZDFiNGU5ZGVk
MGY4YTJiNTI4N2E2ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOWEzOGRkMmY4MzY3
ZDVmYTM2ZmEzMDIxMjAzOGEzZTNjOTM2Yzg5MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBGcmksIDQgT2N0IDIwMjQg
MjE6MjI6NTIgLTA3MDAKLVN1YmplY3Q6IFtQQVRDSCA1LzVdIGNvbG9yLXBhcnNlcjogVXNlIGZh
c3RfZmxvYXQgaW1wbGVtZW50YXRpb24gZm9yCi0gZnJvbV9jaGFycworU3ViamVjdDogW1BBVENI
XSBjb2xvci1wYXJzZXI6IFVzZSBmYXN0X2Zsb2F0IGltcGxlbWVudGF0aW9uIGZvciBmcm9tX2No
YXJzCiAKIFJlbW92ZWQgZGVwZW5kZW5jeSBvbiBjKysgcnVudGltZSB0byBwcm92aWRlIGl0Lgog
CkBAIC0xNiw3ICsxNSw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFp
bC5jb20+CiAgMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMo
LSkKIAogZGlmZiAtLWdpdCBhL3NyYy9jb2xvci1wYXJzZXIuY2MgYi9zcmMvY29sb3ItcGFyc2Vy
LmNjCi1pbmRleCAwMmVjNWQzYS4uNDJjNTE5NjYgMTAwNjQ0CitpbmRleCAwMmVjNWQzLi40MmM1
MTk2IDEwMDY0NAogLS0tIGEvc3JjL2NvbG9yLXBhcnNlci5jYwogKysrIGIvc3JjL2NvbG9yLXBh
cnNlci5jYwogQEAgLTE3LDcgKzE3LDcgQEAKQEAgLTY0LDcgKzYzLDcgQEAgaW5kZXggMDJlYzVk
M2EuLjQyYzUxOTY2IDEwMDY0NAogICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBzdGQ6
Om51bGxvcHQ7CiAgCiBkaWZmIC0tZ2l0IGEvc3JjL3Rlcm1wcm9wcy5oaCBiL3NyYy90ZXJtcHJv
cHMuaGgKLWluZGV4IDBkM2YwZjRjLi5hMTBmYzdkMSAxMDA2NDQKK2luZGV4IDBkM2YwZjQuLmEx
MGZjN2QgMTAwNjQ0CiAtLS0gYS9zcmMvdGVybXByb3BzLmhoCiArKysgYi9zcmMvdGVybXByb3Bz
LmhoCiBAQCAtMTcsNiArMTcsNyBAQApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
dnRlL3Z0ZV8wLjc4LjAuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlXzAuNzguMS5i
YgpzaW1pbGFyaXR5IGluZGV4IDg0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC92
dGUvdnRlXzAuNzguMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZV8w
Ljc4LjEuYmIKaW5kZXggOWFkYTUzYTYzNC4uNTcyM2YzNWI4MyAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZV8wLjc4LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvdnRlL3Z0ZV8wLjc4LjEuYmIKQEAgLTE4LDEzICsxOCwxMSBAQCBHSURPQ0dFTl9NRVNPTl9P
UFRJT04gPSAiZG9jcyIKIGluaGVyaXQgZ25vbWViYXNlIGdpLWRvY2dlbiBmZWF0dXJlc19jaGVj
ayB1cHN0cmVhbS12ZXJzaW9uLWlzLWV2ZW4gZ29iamVjdC1pbnRyb3NwZWN0aW9uIHN5c3RlbWQg
dmFsYQogCiBTUkNfVVJJICs9ICJmaWxlOi8vMDAwMS1BZGQtV19FWElUQ09ERS1tYWNyby1mb3It
bm9uLWdsaWJjLXN5c3RlbXMucGF0Y2ggXAotICAgICAgICAgICAgZmlsZTovLzAwMDEtdGVzdHMt
UmVtb3ZlLWV4Y2Vzc2l2ZS1jb25zdHJleHByLnBhdGNoIFwKLSAgICAgICAgICAgIGZpbGU6Ly8w
MDAyLWxpYi1UeXBvLWZpeC5wYXRjaCBcCi0gICAgICAgICAgICBmaWxlOi8vMDAwMy1BZGQtbWlz
c2luZy1zeXN0ZW0taGVhZGVycy5wYXRjaCBcCi0gICAgICAgICAgICBmaWxlOi8vMDAwNC1mYXN0
X2Zsb2F0LUFkZC1zaW5nbGUtaGVhZGVyLWxpYnJhcnktZm9yLWZyb21fY2hhci1pLnBhdGNoIFwK
LQkJCWZpbGU6Ly8wMDA1LWNvbG9yLXBhcnNlci1Vc2UtZmFzdF9mbG9hdC1pbXBsZW1lbnRhdGlv
bi1mb3ItZnJvbV8ucGF0Y2ggXAotIgotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiMDdm
MDljNjIyOGE4YmIzYzE1OTlkZDBmNWE2ZWM3OTdiMzBkMzAxMGMzYWM5MWNmMjFiNjlkOTYzNWRm
YWY3YyIKKyAgICAgICAgICAgZmlsZTovLzAwMDItbGliLVR5cG8tZml4LnBhdGNoIFwKKyAgICAg
ICAgICAgZmlsZTovLzAwMDQtZmFzdF9mbG9hdC1BZGQtc2luZ2xlLWhlYWRlci1saWJyYXJ5LWZv
ci1mcm9tX2NoYXItaS5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly8wMDA1LWNvbG9yLXBhcnNl
ci1Vc2UtZmFzdF9mbG9hdC1pbXBsZW1lbnRhdGlvbi1mb3ItZnJvbV8ucGF0Y2ggXAorICAgICAg
ICAgICAiCitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICI2NDk5ZDI1MTc5MzE1MjU1Zjli
Y2ZjZTAzYzY2ZmI4NGMwM2FkMzI1ZGVhMjNkMGUzNzIxNzg1MjFlY2E0MmI1IgogCiBBTllfT0Zf
RElTVFJPX0ZFQVRVUkVTID0gIiR7R1RLM0RJU1RST0ZFQVRVUkVTfSIKIAotLSAKMi40NC4xCgo=

--===============2450611308414882973==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (0 cached, 921 parsed). 1881 targets, 52 skipped, 0 masked, 0 errors.
Removing 125 recipes from the core2-64 sysroot...done.
Removing 125 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:703a29f8e8679781131ececa95868fec2a3b6352"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 923 Local 908 Mirrors 0 Missed 15 Current 364 (98% match, 98% complete)
Removing 3 stale sstate objects for arch x86_64...done.
Removing 3 stale sstate objects for arch qemux86_64...done.
Removing 2 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 374 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_create_spdx_setscene)
NOTE: Running setscene task 376 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 377 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 379 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_create_spdx_setscene)
NOTE: Running setscene task 380 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx_setscene)
NOTE: Running setscene task 381 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 382 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 383 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 384 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 385 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 386 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 387 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 388 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_create_spdx_setscene)
NOTE: Running setscene task 389 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 398 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.1.bb:do_populate_lic_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.79-r0: task do_create_spdx_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe vte-0.78.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libwebp-1.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lz4-1_1.10.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 402 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 403 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.79-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 405 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 407 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 409 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 413 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.10.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 414 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 415 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.40.bb:do_create_spdx_setscene)
NOTE: recipe vte-0.78.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 417 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe gnutls-3.8.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 419 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_create_spdx_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk4-4.16.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.40-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk4-4.16.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 420 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 424 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 425 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: recipe orc-0.4.40-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 426 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe librsvg-2.58.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 428 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_create_spdx_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 429 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_create_spdx_setscene)
NOTE: recipe libxcursor-1_1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 432 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 433 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_create_spdx_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 435 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 439 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 441 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: recipe gtk4-4.16.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.54.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 445 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_create_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk4-4.16.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 451 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_packagedata_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 456 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 460 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.1.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.54.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 492 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.0.1.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 494 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_create_spdx_setscene)
NOTE: recipe vala-0.56.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 525 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lz4-1_1.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.54.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lz4-1_1.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vte-0.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-10.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 573 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_create_spdx_setscene)
NOTE: Running setscene task 574 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 575 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_create_spdx_setscene)
NOTE: Running setscene task 579 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 582 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 585 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe lz4-1_1.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 601 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 602 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 603 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vte-0.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 604 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 605 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe harfbuzz-10.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 606 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 607 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_create_spdx_setscene)
NOTE: recipe lz4-1_1.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 608 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_create_spdx_setscene)
NOTE: recipe wayland-protocols-1.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.123-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 610 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 611 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 612 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_create_spdx_setscene)
NOTE: recipe cairo-1.18.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-75-1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 613 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_create_spdx_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.123-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 614 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 616 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 619 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 620 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 621 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 622 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: recipe lz4-1_1.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 623 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-75-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nettle-3.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 624 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 625 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 626 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_create_spdx_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 629 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_package_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 630 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.4.bb:do_create_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 634 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 638 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 641 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 644 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 645 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 646 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 647 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.44.bb:do_create_spdx_setscene)
NOTE: Running setscene task 648 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 649 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 652 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 656 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 658 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 659 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 661 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_recipe_qa_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 664 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_create_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.13.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpng-1.6.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 668 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_create_spdx_setscene)
NOTE: Running setscene task 670 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 683 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe at-spi2-core-2.54.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 684 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 687 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_package_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 695 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.54.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 697 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 698 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 700 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1391 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb:do_fetch)
NOTE: Running task 1411 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.1.bb:do_fetch)
NOTE: Running task 1413 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb:do_write_config)
NOTE: Running task 1447 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.1.bb:do_write_config)
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 701 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe gtk4-4.16.3-r0: task do_fetch: Started
NOTE: recipe vte-0.78.1-r0: task do_fetch: Started
NOTE: recipe gtk4-4.16.3-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.54.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk4-4.16.3-r0: task do_fetch: Succeeded
NOTE: recipe vte-0.78.1-r0: task do_write_config: Started
NOTE: Running task 1503 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb:do_unpack)
NOTE: recipe vte-0.78.1-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1504 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.1.bb:do_unpack)
NOTE: Running setscene task 703 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 704 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk4-4.16.3-r0: task do_write_config: Succeeded
NOTE: Running setscene task 706 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vte-0.78.1-r0: task do_write_config: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk4-4.16.3-r0: task do_unpack: Started
NOTE: recipe vte-0.78.1-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 708 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 711 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 715 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe vte-0.78.1-r0: task do_unpack: Succeeded
NOTE: Running task 1510 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.1.bb:do_patch)
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vte-0.78.1-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vte-0.78.1-r0: task do_patch: Succeeded
NOTE: Running task 1579 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.1.bb:do_deploy_source_date_epoch)
NOTE: recipe vte-0.78.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.78.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.1.bb:do_deploy_source_date_epoch unihash changed to 4450cbf3ad8647dced2f91eb09bafb80db01a8709bb8b92a72a5955c1fb31028
NOTE: recipe gtk4-4.16.3-r0: task do_unpack: Succeeded
NOTE: Running task 1581 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb:do_patch)
NOTE: recipe gtk4-4.16.3-r0: task do_patch: Started
NOTE: recipe gtk4-4.16.3-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 724 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_packagedata_setscene)
NOTE: Running setscene task 725 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 726 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata_setscene)
NOTE: Running setscene task 727 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 728 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 729 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 730 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 731 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 732 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 733 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 734 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 735 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 736 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 737 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 738 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 739 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.79-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.79-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 740 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_recipe_qa_setscene)
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 742 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 744 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.79-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 748 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 749 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 750 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_packagedata_setscene)
NOTE: Running setscene task 752 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 754 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.79-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.79.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 757 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 758 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libwebp-1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 759 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 761 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 762 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.79-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 763 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 764 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.79.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 766 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 767 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.79-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 768 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 770 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 773 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libstd-rs-1.79.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 775 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 777 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 779 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 780 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 781 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.79.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 783 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.43-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 785 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 788 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 789 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 791 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_recipe_qa_setscene)
NOTE: recipe librsvg-2.58.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 792 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 793 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 795 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.40.bb:do_packagedata_setscene)
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 796 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.40.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 797 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 799 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 800 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 801 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 804 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-0.4.40-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 805 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 806 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 808 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 809 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe orc-0.4.40-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 810 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 812 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 813 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.54.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 815 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 817 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.0.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 819 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.40.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 822 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.79.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 824 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 826 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 827 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 829 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 832 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.40-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 833 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-10.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 834 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.79.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 836 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-10.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 838 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 840 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 841 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 842 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.79.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 844 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 846 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 847 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 850 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-10.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 852 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 854 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 855 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 857 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-10.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 858 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 860 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 862 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 864 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pango-1.54.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 865 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 866 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 867 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 869 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 871 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 873 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 875 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 876 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.123-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-10.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 877 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 879 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 881 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-10.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 882 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 883 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-protocols-1.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 885 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 887 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 888 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.123-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 890 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 891 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 893 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 895 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 896 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.123-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 898 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 900 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 902 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 903 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.123-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 905 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 907 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 908 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 909 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 912 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 913 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 915 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 918 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 920 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 922 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 923 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.123-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 925 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 927 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 928 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 930 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.123-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 932 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 936 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 939 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 941 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 943 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 944 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 945 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 947 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 949 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 951 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 953 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 955 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 957 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 959 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 960 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 962 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 963 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 964 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 966 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.44-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 967 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 968 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 970 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 971 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 972 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 973 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 974 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 975 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 977 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 978 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 980 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_packagedata_setscene)
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 981 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 983 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 984 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.1.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 986 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 988 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.44.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iso-codes-4.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 989 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_populate_sysroot_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/gstreamer1.0/1.24.6/temp/log.do_packagedata_setscene.589441
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 991 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 992 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_package_setscene)
NOTE: recipe xtrans-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 995 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 997 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 998 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1000 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1003 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1006 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1008 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1009 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1012 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_package_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1013 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1014 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1016 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_recipe_qa_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1017 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1019 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1021 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1022 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1023 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1024 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1025 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1026 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1029 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1031 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1033 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1034 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1035 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1037 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1039 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1041 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1043 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1052 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1054 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1055 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1056 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1057 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1059 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1060 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1061 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1063 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1066 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1067 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1070 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1072 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1073 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1077 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1081 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1083 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1085 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1087 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1088 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1089 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1091 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1093 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1094 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1095 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_packagedata_setscene)
NOTE: Running setscene task 1097 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1100 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1101 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1103 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1104 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1966 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_fetch)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_fetch: Started
NOTE: Running setscene task 1106 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1109 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2046 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_unpack)
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1113 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1115 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-33-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-33-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1116 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1117 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1118 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1119 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1121 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.13.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.13.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.13.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.13.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1124 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.4.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.13.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1127 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1128 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1129 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1130 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1131 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1132 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1134 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1139 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1141 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1142 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1144 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1146 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1148 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1149 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-72.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1152 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1153 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1154 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1155 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1156 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1157 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1158 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-72.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1160 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1161 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1162 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1163 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1164 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1165 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1166 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1167 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1168 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1170 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1173 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1175 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1179 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1181 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1184 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1185 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1186 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1187 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1189 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1190 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1191 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1192 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1193 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1195 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/sqlite3/3.46.1/temp/log.do_packagedata_setscene.592801
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Started
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1197 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_package_setscene)
NOTE: Running setscene task 1198 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_package_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1202 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1204 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1205 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1207 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1209 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1211 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1212 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1214 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1216 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1218 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1220 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1222 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1223 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1225 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1227 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1230 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1232 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1233 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1235 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1237 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1238 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1243 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1245 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1247 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1249 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1250 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1252 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1254 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1255 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1257 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1259 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1260 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1261 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1262 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1264 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1268 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1269 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1271 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1276 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1278 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1279 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1283 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1284 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1286 of 1287 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2605 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_packagedata)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata: Started
NOTE: Running task 3215 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata: Succeeded
NOTE: recipe gtk4-4.16.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3407 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3482 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3483 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_create_spdx)
NOTE: recipe gtk4-4.16.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3484 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_create_spdx: Started
NOTE: recipe gtk4-4.16.3-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3485 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.16.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.16.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk4-4.16.3-r0: task do_configure: Succeeded
NOTE: Running task 3486 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb:do_compile)
NOTE: recipe gtk4-4.16.3-r0: task do_compile: Started
NOTE: recipe gtk4-4.16.3-r0: task do_compile: Succeeded
NOTE: Running task 3487 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb:do_install)
NOTE: recipe gtk4-4.16.3-r0: task do_install: Started
NOTE: recipe gtk4-4.16.3-r0: task do_install: Succeeded
NOTE: Running task 3488 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb:do_package)
NOTE: Running task 3489 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.16.3-r0: task do_package: Started
NOTE: recipe gtk4-4.16.3-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.16.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3490 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vte-0.78.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vte-0.78.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3491 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.1.bb:do_configure)
NOTE: recipe vte-0.78.1-r0: task do_configure: Started
NOTE: recipe vte-0.78.1-r0: task do_configure: Succeeded
NOTE: Running task 3492 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.1.bb:do_compile)
NOTE: recipe vte-0.78.1-r0: task do_compile: Started
NOTE: recipe gtk4-4.16.3-r0: task do_package: Succeeded
NOTE: Running task 3493 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb:do_packagedata)
NOTE: recipe gtk4-4.16.3-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.16.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb:do_packagedata unihash changed to 10600e2ae0e319ffff9809add6b5d80978f386419774101559b87ae4db178cd3
NOTE: Setscene tasks completed
NOTE: Running task 3494 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb:do_create_spdx)
NOTE: recipe gtk4-4.16.3-r0: task do_create_spdx: Started
NOTE: recipe gtk4-4.16.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3495 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.1.bb:do_collect_spdx_deps)
NOTE: recipe vte-0.78.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe vte-0.78.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vte-0.78.1-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3496 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.1.bb:do_install)
NOTE: recipe vte-0.78.1-r0: task do_install: Started
NOTE: recipe vte-0.78.1-r0: task do_install: Succeeded
NOTE: Running task 3497 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.1.bb:do_package)
NOTE: Running task 3498 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.1.bb:do_populate_sysroot)
NOTE: recipe vte-0.78.1-r0: task do_package: Started
NOTE: recipe vte-0.78.1-r0: task do_populate_sysroot: Started
NOTE: recipe vte-0.78.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vte-0.78.1-r0: task do_package: Succeeded
NOTE: Running task 3499 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.1.bb:do_packagedata)
NOTE: recipe vte-0.78.1-r0: task do_packagedata: Started
NOTE: recipe vte-0.78.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3500 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.1.bb:do_create_spdx)
NOTE: Running task 3501 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.1.bb:do_package_write_ipk)
NOTE: Running task 3502 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.1.bb:do_package_write_deb)
NOTE: Running task 3503 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.1.bb:do_package_write_rpm)
NOTE: Running task 3504 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.1.bb:do_package_qa)
NOTE: recipe vte-0.78.1-r0: task do_create_spdx: Started
NOTE: recipe vte-0.78.1-r0: task do_package_write_ipk: Started
NOTE: recipe vte-0.78.1-r0: task do_package_write_deb: Started
NOTE: recipe vte-0.78.1-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.78.1-r0: task do_package_qa: Started
NOTE: recipe vte-0.78.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3505 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.1.bb:do_create_package_spdx)
NOTE: recipe vte-0.78.1-r0: task do_create_package_spdx: Started
NOTE: recipe vte-0.78.1-r0: task do_create_package_spdx: Succeeded
NOTE: recipe vte-0.78.1-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.1.bb:do_package_qa unihash changed to 732e84c6c1c346a2a7dac92ed231a0e43b0642bcc6d893c4c11e6493478bc2ee
NOTE: recipe vte-0.78.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe vte-0.78.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe vte-0.78.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3506 of 3506 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.1.bb:do_build)
NOTE: Tasks Summary: Attempted 3506 tasks of which 3467 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 12 seconds

Summary: There were 61 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-src went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-dbg went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-ptest went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-staticdev went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-dev went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-doc went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-af went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-ast went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-az went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-be went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-bg went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-ca went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-cs went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-da went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-de went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-el went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-en-gb went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-eo went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-es went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-eu went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-fi went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-fr went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-fur went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-gl went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-hr went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-hu went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-id went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-it went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-ja went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-ka went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-ko went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-lt went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-lv went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-nb went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-nl went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-pl went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-pt-br went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-ro went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-ru went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-rw went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-sk went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-sl went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-sq went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-sr went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-sv went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-tr went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-uk went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-vi went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-zh-cn went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-zh-tw went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0 went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-bash-completion went backwards which would break package feeds (from 0:1.24.9-r0 to 0:1.24.6-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.24.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: sqlite3-3_3.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-src went backwards which would break package feeds (from 3:3.47.0-r0 to 3:3.46.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-dbg went backwards which would break package feeds (from 3:3.47.0-r0 to 3:3.46.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3 went backwards which would break package feeds (from 3:3.47.0-r0 to 3:3.46.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-dev went backwards which would break package feeds (from 3:3.47.0-r0 to 3:3.46.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-doc went backwards which would break package feeds (from 3:3.47.0-r0 to 3:3.46.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-staticdev went backwards which would break package feeds (from 3:3.47.0-r0 to 3:3.46.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3 went backwards which would break package feeds (from 3:3.47.0-r0 to 3:3.46.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.46.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2450611308414882973==--

