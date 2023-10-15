Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0281AC04AAE
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:23 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.102671.1697399114527812666
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Pmh5BUyl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=RXsVkUuV;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.23, mailfrom: 0101018b34df0ad8-18a09ed7-2267-4ebe-a4e4-8a27c1928e61-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oSFs/mCUrwXhauRlExz4tkGF+QTfEZLiuvT0uVEju8g=;
	b=Pmh5BUyljYeIhVdjiNZq1JZoaGDXV7xn68xFPKnwPrqGOxO2HW2i4C5HNJ2bcLqm
	jG3iUKY/10C8KxhdbiOkShXYC9HVGxtxqwyQZGhZ7im9OixvEzfTY4OzwVZq6sgwmwZ
	FX4eSroSBmShrlqWeeiFLWx7/2psGtPplAsKruUo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oSFs/mCUrwXhauRlExz4tkGF+QTfEZLiuvT0uVEju8g=;
	b=RXsVkUuVdsfaR3KNBBuBdzRv/DBDFat3P7Gs7z5bef6xrvAKbBq+T0vBxpkpWtL0
	Uew9YmPNOplB1TG1EFECmnfMZ5wY9GcC/v6KN6XHXCwHiCVRq0Cdlh6SuFzu6qS0yX1
	FntXmW5fJWJpSm9jzAw3GLu8itjHDnIFkHvfULHo=
Content-Type: multipart/mixed; boundary="===============7173630859993663835=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu: upgrading to 8.1.1 FAILED
Message-ID: <0101018b34df0ad8-18a09ed7-2267-4ebe-a4e4-8a27c1928e61-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189198

