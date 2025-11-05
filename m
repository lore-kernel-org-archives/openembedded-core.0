Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 703FECD4843
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:48 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2351.1762384574631610807
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fQIcpJZ0;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=WqlGPzZS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019a564ee143-67fa867c-fcd2-4a45-a0b4-08f317384469-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QYELwYIqJOljctUXh9QTJ2QecP3iVwEuUz7WoTUYuKQ=;
	b=fQIcpJZ0SXbmmngeUnOAeLeMC4xseHU+nyfv8aw+nwIKV0n8jmNSWNVXNdkLvPX3
	y60AOumAxgXTpFxziHNazHNrJZ2Bbcvtmkm5bdg2UvRrU48hS5xTO4wneApStpOoH0R
	G+vibvgNVoIOmZ/OQPMYHFSVz7HkiCFf8hn60gyo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QYELwYIqJOljctUXh9QTJ2QecP3iVwEuUz7WoTUYuKQ=;
	b=WqlGPzZSh+qYhiKY+tEOb+Gr9vVSxf+Qr0rfkvdlA4d9rtfWLbDbhcafR7CgsraG
	v9+9uJ1spWpGx3wKYLS+jPgskhbYppBep8bQSTZ6NXDNsaF5X5kYKm+Y1f8o4oc1uIS
	o9WcTG5VnzZmOMp17uFIc9LqOy6r7TbK3Jkiu6sY=
Content-Type: multipart/mixed; boundary="===============9003814315335463673=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xserver-xorg: upgrading to 21.1.20 SUCCEEDED
Message-ID: <0101019a564ee143-67fa867c-fcd2-4a45-a0b4-08f317384469-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225899

