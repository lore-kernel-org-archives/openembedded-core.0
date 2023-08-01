Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C37E5C3DA41
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:28:51 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.17596.1690907330140553437
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:28:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YPGv9I3X;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CTDBDB0R;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010189b1ee42e1-e91c9d4e-85d0-4113-9a84-b5ad4e5c87b6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1690907329;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Z4oz8jFU+vON6IONGiPa6qziuKmyZaCfuinCQEOjc30=;
	b=YPGv9I3XZsRvNpPBGhtWJsJ1wVMve/OEneuB/mDItmzwYxFkR2B8+Qx6w7j+fXrW
	sPY25lGuygyIEkSf6ZM6OtwGek3TjEnt4q9SRTl17sUVJzR6r6Jenraid8DBNvUFWhn
	VLGpr0GucGufKn2ssFLeabpEcfj6beyEselW4NOY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1690907329;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Z4oz8jFU+vON6IONGiPa6qziuKmyZaCfuinCQEOjc30=;
	b=CTDBDB0RCUOOImyCcoP7dxHfmA1RlTy61pZBUEwvGaYG1YqoJq8ULHJK7nvplkCY
	AZIVOINsEdcoh/3qPkynZXZMCV7iKYrxz6e6GxrsPDS5XYzzMvh7rrWSqfYzIG9VhZt
	j1xBHI7TJJszOFM+3o6BWHPZD80X/Sy6qPwj13EE=
Content-Type: multipart/mixed; boundary="===============5005271228279777950=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] createrepo-c: upgrading to 1.0.0 SUCCEEDED
Message-ID: <01010189b1ee42e1-e91c9d4e-85d0-4113-9a84-b5ad4e5c87b6-000000@us-west-2.amazonses.com>
Date: Tue, 1 Aug 2023 16:28:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:28:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185277

