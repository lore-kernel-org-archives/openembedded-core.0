Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B664E776E9
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:19 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.65027.1696183991658473958
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Tm5gIxrZ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cEq+nbxU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018aec71ba3b-111823a9-c127-4ea3-a804-a276efd4a9d8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xgkFnOHFG8zlBiUQ9V4eW0V1+M3wWJI261L2iUxAOg8=;
	b=Tm5gIxrZ0RB6wn3lrdIBhwAhq2xUTaM4V2uQgq9jl8YTokKebWYbuX2D6S4a9hCr
	0piv36/lJ8l5fNQ2m4LRohs+izMzZbXTTafAdd20mhjDjyX276J+YfoaSdved0Sr0T7
	qXRa8Uj7dPAHjeJroM6+hnDkbslK/ZPq6EzxvMTc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xgkFnOHFG8zlBiUQ9V4eW0V1+M3wWJI261L2iUxAOg8=;
	b=cEq+nbxUWsCvQlnUtf0J6gJ13/6ZzCUyORqhNq8ikKNb3UdAcXrnSsHoR78qhjQz
	B83x0JcIvgF3kWrK1Tp8fEKLjBCgZkgwOrhvP54FjlJVQEDrEr+bKjTLABZOm1ddHG7
	vcmQ6ZuyO7vuumSxiBJpv+aZKNW63ANX2nlYizrE=
Content-Type: multipart/mixed; boundary="===============0584463503205961646=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu: upgrading to 8.1.1 FAILED
Message-ID: <0101018aec71ba3b-111823a9-c127-4ea3-a804-a276efd4a9d8-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188554

