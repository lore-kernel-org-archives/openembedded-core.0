Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E25E0C49EA1
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:13 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.1291.1721071144959217155
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Bh9ouJXb;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=vCpKBa2s;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010190b7d59e98-f1866455-80b5-4027-ae60-3de39cf2f63e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OxXJgr9tCvgGcSExa6wIyRLSSKz8XtEdRuQDQX5USbM=;
	b=Bh9ouJXbJBcVaqtj6hK8cQTvG4CudTuoAswcL890USn7U8g/6v0TVR+lgag5cNfi
	aNHHACmQUVewSZO2pDck3huKAYoBJuG8xBBRYGwP7F4wSV2hDtc1ZU4IssBOGau5X/c
	naQ85Ib/Tp62mr7PjAdKLvw0b5HJwUduPZ1I/kBo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OxXJgr9tCvgGcSExa6wIyRLSSKz8XtEdRuQDQX5USbM=;
	b=vCpKBa2sbLNZA0r5HcJBNxXzBhK2kJYs+WNtBmVZZBPmazKE/z7/rhj0a7mU/2as
	ONBhpQqzhCkXKFhNsk6+iRy1K86RTTLkl2sp2VrFcJ9H89BaHd+Sy1yJ+dKSd8KKUot
	fNaC2ns3FuWy3VZ1m/eDQJkZw0isUS3asRg2I/zA=
Content-Type: multipart/mixed; boundary="===============3135968035885392514=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Simone_Wei=C3=9F_=3Csimone=2Ep=2Eweiss=40posteo=2Enet=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnutls: upgrading to 3.8.6 SUCCEEDED
Message-ID: <01010190b7d59e98-f1866455-80b5-4027-ae60-3de39cf2f63e-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202051

--===============3135968035885392514==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
ICpnbnV0bHMqIHRvICozLjguNiogaGFzIFN1Y2NlZWRlZC4KCk5leHQgc3RlcHM6CiAgICAtIGFw
cGx5IHRoZSBwYXRjaDogZ2l0IGFtIDAwMDEtZ251dGxzLXVwZ3JhZGUtMy44LjUtMy44LjYucGF0
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
b20gYjQ2NTA5Njg3MzQ5ZDZiZGQ0OTJhYjg4YTIxMmQxOWViNDAyZmJhZCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKRnJvbTogVXBncmFkZSBIZWxwZXIgPGF1aEB5b2N0b3Byb2plY3Qub3JnPgpE
YXRlOiBNb24sIDE1IEp1bCAyMDI0IDE4OjQ5OjM2ICswMDAwClN1YmplY3Q6IFtQQVRDSF0gZ251
dGxzOiB1cGdyYWRlIDMuOC41IC0+IDMuOC42CgotLS0KIC4uLmlsZS1zaG91bGQtYmUtZXhjdXRl
ZC1pbi10YXJnZXQtZW52aS5wYXRjaCB8ICAgMiArLQogLi4uUEtDUzEtdjFfNS1zeXN0ZW0td2lk
ZS1jb25maWd1cmF0aW9uLnBhdGNoIHwgMjY5IC0tLS0tLS0tLS0tLS0tLS0tLQogLi4uL2dudXRs
cy9nbnV0bHMvQWRkLXB0ZXN0LXN1cHBvcnQucGF0Y2ggICAgIHwgIDEwICstCiAuLi4vZ251dGxz
L2dudXRscy9hcm1fZWFiaS5wYXRjaCAgICAgICAgICAgICAgfCAgIDIgKy0KIC4uLi97Z251dGxz
XzMuOC41LmJiID0+IGdudXRsc18zLjguNi5iYn0gICAgICB8ICAgMyArLQogNSBmaWxlcyBjaGFu
Z2VkLCA4IGluc2VydGlvbnMoKyksIDI3OCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0
NCBtZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvZ251dGxzLzAwMDEtRml4LVJTQUVTLVBLQ1Mx
LXYxXzUtc3lzdGVtLXdpZGUtY29uZmlndXJhdGlvbi5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBl
cy1zdXBwb3J0L2dudXRscy97Z251dGxzXzMuOC41LmJiID0+IGdudXRsc18zLjguNi5iYn0gKDk1
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvZ251dGxzLzAwMDEt
Q3JlYXRpbmctLmhtYWMtZmlsZS1zaG91bGQtYmUtZXhjdXRlZC1pbi10YXJnZXQtZW52aS5wYXRj
aCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9nbnV0bHMvMDAwMS1DcmVhdGluZy0uaG1h
Yy1maWxlLXNob3VsZC1iZS1leGN1dGVkLWluLXRhcmdldC1lbnZpLnBhdGNoCmluZGV4IGQxM2Jm
ZWU4ZWYuLjU5ODI0ZDM1ZjEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRs
cy9nbnV0bHMvMDAwMS1DcmVhdGluZy0uaG1hYy1maWxlLXNob3VsZC1iZS1leGN1dGVkLWluLXRh
cmdldC1lbnZpLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9nbnV0bHMv
MDAwMS1DcmVhdGluZy0uaG1hYy1maWxlLXNob3VsZC1iZS1leGN1dGVkLWluLXRhcmdldC1lbnZp
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3YmU4ZWM1OWE1M2U5M2MyYmQ0NTNiM2JhMmQ2
M2QxYjMwMGVmMTFmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjNGY2Y2IzODA0NzFi
NWU1NDc4YWU2ZjdmOGM1NjA0YTZhNjRlYzFjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogTGVpIE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0c3UuY29tPgogRGF0ZTogTW9uLCAyMyBNYXkg
MjAyMiAxMDo0NDo0MyArMDkwMAogU3ViamVjdDogW1BBVENIXSBDcmVhdGluZyAuaG1hYyBmaWxl
IHNob3VsZCBiZSBleGN1dGVkIGluIHRhcmdldCBlbnZpcm9ubWVudCwKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9nbnV0bHMvMDAwMS1GaXgtUlNBRVMtUEtDUzEtdjFf
NS1zeXN0ZW0td2lkZS1jb25maWd1cmF0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
Z251dGxzL2dudXRscy8wMDAxLUZpeC1SU0FFUy1QS0NTMS12MV81LXN5c3RlbS13aWRlLWNvbmZp
Z3VyYXRpb24ucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGNjMzlmNWM5YTUu
LjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRscy8wMDAx
LUZpeC1SU0FFUy1QS0NTMS12MV81LXN5c3RlbS13aWRlLWNvbmZpZ3VyYXRpb24ucGF0Y2gKKysr
IC9kZXYvbnVsbApAQCAtMSwyNjkgKzAsMCBAQAotRnJvbSAyZDczZDk0NWM0YjFkZmNmOGQyMzI4
YzRkMjMxODdkNjJmZmFhYjJkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogWm9sdGFu
IEZyaWRyaWNoIDx6ZnJpZHJpY0ByZWRoYXQuY29tPgotRGF0ZTogV2VkLCAxMCBBcHIgMjAyNCAx
Mjo1MTozMyArMDIwMAotU3ViamVjdDogW1BBVENIXSBGaXggUlNBRVMtUEtDUzEtdjFfNSBzeXN0
ZW0td2lkZSBjb25maWd1cmF0aW9uCi0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2V4cGVj
dGVkIGZvciAgMy44LjYgaHR0cHM6Ly9naXRsYWIuY29tL2dudXRscy9nbnV0bHMvLS9tZXJnZV9y
ZXF1ZXN0cy8xODMwP2NvbW1pdF9pZD0yZDczZDk0NWM0YjFkZmNmOGQyMzI4YzRkMjMxODdkNjJm
ZmFhYjJkXQotCi1TaWduZWQtb2ZmLWJ5OiBTaW1vbmUgV2Vpw58gPHNpbW9uZS5wLndlaXNzQHBv
c3Rlby5jb20+Ci1TaWduZWQtb2ZmLWJ5OiBab2x0YW4gRnJpZHJpY2ggPHpmcmlkcmljQHJlZGhh
dC5jb20+Ci0tLS0KLSBsaWIvcHJpb3JpdHkuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAxMjUgKysrKysrKysrKystLS0tLS0tCi0gLi4uc3lzdGVtLW92ZXJyaWRlLWFsbG93LXJz
YS1wa2NzMS1lbmNyeXB0LnNoIHwgIDI3ICsrKy0KLSAyIGZpbGVzIGNoYW5nZWQsIDk2IGluc2Vy
dGlvbnMoKyksIDU2IGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvbGliL3ByaW9yaXR5LmMg
Yi9saWIvcHJpb3JpdHkuYwotaW5kZXggOGFiZTAwZDFmZi4uMzQzNDYxOWFhZCAxMDA2NDQKLS0t
LSBhL2xpYi9wcmlvcml0eS5jCi0rKysgYi9saWIvcHJpb3JpdHkuYwotQEAgLTEwMTgsNiArMTAx
OCwxMiBAQCBzdHJ1Y3QgY2ZnIHsKLSAJYm9vbCBmb3JjZV9leHRfbWFzdGVyX3NlY3JldF9zZXQ7
Ci0gfTsKLSAKLStzdGF0aWMgaW5saW5lIHZvaWQgY2ZnX2luaXQoc3RydWN0IGNmZyAqY2ZnKQot
K3sKLSsJbWVtc2V0KGNmZywgMCwgc2l6ZW9mKCpjZmcpKTsKLSsJY2ZnLT5hbGxvd19yc2FfcGtj
czFfZW5jcnlwdCA9IHRydWU7Ci0rfQotKwotIHN0YXRpYyBpbmxpbmUgdm9pZCBjZmdfZGVpbml0
KHN0cnVjdCBjZmcgKmNmZykKLSB7Ci0gCWlmIChjZmctPnByaW9yaXR5X3N0cmluZ3MpIHsKLUBA
IC0xMDk1LDYgKzExMDEsMTIgQEAgc3RydWN0IGluaV9jdHggewotIAlzaXplX3QgY3VydmVzX3Np
emU7Ci0gfTsKLSAKLStzdGF0aWMgaW5saW5lIHZvaWQgaW5pX2N0eF9pbml0KHN0cnVjdCBpbmlf
Y3R4ICpjdHgpCi0rewotKwltZW1zZXQoY3R4LCAwLCBzaXplb2YoKmN0eCkpOwotKwljZmdfaW5p
dCgmY3R4LT5jZmcpOwotK30KLSsKLSBzdGF0aWMgaW5saW5lIHZvaWQgaW5pX2N0eF9kZWluaXQo
c3RydWN0IGluaV9jdHggKmN0eCkKLSB7Ci0gCWNmZ19kZWluaXQoJmN0eC0+Y2ZnKTsKLUBAIC0x
NDIzLDkgKzE0MzUsNiBAQCBzdGF0aWMgaW5saW5lIGludCBjZmdfYXBwbHkoc3RydWN0IGNmZyAq
Y2ZnLCBzdHJ1Y3QgaW5pX2N0eCAqY3R4KQotIAkJX2dudXRsc19kZWZhdWx0X3ByaW9yaXR5X3N0
cmluZyA9IGNmZy0+ZGVmYXVsdF9wcmlvcml0eV9zdHJpbmc7Ci0gCX0KLSAKLS0JLyogZW5hYmxl
IFJTQS1QS0NTMS1WMV81IGJ5IGRlZmF1bHQgKi8KLS0JY2ZnLT5hbGxvd19yc2FfcGtjczFfZW5j
cnlwdCA9IHRydWU7Ci0tCi0gCWlmIChjZmctPmFsbG93bGlzdGluZykgewotIAkJLyogYWxzbyB1
cGRhdGVzIGBmbGFnc2Agb2YgZ2xvYmFsIGBoYXNoX2FsZ29yaXRobXNbXWAgKi8KLSAJCXJldCA9
IGNmZ19oYXNoZXNfc2V0X2FycmF5KGNmZywgY3R4LT5oYXNoZXMsIGN0eC0+aGFzaGVzX3NpemUp
OwotQEAgLTIyMTcsMjIgKzIyMjYsNzMgQEAgdXBkYXRlX3N5c3RlbV93aWRlX3ByaW9yaXR5X3N0
cmluZyh2b2lkKQotIAlyZXR1cm4gMDsKLSB9Ci0gCi0rLyogUmV0dXJucyBmYWxzZSBvbiBwYXJz
ZSBlcnJvciwgb3RoZXJ3aXNlIHRydWUuCi0rICogVGhlIHN5c3RlbV93aWRlX2NvbmZpZyBtdXN0
IGJlIGxvY2tlZCBmb3Igd3JpdGluZy4KLSsgKi8KLStzdGF0aWMgaW5saW5lIGJvb2wgbG9hZF9z
eXN0ZW1fcHJpb3JpdHlfZmlsZSh2b2lkKQotK3sKLSsJaW50IGVycjsKLSsJRklMRSAqZnA7Ci0r
CXN0cnVjdCBpbmlfY3R4IGN0eDsKLSsKLSsJY2ZnX2luaXQoJnN5c3RlbV93aWRlX2NvbmZpZyk7
Ci0rCi0rCWZwID0gZm9wZW4oc3lzdGVtX3ByaW9yaXR5X2ZpbGUsICJyZSIpOwotKwlpZiAoZnAg
PT0gTlVMTCkgewotKwkJX2dudXRsc19kZWJ1Z19sb2coImNmZzogdW5hYmxlIHRvIG9wZW46ICVz
OiAlZFxuIiwKLSsJCQkJICBzeXN0ZW1fcHJpb3JpdHlfZmlsZSwgZXJybm8pOwotKwkJcmV0dXJu
IHRydWU7Ci0rCX0KLSsKLSsJLyogUGFyc2luZyB0aGUgY29uZmlndXJhdGlvbiBmaWxlIG5lZWRz
IHRvIGJlIGRvbmUgaW4gMiBwaGFzZXM6Ci0rCSAqIGZpcnN0IHBhcnNpbmcgdGhlIFtnbG9iYWxd
IHNlY3Rpb24KLSsJICogYW5kIHRoZW4gdGhlIG90aGVyIHNlY3Rpb25zLAotKwkgKiBiZWNhdXNl
IHRoZSBbZ2xvYmFsXSBzZWN0aW9uIG1vZGlmaWVzIHRoZSBwYXJzaW5nIGJlaGF2aW9yLgotKwkg
Ki8KLSsJaW5pX2N0eF9pbml0KCZjdHgpOwotKwllcnIgPSBpbmlfcGFyc2VfZmlsZShmcCwgZ2xv
YmFsX2luaV9oYW5kbGVyLCAmY3R4KTsKLSsJaWYgKCFlcnIpIHsKLSsJCWlmIChmc2VlayhmcCwg
MEwsIFNFRUtfU0VUKSA8IDApIHsKLSsJCQlfZ251dGxzX2RlYnVnX2xvZygiY2ZnOiB1bmFibGUg
dG8gcmV3aW5kOiAlc1xuIiwKLSsJCQkJCSAgc3lzdGVtX3ByaW9yaXR5X2ZpbGUpOwotKwkJCWlm
IChmYWlsX29uX2ludmFsaWRfY29uZmlnKQotKwkJCQlleGl0KDEpOwotKwkJfQotKwkJZXJyID0g
aW5pX3BhcnNlX2ZpbGUoZnAsIGNmZ19pbmlfaGFuZGxlciwgJmN0eCk7Ci0rCX0KLSsJZmNsb3Nl
KGZwKTsKLSsJaWYgKGVycikgewotKwkJaW5pX2N0eF9kZWluaXQoJmN0eCk7Ci0rCQlfZ251dGxz
X2RlYnVnX2xvZygiY2ZnOiB1bmFibGUgdG8gcGFyc2U6ICVzOiAlZFxuIiwKLSsJCQkJICBzeXN0
ZW1fcHJpb3JpdHlfZmlsZSwgZXJyKTsKLSsJCXJldHVybiBmYWxzZTsKLSsJfQotKwljZmdfYXBw
bHkoJnN5c3RlbV93aWRlX2NvbmZpZywgJmN0eCk7Ci0rCWluaV9jdHhfZGVpbml0KCZjdHgpOwot
KwlyZXR1cm4gdHJ1ZTsKLSt9Ci0rCi0gc3RhdGljIGludCBfZ251dGxzX3VwZGF0ZV9zeXN0ZW1f
cHJpb3JpdGllcyhib29sIGRlZmVyX3N5c3RlbV93aWRlKQotIHsKLS0JaW50IHJldCwgZXJyID0g
MDsKLSsJaW50IHJldDsKLSsJYm9vbCBjb25maWdfcGFyc2VfZXJyb3IgPSBmYWxzZTsKLSAJc3Ry
dWN0IHN0YXQgc2I7Ci0tCUZJTEUgKmZwOwotIAlnbnV0bHNfYnVmZmVyX3N0IGJ1ZjsKLS0Jc3Ry
dWN0IGluaV9jdHggY3R4OwotIAotIAlyZXQgPSBnbnV0bHNfcndsb2NrX3JkbG9jaygmc3lzdGVt
X3dpZGVfY29uZmlnX3J3bG9jayk7Ci0tCWlmIChyZXQgPCAwKSB7Ci0rCWlmIChyZXQgPCAwKQot
IAkJcmV0dXJuIGdudXRsc19hc3NlcnRfdmFsKHJldCk7Ci0tCX0KLSAKLSAJaWYgKHN0YXQoc3lz
dGVtX3ByaW9yaXR5X2ZpbGUsICZzYikgPCAwKSB7Ci0gCQlfZ251dGxzX2RlYnVnX2xvZygiY2Zn
OiB1bmFibGUgdG8gYWNjZXNzOiAlczogJWRcbiIsCi0gCQkJCSAgc3lzdGVtX3ByaW9yaXR5X2Zp
bGUsIGVycm5vKTsKLSsKLSsJCSh2b2lkKWdudXRsc19yd2xvY2tfdW5sb2NrKCZzeXN0ZW1fd2lk
ZV9jb25maWdfcndsb2NrKTsKLSsJCXJldCA9IGdudXRsc19yd2xvY2tfd3Jsb2NrKCZzeXN0ZW1f
d2lkZV9jb25maWdfcndsb2NrKTsKLSsJCWlmIChyZXQgPCAwKQotKwkJCWdvdG8gb3V0OwotKwkJ
LyogSWYgc3lzdGVtLXdpZGUgY29uZmlnIGlzIHVuYXZhaWxhYmxlLCBhcHBseSB0aGUgZGVmYXVs
dHMgKi8KLSsJCWNmZ19pbml0KCZzeXN0ZW1fd2lkZV9jb25maWcpOwotIAkJZ290byBvdXQ7Ci0g
CX0KLSAKLUBAIC0yMjQwLDYzICsyMzAwLDI3IEBAIHN0YXRpYyBpbnQgX2dudXRsc191cGRhdGVf
c3lzdGVtX3ByaW9yaXRpZXMoYm9vbCBkZWZlcl9zeXN0ZW1fd2lkZSkKLSAJICAgIHN5c3RlbV9w
cmlvcml0eV9sYXN0X21vZCA9PSBzYi5zdF9tdGltZSkgewotIAkJX2dudXRsc19kZWJ1Z19sb2co
ImNmZzogc3lzdGVtIHByaW9yaXR5ICVzIGhhcyBub3QgY2hhbmdlZFxuIiwKLSAJCQkJICBzeXN0
ZW1fcHJpb3JpdHlfZmlsZSk7Ci0tCQlpZiAoc3lzdGVtX3dpZGVfY29uZmlnLnByaW9yaXR5X3N0
cmluZykgewotKwkJaWYgKHN5c3RlbV93aWRlX2NvbmZpZy5wcmlvcml0eV9zdHJpbmcpCi0gCQkJ
Z290byBvdXQ7IC8qIG5vdGhpbmcgdG8gZG8gKi8KLS0JCX0KLSAJfQotIAotIAkodm9pZClnbnV0
bHNfcndsb2NrX3VubG9jaygmc3lzdGVtX3dpZGVfY29uZmlnX3J3bG9jayk7Ci0gCi0gCXJldCA9
IGdudXRsc19yd2xvY2tfd3Jsb2NrKCZzeXN0ZW1fd2lkZV9jb25maWdfcndsb2NrKTsKLS0JaWYg
KHJldCA8IDApIHsKLSsJaWYgKHJldCA8IDApCi0gCQlyZXR1cm4gZ251dGxzX2Fzc2VydF92YWwo
cmV0KTsKLS0JfQotIAotIAkvKiBBbm90aGVyIHRocmVhZCBjb3VsZCBoYXZlIHN1Y2Nlc3NmdWxs
eSByZS1yZWFkIHN5c3RlbS13aWRlIGNvbmZpZywKLSAJICogc2tpcCByZS1yZWFkaW5nIGlmIHRo
ZSBtdGltZSBpdCBoYXMgdXNlZCBpcyBleGFjdGx5IHRoZSBzYW1lLgotIAkgKi8KLS0JaWYgKHN5
c3RlbV9wcmlvcml0eV9maWxlX2xvYWRlZCkgewotKwlpZiAoc3lzdGVtX3ByaW9yaXR5X2ZpbGVf
bG9hZGVkKQotIAkJc3lzdGVtX3ByaW9yaXR5X2ZpbGVfbG9hZGVkID0KLSAJCQkoc3lzdGVtX3By
aW9yaXR5X2xhc3RfbW9kID09IHNiLnN0X210aW1lKTsKLS0JfQotIAotIAlpZiAoIXN5c3RlbV9w
cmlvcml0eV9maWxlX2xvYWRlZCkgewotLQkJX25hbWVfdmFsX2FycmF5X2NsZWFyKCZzeXN0ZW1f
d2lkZV9jb25maWcucHJpb3JpdHlfc3RyaW5ncyk7Ci0tCi0tCQlnbnV0bHNfZnJlZShzeXN0ZW1f
d2lkZV9jb25maWcucHJpb3JpdHlfc3RyaW5nKTsKLS0JCXN5c3RlbV93aWRlX2NvbmZpZy5wcmlv
cml0eV9zdHJpbmcgPSBOVUxMOwotLQotLQkJZnAgPSBmb3BlbihzeXN0ZW1fcHJpb3JpdHlfZmls
ZSwgInJlIik7Ci0tCQlpZiAoZnAgPT0gTlVMTCkgewotLQkJCV9nbnV0bHNfZGVidWdfbG9nKCJj
Zmc6IHVuYWJsZSB0byBvcGVuOiAlczogJWRcbiIsCi0tCQkJCQkgIHN5c3RlbV9wcmlvcml0eV9m
aWxlLCBlcnJubyk7Ci0rCQljb25maWdfcGFyc2VfZXJyb3IgPSAhbG9hZF9zeXN0ZW1fcHJpb3Jp
dHlfZmlsZSgpOwotKwkJaWYgKGNvbmZpZ19wYXJzZV9lcnJvcikKLSAJCQlnb3RvIG91dDsKLS0J
CX0KLS0JCS8qIFBhcnNpbmcgdGhlIGNvbmZpZ3VyYXRpb24gZmlsZSBuZWVkcyB0byBiZSBkb25l
IGluIDIgcGhhc2VzOgotLQkJICogZmlyc3QgcGFyc2luZyB0aGUgW2dsb2JhbF0gc2VjdGlvbgot
LQkJICogYW5kIHRoZW4gdGhlIG90aGVyIHNlY3Rpb25zLAotLQkJICogYmVjYXVzZSB0aGUgW2ds
b2JhbF0gc2VjdGlvbiBtb2RpZmllcyB0aGUgcGFyc2luZyBiZWhhdmlvci4KLS0JCSAqLwotLQkJ
bWVtc2V0KCZjdHgsIDAsIHNpemVvZihjdHgpKTsKLS0JCWVyciA9IGluaV9wYXJzZV9maWxlKGZw
LCBnbG9iYWxfaW5pX2hhbmRsZXIsICZjdHgpOwotLQkJaWYgKCFlcnIpIHsKLS0JCQlpZiAoZnNl
ZWsoZnAsIDBMLCBTRUVLX1NFVCkgPCAwKSB7Ci0tCQkJCV9nbnV0bHNfZGVidWdfbG9nKCJjZmc6
IHVuYWJsZSB0byByZXdpbmQ6ICVzXG4iLAotLQkJCQkJCSAgc3lzdGVtX3ByaW9yaXR5X2ZpbGUp
OwotLQkJCQlpZiAoZmFpbF9vbl9pbnZhbGlkX2NvbmZpZykKLS0JCQkJCWV4aXQoMSk7Ci0tCQkJ
fQotLQkJCWVyciA9IGluaV9wYXJzZV9maWxlKGZwLCBjZmdfaW5pX2hhbmRsZXIsICZjdHgpOwot
LQkJfQotLQkJZmNsb3NlKGZwKTsKLS0JCWlmIChlcnIpIHsKLS0JCQlpbmlfY3R4X2RlaW5pdCgm
Y3R4KTsKLS0JCQlfZ251dGxzX2RlYnVnX2xvZygiY2ZnOiB1bmFibGUgdG8gcGFyc2U6ICVzOiAl
ZFxuIiwKLS0JCQkJCSAgc3lzdGVtX3ByaW9yaXR5X2ZpbGUsIGVycik7Ci0tCQkJZ290byBvdXQ7
Ci0tCQl9Ci0tCQljZmdfYXBwbHkoJnN5c3RlbV93aWRlX2NvbmZpZywgJmN0eCk7Ci0tCQlpbmlf
Y3R4X2RlaW5pdCgmY3R4KTsKLSAJCV9nbnV0bHNfZGVidWdfbG9nKCJjZmc6IGxvYWRlZCBzeXN0
ZW0gY29uZmlnICVzIG10aW1lICVsbGRcbiIsCi0gCQkJCSAgc3lzdGVtX3ByaW9yaXR5X2ZpbGUs
Ci0gCQkJCSAgKHVuc2lnbmVkIGxvbmcgbG9uZylzYi5zdF9tdGltZSk7Ci1AQCAtMjMzMiw5ICsy
MzU2LDggQEAgc3RhdGljIGludCBfZ251dGxzX3VwZGF0ZV9zeXN0ZW1fcHJpb3JpdGllcyhib29s
IGRlZmVyX3N5c3RlbV93aWRlKQotIG91dDoKLSAJKHZvaWQpZ251dGxzX3J3bG9ja191bmxvY2so
JnN5c3RlbV93aWRlX2NvbmZpZ19yd2xvY2spOwotIAotLQlpZiAoZXJyICYmIGZhaWxfb25faW52
YWxpZF9jb25maWcpIHsKLSsJaWYgKGNvbmZpZ19wYXJzZV9lcnJvciAmJiBmYWlsX29uX2ludmFs
aWRfY29uZmlnKQotIAkJZXhpdCgxKTsKLS0JfQotIAotIAlyZXR1cm4gcmV0OwotIH0KLWRpZmYg
LS1naXQgYS90ZXN0cy9zeXN0ZW0tb3ZlcnJpZGUtYWxsb3ctcnNhLXBrY3MxLWVuY3J5cHQuc2gg
Yi90ZXN0cy9zeXN0ZW0tb3ZlcnJpZGUtYWxsb3ctcnNhLXBrY3MxLWVuY3J5cHQuc2gKLWluZGV4
IGI3ZDQ3N2M5NmUuLjcxNGQwYWY5NDYgMTAwNzU1Ci0tLS0gYS90ZXN0cy9zeXN0ZW0tb3ZlcnJp
ZGUtYWxsb3ctcnNhLXBrY3MxLWVuY3J5cHQuc2gKLSsrKyBiL3Rlc3RzL3N5c3RlbS1vdmVycmlk
ZS1hbGxvdy1yc2EtcGtjczEtZW5jcnlwdC5zaAotQEAgLTE5LDkgKzE5LDggQEAKLSAjIFlvdSBz
aG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJs
aWMgTGljZW5zZQotICMgYWxvbmcgd2l0aCB0aGlzIHByb2dyYW0uICBJZiBub3QsIHNlZSA8aHR0
cHM6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+Ci0gCi0tOiAke3NyY2Rpcj0ufQotLVRFU1Q9JHtz
cmNkaXJ9L3JzYWVzLXBrY3MxLXYxXzUKLS1DT05GPSR7c3JjZGlyfS9jb25maWcuJCQudG1wCi0r
VEVTVD0ke2J1aWxkZGlyfS9yc2Flcy1wa2NzMS12MV81Ci0rQ09ORj1jb25maWcuJCQudG1wCi0g
ZXhwb3J0IEdOVVRMU19TWVNURU1fUFJJT1JJVFlfRklMRT0ke0NPTkZ9Ci0gZXhwb3J0IEdOVVRM
U19TWVNURU1fUFJJT1JJVFlfRkFJTF9PTl9JTlZBTElEPTEKLSAKLUBAIC0zOCwxNSArMzcsMzMg
QEAgY2F0IDw8X0VPRl8gPiAke0NPTkZ9Ci0gYWxsb3ctcnNhLXBrY3MxLWVuY3J5cHQgPSB0cnVl
Ci0gX0VPRl8KLSAKLS0ke1RFU1R9ICYmIGZhaWwgIlJTQUVTLVBLQ1MxLXYxXzUgZXhwZWN0ZWQg
dG8gc3VjY2VlZCIKLSske1RFU1R9Ci0raWYgWyAkPyAhPSAwIF07IHRoZW4KLSsJZWNobyAiJHtU
RVNUfSBleHBlY3RlZCB0byBzdWNjZWVkIgotKwlleGl0IDEKLStmaQotK2VjaG8gIlJTQUVTLVBL
Q1MxLXYxXzUgc3VjY2Vzc2Z1bGx5IGVuYWJsZWQiCi0gCi0gY2F0IDw8X0VPRl8gPiAke0NPTkZ9
Ci0gW292ZXJyaWRlc10KLSBhbGxvdy1yc2EtcGtjczEtZW5jcnlwdCA9IGZhbHNlCi0gX0VPRl8K
LSAKLS0ke1RFU1R9IHx8IGZhaWwgIlJTQUVTLVBLQ1MxLXYxXzUgZXhwZWN0ZWQgdG8gZmFpbCIK
LSske1RFU1R9Ci0raWYgWyAkPyA9IDAgXTsgdGhlbgotKwllY2hvICIke1RFU1R9IGV4cGVjdGVk
IHRvIGZhaWwiCi0rCWV4aXQgMQotK2ZpCi0rZWNobyAiUlNBRVMtUEtDUzEtdjFfNSBzdWNjZXNz
ZnVsbHkgZGlzYWJsZWQiCi0gCi0gdW5zZXQgR05VVExTX1NZU1RFTV9QUklPUklUWV9GSUxFCi0g
dW5zZXQgR05VVExTX1NZU1RFTV9QUklPUklUWV9GQUlMX09OX0lOVkFMSUQKLSsKLSske1RFU1R9
Ci0raWYgWyAkPyAhPSAwIF07IHRoZW4KLSsJZWNobyAiJHtURVNUfSBleHBlY3RlZCB0byBzdWNj
ZWVkIGJ5IGRlZmF1bHQiCi0rCWV4aXQgMQotK2ZpCi0rZWNobyAiUlNBRVMtUEtDUzEtdjFfNSBz
dWNjZXNzZnVsbHkgZW5hYmxlZCBieSBkZWZhdWx0IgotKwotIGV4aXQgMAotLS0gCi1HaXRMYWIK
LQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvZ251dGxzL0FkZC1w
dGVzdC1zdXBwb3J0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRscy9B
ZGQtcHRlc3Qtc3VwcG9ydC5wYXRjaAppbmRleCA4ZWRkMzFkNmI5Li44ZTRkZjdiMzdlIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvZ251dGxzL0FkZC1wdGVzdC1zdXBw
b3J0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9nbnV0bHMvQWRkLXB0
ZXN0LXN1cHBvcnQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGJmYTcwYWRjYmRhNGU1MDVj
ZjJlNTk3OTA3ODUyZTc4ZTA0MzllZTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDZh
YmM4NmFjZWNmZjVhMzAxNzNlYjc4YTk3MWVjNWI2NWY3N2UxZGUgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBSYXZpbmVldCBTaW5naCA8cmF2aW5lZXQuYS5zaW5naEBlc3QudGVjaD4K
IERhdGU6IFR1ZSwgMTAgSmFuIDIwMjMgMTY6MTE6MTAgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0g
Z251dGxzOiBhZGQgcHRlc3Qgc3VwcG9ydApAQCAtMjYsMTAgKzI2LDEwIEBAIGluZGV4IDg0MzE5
M2YuLjgxNmIwOWYgMTAwNjQ0CiAgCiAgaW5jbHVkZSAkKHRvcF9zcmNkaXIpL2NsaWdlbi9jbGln
ZW4ubWsKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDkz
NDM3N2UuLjQ0MDZlYWUgMTAwNjQ0CitpbmRleCAxNzQ0ODEzLi5lZmI5ZTM0IDEwMDY0NAogLS0t
IGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKLUBAIC0xMjEzLDYgKzEyMTMsOCBA
QCBBQ19TVUJTVChMSUJHTlVUTFNfQ0ZMQUdTKQorQEAgLTEyMjYsNiArMTIyNiw4IEBAIEFDX1NV
QlNUKExJQkdOVVRMU19DRkxBR1MpCiAgCiAgQU1fQ09ORElUSU9OQUwoTkVFRFNfTElCUlQsIHRl
c3QgIiRnbnV0bHNfbmVlZHNfbGlicnQiID0gInllcyIpCiAgCkBAIC0zOSwxMCArMzksMTAgQEAg
aW5kZXggOTM0Mzc3ZS4uNDQwNmVhZSAxMDA2NDQKICAKICBod19mZWF0dXJlcz0KIGRpZmYgLS1n
aXQgYS90ZXN0cy9NYWtlZmlsZS5hbSBiL3Rlc3RzL01ha2VmaWxlLmFtCi1pbmRleCBlMzlhM2Iz
Li44NjFkZDYzIDEwMDY0NAoraW5kZXggMTg5ZDA2OC4uODQzMGIwNSAxMDA2NDQKIC0tLSBhL3Rl
c3RzL01ha2VmaWxlLmFtCiArKysgYi90ZXN0cy9NYWtlZmlsZS5hbQotQEAgLTY2Myw2ICs2NjMs
MTIgQEAgU0hfTE9HX0NPTVBJTEVSID0gJChTSEVMTCkKK0BAIC02NjgsNiArNjY4LDEyIEBAIFNI
X0xPR19DT01QSUxFUiA9ICQoU0hFTEwpCiAgQU1fVkFMR1JJTkRGTEFHUyA9IC0tc3VwcHJlc3Np
b25zPSQoc3JjZGlyKS9zdXBwcmVzc2lvbnMudmFsZ3JpbmQKICBMT0dfQ09NUElMRVIgPSAkKExP
R19WQUxHUklORCkKICAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9n
bnV0bHMvYXJtX2VhYmkucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvZ251dGxz
L2FybV9lYWJpLnBhdGNoCmluZGV4IDg4M2QwMTIzZGIuLmQ0OTM0NDhhYWIgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9nbnV0bHMvYXJtX2VhYmkucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRscy9hcm1fZWFiaS5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gZDE3YWUwZWYzMWMzYzE4Njc2NmEzMzhlOGM0MGM4N2QxYjk4ODIwZSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNDZiMzA3OTA5NWM1Y2ViMGRjNzQyNzg1ODUz
YmJhZjI4OGYzMjVjNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEpvZSBTbGF0ZXIg
PGpzbGF0ZXJAd2luZHJpdmVyLmNvbT4KIERhdGU6IFdlZCwgMjUgSmFuIDIwMTcgMTM6NTI6NTkg
LTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gZ251dGxzOiBhY2NvdW50IGZvciBBUk1fRUFCSQpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRsc18zLjguNS5iYiBiL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9nbnV0bHNfMy44LjYuYmIKc2ltaWxhcml0eSBpbmRl
eCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRsc18zLjgu
NS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRsc18zLjguNi5i
YgppbmRleCA1MmExYzAwYzRhLi4zN2QxMmZiNWVhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9nbnV0bHMvZ251dGxzXzMuOC41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2dudXRscy9nbnV0bHNfMy44LjYuYmIKQEAgLTIxLDEyICsyMSwxMSBAQCBTSFJUX1ZFUiA9ICIk
e0BkLmdldFZhcignUFYnKS5zcGxpdCgnLicpWzBdfS4ke0BkLmdldFZhcignUFYnKS5zcGxpdCgn
LicpWzFdfSIKIFNSQ19VUkkgPSAiaHR0cHM6Ly93d3cuZ251cGcub3JnL2Z0cC9nY3J5cHQvZ251
dGxzL3Yke1NIUlRfVkVSfS9nbnV0bHMtJHtQVn0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTov
L2FybV9lYWJpLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtQ3JlYXRpbmctLmhtYWMt
ZmlsZS1zaG91bGQtYmUtZXhjdXRlZC1pbi10YXJnZXQtZW52aS5wYXRjaCBcCi0gICAgICAgICAg
IGZpbGU6Ly8wMDAxLUZpeC1SU0FFUy1QS0NTMS12MV81LXN5c3RlbS13aWRlLWNvbmZpZ3VyYXRp
b24ucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKICAgICAgICAgICAgZmls
ZTovL0FkZC1wdGVzdC1zdXBwb3J0LnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiNjYyNjlhMmNmZTBlMWMyZGFiZWM4N2JkYmJkOGFiNjU2ZjM5NmVkZDlhNDBk
ZDAwNjk3OGUwMDNjZmE1MmJmYyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyZTE1ODhhYWU1M2Ni
MzJkNDM5MzdmMWY0ZWNhMjhmZWJkOWMwYzdhYTE3MzRmYzVkZDYxYTdlODFlMGViY2RkIgogCiBp
bmhlcml0IGF1dG90b29scyB0ZXhpbmZvIHBrZ2NvbmZpZyBnZXR0ZXh0IGxpYl9wYWNrYWdlIGd0
ay1kb2MgcHRlc3QKIAotLSAKMi40NC4wCgo=