--===============5005271228279777950==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
ICpjcmVhdGVyZXBvLWMqIHRvICoxLjAuMCogaGFzIFN1Y2NlZWRlZC4KCk5leHQgc3RlcHM6CiAg
ICAtIGFwcGx5IHRoZSBwYXRjaDogZ2l0IGFtIDAwMDEtY3JlYXRlcmVwby1jLXVwZ3JhZGUtMC4y
MS4xLTEuMC4wLnBhdGNoCiAgICAtIGNoZWNrIHRoZSBjaGFuZ2VzIHRvIHVwc3RyZWFtIHBhdGNo
ZXMgYW5kIHN1bW1hcml6ZSB0aGVtIGluIHRoZSBjb21taXQgbWVzc2FnZSwKICAgIC0gY29tcGls
ZSBhbiBpbWFnZSB0aGF0IGNvbnRhaW5zIHRoZSBwYWNrYWdlCiAgICAtIHBlcmZvcm0gc29tZSBi
YXNpYyBzYW5pdHkgdGVzdHMKICAgIC0gYW1lbmQgdGhlIHBhdGNoIGFuZCBzaWduIGl0IG9mZjog
Z2l0IGNvbW1pdCAtcyAtLXJlc2V0LWF1dGhvciAtLWFtZW5kCiAgICAtIHNlbmQgaXQgdG8gdGhl
IGFwcHJvcHJpYXRlIG1haWxpbmcgbGlzdAoKQWx0ZXJuYXRpdmVseSwgaWYgeW91IGJlbGlldmUg
dGhlIHJlY2lwZSBzaG91bGQgbm90IGJlIHVwZ3JhZGVkIGF0IHRoaXMgdGltZSwKeW91IGNhbiBm
aWxsIFJFQ0lQRV9OT19VUERBVEVfUkVBU09OIGluIHJlc3BlY3RpdmUgcmVjaXBlIGZpbGUgc28g
dGhhdAphdXRvbWF0aWMgdXBncmFkZXMgd291bGQgbm8gbG9uZ2VyIGJlIGF0dGVtcHRlZC4KClBs
ZWFzZSByZXZpZXcgdGhlIGF0dGFjaGVkIGZpbGVzIGZvciBmdXJ0aGVyIGluZm9ybWF0aW9uIGFu
ZCBidWlsZC91cGRhdGUgZmFpbHVyZXMuCkFueSBwcm9ibGVtIHBsZWFzZSBmaWxlIGEgYnVnIGF0
IGh0dHBzOi8vYnVnemlsbGEueW9jdG9wcm9qZWN0Lm9yZy9lbnRlcl9idWcuY2dpP3Byb2R1Y3Q9
QXV0b21hdGVkJTIwVXBkYXRlJTIwSGFuZGxlcgoKUmVnYXJkcywKVGhlIFVwZ3JhZGUgSGVscGVy
CgotLSA+OCAtLQpGcm9tIGY5Y2VjOTJlYTFmNGM2ZDg0NjBlMDEwODE3YjFlZGI4MWIwNjM2ZGIg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCkZyb206IFVwZ3JhZGUgSGVscGVyIDxhdWhAeW9jdG9w
cm9qZWN0Lm9yZz4KRGF0ZTogVHVlLCAxIEF1ZyAyMDIzIDA4OjQ4OjA1ICswMDAwClN1YmplY3Q6
IFtQQVRDSF0gY3JlYXRlcmVwby1jOiB1cGdyYWRlIDAuMjEuMSAtPiAxLjAuMAoKLS0tCiAuLi5h
cnNlci5jLWFkZC1hLW1pc3NpbmctcGFyYW1ldGVyLW5hbWUucGF0Y2ggfCAzOSAtLS0tLS0tLS0t
LS0tLS0tLS0tCiAuLi5yZXBvLWNfMC4yMS4xLmJiID0+IGNyZWF0ZXJlcG8tY18xLjAuMC5iYn0g
fCAgMyArLQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNDEgZGVsZXRpb25zKC0p
CiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9j
cmVhdGVyZXBvLWMvMDAwMS1zcmMtY21kX3BhcnNlci5jLWFkZC1hLW1pc3NpbmctcGFyYW1ldGVy
LW5hbWUucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL3tj
cmVhdGVyZXBvLWNfMC4yMS4xLmJiID0+IGNyZWF0ZXJlcG8tY18xLjAuMC5iYn0gKDkyJSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8t
Yy8wMDAxLXNyYy1jbWRfcGFyc2VyLmMtYWRkLWEtbWlzc2luZy1wYXJhbWV0ZXItbmFtZS5wYXRj
aCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jLzAwMDEt
c3JjLWNtZF9wYXJzZXIuYy1hZGQtYS1taXNzaW5nLXBhcmFtZXRlci1uYW1lLnBhdGNoCmRlbGV0
ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwZDFjNmIwOGZiLi4wMDAwMDAwMDAwCi0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jLzAwMDEtc3JjLWNt
ZF9wYXJzZXIuYy1hZGQtYS1taXNzaW5nLXBhcmFtZXRlci1uYW1lLnBhdGNoCisrKyAvZGV2L251
bGwKQEAgLTEsMzkgKzAsMCBAQAotRnJvbSA5NzBiOTAxZTE5OTlmNDE1ZGE4YmFjMjA1ZjUyNmM4
MDhkZGFkMGJhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogQWxleGFuZGVyIEthbmF2
aW4gPGFsZXhAbGludXRyb25peC5kZT4KLURhdGU6IE1vbiwgOCBNYXkgMjAyMyAxMDo0MDo0MyAr
MDIwMAotU3ViamVjdDogW1BBVENIXSBzcmMvY21kX3BhcnNlci5jOiBhZGQgYSBtaXNzaW5nIHBh
cmFtZXRlciBuYW1lCi1NSU1FLVZlcnNpb246IDEuMAotQ29udGVudC1UeXBlOiB0ZXh0L3BsYWlu
OyBjaGFyc2V0PVVURi04Ci1Db250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0Ci0KLVRoaXMg
cmVzb2x2ZXMgdGhlIGZvbGxvd2luZyBlcnJvciB3aXRoIG9sZGVyIHZlcnNpb25zIG9mIGdjYzoK
LXwgL3Nydi9zdG9yYWdlL2FsZXgveW9jdG8vYnVpbGQtMzIvdG1wL3dvcmsveDg2XzY0LWxpbnV4
L2NyZWF0ZXJlcG8tYy1uYXRpdmUvMC4yMS4xLXIwL2dpdC9zcmMvY21kX3BhcnNlci5jOiBJbiBm
dW5jdGlvbiDigJhkdXBsaWNhdGVkX25ldnJhX29wdGlvbl9wYXJzZXLigJk6Ci18IC9zcnYvc3Rv
cmFnZS9hbGV4L3lvY3RvL2J1aWxkLTMyL3RtcC93b3JrL3g4Nl82NC1saW51eC9jcmVhdGVyZXBv
LWMtbmF0aXZlLzAuMjEuMS1yMC9naXQvc3JjL2NtZF9wYXJzZXIuYzo3NjozMjogZXJyb3I6IHBh
cmFtZXRlciBuYW1lIG9taXR0ZWQKLXwgICAgNzYgfCBkdXBsaWNhdGVkX25ldnJhX29wdGlvbl9w
YXJzZXIoY29uc3QgZ2NoYXIgKiwKLXwgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXn5+fn5+fn5+fn5+fgotfCAvc3J2L3N0b3JhZ2UvYWxleC95b2N0by9idWlsZC0zMi90
bXAvd29yay94ODZfNjQtbGludXgvY3JlYXRlcmVwby1jLW5hdGl2ZS8wLjIxLjEtcjAvZ2l0L3Ny
Yy9jbWRfcGFyc2VyLmM6Nzg6MzI6IGVycm9yOiBwYXJhbWV0ZXIgbmFtZSBvbWl0dGVkCi18ICAg
IDc4IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdwb2ludGVyLAotfCAgICAgICB8
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fgotCi1VcHN0cmVhbS1TdGF0
dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRodWIuY29tL3JwbS1zb2Z0d2FyZS1tYW5hZ2VtZW50
L2NyZWF0ZXJlcG9fYy9wdWxsLzM2Nl0KLVNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmlu
IDxhbGV4QGxpbnV0cm9uaXguZGU+Ci0tLS0KLSBzcmMvY21kX3BhcnNlci5jIHwgNCArKy0tCi0g
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKLQotZGlmZiAt
LWdpdCBhL3NyYy9jbWRfcGFyc2VyLmMgYi9zcmMvY21kX3BhcnNlci5jCi1pbmRleCA5N2M5ZWE3
Li42M2FmN2VhIDEwMDY0NAotLS0tIGEvc3JjL2NtZF9wYXJzZXIuYwotKysrIGIvc3JjL2NtZF9w
YXJzZXIuYwotQEAgLTczLDkgKzczLDkgQEAgc3RydWN0IENtZE9wdGlvbnMgX2NtZF9vcHRpb25z
ID0gewotIAotIAotIGdib29sZWFuCi0tZHVwbGljYXRlZF9uZXZyYV9vcHRpb25fcGFyc2VyKGNv
bnN0IGdjaGFyICosCi0rZHVwbGljYXRlZF9uZXZyYV9vcHRpb25fcGFyc2VyKGNvbnN0IGdjaGFy
ICpvcHRpb25fbmFtZSwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgZ2No
YXIgKnZhbHVlLAotLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBncG9pbnRlciwKLSsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ3BvaW50ZXIgZGF0YSwKLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgR0Vycm9yICoqZXJyb3IpCi0gewotICAgICBpZiAoIWdfc3Ry
Y21wMCh2YWx1ZSwgImtlZXAiKSkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9j
cmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jXzAuMjEuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jXzEuMC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTIl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVw
by1jXzAuMjEuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8t
Yy9jcmVhdGVyZXBvLWNfMS4wLjAuYmIKaW5kZXggNTdmMjNiOGRmZC4uOWIxMDkzMjdjOCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBvLWNf
MC4yMS4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRl
cmVwby1jXzEuMC4wLmJiCkBAIC03LDExICs3LDEwIEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0NPUFlJTkc7bWQ1PWIyMzRlZTRkNjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYzIgogU1JDX1VS
SSA9ICJnaXQ6Ly9naXRodWIuY29tL3JwbS1zb2Z0d2FyZS1tYW5hZ2VtZW50L2NyZWF0ZXJlcG9f
YzticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEt
RG8tbm90LXNldC1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1weXRob24ucGF0Y2ggXAog
ICAgICAgICAgICBmaWxlOi8vMDAwMS1pbmNsdWRlLXJwbS1ycG1zdHJpbmcuaC5wYXRjaCBcCi0g
ICAgICAgICAgIGZpbGU6Ly8wMDAxLXNyYy1jbWRfcGFyc2VyLmMtYWRkLWEtbWlzc2luZy1wYXJh
bWV0ZXItbmFtZS5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly90aW1lNjRmaXgucGF0Y2ggXAog
ICAgICAgICAgICAiCiAKLVNSQ1JFViA9ICIwNjUyZDczMDNjZTIzNmU1OTZjODNjMjljY2M5YmVl
Nzg2OGZjZTZlIgorU1JDUkVWID0gIjBjYzEzOTIwOTkxYjJmYjhmODdmYjlkMzUyYmQzMzk0YzI5
ODMyODkiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKLS0gCjIuMzkuMgoK