--===============7173630859993663835==
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
IGQwNzZlZTI4ZDRkN2M1ZWQ2M2EwNmY1M2JjMjI3NGZiODc3ZjQ0ZTMgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCkZyb206IFVwZ3JhZGUgSGVscGVyIDxhdWhAeW9jdG9wcm9qZWN0Lm9yZz4KRGF0
ZTogU3VuLCAxNSBPY3QgMjAyMyAxMjo1MzoxNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHFlbXU6
IHVwZ3JhZGUgOC4xLjAgLT4gOC4xLjEKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUv
cWVtdS5pbmMgICAgICAgICAgIHwgIDYgKy0tCiAuLi50LWRhdGEtaW4tYm91bmRzLWluLWlvdGxi
X3RvX3NlY3Rpb24ucGF0Y2ggfCA0MiAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4vcWVtdS97cWVt
dV84LjEuMC5iYiA9PiBxZW11XzguMS4xLmJifSAgICAgfCAgMAogMyBmaWxlcyBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDQ1IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwMS1zb2Z0bW11LUFzc2VydC1kYXRhLWluLWJv
dW5kcy1pbi1pb3RsYl90b19zZWN0aW9uLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3FlbXUve3FlbXVfOC4xLjAuYmIgPT4gcWVtdV84LjEuMS5iYn0gKDEwMCUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcWVtdS9xZW11LmluYwppbmRleCBiMzMxZjg3YzBkLi4yMWNkYzI1MzBhIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LmluYworKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LmluYwpAQCAtMjksMTggKzI5LDE4IEBAIFNSQ19VUkkg
PSAiaHR0cHM6Ly9kb3dubG9hZC5xZW11Lm9yZy8ke0JQTn0tJHtQVn0udGFyLnh6IFwKICAgICAg
ICAgICAgZmlsZTovLzAwMDktRGVmaW5lLU1BUF9TWU5DLWFuZC1NQVBfU0hBUkVEX1ZBTElEQVRF
LW9uLW5lZWRlZC1saS5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDEwLWh3LXB2cmRtYS1Q
cm90ZWN0LWFnYWluc3QtYnVnZ3ktb3ItbWFsaWNpb3VzLWd1ZXN0LWQucGF0Y2ggXAogICAgICAg
ICAgICBmaWxlOi8vMDAwMi1saW51eC11c2VyLVJlcGxhY2UtdXNlLW9mLWxmczY0LXJlbGF0ZWQt
ZnVuY3Rpb25zLWFuLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtc29mdG1tdS1Bc3Nl
cnQtZGF0YS1pbi1ib3VuZHMtaW4taW90bGJfdG9fc2VjdGlvbi5wYXRjaCBcCiAgICAgICAgICAg
IGZpbGU6Ly8wMDAxLXNvZnRtbXUtVXNlLWFzeW5jX3J1bl9vbl9jcHUtaW4tdGNnX2NvbW1pdC5w
YXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9maXhlZG1lc29uLnBhdGNoIFwKICAgICAgICAgICAg
ZmlsZTovL2ZpeG1pcHMucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vcWVtdS1ndWVzdC1hZ2Vu
dC5pbml0IFwKICAgICAgICAgICAgZmlsZTovL3FlbXUtZ3Vlc3QtYWdlbnQudWRldiBcCi0JICAg
ZmlsZTovL0NWRS0yMDIzLTQyNDY3LnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovL0NWRS0yMDIz
LTQyNDY3LnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovL2Nyb3NzLnBhdGNoIFwKICAgICAgICAg
ICAgIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicWVtdS0oP1A8cHZlcj5cZCsoXC5cZCspKylc
LnRhciIKIAogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzEwYzEwMTE5OGUzMzRkNDc2MmVlZjY1
ZjY0OWJjNDNmYThhNWRkNzUzMDM1NTRiOGFjZmVjM2ViMjVmMGU1NSIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICIzN2NlMmVmNWU1MDBmYjc1MmY2ODExMTdjNjhiNDUxMTgzMDNlYTQ5YTdlMjZiZDU0
MDgwY2VkNTRmYWI3ZGVmIgogCiBTUkNfVVJJOmFwcGVuZDpjbGFzcy10YXJnZXQgPSAiIGZpbGU6
Ly9jcm9zcy5wYXRjaCIKIFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZXNkayA9ICIgZmlsZTov
L2Nyb3NzLnBhdGNoIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVt
dS8wMDAxLXNvZnRtbXUtQXNzZXJ0LWRhdGEtaW4tYm91bmRzLWluLWlvdGxiX3RvX3NlY3Rpb24u
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDEtc29mdG1tdS1Bc3Nl
cnQtZGF0YS1pbi1ib3VuZHMtaW4taW90bGJfdG9fc2VjdGlvbi5wYXRjaApkZWxldGVkIGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggNzM4MGUxNmFiMy4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDEtc29mdG1tdS1Bc3NlcnQtZGF0YS1pbi1ib3VuZHMt
aW4taW90bGJfdG9fc2VjdGlvbi5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDQyICswLDAgQEAK
LUZyb20gODZlNGY5M2Q4MjdkM2MxZWZkMDBjZDhhOTA2ZTM4YTJjMGYyYjViYyBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKLUZyb206IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNv
bkBsaW5hcm8ub3JnPgotRGF0ZTogRnJpLCAyNSBBdWcgMjAyMyAxNDowNjo1OCAtMDcwMAotU3Vi
amVjdDogW1BBVENIXSBzb2Z0bW11OiBBc3NlcnQgZGF0YSBpbiBib3VuZHMgaW4gaW90bGJfdG9f
c2VjdGlvbgotTUlNRS1WZXJzaW9uOiAxLjAKLUNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hh
cnNldD1VVEYtOAotQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAotCi1BY2tlZC1ieTog
QWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgotU3VnZ2VzdGVkLWJ5OiBBbGV4
IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+Ci1TaWduZWQtb2ZmLWJ5OiBSaWNoYXJk
IEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4KLQotVXBzdHJlYW0tU3Rh
dHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRsYWIuY29tL3FlbXUtcHJvamVjdC9xZW11Ly0vY29t
bWl0Lzg2ZTRmOTNkODI3ZDNjMWVmZDAwY2Q4YTkwNmUzOGEyYzBmMmI1YmNdCi0tLS0KLSBzb2Z0
bW11L3BoeXNtZW0uYyB8IDEwICsrKysrKysrLS0KLSAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvc29mdG1tdS9waHlzbWVtLmMg
Yi9zb2Z0bW11L3BoeXNtZW0uYwotaW5kZXggM2RmNzM1NDJlMS4uNzU5N2RjMWMzOSAxMDA2NDQK
LS0tLSBhL3NvZnRtbXUvcGh5c21lbS5jCi0rKysgYi9zb2Z0bW11L3BoeXNtZW0uYwotQEAgLTI0
MTMsOSArMjQxMywxNSBAQCBNZW1vcnlSZWdpb25TZWN0aW9uICppb3RsYl90b19zZWN0aW9uKENQ
VVN0YXRlICpjcHUsCi0gICAgIGludCBhc2lkeCA9IGNwdV9hc2lkeF9mcm9tX2F0dHJzKGNwdSwg
YXR0cnMpOwotICAgICBDUFVBZGRyZXNzU3BhY2UgKmNwdWFzID0gJmNwdS0+Y3B1X2FzZXNbYXNp
ZHhdOwotICAgICBBZGRyZXNzU3BhY2VEaXNwYXRjaCAqZCA9IHFhdG9taWNfcmN1X3JlYWQoJmNw
dWFzLT5tZW1vcnlfZGlzcGF0Y2gpOwotLSAgICBNZW1vcnlSZWdpb25TZWN0aW9uICpzZWN0aW9u
cyA9IGQtPm1hcC5zZWN0aW9uczsKLSsgICAgaW50IHNlY3Rpb25faW5kZXggPSBpbmRleCAmIH5U
QVJHRVRfUEFHRV9NQVNLOwotKyAgICBNZW1vcnlSZWdpb25TZWN0aW9uICpyZXQ7Ci0rCi0rICAg
IGFzc2VydChzZWN0aW9uX2luZGV4IDwgZC0+bWFwLnNlY3Rpb25zX25iKTsKLSsgICAgcmV0ID0g
ZC0+bWFwLnNlY3Rpb25zICsgc2VjdGlvbl9pbmRleDsKLSsgICAgYXNzZXJ0KHJldC0+bXIpOwot
KyAgICBhc3NlcnQocmV0LT5tci0+b3BzKTsKLSAKLS0gICAgcmV0dXJuICZzZWN0aW9uc1tpbmRl
eCAmIH5UQVJHRVRfUEFHRV9NQVNLXTsKLSsgICAgcmV0dXJuIHJldDsKLSB9Ci0gCi0gc3RhdGlj
IHZvaWQgaW9fbWVtX2luaXQodm9pZCkKLS0tIAotMi4zNC4xCi0KZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXVfOC4xLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcWVtdS9xZW11XzguMS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11XzguMS4wLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11XzguMS4xLmJiCi0tIAoyLjM5LjIKCg==