--===============3135968035885392514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gnutls/gnutls-doc: FILELIST: added "/usr/share/man/man3/gnutls_hash_squeeze.3 /usr/share/man/man3/gnutls_pkcs12_generate_mac3.3"
packages/core2-64-poky-linux/gnutls/gnutls-ptest: FILELIST: removed "/usr/lib/gnutls/ptest/tests/tls-pthread /usr/lib/gnutls/ptest/tests/rng-pthread /usr/lib/gnutls/ptest/tests/fips-mode-pthread /usr/lib/gnutls/ptest/tests/dtls-pthread"
packages/core2-64-poky-linux/gnutls/gnutls: FILELIST: removed "/usr/lib/libgnutls.so.30.39.0", added "/usr/lib/libgnutls.so.30.40.0"
Changes to packages/core2-64-poky-linux/gnutls (sysroot):
  /usr/lib/libgnutls.so.30 changed symlink target from libgnutls.so.30.39.0 to libgnutls.so.30.40.0
  /usr/lib/libgnutls.so changed symlink target from libgnutls.so.30.39.0 to libgnutls.so.30.40.0
  /usr/lib/libgnutls.so.30.39.0 moved to /usr/lib/libgnutls.so.30.40.0
Changes to packages/x86_64-linux/gnutls-native (sysroot):
  /usr/lib/libgnutls.so.30 changed symlink target from libgnutls.so.30.39.0 to libgnutls.so.30.40.0
  /usr/lib/libgnutls.so changed symlink target from libgnutls.so.30.39.0 to libgnutls.so.30.40.0
  /usr/lib/libgnutls.so.30.39.0 moved to /usr/lib/libgnutls.so.30.40.0

