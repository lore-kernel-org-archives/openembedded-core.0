Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55FE4CD3424
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:40 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15709.1777645532662829268
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=385HdXmE;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DmqpyhhQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019de3ee3318-ca19b3b3-1608-4179-8b47-ead37e68ed10-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645532;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uAUimwcIXtd2L1Wl2vd4uUOUzmTwxuEZciKPlFfCr8c=;
	b=385HdXmExVKw64HCEgsypjeiGWM6blJX5dv0XM1xRMatYycQYC9mj/XdnghMW416
	S3cqY8+0bcGbBnaGkY+LUg52t0Anjb1MBNlSqNY8IVsXCtBVH17IM8mTVs5MsvHmH8D
	sicucLVh4xNN0IB+OTELZOl1Z0cxv0BEjDA7uNSA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645532;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uAUimwcIXtd2L1Wl2vd4uUOUzmTwxuEZciKPlFfCr8c=;
	b=DmqpyhhQYAxD5TMq+u2/Lfcq6I9RUD4aZ1FqZhRC6xAjEORoAggUDBOsA5DWxgcZ
	GI8lSRdG8/QDmCHC19ADzoJ1UjGSZM8WUxTsb+Ex1JFUUb4kWmCY+FS/cT8urqT8/0Q
	ZI+USNiXjxCbVbcCP18ddIPOmrjYStubefkt1V5s=
Content-Type: multipart/mixed; boundary="===============0478404466176385830=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] mkfontscale,xrandr: upgrading to 1.2.4,1.5.4 SUCCEEDED
Message-ID: <0101019de3ee3318-ca19b3b3-1608-4179-8b47-ead37e68ed10-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236205