--===============7173630859993663835==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-qemu-upgrade-8.1.0-8.1.1.patch"

RnJvbSBkMDc2ZWUyOGQ0ZDdjNWVkNjNhMDZmNTNiYzIyNzRmYjg3N2Y0NGUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMTI6NTM6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBx
ZW11OiB1cGdyYWRlIDguMS4wIC0+IDguMS4xCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9x
ZW11L3FlbXUuaW5jICAgICAgICAgICB8ICA2ICstLQogLi4udC1kYXRhLWluLWJvdW5kcy1pbi1p
b3RsYl90b19zZWN0aW9uLnBhdGNoIHwgNDIgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4uL3FlbXUv
e3FlbXVfOC4xLjAuYmIgPT4gcWVtdV84LjEuMS5iYn0gICAgIHwgIDAKIDMgZmlsZXMgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCA0NSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDEtc29mdG1tdS1Bc3NlcnQtZGF0YS1p
bi1ib3VuZHMtaW4taW90bGJfdG9fc2VjdGlvbi5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9xZW11L3txZW11XzguMS4wLmJiID0+IHFlbXVfOC4xLjEuYmJ9ICgxMDAlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5jIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMKaW5kZXggYjMzMWY4N2MwZC4uMjFjZGMyNTMwYSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMKQEAgLTI5LDE4ICsyOSwxOCBAQCBTUkNf
VVJJID0gImh0dHBzOi8vZG93bmxvYWQucWVtdS5vcmcvJHtCUE59LSR7UFZ9LnRhci54eiBcCiAg
ICAgICAgICAgIGZpbGU6Ly8wMDA5LURlZmluZS1NQVBfU1lOQy1hbmQtTUFQX1NIQVJFRF9WQUxJ
REFURS1vbi1uZWVkZWQtbGkucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAxMC1ody1wdnJk
bWEtUHJvdGVjdC1hZ2FpbnN0LWJ1Z2d5LW9yLW1hbGljaW91cy1ndWVzdC1kLnBhdGNoIFwKICAg
ICAgICAgICAgZmlsZTovLzAwMDItbGludXgtdXNlci1SZXBsYWNlLXVzZS1vZi1sZnM2NC1yZWxh
dGVkLWZ1bmN0aW9ucy1hbi5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLXNvZnRtbXUt
QXNzZXJ0LWRhdGEtaW4tYm91bmRzLWluLWlvdGxiX3RvX3NlY3Rpb24ucGF0Y2ggXAogICAgICAg
ICAgICBmaWxlOi8vMDAwMS1zb2Z0bW11LVVzZS1hc3luY19ydW5fb25fY3B1LWluLXRjZ19jb21t
aXQucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vZml4ZWRtZXNvbi5wYXRjaCBcCiAgICAgICAg
ICAgIGZpbGU6Ly9maXhtaXBzLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL3FlbXUtZ3Vlc3Qt
YWdlbnQuaW5pdCBcCiAgICAgICAgICAgIGZpbGU6Ly9xZW11LWd1ZXN0LWFnZW50LnVkZXYgXAot
CSAgIGZpbGU6Ly9DVkUtMjAyMy00MjQ2Ny5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly9DVkUt
MjAyMy00MjQ2Ny5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly9jcm9zcy5wYXRjaCBcCiAgICAg
ICAgICAgICIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInFlbXUtKD9QPHB2ZXI+XGQrKFwuXGQr
KSspXC50YXIiCiAKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjcxMGMxMDExOThlMzM0ZDQ3NjJl
ZWY2NWY2NDliYzQzZmE4YTVkZDc1MzAzNTU0YjhhY2ZlYzNlYjI1ZjBlNTUiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiMzdjZTJlZjVlNTAwZmI3NTJmNjgxMTE3YzY4YjQ1MTE4MzAzZWE0OWE3ZTI2
YmQ1NDA4MGNlZDU0ZmFiN2RlZiIKIAogU1JDX1VSSTphcHBlbmQ6Y2xhc3MtdGFyZ2V0ID0gIiBm
aWxlOi8vY3Jvc3MucGF0Y2giCiBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmVzZGsgPSAiIGZp
bGU6Ly9jcm9zcy5wYXRjaCIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11
L3FlbXUvMDAwMS1zb2Z0bW11LUFzc2VydC1kYXRhLWluLWJvdW5kcy1pbi1pb3RsYl90b19zZWN0
aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDAxLXNvZnRtbXUt
QXNzZXJ0LWRhdGEtaW4tYm91bmRzLWluLWlvdGxiX3RvX3NlY3Rpb24ucGF0Y2gKZGVsZXRlZCBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDczODBlMTZhYjMuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDAxLXNvZnRtbXUtQXNzZXJ0LWRhdGEtaW4tYm91
bmRzLWluLWlvdGxiX3RvX3NlY3Rpb24ucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw0MiArMCww
IEBACi1Gcm9tIDg2ZTRmOTNkODI3ZDNjMWVmZDAwY2Q4YTkwNmUzOGEyYzBmMmI1YmMgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5k
ZXJzb25AbGluYXJvLm9yZz4KLURhdGU6IEZyaSwgMjUgQXVnIDIwMjMgMTQ6MDY6NTggLTA3MDAK
LVN1YmplY3Q6IFtQQVRDSF0gc29mdG1tdTogQXNzZXJ0IGRhdGEgaW4gYm91bmRzIGluIGlvdGxi
X3RvX3NlY3Rpb24KLU1JTUUtVmVyc2lvbjogMS4wCi1Db250ZW50LVR5cGU6IHRleHQvcGxhaW47
IGNoYXJzZXQ9VVRGLTgKLUNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKLQotQWNrZWQt
Ynk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KLVN1Z2dlc3RlZC1ieTog
QWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgotU2lnbmVkLW9mZi1ieTogUmlj
aGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+Ci0KLVVwc3RyZWFt
LVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3QvcWVtdS8t
L2NvbW1pdC84NmU0ZjkzZDgyN2QzYzFlZmQwMGNkOGE5MDZlMzhhMmMwZjJiNWJjXQotLS0tCi0g
c29mdG1tdS9waHlzbWVtLmMgfCAxMCArKysrKysrKy0tCi0gMSBmaWxlIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL3NvZnRtbXUvcGh5c21l
bS5jIGIvc29mdG1tdS9waHlzbWVtLmMKLWluZGV4IDNkZjczNTQyZTEuLjc1OTdkYzFjMzkgMTAw
NjQ0Ci0tLS0gYS9zb2Z0bW11L3BoeXNtZW0uYwotKysrIGIvc29mdG1tdS9waHlzbWVtLmMKLUBA
IC0yNDEzLDkgKzI0MTMsMTUgQEAgTWVtb3J5UmVnaW9uU2VjdGlvbiAqaW90bGJfdG9fc2VjdGlv
bihDUFVTdGF0ZSAqY3B1LAotICAgICBpbnQgYXNpZHggPSBjcHVfYXNpZHhfZnJvbV9hdHRycyhj
cHUsIGF0dHJzKTsKLSAgICAgQ1BVQWRkcmVzc1NwYWNlICpjcHVhcyA9ICZjcHUtPmNwdV9hc2Vz
W2FzaWR4XTsKLSAgICAgQWRkcmVzc1NwYWNlRGlzcGF0Y2ggKmQgPSBxYXRvbWljX3JjdV9yZWFk
KCZjcHVhcy0+bWVtb3J5X2Rpc3BhdGNoKTsKLS0gICAgTWVtb3J5UmVnaW9uU2VjdGlvbiAqc2Vj
dGlvbnMgPSBkLT5tYXAuc2VjdGlvbnM7Ci0rICAgIGludCBzZWN0aW9uX2luZGV4ID0gaW5kZXgg
JiB+VEFSR0VUX1BBR0VfTUFTSzsKLSsgICAgTWVtb3J5UmVnaW9uU2VjdGlvbiAqcmV0OwotKwot
KyAgICBhc3NlcnQoc2VjdGlvbl9pbmRleCA8IGQtPm1hcC5zZWN0aW9uc19uYik7Ci0rICAgIHJl
dCA9IGQtPm1hcC5zZWN0aW9ucyArIHNlY3Rpb25faW5kZXg7Ci0rICAgIGFzc2VydChyZXQtPm1y
KTsKLSsgICAgYXNzZXJ0KHJldC0+bXItPm9wcyk7Ci0gCi0tICAgIHJldHVybiAmc2VjdGlvbnNb
aW5kZXggJiB+VEFSR0VUX1BBR0VfTUFTS107Ci0rICAgIHJldHVybiByZXQ7Ci0gfQotIAotIHN0
YXRpYyB2b2lkIGlvX21lbV9pbml0KHZvaWQpCi0tLSAKLTIuMzQuMQotCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11XzguMS4wLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3FlbXUvcWVtdV84LjEuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdV84LjEuMC5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdV84LjEuMS5iYgotLSAKMi4zOS4yCgo=