--===============3135968035885392514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (0 cached, 918 parsed). 1879 targets, 46 skipped, 0 masked, 0 errors.
Removing 62 recipes from the core2-64 sysroot...done.
Removing 60 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-f86b7fe1c069cd2dd04fb7c59741c42bee2273ff"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f86b7fe1c069cd2dd04fb7c59741c42bee2273ff"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 421 Local 242 Mirrors 0 Missed 179 Current 223 (57% match, 72% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 7 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 231 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 234 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 237 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 247 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 248 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 249 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 250 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 253 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 254 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 258 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 261 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 264 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 271 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 274 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 301 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 304 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-2.42-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-14.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.42-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 305 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.42.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 306 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 309 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 310 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-14.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 311 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 312 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 315 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 316 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 319 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 320 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 321 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 322 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 323 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 324 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 325 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 326 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 327 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 328 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.191-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 331 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 337 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 364 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 368 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 369 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 370 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 371 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 375 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 376 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 377 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 378 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.12.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 379 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 380 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 381 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 382 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 383 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 384 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 385 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 386 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 389 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 390 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 391 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 392 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 393 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 397 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 398 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 399 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 400 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 401 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 402 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 403 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 404 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 405 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 406 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 407 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 408 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 409 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 410 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 411 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 412 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 413 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 414 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 415 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 416 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 417 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 418 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 419 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 420 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 421 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 422 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 423 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 424 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 425 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.49-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 429 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 430 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 431 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 432 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 433 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 434 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 435 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.49-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 436 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 439 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 446 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.70-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 464 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 465 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 466 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 467 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 468 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 469 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 470 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 471 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 473 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 474 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 475 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-1.49-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 483 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.1.bb:do_create_spdx_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 486 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 487 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 517 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-initial-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 540 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 541 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunistring-1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 542 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 544 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.49-r0: task do_recipe_qa_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 549 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 552 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 561 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 576 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 577 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 578 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-initial-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 579 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_create_spdx_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 580 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 581 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 582 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 583 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 584 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 585 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 586 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 587 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_create_spdx_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 593 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 594 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 595 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 596 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 597 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_recipe_qa_setscene)
NOTE: Running task 699 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 701 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_fetch)
NOTE: Running task 707 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_fetch)
NOTE: Running task 715 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 718 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_fetch)
NOTE: Running task 720 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 721 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 731 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_fetch)
NOTE: recipe mpfr-4.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 741 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_fetch)
NOTE: recipe libseccomp-2.5.5-r0: task do_fetch: Started
NOTE: recipe libunistring-1.2-r0: task do_fetch: Started
NOTE: recipe openssl-3.3.1-r0: task do_fetch: Started
NOTE: Running task 749 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_fetch)
NOTE: recipe libgpg-error-1.49-r0: task do_fetch: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_fetch: Succeeded
NOTE: Running task 751 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_fetch)
NOTE: Running task 752 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_unpack)
NOTE: recipe openssl-3.3.1-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.49-r0: task do_fetch: Succeeded
NOTE: Running task 753 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_unpack)
NOTE: Running task 754 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_unpack)
NOTE: recipe nettle-3.9.1-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 598 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 760 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: Running task 761 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_unpack)
NOTE: Running setscene task 599 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.7-r0: task do_fetch: Started
NOTE: recipe xz-5.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 762 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_unpack)
NOTE: recipe expat-2.6.2-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.8.0-r0: task do_fetch: Started
NOTE: Running task 763 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_unpack)
NOTE: recipe libunistring-1.2-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 600 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 601 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.8.0-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 602 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_fetch: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.49-r0: task do_unpack: Started
NOTE: Running setscene task 603 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 764 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_unpack)
NOTE: Running task 765 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_unpack)
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 766 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 767 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_unpack)
NOTE: recipe xz-5.4.6-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_unpack: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_unpack: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_unpack: Started
NOTE: Running task 769 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: Running task 771 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: recipe nettle-3.9.1-r0: task do_unpack: Succeeded
NOTE: Running task 772 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_patch)
NOTE: recipe xz-5.4.6-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_unpack: Succeeded
NOTE: Running task 773 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_patch)
NOTE: Running task 774 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_patch)
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: Running setscene task 604 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.8.0-r0: task do_unpack: Started
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 605 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 775 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_patch)
NOTE: Running setscene task 606 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.49-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: Running task 776 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_patch)
NOTE: Running task 777 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_patch)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 607 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 608 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_patch: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 609 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunistring-1.2-r0: task do_patch: Started
NOTE: recipe xz-5.4.6-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.49-r0: task do_patch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_patch: Succeeded
NOTE: Running task 778 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 780 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: Running task 782 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_fetch)
NOTE: recipe opkg-utils-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 610 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.2-r0: task do_patch: Succeeded
NOTE: Running task 785 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_recipe_qa)
NOTE: recipe cracklib-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 611 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_patch: Succeeded
NOTE: Running task 786 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_unpack)
NOTE: Running task 797 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_fetch)
NOTE: recipe nettle-3.9.1-r0: task do_patch: Succeeded
NOTE: Running task 800 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 612 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: Running setscene task 613 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_unpack: Succeeded
NOTE: Running setscene task 615 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: recipe openssl-3.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 801 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_patch)
NOTE: recipe curl-8.8.0-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-3.8.6-r0: task do_recipe_qa: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 802 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_patch)
NOTE: Running task 803 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_unpack)
NOTE: Running task 804 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_unpack)
NOTE: recipe libcap-2.70-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.49-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_unpack: Started
NOTE: Running task 806 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_patch)
NOTE: recipe libgcrypt-1.10.3-r0: task do_fetch: Started
NOTE: recipe libcap-2.70-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 808 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_fetch)
NOTE: Running task 809 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_fetch: Succeeded
NOTE: Running task 814 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_unpack: Succeeded
NOTE: Running task 816 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_fetch)
NOTE: Running task 817 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: Running task 818 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_patch)
NOTE: recipe libseccomp-2.5.5-r0: task do_patch: Started
NOTE: recipe openssl-3.3.1-r0: task do_patch: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_unpack: Started
NOTE: Running setscene task 616 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_unpack: Started
NOTE: Running task 820 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_fetch)
NOTE: recipe opkg-utils-0.6.3-r0: task do_fetch: Started
NOTE: recipe curl-8.8.0-r0: task do_patch: Started
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 821 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_patch)
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Started
NOTE: recipe cracklib-2.9.11-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe gdbm-1.23-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.5.0-r0: task do_fetch: Started
NOTE: Running task 823 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_unpack)
NOTE: Running task 824 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 825 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 826 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_unpack)
NOTE: recipe curl-8.8.0-r0: task do_patch: Succeeded
NOTE: Running task 827 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_unpack)
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 828 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: recipe attr-2.5.2-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_fetch: Succeeded
NOTE: Running task 829 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_unpack)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 832 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_generate_toolchain_file)
NOTE: Running task 834 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: recipe libcap-2.70-r0: task do_unpack: Started
NOTE: recipe cracklib-2.9.11-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_unpack: Started
NOTE: Running task 835 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_unpack)
NOTE: recipe gdbm-1.23-r0: task do_patch: Succeeded
NOTE: Running task 839 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_fetch)
NOTE: recipe gnutls-3.8.6-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 617 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 618 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_unpack: Started
NOTE: recipe openssl-3.3.1-r0: task do_patch: Succeeded
NOTE: recipe gnutls-3.8.6-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Started
NOTE: Running setscene task 619 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_unpack: Started
NOTE: Running task 840 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_patch)
NOTE: recipe expat-2.6.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: recipe libcap-2.70-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_patch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 842 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_unpack)
NOTE: Running task 843 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: Running task 845 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_patch)
NOTE: recipe cracklib-2.9.11-r0: task do_unpack: Started
NOTE: recipe expat-2.6.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_fetch: Started
NOTE: Running task 847 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_fetch)
NOTE: Running task 848 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: recipe libtool-cross-2.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 852 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_fetch)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_patch: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.70-r0: task do_patch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: Running task 855 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_fetch)
NOTE: Running task 861 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: recipe gnutls-3.8.6-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running noexec task 863 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_fetch)
NOTE: Running task 864 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_fetch)
NOTE: Running task 865 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_fetch)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_fetch: Succeeded
NOTE: Running task 866 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_unpack)
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_fetch: Succeeded
NOTE: Running task 867 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: Running task 868 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_unpack)
NOTE: recipe libpam-1.6.1-r0: task do_patch: Succeeded
NOTE: Running task 870 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_fetch)
NOTE: recipe ncurses-6.5-r0: task do_fetch: Succeeded
NOTE: Running task 871 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_unpack)
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Started
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Started
NOTE: Running setscene task 620 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_unpack: Started
NOTE: recipe libcap-2.70-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_fetch: Succeeded
NOTE: Running setscene task 621 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_unpack: Started
NOTE: Running setscene task 622 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_fetch: Started
NOTE: Running task 874 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_fetch)
NOTE: recipe ncurses-6.5-r0: task do_unpack: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_fetch: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 876 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_fetch)
NOTE: recipe opkg-utils-0.6.3-r0: task do_unpack: Succeeded
NOTE: Running task 877 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_patch)
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Succeeded
NOTE: Running task 878 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: Running task 879 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_unpack)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_unpack: Succeeded
NOTE: Running task 880 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_patch)
NOTE: recipe libgcc-14.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 881 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_patch)
NOTE: recipe cracklib-2.9.11-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: Running task 882 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_patch)
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 884 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_unpack)
NOTE: Running task 886 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_unpack)
NOTE: recipe opkg-utils-0.6.3-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_fetch: Succeeded
NOTE: Running task 887 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_unpack)
NOTE: recipe python3-3.12.4-r0: task do_fetch: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Started
NOTE: Running noexec task 889 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_fetch)
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Started
NOTE: Running task 891 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_fetch)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 893 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_fetch)
NOTE: Running setscene task 623 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 624 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_patch: Started
NOTE: recipe python3-3.12.4-r0: task do_fetch: Succeeded
NOTE: Running setscene task 625 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_patch: Started
NOTE: recipe libffi-3.4.6-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_unpack: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_unpack: Started
NOTE: recipe lzlib-1.14-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 626 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.45-r0: task do_fetch: Started
NOTE: recipe lzlib-1.14-r0: task do_fetch: Succeeded
NOTE: Running task 894 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_unpack: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_unpack: Succeeded
NOTE: Running task 895 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_patch)
NOTE: Running task 896 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_patch)
NOTE: recipe musl-1.2.4+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_patch: Succeeded
NOTE: Running task 898 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_unpack)
NOTE: recipe libtirpc-1.3.4-r0: task do_patch: Succeeded
NOTE: Running task 906 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_fetch)
NOTE: recipe cracklib-2.9.11-r0: task do_patch: Succeeded
NOTE: recipe libgcc-initial-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 908 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_fetch)
NOTE: recipe musl-1.2.4+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 627 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_patch: Started
NOTE: recipe libffi-3.4.6-r0: task do_patch: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 628 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 629 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-5.45-r0: task do_fetch: Succeeded
NOTE: Running task 909 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_fetch)
NOTE: recipe fts-1.2.7-r0: task do_fetch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_fetch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 910 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_fetch)
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 911 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: recipe gnutls-3.8.6-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Started
NOTE: recipe libgcc-initial-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 912 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_patch)
NOTE: Running setscene task 630 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 632 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 914 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_fetch)
NOTE: Running task 915 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_patch)
NOTE: Running task 916 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_fetch)
NOTE: recipe libedit-20240517-3.1-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Started
NOTE: Running task 917 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_fetch)
NOTE: Running setscene task 633 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Succeeded
NOTE: Running task 918 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 634 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-initial-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.6-r0: task do_patch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Started
NOTE: recipe ncurses-6.5-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.6-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_fetch: Succeeded
NOTE: Running task 921 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_fetch)
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 922 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_unpack)
NOTE: recipe libgcc-initial-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 925 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_patch: Succeeded
NOTE: Running task 927 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_fetch)
NOTE: Running task 929 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 931 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_fetch)
NOTE: recipe zstd-1.5.6-r0: task do_patch: Succeeded
NOTE: Running task 933 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_unpack)
NOTE: recipe musl-1.2.4+git-r0: task do_fetch: Succeeded
NOTE: Running task 934 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_unpack)
NOTE: recipe elfutils-0.191-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_fetch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_fetch: Succeeded
NOTE: Running task 935 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_unpack)
NOTE: recipe file-5.45-r0: task do_unpack: Started
NOTE: Running task 936 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_prepare_recipe_sysroot)
NOTE: recipe libssp-nonshared-1.0-r0: task do_fetch: Started
NOTE: recipe lzlib-1.14-r0: task do_unpack: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_fetch: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_unpack: Started
NOTE: Running task 937 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_unpack)
NOTE: recipe gnutls-3.8.6-r0: task do_patch: Succeeded
NOTE: Running task 938 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_deploy_source_date_epoch)
NOTE: recipe lzlib-1.14-r0: task do_unpack: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_unpack: Started
NOTE: Running task 939 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_patch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 940 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_unpack: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 941 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_patch)
NOTE: Running task 942 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 943 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_patch)
NOTE: recipe gnutls-3.8.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ncurses-6.5-r0: task do_patch: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_patch: Started
NOTE: Running task 944 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_collect_spdx_deps)
NOTE: recipe bsd-headers-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Started
NOTE: Running task 946 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_unpack: Succeeded
NOTE: Running task 947 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 948 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_patch)
NOTE: recipe lzlib-1.14-r0: task do_patch: Succeeded
NOTE: Running task 949 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 953 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_unpack)
NOTE: recipe libarchive-3.7.4-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_patch: Succeeded
NOTE: Running noexec task 955 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_configure)
NOTE: Running noexec task 956 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_compile)
NOTE: Running task 957 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_install)
NOTE: recipe fts-1.2.7-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_patch: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_patch: Started
NOTE: recipe elfutils-0.191-r0: task do_unpack: Started
NOTE: recipe file-5.45-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-3.8.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_patch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_patch: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_patch: Succeeded
NOTE: Running task 959 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_patch)
NOTE: Running task 960 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_patch)
NOTE: Running task 961 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_unpack)
NOTE: Running task 962 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_unpack)
NOTE: Running task 963 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_unpack)
NOTE: Running task 964 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_patch)
NOTE: Running task 968 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 969 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_fetch)
NOTE: Running task 973 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: Running task 974 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_fetch)
NOTE: Running task 975 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_fetch)
NOTE: Running task 983 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 635 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_install: Started
NOTE: recipe musl-1.2.4+git-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe fts-1.2.7-r0: task do_unpack: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Started
NOTE: recipe file-5.45-r0: task do_patch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.7.4-r0: task do_patch: Started
NOTE: recipe shadow-4.15.1-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: recipe bash-5.2.21-r0: task do_fetch: Started
NOTE: Running task 984 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe musl-legacy-error-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_fetch: Started
NOTE: Running noexec task 986 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_configure)
NOTE: Running noexec task 987 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_compile)
NOTE: Running task 988 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_install)
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_fetch: Succeeded
NOTE: Running task 992 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_fetch)
NOTE: Running task 993 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_unpack)
NOTE: recipe bash-5.2.21-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_fetch: Succeeded
NOTE: Running task 994 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: Running task 995 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_unpack)
NOTE: recipe python3-3.12.4-r0: task do_unpack: Succeeded
NOTE: Running task 996 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_install: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: Running task 997 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_package)
NOTE: recipe mpfr-4.2.1-r0: task do_fetch: Started
NOTE: recipe file-5.45-r0: task do_patch: Succeeded
NOTE: Running task 999 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_unpack)
NOTE: recipe shadow-4.15.1-r0: task do_unpack: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_install: Started
NOTE: recipe libarchive-3.7.4-r0: task do_patch: Succeeded
NOTE: Running task 1002 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_fetch)
NOTE: recipe mpfr-4.2.1-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: Running task 1004 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe bash-5.2.21-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1005 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe elfutils-0.191-r0: task do_unpack: Succeeded
NOTE: Running task 1006 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_package: Started
NOTE: recipe musl-1.2.4+git-r0: task do_patch: Succeeded
NOTE: Running task 1016 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_patch: Started
NOTE: Running task 1017 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_unpack)
NOTE: recipe musl-legacy-error-1.0-r0: task do_install: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe coreutils-9.5-r0: task do_unpack: Started
NOTE: Running task 1024 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe elfutils-0.191-r0: task do_patch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_unpack: Succeeded
NOTE: Running task 1025 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_patch)
NOTE: Running task 1026 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_unpack: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_unpack: Started
NOTE: Running task 1027 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: Running task 1028 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_patch)
NOTE: Running task 1029 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: Running task 1043 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_fetch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1045 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1046 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_unpack)
NOTE: Running task 1072 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_fetch)
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Started
NOTE: recipe fts-1.2.7-r0: task do_patch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: recipe bash-5.2.21-r0: task do_unpack: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_fetch: Started
NOTE: recipe shadow-4.15.1-r0: task do_patch: Started
NOTE: Running task 1073 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_patch)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_fetch: Started
NOTE: Running task 1075 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_unpack)
NOTE: Running task 1089 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.42.bb:do_fetch)
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_patch: Succeeded
NOTE: Running task 1092 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe mpfr-4.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1095 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_fetch)
NOTE: Running task 1096 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1097 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe bash-5.2.21-r0: task do_patch: Started
NOTE: recipe libmpc-1.3.1-r0: task do_unpack: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_fetch: Started
NOTE: recipe binutils-2.42-r0: task do_fetch: Started
NOTE: Running task 1125 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_patch)
NOTE: recipe psmisc-23.7-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.1-r0: task do_patch: Started
NOTE: recipe binutils-2.42-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_patch: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1126 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.42.bb:do_unpack)
NOTE: Running task 1128 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_patch)
NOTE: Running task 1129 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_patch)
NOTE: recipe unzip-1_6.0-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: Running task 1130 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: recipe mpfr-4.2.1-r0: task do_patch: Succeeded
NOTE: Running noexec task 1145 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.1.bb:do_fetch)
NOTE: Running task 1146 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_package)
NOTE: recipe ca-certificates-20211016-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1147 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe tzdata-2024a-r0: task do_patch: Started
NOTE: recipe libmpc-1.3.1-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r0: task do_unpack: Started
NOTE: recipe binutils-2.42-r0: task do_unpack: Started
NOTE: recipe psmisc-23.7-r0: task do_fetch: Succeeded
NOTE: Running task 1148 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_unpack)
NOTE: recipe tzdata-2024a-r0: task do_patch: Succeeded
NOTE: Running task 1152 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_configure)
NOTE: recipe musl-legacy-error-1.0-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_unpack: Succeeded
NOTE: Running task 1153 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: Running task 1154 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_patch)
NOTE: recipe libmpc-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_unpack: Started
NOTE: recipe tzdata-2024a-r0: task do_configure: Started
NOTE: Running task 1170 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_patch: Started
NOTE: recipe coreutils-9.5-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1171 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe elfutils-0.191-r0: task do_patch: Succeeded
NOTE: recipe tzdata-2024a-r0: task do_configure: Succeeded
NOTE: Running task 1175 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1176 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_patch: Started
NOTE: recipe tzdata-2024a-r0: task do_compile: Started
NOTE: recipe bash-5.2.21-r0: task do_patch: Succeeded
NOTE: recipe gnutls-3.8.6-r0: task do_populate_lic: Started
NOTE: recipe coreutils-9.5-r0: task do_patch: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_patch: Succeeded
NOTE: Running task 1181 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1182 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe ca-certificates-20211016-r0: task do_configure: Started
NOTE: recipe psmisc-23.7-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-3.8.6-r0: task do_populate_lic: Succeeded
NOTE: Running task 1183 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_patch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_populate_lic unihash changed to 507bc840edb8471a3813ba59392b18acdc47ea91ab77c2c50e79c29007ab0371
NOTE: recipe tzdata-2024a-r0: task do_compile: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running task 1184 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_install)
NOTE: recipe python3-3.12.4-r0: task do_patch: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_configure: Succeeded
NOTE: Running task 1186 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_compile)
NOTE: recipe psmisc-23.7-r0: task do_patch: Started
NOTE: recipe tzdata-2024a-r0: task do_install: Started
NOTE: recipe ca-certificates-20211016-r0: task do_compile: Started
NOTE: recipe psmisc-23.7-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_package unihash changed to bbb8944c96ebda3b57383864cd6b38a748532b0f72bff02062f3c798b2d71b29
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_create_spdx became valid
NOTE: recipe ca-certificates-20211016-r0: task do_compile: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_fetch: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_package: Succeeded
NOTE: Running setscene task 489 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_recipe_qa_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_package unihash changed to 3de15ef14abe1894779421a7be57660c949492f8f009a3bb1e71c355ee57ba18
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata became valid
NOTE: recipe tzdata-2024a-r0: task do_install: Succeeded
NOTE: Running setscene task 598 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 629 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_create_spdx_setscene)
NOTE: Running setscene task 638 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_populate_sysroot_setscene)
NOTE: Running task 1190 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_14.1.bb:do_patch)
NOTE: Running task 1191 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_unpack)
NOTE: Running task 1192 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_install)
NOTE: Running task 1193 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_package)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-source-14.1.0-14.1.0-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tzdata-2024a-r0: task do_package: Started
NOTE: recipe unzip-1_6.0-r0: task do_patch: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_install: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 639 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 640 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_unpack: Succeeded
NOTE: Running task 1200 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_patch)
NOTE: recipe linux-libc-headers-6.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 642 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1201 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe musl-locales-1.0+git-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_patch: Succeeded
NOTE: Running task 1203 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_fetch)
NOTE: Running task 1204 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_generate_toolchain_file)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.9-r0: task do_fetch: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_generate_toolchain_file: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_fetch: Succeeded
NOTE: Running task 1206 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_unpack)
NOTE: Running task 1207 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1222 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe linux-libc-headers-6.9-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 70b51aade0868d2e9665cb098e7343a206fad5376f133e2526ffd66fdb682fa5
NOTE: Setscene tasks completed
NOTE: Running task 1223 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe linux-libc-headers-6.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe ca-certificates-20211016-r0: task do_install: Succeeded
NOTE: Running task 1224 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe ca-certificates-20211016-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 75482368ea8bb62c21e5ad540fc5e8ee0e758e6ed6bace533e0f25309336c555
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe binutils-2.42-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1225 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.42.bb:do_patch)
NOTE: recipe binutils-2.42-r0: task do_patch: Started
NOTE: recipe ca-certificates-20211016-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_package unihash changed to 6845c47c2d3aca5fefdbaf3779bf6537b9b1b5787d86f6096146948aae46b661
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata became valid
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-source-14.1.0-14.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1227 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_14.1.bb:do_preconfigure)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gcc-source-14.1.0-14.1.0-r0: task do_preconfigure: Started
NOTE: recipe gcc-source-14.1.0-14.1.0-r0: task do_preconfigure: Succeeded
NOTE: recipe binutils-2.42-r0: task do_patch: Succeeded
NOTE: recipe tzdata-2024a-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_package unihash changed to 10ecc754d5875d7a97115b4aa98fb2e90ecb6168af804f40e98992d4c8a9cf7e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata became valid
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe linux-libc-headers-6.9-r0: task do_unpack: Succeeded
NOTE: Running task 1236 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_patch)
NOTE: Running task 1237 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_collect_spdx_deps)
NOTE: recipe linux-libc-headers-6.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_patch: Succeeded
NOTE: Running noexec task 1239 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_configure)
NOTE: Running noexec task 1240 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_compile)
NOTE: Running task 1241 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_install)
NOTE: recipe linux-libc-headers-6.9-r0: task do_install: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_install: Succeeded
NOTE: Running task 1254 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1257 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_package)
NOTE: recipe libssp-nonshared-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_package: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 1258 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_configure)
NOTE: Running task 1259 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_compile)
NOTE: recipe libssp-nonshared-1.0-r0: task do_compile: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1260 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_install)
NOTE: recipe libssp-nonshared-1.0-r0: task do_install: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_install: Succeeded
NOTE: Running task 1262 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1263 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_package)
NOTE: recipe musl-1.2.4+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package: Started
NOTE: recipe musl-1.2.4+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1264 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_configure)
NOTE: recipe musl-1.2.4+git-r0: task do_configure: Started
NOTE: recipe musl-1.2.4+git-r0: task do_configure: Succeeded
NOTE: Running task 1265 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_compile)
NOTE: recipe musl-1.2.4+git-r0: task do_compile: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_package unihash changed to fbcfd9708b26c6a7837bc1391e3b5ce07fadfd9016ed9e7706ef5768decff81c
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata became valid
NOTE: Running setscene task 636 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_create_spdx_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_package unihash changed to 6529abdbd494a6d73cb752b8b602d5d8494ad7ad846837f47baacd3d1710fe07
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_packagedata became valid
NOTE: Running setscene task 636 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_create_spdx_setscene)
NOTE: recipe linux-libc-headers-6.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1275 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_collect_spdx_deps)
NOTE: recipe musl-1.2.4+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe musl-1.2.4+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1276 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_install)
NOTE: recipe musl-1.2.4+git-r0: task do_install: Started
NOTE: recipe musl-1.2.4+git-r0: task do_install: Succeeded
NOTE: Running task 1278 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1279 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package)
NOTE: recipe libgcc-14.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-1.2.4+git-r0: task do_package: Started
NOTE: recipe libgcc-14.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1280 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_configure)
NOTE: recipe libgcc-14.1.0-r0: task do_configure: Started
NOTE: recipe libgcc-14.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1281 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_compile)
NOTE: recipe libgcc-14.1.0-r0: task do_compile: Started
NOTE: recipe musl-1.2.4+git-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package unihash changed to a929bf3638fef123f038744928dcc7dda0e43387ed95aa00702c9ee8173e3431
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx became valid
NOTE: Running setscene task 638 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1284 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_collect_spdx_deps)
NOTE: recipe libgcc-14.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcc-14.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgcc-14.1.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1285 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_install)
NOTE: recipe libgcc-14.1.0-r0: task do_install: Started
NOTE: recipe libgcc-14.1.0-r0: task do_install: Succeeded
NOTE: Running task 1286 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_multilib_install)
NOTE: recipe libgcc-14.1.0-r0: task do_multilib_install: Started
NOTE: recipe libgcc-14.1.0-r0: task do_multilib_install: Succeeded
NOTE: Running task 1287 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_extra_symlinks)
NOTE: recipe libgcc-14.1.0-r0: task do_extra_symlinks: Started
NOTE: recipe libgcc-14.1.0-r0: task do_extra_symlinks: Succeeded
NOTE: Running task 1289 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1290 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_package)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcc-14.1.0-r0: task do_package: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1291 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_configure)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_configure: Started
NOTE: recipe libgcc-14.1.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_package unihash changed to cd71867a45b997201004a974ce92178e37933bad3ca455d6e2a980c5f9c29d6e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_packagedata became valid
NOTE: Running setscene task 640 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1294 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_collect_spdx_deps)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1295 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_compile)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_compile: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1296 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_install)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_install: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_install: Succeeded
NOTE: Running task 1303 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1304 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1305 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1306 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1307 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1308 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_package)
NOTE: Running task 1309 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1310 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1311 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1312 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1313 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1314 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1315 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1316 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1317 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1318 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe opkg-utils-0.6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.23-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_package: Started
NOTE: recipe libffi-3.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzlib-1.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1319 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_configure)
NOTE: recipe zstd-1.5.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1320 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_configure)
NOTE: recipe lzlib-1.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1321 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_configure)
NOTE: recipe opkg-utils-0.6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_configure: Started
NOTE: Running task 1322 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_configure)
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1323 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_configure)
NOTE: recipe libunistring-1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1324 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_configure)
NOTE: recipe zstd-1.5.6-r0: task do_configure: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1325 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_configure)
NOTE: recipe gdbm-1.23-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1326 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_configure)
NOTE: recipe expat-2.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1327 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_configure)
NOTE: recipe base-passwd-3.6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1328 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_configure)
NOTE: Running task 1329 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_configure)
NOTE: recipe opkg-utils-0.6.3-r0: task do_configure: Started
NOTE: Running task 1330 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_configure)
NOTE: Running task 1331 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_configure)
NOTE: Running task 1332 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_configure)
NOTE: recipe zstd-1.5.6-r0: task do_configure: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_configure: Started
NOTE: Running task 1333 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_compile)
NOTE: recipe libunistring-1.2-r0: task do_configure: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_configure: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_configure: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1334 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_compile)
NOTE: recipe gdbm-1.23-r0: task do_configure: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_configure: Started
NOTE: Running task 1335 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_configure)
NOTE: recipe expat-2.6.2-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_configure: Started
NOTE: recipe libffi-3.4.6-r0: task do_configure: Started
NOTE: Running task 1336 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_compile)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_configure: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_configure: Started
NOTE: recipe zstd-1.5.6-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_compile: Started
NOTE: recipe lzlib-1.14-r0: task do_compile: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_compile: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1337 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_install)
NOTE: Running task 1338 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_configure_ptest_base)
NOTE: recipe opkg-utils-0.6.3-r0: task do_install: Started
NOTE: recipe zlib-1.3.1-r0: task do_configure_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1339 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_compile)
NOTE: recipe opkg-utils-0.6.3-r0: task do_install: Succeeded
NOTE: Running task 1341 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3.1-r0: task do_compile: Started
NOTE: recipe openssl-3.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1342 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_configure)
NOTE: recipe openssl-3.3.1-r0: task do_configure: Started
NOTE: recipe zlib-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1343 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_compile_ptest_base)
NOTE: recipe zlib-1.3.1-r0: task do_compile_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1344 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_install)
NOTE: recipe zlib-1.3.1-r0: task do_install: Started
NOTE: recipe expat-2.6.2-r0: task do_configure: Succeeded
NOTE: Running task 1345 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 1346 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_install_ptest_base)
NOTE: recipe attr-2.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1347 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_configure)
NOTE: recipe zlib-1.3.1-r0: task do_install_ptest_base: Started
NOTE: recipe attr-2.5.2-r0: task do_configure: Started
NOTE: recipe zlib-1.3.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1349 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe cracklib-2.9.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzlib-1.14-r0: task do_compile: Succeeded
NOTE: Running task 1350 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_prepare_recipe_sysroot)
NOTE: recipe cracklib-2.9.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.49-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1351 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_configure)
NOTE: recipe cracklib-2.9.11-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.49-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1352 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_configure)
NOTE: recipe libgpg-error-1.49-r0: task do_configure: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_configure: Succeeded
NOTE: Running task 1353 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1354 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1355 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_configure: Succeeded
NOTE: Running task 1356 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_configure)
NOTE: recipe xz-5.4.6-r0: task do_configure: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_package unihash changed to e3055cd044bdc674cf59e2d5b44c4203094f6e3e5d2677e169dc6b8cb9ab2ea2
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx became valid
NOTE: recipe libtirpc-1.3.4-r0: task do_configure: Succeeded
NOTE: Running setscene task 610 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running task 1357 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_configure_ptest_base)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_configure_ptest_base: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 642 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_create_spdx_setscene)
NOTE: recipe expat-2.6.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1358 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_compile)
NOTE: recipe libtool-cross-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_compile: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 643 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_configure: Succeeded
NOTE: Running task 1359 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_configure_ptest_base)
NOTE: recipe gdbm-1.23-r0: task do_configure: Succeeded
NOTE: Running task 1360 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_configure_ptest_base)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_configure_ptest_base: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1361 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_compile)
NOTE: recipe gdbm-1.23-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.23-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1362 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_compile)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: Running task 1364 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_prepare_recipe_sysroot)
NOTE: Setscene tasks completed
NOTE: Running task 1365 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe libseccomp-2.5.5-r0: task do_compile: Started
NOTE: recipe gdbm-1.23-r0: task do_compile: Started
NOTE: recipe ncurses-6.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe libffi-3.4.6-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1366 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1367 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe opkg-utils-0.6.3-r0: task do_package: Started
NOTE: recipe ncurses-6.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1368 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_configure)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe ncurses-6.5-r0: task do_configure: Started
NOTE: recipe attr-2.5.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1369 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_configure_ptest_base)
NOTE: recipe cracklib-2.9.11-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1370 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_compile)
NOTE: recipe attr-2.5.2-r0: task do_configure_ptest_base: Started
NOTE: recipe cracklib-2.9.11-r0: task do_compile: Started
NOTE: recipe attr-2.5.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1371 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_compile)
NOTE: recipe attr-2.5.2-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_package unihash changed to cd4d907e9a1f443291450a691d4f120240859afa7242bfe5f2935e7ea2e1f778
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata became valid
NOTE: Running setscene task 643 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_create_spdx_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_compile: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_compile: Succeeded
NOTE: Running task 1372 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_install)
NOTE: Running task 1373 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_compile)
NOTE: recipe attr-2.5.2-r0: task do_compile: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running task 1374 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_compile_ptest_base)
NOTE: recipe cracklib-2.9.11-r0: task do_install: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1375 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe attr-2.5.2-r0: task do_compile_ptest_base: Started
NOTE: recipe attr-2.5.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1376 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_install)
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe expat-2.6.2-r0: task do_compile: Succeeded
NOTE: Running task 1378 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_compile_ptest_base)
NOTE: Running task 1379 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_compile_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1380 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe attr-2.5.2-r0: task do_install: Started
NOTE: recipe gdbm-1.23-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.6.2-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.6.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1381 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe expat-2.6.2-r0: task do_install: Started
NOTE: recipe gdbm-1.23-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1382 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_install)
NOTE: recipe expat-2.6.2-r0: task do_install: Succeeded
NOTE: Running task 1383 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_compile)
NOTE: recipe gdbm-1.23-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: Running task 1384 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_compile: Started
NOTE: recipe attr-2.5.2-r0: task do_install: Succeeded
NOTE: Running task 1385 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_install_ptest_base)
NOTE: recipe libtirpc-1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 1386 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe attr-2.5.2-r0: task do_install_ptest_base: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_install: Succeeded
NOTE: Running task 1388 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_compile)
NOTE: recipe attr-2.5.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1390 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1392 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libffi-3.4.6-r0: task do_compile: Started
NOTE: recipe libpam-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe acl-2.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_install: Succeeded
NOTE: Running task 1394 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe acl-2.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1395 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_configure)
NOTE: recipe libnsl2-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpam-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1396 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_configure)
NOTE: recipe acl-2.3.2-r0: task do_configure: Started
NOTE: recipe gdbm-1.23-r0: task do_install: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_compile: Succeeded
NOTE: Running task 1397 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_install_ptest_base)
NOTE: Running task 1398 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_compile_ptest_base)
NOTE: recipe libnsl2-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1399 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_configure)
NOTE: recipe libpam-1.6.1-r0: task do_configure: Started
NOTE: recipe openssl-3.3.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1400 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_configure_ptest_base)
NOTE: recipe libseccomp-2.5.5-r0: task do_compile_ptest_base: Started
NOTE: recipe gdbm-1.23-r0: task do_install_ptest_base: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_configure: Started
NOTE: recipe openssl-3.3.1-r0: task do_configure_ptest_base: Started
NOTE: recipe openssl-3.3.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1401 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_compile)
NOTE: recipe gdbm-1.23-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1402 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_install_ptest_base)
NOTE: recipe openssl-3.3.1-r0: task do_compile: Started
NOTE: recipe libffi-3.4.6-r0: task do_compile: Succeeded
NOTE: Running task 1403 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_install)
NOTE: recipe expat-2.6.2-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.6.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1407 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_package)
NOTE: recipe libffi-3.4.6-r0: task do_install: Started
NOTE: recipe zlib-1.3.1-r0: task do_package: Started
NOTE: recipe libgpg-error-1.49-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1408 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_configure_ptest_base)
NOTE: recipe libgpg-error-1.49-r0: task do_configure_ptest_base: Started
NOTE: recipe libgpg-error-1.49-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1409 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_compile)
NOTE: Running task 1410 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_install)
NOTE: recipe libffi-3.4.6-r0: task do_install: Succeeded
NOTE: Running task 1412 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_compile)
NOTE: recipe libseccomp-2.5.5-r0: task do_install: Started
NOTE: recipe libgpg-error-1.49-r0: task do_compile: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_install: Succeeded
NOTE: Running task 1413 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_install_ptest_base)
NOTE: recipe base-passwd-3.6.3-r0: task do_compile: Succeeded
NOTE: Running task 1414 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_install)
NOTE: recipe libseccomp-2.5.5-r0: task do_install_ptest_base: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_install: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_install: Succeeded
NOTE: Running task 1415 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_install)
NOTE: recipe lzlib-1.14-r0: task do_install: Started
NOTE: recipe zlib-1.3.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_package unihash changed to 585763bfc1aafbd29b13e2358276d6fffe0d003f6369388c784ac63cdcee8ed5
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata became valid
NOTE: recipe lzlib-1.14-r0: task do_install: Succeeded
NOTE: Running setscene task 626 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running task 1417 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_install_ptest_base: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1418 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1420 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Setscene tasks completed
NOTE: Running task 1422 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_configure)
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_configure: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1423 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_configure)
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1424 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_configure)
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Started
NOTE: recipe gmp-6.3.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1425 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_compile)
NOTE: recipe gmp-6.3.0-r0: task do_compile: Started
NOTE: recipe xz-5.4.6-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1426 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_configure_ptest_base)
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1427 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_compile)
NOTE: recipe libgpg-error-1.49-r0: task do_compile: Succeeded
NOTE: Running task 1428 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_compile_ptest_base)
NOTE: recipe xz-5.4.6-r0: task do_configure_ptest_base: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_compile: Started
NOTE: recipe xz-5.4.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1429 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_compile)
NOTE: recipe libgpg-error-1.49-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.49-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1430 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_install)
NOTE: recipe xz-5.4.6-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.49-r0: task do_install: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1431 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_compile)
NOTE: recipe libnsl2-2.0.1-r0: task do_compile: Started
NOTE: recipe acl-2.3.2-r0: task do_configure: Succeeded
NOTE: Running task 1432 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_configure_ptest_base)
NOTE: recipe libnsl2-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1433 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_install)
NOTE: recipe acl-2.3.2-r0: task do_configure_ptest_base: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1434 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_compile)
NOTE: recipe acl-2.3.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1435 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_compile)
NOTE: recipe libnsl2-2.0.1-r0: task do_install: Started
NOTE: recipe libgpg-error-1.49-r0: task do_install: Succeeded
NOTE: Running task 1436 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_install_ptest_base)
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Started
NOTE: recipe acl-2.3.2-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.49-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.49-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 1441 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_package)
NOTE: Running task 1443 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package)
NOTE: recipe libtirpc-1.3.4-r0: task do_package: Started
NOTE: recipe attr-2.5.2-r0: task do_package: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1444 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_compile)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_compile: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1445 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_install)
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1446 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_compile_ptest_base)
NOTE: Running task 1448 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_package)
NOTE: recipe acl-2.3.2-r0: task do_compile_ptest_base: Started
NOTE: recipe cracklib-2.9.11-r0: task do_package: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_compile: Succeeded
NOTE: Running task 1449 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_install)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_install: Started
NOTE: recipe acl-2.3.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1450 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_install)
NOTE: recipe xz-5.4.6-r0: task do_compile: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 1451 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_compile_ptest_base)
NOTE: Running task 1452 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_compile)
NOTE: recipe fts-1.2.7-r0: task do_configure: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Started
NOTE: Running task 1453 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_compile)
NOTE: recipe acl-2.3.2-r0: task do_install: Started
NOTE: recipe xz-5.4.6-r0: task do_compile_ptest_base: Started
NOTE: recipe fts-1.2.7-r0: task do_compile: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 1454 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_install)
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_package unihash changed to 6991a76bb5af55daaf13c4463f71e2dbd316d0cf35cd3b3747fe85b9b0dda31d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata became valid
NOTE: recipe fts-1.2.7-r0: task do_compile: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_install: Succeeded
NOTE: Running setscene task 635 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_create_spdx_setscene)
NOTE: Running task 1455 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_install_ptest_base)
NOTE: Running task 1456 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_install)
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Succeeded
NOTE: Running task 1458 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_install: Succeeded
NOTE: Running task 1460 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe libtirpc-1.3.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe acl-2.3.2-r0: task do_install_ptest_base: Started
NOTE: recipe fts-1.2.7-r0: task do_install: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1461 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_configure)
NOTE: recipe acl-2.3.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1463 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_package)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1465 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_package)
NOTE: recipe fts-1.2.7-r0: task do_install: Succeeded
NOTE: recipe sed-4.9-r0: task do_configure: Started
NOTE: Running task 1467 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package)
NOTE: recipe libseccomp-2.5.5-r0: task do_package: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_package: Started
NOTE: recipe attr-2.5.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package unihash changed to 42b07eda44814ed4797e523523314f532c1de46fffa3f84f6d2b33fe2c6c4fdc
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata became valid
NOTE: recipe libnsl2-2.0.1-r0: task do_package: Started
NOTE: Running setscene task 643 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe xz-5.4.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1468 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_install)
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.6-r0: task do_install: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1470 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package)
NOTE: recipe gdbm-1.23-r0: task do_package: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_package unihash changed to 1a4785ef494a2622e95ea257825813cd5d2b30374721aa97c48f6de3a1fad1de
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_create_spdx became valid
NOTE: Running setscene task 643 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_create_spdx_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_package unihash changed to a584b26d47def815a1f768f52e083666b146b95c6b3f562c6619d6b17752b430
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_create_spdx became valid
NOTE: recipe base-passwd-3.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_package: Succeeded
NOTE: Running setscene task 623 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_create_spdx_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package unihash changed to f3355f9fab2506099eb7d4f47840a8b818bb9a6ba738464894a8bb8bdc5a2f56
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_create_spdx became valid
NOTE: recipe cracklib-2.9.11-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 629 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 630 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1472 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_package)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_compile: Succeeded
NOTE: Running task 1473 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_install)
NOTE: recipe expat-2.6.2-r0: task do_package: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1474 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_package)
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1476 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_package)
NOTE: recipe libffi-3.4.6-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package unihash changed to e9991b517e7958f32b304dab5869bed574a05a81715b21924c156d48ce9565e1
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx became valid
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_package: Started
NOTE: Running setscene task 633 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1477 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_install)
NOTE: recipe gmp-6.3.0-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_install: Succeeded
NOTE: Running task 1478 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_install_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_install_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1488 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package)
NOTE: recipe xz-5.4.6-r0: task do_install_ptest_base: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_package: Started
NOTE: Running task 1490 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_package)
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_package: Started
NOTE: Running task 1492 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_package)
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Started
NOTE: recipe gmp-6.3.0-r0: task do_install: Succeeded
NOTE: Running task 1494 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunistring-1.2-r0: task do_configure: Succeeded
NOTE: Running task 1495 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_compile)
NOTE: recipe nettle-3.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.2-r0: task do_compile: Started
NOTE: recipe nettle-3.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1496 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_configure)
NOTE: recipe expat-2.6.2-r0: task do_package: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_package unihash changed to ae15c35351080a0258df026bd1a1d72387217071f66d30c4f3ab825e9710257f
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_create_spdx became valid
NOTE: recipe nettle-3.9.1-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package unihash changed to 7aab294fabaede59dabf79cd420c593e3ebd86aa14d3971ec0e07d92ff15c6d1
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata became valid
NOTE: recipe libffi-3.4.6-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_package unihash changed to 0b191da6bfc464b67d09d230877810043e09f0f71f4dc26adabc081460ad00da
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_create_spdx became valid
NOTE: Running setscene task 633 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 634 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_create_spdx_setscene)
NOTE: Running setscene task 641 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_create_spdx_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 1497 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_configure_ptest_base)
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 642 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 643 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_configure_ptest_base: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_package: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_package unihash changed to c135afcc74c165f17cacb09e68e69e2ce95b11d68885fdf5b332ee8e1228da13
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_packagedata became valid
NOTE: recipe libpam-1.6.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 637 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_create_spdx_setscene)
NOTE: Running task 1498 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_compile)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_compile: Succeeded
NOTE: Running task 1499 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_install)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1500 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package)
NOTE: recipe libpam-1.6.1-r0: task do_compile: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/gdbm/1.23/temp/log.do_packagedata_setscene.3729119
NOTE: recipe libseccomp-2.5.5-r0: task do_package: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running task 1501 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1502 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata)
NOTE: recipe zstd-1.5.6-r0: task do_install: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_package unihash changed to 1985df327b79c91d9c5e842765d5c058b506213acb615bdf208b9efceda6a259
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_create_spdx became valid
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata: Started
NOTE: recipe gmp-6.3.0-r0: task do_package: Started
NOTE: Running setscene task 643 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1506 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_collect_spdx_deps)
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_create_spdx_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_package unihash changed to 5bc1108845efdf6b3b8744ee10da1a2ef1736b13ddb7258c28f2faba05475dc9
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata became valid
NOTE: recipe mpfr-4.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_collect_spdx_deps: Started
NOTE: Running setscene task 638 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 643 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running task 1507 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_configure)
NOTE: recipe libunistring-1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1508 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_collect_spdx_deps)
NOTE: recipe gdbm-1.23-r0: task do_packagedata: Succeeded
NOTE: Running task 1509 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_package)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_configure: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.49-r0: task do_package: Started
NOTE: Running task 1511 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_package)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_package: Started
NOTE: recipe gmp-6.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1512 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_package)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1514 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_package)
NOTE: recipe fts-1.2.7-r0: task do_package: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_package: Started
NOTE: recipe acl-2.3.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package unihash changed to 6ddbb7be08b6a6956945f3054e33b2273dc2a969a84d0ad55166a6064f44094b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata became valid
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1516 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_package)
NOTE: recipe ncurses-6.5-r0: task do_configure: Succeeded
NOTE: Running task 1517 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_compile)
NOTE: recipe argp-standalone-1.4.1-r0: task do_package: Started
NOTE: recipe ncurses-6.5-r0: task do_compile: Started
NOTE: recipe lzlib-1.14-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_package unihash changed to 4cbb419392f40fdcd306ca05be8bb0fbedad86a57fd84f85216a02846cb20ac6
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata became valid
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_package unihash changed to 25a0c71dd134101f0561498a4acaf08e1621fbb904d40f24c310f9df4823538e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata became valid
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1519 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gmp-6.3.0-r0: task do_package: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package unihash changed to c4c60bd2dfe1b44da377262a497e71438e51d321e3ffb680bd21efd20ea0012c
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx became valid
NOTE: recipe unzip-1_6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_package unihash changed to 28807566667f4b410cf0e9420380006f500059dbe092cccde504bd2c3ee064f4
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata became valid
NOTE: recipe unzip-1_6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 625 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 642 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: Running task 1520 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1522 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe nettle-3.9.1-r0: task do_configure: Succeeded
NOTE: Running task 1523 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_configure_ptest_base)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_configure: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_configure_ptest_base: Started
NOTE: recipe unzip-1_6.0-r0: task do_configure: Succeeded
NOTE: Running task 1524 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe nettle-3.9.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1525 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_compile)
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1530 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_collect_spdx_deps)
NOTE: recipe unzip-1_6.0-r0: task do_compile: Started
NOTE: recipe nettle-3.9.1-r0: task do_compile: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1531 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_configure)
NOTE: recipe ncurses-6.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe ncurses-6.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1541 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_collect_spdx_deps)
NOTE: recipe musl-locales-1.0+git-r0: task do_configure: Started
NOTE: recipe xz-5.4.6-r0: task do_package: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1544 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_collect_spdx_deps)
NOTE: recipe argp-standalone-1.4.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_package unihash changed to 75c6b02ff67bdb18f02f140686856c5dec3dbcce89002ec3783edc38c3fe5a79
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_create_spdx became valid
NOTE: recipe libpam-1.6.1-r0: task do_collect_spdx_deps: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_package unihash changed to 1d9a5690d489028c891d608ab9731608b46b10302e5252cbe74df8b17ddc6b81
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata became valid
NOTE: recipe nettle-3.9.1-r0: task do_collect_spdx_deps: Started
NOTE: Running setscene task 630 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_create_spdx_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1550 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_collect_spdx_deps)
NOTE: recipe nettle-3.9.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1554 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_collect_spdx_deps)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_configure: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1555 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_compile)
NOTE: recipe libgpg-error-1.49-r0: task do_package: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_package unihash changed to b37ed0f7db561e4b9a63ca490d6426c67c1bfb21343b54c43965de3a20559198
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_packagedata became valid
NOTE: recipe sqlite3-3_3.45.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_compile: Started
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_compile: Succeeded
NOTE: Running task 1566 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_install)
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe musl-locales-1.0+git-r0: task do_install: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_install: Succeeded
NOTE: Running task 1570 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_package)
NOTE: recipe musl-locales-1.0+git-r0: task do_package: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_package unihash changed to 1b065a74ae445eb8110d56faea3fa741c249ef675a13235e382ffa444bfe85d2
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata became valid
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe nettle-3.9.1-r0: task do_compile: Succeeded
NOTE: Running task 1572 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.9.1-r0: task do_compile_ptest_base: Started
NOTE: recipe unzip-1_6.0-r0: task do_compile: Succeeded
NOTE: Running task 1573 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_install)
NOTE: recipe unzip-1_6.0-r0: task do_install: Started
NOTE: recipe unzip-1_6.0-r0: task do_install: Succeeded
NOTE: Running task 1574 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: recipe ncurses-6.5-r0: task do_compile: Succeeded
NOTE: Running task 1575 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_install)
NOTE: recipe unzip-1_6.0-r0: task do_package: Started
NOTE: recipe ncurses-6.5-r0: task do_install: Started
NOTE: recipe nettle-3.9.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1576 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_install)
NOTE: recipe nettle-3.9.1-r0: task do_install: Started
NOTE: recipe zstd-1.5.6-r0: task do_install: Succeeded
NOTE: Running task 1578 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1579 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1580 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_package)
NOTE: recipe file-5.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.7.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.6-r0: task do_package: Started
NOTE: recipe nettle-3.9.1-r0: task do_install: Succeeded
NOTE: Running task 1581 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_install_ptest_base)
NOTE: recipe file-5.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1582 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_configure)
NOTE: recipe nettle-3.9.1-r0: task do_install_ptest_base: Started
NOTE: recipe file-5.45-r0: task do_configure: Started
NOTE: recipe libarchive-3.7.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1583 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_configure)
NOTE: recipe unzip-1_6.0-r0: task do_package: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_configure: Started
NOTE: recipe mpfr-4.2.1-r0: task do_configure: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_package unihash changed to ab2643313ed7a6b0b67d828fdfb6380b48a4190686c65d27c0494bc566a60ff2
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata became valid
NOTE: Running setscene task 643 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running task 1584 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_compile)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_compile: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe sed-4.9-r0: task do_configure: Succeeded
NOTE: Running task 1586 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_configure_ptest_base)
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1587 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_compile)
NOTE: recipe sed-4.9-r0: task do_compile: Started
NOTE: recipe nettle-3.9.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1589 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_package)
NOTE: recipe nettle-3.9.1-r0: task do_package: Started
NOTE: recipe openssl-3.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1590 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_compile_ptest_base)
NOTE: recipe openssl-3.3.1-r0: task do_compile_ptest_base: Started
NOTE: recipe openssl-3.3.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1591 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_install)
NOTE: recipe openssl-3.3.1-r0: task do_install: Started
NOTE: recipe zstd-1.5.6-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_package unihash changed to b1672d7694f9da409ce97823d9d6c630cccefb1b21580c48d81f3af8664ca1d8
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata became valid
NOTE: Running setscene task 641 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libpam-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1593 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.6.1-r0: task do_compile_ptest_base: Started
NOTE: recipe mpfr-4.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1594 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_install)
NOTE: recipe mpfr-4.2.1-r0: task do_install: Started
NOTE: recipe libpam-1.6.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1595 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_install)
NOTE: recipe libpam-1.6.1-r0: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_compile: Succeeded
NOTE: Running task 1596 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_compile_ptest_base)
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Started
NOTE: recipe mpfr-4.2.1-r0: task do_install: Succeeded
NOTE: Running task 1598 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1599 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_package)
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1600 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_install)
NOTE: recipe mpfr-4.2.1-r0: task do_package: Started
NOTE: recipe libmpc-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_install: Started
NOTE: recipe libmpc-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1601 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_configure)
NOTE: recipe openssl-3.3.1-r0: task do_install: Succeeded
NOTE: Running task 1602 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_install_ptest_base)
NOTE: recipe libmpc-1.3.1-r0: task do_configure: Started
NOTE: recipe openssl-3.3.1-r0: task do_install_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_install: Succeeded
NOTE: Running task 1603 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_install_ptest_base)
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1604 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: recipe mpfr-4.2.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_package unihash changed to 7004da5cda3b37cc788e33a1473ea1ac286258c34fa2e73174bf56c8fc9f10c3
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata became valid
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_package unihash changed to c5fcc5d6fd1702aa44d7582dd4397f17f0b2c92d2d4819eb048c4b189be3b56d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata became valid
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 643 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_create_spdx_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1607 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_package)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_package: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libpam-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 1610 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_install_ptest_base)
NOTE: recipe file-5.45-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1611 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_compile)
NOTE: recipe libpam-1.6.1-r0: task do_install_ptest_base: Started
NOTE: recipe file-5.45-r0: task do_compile: Started
NOTE: recipe libpam-1.6.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1613 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1614 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1615 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_package)
NOTE: recipe libcap-2.70-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpam-1.6.1-r0: task do_package: Started
NOTE: recipe libcap-2.70-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1616 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_configure)
NOTE: recipe shadow-4.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1617 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_configure)
NOTE: recipe libcap-2.70-r0: task do_configure: Started
NOTE: recipe libcap-2.70-r0: task do_configure: Succeeded
NOTE: Running task 1618 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_compile)
NOTE: recipe shadow-4.15.1-r0: task do_configure: Started
NOTE: recipe libcap-2.70-r0: task do_compile: Started
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package unihash changed to f2a3f36602c3447a0a1833414b5b1520d2fa6e82d12351706f2e59a7734dc6a0
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata became valid
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe file-5.45-r0: task do_compile: Succeeded
NOTE: Running task 1620 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_install)
NOTE: recipe file-5.45-r0: task do_install: Started
NOTE: recipe file-5.45-r0: task do_install: Succeeded
NOTE: Running task 1622 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_package)
NOTE: recipe libcap-2.70-r0: task do_compile: Succeeded
NOTE: Running task 1623 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_install)
NOTE: recipe file-5.45-r0: task do_package: Started
NOTE: recipe libcap-2.70-r0: task do_install: Started
NOTE: recipe libmpc-1.3.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1624 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_compile)
NOTE: recipe libmpc-1.3.1-r0: task do_compile: Started
NOTE: recipe libmpc-1.3.1-r0: task do_compile: Succeeded
NOTE: recipe libcap-2.70-r0: task do_install: Succeeded
NOTE: Running task 1626 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1627 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1628 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_install)
NOTE: recipe libgcrypt-1.10.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmpc-1.3.1-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1629 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_configure)
NOTE: recipe coreutils-9.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1630 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_configure)
NOTE: recipe file-5.45-r0: task do_package: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_package unihash changed to d5b061e331ec5d29fda776792d13c537a0108865dda79987e999a59dc2ae0a81
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata became valid
NOTE: recipe coreutils-9.5-r0: task do_configure: Started
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_install: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: Running task 1632 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1633 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_package)
NOTE: recipe gcc-14.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmpc-1.3.1-r0: task do_package: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gcc-14.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1635 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.1.bb:do_configure)
NOTE: recipe gcc-14.1.0-r0: task do_configure: Started
NOTE: recipe ncurses-6.5-r0: task do_install: Succeeded
NOTE: Running task 1637 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1638 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package)
NOTE: Running task 1639 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1640 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libedit-20240517-3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe psmisc-23.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.5-r0: task do_package: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1641 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_configure)
NOTE: recipe psmisc-23.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1642 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_configure)
NOTE: Running task 1643 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_configure)
NOTE: recipe libmpc-1.3.1-r0: task do_package: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_package unihash changed to a45800a898786628cd95a62aad796653253db58ac1e4225915b8f9e55e186fb2
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata became valid
NOTE: recipe psmisc-23.7-r0: task do_configure: Started
NOTE: recipe bash-5.2.21-r0: task do_configure: Started
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-14.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1645 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.1.bb:do_compile)
NOTE: recipe gcc-14.1.0-r0: task do_compile: Started
NOTE: recipe libpam-1.6.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_package unihash changed to 77b91054eebb535adf57c5e4ff02d4dc9b3011ba94c91c82b6171c560049be2d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_create_spdx became valid
NOTE: Running setscene task 637 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_create_spdx_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_configure: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1646 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_compile)
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_compile: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1648 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_package)
NOTE: Running task 1650 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.15.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcap-2.70-r0: task do_package: Started
NOTE: recipe shadow-4.15.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_compile: Succeeded
NOTE: Running task 1651 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_install)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_install: Succeeded
NOTE: Running task 1653 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_package)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_package: Started
NOTE: recipe shadow-4.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1654 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_compile)
NOTE: recipe libcap-2.70-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_package unihash changed to bbc7694b2da9bc37ff732b21f6a3f180a3d32c5bd9132cf17a3d5ce23e8e4bb3
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata became valid
NOTE: recipe shadow-4.15.1-r0: task do_compile: Started
NOTE: Running setscene task 641 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe sqlite3-3_3.45.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_package unihash changed to 97ded6e47cbc6b97f07766e73c5415cd62b99da3f8f0dfc92e38e93de915a36b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata became valid
NOTE: Running setscene task 643 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_create_spdx_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_compile: Succeeded
NOTE: Running task 1656 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_install)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libarchive-3.7.4-r0: task do_install: Succeeded
NOTE: Running task 1660 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_package)
NOTE: recipe libarchive-3.7.4-r0: task do_package: Started
NOTE: recipe shadow-4.15.1-r0: task do_compile: Succeeded
NOTE: Running task 1661 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_install)
NOTE: recipe shadow-4.15.1-r0: task do_install: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_configure: Succeeded
NOTE: Running task 1662 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_compile)
NOTE: recipe libedit-20240517-3.1-r0: task do_compile: Started
NOTE: recipe libarchive-3.7.4-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_package unihash changed to b50c6655a28c25566cedfa03d82382c2eac9d4ae6a15aabe124f89b8dea94815
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_packagedata became valid
NOTE: recipe shadow-4.15.1-r0: task do_install: Succeeded
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_packagedata_setscene)
NOTE: Running task 1663 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_package)
NOTE: Running task 1665 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.15.1-r0: task do_package: Started
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1667 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_configure)
NOTE: recipe libgcrypt-1.10.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1668 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_configure_ptest_base)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1669 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_compile)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_configure: Succeeded
NOTE: Running task 1670 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_compile)
NOTE: recipe libgcrypt-1.10.3-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_compile: Succeeded
NOTE: Running task 1671 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_install)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_install: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_compile: Succeeded
NOTE: Running task 1672 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_install)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_install: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_install: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_install: Succeeded
NOTE: Running task 1674 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-3.12.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.12.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1675 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_configure)
NOTE: recipe ncurses-6.5-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package unihash changed to 7eb77f6d79ae9f6099e993007cd6534de8092e87ddb7438aea13fab752a9340e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata became valid
NOTE: recipe python3-3.12.4-r0: task do_configure: Started
NOTE: Running setscene task 632 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1677 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_package)
NOTE: Running task 1679 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_collect_spdx_deps)
NOTE: recipe libedit-20240517-3.1-r0: task do_package: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_package unihash changed to 72fa5453998f40c8b9560867571c2905f53bfef589f27311318d0f4f6c487732
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_packagedata became valid
NOTE: Running setscene task 643 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_create_spdx_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_package: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_create_spdx_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_package unihash changed to 5afd0e04a766cd03a9fbb877143168c718b5271fdc638566ff0b0c4773e8d009
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_packagedata became valid
NOTE: Running setscene task 637 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 643 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_packagedata_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_packagedata_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_configure: Succeeded
NOTE: Running task 1680 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_configure_ptest_base)
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_configure: Succeeded
NOTE: Running task 1682 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_compile)
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1685 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_package)
NOTE: Running task 1687 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_collect_spdx_deps)
NOTE: recipe bash-5.2.21-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-5.2.21-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1688 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_compile)
NOTE: recipe psmisc-23.7-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_compile: Started
NOTE: recipe psmisc-23.7-r0: task do_compile: Succeeded
NOTE: Running task 1689 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_install)
NOTE: recipe psmisc-23.7-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_package unihash changed to beebbb11991c7680d9436829bf6b96bead1054c9deb0c0280433912fc7b7a9ea
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_create_spdx became valid
NOTE: recipe psmisc-23.7-r0: task do_install: Succeeded
NOTE: Running setscene task 640 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_create_spdx_setscene)
NOTE: Running task 1690 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_package)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libgcrypt-1.10.3-r0: task do_compile: Succeeded
NOTE: Running task 1693 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.10.3-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1694 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_install)
NOTE: recipe libgcrypt-1.10.3-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_install: Succeeded
NOTE: Running task 1695 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.10.3-r0: task do_install_ptest_base: Started
NOTE: recipe psmisc-23.7-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_package unihash changed to 95af493d382417fd28ee968dd3e41ce6e5ed744f53e8b5122130d7ed96062da5
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_package_write_ipk became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_package_write_deb became valid
NOTE: Running setscene task 641 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 642 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_package_write_ipk_setscene)
NOTE: recipe bash-5.2.21-r0: task do_compile: Succeeded
NOTE: Running task 1696 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_compile_ptest_base)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.21-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1698 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_package)
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_package: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1702 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_package_write_rpm)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_rpm: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_package_write_rpm unihash changed to 65813a42edad666a6eb78c22c22a7931e164e3058cb45e9ff165cc6a5cfbdec4
NOTE: recipe libunistring-1.2-r0: task do_compile: Succeeded
NOTE: Running task 1703 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_install)
NOTE: recipe libunistring-1.2-r0: task do_install: Started
NOTE: recipe libunistring-1.2-r0: task do_install: Succeeded
NOTE: Running task 1705 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1706 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_package)
NOTE: recipe libidn2-2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.2-r0: task do_package: Started
NOTE: recipe libidn2-2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1707 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_configure)
NOTE: recipe libidn2-2.3.7-r0: task do_configure: Started
NOTE: recipe bash-5.2.21-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_package: Succeeded
NOTE: Running task 1708 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_install)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_package unihash changed to 4f5e03e7f077cd9ee0be48e74e71eab6a593f10dc65bd8f886c9c6eb2a9b4575
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata became valid
NOTE: recipe bash-5.2.21-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_package: Succeeded
NOTE: Running setscene task 634 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_create_spdx_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_package unihash changed to 1a8a771d04b2c764bb55f4ae96fda2d18282740f29fefc39aeeca41b691b7864
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata became valid
NOTE: Running setscene task 643 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1712 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_collect_spdx_deps)
NOTE: recipe python3-3.12.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-3.12.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_package unihash changed to 5e611aa3bd4d8954c1d0d9c420aca8f63599cf0b243131b68386cb09702fa2fc
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata became valid
NOTE: Running setscene task 643 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_create_spdx_setscene)
NOTE: recipe libunistring-1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1715 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_collect_spdx_deps)
NOTE: recipe libidn2-2.3.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe libidn2-2.3.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_install: Succeeded
NOTE: Running task 1716 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_install_ptest_base)
NOTE: recipe bash-5.2.21-r0: task do_install_ptest_base: Started
NOTE: recipe bash-5.2.21-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1717 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package)
NOTE: recipe bash-5.2.21-r0: task do_package: Started
NOTE: recipe coreutils-9.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1718 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.5-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1719 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_compile)
NOTE: recipe coreutils-9.5-r0: task do_compile: Started
NOTE: recipe bash-5.2.21-r0: task do_package: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_configure: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package unihash changed to 428a896350e6a7dcb54b982de8730a8d1873b40be4192f09acb1ed17ca29b7ea
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata became valid
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: Running task 1720 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_configure_ptest_base)
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.12.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1721 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_compile)
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-3.12.4-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1723 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_compile)
NOTE: recipe libidn2-2.3.7-r0: task do_compile: Started
NOTE: recipe coreutils-9.5-r0: task do_compile: Succeeded
NOTE: Running task 1724 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.5-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1725 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_install)
NOTE: recipe coreutils-9.5-r0: task do_install: Started
NOTE: recipe libidn2-2.3.7-r0: task do_compile: Succeeded
NOTE: Running task 1726 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_install)
NOTE: recipe libidn2-2.3.7-r0: task do_install: Started
NOTE: recipe coreutils-9.5-r0: task do_install: Succeeded
NOTE: Running task 1727 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.5-r0: task do_install_ptest_base: Started
NOTE: recipe libidn2-2.3.7-r0: task do_install: Succeeded
NOTE: Running task 1729 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1730 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1731 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_package)
NOTE: recipe curl-8.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.8.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.7-r0: task do_package: Started
NOTE: recipe curl-8.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1732 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_configure)
NOTE: recipe curl-8.8.0-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1733 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_configure)
NOTE: recipe gnutls-3.8.6-r0: task do_configure: Started
NOTE: recipe coreutils-9.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1734 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_package)
NOTE: recipe coreutils-9.5-r0: task do_package: Started
NOTE: recipe libidn2-2.3.7-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_package unihash changed to 0443e6d2cd81280ef32e594810b6391310f0c2d419b3f7c40a9de6769800b8ff
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_create_spdx became valid
NOTE: Running setscene task 635 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_create_spdx_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1737 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_collect_spdx_deps)
NOTE: recipe gnutls-3.8.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnutls-3.8.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_compile: Succeeded
NOTE: Running task 1738 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_compile_ptest_base)
NOTE: recipe python3-3.12.4-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-3.12.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1739 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_install)
NOTE: recipe python3-3.12.4-r0: task do_install: Started
NOTE: recipe coreutils-9.5-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_package unihash changed to 59c6793470e1a5a31fad428da19a1fb33e607772a5ed72dd56e5f15c9fe0ad35
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata became valid
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe curl-8.8.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1741 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_configure_ptest_base)
NOTE: recipe curl-8.8.0-r0: task do_configure_ptest_base: Started
NOTE: recipe curl-8.8.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1742 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_compile)
NOTE: recipe curl-8.8.0-r0: task do_compile: Started
NOTE: recipe curl-8.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1743 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_compile_ptest_base)
NOTE: recipe curl-8.8.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gnutls-3.8.6-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1744 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_configure_ptest_base)
NOTE: recipe gnutls-3.8.6-r0: task do_configure_ptest_base: Started
NOTE: recipe gnutls-3.8.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1745 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_compile)
NOTE: recipe gnutls-3.8.6-r0: task do_compile: Started
NOTE: recipe python3-3.12.4-r0: task do_install: Succeeded
NOTE: Running task 1746 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_install_ptest_base)
NOTE: recipe python3-3.12.4-r0: task do_install_ptest_base: Started
NOTE: recipe python3-3.12.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1747 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_package)
NOTE: recipe python3-3.12.4-r0: task do_package: Started
NOTE: recipe curl-8.8.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1748 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_install)
NOTE: recipe curl-8.8.0-r0: task do_install: Started
NOTE: recipe curl-8.8.0-r0: task do_install: Succeeded
NOTE: Running task 1749 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_install_ptest_base)
NOTE: recipe curl-8.8.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-3.12.4-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_package unihash changed to 97013146a4316568cea900f8b2ca30d7055362c5ce2b873f22a9f5388c5d7cfd
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_create_spdx became valid
NOTE: Running setscene task 639 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.12.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe curl-8.8.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1753 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_package)
NOTE: recipe curl-8.8.0-r0: task do_package: Started
NOTE: recipe gnutls-3.8.6-r0: task do_compile: Succeeded
NOTE: Running task 1754 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_compile_ptest_base)
NOTE: recipe gnutls-3.8.6-r0: task do_compile_ptest_base: Started
NOTE: recipe gnutls-3.8.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1755 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_install)
NOTE: recipe gnutls-3.8.6-r0: task do_install: Started
NOTE: recipe curl-8.8.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_package unihash changed to 1b9aa21da4de786a93b1eb3a6cda67f4fc6ffa093a0be0337c585d292f5fa210
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_packagedata became valid
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_packagedata_setscene)
NOTE: recipe curl-8.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gnutls-3.8.6-r0: task do_install: Succeeded
NOTE: Running task 1757 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_install_ptest_base)
NOTE: recipe gnutls-3.8.6-r0: task do_install_ptest_base: Started
NOTE: recipe gnutls-3.8.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1758 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_populate_sysroot)
NOTE: Running task 1759 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_package)
NOTE: recipe gnutls-3.8.6-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.8.6-r0: task do_package: Started
NOTE: recipe gnutls-3.8.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1760 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1761 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_configure)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.6-r0: task do_package: Succeeded
NOTE: Running task 1762 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_packagedata)
NOTE: recipe gnutls-3.8.6-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.8.6-r0: task do_packagedata: Succeeded
NOTE: Running task 1763 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_create_spdx)
NOTE: Running task 1764 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_package_write_ipk)
NOTE: Running task 1765 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_package_write_deb)
NOTE: Running task 1766 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_package_write_rpm)
NOTE: Running task 1767 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_package_qa)
NOTE: recipe gnutls-3.8.6-r0: task do_create_spdx: Started
NOTE: recipe gnutls-3.8.6-r0: task do_package_write_ipk: Started
NOTE: recipe gnutls-3.8.6-r0: task do_package_write_rpm: Started
NOTE: recipe gnutls-3.8.6-r0: task do_package_write_deb: Started
NOTE: recipe gnutls-3.8.6-r0: task do_package_qa: Started
NOTE: recipe gnutls-3.8.6-r0: task do_package_write_ipk: Succeeded
NOTE: recipe gnutls-3.8.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 1768 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_create_runtime_spdx)
NOTE: recipe gnutls-3.8.6-r0: task do_create_runtime_spdx: Started
NOTE: recipe gnutls-3.8.6-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gnutls-3.8.6-r0: task do_package_qa: Succeeded
NOTE: recipe gnutls-3.8.6-r0: task do_package_write_deb: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1769 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_compile)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_compile: Started
NOTE: recipe gnutls-3.8.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1770 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_install)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_install: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_install: Succeeded
NOTE: Running task 1771 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_populate_sysroot)
NOTE: Running task 1772 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_package)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_package: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1773 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.191-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.191-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1774 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_configure)
NOTE: recipe elfutils-0.191-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_package: Succeeded
NOTE: Running task 1775 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_configure: Succeeded
NOTE: Running task 1776 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.191-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.191-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1777 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_compile)
NOTE: recipe elfutils-0.191-r0: task do_compile: Started
NOTE: recipe elfutils-0.191-r0: task do_compile: Succeeded
NOTE: Running task 1778 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.191-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.191-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1779 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_install)
NOTE: recipe elfutils-0.191-r0: task do_install: Started
NOTE: recipe elfutils-0.191-r0: task do_install: Succeeded
NOTE: Running task 1780 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.191-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.191-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1781 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_populate_sysroot)
NOTE: Running task 1782 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_package)
NOTE: recipe elfutils-0.191-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.191-r0: task do_package: Started
NOTE: recipe elfutils-0.191-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1783 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.42.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.42-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.42-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1784 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.42.bb:do_configure)
NOTE: recipe binutils-2.42-r0: task do_configure: Started
NOTE: recipe binutils-2.42-r0: task do_configure: Succeeded
NOTE: Running task 1785 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.42.bb:do_compile)
NOTE: recipe binutils-2.42-r0: task do_compile: Started
NOTE: recipe elfutils-0.191-r0: task do_package: Succeeded
NOTE: Running task 1786 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_packagedata)
NOTE: recipe elfutils-0.191-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.191-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_packagedata unihash changed to bed3028c69c1de74e1bb74b8cdff5acfb28fcbf47bb90b50af973fe2c50b633f
NOTE: Setscene tasks completed
NOTE: recipe gcc-14.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1787 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.1.bb:do_install)
NOTE: recipe gcc-14.1.0-r0: task do_install: Started
NOTE: recipe gcc-14.1.0-r0: task do_install: Succeeded
NOTE: Running task 1788 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.1.bb:do_package)
NOTE: recipe gcc-14.1.0-r0: task do_package: Started
NOTE: recipe binutils-2.42-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1789 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.42.bb:do_install)
NOTE: recipe binutils-2.42-r0: task do_install: Started
NOTE: recipe gcc-14.1.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.1.bb:do_package unihash changed to ad02cae6b0a6a378e84fbf54628ecdbf57326854dfd33faeee283009782bb120
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.1.bb:do_packagedata became valid
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe binutils-2.42-r0: task do_install: Succeeded
NOTE: Running task 1791 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.42.bb:do_package)
NOTE: recipe binutils-2.42-r0: task do_package: Started
NOTE: recipe binutils-2.42-r0: task do_package: Succeeded
NOTE: Running task 1792 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.42.bb:do_packagedata)
NOTE: recipe binutils-2.42-r0: task do_packagedata: Started
NOTE: recipe binutils-2.42-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.42.bb:do_packagedata unihash changed to 88b23d0fa41c83a983db2b35b6806c37bbf8188abf80f583916754503c9f7aad
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_package_write_ipk became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_package_write_deb became valid
NOTE: Running setscene task 642 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 643 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_package_write_ipk_setscene)
NOTE: Running task 1793 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_package_write_rpm)
NOTE: recipe python3-3.12.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-3.12.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-3.12.4-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_package_write_rpm unihash changed to ef13ffefd2a8237ac474a8cb4d38698d5cfa1ed77e18a5c0a537c292a993a076
NOTE: Running noexec task 1796 of 1796 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_build)
NOTE: Tasks Summary: Attempted 1796 tasks of which 1200 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 24 ERROR messages, returning a non-zero exit code.
ERROR: gdbm-1.23-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-src went backwards which would break package feeds (from 0:1.24-r0 to 0:1.23-r0) [version-going-backwards]
ERROR: gdbm-1.23-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-dbg went backwards which would break package feeds (from 0:1.24-r0 to 0:1.23-r0) [version-going-backwards]
ERROR: gdbm-1.23-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-compat went backwards which would break package feeds (from 0:1.24-r0 to 0:1.23-r0) [version-going-backwards]
ERROR: gdbm-1.23-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-ptest went backwards which would break package feeds (from 0:1.24-r0 to 0:1.23-r0) [version-going-backwards]
ERROR: gdbm-1.23-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-staticdev went backwards which would break package feeds (from 0:1.24-r0 to 0:1.23-r0) [version-going-backwards]
ERROR: gdbm-1.23-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-dev went backwards which would break package feeds (from 0:1.24-r0 to 0:1.23-r0) [version-going-backwards]
ERROR: gdbm-1.23-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-doc went backwards which would break package feeds (from 0:1.24-r0 to 0:1.23-r0) [version-going-backwards]
ERROR: gdbm-1.23-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-da went backwards which would break package feeds (from 0:1.24-r0 to 0:1.23-r0) [version-going-backwards]
ERROR: gdbm-1.23-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-de went backwards which would break package feeds (from 0:1.24-r0 to 0:1.23-r0) [version-going-backwards]
ERROR: gdbm-1.23-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-eo went backwards which would break package feeds (from 0:1.24-r0 to 0:1.23-r0) [version-going-backwards]
ERROR: gdbm-1.23-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-es went backwards which would break package feeds (from 0:1.24-r0 to 0:1.23-r0) [version-going-backwards]
ERROR: gdbm-1.23-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-fi went backwards which would break package feeds (from 0:1.24-r0 to 0:1.23-r0) [version-going-backwards]
ERROR: gdbm-1.23-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-fr went backwards which would break package feeds (from 0:1.24-r0 to 0:1.23-r0) [version-going-backwards]
ERROR: gdbm-1.23-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-ja went backwards which would break package feeds (from 0:1.24-r0 to 0:1.23-r0) [version-going-backwards]
ERROR: gdbm-1.23-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-pl went backwards which would break package feeds (from 0:1.24-r0 to 0:1.23-r0) [version-going-backwards]
ERROR: gdbm-1.23-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-pt-br went backwards which would break package feeds (from 0:1.24-r0 to 0:1.23-r0) [version-going-backwards]
ERROR: gdbm-1.23-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-ru went backwards which would break package feeds (from 0:1.24-r0 to 0:1.23-r0) [version-going-backwards]
ERROR: gdbm-1.23-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-sr went backwards which would break package feeds (from 0:1.24-r0 to 0:1.23-r0) [version-going-backwards]
ERROR: gdbm-1.23-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-sv went backwards which would break package feeds (from 0:1.24-r0 to 0:1.23-r0) [version-going-backwards]
ERROR: gdbm-1.23-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-uk went backwards which would break package feeds (from 0:1.24-r0 to 0:1.23-r0) [version-going-backwards]
ERROR: gdbm-1.23-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-locale-vi went backwards which would break package feeds (from 0:1.24-r0 to 0:1.23-r0) [version-going-backwards]
ERROR: gdbm-1.23-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm-bin went backwards which would break package feeds (from 0:1.24-r0 to 0:1.23-r0) [version-going-backwards]
ERROR: gdbm-1.23-r0 do_packagedata_setscene: QA Issue: Package version for package gdbm went backwards which would break package feeds (from 0:1.24-r0 to 0:1.23-r0) [version-going-backwards]
ERROR: gdbm-1.23-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3135968035885392514==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gnutls-upgrade-3.8.5-3.8.6.patch"

