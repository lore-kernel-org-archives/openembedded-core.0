Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BDC4C71153
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:14 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.5673.1693650552905516454
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=d4uKv5Tx;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cK8S8SCu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018a5570850c-576d46d0-3628-40ad-833f-b0ad833fe77f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FU/kayTgKXeat3CDuzxM8UA2A/PdlIR6myO2TVYFuOU=;
	b=d4uKv5TxHFcVJFynw8JCgv4qr4FZztsYyhTb39isNCKiC/f5JOmyq54HAiN38/kJ
	GA6rknGQqa9ncKjmjfFBbWmXFEJ82XsqEWeBA5iqb0+Nw4Yse8U2rpLyUQjfQk/LCsL
	8jOTZgLfv5kwL9rtgTfNlQOItjHIVuS+OMagHd5Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FU/kayTgKXeat3CDuzxM8UA2A/PdlIR6myO2TVYFuOU=;
	b=cK8S8SCuOBhN6EgXCFn65QonO0tbJdVDsUyP4jJFcnWsEgttPatrXRZQfYPJNEcR
	xknSHd3dLb3I0v+kLUEfew/TDqFvd9uKYUevLDa2jrlR1zTAjM1+KI/nESxM24dn1xB
	/832z4w8n+NJxat7qbcVxBhVRIcUo78gi3cwnyEc=
Content-Type: multipart/mixed; boundary="===============5074140489342201274=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] createrepo-c: upgrading to 1.0.0 SUCCEEDED
Message-ID: <0101018a5570850c-576d46d0-3628-40ad-833f-b0ad833fe77f-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187054

--===============5074140489342201274==
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
CgotLSA+OCAtLQpGcm9tIDc5ZjU1ZTExMzk5ZTNjZDc5OWNjMTRhNGUyNGMwZTRmNmY0MDM4OGMg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCkZyb206IFVwZ3JhZGUgSGVscGVyIDxhdWhAeW9jdG9w
cm9qZWN0Lm9yZz4KRGF0ZTogRnJpLCAxIFNlcCAyMDIzIDExOjI1OjI3ICswMDAwClN1YmplY3Q6
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