--===============7173630859993663835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1844 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (909 cached, 3 parsed). 1844 targets, 38 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.2+snapshot-68c523efd4b8071be37e1d54a67ffab155775661"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:68c523efd4b8071be37e1d54a67ffab155775661"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 380 Local 202 Mirrors 0 Missed 178 Current 664 (53% match, 82% complete)
Removing 41 stale sstate objects for arch qemux86...done.
Removing 82 stale sstate objects for arch core2-32...done.
Removing 3 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 756 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 757 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 764 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 769 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 770 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_create_spdx_setscene)
NOTE: Running setscene task 775 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 780 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 785 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 790 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 795 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 800 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 807 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 817 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 819 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 831 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 835 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 836 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 838 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_create_spdx_setscene)
NOTE: Running setscene task 887 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 890 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 891 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 893 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 896 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 897 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 900 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 902 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 903 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 907 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 910 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 913 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 914 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 916 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 917 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 919 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 921 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 938 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 942 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 944 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 945 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 956 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 959 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 963 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 964 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 965 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_create_spdx_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe dtc-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ell-0.58-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-30-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bluez5-5.69-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe ell-0.58-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1001 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-1_254.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bluez5-5.69-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe systemd-1_254.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1029 of 1044 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1042 of 1044 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx_setscene)
NOTE: Running task 1071 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.1.0.bb:do_recipe_qa)
NOTE: Running task 1135 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_fetch)
NOTE: Running task 1141 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_fetch)
NOTE: Running task 1148 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_fetch)
NOTE: Running task 1188 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_write_config)
NOTE: Running task 1211 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_write_config)
NOTE: Running task 1222 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_write_config)
NOTE: Running task 1238 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_fetch)
NOTE: Running task 1240 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: Running task 1242 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_fetch)
NOTE: recipe libxml2-native-2.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe qemu-native-8.1.0-r0: task do_recipe_qa: Started
NOTE: Running task 1334 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_fetch)
NOTE: Running task 1345 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_fetch)
NOTE: Running task 1349 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_fetch)
NOTE: Running task 1362 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_fetch)
NOTE: Running task 1364 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_fetch)
NOTE: Running task 1366 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_fetch)
NOTE: Running task 1368 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_fetch)
NOTE: Running task 1387 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_unpack)
NOTE: recipe xorgproto-2023.2-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_fetch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_write_config: Started
NOTE: Running task 1445 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_unpack)
NOTE: recipe libxml2-native-2.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_fetch: Started
NOTE: Running task 1469 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_write_config)
NOTE: Running task 1471 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_write_config)
NOTE: Running task 1473 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_write_config)
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_write_config: Started
NOTE: recipe qemu-native-8.1.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 1498 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_unpack)
NOTE: recipe libxcb-1.16-r0: task do_fetch: Succeeded
NOTE: Running task 1499 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_unpack)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.1.0.bb:do_recipe_qa unihash changed to 4343919ecdc19cdf56f59b9dc7d9e11a7eafbf1d577373d0c5a4d64c57ab11a5
NOTE: recipe libx11-1_1.8.7-r0: task do_fetch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_write_config: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_write_config: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_write_config: Started
NOTE: recipe systemd-1_254.4-r0: task do_fetch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_write_config: Started
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_unpack: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_unpack: Started
NOTE: Setscene tasks completed
NOTE: Running task 1503 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.1.0.bb:do_fetch)
NOTE: Running task 1508 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_unpack)
NOTE: Running task 1509 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: Running task 1510 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_unpack)
NOTE: Running task 1511 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_unpack)
NOTE: Running task 1512 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_patch)
NOTE: recipe xkeyboard-config-2.39-r0: task do_write_config: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Succeeded
NOTE: Running task 1513 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_unpack)
NOTE: Running task 1514 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_unpack)
NOTE: Running task 1520 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_unpack)
NOTE: Running task 1521 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_unpack)
NOTE: Running task 1522 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_unpack)
NOTE: Running task 1566 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_warn_musl)
NOTE: Running task 1567 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_write_config)
NOTE: Running task 1596 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: Running task 1600 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_fetch)
NOTE: Running task 1609 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.13.bb:do_fetch)
NOTE: Running task 1629 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_fetch)
NOTE: Running task 1632 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_fetch)
NOTE: recipe systemd-1_254.4-r0: task do_fetch: Succeeded
NOTE: Running task 1643 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: Setscene tasks completed
NOTE: Running task 1651 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_unpack)
NOTE: recipe qemu-native-8.1.0-r0: task do_fetch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_unpack: Succeeded
NOTE: Running task 1667 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_write_config)
NOTE: Running task 1669 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_fetch)
NOTE: Running task 1671 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_fetch)
NOTE: Setscene tasks completed
NOTE: Running task 1674 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_patch)
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe libxcb-1.16-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_unpack: Started
NOTE: Setscene tasks completed
NOTE: Running task 1680 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_patch)
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_patch: Started
WARNING: qemu-native-8.1.0-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/qemu-8.1.0.tar.xz
Cleaning and trying again.
WARNING: qemu-native-8.1.0-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/qemu-8.1.0.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/qemu-8.1.0.tar.xz_bad-checksum_710c101198e334d4762eef65f649bc43fa8a5dd75303554b8acfec3eb25f0e55
NOTE: recipe xkeyboard-config-2.39-r0: task do_unpack: Started
NOTE: Running task 1723 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_fetch)
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Started
NOTE: Running task 1747 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_fetch)
NOTE: Running task 1772 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_fetch)
NOTE: Running task 1773 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_fetch)
NOTE: Running task 1774 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_fetch)
NOTE: Running task 1775 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_fetch)
NOTE: Running task 1794 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_fetch)
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: recipe vala-0.56.13-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_fetch: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: recipe bluez5-5.69-r0: task do_fetch: Started
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_254.4-r0: task do_write_config: Started
NOTE: recipe vala-0.56.13-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 1844 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: Running task 1849 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_254.4-r0: task do_warn_musl: Started
NOTE: Running task 1856 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.13.bb:do_unpack)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_fetch: Succeeded
NOTE: Running task 1857 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_unpack)
NOTE: recipe systemd-1_254.4-r0: task do_warn_musl: Succeeded
NOTE: recipe bluez5-5.69-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_fetch: Started
NOTE: Running task 1869 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_unpack)
NOTE: Running task 1870 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: Running task 1873 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_unpack)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_write_config: Started
NOTE: Running task 1878 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_write_config)
NOTE: recipe xorgproto-2023.2-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Succeeded
NOTE: Running task 1897 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_unpack)
NOTE: Running task 1898 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_unpack)
NOTE: recipe systemd-1_254.4-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_patch: Started
NOTE: Running task 1927 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: recipe systemd-1_254.4-r0: task do_write_config: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.116-r0: task do_fetch: Started
NOTE: Running task 1956 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Started
NOTE: Running task 1967 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_write_config)
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1987 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_patch)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_write_config: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Started
NOTE: Running task 1997 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_patch)
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: Running task 2006 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_unpack)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: Running task 2014 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_unpack)
NOTE: recipe libxcb-1.16-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: Running task 2015 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_unpack)
NOTE: Running task 2016 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_fetch)
NOTE: Running task 2017 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_fetch)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2035 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_patch)
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.58-r0: task do_fetch: Started
NOTE: recipe vala-0.56.13-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_fetch: Started
NOTE: Running task 2036 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_patch)
NOTE: Running task 2037 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_unpack)
NOTE: Running task 2038 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_unpack)
NOTE: recipe libdrm-2.4.116-r0: task do_write_config: Started
NOTE: recipe bluez5-5.69-r0: task do_unpack: Started
NOTE: recipe ell-0.58-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_unpack: Started
NOTE: Running task 2058 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu_8.1.1.bb:do_recipe_qa)
NOTE: Running task 2067 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_unpack)
NOTE: recipe mesa-2_23.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 2075 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.39-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: Running task 2129 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_patch)
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Started
NOTE: Running task 2130 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_unpack)
NOTE: Running task 2131 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_write_config)
NOTE: Running task 2133 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_write_config)
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_write_config: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Started
NOTE: Running task 2182 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: recipe mesa-2_23.2.1-r0: task do_write_config: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_fetch: Started
NOTE: Running task 2263 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_patch)
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Started
NOTE: Running task 2324 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: recipe libdrm-2.4.116-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_unpack: Succeeded
NOTE: Running task 2356 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_patch)
NOTE: Running task 2357 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_unpack)
NOTE: recipe qemu-8.1.1-r0: task do_recipe_qa: Started
NOTE: Running task 2366 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_patch)
NOTE: recipe mesa-2_23.2.1-r0: task do_write_config: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_unpack: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_23.2.1-r0: task do_unpack: Started
NOTE: recipe ell-0.58-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_patch: Succeeded
NOTE: Running task 2367 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_patch)
NOTE: Running task 2368 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_unpack: Started
NOTE: recipe dtc-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 2370 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_unpack)
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_patch: Started
NOTE: recipe dtc-1.7.0-r0: task do_write_config: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: Running task 2371 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_patch)
NOTE: recipe dbus-1.14.10-r0: task do_patch: Started
NOTE: Running task 2372 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_patch)
NOTE: recipe libxcb-1.16-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_patch: Succeeded
NOTE: Running task 2374 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Succeeded
NOTE: Running task 2376 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_patch)
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Started
NOTE: recipe dtc-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_unpack: Succeeded
NOTE: recipe qemu-8.1.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: Running task 2377 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_patch)
NOTE: recipe dtc-1.7.0-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.116-r0: task do_unpack: Succeeded
NOTE: Running task 2379 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu_8.1.1.bb:do_fetch)
NOTE: Running task 2380 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_patch)
NOTE: recipe ell-0.58-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_unpack: Succeeded
NOTE: Running task 2381 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.58.bb:do_patch)
NOTE: Running task 2382 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Started
NOTE: Running task 2386 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_patch)
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Started
NOTE: recipe dbus-1.14.10-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.69-r0: task do_unpack: Succeeded
NOTE: Running task 2388 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: Running task 2390 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: recipe qemu-8.1.1-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_patch: Started
NOTE: recipe ell-0.58-r0: task do_patch: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe qemu-8.1.1-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_patch: Succeeded
NOTE: Running task 2394 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu_8.1.1.bb:do_unpack)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe ell-0.58-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.69-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_patch: Started
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe vala-0.56.13-r0: task do_unpack: Succeeded
NOTE: Running task 2399 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.13.bb:do_patch)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe qemu-8.1.1-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_unpack: Succeeded
NOTE: Running task 2402 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_patch)
NOTE: recipe vala-0.56.13-r0: task do_patch: Started
NOTE: recipe vala-0.56.13-r0: task do_patch: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 2404 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_patch)
NOTE: recipe bluez5-5.69-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_patch: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_patch: Started
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
NOTE: recipe mesa-2_23.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2412 of 2823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_patch)
NOTE: recipe mesa-2_23.2.1-r0: task do_patch: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_patch: Succeeded
WARNING: qemu-native-8.1.0-r0 do_fetch: Checksum failure encountered with download of https://download.qemu.org/qemu-8.1.0.tar.xz - will attempt other sources if available
WARNING: qemu-native-8.1.0-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/qemu-8.1.0.tar.xz
Cleaning and trying again.
WARNING: qemu-native-8.1.0-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/qemu-8.1.0.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/qemu-8.1.0.tar.xz_bad-checksum_710c101198e334d4762eef65f649bc43fa8a5dd75303554b8acfec3eb25f0e55
NOTE: recipe qemu-native-8.1.0-r0: task do_fetch: Failed
NOTE: recipe qemu-8.1.1-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 2413 tasks of which 2298 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.1.0.bb:do_fetch
Summary: There were 5 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: qemu-native-8.1.0-r0 do_fetch: Checksum failure fetching https://download.qemu.org/qemu-8.1.0.tar.xz
ERROR: qemu-native-8.1.0-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/qemu-8.1.0.tar.xz\' has sha256 checksum \'710c101198e334d4762eef65f649bc43fa8a5dd75303554b8acfec3eb25f0e55\' when \'37ce2ef5e500fb752f681117c68b45118303ea49a7e26bd54080ced54fab7def\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "710c101198e334d4762eef65f649bc43fa8a5dd75303554b8acfec3eb25f0e55"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://download.qemu.org/qemu-8.1.0.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/qemu-native/8.1.0/temp/log.do_fetch.2961751
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.1.0.bb:do_fetch) failed with exit code '1'

--===============7173630859993663835==--