--===============5005271228279777950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PV changed from "0.21.1" to "1.0.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PKGV changed from 0.21.1 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PV changed from "0.21.1" to "1.0.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGV changed from 0.21.1 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: FILELIST: removed "/usr/lib/.debug/libcreaterepo_c.so.0.21.1", added "/usr/lib/.debug/libcreaterepo_c.so.1.0.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: RRECOMMENDS: added "libzstd-dbg"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGSIZE changed from 1272964 to 1277836 (+0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PV changed from "0.21.1" to "1.0.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PKGV changed from 0.21.1 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: RRECOMMENDS: added "libzstd-dev"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PKGSIZE changed from 146318 to 146430 (+0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PV changed from "0.21.1" to "1.0.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PKGV changed from 0.21.1 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PKGSIZE changed from 16137 to 16193 (+0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-locale: PV changed from "0.21.1" to "1.0.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-locale: PKGV changed from 0.21.1 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PV changed from "0.21.1" to "1.0.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PKGV changed from 0.21.1 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PKGSIZE changed from 1271497 to 1277285 (+0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-staticdev: PV changed from "0.21.1" to "1.0.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-staticdev: PKGV changed from 0.21.1 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PV changed from "0.21.1" to "1.0.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PKGV changed from 0.21.1 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.0.21.1 /usr/lib/libcreaterepo_c.so.0", added "/usr/lib/libcreaterepo_c.so.1 /usr/lib/libcreaterepo_c.so.1.0.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: RDEPENDS: added "libzstd (['>= 1.5.5'])"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PKGSIZE changed from 538980 to 547349 (+2%)
packages/core2-32-poky-linux/createrepo-c: PV changed from "0.21.1" to "1.0.0"
packages/core2-32-poky-linux/createrepo-c: SRC_URI changed from "git://github.com/rpm-software-management/createrepo_c;branch=master;protocol=https file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch file://0001-include-rpm-rpmstring.h.patch file://0001-src-cmd_parser.c-add-a-missing-parameter-name.patch file://time64fix.patch" to "git://github.com/rpm-software-management/createrepo_c;branch=master;protocol=https file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch file://0001-include-rpm-rpmstring.h.patch file://time64fix.patch"
packages/core2-32-poky-linux/createrepo-c: PKGV changed from 0.21.1 [default] to 1.0.0 [default]
Changes to packages/core2-32-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so changed symlink target from libcreaterepo_c.so.0 to libcreaterepo_c.so.1
  /usr/lib/libcreaterepo_c.so.0 moved to /usr/lib/libcreaterepo_c.so.1
  /usr/lib/libcreaterepo_c.so.1.0.0 was added
  /usr/lib/libcreaterepo_c.so.0.21.1 was removed

--===============5005271228279777950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: RRECOMMENDS: added "libzstd-dbg"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: RRECOMMENDS: added "libzstd-dev"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.0 /usr/lib/libcreaterepo_c.so.0.21.1", added "/usr/lib/libcreaterepo_c.so.1.0.0 /usr/lib/libcreaterepo_c.so.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: RDEPENDS: added "libzstd (['>= 1.5.5'])"
Changes to packages/core2-32-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so changed symlink target from libcreaterepo_c.so.0 to libcreaterepo_c.so.1
  /usr/lib/libcreaterepo_c.so.0 moved to /usr/lib/libcreaterepo_c.so.1
  /usr/lib/libcreaterepo_c.so.1.0.0 was added
  /usr/lib/libcreaterepo_c.so.0.21.1 was removed

--===============5005271228279777950==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-createrepo-c-upgrade-0.21.1-1.0.0.patch"

RnJvbSBmOWNlYzkyZWExZjRjNmQ4NDYwZTAxMDgxN2IxZWRiODFiMDYzNmRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBdWcgMjAyMyAwODo0ODowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNy
ZWF0ZXJlcG8tYzogdXBncmFkZSAwLjIxLjEgLT4gMS4wLjAKCi0tLQogLi4uYXJzZXIuYy1hZGQt
YS1taXNzaW5nLXBhcmFtZXRlci1uYW1lLnBhdGNoIHwgMzkgLS0tLS0tLS0tLS0tLS0tLS0tLQog
Li4ucmVwby1jXzAuMjEuMS5iYiA9PiBjcmVhdGVyZXBvLWNfMS4wLjAuYmJ9IHwgIDMgKy0KIDIg
ZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDQxIGRlbGV0aW9ucygtKQogZGVsZXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1j
LzAwMDEtc3JjLWNtZF9wYXJzZXIuYy1hZGQtYS1taXNzaW5nLXBhcmFtZXRlci1uYW1lLnBhdGNo
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy97Y3JlYXRlcmVwby1j
XzAuMjEuMS5iYiA9PiBjcmVhdGVyZXBvLWNfMS4wLjAuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBvLWMvMDAwMS1zcmMt
Y21kX3BhcnNlci5jLWFkZC1hLW1pc3NpbmctcGFyYW1ldGVyLW5hbWUucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tYy8wMDAxLXNyYy1jbWRfcGFy
c2VyLmMtYWRkLWEtbWlzc2luZy1wYXJhbWV0ZXItbmFtZS5wYXRjaApkZWxldGVkIGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMGQxYzZiMDhmYi4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tYy8wMDAxLXNyYy1jbWRfcGFyc2VyLmMt
YWRkLWEtbWlzc2luZy1wYXJhbWV0ZXItbmFtZS5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDM5
ICswLDAgQEAKLUZyb20gOTcwYjkwMWUxOTk5ZjQxNWRhOGJhYzIwNWY1MjZjODA4ZGRhZDBiYSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxp
bnV0cm9uaXguZGU+Ci1EYXRlOiBNb24sIDggTWF5IDIwMjMgMTA6NDA6NDMgKzAyMDAKLVN1Ympl
Y3Q6IFtQQVRDSF0gc3JjL2NtZF9wYXJzZXIuYzogYWRkIGEgbWlzc2luZyBwYXJhbWV0ZXIgbmFt
ZQotTUlNRS1WZXJzaW9uOiAxLjAKLUNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1V
VEYtOAotQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAotCi1UaGlzIHJlc29sdmVzIHRo
ZSBmb2xsb3dpbmcgZXJyb3Igd2l0aCBvbGRlciB2ZXJzaW9ucyBvZiBnY2M6Ci18IC9zcnYvc3Rv
cmFnZS9hbGV4L3lvY3RvL2J1aWxkLTMyL3RtcC93b3JrL3g4Nl82NC1saW51eC9jcmVhdGVyZXBv
LWMtbmF0aXZlLzAuMjEuMS1yMC9naXQvc3JjL2NtZF9wYXJzZXIuYzogSW4gZnVuY3Rpb24g4oCY
ZHVwbGljYXRlZF9uZXZyYV9vcHRpb25fcGFyc2Vy4oCZOgotfCAvc3J2L3N0b3JhZ2UvYWxleC95
b2N0by9idWlsZC0zMi90bXAvd29yay94ODZfNjQtbGludXgvY3JlYXRlcmVwby1jLW5hdGl2ZS8w
LjIxLjEtcjAvZ2l0L3NyYy9jbWRfcGFyc2VyLmM6NzY6MzI6IGVycm9yOiBwYXJhbWV0ZXIgbmFt
ZSBvbWl0dGVkCi18ICAgIDc2IHwgZHVwbGljYXRlZF9uZXZyYV9vcHRpb25fcGFyc2VyKGNvbnN0
IGdjaGFyICosCi18ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+
fn5+fn5+fn4KLXwgL3Nydi9zdG9yYWdlL2FsZXgveW9jdG8vYnVpbGQtMzIvdG1wL3dvcmsveDg2
XzY0LWxpbnV4L2NyZWF0ZXJlcG8tYy1uYXRpdmUvMC4yMS4xLXIwL2dpdC9zcmMvY21kX3BhcnNl
ci5jOjc4OjMyOiBlcnJvcjogcGFyYW1ldGVyIG5hbWUgb21pdHRlZAotfCAgICA3OCB8ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBncG9pbnRlciwKLXwgICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn4KLQotVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0
ZWQgW2h0dHBzOi8vZ2l0aHViLmNvbS9ycG0tc29mdHdhcmUtbWFuYWdlbWVudC9jcmVhdGVyZXBv
X2MvcHVsbC8zNjZdCi1TaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51
dHJvbml4LmRlPgotLS0tCi0gc3JjL2NtZF9wYXJzZXIuYyB8IDQgKystLQotIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9zcmMv
Y21kX3BhcnNlci5jIGIvc3JjL2NtZF9wYXJzZXIuYwotaW5kZXggOTdjOWVhNy4uNjNhZjdlYSAx
MDA2NDQKLS0tLSBhL3NyYy9jbWRfcGFyc2VyLmMKLSsrKyBiL3NyYy9jbWRfcGFyc2VyLmMKLUBA
IC03Myw5ICs3Myw5IEBAIHN0cnVjdCBDbWRPcHRpb25zIF9jbWRfb3B0aW9ucyA9IHsKLSAKLSAK
LSBnYm9vbGVhbgotLWR1cGxpY2F0ZWRfbmV2cmFfb3B0aW9uX3BhcnNlcihjb25zdCBnY2hhciAq
LAotK2R1cGxpY2F0ZWRfbmV2cmFfb3B0aW9uX3BhcnNlcihjb25zdCBnY2hhciAqb3B0aW9uX25h
bWUsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGdjaGFyICp2YWx1ZSwK
LS0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ3BvaW50ZXIsCi0rICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGdwb2ludGVyIGRhdGEsCi0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIEdFcnJvciAqKmVycm9yKQotIHsKLSAgICAgaWYgKCFnX3N0cmNtcDAodmFsdWUs
ICJrZWVwIikpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1j
L2NyZWF0ZXJlcG8tY18wLjIxLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVw
by1jL2NyZWF0ZXJlcG8tY18xLjAuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tY18wLjIxLjEu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVw
by1jXzEuMC4wLmJiCmluZGV4IDU3ZjIzYjhkZmQuLjliMTA5MzI3YzggMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jXzAuMjEuMS5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tY18xLjAu
MC5iYgpAQCAtNywxMSArNywxMCBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5H
O21kNT1iMjM0ZWU0ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyIKIFNSQ19VUkkgPSAiZ2l0Oi8v
Z2l0aHViLmNvbS9ycG0tc29mdHdhcmUtbWFuYWdlbWVudC9jcmVhdGVyZXBvX2M7YnJhbmNoPW1h
c3Rlcjtwcm90b2NvbD1odHRwcyBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLURvLW5vdC1zZXQt
UFlUSE9OX0lOU1RBTExfRElSLWJ5LXJ1bm5pbmctcHl0aG9uLnBhdGNoIFwKICAgICAgICAgICAg
ZmlsZTovLzAwMDEtaW5jbHVkZS1ycG0tcnBtc3RyaW5nLmgucGF0Y2ggXAotICAgICAgICAgICBm
aWxlOi8vMDAwMS1zcmMtY21kX3BhcnNlci5jLWFkZC1hLW1pc3NpbmctcGFyYW1ldGVyLW5hbWUu
cGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vdGltZTY0Zml4LnBhdGNoIFwKICAgICAgICAgICAg
IgogCi1TUkNSRVYgPSAiMDY1MmQ3MzAzY2UyMzZlNTk2YzgzYzI5Y2NjOWJlZTc4NjhmY2U2ZSIK
K1NSQ1JFViA9ICIwY2MxMzkyMDk5MWIyZmI4Zjg3ZmI5ZDM1MmJkMzM5NGMyOTgzMjg5IgogCiBT
ID0gIiR7V09SS0RJUn0vZ2l0IgogCi0tIAoyLjM5LjIKCg==

--===============5005271228279777950==--