--===============0478404466176385830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpta2ZvbnRzY2FsZSx4cmFuZHIqIHRvICoxLjIuNCwxLjUuNCogaGFzIFN1Y2NlZWRlZC4K
Ck5leHQgc3RlcHM6CiAgICAtIGFwcGx5IHRoZSBwYXRjaDogZ2l0IGFtIDAwMDEtbWtmb250c2Nh
bGUteHJhbmRyLXVwZ3JhZGUtMS4yLjMtMS4yLjQtMS41LjMtMS41LjQucGF0Y2gKICAgIC0gY2hl
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
bGVyCgpSZWdhcmRzLApUaGUgVXBncmFkZSBIZWxwZXIKCi0tID44IC0tCkZyb20gMGNjNGI4NTkw
MGY2OTc0YzJlMmE3MDY1Y2I1YmNmNDhiNTNlMzQ0MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
RnJvbTogVXBncmFkZSBIZWxwZXIgPGF1aEB5b2N0b3Byb2plY3Qub3JnPgpEYXRlOiBGcmksIDEg
TWF5IDIwMjYgMDY6MTY6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBta2ZvbnRzY2FsZSx4cmFu
ZHI6IHVwZ3JhZGUgMS4yLjMgLT4gMS4yLjQsMS41LjMgLT4gMS41LjQKCi0tLQogLi4ub250c2Nh
bGVfMS4yLjMuYmIgPT4gbWtmb250c2NhbGVfMS4yLjQuYmJ9IHwgIDIgKy0KIC4uLi97eHJhbmRy
XzEuNS4zLmJiID0+IHhyYW5kcl8xLjUuNC5iYn0gICAgICB8IDI2ICsrKysrKysrKysrKysrKysr
LS0KIDIgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAve21rZm9udHNjYWxlXzEuMi4zLmJi
ID0+IG1rZm9udHNjYWxlXzEuMi40LmJifSAoODglKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy94b3JnLWFwcC97eHJhbmRyXzEuNS4zLmJiID0+IHhyYW5kcl8xLjUuNC5iYn0gKDI3JSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAvbWtmb250c2NhbGVf
MS4yLjMuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAvbWtmb250c2NhbGVfMS4y
LjQuYmIKc2ltaWxhcml0eSBpbmRleCA4OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3hvcmctYXBwL21rZm9udHNjYWxlXzEuMi4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
Z3JhcGhpY3MveG9yZy1hcHAvbWtmb250c2NhbGVfMS4yLjQuYmIKaW5kZXggYWE3OTkwMmEzNC4u
NDI4NjdkYjY1ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL21r
Zm9udHNjYWxlXzEuMi4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC9t
a2ZvbnRzY2FsZV8xLjIuNC5iYgpAQCAtMTgsNCArMTgsNCBAQCBCQkNMQVNTRVhURU5EID0gIm5h
dGl2ZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTVhNjBjNTk2ZDFi
NWYzZGVlOWYwMDViNzAzYjMxODBkIgogCiBTUkNfVVJJX0VYVCA9ICJ4eiIKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICIyOTIxY2RjMzQ0ZjFhY2VlMDRiY2Q2ZWExZTI5NTY1YzEzMDgyNjMwMDZlMTM0
YTllZTM4Y2Y5YzlkNmZlNzVlIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImEwMTQ5MmExN2E5YjZj
MGVlM2Y5MmVlNTc4ODUwZTMwNTMxNWI5ZjI5OGRhNWYwMDZhMWNkNGI1MWRiMDFhNWUiCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveHJhbmRyXzEuNS4zLmJiIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hyYW5kcl8xLjUuNC5iYgpzaW1pbGFyaXR5
IGluZGV4IDI3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveHJh
bmRyXzEuNS4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveHJh
bmRyXzEuNS40LmJiCmluZGV4IDc1NjU2YWY5ZWEuLjhiNTgxZjExM2EgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94cmFuZHJfMS41LjMuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hyYW5kcl8xLjUuNC5iYgpAQCAtMSwzICsxLDI1IEBA
CisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQg
YnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2Ug
YmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0
ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMg
aW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChl
eGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisj
IFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORworIyArKysgQ09QWUlORworIyBAQCAtMSw2
ICsxLDggQEAKKyMgIENvcHlyaWdodCDCqSAyMDAxIEtlaXRoIFBhY2thcmQsIG1lbWJlciBvZiBU
aGUgWEZyZWU4NiBQcm9qZWN0LCBJbmMuCisjICBDb3B5cmlnaHQgwqkgMjAwMiBIZXdsZXR0IFBh
Y2thcmQgQ29tcGFueSwgSW5jLgorIyAgQ29weXJpZ2h0IMKpIDIwMDYgSW50ZWwgQ29ycG9yYXRp
b24KKyMgK0NvcHlyaWdodCDCqSAyMDA4IEtlaXRoIFBhY2thcmQKKyMgK0NvcHlyaWdodCDCqSAy
MDEzIE5WSURJQSBDb3Jwb3JhdGlvbgorIyAgCisjICBQZXJtaXNzaW9uIHRvIHVzZSwgY29weSwg
bW9kaWZ5LCBkaXN0cmlidXRlLCBhbmQgc2VsbCB0aGlzIHNvZnR3YXJlIGFuZCBpdHMKKyMgIGRv
Y3VtZW50YXRpb24gZm9yIGFueSBwdXJwb3NlIGlzIGhlcmVieSBncmFudGVkIHdpdGhvdXQgZmVl
LCBwcm92aWRlZCB0aGF0CisjIAorIworCiByZXF1aXJlIHhvcmctYXBwLWNvbW1vbi5pbmMKIAog
U1VNTUFSWSA9ICJYUmFuZFI6IFggUmVzaXplLCBSb3RhdGUgYW5kIFJlZmxlY3QgZXh0ZW5zaW9u
IGNvbW1hbmQiCkBAIC03LDExICsyOSwxMSBAQCByZWZsZWN0aW9uIG9mIHRoZSBvdXRwdXRzIGZv
ciBhIHNjcmVlbi4gSXQgY2FuIGFsc28gc2V0IHRoZSBzY3JlZW4gXAogc2l6ZS4iCiAKIExJQ0VO
U0UgPSAiTUlUIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9ZmUxNjA4
YmRiMzNjZjhjNjJhNDQzOGY3ZDM0Njc5YjMiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9D
T1BZSU5HO21kNT05N2EzNmQ1YzY2OTY1YjFjZWE0NjY2YjM3MDhjYTZlOCIKIERFUEVORFMgKz0g
ImxpYnhyYW5kciBsaWJ4cmVuZGVyIgogUEUgPSAiMSIKIAogU1JDX1VSSV9FWFQgPSAieHoiCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZjhkZDc1NjZhZGI3NDE0N2ZhYjk5NjQ2ODBiNmJiYWRlZTg3
Y2Y0MDZhN2ZjZmY1MTcxOGE1ZTY5NDliODQxYyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyY2Fm
Y2NiMmFhZjI0OTFhNDA2ODY3NjExN2EwZDRmOTBhYjMwNzcyNGI5NmZmZmM1NGNkMWRhOTUzNzc5
NDAwIgogCiBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCi0tIAoyLjQ3LjEKCg==