--===============9003814315335463673==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICp4c2VydmVyLXhvcmcqIHRvICoyMS4xLjIwKiBoYXMgU3VjY2VlZGVkLgoKTmV4dCBzdGVw
czoKICAgIC0gYXBwbHkgdGhlIHBhdGNoOiBnaXQgYW0gMDAwMS14c2VydmVyLXhvcmctdXBncmFk
ZS0yMS4xLjE4LTIxLjEuMjAucGF0Y2gKICAgIC0gY2hlY2sgdGhlIGNoYW5nZXMgdG8gdXBzdHJl
YW0gcGF0Y2hlcyBhbmQgc3VtbWFyaXplIHRoZW0gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLAogICAg
LSBjb21waWxlIGFuIGltYWdlIHRoYXQgY29udGFpbnMgdGhlIHBhY2thZ2UKICAgIC0gcGVyZm9y
bSBzb21lIGJhc2ljIHNhbml0eSB0ZXN0cwogICAgLSBhbWVuZCB0aGUgcGF0Y2ggYW5kIHNpZ24g
aXQgb2ZmOiBnaXQgY29tbWl0IC1zIC0tcmVzZXQtYXV0aG9yIC0tYW1lbmQKICAgIC0gc2VuZCBp
dCB0byB0aGUgYXBwcm9wcmlhdGUgbWFpbGluZyBsaXN0CgpBbHRlcm5hdGl2ZWx5LCBpZiB5b3Ug
YmVsaWV2ZSB0aGUgcmVjaXBlIHNob3VsZCBub3QgYmUgdXBncmFkZWQgYXQgdGhpcyB0aW1lLAp5
b3UgY2FuIGZpbGwgUkVDSVBFX05PX1VQREFURV9SRUFTT04gaW4gcmVzcGVjdGl2ZSByZWNpcGUg
ZmlsZSBzbyB0aGF0CmF1dG9tYXRpYyB1cGdyYWRlcyB3b3VsZCBubyBsb25nZXIgYmUgYXR0ZW1w
dGVkLgoKUGxlYXNlIHJldmlldyB0aGUgYXR0YWNoZWQgZmlsZXMgZm9yIGZ1cnRoZXIgaW5mb3Jt
YXRpb24gYW5kIGJ1aWxkL3VwZGF0ZSBmYWlsdXJlcy4KQW55IHByb2JsZW0gcGxlYXNlIGZpbGUg
YSBidWcgYXQgaHR0cHM6Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL2VudGVyX2J1Zy5jZ2k/
cHJvZHVjdD1BdXRvbWF0ZWQlMjBVcGRhdGUlMjBIYW5kbGVyCgpSZWdhcmRzLApUaGUgVXBncmFk
ZSBIZWxwZXIKCi0tID44IC0tCkZyb20gMDI5OWRhNjEwNjI3ZGU2NTBiN2IxNGI3ZjZiZjk4ZTQw
OGZmMWQ0MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKRnJvbTogVXBncmFkZSBIZWxwZXIgPGF1
aEB5b2N0b3Byb2plY3Qub3JnPgpEYXRlOiBXZWQsIDUgTm92IDIwMjUgMjE6MjQ6MDAgKzAwMDAK
U3ViamVjdDogW1BBVENIXSB4c2VydmVyLXhvcmc6IHVwZ3JhZGUgMjEuMS4xOCAtPiAyMS4xLjIw
CgotLS0KIC4uLi94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnLmluYyAgICAgICAgICAgICB8ICAy
ICstCiAuLi4tZHVwbGljYXRlLWRlZmluaXRpb25zLW9mLUlPUG9ydEJhc2UucGF0Y2ggfCAgMiAr
LQogLi4uLUludGVsLWRkeC1vbmx5LWZvci1wcmUtZ2VuNC1oYXJkd2FyLnBhdGNoIHwgIDIgKy0K
IC4uLm9yZ18yMS4xLjE4LmJiID0+IHhzZXJ2ZXIteG9yZ18yMS4xLjIwLmJifSB8IDI0ICsrKysr
KysrKysrKysrKysrKy0KIDQgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3t4c2Vy
dmVyLXhvcmdfMjEuMS4xOC5iYiA9PiB4c2VydmVyLXhvcmdfMjEuMS4yMC5iYn0gKDU2JSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9y
Zy5pbmMgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZy5p
bmMKaW5kZXggMGRlY2U3YmJhMy4uZTEyYjcwZDIyOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3hvcmcteHNlcnZlci94c2VydmVyLXhvcmcuaW5jCisrKyBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnLmluYwpAQCAtMiw3ICsyLDcgQEAg
U1VNTUFSWSA9ICJUaGUgWC5PcmcgWCBzZXJ2ZXIiCiBIT01FUEFHRSA9ICJodHRwOi8vd3d3Lngu
b3JnIgogU0VDVElPTiA9ICJ4MTEvYmFzZSIKIExJQ0VOU0UgPSAiTUlUIgotTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NWRmODc5NTBhZjUxYWMyYzU4MjIwOTQ1NTNlYTE4
ODAiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT0yMWUzM2RjY2NmMmQ1
MDM0Zjc5OGE4ZWE2MjYyMjkzOSIKIAogIyB4Zjg2LSotKiBwYWNrYWdlcyBkZXBlbmQgb24gYW4g
WCBzZXJ2ZXIgYnVpbHQgd2l0aCB0aGUgeGZyZWU4NiBERFgKICMgc28gd2UgaGF2ZSBhIHZpcnR1
YWwgdG8gcmVwcmVzZW50IHRoYXQ6CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
eG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZy8wMDAxLUF2b2lkLWR1cGxpY2F0ZS1kZWZpbml0aW9u
cy1vZi1JT1BvcnRCYXNlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZl
ci94c2VydmVyLXhvcmcvMDAwMS1Bdm9pZC1kdXBsaWNhdGUtZGVmaW5pdGlvbnMtb2YtSU9Qb3J0
QmFzZS5wYXRjaAppbmRleCBlOWNiYzliNGRhLi5iZjk3MzgzMDAzIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZy8wMDAxLUF2b2lkLWR1
cGxpY2F0ZS1kZWZpbml0aW9ucy1vZi1JT1BvcnRCYXNlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnLzAwMDEtQXZvaWQtZHVwbGljYXRl
LWRlZmluaXRpb25zLW9mLUlPUG9ydEJhc2UucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGNl
ZGM3OTdlMWEwODUwMDM5YTI1YjdlMzg3YjM0MmU1NGZmZmNjOTcgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIGMxZDY5NDE0NzRkZTE4OWNiMDE2YjRlNDNmYzRkNDA5NjU5ZWMwNWIgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29t
PgogRGF0ZTogTW9uLCAxNyBBdWcgMjAyMCAxMDo1MDo1MSAtMDcwMAogU3ViamVjdDogW1BBVENI
XSBBdm9pZCBkdXBsaWNhdGUgZGVmaW5pdGlvbnMgb2YgSU9Qb3J0QmFzZQpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZlci94c2VydmVyLXhvcmcvMDAwMS14Zjg2
cGNpQnVzLmMtdXNlLUludGVsLWRkeC1vbmx5LWZvci1wcmUtZ2VuNC1oYXJkd2FyLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZlci94c2VydmVyLXhvcmcvMDAwMS14Zjg2
cGNpQnVzLmMtdXNlLUludGVsLWRkeC1vbmx5LWZvci1wcmUtZ2VuNC1oYXJkd2FyLnBhdGNoCmlu
ZGV4IGExOTZlNTA3NTEuLjY5YzhhMjZlZDAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnLzAwMDEteGY4NnBjaUJ1cy5jLXVzZS1JbnRl
bC1kZHgtb25seS1mb3ItcHJlLWdlbjQtaGFyZHdhci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZy8wMDAxLXhmODZwY2lCdXMuYy11c2Ut
SW50ZWwtZGR4LW9ubHktZm9yLXByZS1nZW40LWhhcmR3YXIucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIGFkODk2N2RlMzZlNmUyYTE4NWI3MWNlMWQ3MDE0NDhjZGE0ZWYzZTIgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDkxNGU3NWMwMzIzM2MxOWE2M2VmY2E4ZWE3MzNjOTllZjEx
YjFhMzAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDYWxpZm9ybmlhIFN1bGxpdmFu
IDxjYWxpZm9ybmlhLmwuc3VsbGl2YW5AaW50ZWwuY29tPgogRGF0ZTogRnJpLCAxNiBNYXIgMjAx
OCAxNzoyMzoxMSAtMDcwMAogU3ViamVjdDogW1BBVENIXSB4Zjg2cGNpQnVzLmM6IHVzZSBJbnRl
bCBkZHggb25seSBmb3IgcHJlLWdlbjQgaGFyZHdhcmUKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnXzIxLjEuMTguYmIgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZ18yMS4xLjIwLmJiCnNpbWls
YXJpdHkgaW5kZXggNTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhz
ZXJ2ZXIveHNlcnZlci14b3JnXzIxLjEuMTguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnXzIxLjEuMjAuYmIKaW5kZXggM2M4Y2IwMTcz
Zi4uMDk5Yjg2NjU2MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNl
cnZlci94c2VydmVyLXhvcmdfMjEuMS4xOC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
eG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZ18yMS4xLjIwLmJiCkBAIC0xLDkgKzEsMzEgQEAKKyMg
RklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAn
ZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3
ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRo
ZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgor
IyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1w
bGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhl
IGNoYW5nZXM6CisjCisjIC0tLSBDT1BZSU5HCisjICsrKyBDT1BZSU5HCisjIEBAIC0xNiw3ICsx
Niw3IEBACisjICBDb3B5cmlnaHQgwqkgMjAwNi0yMDA4IFBldGVyIEh1dHRlcmVyCisjICBDb3B5
cmlnaHQgwqkgMjAwNiBBZGFtIEphY2tzb24KKyMgIENvcHlyaWdodCDCqSAyMDA5LTIwMTAgTlZJ
RElBIENvcnBvcmF0aW9uCisjIC1Db3B5cmlnaHQgwqkgMTk4NywgMjAwMy0yMDA2LCAyMDA4LTIw
MTAgT3JhY2xlIGFuZC9vciBpdHMgYWZmaWxpYXRlcy4KKyMgK0NvcHlyaWdodCDCqSAxOTg3LCAy
MDAzLTIwMDYsIDIwMDgtMjAxMCwgMjAyNSBPcmFjbGUgYW5kL29yIGl0cyBhZmZpbGlhdGVzLgor
IyAgQ29weXJpZ2h0IMKpIDE5OTkgS2VpdGggUGFja2FyZAorIyAgQ29weXJpZ2h0IMKpIDIwMDct
MjAwOSBSZWQgSGF0LCBJbmMuCisjICBDb3B5cmlnaHQgwqkgMjAwNS0yMDA4IERhbmllbCBTdG9u
ZQorIyAKKyMKKwogcmVxdWlyZSB4c2VydmVyLXhvcmcuaW5jCiAKIFNSQ19VUkkgKz0gImZpbGU6
Ly8wMDAxLXhmODZwY2lCdXMuYy11c2UtSW50ZWwtZGR4LW9ubHktZm9yLXByZS1nZW40LWhhcmR3
YXIucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1Bdm9pZC1kdXBsaWNhdGUtZGVmaW5p
dGlvbnMtb2YtSU9Qb3J0QmFzZS5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICJjODc4ZDE5MzBkODc3MjVkNGE1YmY0OThjMjRmNGJlODEzMGQ1YjI2NDZhOWZkMGYy
OTk0ZGVmZjkwMTE2MzUyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjc2OTViYzYxODI0YjNhODFi
NmJhZDJmNzhiMDU0MDBjYTAxNTAwM2RlNDAyZDFiMzIyMTE3MTA1YjcwMmU5MzciCiAKICMgVGhl
c2UgZXh0ZW5zaW9ucyBhcmUgbm93IGludGVncmF0ZWQgaW50byB0aGUgc2VydmVyLCBzbyBkZWNs
YXJlIHRoZSBtaWdyYXRpb24KICMgcGF0aCBmb3IgaW4tcGxhY2UgdXBncmFkZXMuCi0tIAoyLjQ3
LjEKCg==