RnJvbSBiNDY1MDk2ODczNDlkNmJkZDQ5MmFiODhhMjEyZDE5ZWI0MDJmYmFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTg6NDk6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bnV0bHM6IHVwZ3JhZGUgMy44LjUgLT4gMy44LjYKCi0tLQogLi4uaWxlLXNob3VsZC1iZS1leGN1
dGVkLWluLXRhcmdldC1lbnZpLnBhdGNoIHwgICAyICstCiAuLi5QS0NTMS12MV81LXN5c3RlbS13
aWRlLWNvbmZpZ3VyYXRpb24ucGF0Y2ggfCAyNjkgLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4vZ251
dGxzL2dudXRscy9BZGQtcHRlc3Qtc3VwcG9ydC5wYXRjaCAgICAgfCAgMTAgKy0KIC4uLi9nbnV0
bHMvZ251dGxzL2FybV9lYWJpLnBhdGNoICAgICAgICAgICAgICB8ICAgMiArLQogLi4uL3tnbnV0
bHNfMy44LjUuYmIgPT4gZ251dGxzXzMuOC42LmJifSAgICAgIHwgICAzICstCiA1IGZpbGVzIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMjc4IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAw
NjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9nbnV0bHMvMDAwMS1GaXgtUlNBRVMtUEtD
UzEtdjFfNS1zeXN0ZW0td2lkZS1jb25maWd1cmF0aW9uLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZ251dGxzL3tnbnV0bHNfMy44LjUuYmIgPT4gZ251dGxzXzMuOC42LmJifSAo
OTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9nbnV0bHMvMDAw
MS1DcmVhdGluZy0uaG1hYy1maWxlLXNob3VsZC1iZS1leGN1dGVkLWluLXRhcmdldC1lbnZpLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRscy8wMDAxLUNyZWF0aW5nLS5o
bWFjLWZpbGUtc2hvdWxkLWJlLWV4Y3V0ZWQtaW4tdGFyZ2V0LWVudmkucGF0Y2gKaW5kZXggZDEz
YmZlZThlZi4uNTk4MjRkMzVmMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251
dGxzL2dudXRscy8wMDAxLUNyZWF0aW5nLS5obWFjLWZpbGUtc2hvdWxkLWJlLWV4Y3V0ZWQtaW4t
dGFyZ2V0LWVudmkucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRs
cy8wMDAxLUNyZWF0aW5nLS5obWFjLWZpbGUtc2hvdWxkLWJlLWV4Y3V0ZWQtaW4tdGFyZ2V0LWVu
dmkucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDdiZThlYzU5YTUzZTkzYzJiZDQ1M2IzYmEy
ZDYzZDFiMzAwZWYxMWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGM0ZjZjYjM4MDQ3
MWI1ZTU0NzhhZTZmN2Y4YzU2MDRhNmE2NGVjMWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBMZWkgTWFvaHVpIDxsZWltYW9odWlAZnVqaXRzdS5jb20+CiBEYXRlOiBNb24sIDIzIE1h
eSAyMDIyIDEwOjQ0OjQzICswOTAwCiBTdWJqZWN0OiBbUEFUQ0hdIENyZWF0aW5nIC5obWFjIGZp
bGUgc2hvdWxkIGJlIGV4Y3V0ZWQgaW4gdGFyZ2V0IGVudmlyb25tZW50LApkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRscy8wMDAxLUZpeC1SU0FFUy1QS0NTMS12
MV81LXN5c3RlbS13aWRlLWNvbmZpZ3VyYXRpb24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9nbnV0bHMvZ251dGxzLzAwMDEtRml4LVJTQUVTLVBLQ1MxLXYxXzUtc3lzdGVtLXdpZGUtY29u
ZmlndXJhdGlvbi5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggY2MzOWY1Yzlh
NS4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvZ251dGxzLzAw
MDEtRml4LVJTQUVTLVBLQ1MxLXYxXzUtc3lzdGVtLXdpZGUtY29uZmlndXJhdGlvbi5wYXRjaAor
KysgL2Rldi9udWxsCkBAIC0xLDI2OSArMCwwIEBACi1Gcm9tIDJkNzNkOTQ1YzRiMWRmY2Y4ZDIz
MjhjNGQyMzE4N2Q2MmZmYWFiMmQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBab2x0
YW4gRnJpZHJpY2ggPHpmcmlkcmljQHJlZGhhdC5jb20+Ci1EYXRlOiBXZWQsIDEwIEFwciAyMDI0
IDEyOjUxOjMzICswMjAwCi1TdWJqZWN0OiBbUEFUQ0hdIEZpeCBSU0FFUy1QS0NTMS12MV81IHN5
c3RlbS13aWRlIGNvbmZpZ3VyYXRpb24KLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbZXhw
ZWN0ZWQgZm9yICAzLjguNiBodHRwczovL2dpdGxhYi5jb20vZ251dGxzL2dudXRscy8tL21lcmdl
X3JlcXVlc3RzLzE4MzA/Y29tbWl0X2lkPTJkNzNkOTQ1YzRiMWRmY2Y4ZDIzMjhjNGQyMzE4N2Q2
MmZmYWFiMmRdCi0KLVNpZ25lZC1vZmYtYnk6IFNpbW9uZSBXZWnDnyA8c2ltb25lLnAud2Vpc3NA
cG9zdGVvLmNvbT4KLVNpZ25lZC1vZmYtYnk6IFpvbHRhbiBGcmlkcmljaCA8emZyaWRyaWNAcmVk
aGF0LmNvbT4KLS0tLQotIGxpYi9wcmlvcml0eS5jICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8IDEyNSArKysrKysrKysrKy0tLS0tLS0KLSAuLi5zeXN0ZW0tb3ZlcnJpZGUtYWxsb3ct
cnNhLXBrY3MxLWVuY3J5cHQuc2ggfCAgMjcgKysrLQotIDIgZmlsZXMgY2hhbmdlZCwgOTYgaW5z
ZXJ0aW9ucygrKSwgNTYgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9saWIvcHJpb3JpdHku
YyBiL2xpYi9wcmlvcml0eS5jCi1pbmRleCA4YWJlMDBkMWZmLi4zNDM0NjE5YWFkIDEwMDY0NAot
LS0tIGEvbGliL3ByaW9yaXR5LmMKLSsrKyBiL2xpYi9wcmlvcml0eS5jCi1AQCAtMTAxOCw2ICsx
MDE4LDEyIEBAIHN0cnVjdCBjZmcgewotIAlib29sIGZvcmNlX2V4dF9tYXN0ZXJfc2VjcmV0X3Nl
dDsKLSB9OwotIAotK3N0YXRpYyBpbmxpbmUgdm9pZCBjZmdfaW5pdChzdHJ1Y3QgY2ZnICpjZmcp
Ci0rewotKwltZW1zZXQoY2ZnLCAwLCBzaXplb2YoKmNmZykpOwotKwljZmctPmFsbG93X3JzYV9w
a2NzMV9lbmNyeXB0ID0gdHJ1ZTsKLSt9Ci0rCi0gc3RhdGljIGlubGluZSB2b2lkIGNmZ19kZWlu
aXQoc3RydWN0IGNmZyAqY2ZnKQotIHsKLSAJaWYgKGNmZy0+cHJpb3JpdHlfc3RyaW5ncykgewot
QEAgLTEwOTUsNiArMTEwMSwxMiBAQCBzdHJ1Y3QgaW5pX2N0eCB7Ci0gCXNpemVfdCBjdXJ2ZXNf
c2l6ZTsKLSB9OwotIAotK3N0YXRpYyBpbmxpbmUgdm9pZCBpbmlfY3R4X2luaXQoc3RydWN0IGlu
aV9jdHggKmN0eCkKLSt7Ci0rCW1lbXNldChjdHgsIDAsIHNpemVvZigqY3R4KSk7Ci0rCWNmZ19p
bml0KCZjdHgtPmNmZyk7Ci0rfQotKwotIHN0YXRpYyBpbmxpbmUgdm9pZCBpbmlfY3R4X2RlaW5p
dChzdHJ1Y3QgaW5pX2N0eCAqY3R4KQotIHsKLSAJY2ZnX2RlaW5pdCgmY3R4LT5jZmcpOwotQEAg
LTE0MjMsOSArMTQzNSw2IEBAIHN0YXRpYyBpbmxpbmUgaW50IGNmZ19hcHBseShzdHJ1Y3QgY2Zn
ICpjZmcsIHN0cnVjdCBpbmlfY3R4ICpjdHgpCi0gCQlfZ251dGxzX2RlZmF1bHRfcHJpb3JpdHlf
c3RyaW5nID0gY2ZnLT5kZWZhdWx0X3ByaW9yaXR5X3N0cmluZzsKLSAJfQotIAotLQkvKiBlbmFi
bGUgUlNBLVBLQ1MxLVYxXzUgYnkgZGVmYXVsdCAqLwotLQljZmctPmFsbG93X3JzYV9wa2NzMV9l
bmNyeXB0ID0gdHJ1ZTsKLS0KLSAJaWYgKGNmZy0+YWxsb3dsaXN0aW5nKSB7Ci0gCQkvKiBhbHNv
IHVwZGF0ZXMgYGZsYWdzYCBvZiBnbG9iYWwgYGhhc2hfYWxnb3JpdGhtc1tdYCAqLwotIAkJcmV0
ID0gY2ZnX2hhc2hlc19zZXRfYXJyYXkoY2ZnLCBjdHgtPmhhc2hlcywgY3R4LT5oYXNoZXNfc2l6
ZSk7Ci1AQCAtMjIxNywyMiArMjIyNiw3MyBAQCB1cGRhdGVfc3lzdGVtX3dpZGVfcHJpb3JpdHlf
c3RyaW5nKHZvaWQpCi0gCXJldHVybiAwOwotIH0KLSAKLSsvKiBSZXR1cm5zIGZhbHNlIG9uIHBh
cnNlIGVycm9yLCBvdGhlcndpc2UgdHJ1ZS4KLSsgKiBUaGUgc3lzdGVtX3dpZGVfY29uZmlnIG11
c3QgYmUgbG9ja2VkIGZvciB3cml0aW5nLgotKyAqLwotK3N0YXRpYyBpbmxpbmUgYm9vbCBsb2Fk
X3N5c3RlbV9wcmlvcml0eV9maWxlKHZvaWQpCi0rewotKwlpbnQgZXJyOwotKwlGSUxFICpmcDsK
LSsJc3RydWN0IGluaV9jdHggY3R4OwotKwotKwljZmdfaW5pdCgmc3lzdGVtX3dpZGVfY29uZmln
KTsKLSsKLSsJZnAgPSBmb3BlbihzeXN0ZW1fcHJpb3JpdHlfZmlsZSwgInJlIik7Ci0rCWlmIChm
cCA9PSBOVUxMKSB7Ci0rCQlfZ251dGxzX2RlYnVnX2xvZygiY2ZnOiB1bmFibGUgdG8gb3Blbjog
JXM6ICVkXG4iLAotKwkJCQkgIHN5c3RlbV9wcmlvcml0eV9maWxlLCBlcnJubyk7Ci0rCQlyZXR1
cm4gdHJ1ZTsKLSsJfQotKwotKwkvKiBQYXJzaW5nIHRoZSBjb25maWd1cmF0aW9uIGZpbGUgbmVl
ZHMgdG8gYmUgZG9uZSBpbiAyIHBoYXNlczoKLSsJICogZmlyc3QgcGFyc2luZyB0aGUgW2dsb2Jh
bF0gc2VjdGlvbgotKwkgKiBhbmQgdGhlbiB0aGUgb3RoZXIgc2VjdGlvbnMsCi0rCSAqIGJlY2F1
c2UgdGhlIFtnbG9iYWxdIHNlY3Rpb24gbW9kaWZpZXMgdGhlIHBhcnNpbmcgYmVoYXZpb3IuCi0r
CSAqLwotKwlpbmlfY3R4X2luaXQoJmN0eCk7Ci0rCWVyciA9IGluaV9wYXJzZV9maWxlKGZwLCBn
bG9iYWxfaW5pX2hhbmRsZXIsICZjdHgpOwotKwlpZiAoIWVycikgewotKwkJaWYgKGZzZWVrKGZw
LCAwTCwgU0VFS19TRVQpIDwgMCkgewotKwkJCV9nbnV0bHNfZGVidWdfbG9nKCJjZmc6IHVuYWJs
ZSB0byByZXdpbmQ6ICVzXG4iLAotKwkJCQkJICBzeXN0ZW1fcHJpb3JpdHlfZmlsZSk7Ci0rCQkJ
aWYgKGZhaWxfb25faW52YWxpZF9jb25maWcpCi0rCQkJCWV4aXQoMSk7Ci0rCQl9Ci0rCQllcnIg
PSBpbmlfcGFyc2VfZmlsZShmcCwgY2ZnX2luaV9oYW5kbGVyLCAmY3R4KTsKLSsJfQotKwlmY2xv
c2UoZnApOwotKwlpZiAoZXJyKSB7Ci0rCQlpbmlfY3R4X2RlaW5pdCgmY3R4KTsKLSsJCV9nbnV0
bHNfZGVidWdfbG9nKCJjZmc6IHVuYWJsZSB0byBwYXJzZTogJXM6ICVkXG4iLAotKwkJCQkgIHN5
c3RlbV9wcmlvcml0eV9maWxlLCBlcnIpOwotKwkJcmV0dXJuIGZhbHNlOwotKwl9Ci0rCWNmZ19h
cHBseSgmc3lzdGVtX3dpZGVfY29uZmlnLCAmY3R4KTsKLSsJaW5pX2N0eF9kZWluaXQoJmN0eCk7
Ci0rCXJldHVybiB0cnVlOwotK30KLSsKLSBzdGF0aWMgaW50IF9nbnV0bHNfdXBkYXRlX3N5c3Rl
bV9wcmlvcml0aWVzKGJvb2wgZGVmZXJfc3lzdGVtX3dpZGUpCi0gewotLQlpbnQgcmV0LCBlcnIg
PSAwOwotKwlpbnQgcmV0OwotKwlib29sIGNvbmZpZ19wYXJzZV9lcnJvciA9IGZhbHNlOwotIAlz
dHJ1Y3Qgc3RhdCBzYjsKLS0JRklMRSAqZnA7Ci0gCWdudXRsc19idWZmZXJfc3QgYnVmOwotLQlz
dHJ1Y3QgaW5pX2N0eCBjdHg7Ci0gCi0gCXJldCA9IGdudXRsc19yd2xvY2tfcmRsb2NrKCZzeXN0
ZW1fd2lkZV9jb25maWdfcndsb2NrKTsKLS0JaWYgKHJldCA8IDApIHsKLSsJaWYgKHJldCA8IDAp
Ci0gCQlyZXR1cm4gZ251dGxzX2Fzc2VydF92YWwocmV0KTsKLS0JfQotIAotIAlpZiAoc3RhdChz
eXN0ZW1fcHJpb3JpdHlfZmlsZSwgJnNiKSA8IDApIHsKLSAJCV9nbnV0bHNfZGVidWdfbG9nKCJj
Zmc6IHVuYWJsZSB0byBhY2Nlc3M6ICVzOiAlZFxuIiwKLSAJCQkJICBzeXN0ZW1fcHJpb3JpdHlf
ZmlsZSwgZXJybm8pOwotKwotKwkJKHZvaWQpZ251dGxzX3J3bG9ja191bmxvY2soJnN5c3RlbV93
aWRlX2NvbmZpZ19yd2xvY2spOwotKwkJcmV0ID0gZ251dGxzX3J3bG9ja193cmxvY2soJnN5c3Rl
bV93aWRlX2NvbmZpZ19yd2xvY2spOwotKwkJaWYgKHJldCA8IDApCi0rCQkJZ290byBvdXQ7Ci0r
CQkvKiBJZiBzeXN0ZW0td2lkZSBjb25maWcgaXMgdW5hdmFpbGFibGUsIGFwcGx5IHRoZSBkZWZh
dWx0cyAqLwotKwkJY2ZnX2luaXQoJnN5c3RlbV93aWRlX2NvbmZpZyk7Ci0gCQlnb3RvIG91dDsK
LSAJfQotIAotQEAgLTIyNDAsNjMgKzIzMDAsMjcgQEAgc3RhdGljIGludCBfZ251dGxzX3VwZGF0
ZV9zeXN0ZW1fcHJpb3JpdGllcyhib29sIGRlZmVyX3N5c3RlbV93aWRlKQotIAkgICAgc3lzdGVt
X3ByaW9yaXR5X2xhc3RfbW9kID09IHNiLnN0X210aW1lKSB7Ci0gCQlfZ251dGxzX2RlYnVnX2xv
ZygiY2ZnOiBzeXN0ZW0gcHJpb3JpdHkgJXMgaGFzIG5vdCBjaGFuZ2VkXG4iLAotIAkJCQkgIHN5
c3RlbV9wcmlvcml0eV9maWxlKTsKLS0JCWlmIChzeXN0ZW1fd2lkZV9jb25maWcucHJpb3JpdHlf
c3RyaW5nKSB7Ci0rCQlpZiAoc3lzdGVtX3dpZGVfY29uZmlnLnByaW9yaXR5X3N0cmluZykKLSAJ
CQlnb3RvIG91dDsgLyogbm90aGluZyB0byBkbyAqLwotLQkJfQotIAl9Ci0gCi0gCSh2b2lkKWdu
dXRsc19yd2xvY2tfdW5sb2NrKCZzeXN0ZW1fd2lkZV9jb25maWdfcndsb2NrKTsKLSAKLSAJcmV0
ID0gZ251dGxzX3J3bG9ja193cmxvY2soJnN5c3RlbV93aWRlX2NvbmZpZ19yd2xvY2spOwotLQlp
ZiAocmV0IDwgMCkgewotKwlpZiAocmV0IDwgMCkKLSAJCXJldHVybiBnbnV0bHNfYXNzZXJ0X3Zh
bChyZXQpOwotLQl9Ci0gCi0gCS8qIEFub3RoZXIgdGhyZWFkIGNvdWxkIGhhdmUgc3VjY2Vzc2Z1
bGx5IHJlLXJlYWQgc3lzdGVtLXdpZGUgY29uZmlnLAotIAkgKiBza2lwIHJlLXJlYWRpbmcgaWYg
dGhlIG10aW1lIGl0IGhhcyB1c2VkIGlzIGV4YWN0bHkgdGhlIHNhbWUuCi0gCSAqLwotLQlpZiAo
c3lzdGVtX3ByaW9yaXR5X2ZpbGVfbG9hZGVkKSB7Ci0rCWlmIChzeXN0ZW1fcHJpb3JpdHlfZmls
ZV9sb2FkZWQpCi0gCQlzeXN0ZW1fcHJpb3JpdHlfZmlsZV9sb2FkZWQgPQotIAkJCShzeXN0ZW1f
cHJpb3JpdHlfbGFzdF9tb2QgPT0gc2Iuc3RfbXRpbWUpOwotLQl9Ci0gCi0gCWlmICghc3lzdGVt
X3ByaW9yaXR5X2ZpbGVfbG9hZGVkKSB7Ci0tCQlfbmFtZV92YWxfYXJyYXlfY2xlYXIoJnN5c3Rl
bV93aWRlX2NvbmZpZy5wcmlvcml0eV9zdHJpbmdzKTsKLS0KLS0JCWdudXRsc19mcmVlKHN5c3Rl
bV93aWRlX2NvbmZpZy5wcmlvcml0eV9zdHJpbmcpOwotLQkJc3lzdGVtX3dpZGVfY29uZmlnLnBy
aW9yaXR5X3N0cmluZyA9IE5VTEw7Ci0tCi0tCQlmcCA9IGZvcGVuKHN5c3RlbV9wcmlvcml0eV9m
aWxlLCAicmUiKTsKLS0JCWlmIChmcCA9PSBOVUxMKSB7Ci0tCQkJX2dudXRsc19kZWJ1Z19sb2co
ImNmZzogdW5hYmxlIHRvIG9wZW46ICVzOiAlZFxuIiwKLS0JCQkJCSAgc3lzdGVtX3ByaW9yaXR5
X2ZpbGUsIGVycm5vKTsKLSsJCWNvbmZpZ19wYXJzZV9lcnJvciA9ICFsb2FkX3N5c3RlbV9wcmlv
cml0eV9maWxlKCk7Ci0rCQlpZiAoY29uZmlnX3BhcnNlX2Vycm9yKQotIAkJCWdvdG8gb3V0Owot
LQkJfQotLQkJLyogUGFyc2luZyB0aGUgY29uZmlndXJhdGlvbiBmaWxlIG5lZWRzIHRvIGJlIGRv
bmUgaW4gMiBwaGFzZXM6Ci0tCQkgKiBmaXJzdCBwYXJzaW5nIHRoZSBbZ2xvYmFsXSBzZWN0aW9u
Ci0tCQkgKiBhbmQgdGhlbiB0aGUgb3RoZXIgc2VjdGlvbnMsCi0tCQkgKiBiZWNhdXNlIHRoZSBb
Z2xvYmFsXSBzZWN0aW9uIG1vZGlmaWVzIHRoZSBwYXJzaW5nIGJlaGF2aW9yLgotLQkJICovCi0t
CQltZW1zZXQoJmN0eCwgMCwgc2l6ZW9mKGN0eCkpOwotLQkJZXJyID0gaW5pX3BhcnNlX2ZpbGUo
ZnAsIGdsb2JhbF9pbmlfaGFuZGxlciwgJmN0eCk7Ci0tCQlpZiAoIWVycikgewotLQkJCWlmIChm
c2VlayhmcCwgMEwsIFNFRUtfU0VUKSA8IDApIHsKLS0JCQkJX2dudXRsc19kZWJ1Z19sb2coImNm
ZzogdW5hYmxlIHRvIHJld2luZDogJXNcbiIsCi0tCQkJCQkJICBzeXN0ZW1fcHJpb3JpdHlfZmls
ZSk7Ci0tCQkJCWlmIChmYWlsX29uX2ludmFsaWRfY29uZmlnKQotLQkJCQkJZXhpdCgxKTsKLS0J
CQl9Ci0tCQkJZXJyID0gaW5pX3BhcnNlX2ZpbGUoZnAsIGNmZ19pbmlfaGFuZGxlciwgJmN0eCk7
Ci0tCQl9Ci0tCQlmY2xvc2UoZnApOwotLQkJaWYgKGVycikgewotLQkJCWluaV9jdHhfZGVpbml0
KCZjdHgpOwotLQkJCV9nbnV0bHNfZGVidWdfbG9nKCJjZmc6IHVuYWJsZSB0byBwYXJzZTogJXM6
ICVkXG4iLAotLQkJCQkJICBzeXN0ZW1fcHJpb3JpdHlfZmlsZSwgZXJyKTsKLS0JCQlnb3RvIG91
dDsKLS0JCX0KLS0JCWNmZ19hcHBseSgmc3lzdGVtX3dpZGVfY29uZmlnLCAmY3R4KTsKLS0JCWlu
aV9jdHhfZGVpbml0KCZjdHgpOwotIAkJX2dudXRsc19kZWJ1Z19sb2coImNmZzogbG9hZGVkIHN5
c3RlbSBjb25maWcgJXMgbXRpbWUgJWxsZFxuIiwKLSAJCQkJICBzeXN0ZW1fcHJpb3JpdHlfZmls
ZSwKLSAJCQkJICAodW5zaWduZWQgbG9uZyBsb25nKXNiLnN0X210aW1lKTsKLUBAIC0yMzMyLDkg
KzIzNTYsOCBAQCBzdGF0aWMgaW50IF9nbnV0bHNfdXBkYXRlX3N5c3RlbV9wcmlvcml0aWVzKGJv
b2wgZGVmZXJfc3lzdGVtX3dpZGUpCi0gb3V0OgotIAkodm9pZClnbnV0bHNfcndsb2NrX3VubG9j
aygmc3lzdGVtX3dpZGVfY29uZmlnX3J3bG9jayk7Ci0gCi0tCWlmIChlcnIgJiYgZmFpbF9vbl9p
bnZhbGlkX2NvbmZpZykgewotKwlpZiAoY29uZmlnX3BhcnNlX2Vycm9yICYmIGZhaWxfb25faW52
YWxpZF9jb25maWcpCi0gCQlleGl0KDEpOwotLQl9Ci0gCi0gCXJldHVybiByZXQ7Ci0gfQotZGlm
ZiAtLWdpdCBhL3Rlc3RzL3N5c3RlbS1vdmVycmlkZS1hbGxvdy1yc2EtcGtjczEtZW5jcnlwdC5z
aCBiL3Rlc3RzL3N5c3RlbS1vdmVycmlkZS1hbGxvdy1yc2EtcGtjczEtZW5jcnlwdC5zaAotaW5k
ZXggYjdkNDc3Yzk2ZS4uNzE0ZDBhZjk0NiAxMDA3NTUKLS0tLSBhL3Rlc3RzL3N5c3RlbS1vdmVy
cmlkZS1hbGxvdy1yc2EtcGtjczEtZW5jcnlwdC5zaAotKysrIGIvdGVzdHMvc3lzdGVtLW92ZXJy
aWRlLWFsbG93LXJzYS1wa2NzMS1lbmNyeXB0LnNoCi1AQCAtMTksOSArMTksOCBAQAotICMgWW91
IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIExlc3NlciBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlCi0gIyBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbS4gIElmIG5vdCwgc2VlIDxo
dHRwczovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4KLSAKLS06ICR7c3JjZGlyPS59Ci0tVEVTVD0k
e3NyY2Rpcn0vcnNhZXMtcGtjczEtdjFfNQotLUNPTkY9JHtzcmNkaXJ9L2NvbmZpZy4kJC50bXAK
LStURVNUPSR7YnVpbGRkaXJ9L3JzYWVzLXBrY3MxLXYxXzUKLStDT05GPWNvbmZpZy4kJC50bXAK
LSBleHBvcnQgR05VVExTX1NZU1RFTV9QUklPUklUWV9GSUxFPSR7Q09ORn0KLSBleHBvcnQgR05V
VExTX1NZU1RFTV9QUklPUklUWV9GQUlMX09OX0lOVkFMSUQ9MQotIAotQEAgLTM4LDE1ICszNywz
MyBAQCBjYXQgPDxfRU9GXyA+ICR7Q09ORn0KLSBhbGxvdy1yc2EtcGtjczEtZW5jcnlwdCA9IHRy
dWUKLSBfRU9GXwotIAotLSR7VEVTVH0gJiYgZmFpbCAiUlNBRVMtUEtDUzEtdjFfNSBleHBlY3Rl
ZCB0byBzdWNjZWVkIgotKyR7VEVTVH0KLStpZiBbICQ/ICE9IDAgXTsgdGhlbgotKwllY2hvICIk
e1RFU1R9IGV4cGVjdGVkIHRvIHN1Y2NlZWQiCi0rCWV4aXQgMQotK2ZpCi0rZWNobyAiUlNBRVMt
UEtDUzEtdjFfNSBzdWNjZXNzZnVsbHkgZW5hYmxlZCIKLSAKLSBjYXQgPDxfRU9GXyA+ICR7Q09O
Rn0KLSBbb3ZlcnJpZGVzXQotIGFsbG93LXJzYS1wa2NzMS1lbmNyeXB0ID0gZmFsc2UKLSBfRU9G
XwotIAotLSR7VEVTVH0gfHwgZmFpbCAiUlNBRVMtUEtDUzEtdjFfNSBleHBlY3RlZCB0byBmYWls
IgotKyR7VEVTVH0KLStpZiBbICQ/ID0gMCBdOyB0aGVuCi0rCWVjaG8gIiR7VEVTVH0gZXhwZWN0
ZWQgdG8gZmFpbCIKLSsJZXhpdCAxCi0rZmkKLStlY2hvICJSU0FFUy1QS0NTMS12MV81IHN1Y2Nl
c3NmdWxseSBkaXNhYmxlZCIKLSAKLSB1bnNldCBHTlVUTFNfU1lTVEVNX1BSSU9SSVRZX0ZJTEUK
LSB1bnNldCBHTlVUTFNfU1lTVEVNX1BSSU9SSVRZX0ZBSUxfT05fSU5WQUxJRAotKwotKyR7VEVT
VH0KLStpZiBbICQ/ICE9IDAgXTsgdGhlbgotKwllY2hvICIke1RFU1R9IGV4cGVjdGVkIHRvIHN1
Y2NlZWQgYnkgZGVmYXVsdCIKLSsJZXhpdCAxCi0rZmkKLStlY2hvICJSU0FFUy1QS0NTMS12MV81
IHN1Y2Nlc3NmdWxseSBlbmFibGVkIGJ5IGRlZmF1bHQiCi0rCi0gZXhpdCAwCi0tLSAKLUdpdExh
YgotCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9nbnV0bHMvQWRk
LXB0ZXN0LXN1cHBvcnQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvZ251dGxz
L0FkZC1wdGVzdC1zdXBwb3J0LnBhdGNoCmluZGV4IDhlZGQzMWQ2YjkuLjhlNGRmN2IzN2UgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9nbnV0bHMvQWRkLXB0ZXN0LXN1
cHBvcnQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRscy9BZGQt
cHRlc3Qtc3VwcG9ydC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYmZhNzBhZGNiZGE0ZTUw
NWNmMmU1OTc5MDc4NTJlNzhlMDQzOWVlMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
NmFiYzg2YWNlY2ZmNWEzMDE3M2ViNzhhOTcxZWM1YjY1Zjc3ZTFkZSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IFJhdmluZWV0IFNpbmdoIDxyYXZpbmVldC5hLnNpbmdoQGVzdC50ZWNo
PgogRGF0ZTogVHVlLCAxMCBKYW4gMjAyMyAxNjoxMToxMCArMDEwMAogU3ViamVjdDogW1BBVENI
XSBnbnV0bHM6IGFkZCBwdGVzdCBzdXBwb3J0CkBAIC0yNiwxMCArMjYsMTAgQEAgaW5kZXggODQz
MTkzZi4uODE2YjA5ZiAxMDA2NDQKICAKICBpbmNsdWRlICQodG9wX3NyY2RpcikvY2xpZ2VuL2Ns
aWdlbi5tawogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXgg
OTM0Mzc3ZS4uNDQwNmVhZSAxMDA2NDQKK2luZGV4IDE3NDQ4MTMuLmVmYjllMzQgMTAwNjQ0CiAt
LS0gYS9jb25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwotQEAgLTEyMTMsNiArMTIxMyw4
IEBAIEFDX1NVQlNUKExJQkdOVVRMU19DRkxBR1MpCitAQCAtMTIyNiw2ICsxMjI2LDggQEAgQUNf
U1VCU1QoTElCR05VVExTX0NGTEFHUykKICAKICBBTV9DT05ESVRJT05BTChORUVEU19MSUJSVCwg
dGVzdCAiJGdudXRsc19uZWVkc19saWJydCIgPSAieWVzIikKICAKQEAgLTM5LDEwICszOSwxMCBA
QCBpbmRleCA5MzQzNzdlLi40NDA2ZWFlIDEwMDY0NAogIAogIGh3X2ZlYXR1cmVzPQogZGlmZiAt
LWdpdCBhL3Rlc3RzL01ha2VmaWxlLmFtIGIvdGVzdHMvTWFrZWZpbGUuYW0KLWluZGV4IGUzOWEz
YjMuLjg2MWRkNjMgMTAwNjQ0CitpbmRleCAxODlkMDY4Li44NDMwYjA1IDEwMDY0NAogLS0tIGEv
dGVzdHMvTWFrZWZpbGUuYW0KICsrKyBiL3Rlc3RzL01ha2VmaWxlLmFtCi1AQCAtNjYzLDYgKzY2
MywxMiBAQCBTSF9MT0dfQ09NUElMRVIgPSAkKFNIRUxMKQorQEAgLTY2OCw2ICs2NjgsMTIgQEAg
U0hfTE9HX0NPTVBJTEVSID0gJChTSEVMTCkKICBBTV9WQUxHUklOREZMQUdTID0gLS1zdXBwcmVz
c2lvbnM9JChzcmNkaXIpL3N1cHByZXNzaW9ucy52YWxncmluZAogIExPR19DT01QSUxFUiA9ICQo
TE9HX1ZBTEdSSU5EKQogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxz
L2dudXRscy9hcm1fZWFiaS5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9nbnV0
bHMvYXJtX2VhYmkucGF0Y2gKaW5kZXggODgzZDAxMjNkYi4uZDQ5MzQ0OGFhYiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRscy9hcm1fZWFiaS5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvZ251dGxzL2FybV9lYWJpLnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSBkMTdhZTBlZjMxYzNjMTg2NzY2YTMzOGU4YzQwYzg3ZDFiOTg4MjBl
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0NmIzMDc5MDk1YzVjZWIwZGM3NDI3ODU4
NTNiYmFmMjg4ZjMyNWM2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSm9lIFNsYXRl
ciA8anNsYXRlckB3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCAyNSBKYW4gMjAxNyAxMzo1Mjo1
OSAtMDgwMAogU3ViamVjdDogW1BBVENIXSBnbnV0bHM6IGFjY291bnQgZm9yIEFSTV9FQUJJCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvZ251dGxzXzMuOC41LmJiIGIv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRsc18zLjguNi5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvZ251dGxzXzMu
OC41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvZ251dGxzXzMuOC42
LmJiCmluZGV4IDUyYTFjMDBjNGEuLjM3ZDEyZmI1ZWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2dudXRscy9nbnV0bHNfMy44LjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvZ251dGxzL2dudXRsc18zLjguNi5iYgpAQCAtMjEsMTIgKzIxLDExIEBAIFNIUlRfVkVSID0g
IiR7QGQuZ2V0VmFyKCdQVicpLnNwbGl0KCcuJylbMF19LiR7QGQuZ2V0VmFyKCdQVicpLnNwbGl0
KCcuJylbMV19IgogU1JDX1VSSSA9ICJodHRwczovL3d3dy5nbnVwZy5vcmcvZnRwL2djcnlwdC9n
bnV0bHMvdiR7U0hSVF9WRVJ9L2dudXRscy0ke1BWfS50YXIueHogXAogICAgICAgICAgICBmaWxl
Oi8vYXJtX2VhYmkucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1DcmVhdGluZy0uaG1h
Yy1maWxlLXNob3VsZC1iZS1leGN1dGVkLWluLXRhcmdldC1lbnZpLnBhdGNoIFwKLSAgICAgICAg
ICAgZmlsZTovLzAwMDEtRml4LVJTQUVTLVBLQ1MxLXYxXzUtc3lzdGVtLXdpZGUtY29uZmlndXJh
dGlvbi5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAgICAgICBm
aWxlOi8vQWRkLXB0ZXN0LXN1cHBvcnQucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICI2NjI2OWEyY2ZlMGUxYzJkYWJlYzg3YmRiYmQ4YWI2NTZmMzk2ZWRkOWE0
MGRkMDA2OTc4ZTAwM2NmYTUyYmZjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjJlMTU4OGFhZTUz
Y2IzMmQ0MzkzN2YxZjRlY2EyOGZlYmQ5YzBjN2FhMTczNGZjNWRkNjFhN2U4MWUwZWJjZGQiCiAK
IGluaGVyaXQgYXV0b3Rvb2xzIHRleGluZm8gcGtnY29uZmlnIGdldHRleHQgbGliX3BhY2thZ2Ug
Z3RrLWRvYyBwdGVzdAogCi0tIAoyLjQ0LjAKCg==