--===============0584463503205961646==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
ICpxZW11KiB0byAqOC4xLjEqIGhhcyBGYWlsZWQoZG9fY29tcGlsZSkuCgpEZXRhaWxlZCBlcnJv
ciBpbmZvcm1hdGlvbjoKCmRvX2NvbXBpbGUgZmFpbGVkCgoKCk5leHQgc3RlcHM6CiAgICAtIGFw
cGx5IHRoZSBwYXRjaDogZ2l0IGFtIDAwMDEtcWVtdS11cGdyYWRlLTguMS4wLTguMS4xLnBhdGNo
CiAgICAtIGNoZWNrIHRoZSBjaGFuZ2VzIHRvIHVwc3RyZWFtIHBhdGNoZXMgYW5kIHN1bW1hcml6
ZSB0aGVtIGluIHRoZSBjb21taXQgbWVzc2FnZSwKICAgIC0gY29tcGlsZSBhbiBpbWFnZSB0aGF0
IGNvbnRhaW5zIHRoZSBwYWNrYWdlCiAgICAtIHBlcmZvcm0gc29tZSBiYXNpYyBzYW5pdHkgdGVz
dHMKICAgIC0gYW1lbmQgdGhlIHBhdGNoIGFuZCBzaWduIGl0IG9mZjogZ2l0IGNvbW1pdCAtcyAt
LXJlc2V0LWF1dGhvciAtLWFtZW5kCiAgICAtIHNlbmQgaXQgdG8gdGhlIGFwcHJvcHJpYXRlIG1h
aWxpbmcgbGlzdAoKQWx0ZXJuYXRpdmVseSwgaWYgeW91IGJlbGlldmUgdGhlIHJlY2lwZSBzaG91
bGQgbm90IGJlIHVwZ3JhZGVkIGF0IHRoaXMgdGltZSwKeW91IGNhbiBmaWxsIFJFQ0lQRV9OT19V
UERBVEVfUkVBU09OIGluIHJlc3BlY3RpdmUgcmVjaXBlIGZpbGUgc28gdGhhdAphdXRvbWF0aWMg
dXBncmFkZXMgd291bGQgbm8gbG9uZ2VyIGJlIGF0dGVtcHRlZC4KClBsZWFzZSByZXZpZXcgdGhl
IGF0dGFjaGVkIGZpbGVzIGZvciBmdXJ0aGVyIGluZm9ybWF0aW9uIGFuZCBidWlsZC91cGRhdGUg
ZmFpbHVyZXMuCkFueSBwcm9ibGVtIHBsZWFzZSBmaWxlIGEgYnVnIGF0IGh0dHBzOi8vYnVnemls
bGEueW9jdG9wcm9qZWN0Lm9yZy9lbnRlcl9idWcuY2dpP3Byb2R1Y3Q9QXV0b21hdGVkJTIwVXBk
YXRlJTIwSGFuZGxlcgoKUmVnYXJkcywKVGhlIFVwZ3JhZGUgSGVscGVyCgotLSA+OCAtLQpGcm9t
IGU5NjA4N2VkYjgzMDc0MmM3YzQyZDJkZTc4YmU1M2I0ZGQ3NjZjODEgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCkZyb206IFVwZ3JhZGUgSGVscGVyIDxhdWhAeW9jdG9wcm9qZWN0Lm9yZz4KRGF0
ZTogU3VuLCAxIE9jdCAyMDIzIDEwOjMwOjM4ICswMDAwClN1YmplY3Q6IFtQQVRDSF0gcWVtdTog
dXBncmFkZSA4LjEuMCAtPiA4LjEuMQoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9x
ZW11LmluYyAgICAgICAgICAgfCAgNCArLQogLi4udC1kYXRhLWluLWJvdW5kcy1pbi1pb3RsYl90
b19zZWN0aW9uLnBhdGNoIHwgNDIgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4uL3FlbXUve3FlbXVf
OC4xLjAuYmIgPT4gcWVtdV84LjEuMS5iYn0gICAgIHwgIDAKIDMgZmlsZXMgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCA0NCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDEtc29mdG1tdS1Bc3NlcnQtZGF0YS1pbi1ib3Vu
ZHMtaW4taW90bGJfdG9fc2VjdGlvbi5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9xZW11L3txZW11XzguMS4wLmJiID0+IHFlbXVfOC4xLjEuYmJ9ICgxMDAlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5jIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3FlbXUvcWVtdS5pbmMKaW5kZXggOTY2NGI3NDdiMy4uZjY3MTgyZmE1ZSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMKQEAgLTI5LDE3ICsyOSwxNyBAQCBTUkNfVVJJID0g
Imh0dHBzOi8vZG93bmxvYWQucWVtdS5vcmcvJHtCUE59LSR7UFZ9LnRhci54eiBcCiAgICAgICAg
ICAgIGZpbGU6Ly8wMDA5LURlZmluZS1NQVBfU1lOQy1hbmQtTUFQX1NIQVJFRF9WQUxJREFURS1v
bi1uZWVkZWQtbGkucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAxMC1ody1wdnJkbWEtUHJv
dGVjdC1hZ2FpbnN0LWJ1Z2d5LW9yLW1hbGljaW91cy1ndWVzdC1kLnBhdGNoIFwKICAgICAgICAg
ICAgZmlsZTovLzAwMDItbGludXgtdXNlci1SZXBsYWNlLXVzZS1vZi1sZnM2NC1yZWxhdGVkLWZ1
bmN0aW9ucy1hbi5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLXNvZnRtbXUtQXNzZXJ0
LWRhdGEtaW4tYm91bmRzLWluLWlvdGxiX3RvX3NlY3Rpb24ucGF0Y2ggXAogICAgICAgICAgICBm
aWxlOi8vMDAwMS1zb2Z0bW11LVVzZS1hc3luY19ydW5fb25fY3B1LWluLXRjZ19jb21taXQucGF0
Y2ggXAogICAgICAgICAgICBmaWxlOi8vZml4ZWRtZXNvbi5wYXRjaCBcCiAgICAgICAgICAgIGZp
bGU6Ly9maXhtaXBzLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL3FlbXUtZ3Vlc3QtYWdlbnQu
aW5pdCBcCiAgICAgICAgICAgIGZpbGU6Ly9xZW11LWd1ZXN0LWFnZW50LnVkZXYgXAorICAgICAg
ICAgICBmaWxlOi8vY3Jvc3MucGF0Y2ggXAogICAgICAgICAgICAiCiBVUFNUUkVBTV9DSEVDS19S
RUdFWCA9ICJxZW11LSg/UDxwdmVyPlxkKyhcLlxkKykrKVwudGFyIgogCiAKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICI3MTBjMTAxMTk4ZTMzNGQ0NzYyZWVmNjVmNjQ5YmM0M2ZhOGE1ZGQ3NTMwMzU1
NGI4YWNmZWMzZWIyNWYwZTU1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM3Y2UyZWY1ZTUwMGZi
NzUyZjY4MTExN2M2OGI0NTExODMwM2VhNDlhN2UyNmJkNTQwODBjZWQ1NGZhYjdkZWYiCiAKIFNS
Q19VUkk6YXBwZW5kOmNsYXNzLXRhcmdldCA9ICIgZmlsZTovL2Nyb3NzLnBhdGNoIgogU1JDX1VS
STphcHBlbmQ6Y2xhc3MtbmF0aXZlc2RrID0gIiBmaWxlOi8vY3Jvc3MucGF0Y2giCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDEtc29mdG1tdS1Bc3NlcnQt
ZGF0YS1pbi1ib3VuZHMtaW4taW90bGJfdG9fc2VjdGlvbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9xZW11L3FlbXUvMDAwMS1zb2Z0bW11LUFzc2VydC1kYXRhLWluLWJvdW5kcy1pbi1p
b3RsYl90b19zZWN0aW9uLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA3Mzgw
ZTE2YWIzLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUv
MDAwMS1zb2Z0bW11LUFzc2VydC1kYXRhLWluLWJvdW5kcy1pbi1pb3RsYl90b19zZWN0aW9uLnBh
dGNoCisrKyAvZGV2L251bGwKQEAgLTEsNDIgKzAsMCBAQAotRnJvbSA4NmU0ZjkzZDgyN2QzYzFl
ZmQwMGNkOGE5MDZlMzhhMmMwZjJiNWJjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTog
UmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+Ci1EYXRlOiBG
cmksIDI1IEF1ZyAyMDIzIDE0OjA2OjU4IC0wNzAwCi1TdWJqZWN0OiBbUEFUQ0hdIHNvZnRtbXU6
IEFzc2VydCBkYXRhIGluIGJvdW5kcyBpbiBpb3RsYl90b19zZWN0aW9uCi1NSU1FLVZlcnNpb246
IDEuMAotQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04Ci1Db250ZW50LVRy
YW5zZmVyLUVuY29kaW5nOiA4Yml0Ci0KLUFja2VkLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVu
bmVlQGxpbmFyby5vcmc+Ci1TdWdnZXN0ZWQtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVA
bGluYXJvLm9yZz4KLVNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhl
bmRlcnNvbkBsaW5hcm8ub3JnPgotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczov
L2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3FlbXUvLS9jb21taXQvODZlNGY5M2Q4MjdkM2MxZWZk
MDBjZDhhOTA2ZTM4YTJjMGYyYjViY10KLS0tLQotIHNvZnRtbXUvcGh5c21lbS5jIHwgMTAgKysr
KysrKystLQotIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Ci0KLWRpZmYgLS1naXQgYS9zb2Z0bW11L3BoeXNtZW0uYyBiL3NvZnRtbXUvcGh5c21lbS5jCi1p
bmRleCAzZGY3MzU0MmUxLi43NTk3ZGMxYzM5IDEwMDY0NAotLS0tIGEvc29mdG1tdS9waHlzbWVt
LmMKLSsrKyBiL3NvZnRtbXUvcGh5c21lbS5jCi1AQCAtMjQxMyw5ICsyNDEzLDE1IEBAIE1lbW9y
eVJlZ2lvblNlY3Rpb24gKmlvdGxiX3RvX3NlY3Rpb24oQ1BVU3RhdGUgKmNwdSwKLSAgICAgaW50
IGFzaWR4ID0gY3B1X2FzaWR4X2Zyb21fYXR0cnMoY3B1LCBhdHRycyk7Ci0gICAgIENQVUFkZHJl
c3NTcGFjZSAqY3B1YXMgPSAmY3B1LT5jcHVfYXNlc1thc2lkeF07Ci0gICAgIEFkZHJlc3NTcGFj
ZURpc3BhdGNoICpkID0gcWF0b21pY19yY3VfcmVhZCgmY3B1YXMtPm1lbW9yeV9kaXNwYXRjaCk7
Ci0tICAgIE1lbW9yeVJlZ2lvblNlY3Rpb24gKnNlY3Rpb25zID0gZC0+bWFwLnNlY3Rpb25zOwot
KyAgICBpbnQgc2VjdGlvbl9pbmRleCA9IGluZGV4ICYgflRBUkdFVF9QQUdFX01BU0s7Ci0rICAg
IE1lbW9yeVJlZ2lvblNlY3Rpb24gKnJldDsKLSsKLSsgICAgYXNzZXJ0KHNlY3Rpb25faW5kZXgg
PCBkLT5tYXAuc2VjdGlvbnNfbmIpOwotKyAgICByZXQgPSBkLT5tYXAuc2VjdGlvbnMgKyBzZWN0
aW9uX2luZGV4OwotKyAgICBhc3NlcnQocmV0LT5tcik7Ci0rICAgIGFzc2VydChyZXQtPm1yLT5v
cHMpOwotIAotLSAgICByZXR1cm4gJnNlY3Rpb25zW2luZGV4ICYgflRBUkdFVF9QQUdFX01BU0td
OwotKyAgICByZXR1cm4gcmV0OwotIH0KLSAKLSBzdGF0aWMgdm9pZCBpb19tZW1faW5pdCh2b2lk
KQotLS0gCi0yLjM0LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUv
cWVtdV84LjEuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXVfOC4xLjEuYmIK
c2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9x
ZW11L3FlbXVfOC4xLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3Fl
bXVfOC4xLjEuYmIKLS0gCjIuMzkuMgoK