--===============9003814315335463673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg: RDEPENDS: added "libgl-mesa (['>= 25.2.5'])"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg: PKGSIZE changed from 2823058 to 3106786 (+10%)

--===============9003814315335463673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xserver-xorg: SRC_URI changed from "https://www.x.org/releases//individual/xserver/xorg-server-21.1.18.tar.xz file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch" to "https://www.x.org/releases//individual/xserver/xorg-server-21.1.20.tar.xz file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch"
packages/x86-64-v3-poky-linux/xserver-xorg: PKGV changed from 21.1.18 [default] to 21.1.20 [default]
packages/x86-64-v3-poky-linux/xserver-xorg: PV changed from "21.1.18" to "21.1.20"
packages/x86-64-v3-poky-linux/xserver-xorg/xf86-video-modesetting: PKGV changed from 21.1.18 [default] to 21.1.20 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xf86-video-modesetting: PV changed from "21.1.18" to "21.1.20"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dbg: PKGSIZE changed from 18217712 to 19338936 (+6%)
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dbg: PKGV changed from 21.1.18 [default] to 21.1.20 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dbg: PV changed from "21.1.18" to "21.1.20"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dev: PKGSIZE changed from 1154545 to 1155731 (+0%)
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dev: PKGV changed from 21.1.18 [default] to 21.1.20 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dev: PV changed from "21.1.18" to "21.1.20"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-doc: PKGSIZE changed from 132323 to 132739 (+0%)
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-doc: PKGV changed from 21.1.18 [default] to 21.1.20 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-doc: PV changed from "21.1.18" to "21.1.20"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dbe: PKGV changed from 21.1.18 [default] to 21.1.20 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dbe: PV changed from "21.1.18" to "21.1.20"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dri: PKGV changed from 21.1.18 [default] to 21.1.20 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dri: PV changed from "21.1.18" to "21.1.20"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dri2: PKGV changed from 21.1.18 [default] to 21.1.20 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dri2: PV changed from "21.1.18" to "21.1.20"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-extmod: PKGV changed from 21.1.18 [default] to 21.1.20 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-extmod: PV changed from "21.1.18" to "21.1.20"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PKGV changed from 21.1.18 [default] to 21.1.20 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PV changed from "21.1.18" to "21.1.20"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-record: PKGV changed from 21.1.18 [default] to 21.1.20 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-record: PV changed from "21.1.18" to "21.1.20"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-fbdev: PKGV changed from 21.1.18 [default] to 21.1.20 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-fbdev: PV changed from "21.1.18" to "21.1.20"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-locale: PKGV changed from 21.1.18 [default] to 21.1.20 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-locale: PV changed from "21.1.18" to "21.1.20"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-exa: PKGV changed from 21.1.18 [default] to 21.1.20 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-exa: PV changed from "21.1.18" to "21.1.20"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libafb: PKGV changed from 21.1.18 [default] to 21.1.20 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libafb: PV changed from "21.1.18" to "21.1.20"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libcfb: PKGV changed from 21.1.18 [default] to 21.1.20 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libcfb: PV changed from "21.1.18" to "21.1.20"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libint10: PKGV changed from 21.1.18 [default] to 21.1.20 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libint10: PV changed from "21.1.18" to "21.1.20"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libmfb: PKGV changed from 21.1.18 [default] to 21.1.20 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libmfb: PV changed from "21.1.18" to "21.1.20"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libwfb: PKGV changed from 21.1.18 [default] to 21.1.20 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libwfb: PV changed from "21.1.18" to "21.1.20"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libxf1bpp: PKGV changed from 21.1.18 [default] to 21.1.20 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libxf1bpp: PV changed from "21.1.18" to "21.1.20"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libxf4bpp: PKGV changed from 21.1.18 [default] to 21.1.20 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libxf4bpp: PV changed from "21.1.18" to "21.1.20"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-xaa: PKGV changed from 21.1.18 [default] to 21.1.20 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-xaa: PV changed from "21.1.18" to "21.1.20"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-multimedia-modules: PKGV changed from 21.1.18 [default] to 21.1.20 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-multimedia-modules: PV changed from "21.1.18" to "21.1.20"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-sdl: PKGV changed from 21.1.18 [default] to 21.1.20 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-sdl: PV changed from "21.1.18" to "21.1.20"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-src: PKGV changed from 21.1.18 [default] to 21.1.20 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-src: PV changed from "21.1.18" to "21.1.20"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-staticdev: PKGV changed from 21.1.18 [default] to 21.1.20 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-staticdev: PV changed from "21.1.18" to "21.1.20"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-utils: PKGV changed from 21.1.18 [default] to 21.1.20 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-utils: PV changed from "21.1.18" to "21.1.20"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-xephyr: PKGV changed from 21.1.18 [default] to 21.1.20 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-xephyr: PV changed from "21.1.18" to "21.1.20"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-xvfb: PKGV changed from 21.1.18 [default] to 21.1.20 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-xvfb: PV changed from "21.1.18" to "21.1.20"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg: PKGSIZE changed from 2823058 to 3106786 (+10%)
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg: RDEPENDS: added "libgl-mesa (['>= 25.2.5'])"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg: PKGV changed from 21.1.18 [default] to 21.1.20 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg: PV changed from "21.1.18" to "21.1.20"