--===============3135968035885392514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gnutls/gnutls-bin: PV changed from "3.8.5" to "3.8.6"
packages/core2-64-poky-linux/gnutls/gnutls-bin: PKGV changed from 3.8.5 [default] to 3.8.6 [default]
packages/core2-64-poky-linux/gnutls/gnutls-dane: PV changed from "3.8.5" to "3.8.6"
packages/core2-64-poky-linux/gnutls/gnutls-dane: PKGV changed from 3.8.5 [default] to 3.8.6 [default]
packages/core2-64-poky-linux/gnutls/gnutls-dbg: PV changed from "3.8.5" to "3.8.6"
packages/core2-64-poky-linux/gnutls/gnutls-dbg: PKGV changed from 3.8.5 [default] to 3.8.6 [default]
packages/core2-64-poky-linux/gnutls/gnutls-dbg: PKGSIZE changed from 29131136 to 29003704 (-0%)
packages/core2-64-poky-linux/gnutls/gnutls-dbg: FILELIST: removed "/usr/lib/gnutls/ptest/tests/.debug/fips-mode-pthread /usr/lib/gnutls/ptest/tests/.debug/rng-pthread /usr/lib/gnutls/ptest/tests/.debug/tls-pthread /usr/lib/gnutls/ptest/tests/.debug/dtls-pthread /usr/lib/.debug/libgnutls.so.30.39.0", added "/usr/lib/.debug/libgnutls.so.30.40.0"
packages/core2-64-poky-linux/gnutls/gnutls-dev: PV changed from "3.8.5" to "3.8.6"
packages/core2-64-poky-linux/gnutls/gnutls-dev: PKGV changed from 3.8.5 [default] to 3.8.6 [default]
packages/core2-64-poky-linux/gnutls/gnutls-dev: PKGSIZE changed from 511566 to 512025 (+0%)
packages/core2-64-poky-linux/gnutls/gnutls-doc: PV changed from "3.8.5" to "3.8.6"
packages/core2-64-poky-linux/gnutls/gnutls-doc: PKGV changed from 3.8.5 [default] to 3.8.6 [default]
packages/core2-64-poky-linux/gnutls/gnutls-doc: PKGSIZE changed from 4387982 to 4393228 (+0%)
packages/core2-64-poky-linux/gnutls/gnutls-doc: FILELIST: added "/usr/share/man/man3/gnutls_hash_squeeze.3 /usr/share/man/man3/gnutls_pkcs12_generate_mac3.3"
packages/core2-64-poky-linux/gnutls/gnutls-fips: PV changed from "3.8.5" to "3.8.6"
packages/core2-64-poky-linux/gnutls/gnutls-fips: PKGV changed from 3.8.5 [default] to 3.8.6 [default]
packages/core2-64-poky-linux/gnutls/gnutls-locale-cs: PV changed from "3.8.5" to "3.8.6"
packages/core2-64-poky-linux/gnutls/gnutls-locale-cs: PKGV changed from 3.8.5 [default] to 3.8.6 [default]
packages/core2-64-poky-linux/gnutls/gnutls-locale-de: PV changed from "3.8.5" to "3.8.6"
packages/core2-64-poky-linux/gnutls/gnutls-locale-de: PKGV changed from 3.8.5 [default] to 3.8.6 [default]
packages/core2-64-poky-linux/gnutls/gnutls-locale-eo: PV changed from "3.8.5" to "3.8.6"
packages/core2-64-poky-linux/gnutls/gnutls-locale-eo: PKGV changed from 3.8.5 [default] to 3.8.6 [default]
packages/core2-64-poky-linux/gnutls/gnutls-locale-es: PV changed from "3.8.5" to "3.8.6"
packages/core2-64-poky-linux/gnutls/gnutls-locale-es: PKGV changed from 3.8.5 [default] to 3.8.6 [default]
packages/core2-64-poky-linux/gnutls/gnutls-locale-fi: PV changed from "3.8.5" to "3.8.6"
packages/core2-64-poky-linux/gnutls/gnutls-locale-fi: PKGV changed from 3.8.5 [default] to 3.8.6 [default]
packages/core2-64-poky-linux/gnutls/gnutls-locale-fr: PV changed from "3.8.5" to "3.8.6"
packages/core2-64-poky-linux/gnutls/gnutls-locale-fr: PKGV changed from 3.8.5 [default] to 3.8.6 [default]
packages/core2-64-poky-linux/gnutls/gnutls-locale-it: PV changed from "3.8.5" to "3.8.6"
packages/core2-64-poky-linux/gnutls/gnutls-locale-it: PKGV changed from 3.8.5 [default] to 3.8.6 [default]
packages/core2-64-poky-linux/gnutls/gnutls-locale-ka: PV changed from "3.8.5" to "3.8.6"
packages/core2-64-poky-linux/gnutls/gnutls-locale-ka: PKGV changed from 3.8.5 [default] to 3.8.6 [default]
packages/core2-64-poky-linux/gnutls/gnutls-locale-ms: PV changed from "3.8.5" to "3.8.6"
packages/core2-64-poky-linux/gnutls/gnutls-locale-ms: PKGV changed from 3.8.5 [default] to 3.8.6 [default]
packages/core2-64-poky-linux/gnutls/gnutls-locale-nl: PV changed from "3.8.5" to "3.8.6"
packages/core2-64-poky-linux/gnutls/gnutls-locale-nl: PKGV changed from 3.8.5 [default] to 3.8.6 [default]
packages/core2-64-poky-linux/gnutls/gnutls-locale-pl: PV changed from "3.8.5" to "3.8.6"
packages/core2-64-poky-linux/gnutls/gnutls-locale-pl: PKGV changed from 3.8.5 [default] to 3.8.6 [default]
packages/core2-64-poky-linux/gnutls/gnutls-locale-pt-br: PV changed from "3.8.5" to "3.8.6"
packages/core2-64-poky-linux/gnutls/gnutls-locale-pt-br: PKGV changed from 3.8.5 [default] to 3.8.6 [default]
packages/core2-64-poky-linux/gnutls/gnutls-locale-ro: PV changed from "3.8.5" to "3.8.6"
packages/core2-64-poky-linux/gnutls/gnutls-locale-ro: PKGV changed from 3.8.5 [default] to 3.8.6 [default]
packages/core2-64-poky-linux/gnutls/gnutls-locale-sr: PV changed from "3.8.5" to "3.8.6"
packages/core2-64-poky-linux/gnutls/gnutls-locale-sr: PKGV changed from 3.8.5 [default] to 3.8.6 [default]
packages/core2-64-poky-linux/gnutls/gnutls-locale-sv: PV changed from "3.8.5" to "3.8.6"
packages/core2-64-poky-linux/gnutls/gnutls-locale-sv: PKGV changed from 3.8.5 [default] to 3.8.6 [default]
packages/core2-64-poky-linux/gnutls/gnutls-locale-uk: PV changed from "3.8.5" to "3.8.6"
packages/core2-64-poky-linux/gnutls/gnutls-locale-uk: PKGV changed from 3.8.5 [default] to 3.8.6 [default]
packages/core2-64-poky-linux/gnutls/gnutls-locale-vi: PV changed from "3.8.5" to "3.8.6"
packages/core2-64-poky-linux/gnutls/gnutls-locale-vi: PKGV changed from 3.8.5 [default] to 3.8.6 [default]
packages/core2-64-poky-linux/gnutls/gnutls-locale-zh-cn: PV changed from "3.8.5" to "3.8.6"
packages/core2-64-poky-linux/gnutls/gnutls-locale-zh-cn: PKGV changed from 3.8.5 [default] to 3.8.6 [default]
packages/core2-64-poky-linux/gnutls/gnutls-openssl: PV changed from "3.8.5" to "3.8.6"
packages/core2-64-poky-linux/gnutls/gnutls-openssl: PKGV changed from 3.8.5 [default] to 3.8.6 [default]
packages/core2-64-poky-linux/gnutls/gnutls-ptest: PV changed from "3.8.5" to "3.8.6"
packages/core2-64-poky-linux/gnutls/gnutls-ptest: PKGV changed from 3.8.5 [default] to 3.8.6 [default]
packages/core2-64-poky-linux/gnutls/gnutls-ptest: PKGSIZE changed from 30666717 to 30418325 (-1%)
packages/core2-64-poky-linux/gnutls/gnutls-ptest: FILELIST: removed "/usr/lib/gnutls/ptest/tests/tls-pthread /usr/lib/gnutls/ptest/tests/rng-pthread /usr/lib/gnutls/ptest/tests/fips-mode-pthread /usr/lib/gnutls/ptest/tests/dtls-pthread"
packages/core2-64-poky-linux/gnutls/gnutls-src: PV changed from "3.8.5" to "3.8.6"
packages/core2-64-poky-linux/gnutls/gnutls-src: PKGV changed from 3.8.5 [default] to 3.8.6 [default]
packages/core2-64-poky-linux/gnutls/gnutls-src: PKGSIZE changed from 12946060 to 12945980 (-0%)
packages/core2-64-poky-linux/gnutls/gnutls-src: FILELIST: directory renamed /usr/src/debug/gnutls/3.8.5/lib/nettle/gost -> /usr/src/debug/gnutls/3.8.6/lib/nettle/gost, directory renamed /usr/src/debug/gnutls/3.8.5/lib/accelerated -> /usr/src/debug/gnutls/3.8.6/lib/accelerated, directory renamed /usr/src/debug/gnutls/3.8.5/gl/glthread -> /usr/src/debug/gnutls/3.8.6/gl/glthread, directory renamed /usr/src/debug/gnutls/3.8.5/src -> /usr/src/debug/gnutls/3.8.6/src, directory renamed /usr/src/debug/gnutls/3.8.5/doc/examples -> /usr/src/debug/gnutls/3.8.6/doc/examples, directory renamed /usr/src/debug/gnutls/3.8.5/lib/algorithms -> /usr/src/debug/gnutls/3.8.6/lib/algorithms, directory renamed /usr/src/debug/gnutls/3.8.5/lib/x509 -> /usr/src/debug/gnutls/3.8.6/lib/x509, directory renamed /usr/src/debug/gnutls/3.8.5/lib/nettle -> /usr/src/debug/gnutls/3.8.6/lib/nettle, directory renamed /usr/src/debug/gnutls/3.8.5/tests/tls13 -> /usr/src/debug/gnutls/3.8.6/tests/tls13, directory renamed /usr
 /src/debug/gnutls/3.8.5/src/gl -> /usr/src/debug/gnutls/3.8.6/src/gl, directory renamed /usr/src/debug/gnutls/3.8.5/tests/safe-renegotiation -> /usr/src/debug/gnutls/3.8.6/tests/safe-renegotiation, directory renamed /usr/src/debug/gnutls/3.8.5/lib/system -> /usr/src/debug/gnutls/3.8.6/lib/system, directory renamed /usr/src/debug/gnutls/3.8.5/lib/extras -> /usr/src/debug/gnutls/3.8.6/lib/extras, directory renamed /usr/src/debug/gnutls/3.8.5/extra/includes/gnutls -> /usr/src/debug/gnutls/3.8.6/extra/includes/gnutls, directory renamed /usr/src/debug/gnutls/3.8.5/lib/auth -> /usr/src/debug/gnutls/3.8.6/lib/auth, directory renamed /usr/src/debug/gnutls/3.8.5/extra -> /usr/src/debug/gnutls/3.8.6/extra, directory renamed /usr/src/debug/gnutls/3.8.5/gl -> /usr/src/debug/gnutls/3.8.6/gl, directory renamed /usr/src/debug/gnutls/3.8.5/lib -> /usr/src/debug/gnutls/3.8.6/lib, directory renamed /usr/src/debug/gnutls/3.8.5/lib/accelerated/x86 -> /usr/src/debug/gnutls/3.8.6/lib/accelerated/x86, dir
 ectory renamed /usr/src/debug/gnutls/3.8.5/lib/includes/gnutls -> /usr/src/debug/gnutls/3.8.6/lib/includes/gnutls, directory renamed /usr/src/debug/gnutls/3.8.5/lib/ext -> /usr/src/debug/gnutls/3.8.6/lib/ext, directory renamed /usr/src/debug/gnutls/3.8.5/lib/inih -> /usr/src/debug/gnutls/3.8.6/lib/inih, directory renamed /usr/src/debug/gnutls/3.8.5/tests/dtls -> /usr/src/debug/gnutls/3.8.6/tests/dtls, directory renamed /usr/src/debug/gnutls/3.8.5/gl/malloc -> /usr/src/debug/gnutls/3.8.6/gl/malloc, directory renamed /usr/src/debug/gnutls/3.8.5/lib/tls13 -> /usr/src/debug/gnutls/3.8.6/lib/tls13, removed "/usr/src/debug/gnutls/3.8.5/tests/fips-rsa-sizes.c /usr/src/debug/gnutls/3.8.5/tests/tlsfeature-crt.c /usr/src/debug/gnutls/3.8.5/tests/tlsfeature-ext.c /usr/src/debug/gnutls/3.8.5/tests/prf.c /usr/src/debug/gnutls/3.8.5/tests/no-status-request.c /usr/src/debug/gnutls/3.8.5/tests/dtls-rehandshake-cert-3.c /usr/src/debug/gnutls/3.8.5/tests/ecdh-compute.c /usr/src/debug/gnutls/3.8.5/tes
 ts/session-tickets-missing.c /usr/src/debug/gnutls/3.8.5/tests/priorities.c /usr/src/debug/gnutls/3.8.5/tests/duplicate-extensions.c /usr/src/debug/gnutls/3.8.5/tests/tls-ext-register.c /usr/src/debug/gnutls/3.8.5/tests/id-on-xmppAddr.c /usr/src/debug/gnutls/3.8.5/tests/utils-adv.c /usr/src/debug/gnutls/3.8.5/tests/rehandshake-ext-secret.c /usr/src/debug/gnutls/3.8.5/tests/rsa-rsa-pss.c /usr/src/debug/gnutls/3.8.5/tests/crlverify.c /usr/src/debug/gnutls/3.8.5/tests/recv-data-before-handshake.c /usr/src/debug/gnutls/3.8.5/tests/send-data-before-handshake.c /usr/src/debug/gnutls/3.8.5/tests/long-session-id.c /usr/src/debug/gnutls/3.8.5/tests/gnutls-ids.c /usr/src/debug/gnutls/3.8.5/tests/cve-2008-4989.c /usr/src/debug/gnutls/3.8.5/tests/set_x509_key.c /usr/src/debug/gnutls/3.8.5/tests/handshake-large-cert.c /usr/src/debug/gnutls/3.8.5/tests/mini-session-verify-function.c /usr/src/debug/gnutls/3.8.5/tests/x509-upnconstraint.c /usr/src/debug/gnutls/3.8.5/tests/dn.c /usr/src/debug/gnutls
 /3.8.5/tests/rehandshake-switch-psk-id.c /usr/src/debug/gnutls/3.8.5/tests/rehandshake-switch-srp-id.c /usr/src/debug/gnutls/3.8.5/tests/system-override-hash.c /usr/src/debug/gnutls/3.8.5/tests/x509-cert-callback.c /usr/src/debug/gnutls/3.8.5/tests/priorities-groups.c /usr/src/debug/gnutls/3.8.5/tests/x509-verify-with-crl.c /usr/src/debug/gnutls/3.8.5/tests/set_x509_key_file_legacy.c /usr/src/debug/gnutls/3.8.5/tests/virt-time.h /usr/src/debug/gnutls/3.8.5/tests/mini-record.c /usr/src/debug/gnutls/3.8.5/tests/test-chains-issuer-aia.h /usr/src/debug/gnutls/3.8.5/tests/trust-store.c /usr/src/debug/gnutls/3.8.5/tests/handshake-versions.c /usr/src/debug/gnutls/3.8.5/tests/tls12-rehandshake-set-prio.c /usr/src/debug/gnutls/3.8.5/tests/version-checks.c /usr/src/debug/gnutls/3.8.5/tests/x509-dn-decode.c /usr/src/debug/gnutls/3.8.5/tests/fips-mode-pthread.c /usr/src/debug/gnutls/3.8.5/tests/cert.c /usr/src/debug/gnutls/3.8.5/tests/nul-in-x509-names.c /usr/src/debug/gnutls/3.8.5/tests/null_r
 etrieve_function.c /usr/src/debug/gnutls/3.8.5/tests/spki.c /usr/src/debug/gnutls/3.8.5/tests/rehandshake-switch-cert-client.c /usr/src/debug/gnutls/3.8.5/tests/sign-verify-newapi.c /usr/src/debug/gnutls/3.8.5/tests/privkey-verify-broken.c /usr/src/debug/gnutls/3.8.5/lib/nettle/backport/rsa-oaep-decrypt.c /usr/src/debug/gnutls/3.8.5/tests/pkcs1-digest-info.c /usr/src/debug/gnutls/3.8.5/tests/client-fastopen.c /usr/src/debug/gnutls/3.8.5/tests/x509_altname.c /usr/src/debug/gnutls/3.8.5/tests/x509cert.c /usr/src/debug/gnutls/3.8.5/tests/key-usage-rsa.c /usr/src/debug/gnutls/3.8.5/tests/mini-dtls-fork.c /usr/src/debug/gnutls/3.8.5/tests/mini-dtls-srtp.c /usr/src/debug/gnutls/3.8.5/tests/name-constraints.c /usr/src/debug/gnutls/3.8.5/tests/rsa-rsa-oaep.c /usr/src/debug/gnutls/3.8.5/tests/rsa-psk.c /usr/src/debug/gnutls/3.8.5/tests/gnutls_ext_raw_parse_dtls.c /usr/src/debug/gnutls/3.8.5/tests/sign-verify-deterministic.c /usr/src/debug/gnutls/3.8.5/tests/rawpk-api.c /usr/src/debug/gnutls/
 3.8.5/tests/tls13-early-start.c /usr/src/debug/gnutls/3.8.5/tests/srp.c /usr/src/debug/gnutls/3.8.5/tests/mini-dtls-heartbeat.c /usr/src/debug/gnutls/3.8.5/tests/session-tickets-ok.c /usr/src/debug/gnutls/3.8.5/lib/nettle/backport/rsa-sec-compute-root.c /usr/src/debug/gnutls/3.8.5/tests/tls-etm.c /usr/src/debug/gnutls/3.8.5/tests/base64.c /usr/src/debug/gnutls/3.8.5/tests/set_x509_pkcs12_key.c /usr/src/debug/gnutls/3.8.5/tests/tls12-ffdhe.c /usr/src/debug/gnutls/3.8.5/tests/x509-verify-duplicate.c /usr/src/debug/gnutls/3.8.5/tests/utils.h /usr/src/debug/gnutls/3.8.5/tests/pkcs7.c /usr/src/debug/gnutls/3.8.5/tests/utils.c /usr/src/debug/gnutls/3.8.5/tests/openconnect-dtls12.c /usr/src/debug/gnutls/3.8.5/tests/tls12-rehandshake-cert-2.c /usr/src/debug/gnutls/3.8.5/tests/set_x509_key_file-late.c /usr/src/debug/gnutls/3.8.5/tests/set_x509_key_file_ocsp.c /usr/src/debug/gnutls/3.8.5/tests/resume-with-record-size-limit.c /usr/src/debug/gnutls/3.8.5/tests/x509sign-verify-gost.c /usr/src/de
 bug/gnutls/3.8.5/tests/client-secrets.h /usr/src/debug/gnutls/3.8.5/tests/server-secrets.h /usr/src/debug/gnutls/3.8.5/tests/empty_retrieve_function.c /usr/src/debug/gnutls/3.8.5/tests/hex.c /usr/src/debug/gnutls/3.8.5/tests/cert-status.c /usr/src/debug/gnutls/3.8.5/tests/fallback-scsv.c /usr/src/debug/gnutls/3.8.5/tests/mini-key-material.c /usr/src/debug/gnutls/3.8.5/tests/x509-extensions.c /usr/src/debug/gnutls/3.8.5/tests/random-art.c /usr/src/debug/gnutls/3.8.5/tests/mini-record-range.c /usr/src/debug/gnutls/3.8.5/tests/missingissuer_aia.c /usr/src/debug/gnutls/3.8.5/tests/mini-tls-nonblock.c /usr/src/debug/gnutls/3.8.5/tests/rsa-illegal-import.c /usr/src/debug/gnutls/3.8.5/tests/system-override-sig-tls.c /usr/src/debug/gnutls/3.8.5/tests/xts-key-check.c /usr/src/debug/gnutls/3.8.5/tests/mini-record-failure.c /usr/src/debug/gnutls/3.8.5/lib/nettle/backport/rsa-sign-tr.c /usr/src/debug/gnutls/3.8.5/tests/mini-dtls-record.c /usr/src/debug/gnutls/3.8.5/tests/dtls-rehandshake-anon.c
  /usr/src/debug/gnutls/3.8.5/tests/dtls-rehandshake-cert.c /usr/src/debug/gnutls/3.8.5/tests/set_pkcs12_cred.c /usr/src/debug/gnutls/3.8.5/lib/nettle/backport/rsa-oaep-encrypt.c /usr/src/debug/gnutls/3.8.5/tests/status-request-ok.c /usr/src/debug/gnutls/3.8.5/tests/gnutls_x509_privkey_import.c /usr/src/debug/gnutls/3.8.5/tests/resume-dtls.c /usr/src/debug/gnutls/3.8.5/tests/rng-op-nonce.c /usr/src/debug/gnutls/3.8.5/tests/cert_verify_inv_utf8.c /usr/src/debug/gnutls/3.8.5/tests/base64-raw.c /usr/src/debug/gnutls/3.8.5/tests/x509cert-tl.c /usr/src/debug/gnutls/3.8.5/tests/mini-termination.c /usr/src/debug/gnutls/3.8.5/tests/x509-cert-callback-ocsp.c /usr/src/debug/gnutls/3.8.5/tests/pkcs7-verify-double-free.c /usr/src/debug/gnutls/3.8.5/tests/pubkey-import-export.c /usr/src/debug/gnutls/3.8.5/tests/mini-loss-time.c /usr/src/debug/gnutls/3.8.5/tests/set_x509_key_file.c /usr/src/debug/gnutls/3.8.5/tests/spki-abstract.c /usr/src/debug/gnutls/3.8.5/tests/mini-dtls-lowmtu.c /usr/src/debug
 /gnutls/3.8.5/tests/tls-record-size-limit-asym.c /usr/src/debug/gnutls/3.8.5/tests/keylog-func.c /usr/src/debug/gnutls/3.8.5/tests/status-request-ext.c /usr/src/debug/gnutls/3.8.5/tests/ocsp.c /usr/src/debug/gnutls/3.8.5/tests/rsa-psk-cb.c /usr/src/debug/gnutls/3.8.5/tests/missingissuer.c /usr/src/debug/gnutls/3.8.5/tests/mini-x509-ipaddr.c /usr/src/debug/gnutls/3.8.5/tests/set_x509_key_mem.c /usr/src/debug/gnutls/3.8.5/tests/ciphersuite-name.c /usr/src/debug/gnutls/3.8.5/tests/set_x509_ocsp_multi_pem.c /usr/src/debug/gnutls/3.8.5/tests/urls.c /usr/src/debug/gnutls/3.8.5/tests/pathbuf.c /usr/src/debug/gnutls/3.8.5/tests/pskself.c /usr/src/debug/gnutls/3.8.5/tests/tls13-rehandshake-cert.c /usr/src/debug/gnutls/3.8.5/tests/record-sendfile.c /usr/src/debug/gnutls/3.8.5/tests/iov.c /usr/src/debug/gnutls/3.8.5/tests/psk-importer.c /usr/src/debug/gnutls/3.8.5/tests/key-material-set-dtls.c /usr/src/debug/gnutls/3.8.5/tests/rng-op-random.c /usr/src/debug/gnutls/3.8.5/tests/time.c /usr/src/d
 ebug/gnutls/3.8.5/tests/set_x509_ocsp_multi_cli.c /usr/src/debug/gnutls/3.8.5/tests/test-chains.h /usr/src/debug/gnutls/3.8.5/tests/mini-alpn.c /usr/src/debug/gnutls/3.8.5/tests/key-export-pkcs8.c /usr/src/debug/gnutls/3.8.5/tests/fips-override-test.c /usr/src/debug/gnutls/3.8.5/tests/record-sizes-range.c /usr/src/debug/gnutls/3.8.5/tests/client_dsa_key.c /usr/src/debug/gnutls/3.8.5/tests/tls-session-ext-override.c /usr/src/debug/gnutls/3.8.5/tests/mini-dtls0-9.c /usr/src/debug/gnutls/3.8.5/tests/tls12-rehandshake-cert-3.c /usr/src/debug/gnutls/3.8.5/tests/mini-dtls-hello-verify.c /usr/src/debug/gnutls/3.8.5/tests/dtls-pthread.c /usr/src/debug/gnutls/3.8.5/tests/x509sign-verify-rsa.c /usr/src/debug/gnutls/3.8.5/tests/psk-file.c /usr/src/debug/gnutls/3.8.5/tests/sign-verify-ed25519-rfc8080.c /usr/src/debug/gnutls/3.8.5/tests/set_x509_ocsp_multi_unknown.c /usr/src/debug/gnutls/3.8.5/tests/gnutls_x509_crt_sign.c /usr/src/debug/gnutls/3.8.5/tests/system-override-curves-allowlist.c /usr/
 src/debug/gnutls/3.8.5/tests/sign-verify-data-newapi.c /usr/src/debug/gnutls/3.8.5/tests/status-request-revoked.c /usr/src/debug/gnutls/3.8.5/tests/ocsp-filename-memleak.c /usr/src/debug/gnutls/3.8.5/tests/priority-mix.c /usr/src/debug/gnutls/3.8.5/tests/handshake-large-packet.c /usr/src/debug/gnutls/3.8.5/tests/tls-supplemental.c /usr/src/debug/gnutls/3.8.5/tests/protocol-set-allowlist.c /usr/src/debug/gnutls/3.8.5/tests/rehandshake-switch-cert-allow.c /usr/src/debug/gnutls/3.8.5/tests/gnutls_ext_raw_parse.c /usr/src/debug/gnutls/3.8.5/tests/test-chains-issuer.h /usr/src/debug/gnutls/3.8.5/tests/key-material-dtls.c /usr/src/debug/gnutls/3.8.5/tests/ecdh-compute2.c /usr/src/debug/gnutls/3.8.5/tests/tls12-rehandshake-cert-auto.c /usr/src/debug/gnutls/3.8.5/tests/resume-with-stek-expiration.c /usr/src/debug/gnutls/3.8.5/tests/session-rdn-read.c /usr/src/debug/gnutls/3.8.5/tests/set_x509_key_utf8.c /usr/src/debug/gnutls/3.8.5/tests/mini-x509-2.c /usr/src/debug/gnutls/3.8.5/tests/tls12-
 invalid-key-exchanges.c /usr/src/debug/gnutls/3.8.5/tests/dtls1-2-mtu-check.c /usr/src/debug/gnutls/3.8.5/tests/rng-no-onload.c /usr/src/debug/gnutls/3.8.5/tests/dhex509self.c /usr/src/debug/gnutls/3.8.5/tests/hostname-check-utf8.c /usr/src/debug/gnutls/3.8.5/tests/key-openssl.c /usr/src/debug/gnutls/3.8.5/tests/set_x509_key_file_der.c /usr/src/debug/gnutls/3.8.5/tests/sec-params.c /usr/src/debug/gnutls/3.8.5/tests/tls13-cert-key-exchange.c /usr/src/debug/gnutls/3.8.5/tests/ssl30-cert-key-exchange.c /usr/src/debug/gnutls/3.8.5/tests/pkcs12_s2k.c /usr/src/debug/gnutls/3.8.5/tests/pkcs12_s2k_pem.c /usr/src/debug/gnutls/3.8.5/tests/sign-pk-api.c /usr/src/debug/gnutls/3.8.5/tests/tls10-cert-key-exchange.c /usr/src/debug/gnutls/3.8.5/tests/dtls-etm.c /usr/src/debug/gnutls/3.8.5/tests/tls11-cert-key-exchange.c /usr/src/debug/gnutls/3.8.5/tests/tls12-cert-key-exchange.c /usr/src/debug/gnutls/3.8.5/tests/certuniqueid.c /usr/src/debug/gnutls/3.8.5/tests/resume-with-previous-stek.c /usr/src/d
 ebug/gnutls/3.8.5/tests/dtls-session-ticket-lost.c /usr/src/debug/gnutls/3.8.5/tests/set_known_dh_params_x509.c /usr/src/debug/gnutls/3.8.5/tests/sign-is-secure.c /usr/src/debug/gnutls/3.8.5/tests/tls-session-ext-register.c /usr/src/debug/gnutls/3.8.5/tests/priority-init2.c /usr/src/debug/gnutls/3.8.5/tests/mini-record-2.c /usr/src/debug/gnutls/3.8.5/tests/send-client-cert.c /usr/src/debug/gnutls/3.8.5/tests/tls-ext-not-in-dtls.c /usr/src/debug/gnutls/3.8.5/tests/handshake-timeout.c /usr/src/debug/gnutls/3.8.5/tests/tls-neg-ext4-key.c /usr/src/debug/gnutls/3.8.5/tests/ssl30-cipher-neg.c /usr/src/debug/gnutls/3.8.5/tests/tls10-cipher-neg.c /usr/src/debug/gnutls/3.8.5/tests/tls11-cipher-neg.c /usr/src/debug/gnutls/3.8.5/tests/tls12-cipher-neg.c /usr/src/debug/gnutls/3.8.5/tests/client-sign-md5-rep.c /usr/src/debug/gnutls/3.8.5/tests/server-sign-md5-rep.c /usr/src/debug/gnutls/3.8.5/tests/tls13-cipher-neg.c /usr/src/debug/gnutls/3.8.5/tests/rfc7633-ok.c /usr/src/debug/gnutls/3.8.5/test
 s/hostname-check.c /usr/src/debug/gnutls/3.8.5/tests/tls-session-supplemental.c /usr/src/debug/gnutls/3.8.5/tests/mini-dtls-hello-verify-48.c /usr/src/debug/gnutls/3.8.5/tests/set_key_utf8.c /usr/src/debug/gnutls/3.8.5/tests/handshake-write.c /usr/src/debug/gnutls/3.8.5/lib/nettle/int/rsa-oaep.h /usr/src/debug/gnutls/3.8.5/tests/init_roundtrip.c /usr/src/debug/gnutls/3.8.5/tests/handshake-false-start.c /usr/src/debug/gnutls/3.8.5/tests/tls12-max-record.c /usr/src/debug/gnutls/3.8.5/tests/tls12-anon-upgrade.c /usr/src/debug/gnutls/3.8.5/tests/common-key-tests.h /usr/src/debug/gnutls/3.8.5/tests/chainverify.c /usr/src/debug/gnutls/3.8.5/tests/auto-verify.c /usr/src/debug/gnutls/3.8.5/tests/sign-verify.c /usr/src/debug/gnutls/3.8.5/tests/insecure_key.c /usr/src/debug/gnutls/3.8.5/tests/server_ecdsa_key.c /usr/src/debug/gnutls/3.8.5/tests/cipher-padding.c /usr/src/debug/gnutls/3.8.5/tests/no-signal.c /usr/src/debug/gnutls/3.8.5/tests/custom-urls-override.c /usr/src/debug/gnutls/3.8.5/te
 sts/priority-set2.c /usr/src/debug/gnutls/3.8.5/tests/fips-test.c /usr/src/debug/gnutls/3.8.5/tests/keylog-env.c /usr/src/debug/gnutls/3.8.5/tests/pkcs12_encode.c /usr/src/debug/gnutls/3.8.5/tests/dtls-rehandshake-cert-2.c /usr/src/debug/gnutls/3.8.5/tests/name-constraints-merge.c /usr/src/debug/gnutls/3.8.5/tests/key-import-export.c /usr/src/debug/gnutls/3.8.5/lib/nettle/int/tls1-prf.h /usr/src/debug/gnutls/3.8.5/lib/nettle/int/tls1-prf.c /usr/src/debug/gnutls/3.8.5/tests/tls-channel-binding.c /usr/src/debug/gnutls/3.8.5/tests/setcredcrash.c /usr/src/debug/gnutls/3.8.5/tests/crt_inv_write.c /usr/src/debug/gnutls/3.8.5/tests/strict-der.c /usr/src/debug/gnutls/3.8.5/tests/common-cert-key-exchange.h /usr/src/debug/gnutls/3.8.5/tests/set_x509_ocsp_multi_invalid.c /usr/src/debug/gnutls/3.8.5/tests/ip-check.c /usr/src/debug/gnutls/3.8.5/tests/common-cert-key-exchange.c /usr/src/debug/gnutls/3.8.5/tests/dtls10-cert-key-exchange.c /usr/src/debug/gnutls/3.8.5/tests/dtls12-cert-key-exchange.
 c /usr/src/debug/gnutls/3.8.5/tests/rng-op-key.c /usr/src/debug/gnutls/3.8.5/tests/x509-cert-callback-legacy.c /usr/src/debug/gnutls/3.8.5/tests/cipher-alignment.c /usr/src/debug/gnutls/3.8.5/tests/rfc7633-missing.c /usr/src/debug/gnutls/3.8.5/tests/tls-record-size-limit.c /usr/src/debug/gnutls/3.8.5/tests/pskself2.c /usr/src/debug/gnutls/3.8.5/tests/rng-fork.c /usr/src/debug/gnutls/3.8.5/tests/cve-2009-1416.c /usr/src/debug/gnutls/3.8.5/tests/cve-2009-1415.c /usr/src/debug/gnutls/3.8.5/tests/tls-neg-ext-key.c /usr/src/debug/gnutls/3.8.5/tests/x509sign-verify-common.h /usr/src/debug/gnutls/3.8.5/tests/rsaes-pkcs1-v1_5.c /usr/src/debug/gnutls/3.8.5/lib/nettle/int/rsa-pad.c /usr/src/debug/gnutls/3.8.5/tests/srpbase64.c /usr/src/debug/gnutls/3.8.5/tests/x509-dn-decode-compat.c /usr/src/debug/gnutls/3.8.5/tests/dh-compute2.c /usr/src/debug/gnutls/3.8.5/tests/mpi.c /usr/src/debug/gnutls/3.8.5/tests/privkey-derive.c /usr/src/debug/gnutls/3.8.5/tests/privkey-keygen.c /usr/src/debug/gnutls/
 3.8.5/tests/infoaccess.c /usr/src/debug/gnutls/3.8.5/tests/tls13-early-data-neg.c /usr/src/debug/gnutls/3.8.5/tests/dh-params.c /usr/src/debug/gnutls/3.8.5/tests/mini-dtls-record-asym.c /usr/src/debug/gnutls/3.8.5/tests/rng-pthread.c /usr/src/debug/gnutls/3.8.5/tests/tls-pthread.c /usr/src/debug/gnutls/3.8.5/tests/x509-dn.c /usr/src/debug/gnutls/3.8.5/tests/mini-dtls-discard.c /usr/src/debug/gnutls/3.8.5/tests/x509cert-ct.c /usr/src/debug/gnutls/3.8.5/tests/tls12-rehandshake-ticket.c /usr/src/debug/gnutls/3.8.5/tests/gnutls-strcodes.c /usr/src/debug/gnutls/3.8.5/tests/openssl.c /usr/src/debug/gnutls/3.8.5/tests/buffer.c /usr/src/debug/gnutls/3.8.5/tests/x509dn.c /usr/src/debug/gnutls/3.8.5/tests/resume.c /usr/src/debug/gnutls/3.8.5/tests/rng-op.c /usr/src/debug/gnutls/3.8.5/tests/ocsp-common.h /usr/src/debug/gnutls/3.8.5/tests/simple.c /usr/src/debug/gnutls/3.8.5/tests/alerts.c /usr/src/debug/gnutls/3.8.5/tests/mini-global-load.c /usr/src/debug/gnutls/3.8.5/tests/gnutls_hmac_fast.c 
 /usr/src/debug/gnutls/3.8.5/tests/atfork.c /usr/src/debug/gnutls/3.8.5/tests/rng-sigint.c /usr/src/debug/gnutls/3.8.5/tests/cert-common.h /usr/src/debug/gnutls/3.8.5/tests/dhepskself.c /usr/src/debug/gnutls/3.8.5/tests/parse_ca.c /usr/src/debug/gnutls/3.8.5/tests/x509cert-dntypes.c /usr/src/debug/gnutls/3.8.5/tests/key-usage-ecdhe-rsa.c /usr/src/debug/gnutls/3.8.5/tests/post-client-hello-change-prio.c /usr/src/debug/gnutls/3.8.5/lib/nettle/int/dsa-validate.c /usr/src/debug/gnutls/3.8.5/tests/record-pad.c /usr/src/debug/gnutls/3.8.5/tests/sign-verify-ext.c /usr/src/debug/gnutls/3.8.5/tests/pkcs8-key-decode-encrypted.c /usr/src/debug/gnutls/3.8.5/tests/mini-x509-callbacks-intr.c /usr/src/debug/gnutls/3.8.5/tests/mini-eagain-dtls.c /usr/src/debug/gnutls/3.8.5/tests/mini-x509-callbacks.c /usr/src/debug/gnutls/3.8.5/tests/set_known_dh_params_psk.c /usr/src/debug/gnutls/3.8.5/tests/tls-force-ems.c /usr/src/debug/gnutls/3.8.5/tests/tls-force-etm.c /usr/src/debug/gnutls/3.8.5/tests/multi-al
 erts.c /usr/src/debug/gnutls/3.8.5/tests/naked-alerts.c /usr/src/debug/gnutls/3.8.5/tests/oids.c /usr/src/debug/gnutls/3.8.5/tests/set_known_dh_params_anon.c /usr/src/debug/gnutls/3.8.5/tests/crl-basic.c /usr/src/debug/gnutls/3.8.5/tests/crq-basic.c /usr/src/debug/gnutls/3.8.5/tests/kdf-api.c /usr/src/debug/gnutls/3.8.5/tests/set-default-prio.c /usr/src/debug/gnutls/3.8.5/tests/mini-server-name.c /usr/src/debug/gnutls/3.8.5/tests/pkcs7-cat-parse.c /usr/src/debug/gnutls/3.8.5/tests/x509-server-verify.c /usr/src/debug/gnutls/3.8.5/tests/x509sign-verify.c /usr/src/debug/gnutls/3.8.5/lib/nettle/int/dsa-fips.h /usr/src/debug/gnutls/3.8.5/lib/nettle/int/rsa-fips.h /usr/src/debug/gnutls/3.8.5/tests/crt_type-neg-common.c /usr/src/debug/gnutls/3.8.5/tests/gnutls_x509_crq_sign.c /usr/src/debug/gnutls/3.8.5/tests/tls13-early-data-neg2.c /usr/src/debug/gnutls/3.8.5/tests/system-prio-file.c /usr/src/debug/gnutls/3.8.5/tests/sign-verify-data.c /usr/src/debug/gnutls/3.8.5/lib/nettle/int/dsa-comput
 e-k.h /usr/src/debug/gnutls/3.8.5/tests/server-kx-neg-common.c /usr/src/debug/gnutls/3.8.5/tests/record-retvals.c /usr/src/debug/gnutls/3.8.5/lib/nettle/int/dsa-compute-k.c /usr/src/debug/gnutls/3.8.5/tests/certificate_set_x509_crl.c /usr/src/debug/gnutls/3.8.5/tests/chainverify-unsorted.c /usr/src/debug/gnutls/3.8.5/tests/status-request.c /usr/src/debug/gnutls/3.8.5/tests/set_key.c /usr/src/debug/gnutls/3.8.5/tests/pkcs12_simple.c /usr/src/debug/gnutls/3.8.5/tests/system-override-sig.c /usr/src/debug/gnutls/3.8.5/tests/mini-x509-cas.c /usr/src/debug/gnutls/3.8.5/tests/sign-verify-ext4.c /usr/src/debug/gnutls/3.8.5/tests/gnutls_x509_crt_list_import.c /usr/src/debug/gnutls/3.8.5/tests/alpn-server-prec.c /usr/src/debug/gnutls/3.8.5/tests/rehandshake-switch-cert-client-allow.c /usr/src/debug/gnutls/3.8.5/tests/mini-emsgsize-dtls.c /usr/src/debug/gnutls/3.8.5/tests/mini-x509.c /usr/src/debug/gnutls/3.8.5/lib/nettle/backport/gmp-glue.h /usr/src/debug/gnutls/3.8.5/tests/dtls-max-record.c 
 /usr/src/debug/gnutls/3.8.5/lib/nettle/backport/gmp-glue.c /usr/src/debug/gnutls/3.8.5/lib/nettle/backport/rsa-internal.h /usr/src/debug/gnutls/3.8.5/tests/cipher-neg-common.c /usr/src/debug/gnutls/3.8.5/tests/record-timeouts.c /usr/src/debug/gnutls/3.8.5/tests/dss-sig-val.c /usr/src/debug/gnutls/3.8.5/tests/pkcs8-key-decode.c /usr/src/debug/gnutls/3.8.5/tests/resume-with-false-start.c /usr/src/debug/gnutls/3.8.5/lib/nettle/int/provable-prime.c /usr/src/debug/gnutls/3.8.5/lib/nettle/backport/pss-mgf1.h /usr/src/debug/gnutls/3.8.5/lib/nettle/backport/pss-mgf1.c /usr/src/debug/gnutls/3.8.5/tests/mini-overhead.c /usr/src/debug/gnutls/3.8.5/tests/tls13-without-timeout-func.c /usr/src/debug/gnutls/3.8.5/tests/no-extensions.c /usr/src/debug/gnutls/3.8.5/tests/ssl2-hello.c /usr/src/debug/gnutls/3.8.5/lib/nettle/int/mpn-base256.c /usr/src/debug/gnutls/3.8.5/tests/set_x509_key_file_ocsp_multi2.c /usr/src/debug/gnutls/3.8.5/lib/nettle/int/mpn-base256.h /usr/src/debug/gnutls/3.8.5/tests/tls13-
 compat-mode.c /usr/src/debug/gnutls/3.8.5/tests/ssl30-server-kx-neg.c /usr/src/debug/gnutls/3.8.5/tests/tls10-server-kx-neg.c /usr/src/debug/gnutls/3.8.5/tests/tls11-server-kx-neg.c /usr/src/debug/gnutls/3.8.5/tests/tls12-server-kx-neg.c /usr/src/debug/gnutls/3.8.5/tests/pkcs7-gen.c /usr/src/debug/gnutls/3.8.5/tests/tls13-server-kx-neg.c /usr/src/debug/gnutls/3.8.5/tests/x509sign-verify-ecdsa.c /usr/src/debug/gnutls/3.8.5/tests/x509sign-verify-error.c /usr/src/debug/gnutls/3.8.5/tests/custom-urls.c /usr/src/debug/gnutls/3.8.5/tests/pcert-list.c /usr/src/debug/gnutls/3.8.5/tests/global-init.c /usr/src/debug/gnutls/3.8.5/tests/crl_apis.c /usr/src/debug/gnutls/3.8.5/tests/crq_apis.c /usr/src/debug/gnutls/3.8.5/tests/crt_apis.c /usr/src/debug/gnutls/3.8.5/lib/nettle/int/ecdsa-compute-k.h /usr/src/debug/gnutls/3.8.5/lib/nettle/backport/oaep.h /usr/src/debug/gnutls/3.8.5/lib/nettle/backport/oaep.c /usr/src/debug/gnutls/3.8.5/lib/nettle/int/ecdsa-compute-k.c /usr/src/debug/gnutls/3.8.5/tes
 ts/dh-compute.h /usr/src/debug/gnutls/3.8.5/tests/tls13-early-data.c /usr/src/debug/gnutls/3.8.5/tests/rsa-encrypt-decrypt.c /usr/src/debug/gnutls/3.8.5/tests/session-export-funcs.c /usr/src/debug/gnutls/3.8.5/tests/dh-compute.c /usr/src/debug/gnutls/3.8.5/tests/tls-crt_type-neg.c /usr/src/debug/gnutls/3.8.5/tests/anonself.c /usr/src/debug/gnutls/3.8.5/tests/x509self.c /usr/src/debug/gnutls/3.8.5/lib/nettle/int/dsa-keygen-fips186.c /usr/src/debug/gnutls/3.8.5/lib/nettle/int/rsa-keygen-fips186.c /usr/src/debug/gnutls/3.8.5/tests/dtls-handshake-versions.c /usr/src/debug/gnutls/3.8.5/tests/mini-dtls-large.c /usr/src/debug/gnutls/3.8.5/tests/mini-dtls-mtu.c /usr/src/debug/gnutls/3.8.5/tests/tlsext-decoding.c /usr/src/debug/gnutls/3.8.5/tests/rehandshake-switch-cert.c /usr/src/debug/gnutls/3.8.5/tests/resume-lifetime.c /usr/src/debug/gnutls/3.8.5/tests/priority-set.c /usr/src/debug/gnutls/3.8.5/tests/mini-chain-unsorted.c /usr/src/debug/gnutls/3.8.5/tests/eagain-common.h /usr/src/debug/g
 nutls/3.8.5/tests/x509cert-invalid.c /usr/src/debug/gnutls/3.8.5/tests/trustdb-tofu.c /usr/src/debug/gnutls/3.8.5/tests/cert-repro-20170915.h /usr/src/debug/gnutls/3.8.5/tests/crq_key_id.c /usr/src/debug/gnutls/3.8.5/tests/dtls-repro-20170915.c /usr/src/debug/gnutls/3.8.5/tests/aead-cipher-vec.c /usr/src/debug/gnutls/3.8.5/tests/gnutls_ocsp_resp_list_import2.c /usr/src/debug/gnutls/3.8.5/tests/gnutls_session_set_id.c /usr/src/debug/gnutls/3.8.5/tests/record-sizes.c /usr/src/debug/gnutls/3.8.5/tests/dn2.c", added "/usr/src/debug/gnutls/3.8.6/tests/fips-rsa-sizes.c /usr/src/debug/gnutls/3.8.6/tests/tlsfeature-crt.c /usr/src/debug/gnutls/3.8.6/tests/tlsfeature-ext.c /usr/src/debug/gnutls/3.8.6/tests/prf.c /usr/src/debug/gnutls/3.8.6/tests/no-status-request.c /usr/src/debug/gnutls/3.8.6/tests/dtls-rehandshake-cert-3.c /usr/src/debug/gnutls/3.8.6/tests/ecdh-compute.c /usr/src/debug/gnutls/3.8.6/tests/session-tickets-missing.c /usr/src/debug/gnutls/3.8.6/tests/priorities.c /usr/src/debug/
 gnutls/3.8.6/tests/duplicate-extensions.c /usr/src/debug/gnutls/3.8.6/tests/tls-ext-register.c /usr/src/debug/gnutls/3.8.6/tests/id-on-xmppAddr.c /usr/src/debug/gnutls/3.8.6/tests/utils-adv.c /usr/src/debug/gnutls/3.8.6/tests/rehandshake-ext-secret.c /usr/src/debug/gnutls/3.8.6/tests/rsa-rsa-pss.c /usr/src/debug/gnutls/3.8.6/tests/crlverify.c /usr/src/debug/gnutls/3.8.6/tests/recv-data-before-handshake.c /usr/src/debug/gnutls/3.8.6/tests/send-data-before-handshake.c /usr/src/debug/gnutls/3.8.6/tests/long-session-id.c /usr/src/debug/gnutls/3.8.6/tests/gnutls-ids.c /usr/src/debug/gnutls/3.8.6/tests/cve-2008-4989.c /usr/src/debug/gnutls/3.8.6/tests/set_x509_key.c /usr/src/debug/gnutls/3.8.6/tests/handshake-large-cert.c /usr/src/debug/gnutls/3.8.6/tests/mini-session-verify-function.c /usr/src/debug/gnutls/3.8.6/tests/x509-upnconstraint.c /usr/src/debug/gnutls/3.8.6/tests/dn.c /usr/src/debug/gnutls/3.8.6/tests/rehandshake-switch-psk-id.c /usr/src/debug/gnutls/3.8.6/tests/rehandshake-swit
 ch-srp-id.c /usr/src/debug/gnutls/3.8.6/tests/system-override-hash.c /usr/src/debug/gnutls/3.8.6/tests/x509-cert-callback.c /usr/src/debug/gnutls/3.8.6/tests/priorities-groups.c /usr/src/debug/gnutls/3.8.6/tests/x509-verify-with-crl.c /usr/src/debug/gnutls/3.8.6/tests/set_x509_key_file_legacy.c /usr/src/debug/gnutls/3.8.6/tests/virt-time.h /usr/src/debug/gnutls/3.8.6/tests/mini-record.c /usr/src/debug/gnutls/3.8.6/tests/test-chains-issuer-aia.h /usr/src/debug/gnutls/3.8.6/tests/trust-store.c /usr/src/debug/gnutls/3.8.6/tests/handshake-versions.c /usr/src/debug/gnutls/3.8.6/tests/tls12-rehandshake-set-prio.c /usr/src/debug/gnutls/3.8.6/tests/version-checks.c /usr/src/debug/gnutls/3.8.6/tests/x509-dn-decode.c /usr/src/debug/gnutls/3.8.6/tests/cert.c /usr/src/debug/gnutls/3.8.6/tests/nul-in-x509-names.c /usr/src/debug/gnutls/3.8.6/tests/null_retrieve_function.c /usr/src/debug/gnutls/3.8.6/tests/spki.c /usr/src/debug/gnutls/3.8.6/tests/rehandshake-switch-cert-client.c /usr/src/debug/gnu
 tls/3.8.6/tests/sign-verify-newapi.c /usr/src/debug/gnutls/3.8.6/tests/privkey-verify-broken.c /usr/src/debug/gnutls/3.8.6/lib/nettle/backport/rsa-oaep-decrypt.c /usr/src/debug/gnutls/3.8.6/tests/pkcs1-digest-info.c /usr/src/debug/gnutls/3.8.6/tests/client-fastopen.c /usr/src/debug/gnutls/3.8.6/tests/x509_altname.c /usr/src/debug/gnutls/3.8.6/tests/x509cert.c /usr/src/debug/gnutls/3.8.6/tests/key-usage-rsa.c /usr/src/debug/gnutls/3.8.6/tests/mini-dtls-fork.c /usr/src/debug/gnutls/3.8.6/tests/mini-dtls-srtp.c /usr/src/debug/gnutls/3.8.6/tests/name-constraints.c /usr/src/debug/gnutls/3.8.6/tests/rsa-rsa-oaep.c /usr/src/debug/gnutls/3.8.6/tests/rsa-psk.c /usr/src/debug/gnutls/3.8.6/tests/gnutls_ext_raw_parse_dtls.c /usr/src/debug/gnutls/3.8.6/tests/sign-verify-deterministic.c /usr/src/debug/gnutls/3.8.6/tests/rawpk-api.c /usr/src/debug/gnutls/3.8.6/tests/tls13-early-start.c /usr/src/debug/gnutls/3.8.6/tests/srp.c /usr/src/debug/gnutls/3.8.6/tests/mini-dtls-heartbeat.c /usr/src/debug/gn
 utls/3.8.6/tests/session-tickets-ok.c /usr/src/debug/gnutls/3.8.6/lib/nettle/backport/rsa-sec-compute-root.c /usr/src/debug/gnutls/3.8.6/lib/nettle/backport/sha3-shake.c /usr/src/debug/gnutls/3.8.6/tests/tls-etm.c /usr/src/debug/gnutls/3.8.6/tests/atfork.c /usr/src/debug/gnutls/3.8.6/tests/set_x509_pkcs12_key.c /usr/src/debug/gnutls/3.8.6/tests/tls12-ffdhe.c /usr/src/debug/gnutls/3.8.6/tests/x509-verify-duplicate.c /usr/src/debug/gnutls/3.8.6/tests/utils.h /usr/src/debug/gnutls/3.8.6/tests/pkcs7.c /usr/src/debug/gnutls/3.8.6/tests/utils.c /usr/src/debug/gnutls/3.8.6/tests/openconnect-dtls12.c /usr/src/debug/gnutls/3.8.6/tests/tls12-rehandshake-cert-2.c /usr/src/debug/gnutls/3.8.6/tests/set_x509_key_file-late.c /usr/src/debug/gnutls/3.8.6/tests/set_x509_key_file_ocsp.c /usr/src/debug/gnutls/3.8.6/tests/resume-with-record-size-limit.c /usr/src/debug/gnutls/3.8.6/tests/x509sign-verify-gost.c /usr/src/debug/gnutls/3.8.6/tests/client-secrets.h /usr/src/debug/gnutls/3.8.6/tests/server-sec
 rets.h /usr/src/debug/gnutls/3.8.6/tests/empty_retrieve_function.c /usr/src/debug/gnutls/3.8.6/tests/hex.c /usr/src/debug/gnutls/3.8.6/tests/cert-status.c /usr/src/debug/gnutls/3.8.6/tests/fallback-scsv.c /usr/src/debug/gnutls/3.8.6/tests/mini-key-material.c /usr/src/debug/gnutls/3.8.6/tests/x509-extensions.c /usr/src/debug/gnutls/3.8.6/tests/random-art.c /usr/src/debug/gnutls/3.8.6/tests/mini-record-range.c /usr/src/debug/gnutls/3.8.6/tests/missingissuer_aia.c /usr/src/debug/gnutls/3.8.6/tests/mini-tls-nonblock.c /usr/src/debug/gnutls/3.8.6/tests/rsa-illegal-import.c /usr/src/debug/gnutls/3.8.6/tests/system-override-sig-tls.c /usr/src/debug/gnutls/3.8.6/tests/xts-key-check.c /usr/src/debug/gnutls/3.8.6/tests/mini-record-failure.c /usr/src/debug/gnutls/3.8.6/lib/nettle/backport/rsa-sign-tr.c /usr/src/debug/gnutls/3.8.6/tests/mini-dtls-record.c /usr/src/debug/gnutls/3.8.6/lib/nettle/backport/nettle-write.h /usr/src/debug/gnutls/3.8.6/tests/dtls-rehandshake-anon.c /usr/src/debug/gnutl
 s/3.8.6/tests/dtls-rehandshake-cert.c /usr/src/debug/gnutls/3.8.6/tests/set_pkcs12_cred.c /usr/src/debug/gnutls/3.8.6/lib/nettle/backport/rsa-oaep-encrypt.c /usr/src/debug/gnutls/3.8.6/tests/status-request-ok.c /usr/src/debug/gnutls/3.8.6/tests/gnutls_x509_privkey_import.c /usr/src/debug/gnutls/3.8.6/tests/resume-dtls.c /usr/src/debug/gnutls/3.8.6/tests/rng-op-nonce.c /usr/src/debug/gnutls/3.8.6/tests/cert_verify_inv_utf8.c /usr/src/debug/gnutls/3.8.6/tests/base64-raw.c /usr/src/debug/gnutls/3.8.6/tests/x509cert-tl.c /usr/src/debug/gnutls/3.8.6/tests/mini-termination.c /usr/src/debug/gnutls/3.8.6/tests/x509-cert-callback-ocsp.c /usr/src/debug/gnutls/3.8.6/tests/pkcs7-verify-double-free.c /usr/src/debug/gnutls/3.8.6/tests/pubkey-import-export.c /usr/src/debug/gnutls/3.8.6/tests/mini-loss-time.c /usr/src/debug/gnutls/3.8.6/tests/set_x509_key_file.c /usr/src/debug/gnutls/3.8.6/tests/spki-abstract.c /usr/src/debug/gnutls/3.8.6/tests/mini-dtls-lowmtu.c /usr/src/debug/gnutls/3.8.6/tests/t
 ls-record-size-limit-asym.c /usr/src/debug/gnutls/3.8.6/tests/keylog-func.c /usr/src/debug/gnutls/3.8.6/tests/status-request-ext.c /usr/src/debug/gnutls/3.8.6/lib/nettle/backport/shake128.c /usr/src/debug/gnutls/3.8.6/lib/nettle/backport/shake256.c /usr/src/debug/gnutls/3.8.6/tests/ocsp.c /usr/src/debug/gnutls/3.8.6/tests/rsa-psk-cb.c /usr/src/debug/gnutls/3.8.6/tests/missingissuer.c /usr/src/debug/gnutls/3.8.6/tests/mini-x509-ipaddr.c /usr/src/debug/gnutls/3.8.6/tests/set_x509_key_mem.c /usr/src/debug/gnutls/3.8.6/tests/ciphersuite-name.c /usr/src/debug/gnutls/3.8.6/tests/set_x509_ocsp_multi_pem.c /usr/src/debug/gnutls/3.8.6/tests/urls.c /usr/src/debug/gnutls/3.8.6/tests/pathbuf.c /usr/src/debug/gnutls/3.8.6/tests/pskself.c /usr/src/debug/gnutls/3.8.6/tests/tls13-rehandshake-cert.c /usr/src/debug/gnutls/3.8.6/tests/record-sendfile.c /usr/src/debug/gnutls/3.8.6/tests/iov.c /usr/src/debug/gnutls/3.8.6/tests/psk-importer.c /usr/src/debug/gnutls/3.8.6/tests/key-material-set-dtls.c /usr
 /src/debug/gnutls/3.8.6/tests/rng-op-random.c /usr/src/debug/gnutls/3.8.6/tests/time.c /usr/src/debug/gnutls/3.8.6/tests/set_x509_ocsp_multi_cli.c /usr/src/debug/gnutls/3.8.6/tests/test-chains.h /usr/src/debug/gnutls/3.8.6/tests/mini-alpn.c /usr/src/debug/gnutls/3.8.6/tests/key-export-pkcs8.c /usr/src/debug/gnutls/3.8.6/tests/fips-override-test.c /usr/src/debug/gnutls/3.8.6/tests/record-sizes-range.c /usr/src/debug/gnutls/3.8.6/tests/client_dsa_key.c /usr/src/debug/gnutls/3.8.6/tests/tls-session-ext-override.c /usr/src/debug/gnutls/3.8.6/tests/mini-dtls0-9.c /usr/src/debug/gnutls/3.8.6/tests/tls12-rehandshake-cert-3.c /usr/src/debug/gnutls/3.8.6/tests/mini-dtls-hello-verify.c /usr/src/debug/gnutls/3.8.6/tests/x509sign-verify-rsa.c /usr/src/debug/gnutls/3.8.6/lib/nettle/backport/sha3-internal.h /usr/src/debug/gnutls/3.8.6/tests/psk-file.c /usr/src/debug/gnutls/3.8.6/tests/sign-verify-ed25519-rfc8080.c /usr/src/debug/gnutls/3.8.6/tests/set_x509_ocsp_multi_unknown.c /usr/src/debug/gnut
 ls/3.8.6/tests/gnutls_x509_crt_sign.c /usr/src/debug/gnutls/3.8.6/tests/system-override-curves-allowlist.c /usr/src/debug/gnutls/3.8.6/tests/sign-verify-data-newapi.c /usr/src/debug/gnutls/3.8.6/tests/status-request-revoked.c /usr/src/debug/gnutls/3.8.6/tests/ocsp-filename-memleak.c /usr/src/debug/gnutls/3.8.6/tests/priority-mix.c /usr/src/debug/gnutls/3.8.6/tests/handshake-large-packet.c /usr/src/debug/gnutls/3.8.6/tests/tls-supplemental.c /usr/src/debug/gnutls/3.8.6/tests/protocol-set-allowlist.c /usr/src/debug/gnutls/3.8.6/tests/rehandshake-switch-cert-allow.c /usr/src/debug/gnutls/3.8.6/tests/gnutls_ext_raw_parse.c /usr/src/debug/gnutls/3.8.6/tests/test-chains-issuer.h /usr/src/debug/gnutls/3.8.6/tests/key-material-dtls.c /usr/src/debug/gnutls/3.8.6/tests/ecdh-compute2.c /usr/src/debug/gnutls/3.8.6/tests/tls12-rehandshake-cert-auto.c /usr/src/debug/gnutls/3.8.6/tests/resume-with-stek-expiration.c /usr/src/debug/gnutls/3.8.6/tests/session-rdn-read.c /usr/src/debug/gnutls/3.8.6/te
 sts/set_x509_key_utf8.c /usr/src/debug/gnutls/3.8.6/tests/mini-x509-2.c /usr/src/debug/gnutls/3.8.6/tests/tls12-invalid-key-exchanges.c /usr/src/debug/gnutls/3.8.6/tests/dtls1-2-mtu-check.c /usr/src/debug/gnutls/3.8.6/tests/rng-no-onload.c /usr/src/debug/gnutls/3.8.6/tests/dhex509self.c /usr/src/debug/gnutls/3.8.6/tests/hostname-check-utf8.c /usr/src/debug/gnutls/3.8.6/tests/key-openssl.c /usr/src/debug/gnutls/3.8.6/lib/nettle/int/sha3-shake.h /usr/src/debug/gnutls/3.8.6/tests/set_x509_key_file_der.c /usr/src/debug/gnutls/3.8.6/tests/sec-params.c /usr/src/debug/gnutls/3.8.6/tests/tls13-cert-key-exchange.c /usr/src/debug/gnutls/3.8.6/tests/ssl30-cert-key-exchange.c /usr/src/debug/gnutls/3.8.6/tests/pkcs12_s2k.c /usr/src/debug/gnutls/3.8.6/tests/pkcs12_s2k_pem.c /usr/src/debug/gnutls/3.8.6/tests/sign-pk-api.c /usr/src/debug/gnutls/3.8.6/tests/tls10-cert-key-exchange.c /usr/src/debug/gnutls/3.8.6/tests/dtls-etm.c /usr/src/debug/gnutls/3.8.6/tests/tls11-cert-key-exchange.c /usr/src/debu
 g/gnutls/3.8.6/tests/tls12-cert-key-exchange.c /usr/src/debug/gnutls/3.8.6/tests/certuniqueid.c /usr/src/debug/gnutls/3.8.6/tests/resume-with-previous-stek.c /usr/src/debug/gnutls/3.8.6/tests/dtls-session-ticket-lost.c /usr/src/debug/gnutls/3.8.6/tests/set_known_dh_params_x509.c /usr/src/debug/gnutls/3.8.6/tests/sign-is-secure.c /usr/src/debug/gnutls/3.8.6/tests/tls-session-ext-register.c /usr/src/debug/gnutls/3.8.6/tests/priority-init2.c /usr/src/debug/gnutls/3.8.6/tests/mini-record-2.c /usr/src/debug/gnutls/3.8.6/tests/send-client-cert.c /usr/src/debug/gnutls/3.8.6/tests/tls-ext-not-in-dtls.c /usr/src/debug/gnutls/3.8.6/tests/handshake-timeout.c /usr/src/debug/gnutls/3.8.6/tests/tls-neg-ext4-key.c /usr/src/debug/gnutls/3.8.6/tests/ssl30-cipher-neg.c /usr/src/debug/gnutls/3.8.6/tests/tls10-cipher-neg.c /usr/src/debug/gnutls/3.8.6/tests/tls11-cipher-neg.c /usr/src/debug/gnutls/3.8.6/tests/tls12-cipher-neg.c /usr/src/debug/gnutls/3.8.6/tests/client-sign-md5-rep.c /usr/src/debug/gnutl
 s/3.8.6/tests/server-sign-md5-rep.c /usr/src/debug/gnutls/3.8.6/tests/tls13-cipher-neg.c /usr/src/debug/gnutls/3.8.6/tests/rfc7633-ok.c /usr/src/debug/gnutls/3.8.6/tests/hostname-check.c /usr/src/debug/gnutls/3.8.6/tests/tls-session-supplemental.c /usr/src/debug/gnutls/3.8.6/tests/mini-dtls-hello-verify-48.c /usr/src/debug/gnutls/3.8.6/tests/set_key_utf8.c /usr/src/debug/gnutls/3.8.6/tests/handshake-write.c /usr/src/debug/gnutls/3.8.6/lib/nettle/int/rsa-oaep.h /usr/src/debug/gnutls/3.8.6/tests/init_roundtrip.c /usr/src/debug/gnutls/3.8.6/tests/handshake-false-start.c /usr/src/debug/gnutls/3.8.6/tests/tls12-max-record.c /usr/src/debug/gnutls/3.8.6/tests/tls12-anon-upgrade.c /usr/src/debug/gnutls/3.8.6/tests/common-key-tests.h /usr/src/debug/gnutls/3.8.6/tests/chainverify.c /usr/src/debug/gnutls/3.8.6/tests/auto-verify.c /usr/src/debug/gnutls/3.8.6/tests/sign-verify.c /usr/src/debug/gnutls/3.8.6/tests/insecure_key.c /usr/src/debug/gnutls/3.8.6/tests/server_ecdsa_key.c /usr/src/debug/g
 nutls/3.8.6/tests/cipher-padding.c /usr/src/debug/gnutls/3.8.6/tests/no-signal.c /usr/src/debug/gnutls/3.8.6/tests/custom-urls-override.c /usr/src/debug/gnutls/3.8.6/tests/priority-set2.c /usr/src/debug/gnutls/3.8.6/tests/fips-test.c /usr/src/debug/gnutls/3.8.6/tests/keylog-env.c /usr/src/debug/gnutls/3.8.6/tests/pkcs12_encode.c /usr/src/debug/gnutls/3.8.6/tests/dtls-rehandshake-cert-2.c /usr/src/debug/gnutls/3.8.6/tests/name-constraints-merge.c /usr/src/debug/gnutls/3.8.6/tests/key-import-export.c /usr/src/debug/gnutls/3.8.6/lib/nettle/int/tls1-prf.h /usr/src/debug/gnutls/3.8.6/lib/nettle/int/tls1-prf.c /usr/src/debug/gnutls/3.8.6/tests/tls-channel-binding.c /usr/src/debug/gnutls/3.8.6/tests/setcredcrash.c /usr/src/debug/gnutls/3.8.6/tests/crt_inv_write.c /usr/src/debug/gnutls/3.8.6/tests/strict-der.c /usr/src/debug/gnutls/3.8.6/tests/common-cert-key-exchange.h /usr/src/debug/gnutls/3.8.6/tests/set_x509_ocsp_multi_invalid.c /usr/src/debug/gnutls/3.8.6/tests/ip-check.c /usr/src/debu
 g/gnutls/3.8.6/tests/common-cert-key-exchange.c /usr/src/debug/gnutls/3.8.6/tests/dtls10-cert-key-exchange.c /usr/src/debug/gnutls/3.8.6/tests/dtls12-cert-key-exchange.c /usr/src/debug/gnutls/3.8.6/lib/nettle/backport/write-le64.c /usr/src/debug/gnutls/3.8.6/tests/rng-op-key.c /usr/src/debug/gnutls/3.8.6/tests/x509-cert-callback-legacy.c /usr/src/debug/gnutls/3.8.6/tests/cipher-alignment.c /usr/src/debug/gnutls/3.8.6/tests/rfc7633-missing.c /usr/src/debug/gnutls/3.8.6/tests/tls-record-size-limit.c /usr/src/debug/gnutls/3.8.6/tests/pskself2.c /usr/src/debug/gnutls/3.8.6/tests/rng-fork.c /usr/src/debug/gnutls/3.8.6/tests/cve-2009-1415.c /usr/src/debug/gnutls/3.8.6/tests/cve-2009-1416.c /usr/src/debug/gnutls/3.8.6/tests/tls-neg-ext-key.c /usr/src/debug/gnutls/3.8.6/tests/x509sign-verify-common.h /usr/src/debug/gnutls/3.8.6/tests/rsaes-pkcs1-v1_5.c /usr/src/debug/gnutls/3.8.6/lib/nettle/int/rsa-pad.c /usr/src/debug/gnutls/3.8.6/tests/srpbase64.c /usr/src/debug/gnutls/3.8.6/tests/x509-dn
 -decode-compat.c /usr/src/debug/gnutls/3.8.6/tests/dh-compute2.c /usr/src/debug/gnutls/3.8.6/tests/mpi.c /usr/src/debug/gnutls/3.8.6/tests/privkey-derive.c /usr/src/debug/gnutls/3.8.6/tests/privkey-keygen.c /usr/src/debug/gnutls/3.8.6/tests/infoaccess.c /usr/src/debug/gnutls/3.8.6/tests/tls13-early-data-neg.c /usr/src/debug/gnutls/3.8.6/tests/dh-params.c /usr/src/debug/gnutls/3.8.6/tests/mini-dtls-record-asym.c /usr/src/debug/gnutls/3.8.6/tests/x509-dn.c /usr/src/debug/gnutls/3.8.6/tests/mini-dtls-discard.c /usr/src/debug/gnutls/3.8.6/tests/x509cert-ct.c /usr/src/debug/gnutls/3.8.6/tests/tls12-rehandshake-ticket.c /usr/src/debug/gnutls/3.8.6/tests/gnutls-strcodes.c /usr/src/debug/gnutls/3.8.6/tests/openssl.c /usr/src/debug/gnutls/3.8.6/tests/base64.c /usr/src/debug/gnutls/3.8.6/tests/buffer.c /usr/src/debug/gnutls/3.8.6/tests/simple.c /usr/src/debug/gnutls/3.8.6/tests/x509dn.c /usr/src/debug/gnutls/3.8.6/tests/ocsp-common.h /usr/src/debug/gnutls/3.8.6/tests/resume.c /usr/src/debug/g
 nutls/3.8.6/tests/rng-op.c /usr/src/debug/gnutls/3.8.6/tests/mini-global-load.c /usr/src/debug/gnutls/3.8.6/tests/gnutls_hmac_fast.c /usr/src/debug/gnutls/3.8.6/tests/alerts.c /usr/src/debug/gnutls/3.8.6/tests/rng-sigint.c /usr/src/debug/gnutls/3.8.6/tests/cert-common.h /usr/src/debug/gnutls/3.8.6/tests/dhepskself.c /usr/src/debug/gnutls/3.8.6/lib/nettle/backport/sha3.c /usr/src/debug/gnutls/3.8.6/tests/parse_ca.c /usr/src/debug/gnutls/3.8.6/tests/x509cert-dntypes.c /usr/src/debug/gnutls/3.8.6/tests/key-usage-ecdhe-rsa.c /usr/src/debug/gnutls/3.8.6/tests/post-client-hello-change-prio.c /usr/src/debug/gnutls/3.8.6/lib/nettle/int/dsa-validate.c /usr/src/debug/gnutls/3.8.6/tests/record-pad.c /usr/src/debug/gnutls/3.8.6/tests/sign-verify-ext.c /usr/src/debug/gnutls/3.8.6/tests/pkcs8-key-decode-encrypted.c /usr/src/debug/gnutls/3.8.6/tests/mini-x509-callbacks-intr.c /usr/src/debug/gnutls/3.8.6/tests/mini-eagain-dtls.c /usr/src/debug/gnutls/3.8.6/tests/mini-x509-callbacks.c /usr/src/debug
 /gnutls/3.8.6/tests/set_known_dh_params_psk.c /usr/src/debug/gnutls/3.8.6/tests/tls-force-ems.c /usr/src/debug/gnutls/3.8.6/tests/tls-force-etm.c /usr/src/debug/gnutls/3.8.6/tests/multi-alerts.c /usr/src/debug/gnutls/3.8.6/tests/naked-alerts.c /usr/src/debug/gnutls/3.8.6/tests/oids.c /usr/src/debug/gnutls/3.8.6/tests/set_known_dh_params_anon.c /usr/src/debug/gnutls/3.8.6/tests/crl-basic.c /usr/src/debug/gnutls/3.8.6/tests/crq-basic.c /usr/src/debug/gnutls/3.8.6/tests/kdf-api.c /usr/src/debug/gnutls/3.8.6/tests/set-default-prio.c /usr/src/debug/gnutls/3.8.6/tests/mini-server-name.c /usr/src/debug/gnutls/3.8.6/tests/pkcs7-cat-parse.c /usr/src/debug/gnutls/3.8.6/tests/x509-server-verify.c /usr/src/debug/gnutls/3.8.6/tests/x509sign-verify.c /usr/src/debug/gnutls/3.8.6/lib/nettle/int/dsa-fips.h /usr/src/debug/gnutls/3.8.6/lib/nettle/int/rsa-fips.h /usr/src/debug/gnutls/3.8.6/tests/crt_type-neg-common.c /usr/src/debug/gnutls/3.8.6/tests/gnutls_x509_crq_sign.c /usr/src/debug/gnutls/3.8.6/t
 ests/tls13-early-data-neg2.c /usr/src/debug/gnutls/3.8.6/tests/system-prio-file.c /usr/src/debug/gnutls/3.8.6/tests/sign-verify-data.c /usr/src/debug/gnutls/3.8.6/lib/nettle/int/dsa-compute-k.h /usr/src/debug/gnutls/3.8.6/tests/server-kx-neg-common.c /usr/src/debug/gnutls/3.8.6/tests/record-retvals.c /usr/src/debug/gnutls/3.8.6/lib/nettle/int/dsa-compute-k.c /usr/src/debug/gnutls/3.8.6/tests/certificate_set_x509_crl.c /usr/src/debug/gnutls/3.8.6/tests/chainverify-unsorted.c /usr/src/debug/gnutls/3.8.6/tests/status-request.c /usr/src/debug/gnutls/3.8.6/tests/set_key.c /usr/src/debug/gnutls/3.8.6/tests/pkcs12_simple.c /usr/src/debug/gnutls/3.8.6/tests/system-override-sig.c /usr/src/debug/gnutls/3.8.6/tests/mini-x509-cas.c /usr/src/debug/gnutls/3.8.6/tests/sign-verify-ext4.c /usr/src/debug/gnutls/3.8.6/tests/gnutls_x509_crt_list_import.c /usr/src/debug/gnutls/3.8.6/tests/alpn-server-prec.c /usr/src/debug/gnutls/3.8.6/tests/rehandshake-switch-cert-client-allow.c /usr/src/debug/gnutls/3.
 8.6/tests/mini-emsgsize-dtls.c /usr/src/debug/gnutls/3.8.6/tests/mini-x509.c /usr/src/debug/gnutls/3.8.6/lib/nettle/backport/gmp-glue.h /usr/src/debug/gnutls/3.8.6/tests/dtls-max-record.c /usr/src/debug/gnutls/3.8.6/lib/nettle/backport/gmp-glue.c /usr/src/debug/gnutls/3.8.6/lib/nettle/backport/rsa-internal.h /usr/src/debug/gnutls/3.8.6/tests/cipher-neg-common.c /usr/src/debug/gnutls/3.8.6/tests/record-timeouts.c /usr/src/debug/gnutls/3.8.6/tests/dss-sig-val.c /usr/src/debug/gnutls/3.8.6/tests/pkcs8-key-decode.c /usr/src/debug/gnutls/3.8.6/tests/resume-with-false-start.c /usr/src/debug/gnutls/3.8.6/lib/nettle/int/provable-prime.c /usr/src/debug/gnutls/3.8.6/lib/nettle/backport/pss-mgf1.h /usr/src/debug/gnutls/3.8.6/lib/nettle/backport/pss-mgf1.c /usr/src/debug/gnutls/3.8.6/tests/mini-overhead.c /usr/src/debug/gnutls/3.8.6/tests/tls13-without-timeout-func.c /usr/src/debug/gnutls/3.8.6/tests/no-extensions.c /usr/src/debug/gnutls/3.8.6/tests/ssl2-hello.c /usr/src/debug/gnutls/3.8.6/lib/
 nettle/int/mpn-base256.c /usr/src/debug/gnutls/3.8.6/tests/set_x509_key_file_ocsp_multi2.c /usr/src/debug/gnutls/3.8.6/lib/nettle/int/mpn-base256.h /usr/src/debug/gnutls/3.8.6/tests/tls13-compat-mode.c /usr/src/debug/gnutls/3.8.6/tests/ssl30-server-kx-neg.c /usr/src/debug/gnutls/3.8.6/tests/tls10-server-kx-neg.c /usr/src/debug/gnutls/3.8.6/tests/tls11-server-kx-neg.c /usr/src/debug/gnutls/3.8.6/tests/tls12-server-kx-neg.c /usr/src/debug/gnutls/3.8.6/tests/pkcs7-gen.c /usr/src/debug/gnutls/3.8.6/tests/tls13-server-kx-neg.c /usr/src/debug/gnutls/3.8.6/tests/x509sign-verify-ecdsa.c /usr/src/debug/gnutls/3.8.6/tests/x509sign-verify-error.c /usr/src/debug/gnutls/3.8.6/tests/custom-urls.c /usr/src/debug/gnutls/3.8.6/tests/pcert-list.c /usr/src/debug/gnutls/3.8.6/tests/global-init.c /usr/src/debug/gnutls/3.8.6/tests/crl_apis.c /usr/src/debug/gnutls/3.8.6/tests/crq_apis.c /usr/src/debug/gnutls/3.8.6/tests/crt_apis.c /usr/src/debug/gnutls/3.8.6/lib/nettle/int/ecdsa-compute-k.h /usr/src/debug
 /gnutls/3.8.6/lib/nettle/backport/oaep.h /usr/src/debug/gnutls/3.8.6/lib/nettle/backport/oaep.c /usr/src/debug/gnutls/3.8.6/lib/nettle/int/ecdsa-compute-k.c /usr/src/debug/gnutls/3.8.6/tests/dh-compute.h /usr/src/debug/gnutls/3.8.6/tests/tls13-early-data.c /usr/src/debug/gnutls/3.8.6/tests/rsa-encrypt-decrypt.c /usr/src/debug/gnutls/3.8.6/tests/session-export-funcs.c /usr/src/debug/gnutls/3.8.6/tests/dh-compute.c /usr/src/debug/gnutls/3.8.6/tests/tls-crt_type-neg.c /usr/src/debug/gnutls/3.8.6/tests/anonself.c /usr/src/debug/gnutls/3.8.6/tests/x509self.c /usr/src/debug/gnutls/3.8.6/lib/nettle/int/dsa-keygen-fips186.c /usr/src/debug/gnutls/3.8.6/lib/nettle/int/rsa-keygen-fips186.c /usr/src/debug/gnutls/3.8.6/tests/dtls-handshake-versions.c /usr/src/debug/gnutls/3.8.6/tests/mini-dtls-large.c /usr/src/debug/gnutls/3.8.6/tests/mini-dtls-mtu.c /usr/src/debug/gnutls/3.8.6/tests/tlsext-decoding.c /usr/src/debug/gnutls/3.8.6/tests/rehandshake-switch-cert.c /usr/src/debug/gnutls/3.8.6/tests/r
 esume-lifetime.c /usr/src/debug/gnutls/3.8.6/tests/priority-set.c /usr/src/debug/gnutls/3.8.6/tests/mini-chain-unsorted.c /usr/src/debug/gnutls/3.8.6/tests/eagain-common.h /usr/src/debug/gnutls/3.8.6/tests/x509cert-invalid.c /usr/src/debug/gnutls/3.8.6/tests/trustdb-tofu.c /usr/src/debug/gnutls/3.8.6/tests/cert-repro-20170915.h /usr/src/debug/gnutls/3.8.6/tests/crq_key_id.c /usr/src/debug/gnutls/3.8.6/tests/dtls-repro-20170915.c /usr/src/debug/gnutls/3.8.6/tests/aead-cipher-vec.c /usr/src/debug/gnutls/3.8.6/tests/gnutls_ocsp_resp_list_import2.c /usr/src/debug/gnutls/3.8.6/tests/gnutls_session_set_id.c /usr/src/debug/gnutls/3.8.6/tests/record-sizes.c /usr/src/debug/gnutls/3.8.6/tests/dn2.c"