--===============5074140489342201274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-2a04bd9a818349b04ba3b1786cbd2e72bf1a8248"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2a04bd9a818349b04ba3b1786cbd2e72bf1a8248"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 177 Local 133 Mirrors 0 Missed 44 Current 694 (75% match, 94% complete)
Removing 6 stale sstate objects for arch qemuppc...done.
Removing 21 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 695 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 719 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 721 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_package_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 723 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 729 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 742 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 752 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 762 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 772 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_create_spdx_setscene)
NOTE: Running setscene task 773 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_package_setscene)
NOTE: Running setscene task 775 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_package_setscene)
NOTE: Running setscene task 784 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 799 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 807 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 808 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 814 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 815 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.14.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 831 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 832 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_package_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_package_setscene: Started
NOTE: Running task 1102 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_recipe_qa)
NOTE: Running task 1103 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_recipe_qa)
NOTE: recipe elfutils-0.189-r0: task do_package_setscene: Started
NOTE: Running task 1208 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_recipe_qa)
NOTE: Running task 1215 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_recipe_qa)
NOTE: recipe dbus-1.14.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 837 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 838 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running task 1297 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_recipe_qa: Started
NOTE: recipe lua-5.4.6-r0: task do_recipe_qa: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_recipe_qa: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_recipe_qa: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 840 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.19-r0: task do_recipe_qa: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1335 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 1336 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_fetch)
NOTE: recipe rpm-1_4.18.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1337 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_fetch)
NOTE: Running task 1338 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_fetch)
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe lua-5.4.6-r0: task do_fetch: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 841 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 842 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 1343 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 1344 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_unpack)
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/glib-2.0/2.76.4/temp/log.do_packagedata_setscene.2056137
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 843 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_package_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1345 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_unpack)
NOTE: recipe lua-5.4.6-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Succeeded
NOTE: Running task 1346 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_unpack)
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1347 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: Running task 1348 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_patch)
NOTE: recipe createrepo-c-1.0.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_setscene: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: Running task 1349 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_patch: Started
NOTE: Running setscene task 844 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: Running task 1354 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.6-r0: task do_patch: Succeeded
NOTE: Running task 1355 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 846 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 847 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 848 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe createrepo-c-1.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1395 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_patch)
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 7568d355d9c9c8ce2f4df915a11aa6dcfb33f13fac4dcb464666b2b9b9ba02ef
NOTE: recipe libxcrypt-4.4.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_patch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Succeeded
NOTE: Running task 1400 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_patch)
NOTE: recipe libxcrypt-4.4.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_package_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1424 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1425 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_generate_toolchain_file)
NOTE: Running task 1426 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_populate_lic)
NOTE: recipe createrepo-c-1.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_populate_lic: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_populate_lic unihash changed to 2a032feaa10635d153a5291d8afe0841109f797c04773109e1e073cc1b1e3fc5
NOTE: recipe createrepo-c-1.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_package_setscene: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Succeeded
NOTE: Running task 1431 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 853 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_recipe_qa_setscene)
NOTE: Running task 1644 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 866 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 867 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 868 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/zlib/1.2.13/temp/log.do_packagedata_setscene.2060205
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 869 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_package_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1922 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1923 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2018 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_collect_spdx_deps)
NOTE: Running task 2050 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_collect_spdx_deps)
NOTE: Running task 2061 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_collect_spdx_deps)
NOTE: recipe zlib-1.2.13-r0: task do_package_setscene: Started
NOTE: Running task 2062 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_collect_spdx_deps)
NOTE: Running task 2077 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_collect_spdx_deps)
NOTE: recipe lua-5.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2078 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_collect_spdx_deps)
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgpg-error-1.47-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe nettle-3.9.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe lua-5.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Started
NOTE: recipe libunistring-1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2089 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_create_spdx)
NOTE: recipe lua-5.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2090 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_configure)
NOTE: recipe libtasn1-4.19.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2091 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_create_spdx)
NOTE: recipe libgpg-error-1.47-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2092 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_create_spdx)
NOTE: recipe lua-5.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2093 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_create_spdx)
NOTE: recipe zlib-1.2.13-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 871 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_recipe_qa_setscene)
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2094 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.6-r0: task do_configure: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx: Started
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx: Started
NOTE: recipe nettle-3.9.1-r0: task do_create_spdx: Started
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe lua-5.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2095 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_configure_ptest_base)
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2175 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata)
NOTE: recipe lua-5.4.6-r0: task do_configure_ptest_base: Started
NOTE: recipe lua-5.4.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2232 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_compile)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_compile: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata: Succeeded
NOTE: Running task 2287 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_packagedata)
NOTE: Running task 2311 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_collect_spdx_deps)
NOTE: Running task 2323 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.1.bb:do_collect_spdx_deps)
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx: Succeeded
NOTE: Running task 2324 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_collect_spdx_deps)
NOTE: recipe file-5.45-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.7.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe file-5.45-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2331 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_create_spdx)
NOTE: recipe libunistring-1.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2332 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_collect_spdx_deps)
NOTE: Running task 2333 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_create_spdx)
NOTE: recipe file-5.45-r0: task do_create_spdx: Started
NOTE: recipe libarchive-3.7.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2334 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.1.bb:do_create_spdx)
NOTE: recipe libidn2-2.3.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_create_spdx: Started
NOTE: Running task 2335 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libidn2-2.3.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libarchive-3.7.1-r0: task do_create_spdx: Started
NOTE: Running task 2336 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_create_spdx)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe libidn2-2.3.4-r0: task do_create_spdx: Started
NOTE: recipe file-5.45-r0: task do_create_spdx: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 9817e6a4efa6dd3c576432bcaa0a5cf193db4cf18a5504b969245390a17b5548
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash b1de7fa11035625f07968e25bf008a21e196941992992f747b7f9e8a385d69f4 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': 'c18125f802dc785bbcc9989df223b54a4fc6f95cde4c399f1d21c435e591ba14', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'b1de7fa11035625f07968e25bf008a21e196941992992f747b7f9e8a385d69f4'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed c18125f802dc785bbcc9989df223b54a4fc6f95cde4c399f1d21c435e591ba14 -> b1de7fa11035625f07968e25bf008a21e196941992992f747b7f9e8a385d69f4 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_packagedata: Succeeded
NOTE: recipe libarchive-3.7.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 2350 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_collect_spdx_deps)
NOTE: recipe libgcrypt-1.10.2-r0: task do_create_spdx: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe curl-8.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2351 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_create_spdx)
NOTE: recipe curl-8.2.1-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2352 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_compile_ptest_base)
NOTE: recipe lua-5.4.6-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2353 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_install)
NOTE: recipe lua-5.4.6-r0: task do_install: Started
NOTE: recipe lua-5.4.6-r0: task do_install: Succeeded
NOTE: Running task 2354 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_install_ptest_base)
NOTE: recipe lua-5.4.6-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2355 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_populate_sysroot)
NOTE: Running task 2356 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_package)
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.6-r0: task do_package: Started
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_create_spdx: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2357 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_collect_spdx_deps)
NOTE: recipe gnutls-3.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnutls-3.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2358 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_create_spdx)
NOTE: recipe gnutls-3.8.0-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.6-r0: task do_package: Succeeded
NOTE: Running task 2359 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_packagedata)
NOTE: recipe lua-5.4.6-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2360 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_create_spdx)
NOTE: recipe lua-5.4.6-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: Running task 2361 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2362 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 2363 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2364 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe gnutls-3.8.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2365 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_collect_spdx_deps)
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_collect_spdx_deps: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2366 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_create_spdx)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_create_spdx: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_create_spdx: Succeeded
NOTE: Running task 2367 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_collect_spdx_deps)
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 2368 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.189-r0: task do_collect_spdx_deps: Started
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.189-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2369 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_create_spdx)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2370 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: Running task 2371 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: recipe elfutils-0.189-r0: task do_create_spdx: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2372 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2373 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_configure)
NOTE: recipe rpm-1_4.18.1-r0: task do_configure: Started
NOTE: recipe elfutils-0.189-r0: task do_create_spdx: Succeeded
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: Running task 2374 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_packagedata: Started
NOTE: recipe popt-1.19-r0: task do_packagedata: Succeeded
NOTE: Running task 2375 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx)
NOTE: recipe popt-1.19-r0: task do_create_spdx: Started
NOTE: recipe popt-1.19-r0: task do_create_spdx: Succeeded
NOTE: Running task 2376 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_collect_spdx_deps)
NOTE: recipe rpm-1_4.18.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_configure: Succeeded
NOTE: Running task 2377 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_compile)
NOTE: recipe rpm-1_4.18.1-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_compile: Succeeded
NOTE: Running task 2378 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_install)
NOTE: recipe rpm-1_4.18.1-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_install: Succeeded
NOTE: Running task 2379 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_package)
NOTE: Running task 2380 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.18.1-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2381 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2382 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_configure)
NOTE: recipe createrepo-c-1.0.0-r0: task do_configure: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2383 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_compile)
NOTE: recipe createrepo-c-1.0.0-r0: task do_compile: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2384 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_install)
NOTE: recipe createrepo-c-1.0.0-r0: task do_install: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_install: Succeeded
NOTE: Running task 2385 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-1.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_package: Succeeded
NOTE: Running task 2386 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_packagedata)
NOTE: recipe rpm-1_4.18.1-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2387 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_package)
NOTE: Running task 2388 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_create_spdx)
NOTE: recipe createrepo-c-1.0.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_create_spdx: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2389 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_collect_spdx_deps)
NOTE: recipe createrepo-c-1.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_package: Succeeded
NOTE: Running task 2390 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_packagedata)
NOTE: recipe createrepo-c-1.0.0-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2391 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_create_spdx)
NOTE: Running task 2392 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_package_write_rpm)
NOTE: Running task 2393 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_package_qa)
NOTE: recipe createrepo-c-1.0.0-r0: task do_create_spdx: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2394 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_create_runtime_spdx)
NOTE: recipe createrepo-c-1.0.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2395 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2395 tasks of which 2297 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 120 ERROR messages, returning a non-zero exit code.
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ab went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ie went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-src went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-dbg went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-ptest went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-staticdev went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-dev went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-doc went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-locale went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5074140489342201274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PV changed from "0.21.1" to "1.0.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PKGV changed from 0.21.1 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: RRECOMMENDS: added "libzstd-dbg"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PV changed from "0.21.1" to "1.0.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGV changed from 0.21.1 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGSIZE changed from 1272496 to 1277356 (+0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: FILELIST: removed "/usr/lib/.debug/libcreaterepo_c.so.0.21.1", added "/usr/lib/.debug/libcreaterepo_c.so.1.0.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: RRECOMMENDS: added "libzstd-dev"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PV changed from "0.21.1" to "1.0.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PKGV changed from 0.21.1 [default] to 1.0.0 [default]
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
packages/core2-32-poky-linux/createrepo-c/createrepo-c: RDEPENDS: added "libzstd (['>= 1.5.5'])"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PKGSIZE changed from 538980 to 547349 (+2%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.0.21.1 /usr/lib/libcreaterepo_c.so.0", added "/usr/lib/libcreaterepo_c.so.1.0.0 /usr/lib/libcreaterepo_c.so.1"
packages/core2-32-poky-linux/createrepo-c: PV changed from "0.21.1" to "1.0.0"
packages/core2-32-poky-linux/createrepo-c: PKGV changed from 0.21.1 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/createrepo-c: SRC_URI changed from "git://github.com/rpm-software-management/createrepo_c;branch=master;protocol=https file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch file://0001-include-rpm-rpmstring.h.patch file://0001-src-cmd_parser.c-add-a-missing-parameter-name.patch file://time64fix.patch" to "git://github.com/rpm-software-management/createrepo_c;branch=master;protocol=https file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch file://0001-include-rpm-rpmstring.h.patch file://time64fix.patch"
Changes to packages/core2-32-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so changed symlink target from libcreaterepo_c.so.0 to libcreaterepo_c.so.1
  /usr/lib/libcreaterepo_c.so.0 moved to /usr/lib/libcreaterepo_c.so.1
  /usr/lib/libcreaterepo_c.so.1.0.0 was added
  /usr/lib/libcreaterepo_c.so.0.21.1 was removed

--===============5074140489342201274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 50 skipped, 0 masked, 0 errors.
Removing 73 recipes from the core2-32 sysroot...done.
Removing 82 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-2a04bd9a818349b04ba3b1786cbd2e72bf1a8248"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2a04bd9a818349b04ba3b1786cbd2e72bf1a8248"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 447 Local 400 Mirrors 0 Missed 47 Current 281 (89% match, 93% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86...done.
NOTE: Executing Tasks
NOTE: Running setscene task 282 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 285 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 286 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 293 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 294 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 297 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 303 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 310 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 316 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 317 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 319 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 320 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 328 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_create_spdx_setscene)
NOTE: Running setscene task 333 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Started
NOTE: Running task 627 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_recipe_qa)
NOTE: Running task 628 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_recipe_qa)
NOTE: Running task 654 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_recipe_qa)
NOTE: Running task 655 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_recipe_qa)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 345 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_recipe_qa: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 347 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 352 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_create_spdx_setscene)
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 366 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 367 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_create_spdx_setscene)
NOTE: recipe lua-5.4.6-r0: task do_recipe_qa: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_recipe_qa: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 369 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe popt-1.19-r0: task do_recipe_qa: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 370 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 372 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 374 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 376 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 378 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe lua-5.4.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 689 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_fetch)
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 690 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_fetch)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe popt-1.19-r0: task do_recipe_qa: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 691 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_fetch)
NOTE: Running task 692 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Started
NOTE: recipe lua-5.4.6-r0: task do_fetch: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe lua-5.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 698 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_unpack)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: Running setscene task 381 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: Running task 699 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 382 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 383 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 385 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 388 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 391 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 394 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_create_spdx_setscene)
NOTE: recipe createrepo-c-1.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 700 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libxml2/2.11.4/temp/log.do_packagedata_setscene.2218718
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 395 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_package_setscene)
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe lua-5.4.6-r0: task do_unpack: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 404 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: Running setscene task 405 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 409 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 410 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 417 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 424 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running task 705 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: Running task 706 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_patch)
NOTE: Running task 710 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_unpack)
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe lua-5.4.6-r0: task do_patch: Started
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 433 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 434 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe lua-5.4.6-r0: task do_patch: Succeeded
NOTE: Running task 761 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 762 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 437 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 441 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_packagedata_setscene)
NOTE: recipe createrepo-c-1.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 768 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_patch)
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 443 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mpfr-4.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_recipe_qa_setscene: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_patch: Started
NOTE: Running task 770 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/glib-2.0/2.76.4/temp/log.do_packagedata_setscene.2218728
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 444 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_package_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 449 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r90: task do_fetch: Succeeded
NOTE: Running task 781 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 782 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpfr-4.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_package_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_package_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_setscene: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Succeeded
NOTE: Running task 788 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r90: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r90: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 789 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 790 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_generate_toolchain_file)
NOTE: Running task 791 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_populate_lic)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 456 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r90: task do_unpack: Succeeded
NOTE: Running task 792 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe createrepo-c-1.0.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_populate_lic: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_patch: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_populate_lic unihash changed to 2a032feaa10635d153a5291d8afe0841109f797c04773109e1e073cc1b1e3fc5
NOTE: recipe base-files-3.0.14-r90: task do_patch: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 877 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe base-files-3.0.14-r90: task do_configure: Started
NOTE: recipe base-files-3.0.14-r90: task do_configure: Succeeded
NOTE: Running task 878 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe base-files-3.0.14-r90: task do_compile: Started
NOTE: recipe base-files-3.0.14-r90: task do_compile: Succeeded
NOTE: Running task 879 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Succeeded
NOTE: Running task 880 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 460 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 462 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 465 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 466 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 468 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 470 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_populate_sysroot_setscene)
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 882 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_fetch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 472 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_package_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 473 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 474 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_package_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 475 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_setscene)
NOTE: recipe libarchive-3.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 476 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.1.bb:do_package_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_fetch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_package_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_package_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_package_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_fetch: Succeeded
NOTE: Running task 883 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_unpack)
NOTE: recipe libarchive-3.7.1-r0: task do_package_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_unpack: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 478 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_package_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 480 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 482 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 483 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 485 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 487 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 488 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 489 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 490 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 492 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_setscene: Succeeded
NOTE: Running task 885 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_fetch)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 494 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 495 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 496 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 498 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.7.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 510 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 511 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 513 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1000 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_fetch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1020 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_fetch)
NOTE: Running task 1053 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Started
NOTE: Running setscene task 518 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_package_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1059 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_fetch)
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 519 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_package_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 520 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_package_setscene)
NOTE: recipe libarchive-3.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_fetch: Started
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 1060 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_unpack)
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_fetch: Started
NOTE: recipe libarchive-3.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1062 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.1.bb:do_fetch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_fetch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_fetch: Succeeded
NOTE: Running task 1063 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_unpack)
NOTE: recipe libgcrypt-1.10.2-r0: task do_package_setscene: Started
NOTE: Running task 1064 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_unpack)
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1065 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_unpack)
NOTE: recipe file-5.45-r0: task do_package_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Started
NOTE: recipe curl-8.2.1-r0: task do_package_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 523 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Started
NOTE: Running setscene task 524 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_package_setscene)
NOTE: recipe libarchive-3.7.1-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 526 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 529 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.7.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 531 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 532 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1071 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.1.bb:do_unpack)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.1-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_package_setscene: Started
NOTE: recipe file-5.45-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 534 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.7.1-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 537 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_unpack: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_package_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_unpack: Succeeded
NOTE: Running setscene task 538 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 539 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 541 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 542 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1100 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_fetch)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_fetch: Succeeded
NOTE: Running task 1106 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_unpack)
NOTE: recipe libgcrypt-1.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1108 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_fetch)
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 546 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.45-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_fetch: Started
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 547 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_package_setscene)
NOTE: recipe libgcrypt-1.10.2-r0: task do_fetch: Succeeded
NOTE: Running task 1109 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_unpack)
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_unpack: Started
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 550 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 551 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 553 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 555 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_package_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.45-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 559 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 562 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 563 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 566 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_package_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 568 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1140 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_fetch)
NOTE: recipe libgpg-error-1.47-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_fetch: Succeeded
NOTE: Running task 1141 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_package_setscene: Succeeded
NOTE: Running task 1142 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running setscene task 570 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 572 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 575 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.0-r0: task do_package_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: Running setscene task 577 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 580 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 581 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 583 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 585 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 586 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1155 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_fetch)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 588 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 590 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 592 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 594 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 597 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 598 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 600 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 602 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 603 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 604 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 606 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 607 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 608 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_fetch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3a1cc294b777438cf57075b2ade5a9c63b5460abf3eed3615217df9727300a7a
NOTE: recipe libgpg-error-1.47-r0: task do_unpack: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1163 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_unpack)
NOTE: recipe gnutls-3.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1165 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_fetch)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 610 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_package_setscene)
NOTE: Running setscene task 611 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_package_setscene)
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 612 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_package_setscene)
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 614 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 617 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_unpack: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 620 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_package_setscene)
NOTE: Running setscene task 622 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 625 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 629 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 631 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1182 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_unpack)
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 633 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 635 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 637 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 638 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_package_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_package_setscene: Started
NOTE: recipe openssl-3.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 640 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 643 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_package_setscene: Started
NOTE: Running setscene task 645 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 647 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 650 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_package_setscene: Started
NOTE: Running setscene task 653 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/zlib/1.2.13/temp/log.do_packagedata_setscene.2239555
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 654 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_package_setscene)
NOTE: recipe openssl-3.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 657 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.2.1-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_package_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 660 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 661 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 662 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_package_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 664 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 666 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1248 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: recipe zlib-1.2.13-r0: task do_package_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 668 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 670 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 671 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 672 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 675 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 1253 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1260 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_fetch)
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1267 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_package_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 676 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 677 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 679 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 680 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_package_setscene)
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 1272 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_package_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1273 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1275 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_fetch)
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_fetch: Started
NOTE: recipe nettle-3.9.1-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1276 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_unpack)
NOTE: Running setscene task 683 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_unpack: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 684 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 685 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 687 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1289 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 688 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 690 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.1-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1290 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 692 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 694 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.1-r0: task do_unpack: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 696 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 697 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 699 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 701 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 702 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 704 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 708 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 709 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 711 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 716 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 717 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 719 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 722 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 723 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 724 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 726 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 728 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1639 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata)
NOTE: Running task 1681 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1682 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1789 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_collect_spdx_deps)
NOTE: Running task 1826 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_collect_spdx_deps)
NOTE: Running task 1843 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_collect_spdx_deps)
NOTE: Running task 1844 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_collect_spdx_deps)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata: Started
NOTE: Running task 1845 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_collect_spdx_deps)
NOTE: Running task 1850 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_collect_spdx_deps)
NOTE: recipe lua-5.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1851 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_collect_spdx_deps)
NOTE: recipe libunistring-1.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1852 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_collect_spdx_deps)
NOTE: Running task 1861 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_collect_spdx_deps)
NOTE: Running task 1862 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_collect_spdx_deps)
NOTE: recipe libgpg-error-1.47-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe nettle-3.9.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libunistring-1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1901 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_create_spdx)
NOTE: recipe musl-obstack-1.2.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe fts-1.2.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe lua-5.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1902 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_configure)
NOTE: recipe libgpg-error-1.47-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1903 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: Running task 1904 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_create_spdx)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata: Succeeded
NOTE: Running task 1905 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_create_spdx)
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1933 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_packagedata)
NOTE: recipe lua-5.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_configure: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_create_spdx: Started
NOTE: recipe fts-1.2.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx: Started
NOTE: Running task 1934 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata)
NOTE: Running task 1941 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_collect_spdx_deps)
NOTE: Running task 1944 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_create_spdx)
NOTE: recipe lua-5.4.6-r0: task do_configure: Succeeded
NOTE: Running task 1945 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_create_spdx)
NOTE: Running task 1946 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_configure_ptest_base)
NOTE: Running task 1947 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.1.bb:do_collect_spdx_deps)
NOTE: Running task 1948 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_create_spdx)
NOTE: Running task 1949 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx)
NOTE: Running task 1950 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_create_spdx)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata: Started
NOTE: recipe file-5.45-r0: task do_collect_spdx_deps: Started
NOTE: recipe nettle-3.9.1-r0: task do_create_spdx: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.6-r0: task do_configure_ptest_base: Started
NOTE: recipe libarchive-3.7.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1968 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_compile)
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx: Started
NOTE: recipe file-5.45-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1969 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_create_spdx)
NOTE: recipe libarchive-3.7.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_compile: Started
NOTE: Running task 1970 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.1.bb:do_create_spdx)
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx: Succeeded
NOTE: recipe file-5.45-r0: task do_create_spdx: Started
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata: Succeeded
NOTE: recipe libarchive-3.7.1-r0: task do_create_spdx: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1972 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_collect_spdx_deps)
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1973 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_collect_spdx_deps)
NOTE: recipe libgcrypt-1.10.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libidn2-2.3.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe file-5.45-r0: task do_create_spdx: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1974 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_create_spdx)
NOTE: recipe libidn2-2.3.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1975 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_create_spdx)
NOTE: recipe libgcrypt-1.10.2-r0: task do_create_spdx: Started
NOTE: recipe libarchive-3.7.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_packagedata: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 1977 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_collect_spdx_deps)
NOTE: recipe libgcrypt-1.10.2-r0: task do_create_spdx: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe curl-8.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1978 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_create_spdx)
NOTE: recipe curl-8.2.1-r0: task do_create_spdx: Started
NOTE: recipe nettle-3.9.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1979 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_collect_spdx_deps)
NOTE: recipe lua-5.4.6-r0: task do_compile: Succeeded
NOTE: Running task 1980 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_compile_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe lua-5.4.6-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1981 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_install)
NOTE: recipe gnutls-3.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1982 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_create_spdx)
NOTE: recipe lua-5.4.6-r0: task do_install: Started
NOTE: recipe gnutls-3.8.0-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.6-r0: task do_install: Succeeded
NOTE: Running task 1983 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_install_ptest_base)
NOTE: recipe curl-8.2.1-r0: task do_create_spdx: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1984 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_populate_sysroot)
NOTE: Running task 1985 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_package)
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.6-r0: task do_package: Started
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_package: Succeeded
NOTE: Running task 1986 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_packagedata)
NOTE: recipe gnutls-3.8.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1987 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_collect_spdx_deps)
NOTE: recipe lua-5.4.6-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_collect_spdx_deps: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1988 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_create_spdx)
NOTE: recipe lua-5.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 1989 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_create_spdx)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.6-r0: task do_create_spdx: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_create_spdx: Succeeded
NOTE: Running task 1990 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_collect_spdx_deps)
NOTE: recipe lua-5.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_collect_spdx_deps: Started
NOTE: recipe elfutils-0.189-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1991 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_create_spdx)
NOTE: recipe elfutils-0.189-r0: task do_create_spdx: Started
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: Running task 1992 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1993 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 1994 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1995 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe elfutils-0.189-r0: task do_create_spdx: Succeeded
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 1996 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1997 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: Running task 1998 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1999 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2000 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_configure)
NOTE: recipe rpm-1_4.18.1-r0: task do_configure: Started
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: Running task 2001 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_packagedata: Started
NOTE: recipe popt-1.19-r0: task do_packagedata: Succeeded
NOTE: Running task 2002 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx)
NOTE: recipe popt-1.19-r0: task do_create_spdx: Started
NOTE: recipe popt-1.19-r0: task do_create_spdx: Succeeded
NOTE: Running task 2003 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_collect_spdx_deps)
NOTE: recipe rpm-1_4.18.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_configure: Succeeded
NOTE: Running task 2004 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_compile)
NOTE: recipe rpm-1_4.18.1-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_compile: Succeeded
NOTE: Running task 2005 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_install)
NOTE: recipe rpm-1_4.18.1-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_install: Succeeded
NOTE: Running task 2006 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_package)
NOTE: Running task 2007 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.18.1-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2008 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2009 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_configure)
NOTE: recipe createrepo-c-1.0.0-r0: task do_configure: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2010 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_compile)
NOTE: recipe createrepo-c-1.0.0-r0: task do_compile: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2011 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_install)
NOTE: recipe createrepo-c-1.0.0-r0: task do_install: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_install: Succeeded
NOTE: Running task 2012 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-1.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_package: Succeeded
NOTE: Running task 2013 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_packagedata)
NOTE: recipe rpm-1_4.18.1-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2014 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_package)
NOTE: Running task 2015 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_create_spdx)
NOTE: recipe createrepo-c-1.0.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_create_spdx: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2016 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_collect_spdx_deps)
NOTE: recipe createrepo-c-1.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_package: Succeeded
NOTE: Running task 2017 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_packagedata)
NOTE: recipe createrepo-c-1.0.0-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2018 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_create_spdx)
NOTE: Running task 2019 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_package_write_rpm)
NOTE: Running task 2020 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_package_qa)
NOTE: recipe createrepo-c-1.0.0-r0: task do_create_spdx: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2021 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_create_runtime_spdx)
NOTE: recipe createrepo-c-1.0.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2022 of 2022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2022 tasks of which 1878 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 131 ERROR messages, returning a non-zero exit code.
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-src went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dbg went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-ptest went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-staticdev went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dev went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-doc went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-locale went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-utils went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2 went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-python went backwards which would break package feeds (from 0:2.11.5-r0 to 0:2.11.4-r0) [version-going-backwards]
ERROR: libxml2-2.11.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ab went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ie went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-src went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-dbg went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-ptest went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-staticdev went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-dev went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-doc went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-locale went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5074140489342201274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 64 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-2a04bd9a818349b04ba3b1786cbd2e72bf1a8248"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2a04bd9a818349b04ba3b1786cbd2e72bf1a8248"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 178 Local 133 Mirrors 0 Missed 45 Current 693 (74% match, 94% complete)
Removing 6 stale sstate objects for arch qemumips...done.
Removing 21 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Running setscene task 694 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 718 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 720 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_package_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 722 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 728 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 741 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 751 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 761 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 771 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 772 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_package_setscene)
NOTE: Running setscene task 774 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_package_setscene)
NOTE: Running setscene task 784 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 799 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 807 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 808 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 814 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 815 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 831 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 832 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1098 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_recipe_qa)
NOTE: Running task 1099 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_recipe_qa)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_package_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_package_setscene: Started
NOTE: Running task 1208 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_recipe_qa)
NOTE: recipe elfutils-0.189-r0: task do_package_setscene: Started
NOTE: Running task 1215 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_recipe_qa)
NOTE: recipe dbus-1.14.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_recipe_qa: Started
NOTE: recipe lua-5.4.6-r0: task do_recipe_qa: Started
NOTE: Running setscene task 837 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 838 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running task 1330 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe rpm-1_4.18.1-r0: task do_recipe_qa: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_recipe_qa: Started
NOTE: recipe popt-1.19-r0: task do_recipe_qa: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lua-5.4.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1335 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 1336 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1337 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_fetch)
NOTE: Running task 1338 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_fetch)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 840 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe lua-5.4.6-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 1339 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 1340 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_unpack)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Started
NOTE: Running setscene task 841 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe createrepo-c-1.0.0-r0: task do_fetch: Started
NOTE: Running setscene task 842 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1345 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_unpack)
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe lua-5.4.6-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1346 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: Running task 1347 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: recipe lua-5.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1348 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_patch)
NOTE: recipe createrepo-c-1.0.0-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 843 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe lua-5.4.6-r0: task do_patch: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: Running task 1353 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: Running task 1354 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lua-5.4.6-r0: task do_patch: Succeeded
NOTE: Running task 1355 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/glib-2.0/2.76.4/temp/log.do_packagedata_setscene.2002510
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 844 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_package_setscene)
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_setscene: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1377 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_patch)
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_patch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: Running task 1378 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_patch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 0b33c027f0202e62503cab7c451fbd457bbba674288a166b0ab8845afb7d30f6
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_package_setscene: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1383 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1384 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_generate_toolchain_file)
NOTE: Running task 1385 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_populate_lic)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 846 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 847 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 848 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe createrepo-c-1.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_populate_lic: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_package_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_populate_lic unihash changed to 2a032feaa10635d153a5291d8afe0841109f797c04773109e1e073cc1b1e3fc5
NOTE: recipe createrepo-c-1.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Succeeded
NOTE: Running task 1431 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 853 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_recipe_qa_setscene)
NOTE: Running task 1644 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe elfutils-0.189-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 866 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 867 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 868 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/zlib/1.2.13/temp/log.do_packagedata_setscene.2006561
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 869 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_package_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1922 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1923 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.2.13-r0: task do_package_setscene: Started
NOTE: Running task 2018 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_collect_spdx_deps)
NOTE: Running task 2048 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_collect_spdx_deps)
NOTE: Running task 2059 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_collect_spdx_deps)
NOTE: Running task 2060 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_collect_spdx_deps)
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2061 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_collect_spdx_deps)
NOTE: Running task 2076 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_collect_spdx_deps)
NOTE: Running task 2077 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_collect_spdx_deps)
NOTE: recipe libunistring-1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgpg-error-1.47-r0: task do_collect_spdx_deps: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe nettle-3.9.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libunistring-1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_package_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe lua-5.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2088 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_create_spdx)
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Started
NOTE: Running setscene task 871 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_recipe_qa_setscene)
NOTE: Running task 2089 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_configure)
NOTE: recipe lua-5.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgpg-error-1.47-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2090 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_create_spdx)
NOTE: recipe nettle-3.9.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.6-r0: task do_configure: Started
NOTE: Running task 2091 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: Running task 2092 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_create_spdx)
NOTE: Running task 2093 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_create_spdx)
NOTE: Running task 2094 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_create_spdx)
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2174 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata)
NOTE: recipe lua-5.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2251 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_create_spdx: Started
NOTE: recipe nettle-3.9.1-r0: task do_create_spdx: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.6-r0: task do_configure_ptest_base: Started
NOTE: recipe lua-5.4.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2261 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_compile)
NOTE: recipe lua-5.4.6-r0: task do_compile: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata: Succeeded
NOTE: Running task 2287 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_packagedata)
NOTE: Running task 2311 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_collect_spdx_deps)
NOTE: Running task 2323 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.1.bb:do_collect_spdx_deps)
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.7.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe file-5.45-r0: task do_collect_spdx_deps: Started
NOTE: recipe libarchive-3.7.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2330 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.1.bb:do_create_spdx)
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx: Succeeded
NOTE: Running task 2331 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_collect_spdx_deps)
NOTE: recipe file-5.45-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2332 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_create_spdx)
NOTE: recipe libarchive-3.7.1-r0: task do_create_spdx: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe file-5.45-r0: task do_create_spdx: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2333 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_create_spdx)
NOTE: recipe libunistring-1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2334 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_collect_spdx_deps)
NOTE: recipe libgcrypt-1.10.2-r0: task do_create_spdx: Started
NOTE: recipe libidn2-2.3.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libidn2-2.3.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2335 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_create_spdx)
NOTE: recipe file-5.45-r0: task do_create_spdx: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_create_spdx: Started
NOTE: Running task 2336 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe libarchive-3.7.1-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5a0aa8749c4947fab02dda4b951409725b6a3a9c7a5a5ec59338227ae49b9835
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 27e380dac56964ea73c10078cb29b3b30b371498a5b35b07801f6bc373655170 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '826289f6266344a4719b4812643d4ce7b3d33890022eb5cda515b3d4e4ac1ede', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '27e380dac56964ea73c10078cb29b3b30b371498a5b35b07801f6bc373655170'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 826289f6266344a4719b4812643d4ce7b3d33890022eb5cda515b3d4e4ac1ede -> 27e380dac56964ea73c10078cb29b3b30b371498a5b35b07801f6bc373655170 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libidn2-2.3.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 2350 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_collect_spdx_deps)
NOTE: recipe libgcrypt-1.10.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_create_spdx: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe curl-8.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2351 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_create_spdx)
NOTE: recipe lua-5.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2352 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_compile_ptest_base)
NOTE: recipe curl-8.2.1-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.6-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2353 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_install)
NOTE: recipe lua-5.4.6-r0: task do_install: Started
NOTE: recipe lua-5.4.6-r0: task do_install: Succeeded
NOTE: Running task 2354 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_install_ptest_base)
NOTE: recipe lua-5.4.6-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2355 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_populate_sysroot)
NOTE: Running task 2356 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_package)
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.6-r0: task do_package: Started
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_create_spdx: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2357 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_collect_spdx_deps)
NOTE: recipe gnutls-3.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnutls-3.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2358 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_create_spdx)
NOTE: recipe gnutls-3.8.0-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.6-r0: task do_package: Succeeded
NOTE: Running task 2359 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_packagedata)
NOTE: recipe lua-5.4.6-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2360 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_create_spdx)
NOTE: recipe lua-5.4.6-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: Running task 2361 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2362 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 2363 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2364 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe gnutls-3.8.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2365 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_collect_spdx_deps)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_collect_spdx_deps: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2366 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_create_spdx)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_create_spdx: Started
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 2367 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_create_spdx: Succeeded
NOTE: Running task 2368 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_collect_spdx_deps)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.189-r0: task do_collect_spdx_deps: Started
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2369 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: Running task 2370 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: recipe elfutils-0.189-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2371 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_create_spdx)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe elfutils-0.189-r0: task do_create_spdx: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2372 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2373 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_configure)
NOTE: recipe rpm-1_4.18.1-r0: task do_configure: Started
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: Running task 2374 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata)
NOTE: recipe elfutils-0.189-r0: task do_create_spdx: Succeeded
NOTE: recipe popt-1.19-r0: task do_packagedata: Started
NOTE: recipe popt-1.19-r0: task do_packagedata: Succeeded
NOTE: Running task 2375 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx)
NOTE: recipe popt-1.19-r0: task do_create_spdx: Started
NOTE: recipe popt-1.19-r0: task do_create_spdx: Succeeded
NOTE: Running task 2376 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_collect_spdx_deps)
NOTE: recipe rpm-1_4.18.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_configure: Succeeded
NOTE: Running task 2377 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_compile)
NOTE: recipe rpm-1_4.18.1-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_compile: Succeeded
NOTE: Running task 2378 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_install)
NOTE: recipe rpm-1_4.18.1-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_install: Succeeded
NOTE: Running task 2379 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_package)
NOTE: Running task 2380 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.18.1-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2381 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2382 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_configure)
NOTE: recipe createrepo-c-1.0.0-r0: task do_configure: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2383 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_compile)
NOTE: recipe createrepo-c-1.0.0-r0: task do_compile: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2384 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_install)
NOTE: recipe createrepo-c-1.0.0-r0: task do_install: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_install: Succeeded
NOTE: Running task 2385 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-1.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_package: Succeeded
NOTE: Running task 2386 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_packagedata)
NOTE: recipe rpm-1_4.18.1-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2387 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_package)
NOTE: Running task 2388 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_create_spdx)
NOTE: recipe createrepo-c-1.0.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_create_spdx: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2389 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_collect_spdx_deps)
NOTE: recipe createrepo-c-1.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_package: Succeeded
NOTE: Running task 2390 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_packagedata)
NOTE: recipe createrepo-c-1.0.0-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2391 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_create_spdx)
NOTE: Running task 2392 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_package_write_rpm)
NOTE: Running task 2393 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_package_qa)
NOTE: recipe createrepo-c-1.0.0-r0: task do_create_spdx: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2394 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_create_runtime_spdx)
NOTE: recipe createrepo-c-1.0.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2395 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2395 tasks of which 2295 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 120 ERROR messages, returning a non-zero exit code.
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ab went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ie went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-src went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-dbg went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-ptest went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-staticdev went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-dev went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-doc went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-locale went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5074140489342201274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1809 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1807 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-2a04bd9a818349b04ba3b1786cbd2e72bf1a8248"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2a04bd9a818349b04ba3b1786cbd2e72bf1a8248"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 176 Local 132 Mirrors 0 Missed 44 Current 695 (75% match, 94% complete)
Removing 6 stale sstate objects for arch qemux86_64...done.
Removing 21 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 696 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 704 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 724 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 726 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_package_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 729 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 734 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 747 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 761 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 771 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 782 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_package_setscene)
NOTE: Running setscene task 784 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_package_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 793 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 798 of 871 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 809 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 811 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 812 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 816 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_create_spdx_setscene)
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 831 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 832 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_package_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_package_setscene: Started
NOTE: Running task 1102 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_recipe_qa)
NOTE: Running task 1103 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_recipe_qa)
NOTE: recipe elfutils-0.189-r0: task do_package_setscene: Started
NOTE: Running task 1208 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_recipe_qa)
NOTE: Running task 1215 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_recipe_qa)
NOTE: recipe dbus-1.14.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 837 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 838 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running task 1302 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_recipe_qa: Started
NOTE: recipe lua-5.4.6-r0: task do_recipe_qa: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_recipe_qa: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_recipe_qa: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 840 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lua-5.4.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe popt-1.19-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1335 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_fetch)
NOTE: Running task 1336 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: recipe createrepo-c-1.0.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1337 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_fetch)
NOTE: Running task 1338 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_fetch)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe lua-5.4.6-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 1339 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 1340 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_unpack)
NOTE: recipe createrepo-c-1.0.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 841 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 842 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe createrepo-c-1.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1345 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_unpack)
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe lua-5.4.6-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Succeeded
NOTE: Running task 1346 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_unpack)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: Running task 1347 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: recipe lua-5.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1348 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_patch)
NOTE: recipe createrepo-c-1.0.0-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glib-2.0/2.76.4/temp/log.do_packagedata_setscene.1891546
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 843 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Started
NOTE: Running task 1349 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe lua-5.4.6-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 844 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: Running task 1354 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.6-r0: task do_patch: Succeeded
NOTE: Running task 1355 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1377 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_patch)
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to d09c5a32b26f664d547f186926a3641ab5aaa30a571662d12e240218b0e77eee
NOTE: recipe lua-5.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 846 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 847 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 848 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe createrepo-c-1.0.0-r0: task do_patch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Succeeded
NOTE: Running task 1400 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_patch)
NOTE: recipe libxcrypt-4.4.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1405 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1406 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_generate_toolchain_file)
NOTE: Running task 1407 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_populate_lic)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_package_setscene: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_populate_lic: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_package_setscene: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_populate_lic unihash changed to 2a032feaa10635d153a5291d8afe0841109f797c04773109e1e073cc1b1e3fc5
NOTE: recipe createrepo-c-1.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Succeeded
NOTE: Running task 1431 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 853 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_recipe_qa_setscene)
NOTE: Running task 1644 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 866 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 867 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 868 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/zlib/1.2.13/temp/log.do_packagedata_setscene.1895524
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 869 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_package_setscene)
NOTE: Running task 1922 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1923 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.2.13-r0: task do_package_setscene: Started
NOTE: Running task 2018 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_collect_spdx_deps)
NOTE: Running task 2050 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_collect_spdx_deps)
NOTE: Running task 2061 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_collect_spdx_deps)
NOTE: Running task 2062 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_collect_spdx_deps)
NOTE: Running task 2077 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_collect_spdx_deps)
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2078 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_collect_spdx_deps)
NOTE: recipe lua-5.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgpg-error-1.47-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe nettle-3.9.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Started
NOTE: recipe libunistring-1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 871 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_recipe_qa_setscene)
NOTE: Running task 2079 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_configure)
NOTE: recipe libgpg-error-1.47-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2080 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_create_spdx)
NOTE: Running task 2081 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_create_spdx)
NOTE: recipe nettle-3.9.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2082 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_create_spdx)
NOTE: Running task 2083 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_create_spdx)
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2094 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lua-5.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libunistring-1.1-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.6-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx: Started
NOTE: recipe nettle-3.9.1-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2174 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata)
NOTE: recipe lua-5.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2242 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_configure_ptest_base)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.6-r0: task do_configure_ptest_base: Started
NOTE: recipe lua-5.4.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2261 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_compile)
NOTE: recipe lua-5.4.6-r0: task do_compile: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata: Succeeded
NOTE: Running task 2287 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_packagedata)
NOTE: Running task 2311 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_collect_spdx_deps)
NOTE: Running task 2323 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.1.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_packagedata: Started
NOTE: recipe file-5.45-r0: task do_collect_spdx_deps: Started
NOTE: recipe libarchive-3.7.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx: Succeeded
NOTE: Running task 2330 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_collect_spdx_deps)
NOTE: recipe file-5.45-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2331 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_create_spdx)
NOTE: recipe libarchive-3.7.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2332 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.1.bb:do_create_spdx)
NOTE: recipe libgcrypt-1.10.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe file-5.45-r0: task do_create_spdx: Started
NOTE: recipe libunistring-1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2333 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_collect_spdx_deps)
NOTE: recipe libarchive-3.7.1-r0: task do_create_spdx: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2334 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_create_spdx)
NOTE: recipe libidn2-2.3.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_create_spdx: Started
NOTE: recipe libidn2-2.3.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2335 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_create_spdx)
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: recipe file-5.45-r0: task do_create_spdx: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_create_spdx: Started
NOTE: Running task 2336 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe libarchive-3.7.1-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3a34e87fb12bc478fce02fd1539f1bd8da47d021d6031c63048a9a21401fce53
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 56acf3aaa566e00cd4cbdd78608e31801f2cc1e968f053dfb34fc48731382641 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '58dff2ceba3d071383386e98241c121d74d9254340a25f9bf652dc4d27744fdd', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '56acf3aaa566e00cd4cbdd78608e31801f2cc1e968f053dfb34fc48731382641'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 58dff2ceba3d071383386e98241c121d74d9254340a25f9bf652dc4d27744fdd -> 56acf3aaa566e00cd4cbdd78608e31801f2cc1e968f053dfb34fc48731382641 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libidn2-2.3.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 2350 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_collect_spdx_deps)
NOTE: recipe libgcrypt-1.10.2-r0: task do_create_spdx: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe curl-8.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2351 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_create_spdx)
NOTE: recipe lua-5.4.6-r0: task do_compile: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_create_spdx: Started
NOTE: Running task 2352 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_compile_ptest_base)
NOTE: recipe lua-5.4.6-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2353 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_install)
NOTE: recipe lua-5.4.6-r0: task do_install: Started
NOTE: recipe lua-5.4.6-r0: task do_install: Succeeded
NOTE: Running task 2354 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_install_ptest_base)
NOTE: recipe lua-5.4.6-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2355 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_populate_sysroot)
NOTE: Running task 2356 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_package)
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.6-r0: task do_package: Started
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_create_spdx: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2357 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_collect_spdx_deps)
NOTE: recipe gnutls-3.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnutls-3.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2358 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_create_spdx)
NOTE: recipe gnutls-3.8.0-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.6-r0: task do_package: Succeeded
NOTE: Running task 2359 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_packagedata)
NOTE: recipe lua-5.4.6-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2360 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_create_spdx)
NOTE: recipe lua-5.4.6-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: Running task 2361 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2362 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 2363 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2364 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe gnutls-3.8.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2365 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_collect_spdx_deps)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_collect_spdx_deps: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2366 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_create_spdx)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_create_spdx: Started
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 2367 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_create_spdx: Succeeded
NOTE: Running task 2368 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_collect_spdx_deps)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2369 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: Running task 2370 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: recipe elfutils-0.189-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2371 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_create_spdx)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe elfutils-0.189-r0: task do_create_spdx: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2372 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2373 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_configure)
NOTE: recipe rpm-1_4.18.1-r0: task do_configure: Started
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: Running task 2374 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.189-r0: task do_create_spdx: Succeeded
NOTE: recipe popt-1.19-r0: task do_packagedata: Succeeded
NOTE: Running task 2375 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx)
NOTE: recipe popt-1.19-r0: task do_create_spdx: Started
NOTE: recipe popt-1.19-r0: task do_create_spdx: Succeeded
NOTE: Running task 2376 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_collect_spdx_deps)
NOTE: recipe rpm-1_4.18.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_configure: Succeeded
NOTE: Running task 2377 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_compile)
NOTE: recipe rpm-1_4.18.1-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_compile: Succeeded
NOTE: Running task 2378 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_install)
NOTE: recipe rpm-1_4.18.1-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_install: Succeeded
NOTE: Running task 2379 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_package)
NOTE: Running task 2380 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.18.1-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2381 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2382 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_configure)
NOTE: recipe createrepo-c-1.0.0-r0: task do_configure: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2383 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_compile)
NOTE: recipe createrepo-c-1.0.0-r0: task do_compile: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2384 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_install)
NOTE: recipe createrepo-c-1.0.0-r0: task do_install: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_install: Succeeded
NOTE: Running task 2385 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-1.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_package: Succeeded
NOTE: Running task 2386 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_packagedata)
NOTE: recipe rpm-1_4.18.1-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2387 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_package)
NOTE: Running task 2388 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_create_spdx)
NOTE: recipe createrepo-c-1.0.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_create_spdx: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2389 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_collect_spdx_deps)
NOTE: recipe createrepo-c-1.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_package: Succeeded
NOTE: Running task 2390 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_packagedata)
NOTE: recipe createrepo-c-1.0.0-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2391 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_create_spdx)
NOTE: Running task 2392 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_package_write_rpm)
NOTE: Running task 2393 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_package_qa)
NOTE: recipe createrepo-c-1.0.0-r0: task do_create_spdx: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2394 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_create_runtime_spdx)
NOTE: recipe createrepo-c-1.0.0-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2395 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2395 tasks of which 2297 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 120 ERROR messages, returning a non-zero exit code.
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ab went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ie went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-src went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-dbg went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-ptest went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-staticdev went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-dev went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-doc went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-locale went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5074140489342201274==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-createrepo-c-upgrade-0.21.1-1.0.0.patch"