--===============9003814315335463673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 948 .bb files complete (0 cached, 948 parsed). 1946 targets, 54 skipped, 0 masked, 0 errors.
Removing 105 recipes from the qemux86_64 sysroot...done.
Removing 105 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-8ebe83137fed21a6ff3a5b020725a5cebe7bc946"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:8ebe83137fed21a6ff3a5b020725a5cebe7bc946"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 798 Local 771 Mirrors 0 Missed 27 Current 388 (96% match, 97% complete)
Removing 3 stale sstate objects for arch x86_64...done.
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 396 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 401 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 407 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 409 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_package_qa_setscene)
NOTE: Running setscene task 414 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 415 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_package_qa_setscene)
NOTE: Running setscene task 429 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 433 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 441 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 442 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 443 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 461 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 464 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 493 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 498 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 499 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_package_write_ipk_setscene)
NOTE: recipe x11-volatiles-1.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_qa_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_package_qa_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_package_qa_setscene: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_package_write_deb_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.45-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 500 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_package_write_rpm_setscene)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 509 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 513 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 516 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_qa_setscene)
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.45-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 521 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_create_spdx_setscene)
NOTE: recipe rgb-1_1.1.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 524 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_create_spdx_setscene)
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 533 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_create_spdx_setscene)
NOTE: Running setscene task 534 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_create_spdx_setscene)
NOTE: recipe x11-volatiles-1.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.45-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 540 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_create_spdx_setscene)
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 544 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 546 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_create_spdx_setscene)
NOTE: recipe xkeyboard-config-2.45-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 547 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 548 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 550 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 551 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 553 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe x11-volatiles-1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_package_qa_setscene: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkbcomp-1.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libevdev-1.13.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 554 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: recipe x11-volatiles-1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe x11-volatiles-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 557 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 558 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.29.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe x11-volatiles-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 561 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_packagedata_setscene)
NOTE: recipe rgb-1_1.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 566 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.20.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 569 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_packagedata_setscene)
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libevdev-1.13.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 570 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_create_spdx_setscene)
NOTE: recipe xkeyboard-config-2.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 571 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 573 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.4.bb:do_packagedata_setscene)
NOTE: recipe libxcvt-0.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 574 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.4.bb:do_populate_sysroot_setscene)
NOTE: recipe mtdev-1.1.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 576 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 577 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 578 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe x11-volatiles-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 580 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libinput-1.29.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xkbcomp-1.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libevdev-1.13.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libevdev-1.13.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 583 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe libinput-1.29.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 584 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe x11-volatiles-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 585 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 586 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 587 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 589 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 592 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.29.1.bb:do_recipe_qa_setscene)
NOTE: recipe rgb-1_1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libevdev-1.13.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 595 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 597 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: Running setscene task 598 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libevdev-1.13.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 609 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 611 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevdev/libevdev_1.13.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxfont2-2.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libinput-1.29.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 612 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_create_spdx_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 618 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_25.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libtirpc/1.3.6/temp/log.do_packagedata_setscene.3626209
NOTE: recipe libevdev-1.13.4-r0: task do_recipe_qa_setscene: Started
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 620 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 622 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libinput-1.29.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 623 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_package_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfont2-2.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/xkeyboard-config/2.45/temp/log.do_packagedata_setscene.3625928
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libevdev-1.13.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe x11-volatiles-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 625 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 626 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 627 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 628 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 629 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 630 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 631 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 634 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_create_spdx_setscene)
NOTE: Running setscene task 635 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 640 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 649 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_package_setscene)
NOTE: Running setscene task 650 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 652 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 655 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkbcomp-1.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkbcomp-1.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 660 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcvt-0.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 664 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb:do_packagedata_setscene)
NOTE: recipe rgb-1_1.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 665 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 673 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 680 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 681 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 682 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 686 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 689 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 698 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 701 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_recipe_qa_setscene)
NOTE: recipe libfontenc-1_1.1.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 710 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_create_spdx_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libfontenc-1_1.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 719 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_create_spdx_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 733 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libfontenc-1_1.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 735 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.50.bb:do_packagedata_setscene)
NOTE: Running setscene task 737 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 739 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 741 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx_setscene)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 742 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_create_spdx_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 746 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 747 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.50.bb:do_populate_sysroot_setscene)
NOTE: recipe libfontenc-1_1.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 749 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 751 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe font-util-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.50-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 753 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_package_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.45-r0: task do_package_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 754 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_package_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.50-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libfontenc-1_1.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe font-util-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.50-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 755 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 758 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 759 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_25.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.50-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 761 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.50.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_25.2.5-r0: task do_package_setscene: Started
NOTE: recipe encodings-1_1.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe font-util-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 763 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.50-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 764 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe font-util-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe encodings-1_1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 781 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 782 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 783 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 784 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.50-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_package_setscene: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 787 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 788 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 792 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 794 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 796 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1339 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.29.1.bb:do_fetch)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 800 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: Running task 1441 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.29.1.bb:do_write_config)
NOTE: Running task 1455 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.20.bb:do_fetch)
NOTE: Running task 1497 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.20.bb:do_write_config)
NOTE: Running task 1501 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libinput-1.29.1-r0: task do_fetch: Started
NOTE: recipe libinput-1.29.1-r0: task do_write_config: Started
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_fetch: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_fetch: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_write_config: Started
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_fetch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 1658 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.20.bb:do_unpack)
NOTE: Running task 1659 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_unpack)
NOTE: recipe libinput-1.29.1-r0: task do_write_config: Succeeded
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_write_config: Succeeded
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_unpack: Started
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_unpack: Started
NOTE: recipe libinput-1.29.1-r0: task do_fetch: Succeeded
NOTE: Running task 1660 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.29.1.bb:do_unpack)
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1661 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_patch)
NOTE: recipe libinput-1.29.1-r0: task do_unpack: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_patch: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_patch: Succeeded
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_unpack: Succeeded
NOTE: Running task 1663 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.20.bb:do_patch)
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 806 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_recipe_qa_setscene)
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_patch: Succeeded
NOTE: Running task 1665 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.20.bb:do_deploy_source_date_epoch)
NOTE: Running task 1666 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.20.bb:do_populate_lic)
NOTE: recipe xkeyboard-config-2.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_populate_lic: Started
NOTE: recipe libinput-1.29.1-r0: task do_unpack: Succeeded
NOTE: Running task 1672 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.29.1.bb:do_patch)
NOTE: recipe libinput-1.29.1-r0: task do_patch: Started
NOTE: recipe libinput-1.29.1-r0: task do_patch: Succeeded
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.20.bb:do_deploy_source_date_epoch unihash changed to 795754b838e590b6884f73973a92138b1633ac0a7757b1937a998db09fa92f21
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.20.bb:do_populate_lic unihash changed to 51fc6425a2cd31a738a53cc2f9e2c5c2ff2ec8c6e72a3c556f3a75b7f10175d2
NOTE: recipe mesa-2_25.2.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 791 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 795 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 796 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 799 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libclc_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 800 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 801 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libclc_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 803 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 804 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 805 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 806 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 807 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 809 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 810 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 811 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 812 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 815 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libclc-21.1.4-r1: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libclc-21.1.4-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libclc-21.1.4-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 817 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 818 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 829 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_25.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 834 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 835 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_packagedata_setscene)
NOTE: Running setscene task 836 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 838 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 839 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm_git.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 841 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 843 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 844 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 846 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 849 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 850 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 851 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe llvm-21.1.4-r1: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libclc-21.1.4-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 852 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 854 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm_git.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_25.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 855 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libclc_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 857 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 858 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 859 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 860 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 861 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 864 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 865 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe llvm-21.1.4-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 866 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 867 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 868 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 869 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 870 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 872 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libclc-21.1.4-r1: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe llvm-21.1.4-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 873 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libclc-21.1.4-r1: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 881 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 882 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 883 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 884 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 886 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 887 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 889 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 893 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 894 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 896 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 897 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 898 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 899 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 900 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 901 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 903 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 905 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 906 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 907 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 908 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 909 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 915 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 916 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 917 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 922 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 926 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.16.0.bb:do_packagedata_setscene)
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 927 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 928 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 929 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 930 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.14.6-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 932 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 933 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 935 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 936 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 937 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 940 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 941 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 943 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.14.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 944 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 947 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 948 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 949 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 951 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 954 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 958 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 959 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: Running setscene task 962 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 963 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 964 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 965 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 968 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 971 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 972 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_packagedata_setscene)
NOTE: Running setscene task 973 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 975 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 976 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 979 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 980 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 981 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 982 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 983 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 984 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 985 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 986 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 987 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.56-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 988 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 991 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 992 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 994 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 995 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 996 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 997 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1002 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1003 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.56-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1006 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1008 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1011 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1014 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1015 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.56-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1017 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1018 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1019 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1020 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1021 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.56-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1023 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1026 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1027 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1028 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1030 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1032 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1033 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1034 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1037 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1039 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1040 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1041 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1043 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1044 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1045 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1046 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1047 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1048 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1049 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1051 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1053 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: Running setscene task 1056 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1058 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1060 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1061 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1063 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1065 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1070 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1072 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1073 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1074 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1075 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1077 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1080 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1087 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1092 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1094 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe llvm-21.1.4-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1096 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1097 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1098 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1100 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe llvm-21.1.4-r1: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.14.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe llvm-21.1.4-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1103 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1104 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.14.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1106 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1107 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.14.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.14.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1109 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1111 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1112 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1113 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1115 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1116 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1117 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1118 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1119 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1120 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1121 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1122 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1123 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1125 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 1126 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1127 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1129 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1131 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1132 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1134 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1137 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1139 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1140 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1142 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1144 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1146 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1148 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1152 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1153 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1155 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1157 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1159 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1160 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1161 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1162 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1164 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1165 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1167 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1168 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1173 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1175 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1177 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1178 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1181 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1183 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1185 of 1186 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2780 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.29.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2941 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.20.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2959 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata)
NOTE: recipe libinput-1.29.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3038 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_packagedata)
NOTE: Running task 3125 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.29.1.bb:do_collect_spdx_deps)
NOTE: Running task 3156 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_package_write_ipk)
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3157 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_package_write_deb)
NOTE: recipe xkeyboard-config-2.45-r0: task do_packagedata: Started
NOTE: Running task 3158 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_package_write_rpm)
NOTE: recipe libinput-1.29.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3159 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_package_qa)
NOTE: recipe mesa-2_25.2.5-r0: task do_package_write_ipk: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_package_write_deb: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_package_qa: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3161 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.20.bb:do_collect_spdx_deps)
NOTE: recipe libinput-1.29.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libinput-1.29.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3162 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.29.1.bb:do_configure)
NOTE: recipe xkeyboard-config-2.45-r0: task do_packagedata: Succeeded
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_collect_spdx_deps: Started
NOTE: recipe libinput-1.29.1-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3168 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.20.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_configure: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_package_qa unihash changed to 61c269e3a2cbb78894ac2d5d0cfd4545ef0353a0163658446b1d6a92a023fbbc
NOTE: recipe libinput-1.29.1-r0: task do_configure: Succeeded
NOTE: Running task 3169 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.29.1.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.29.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.29.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3170 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.29.1.bb:do_compile)
NOTE: recipe libinput-1.29.1-r0: task do_compile: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_package_write_ipk: Succeeded
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_configure: Succeeded
NOTE: Running task 3171 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.20.bb:do_compile)
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_compile: Started
NOTE: recipe libinput-1.29.1-r0: task do_compile: Succeeded
NOTE: Running task 3172 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.29.1.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.29.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.29.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3173 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.29.1.bb:do_install)
NOTE: recipe libinput-1.29.1-r0: task do_install: Started
NOTE: recipe libinput-1.29.1-r0: task do_install: Succeeded
NOTE: Running task 3174 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.29.1.bb:do_install_ptest_base)
NOTE: recipe libinput-1.29.1-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.29.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3175 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.29.1.bb:do_package)
NOTE: Running task 3176 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.29.1.bb:do_populate_sysroot)
NOTE: recipe libinput-1.29.1-r0: task do_package: Started
NOTE: recipe libinput-1.29.1-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libinput-1.29.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libinput-1.29.1-r0: task do_package: Succeeded
NOTE: Running task 3177 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.29.1.bb:do_packagedata)
NOTE: recipe libinput-1.29.1-r0: task do_packagedata: Started
NOTE: recipe libinput-1.29.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.29.1.bb:do_packagedata unihash changed to 6b7d218d7160b072f802ec6fbb36056ea28b8873d577243a8558676e8502707c
NOTE: Setscene tasks completed
NOTE: Running task 3178 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/libinput_1.29.1.bb:do_create_spdx)
NOTE: recipe libinput-1.29.1-r0: task do_create_spdx: Started
NOTE: recipe libinput-1.29.1-r0: task do_create_spdx: Succeeded
NOTE: recipe mesa-2_25.2.5-r0: task do_package_write_deb: Succeeded
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_compile: Succeeded
NOTE: Running task 3179 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.20.bb:do_install)
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_install: Succeeded
NOTE: Running task 3180 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.20.bb:do_package)
NOTE: Running task 3181 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.20.bb:do_populate_sysroot)
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3182 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3183 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_package: Succeeded
NOTE: Running task 3184 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.20.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_packagedata: Succeeded
NOTE: Running task 3185 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.20.bb:do_create_spdx)
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_create_spdx: Started
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_create_spdx: Succeeded
NOTE: Running task 3186 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_collect_spdx_deps)
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_configure: Succeeded
NOTE: Running task 3187 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_compile: Succeeded
NOTE: Running task 3188 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_install)
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_install: Succeeded
NOTE: Running task 3189 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_package)
NOTE: Running task 3190 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_populate_sysroot)
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_package: Succeeded
NOTE: Running task 3191 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_packagedata unihash changed to 32afb14a386c5a830d4b41afb96c034123ceed1392b98da16b755df7a1dd0327
NOTE: Setscene tasks completed
NOTE: Running task 3192 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_create_spdx)
NOTE: Running task 3193 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_package_write_ipk)
NOTE: Running task 3194 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_package_write_deb)
NOTE: Running task 3195 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_package_write_rpm)
NOTE: Running task 3196 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_package_qa)
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_create_spdx: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_package_write_ipk: Started
NOTE: Running task 3197 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.20.bb:do_package_write_ipk)
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_package_write_deb: Started
NOTE: Running task 3198 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.20.bb:do_package_write_deb)
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_package_qa: Started
NOTE: Running task 3199 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.20.bb:do_package_write_rpm)
NOTE: Running task 3200 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.20.bb:do_package_qa)
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_package_write_ipk: Started
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_package_write_deb: Started
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_package_write_rpm: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3201 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.20.bb:do_create_package_spdx)
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_package_qa: Started
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_create_package_spdx: Started
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_package_qa: Succeeded
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.5.0.bb:do_package_qa unihash changed to 1a1af3d0b673d0238bca881e7ade25ac57d1f27b80ffe5cbff8c11e7db2e91f3
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_create_package_spdx: Succeeded
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe xf86-input-libinput-2_1.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_package_write_ipk: Succeeded
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.20.bb:do_package_qa unihash changed to 17eb6f501594da452d1b7b52d230cbc59dca19a401aa0053ccaf8534119f6e7d
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_21.1.20-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 3202 of 3202 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.20.bb:do_build)
NOTE: Tasks Summary: Attempted 3202 tasks of which 3143 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 61 ERROR messages, returning a non-zero exit code.
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-src went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-dbg went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-staticdev went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-dev went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-doc went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-af went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ar went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-az went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-bg went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ca went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-crh went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-cs went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-da went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-de went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-el went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-en-gb went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-eo went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-es went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fa went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fi went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fr went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fur went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-gl went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-he went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-hr went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-hu went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-id went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-it went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ja went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ka went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ko went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ky went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-lt went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-nb went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: libtirpc-1.3.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-src went backwards which would break package feeds (from 0:1.3.7-r0 to 0:1.3.6-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-nl went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: libtirpc-1.3.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dbg went backwards which would break package feeds (from 0:1.3.7-r0 to 0:1.3.6-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pl went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: libtirpc-1.3.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-staticdev went backwards which would break package feeds (from 0:1.3.7-r0 to 0:1.3.6-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pt went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: libtirpc-1.3.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dev went backwards which would break package feeds (from 0:1.3.7-r0 to 0:1.3.6-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pt-br went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: libtirpc-1.3.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-doc went backwards which would break package feeds (from 0:1.3.7-r0 to 0:1.3.6-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ro went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: libtirpc-1.3.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-locale went backwards which would break package feeds (from 0:1.3.7-r0 to 0:1.3.6-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ru went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: libtirpc-1.3.6-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc went backwards which would break package feeds (from 0:1.3.7-r0 to 0:1.3.6-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-rw went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: libtirpc-1.3.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sk went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sl went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sq went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sr went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sv went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-tr went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-uk went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-vi went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-zh-cn went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-zh-tw went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config went backwards which would break package feeds (from 0:2.46-r0 to 0:2.45-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.45-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============9003814315335463673==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xserver-xorg-upgrade-21.1.18-21.1.20.patch"

RnJvbSAwMjk5ZGE2MTA2MjdkZTY1MGI3YjE0YjdmNmJmOThlNDA4ZmYxZDQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAyMToyNDowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhz
ZXJ2ZXIteG9yZzogdXBncmFkZSAyMS4xLjE4IC0+IDIxLjEuMjAKCi0tLQogLi4uL3hvcmcteHNl
cnZlci94c2VydmVyLXhvcmcuaW5jICAgICAgICAgICAgIHwgIDIgKy0KIC4uLi1kdXBsaWNhdGUt
ZGVmaW5pdGlvbnMtb2YtSU9Qb3J0QmFzZS5wYXRjaCB8ICAyICstCiAuLi4tSW50ZWwtZGR4LW9u
bHktZm9yLXByZS1nZW40LWhhcmR3YXIucGF0Y2ggfCAgMiArLQogLi4ub3JnXzIxLjEuMTguYmIg
PT4geHNlcnZlci14b3JnXzIxLjEuMjAuYmJ9IHwgMjQgKysrKysrKysrKysrKysrKysrLQogNCBm
aWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIve3hzZXJ2ZXIteG9yZ18yMS4xLjE4LmJi
ID0+IHhzZXJ2ZXIteG9yZ18yMS4xLjIwLmJifSAoNTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnLmluYyBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnLmluYwppbmRleCAwZGVjZTdiYmEz
Li5lMTJiNzBkMjI4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2Vy
dmVyL3hzZXJ2ZXIteG9yZy5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNl
cnZlci94c2VydmVyLXhvcmcuaW5jCkBAIC0yLDcgKzIsNyBAQCBTVU1NQVJZID0gIlRoZSBYLk9y
ZyBYIHNlcnZlciIKIEhPTUVQQUdFID0gImh0dHA6Ly93d3cueC5vcmciCiBTRUNUSU9OID0gIngx
MS9iYXNlIgogTElDRU5TRSA9ICJNSVQiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZ
SU5HO21kNT01ZGY4Nzk1MGFmNTFhYzJjNTgyMjA5NDU1M2VhMTg4MCIKK0xJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTIxZTMzZGNjY2YyZDUwMzRmNzk4YThlYTYyNjIyOTM5
IgogCiAjIHhmODYtKi0qIHBhY2thZ2VzIGRlcGVuZCBvbiBhbiBYIHNlcnZlciBidWlsdCB3aXRo
IHRoZSB4ZnJlZTg2IEREWAogIyBzbyB3ZSBoYXZlIGEgdmlydHVhbCB0byByZXByZXNlbnQgdGhh
dDoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZl
ci14b3JnLzAwMDEtQXZvaWQtZHVwbGljYXRlLWRlZmluaXRpb25zLW9mLUlPUG9ydEJhc2UucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZy8wMDAx
LUF2b2lkLWR1cGxpY2F0ZS1kZWZpbml0aW9ucy1vZi1JT1BvcnRCYXNlLnBhdGNoCmluZGV4IGU5
Y2JjOWI0ZGEuLmJmOTczODMwMDMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94
b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnLzAwMDEtQXZvaWQtZHVwbGljYXRlLWRlZmluaXRpb25z
LW9mLUlPUG9ydEJhc2UucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNl
cnZlci94c2VydmVyLXhvcmcvMDAwMS1Bdm9pZC1kdXBsaWNhdGUtZGVmaW5pdGlvbnMtb2YtSU9Q
b3J0QmFzZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gY2VkYzc5N2UxYTA4NTAwMzlhMjVi
N2UzODdiMzQyZTU0ZmZmY2M5NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzFkNjk0
MTQ3NGRlMTg5Y2IwMTZiNGU0M2ZjNGQ0MDk2NTllYzA1YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDE3IEF1
ZyAyMDIwIDEwOjUwOjUxIC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIEF2b2lkIGR1cGxpY2F0ZSBk
ZWZpbml0aW9ucyBvZiBJT1BvcnRCYXNlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZy8wMDAxLXhmODZwY2lCdXMuYy11c2UtSW50ZWwt
ZGR4LW9ubHktZm9yLXByZS1nZW40LWhhcmR3YXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZy8wMDAxLXhmODZwY2lCdXMuYy11c2UtSW50ZWwt
ZGR4LW9ubHktZm9yLXByZS1nZW40LWhhcmR3YXIucGF0Y2gKaW5kZXggYTE5NmU1MDc1MS4uNjlj
OGEyNmVkMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZlci94
c2VydmVyLXhvcmcvMDAwMS14Zjg2cGNpQnVzLmMtdXNlLUludGVsLWRkeC1vbmx5LWZvci1wcmUt
Z2VuNC1oYXJkd2FyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2
ZXIveHNlcnZlci14b3JnLzAwMDEteGY4NnBjaUJ1cy5jLXVzZS1JbnRlbC1kZHgtb25seS1mb3It
cHJlLWdlbjQtaGFyZHdhci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYWQ4OTY3ZGUzNmU2
ZTJhMTg1YjcxY2UxZDcwMTQ0OGNkYTRlZjNlMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gOTE0ZTc1YzAzMjMzYzE5YTYzZWZjYThlYTczM2M5OWVmMTFiMWEzMCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IENhbGlmb3JuaWEgU3VsbGl2YW4gPGNhbGlmb3JuaWEubC5zdWxs
aXZhbkBpbnRlbC5jb20+CiBEYXRlOiBGcmksIDE2IE1hciAyMDE4IDE3OjIzOjExIC0wNzAwCiBT
dWJqZWN0OiBbUEFUQ0hdIHhmODZwY2lCdXMuYzogdXNlIEludGVsIGRkeCBvbmx5IGZvciBwcmUt
Z2VuNCBoYXJkd2FyZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNl
cnZlci94c2VydmVyLXhvcmdfMjEuMS4xOC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3Jn
LXhzZXJ2ZXIveHNlcnZlci14b3JnXzIxLjEuMjAuYmIKc2ltaWxhcml0eSBpbmRleCA1NiUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZlci94c2VydmVyLXhvcmdf
MjEuMS4xOC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZlci94
c2VydmVyLXhvcmdfMjEuMS4yMC5iYgppbmRleCAzYzhjYjAxNzNmLi4wOTliODY2NTYxIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZ18y
MS4xLjE4LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZl
ci14b3JnXzIxLjEuMjAuYmIKQEAgLTEsOSArMSwzMSBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxF
U19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgor
IyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhl
IG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYg
bmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2Fn
ZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRl
OiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0t
IENPUFlJTkcKKyMgKysrIENPUFlJTkcKKyMgQEAgLTE2LDcgKzE2LDcgQEAKKyMgIENvcHlyaWdo
dCDCqSAyMDA2LTIwMDggUGV0ZXIgSHV0dGVyZXIKKyMgIENvcHlyaWdodCDCqSAyMDA2IEFkYW0g
SmFja3NvbgorIyAgQ29weXJpZ2h0IMKpIDIwMDktMjAxMCBOVklESUEgQ29ycG9yYXRpb24KKyMg
LUNvcHlyaWdodCDCqSAxOTg3LCAyMDAzLTIwMDYsIDIwMDgtMjAxMCBPcmFjbGUgYW5kL29yIGl0
cyBhZmZpbGlhdGVzLgorIyArQ29weXJpZ2h0IMKpIDE5ODcsIDIwMDMtMjAwNiwgMjAwOC0yMDEw
LCAyMDI1IE9yYWNsZSBhbmQvb3IgaXRzIGFmZmlsaWF0ZXMuCisjICBDb3B5cmlnaHQgwqkgMTk5
OSBLZWl0aCBQYWNrYXJkCisjICBDb3B5cmlnaHQgwqkgMjAwNy0yMDA5IFJlZCBIYXQsIEluYy4K
KyMgIENvcHlyaWdodCDCqSAyMDA1LTIwMDggRGFuaWVsIFN0b25lCisjIAorIworCiByZXF1aXJl
IHhzZXJ2ZXIteG9yZy5pbmMKIAogU1JDX1VSSSArPSAiZmlsZTovLzAwMDEteGY4NnBjaUJ1cy5j
LXVzZS1JbnRlbC1kZHgtb25seS1mb3ItcHJlLWdlbjQtaGFyZHdhci5wYXRjaCBcCiAgICAgICAg
ICAgIGZpbGU6Ly8wMDAxLUF2b2lkLWR1cGxpY2F0ZS1kZWZpbml0aW9ucy1vZi1JT1BvcnRCYXNl
LnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImM4NzhkMTkzMGQ4
NzcyNWQ0YTViZjQ5OGMyNGY0YmU4MTMwZDViMjY0NmE5ZmQwZjI5OTRkZWZmOTAxMTYzNTIiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiNzY5NWJjNjE4MjRiM2E4MWI2YmFkMmY3OGIwNTQwMGNhMDE1
MDAzZGU0MDJkMWIzMjIxMTcxMDViNzAyZTkzNyIKIAogIyBUaGVzZSBleHRlbnNpb25zIGFyZSBu
b3cgaW50ZWdyYXRlZCBpbnRvIHRoZSBzZXJ2ZXIsIHNvIGRlY2xhcmUgdGhlIG1pZ3JhdGlvbgog
IyBwYXRoIGZvciBpbi1wbGFjZSB1cGdyYWRlcy4KLS0gCjIuNDcuMQoK

--===============9003814315335463673==--