packages/core2-64-poky-linux/gnutls/gnutls-staticdev: PV changed from "3.8.5" to "3.8.6"
packages/core2-64-poky-linux/gnutls/gnutls-staticdev: PKGV changed from 3.8.5 [default] to 3.8.6 [default]
packages/core2-64-poky-linux/gnutls/gnutls-xx: PV changed from "3.8.5" to "3.8.6"
packages/core2-64-poky-linux/gnutls/gnutls-xx: PKGV changed from 3.8.5 [default] to 3.8.6 [default]
packages/core2-64-poky-linux/gnutls/gnutls: PV changed from "3.8.5" to "3.8.6"
packages/core2-64-poky-linux/gnutls/gnutls: PKGV changed from 3.8.5 [default] to 3.8.6 [default]
packages/core2-64-poky-linux/gnutls/gnutls: PKGSIZE changed from 2099076 to 2107300 (+0%)
packages/core2-64-poky-linux/gnutls/gnutls: FILELIST: removed "/usr/lib/libgnutls.so.30.39.0", added "/usr/lib/libgnutls.so.30.40.0"
packages/core2-64-poky-linux/gnutls: PV changed from "3.8.5" to "3.8.6"
packages/core2-64-poky-linux/gnutls: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.5.tar.xz file://arm_eabi.patch file://0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch file://0001-Fix-RSAES-PKCS1-v1_5-system-wide-configuration.patch file://run-ptest file://Add-ptest-support.patch" to "https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.6.tar.xz file://arm_eabi.patch file://0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch file://run-ptest file://Add-ptest-support.patch"
packages/core2-64-poky-linux/gnutls: PKGV changed from 3.8.5 [default] to 3.8.6 [default]
Changes to packages/core2-64-poky-linux/gnutls (sysroot):
  /usr/lib/libgnutls.so.30 changed symlink target from libgnutls.so.30.39.0 to libgnutls.so.30.40.0
  /usr/lib/libgnutls.so changed symlink target from libgnutls.so.30.39.0 to libgnutls.so.30.40.0
  /usr/lib/libgnutls.so.30.39.0 moved to /usr/lib/libgnutls.so.30.40.0
packages/core2-64-poky-linux/libmicrohttpd/libmicrohttpd-dbg: PKGSIZE changed from 817864 to 817888 (+0%)
Changes to packages/x86_64-linux/gnutls-native (sysroot):
  /usr/lib/libgnutls.so.30 changed symlink target from libgnutls.so.30.39.0 to libgnutls.so.30.40.0
  /usr/lib/libgnutls.so changed symlink target from libgnutls.so.30.39.0 to libgnutls.so.30.40.0
  /usr/lib/libgnutls.so.30.39.0 moved to /usr/lib/libgnutls.so.30.40.0

--===============3135968035885392514==--