--===============0478404466176385830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/xrandr/xrandr-doc: PKGSIZE changed from 18402 to 20292 (+10%)

--===============0478404466176385830==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mkfontscale-xrandr-upgrade-1.2.3-1.2.4-1.5.3-1.5.4.patch"

RnJvbSAwY2M0Yjg1OTAwZjY5NzRjMmUyYTcwNjVjYjViY2Y0OGI1M2UzNDQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwNjoxNjo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1r
Zm9udHNjYWxlLHhyYW5kcjogdXBncmFkZSAxLjIuMyAtPiAxLjIuNCwxLjUuMyAtPiAxLjUuNAoK
LS0tCiAuLi5vbnRzY2FsZV8xLjIuMy5iYiA9PiBta2ZvbnRzY2FsZV8xLjIuNC5iYn0gfCAgMiAr
LQogLi4uL3t4cmFuZHJfMS41LjMuYmIgPT4geHJhbmRyXzEuNS40LmJifSAgICAgIHwgMjYgKysr
KysrKysrKysrKysrKystLQogMiBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC97bWtmb250
c2NhbGVfMS4yLjMuYmIgPT4gbWtmb250c2NhbGVfMS4yLjQuYmJ9ICg4OCUpCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3t4cmFuZHJfMS41LjMuYmIgPT4geHJhbmRyXzEu
NS40LmJifSAoMjclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFw
cC9ta2ZvbnRzY2FsZV8xLjIuMy5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC9t
a2ZvbnRzY2FsZV8xLjIuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDg4JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAvbWtmb250c2NhbGVfMS4yLjMuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC9ta2ZvbnRzY2FsZV8xLjIuNC5iYgppbmRl
eCBhYTc5OTAyYTM0Li40Mjg2N2RiNjVkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MveG9yZy1hcHAvbWtmb250c2NhbGVfMS4yLjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3hvcmctYXBwL21rZm9udHNjYWxlXzEuMi40LmJiCkBAIC0xOCw0ICsxOCw0IEBAIEJCQ0xB
U1NFWFRFTkQgPSAibmF0aXZlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORztt
ZDU9NWE2MGM1OTZkMWI1ZjNkZWU5ZjAwNWI3MDNiMzE4MGQiCiAKIFNSQ19VUklfRVhUID0gInh6
IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI5MjFjZGMzNDRmMWFjZWUwNGJjZDZlYTFlMjk1NjVj
MTMwODI2MzAwNmUxMzRhOWVlMzhjZjljOWQ2ZmU3NWUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
YTAxNDkyYTE3YTliNmMwZWUzZjkyZWU1Nzg4NTBlMzA1MzE1YjlmMjk4ZGE1ZjAwNmExY2Q0YjUx
ZGIwMWE1ZSIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94cmFu
ZHJfMS41LjMuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveHJhbmRyXzEuNS40
LmJiCnNpbWlsYXJpdHkgaW5kZXggMjclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy94b3JnLWFwcC94cmFuZHJfMS41LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy94b3JnLWFwcC94cmFuZHJfMS41LjQuYmIKaW5kZXggNzU2NTZhZjllYS4uOGI1ODFmMTEzYSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hyYW5kcl8xLjUuMy5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveHJhbmRyXzEuNS40LmJiCkBA
IC0xLDMgKzEsMjUgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZl
IGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0
aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0Lgor
IyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6
ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0
ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVw
ZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBDT1BZSU5HCisjICsrKyBDT1BZ
SU5HCisjIEBAIC0xLDYgKzEsOCBAQAorIyAgQ29weXJpZ2h0IMKpIDIwMDEgS2VpdGggUGFja2Fy
ZCwgbWVtYmVyIG9mIFRoZSBYRnJlZTg2IFByb2plY3QsIEluYy4KKyMgIENvcHlyaWdodCDCqSAy
MDAyIEhld2xldHQgUGFja2FyZCBDb21wYW55LCBJbmMuCisjICBDb3B5cmlnaHQgwqkgMjAwNiBJ
bnRlbCBDb3Jwb3JhdGlvbgorIyArQ29weXJpZ2h0IMKpIDIwMDggS2VpdGggUGFja2FyZAorIyAr
Q29weXJpZ2h0IMKpIDIwMTMgTlZJRElBIENvcnBvcmF0aW9uCisjICAKKyMgIFBlcm1pc3Npb24g
dG8gdXNlLCBjb3B5LCBtb2RpZnksIGRpc3RyaWJ1dGUsIGFuZCBzZWxsIHRoaXMgc29mdHdhcmUg
YW5kIGl0cworIyAgZG9jdW1lbnRhdGlvbiBmb3IgYW55IHB1cnBvc2UgaXMgaGVyZWJ5IGdyYW50
ZWQgd2l0aG91dCBmZWUsIHByb3ZpZGVkIHRoYXQKKyMgCisjCisKIHJlcXVpcmUgeG9yZy1hcHAt
Y29tbW9uLmluYwogCiBTVU1NQVJZID0gIlhSYW5kUjogWCBSZXNpemUsIFJvdGF0ZSBhbmQgUmVm
bGVjdCBleHRlbnNpb24gY29tbWFuZCIKQEAgLTcsMTEgKzI5LDExIEBAIHJlZmxlY3Rpb24gb2Yg
dGhlIG91dHB1dHMgZm9yIGEgc2NyZWVuLiBJdCBjYW4gYWxzbyBzZXQgdGhlIHNjcmVlbiBcCiBz
aXplLiIKIAogTElDRU5TRSA9ICJNSVQiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZ
SU5HO21kNT1mZTE2MDhiZGIzM2NmOGM2MmE0NDM4ZjdkMzQ2NzliMyIKK0xJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTk3YTM2ZDVjNjY5NjViMWNlYTQ2NjZiMzcwOGNhNmU4
IgogREVQRU5EUyArPSAibGlieHJhbmRyIGxpYnhyZW5kZXIiCiBQRSA9ICIxIgogCiBTUkNfVVJJ
X0VYVCA9ICJ4eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmOGRkNzU2NmFkYjc0MTQ3ZmFiOTk2
NDY4MGI2YmJhZGVlODdjZjQwNmE3ZmNmZjUxNzE4YTVlNjk0OWI4NDFjIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjJjYWZjY2IyYWFmMjQ5MWE0MDY4Njc2MTE3YTBkNGY5MGFiMzA3NzI0Yjk2ZmZm
YzU0Y2QxZGE5NTM3Nzk0MDAiCiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIK
LS0gCjIuNDcuMQoK