--===============0584463503205961646==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-qemu-upgrade-8.1.0-8.1.1.patch"

RnJvbSBlOTYwODdlZGI4MzA3NDJjN2M0MmQyZGU3OGJlNTNiNGRkNzY2YzgxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBPY3QgMjAyMyAxMDozMDozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHFl
bXU6IHVwZ3JhZGUgOC4xLjAgLT4gOC4xLjEKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Fl
bXUvcWVtdS5pbmMgICAgICAgICAgIHwgIDQgKy0KIC4uLnQtZGF0YS1pbi1ib3VuZHMtaW4taW90
bGJfdG9fc2VjdGlvbi5wYXRjaCB8IDQyIC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi9xZW11L3tx
ZW11XzguMS4wLmJiID0+IHFlbXVfOC4xLjEuYmJ9ICAgICB8ICAwCiAzIGZpbGVzIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgNDQgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDAxLXNvZnRtbXUtQXNzZXJ0LWRhdGEtaW4t
Ym91bmRzLWluLWlvdGxiX3RvX3NlY3Rpb24ucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcWVtdS97cWVtdV84LjEuMC5iYiA9PiBxZW11XzguMS4xLmJifSAoMTAwJSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LmluYyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9xZW11L3FlbXUuaW5jCmluZGV4IDk2NjRiNzQ3YjMuLmY2NzE4MmZhNWUgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5jCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5jCkBAIC0yOSwxNyArMjksMTcgQEAgU1JDX1VS
SSA9ICJodHRwczovL2Rvd25sb2FkLnFlbXUub3JnLyR7QlBOfS0ke1BWfS50YXIueHogXAogICAg
ICAgICAgICBmaWxlOi8vMDAwOS1EZWZpbmUtTUFQX1NZTkMtYW5kLU1BUF9TSEFSRURfVkFMSURB
VEUtb24tbmVlZGVkLWxpLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMTAtaHctcHZyZG1h
LVByb3RlY3QtYWdhaW5zdC1idWdneS1vci1tYWxpY2lvdXMtZ3Vlc3QtZC5wYXRjaCBcCiAgICAg
ICAgICAgIGZpbGU6Ly8wMDAyLWxpbnV4LXVzZXItUmVwbGFjZS11c2Utb2YtbGZzNjQtcmVsYXRl
ZC1mdW5jdGlvbnMtYW4ucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMS1zb2Z0bW11LUFz
c2VydC1kYXRhLWluLWJvdW5kcy1pbi1pb3RsYl90b19zZWN0aW9uLnBhdGNoIFwKICAgICAgICAg
ICAgZmlsZTovLzAwMDEtc29mdG1tdS1Vc2UtYXN5bmNfcnVuX29uX2NwdS1pbi10Y2dfY29tbWl0
LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL2ZpeGVkbWVzb24ucGF0Y2ggXAogICAgICAgICAg
ICBmaWxlOi8vZml4bWlwcy5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9xZW11LWd1ZXN0LWFn
ZW50LmluaXQgXAogICAgICAgICAgICBmaWxlOi8vcWVtdS1ndWVzdC1hZ2VudC51ZGV2IFwKKyAg
ICAgICAgICAgZmlsZTovL2Nyb3NzLnBhdGNoIFwKICAgICAgICAgICAgIgogVVBTVFJFQU1fQ0hF
Q0tfUkVHRVggPSAicWVtdS0oP1A8cHZlcj5cZCsoXC5cZCspKylcLnRhciIKIAogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiNzEwYzEwMTE5OGUzMzRkNDc2MmVlZjY1ZjY0OWJjNDNmYThhNWRkNzUz
MDM1NTRiOGFjZmVjM2ViMjVmMGU1NSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzN2NlMmVmNWU1
MDBmYjc1MmY2ODExMTdjNjhiNDUxMTgzMDNlYTQ5YTdlMjZiZDU0MDgwY2VkNTRmYWI3ZGVmIgog
CiBTUkNfVVJJOmFwcGVuZDpjbGFzcy10YXJnZXQgPSAiIGZpbGU6Ly9jcm9zcy5wYXRjaCIKIFNS
Q19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZXNkayA9ICIgZmlsZTovL2Nyb3NzLnBhdGNoIgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDAxLXNvZnRtbXUtQXNz
ZXJ0LWRhdGEtaW4tYm91bmRzLWluLWlvdGxiX3RvX3NlY3Rpb24ucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDEtc29mdG1tdS1Bc3NlcnQtZGF0YS1pbi1ib3VuZHMt
aW4taW90bGJfdG9fc2VjdGlvbi5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
NzM4MGUxNmFiMy4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9x
ZW11LzAwMDEtc29mdG1tdS1Bc3NlcnQtZGF0YS1pbi1ib3VuZHMtaW4taW90bGJfdG9fc2VjdGlv
bi5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDQyICswLDAgQEAKLUZyb20gODZlNGY5M2Q4Mjdk
M2MxZWZkMDBjZDhhOTA2ZTM4YTJjMGYyYjViYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZy
b206IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPgotRGF0
ZTogRnJpLCAyNSBBdWcgMjAyMyAxNDowNjo1OCAtMDcwMAotU3ViamVjdDogW1BBVENIXSBzb2Z0
bW11OiBBc3NlcnQgZGF0YSBpbiBib3VuZHMgaW4gaW90bGJfdG9fc2VjdGlvbgotTUlNRS1WZXJz
aW9uOiAxLjAKLUNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAotQ29udGVu
dC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAotCi1BY2tlZC1ieTogQWxleCBCZW5uw6llIDxhbGV4
LmJlbm5lZUBsaW5hcm8ub3JnPgotU3VnZ2VzdGVkLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVu
bmVlQGxpbmFyby5vcmc+Ci1TaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFy
ZC5oZW5kZXJzb25AbGluYXJvLm9yZz4KLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0
cHM6Ly9naXRsYWIuY29tL3FlbXUtcHJvamVjdC9xZW11Ly0vY29tbWl0Lzg2ZTRmOTNkODI3ZDNj
MWVmZDAwY2Q4YTkwNmUzOGEyYzBmMmI1YmNdCi0tLS0KLSBzb2Z0bW11L3BoeXNtZW0uYyB8IDEw
ICsrKysrKysrLS0KLSAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQotCi1kaWZmIC0tZ2l0IGEvc29mdG1tdS9waHlzbWVtLmMgYi9zb2Z0bW11L3BoeXNtZW0u
YwotaW5kZXggM2RmNzM1NDJlMS4uNzU5N2RjMWMzOSAxMDA2NDQKLS0tLSBhL3NvZnRtbXUvcGh5
c21lbS5jCi0rKysgYi9zb2Z0bW11L3BoeXNtZW0uYwotQEAgLTI0MTMsOSArMjQxMywxNSBAQCBN
ZW1vcnlSZWdpb25TZWN0aW9uICppb3RsYl90b19zZWN0aW9uKENQVVN0YXRlICpjcHUsCi0gICAg
IGludCBhc2lkeCA9IGNwdV9hc2lkeF9mcm9tX2F0dHJzKGNwdSwgYXR0cnMpOwotICAgICBDUFVB
ZGRyZXNzU3BhY2UgKmNwdWFzID0gJmNwdS0+Y3B1X2FzZXNbYXNpZHhdOwotICAgICBBZGRyZXNz
U3BhY2VEaXNwYXRjaCAqZCA9IHFhdG9taWNfcmN1X3JlYWQoJmNwdWFzLT5tZW1vcnlfZGlzcGF0
Y2gpOwotLSAgICBNZW1vcnlSZWdpb25TZWN0aW9uICpzZWN0aW9ucyA9IGQtPm1hcC5zZWN0aW9u
czsKLSsgICAgaW50IHNlY3Rpb25faW5kZXggPSBpbmRleCAmIH5UQVJHRVRfUEFHRV9NQVNLOwot
KyAgICBNZW1vcnlSZWdpb25TZWN0aW9uICpyZXQ7Ci0rCi0rICAgIGFzc2VydChzZWN0aW9uX2lu
ZGV4IDwgZC0+bWFwLnNlY3Rpb25zX25iKTsKLSsgICAgcmV0ID0gZC0+bWFwLnNlY3Rpb25zICsg
c2VjdGlvbl9pbmRleDsKLSsgICAgYXNzZXJ0KHJldC0+bXIpOwotKyAgICBhc3NlcnQocmV0LT5t
ci0+b3BzKTsKLSAKLS0gICAgcmV0dXJuICZzZWN0aW9uc1tpbmRleCAmIH5UQVJHRVRfUEFHRV9N
QVNLXTsKLSsgICAgcmV0dXJuIHJldDsKLSB9Ci0gCi0gc3RhdGljIHZvaWQgaW9fbWVtX2luaXQo
dm9pZCkKLS0tIAotMi4zNC4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9x
ZW11L3FlbXVfOC4xLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11XzguMS4x
LmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcWVtdS9xZW11XzguMS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVt
dS9xZW11XzguMS4xLmJiCi0tIAoyLjM5LjIKCg==