RnJvbSA3OWY1NWUxMTM5OWUzY2Q3OTljYzE0YTRlMjRjMGU0ZjZmNDAzODhjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAxMToyNToyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNy
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

--===============5074140489342201274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 54 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-2a04bd9a818349b04ba3b1786cbd2e72bf1a8248"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2a04bd9a818349b04ba3b1786cbd2e72bf1a8248"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 175 Local 131 Mirrors 0 Missed 44 Current 696 (74% match, 94% complete)
Removing 21 stale sstate objects for arch cortexa15t2hf-neon...done.
Removing 6 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 697 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 705 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 725 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 727 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_package_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 740 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 746 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.14.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 761 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_package_setscene)
NOTE: Running setscene task 763 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_package_setscene)
NOTE: Running setscene task 767 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 768 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 787 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 794 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 809 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 810 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 812 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 817 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 830 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 831 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1102 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_recipe_qa)
NOTE: Running task 1103 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_recipe_qa)
NOTE: Running task 1208 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_recipe_qa)
NOTE: Running task 1215 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_recipe_qa)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_package_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_package_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_package_setscene: Started
NOTE: recipe popt-1.19-r0: task do_recipe_qa: Started
NOTE: recipe lua-5.4.6-r0: task do_recipe_qa: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_recipe_qa: Started
NOTE: recipe dbus-1.14.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 837 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 838 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: recipe createrepo-c-1.0.0-r0: task do_recipe_qa: Started
NOTE: Running task 1330 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe lua-5.4.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 840 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe popt-1.19-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1335 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_fetch)
NOTE: Running task 1336 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: recipe rpm-1_4.18.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1337 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_fetch)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1338 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_fetch)
NOTE: recipe lua-5.4.6-r0: task do_fetch: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe lua-5.4.6-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: Running task 1339 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_unpack)
NOTE: Running task 1340 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_fetch: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 841 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 842 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe lua-5.4.6-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1345 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_unpack)
NOTE: Running task 1346 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_unpack)
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: Running task 1347 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: recipe lua-5.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1348 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_patch: Started
NOTE: Running task 1349 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe popt-1.19-r0: task do_patch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/glib-2.0/2.76.4/temp/log.do_packagedata_setscene.1947268
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 843 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_package_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 844 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe lua-5.4.6-r0: task do_patch: Succeeded
NOTE: Running task 1354 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: Running task 1355 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lua-5.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_setscene: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1356 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_patch)
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1378 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_patch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to f982a4123a6cd558c191245ca50978150707844bc8d5e1992485a942d8fdeede
NOTE: Running setscene task 846 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_populate_sysroot_setscene)
NOTE: recipe createrepo-c-1.0.0-r0: task do_patch: Started
NOTE: Running setscene task 847 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 848 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_package_setscene: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1405 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1406 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_generate_toolchain_file)
NOTE: Running task 1407 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_populate_lic)
NOTE: recipe libxcrypt-4.4.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_populate_lic: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_package_setscene: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_populate_lic unihash changed to 2a032feaa10635d153a5291d8afe0841109f797c04773109e1e073cc1b1e3fc5
NOTE: recipe createrepo-c-1.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Succeeded
NOTE: Running task 1431 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 853 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_recipe_qa_setscene)
NOTE: Running task 1644 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 866 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 867 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 868 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/zlib/1.2.13/temp/log.do_packagedata_setscene.1952613
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 869 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_package_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1922 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1923 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2018 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_collect_spdx_deps)
NOTE: recipe zlib-1.2.13-r0: task do_package_setscene: Started
NOTE: Running task 2050 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_collect_spdx_deps)
NOTE: Running task 2061 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_collect_spdx_deps)
NOTE: Running task 2062 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_collect_spdx_deps)
NOTE: Running task 2077 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_collect_spdx_deps)
NOTE: Running task 2078 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_collect_spdx_deps)
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgpg-error-1.47-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe nettle-3.9.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Started
NOTE: recipe lua-5.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2089 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_configure)
NOTE: recipe zlib-1.2.13-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 871 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2090 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_create_spdx)
NOTE: recipe lua-5.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2091 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2092 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_create_spdx)
NOTE: Running task 2093 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_create_spdx)
NOTE: Running task 2094 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_create_spdx)
NOTE: recipe lua-5.4.6-r0: task do_configure: Started
NOTE: recipe lua-5.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_create_spdx: Started
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.6-r0: task do_configure: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_create_spdx: Started
NOTE: Setscene tasks completed
NOTE: Running task 2174 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata)
NOTE: Running task 2230 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_configure_ptest_base)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.6-r0: task do_configure_ptest_base: Started
NOTE: recipe lua-5.4.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2261 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_compile)
NOTE: recipe lua-5.4.6-r0: task do_compile: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata: Succeeded
NOTE: Running task 2287 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_packagedata)
NOTE: Running task 2311 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_collect_spdx_deps)
NOTE: Running task 2323 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.1.bb:do_collect_spdx_deps)
NOTE: recipe file-5.45-r0: task do_collect_spdx_deps: Started
NOTE: recipe libarchive-3.7.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx: Succeeded
NOTE: Running task 2330 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_packagedata: Started
NOTE: recipe file-5.45-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2331 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_create_spdx)
NOTE: recipe libarchive-3.7.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2332 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.1.bb:do_create_spdx)
NOTE: recipe libgcrypt-1.10.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe file-5.45-r0: task do_create_spdx: Started
NOTE: recipe libunistring-1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2333 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_collect_spdx_deps)
NOTE: recipe libarchive-3.7.1-r0: task do_create_spdx: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2334 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_create_spdx)
NOTE: recipe libidn2-2.3.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_create_spdx: Started
NOTE: recipe libidn2-2.3.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2335 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_create_spdx)
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: Running task 2336 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe file-5.45-r0: task do_create_spdx: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_create_spdx: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to f561b45f6c5e241d6ad9ef43d77edcf1f3a5b9f911a27c22eff9209cd0f9544a
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 5ecabd0d7fe46e530d6c5f227c562bb70e4f8a6077fd930210cdbf7e354f4e1a to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '291b537e1c281ca5f06d4dc52c7a84c2db76c4b2e912dbf62ab8f8da9821e042', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '5ecabd0d7fe46e530d6c5f227c562bb70e4f8a6077fd930210cdbf7e354f4e1a'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 291b537e1c281ca5f06d4dc52c7a84c2db76c4b2e912dbf62ab8f8da9821e042 -> 5ecabd0d7fe46e530d6c5f227c562bb70e4f8a6077fd930210cdbf7e354f4e1a as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libarchive-3.7.1-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_packagedata: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 2350 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_collect_spdx_deps)
NOTE: recipe libgcrypt-1.10.2-r0: task do_create_spdx: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe curl-8.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2351 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_create_spdx)
NOTE: recipe curl-8.2.1-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2352 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_compile_ptest_base)
NOTE: recipe lua-5.4.6-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2353 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_install)
NOTE: recipe lua-5.4.6-r0: task do_install: Started
NOTE: recipe lua-5.4.6-r0: task do_install: Succeeded
NOTE: Running task 2354 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_install_ptest_base)
NOTE: recipe lua-5.4.6-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2355 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_populate_sysroot)
NOTE: Running task 2356 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_package)
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.6-r0: task do_package: Started
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_create_spdx: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2357 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_collect_spdx_deps)
NOTE: recipe gnutls-3.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnutls-3.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2358 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_create_spdx)
NOTE: recipe gnutls-3.8.0-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.6-r0: task do_package: Succeeded
NOTE: Running task 2359 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_packagedata)
NOTE: recipe lua-5.4.6-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2360 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_create_spdx)
NOTE: recipe lua-5.4.6-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: Running task 2361 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2362 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 2363 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2364 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe gnutls-3.8.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2365 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_collect_spdx_deps)
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 2366 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_collect_spdx_deps: Started
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2367 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_create_spdx)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2368 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: Running task 2369 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_create_spdx: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_create_spdx: Succeeded
NOTE: Running task 2370 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_collect_spdx_deps)
NOTE: recipe elfutils-0.189-r0: task do_collect_spdx_deps: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2371 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.189-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2372 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_create_spdx)
NOTE: recipe rpm-1_4.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.189-r0: task do_create_spdx: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2373 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_configure)
NOTE: recipe rpm-1_4.18.1-r0: task do_configure: Started
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: Running task 2374 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.189-r0: task do_create_spdx: Succeeded
NOTE: recipe popt-1.19-r0: task do_packagedata: Succeeded
NOTE: Running task 2375 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx)
NOTE: recipe popt-1.19-r0: task do_create_spdx: Started
NOTE: recipe popt-1.19-r0: task do_create_spdx: Succeeded
NOTE: Running task 2376 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_collect_spdx_deps)
NOTE: recipe rpm-1_4.18.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_configure: Succeeded
NOTE: Running task 2377 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_compile)
NOTE: recipe rpm-1_4.18.1-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_compile: Succeeded
NOTE: Running task 2378 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_install)
NOTE: recipe rpm-1_4.18.1-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_install: Succeeded
NOTE: Running task 2379 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_package)
NOTE: Running task 2380 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.18.1-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2381 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2382 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_configure)
NOTE: recipe createrepo-c-1.0.0-r0: task do_configure: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2383 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_compile)
NOTE: recipe createrepo-c-1.0.0-r0: task do_compile: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2384 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_install)
NOTE: recipe createrepo-c-1.0.0-r0: task do_install: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_install: Succeeded
NOTE: Running task 2385 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-1.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_package: Succeeded
NOTE: Running task 2386 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_packagedata)
NOTE: recipe rpm-1_4.18.1-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2387 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_package)
NOTE: Running task 2388 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_create_spdx)
NOTE: recipe createrepo-c-1.0.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_create_spdx: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2389 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_collect_spdx_deps)
NOTE: recipe createrepo-c-1.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_package: Succeeded
NOTE: Running task 2390 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_packagedata)
NOTE: recipe createrepo-c-1.0.0-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2391 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_create_spdx)
NOTE: Running task 2392 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_package_write_rpm)
NOTE: Running task 2393 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_package_qa)
NOTE: recipe createrepo-c-1.0.0-r0: task do_create_spdx: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2394 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_create_runtime_spdx)
NOTE: recipe createrepo-c-1.0.0-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe createrepo-c-1.0.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe createrepo-c-1.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2395 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2395 tasks of which 2297 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 120 ERROR messages, returning a non-zero exit code.
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ab went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ie went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.76.5-r0 to 1:2.76.4-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.76.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-src went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-dbg went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-ptest went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-staticdev went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-dev went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-doc went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-locale went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: QA Issue: Package version for package zlib went backwards which would break package feeds (from 0:1.3-r0 to 0:1.2.13-r0) [version-going-backwards]
ERROR: zlib-1.2.13-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5074140489342201274==
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

--===============5074140489342201274==--