--===============0478404466176385830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/mkfontscale: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/x86-64-v3-poky-linux/mkfontscale: PV changed from "1.2.3" to "1.2.4"
packages/x86-64-v3-poky-linux/mkfontscale: SRC_URI changed from "https://www.x.org/releases//individual/app/mkfontscale-1.2.3.tar.xz" to "https://www.x.org/releases//individual/app/mkfontscale-1.2.4.tar.xz"
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-dbg: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-dbg: PV changed from "1.2.3" to "1.2.4"
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-dbg: PKGSIZE changed from 105264 to 105536 (+0%)
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-dev: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-dev: PV changed from "1.2.3" to "1.2.4"
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-doc: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-doc: PV changed from "1.2.3" to "1.2.4"
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-doc: PKGSIZE changed from 10302 to 10284 (-0%)
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-locale: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-locale: PV changed from "1.2.3" to "1.2.4"
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-src: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-src: FILELIST: directory renamed /usr/src/debug/mkfontscale/1.2.3 -> /usr/src/debug/mkfontscale/1.2.4
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-src: PV changed from "1.2.3" to "1.2.4"
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-src: PKGSIZE changed from 74994 to 75264 (+0%)
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-staticdev: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-staticdev: PV changed from "1.2.3" to "1.2.4"
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale: PV changed from "1.2.3" to "1.2.4"
packages/x86-64-v3-poky-linux/xrandr: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/x86-64-v3-poky-linux/xrandr: PV changed from "1.5.3" to "1.5.4"
packages/x86-64-v3-poky-linux/xrandr: SRC_URI changed from "https://www.x.org/releases//individual/app/xrandr-1.5.3.tar.xz" to "https://www.x.org/releases//individual/app/xrandr-1.5.4.tar.xz"
packages/x86-64-v3-poky-linux/xrandr/xrandr-dbg: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/x86-64-v3-poky-linux/xrandr/xrandr-dbg: PV changed from "1.5.3" to "1.5.4"
packages/x86-64-v3-poky-linux/xrandr/xrandr-dbg: PKGSIZE changed from 195296 to 196184 (+0%)
packages/x86-64-v3-poky-linux/xrandr/xrandr-dev: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/x86-64-v3-poky-linux/xrandr/xrandr-dev: PV changed from "1.5.3" to "1.5.4"
packages/x86-64-v3-poky-linux/xrandr/xrandr-doc: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/x86-64-v3-poky-linux/xrandr/xrandr-doc: PV changed from "1.5.3" to "1.5.4"
packages/x86-64-v3-poky-linux/xrandr/xrandr-doc: PKGSIZE changed from 18402 to 20292 (+10%)
packages/x86-64-v3-poky-linux/xrandr/xrandr-locale: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/x86-64-v3-poky-linux/xrandr/xrandr-locale: PV changed from "1.5.3" to "1.5.4"
packages/x86-64-v3-poky-linux/xrandr/xrandr-src: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/x86-64-v3-poky-linux/xrandr/xrandr-src: FILELIST: directory renamed /usr/src/debug/xrandr/1.5.3 -> /usr/src/debug/xrandr/1.5.4
packages/x86-64-v3-poky-linux/xrandr/xrandr-src: PV changed from "1.5.3" to "1.5.4"
packages/x86-64-v3-poky-linux/xrandr/xrandr-src: PKGSIZE changed from 111036 to 111623 (+1%)
packages/x86-64-v3-poky-linux/xrandr/xrandr-staticdev: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/x86-64-v3-poky-linux/xrandr/xrandr-staticdev: PV changed from "1.5.3" to "1.5.4"
packages/x86-64-v3-poky-linux/xrandr/xrandr: PKGV changed from 1.5.3 [default] to 1.5.4 [default]
packages/x86-64-v3-poky-linux/xrandr/xrandr: PV changed from "1.5.3" to "1.5.4"
packages/x86-64-v3-poky-linux/xrandr/xrandr: PKGSIZE changed from 80606 to 80578 (-0%)

--===============0478404466176385830==--