--===============0584463503205961646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1843 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (908 cached, 3 parsed). 1843 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-6f10fe44543ef8dbe553f7b4bcb7feca20715d15"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6f10fe44543ef8dbe553f7b4bcb7feca20715d15"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 395 Local 217 Mirrors 0 Missed 178 Current 649 (54% match, 82% complete)
Removing 41 stale sstate objects for arch qemux86...done.
Removing 3 stale sstate objects for arch x86_64...done.
Removing 82 stale sstate objects for arch core2-32...done.
Removing 2 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 737 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 738 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 745 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 750 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 751 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_create_spdx_setscene)
NOTE: Running setscene task 756 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 761 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 766 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 771 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 776 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 781 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 788 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 798 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 800 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 812 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 816 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 817 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 819 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_create_spdx_setscene)
NOTE: Running setscene task 868 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 871 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 872 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 874 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 877 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 878 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 881 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 883 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 884 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 888 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 891 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 894 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 895 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 897 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 898 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 900 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 902 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 903 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 913 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 917 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 919 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 930 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 933 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 937 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 938 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 939 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_create_spdx_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dtc-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.69-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_23.1.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-30-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ell-0.58-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bluez5-5.69-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dtc-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-1_254.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_23.1.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ell-0.58-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_254.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 990 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 995 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1036 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1040 of 1044 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1056 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.1.0.bb:do_recipe_qa)
NOTE: Running task 1114 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_fetch)
NOTE: Running task 1120 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_fetch)
NOTE: Running task 1127 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_fetch)
NOTE: recipe libxml2-native-2.11.5-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1165 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_write_config)
NOTE: Running task 1188 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_write_config)
NOTE: Running task 1197 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_write_config)
NOTE: Running task 1214 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_fetch)
NOTE: Running task 1215 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: Running task 1217 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_fetch)
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe qemu-native-8.1.0-r0: task do_recipe_qa: Started
NOTE: Running task 1334 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_fetch)
NOTE: Running task 1345 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_fetch)
NOTE: Running task 1349 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_fetch)
NOTE: Running task 1362 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_fetch)
NOTE: Running task 1364 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_fetch)
NOTE: Running task 1366 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_fetch)
NOTE: Running task 1368 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_fetch)
NOTE: recipe xorgproto-2023.2-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Started
NOTE: Running task 1387 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_unpack)
NOTE: recipe libxml2-native-2.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_fetch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_write_config: Started
NOTE: recipe xorgproto-2023.2-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 1433 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_unpack)
NOTE: Running task 1441 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: recipe libxcb-1.16-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_fetch: Succeeded
NOTE: recipe qemu-native-8.1.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: Running task 1486 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_unpack)
NOTE: recipe libxcb-1.16-r0: task do_fetch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.1.0.bb:do_recipe_qa unihash changed to c28db4ef1de8b24488e738f7e224800fe8fd2ad10b23ca444527e9c2759da407
NOTE: recipe xorgproto-2023.2-r0: task do_write_config: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_fetch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_write_config: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_unpack: Started
NOTE: recipe systemd-1_254.4-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_unpack: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1494 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.1.0.bb:do_fetch)
NOTE: Running task 1495 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_unpack)
NOTE: Running task 1496 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: Running task 1497 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_unpack)
NOTE: Running task 1498 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_unpack)
NOTE: Running task 1499 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_patch)
NOTE: Running task 1500 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_unpack)
NOTE: Running task 1501 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_unpack)
NOTE: Running task 1502 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_unpack)
NOTE: Running task 1503 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_unpack)
NOTE: Running task 1504 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_unpack)
NOTE: Running task 1517 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_write_config)
NOTE: Running task 1524 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_write_config)
NOTE: Running task 1530 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_write_config)
NOTE: Running task 1566 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_warn_musl)
NOTE: Running task 1567 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_write_config)
NOTE: Running task 1596 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: Running task 1600 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_fetch)
NOTE: Running task 1609 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.13.bb:do_fetch)
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe systemd-1_254.4-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1627 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_patch)
NOTE: Setscene tasks completed
NOTE: Running task 1628 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_unpack)
NOTE: recipe xorgproto-2023.2-r0: task do_unpack: Succeeded
NOTE: Running task 1631 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_fetch)
NOTE: Running task 1634 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_fetch)
NOTE: Running task 1645 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: recipe qemu-native-8.1.0-r0: task do_fetch: Started
NOTE: Setscene tasks completed
NOTE: Running task 1654 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_patch)
NOTE: Running task 1669 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_write_config)
NOTE: Running task 1671 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_fetch)
NOTE: Running task 1673 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_fetch)
WARNING: qemu-native-8.1.0-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/qemu-8.1.0.tar.xz
Cleaning and trying again.
WARNING: qemu-native-8.1.0-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/qemu-8.1.0.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/qemu-8.1.0.tar.xz_bad-checksum_710c101198e334d4762eef65f649bc43fa8a5dd75303554b8acfec3eb25f0e55
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_unpack: Started
NOTE: recipe libxcb-1.16-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Started
NOTE: Running task 1723 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.39-r0: task do_write_config: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Started
NOTE: Running task 1747 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.39-r0: task do_unpack: Started
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Started
NOTE: Running task 1772 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_fetch)
NOTE: Running task 1773 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_fetch)
NOTE: Running task 1774 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_fetch)
NOTE: Running task 1775 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_fetch)
NOTE: Running task 1794 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.8.bb:do_fetch)
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_fetch: Started
NOTE: recipe vala-0.56.13-r0: task do_fetch: Started
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: Running task 1845 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: Running task 1848 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_fetch)
NOTE: recipe vala-0.56.13-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_fetch: Succeeded
NOTE: Running task 1872 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_unpack)
NOTE: Running task 1873 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.13.bb:do_unpack)
NOTE: Running task 1875 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_write_config)
NOTE: recipe wayland-protocols-1.32-r0: task do_write_config: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_write_config: Succeeded
NOTE: recipe systemd-1_254.4-r0: task do_warn_musl: Started
NOTE: recipe xorgproto-2023.2-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: recipe systemd-1_254.4-r0: task do_write_config: Started
NOTE: recipe systemd-1_254.4-r0: task do_warn_musl: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_fetch: Started
NOTE: recipe systemd-1_254.4-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.69-r0: task do_fetch: Started
NOTE: Running task 1960 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.8.bb:do_write_config)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 1967 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: Running task 1975 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_patch)
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 2003 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_fetch)
NOTE: Running task 2006 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_fetch)
NOTE: Running task 2012 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: Running task 2013 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_unpack)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Started
NOTE: Running task 2014 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_unpack)
NOTE: Running task 2015 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_unpack)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Succeeded
NOTE: recipe systemd-1_254.4-r0: task do_write_config: Succeeded
NOTE: recipe bluez5-5.69-r0: task do_fetch: Succeeded
NOTE: Running task 2029 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_unpack)
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_write_config: Started
NOTE: recipe libdrm-2.4.116-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 2035 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_patch)
NOTE: Running task 2037 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_patch)
NOTE: Running task 2038 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_unpack)
NOTE: Running task 2039 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_patch)
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 2052 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu_8.1.1.bb:do_recipe_qa)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Started
NOTE: Running task 2058 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_unpack)
NOTE: recipe libdrm-2.4.116-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe ell-0.58-r0: task do_fetch: Started
NOTE: Running task 2063 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_unpack)
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.116-r0: task do_write_config: Started
NOTE: recipe vala-0.56.13-r0: task do_unpack: Started
NOTE: recipe libxcb-1.16-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 2107 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_patch)
NOTE: recipe xorgproto-2023.2-r0: task do_patch: Succeeded
NOTE: recipe ell-0.58-r0: task do_fetch: Succeeded
NOTE: Running task 2108 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_patch)
NOTE: Running task 2115 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_unpack)
NOTE: Running task 2120 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_write_config)
NOTE: Running task 2123 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_unpack)
NOTE: Running task 2130 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_write_config)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: Running task 2136 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_unpack)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_23.1.8-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: recipe dtc-1.7.0-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: Running task 2186 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Started
NOTE: recipe mesa-2_23.1.8-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_23.1.8-r0: task do_write_config: Started
NOTE: recipe libdrm-2.4.116-r0: task do_write_config: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_unpack: Started
NOTE: Running task 2226 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.8.bb:do_unpack)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Started
NOTE: recipe bluez5-5.69-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_patch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Started
NOTE: Running task 2289 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_unpack)
NOTE: recipe qemu-8.1.1-r0: task do_recipe_qa: Started
NOTE: recipe libdrm-2.4.116-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Started
NOTE: recipe mesa-2_23.1.8-r0: task do_write_config: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_patch: Started
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_patch: Succeeded
NOTE: Running task 2359 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_write_config: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.58-r0: task do_unpack: Started
NOTE: Running task 2361 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_patch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_patch: Succeeded
NOTE: Running task 2362 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 2366 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Started
NOTE: recipe dtc-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 2367 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_patch)
NOTE: recipe xkeyboard-config-2.39-r0: task do_patch: Succeeded
NOTE: Running task 2368 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_unpack)
NOTE: recipe mesa-2_23.1.8-r0: task do_unpack: Started
NOTE: recipe qemu-8.1.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2370 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu_8.1.1.bb:do_fetch)
NOTE: recipe dtc-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_patch: Succeeded
NOTE: Running task 2372 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_patch)
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Succeeded
NOTE: Running task 2373 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_patch)
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_patch: Started
NOTE: Running task 2374 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_patch)
NOTE: Running task 2375 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 2376 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_patch)
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: Running task 2377 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_patch)
NOTE: recipe libdrm-2.4.116-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 2378 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_patch)
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Started
NOTE: recipe dtc-1.7.0-r0: task do_unpack: Started
NOTE: Running task 2379 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_patch)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.58-r0: task do_unpack: Succeeded
NOTE: recipe qemu-8.1.1-r0: task do_fetch: Started
NOTE: Running task 2380 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_patch)
NOTE: Running task 2381 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_patch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: Running task 2383 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_patch)
NOTE: recipe qemu-8.1.1-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Started
NOTE: Running task 2384 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu_8.1.1.bb:do_unpack)
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_patch: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_patch: Started
NOTE: recipe bluez5-5.69-r0: task do_unpack: Succeeded
NOTE: Running task 2390 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_patch: Started
NOTE: recipe ell-0.58-r0: task do_patch: Started
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: Running task 2393 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_patch: Succeeded
NOTE: recipe qemu-8.1.1-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_patch: Started
NOTE: recipe ell-0.58-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_patch: Succeeded
NOTE: Running task 2398 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.13.bb:do_patch)
NOTE: recipe bluez5-5.69-r0: task do_patch: Started
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_unpack: Succeeded
NOTE: Running task 2402 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_patch)
NOTE: recipe vala-0.56.13-r0: task do_patch: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 2404 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_patch)
NOTE: recipe bluez5-5.69-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_patch: Started
NOTE: recipe dtc-1.7.0-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_patch: Succeeded
NOTE: Running task 2406 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_generate_toolchain_file)
NOTE: recipe dtc-1.7.0-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe systemd-1_254.4-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2410 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_patch)
NOTE: recipe systemd-1_254.4-r0: task do_patch: Started
NOTE: recipe systemd-1_254.4-r0: task do_patch: Succeeded
NOTE: recipe mesa-2_23.1.8-r0: task do_unpack: Succeeded
NOTE: Running task 2412 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.8.bb:do_patch)
NOTE: recipe mesa-2_23.1.8-r0: task do_patch: Started
NOTE: recipe mesa-2_23.1.8-r0: task do_patch: Succeeded
WARNING: qemu-native-8.1.0-r0 do_fetch: Checksum failure encountered with download of https://download.qemu.org/qemu-8.1.0.tar.xz - will attempt other sources if available
NOTE: recipe qemu-8.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 2414 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu_8.1.1.bb:do_patch)
NOTE: recipe qemu-8.1.1-r0: task do_patch: Started
WARNING: qemu-native-8.1.0-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/qemu-8.1.0.tar.xz
Cleaning and trying again.
WARNING: qemu-native-8.1.0-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/qemu-8.1.0.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/qemu-8.1.0.tar.xz_bad-checksum_710c101198e334d4762eef65f649bc43fa8a5dd75303554b8acfec3eb25f0e55
NOTE: recipe qemu-native-8.1.0-r0: task do_fetch: Failed
NOTE: recipe qemu-8.1.1-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 2414 tasks of which 2298 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.1.0.bb:do_fetch
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu_8.1.1.bb:do_patch
Summary: There were 5 WARNING messages.
Summary: There were 3 ERROR messages, returning a non-zero exit code.
ERROR: qemu-native-8.1.0-r0 do_fetch: Checksum failure fetching https://download.qemu.org/qemu-8.1.0.tar.xz
ERROR: qemu-native-8.1.0-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/qemu-8.1.0.tar.xz\' has sha256 checksum \'710c101198e334d4762eef65f649bc43fa8a5dd75303554b8acfec3eb25f0e55\' when \'37ce2ef5e500fb752f681117c68b45118303ea49a7e26bd54080ced54fab7def\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "710c101198e334d4762eef65f649bc43fa8a5dd75303554b8acfec3eb25f0e55"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://download.qemu.org/qemu-8.1.0.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/qemu-native/8.1.0/temp/log.do_fetch.1076057
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.1.0.bb:do_fetch) failed with exit code '1'
ERROR: qemu-8.1.1-r0 do_patch: Applying patch 'cross.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/qemu/8.1.1/qemu-8.1.1'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/qemu/8.1.1/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch cross.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/qemu/8.1.1/temp/log.do_patch.1079191
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu_8.1.1.bb:do_patch) failed with exit code '1'

--===============0584463503205961646==--

