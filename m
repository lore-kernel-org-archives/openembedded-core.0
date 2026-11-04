Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2308.1793770296026065270
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 21:31:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZB1Tp8qg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=F4AH7zSY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a1a50a8ed6-3fe796d7-6cb0-40e5-a0cf-1f5cc09d0e1e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793770295;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=qzWRzbcAj18h/4Ym5oQ7pBcZ4MfOBVtb4bOmSF0l3wE=;
	b=ZB1Tp8qgaWdUjOzMBnaEKbxz9ChNZvFDtU+yXv+XvnRp0AEXE/ovHCm8x5gikK/c
	T557Fg2zEDyicVdqpHRJvNI+xfNz5FRMobtaszUV9XOm11juUkLn9SPSQos+8zJqOkj
	v+p/rIXdOrudq37O/wbloVlf5gkRch6RHVYD/ZMs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793770295;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=qzWRzbcAj18h/4Ym5oQ7pBcZ4MfOBVtb4bOmSF0l3wE=;
	b=F4AH7zSYnxsPy7Q2gR2hC0FJHea3G9r1UWRgpnA1iBypGsjuz7P84xZ8v+0rGIMn
	/Y72fFSCPl1uJluRP4U3E3RIWtz2YAFyR4ibKko/Jj4HqdED5ASC+bEi/QpihOYtshu
	tU4sELcFiohisI2aLKTNRIRVw463FDRsXA1SBPH0=
Content-Type: multipart/mixed; boundary="===============3302807019614468694=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xorgproto: upgrading to 2026.1 SUCCEEDED
Message-ID: <010101a1a50a8ed6-3fe796d7-6cb0-40e5-a0cf-1f5cc09d0e1e-000000@us-west-2.amazonses.com>
Date: Wed, 4 Nov 2026 05:31:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.04-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 05:31:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249323

--===============3302807019614468694==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xorgproto* to *2026.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xorgproto-upgrade-2025.1-2026.1.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 363768fa7f9dc4244e174f7049d539665a3998ae Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 4 Nov 2026 05:28:47 +0000
Subject: [PATCH] xorgproto: upgrade 2025.1 -> 2026.1

---
 .../xorg-proto/{xorgproto_2025.1.bb => xorgproto_2026.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-proto/{xorgproto_2025.1.bb => xorgproto_2026.1.bb} (90%)

diff --git a/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb b/meta/recipes-graphics/xorg-proto/xorgproto_2026.1.bb
similarity index 90%
rename from meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb
rename to meta/recipes-graphics/xorg-proto/xorgproto_2026.1.bb
index e187c56fbc..37327b2d06 100644
--- a/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb
+++ b/meta/recipes-graphics/xorg-proto/xorgproto_2026.1.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING-x11proto;md5=0b9fe3db4015bcbe920e7c67a39ee3f1"
 
 SRC_URI = "${XORG_MIRROR}/individual/proto/${BP}.tar.xz"
-SRC_URI[sha256sum] = "56898c716c0578df8a2d828c9c3e5c528277705c0484381a81960fe1a67668e8"
+SRC_URI[sha256sum] = "f9bfe4a9ed8c8ab9d2a3b0d49797f046052dadd06b7a8b45dbffaffb137e8290"
 
 inherit meson
 
-- 
2.47.1


--===============3302807019614468694==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xorgproto: SRC_URI changed from "https://www.x.org/releases//individual/proto/xorgproto-2025.1.tar.xz" to "https://www.x.org/releases//individual/proto/xorgproto-2026.1.tar.xz"
packages/x86-64-v3-poky-linux/xorgproto: PKGV changed from 2025.1 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/xorgproto: PV changed from "2025.1" to "2026.1"
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-dbg: PKGV changed from 2025.1 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-dbg: PV changed from "2025.1" to "2026.1"
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-dev: PKGSIZE changed from 1183251 to 1184601 (+0%)
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-dev: PKGV changed from 2025.1 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-dev: PV changed from "2025.1" to "2026.1"
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-doc: PKGSIZE changed from 303973 to 303990 (+0%)
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-doc: PKGV changed from 2025.1 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-doc: PV changed from "2025.1" to "2026.1"
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-locale: PKGV changed from 2025.1 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-locale: PV changed from "2025.1" to "2026.1"
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-src: PKGV changed from 2025.1 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-src: PV changed from "2025.1" to "2026.1"
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-staticdev: PKGV changed from 2025.1 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-staticdev: PV changed from "2025.1" to "2026.1"
packages/x86-64-v3-poky-linux/xorgproto/xorgproto: PKGV changed from 2025.1 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/xorgproto/xorgproto: PV changed from "2025.1" to "2026.1"

--===============3302807019614468694==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xorgproto-upgrade-2025.1-2026.1.patch"

RnJvbSAzNjM3NjhmYTdmOWRjNDI0NGUxNzRmNzA0OWQ1Mzk2NjVhMzk5OGFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNCBOb3YgMjAyNiAwNToyODo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhv
cmdwcm90bzogdXBncmFkZSAyMDI1LjEgLT4gMjAyNi4xCgotLS0KIC4uLi94b3JnLXByb3RvL3t4
b3JncHJvdG9fMjAyNS4xLmJiID0+IHhvcmdwcm90b18yMDI2LjEuYmJ9ICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy94b3JnLXByb3RvL3t4b3JncHJvdG9fMjAyNS4xLmJiID0+IHhvcmdw
cm90b18yMDI2LjEuYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3hvcmctcHJvdG8veG9yZ3Byb3RvXzIwMjUuMS5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94
b3JnLXByb3RvL3hvcmdwcm90b18yMDI2LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MCUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctcHJvdG8veG9yZ3Byb3RvXzIwMjUuMS5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctcHJvdG8veG9yZ3Byb3RvXzIw
MjYuMS5iYgppbmRleCBlMTg3YzU2ZmJjLi4zNzMyN2IyZDA2IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MveG9yZy1wcm90by94b3JncHJvdG9fMjAyNS4xLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy94b3JnLXByb3RvL3hvcmdwcm90b18yMDI2LjEuYmIKQEAgLTksNyAr
OSw3IEBAIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlO
Ry14MTFwcm90bzttZDU9MGI5ZmUzZGI0MDE1YmNiZTkyMGU3YzY3YTM5ZWUzZjEiCiAKIFNSQ19V
UkkgPSAiJHtYT1JHX01JUlJPUn0vaW5kaXZpZHVhbC9wcm90by8ke0JQfS50YXIueHoiCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiNTY4OThjNzE2YzA1NzhkZjhhMmQ4MjhjOWMzZTVjNTI4Mjc3NzA1
YzA0ODQzODFhODE5NjBmZTFhNjc2NjhlOCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmOWJmZTRh
OWVkOGM4YWI5ZDJhM2IwZDQ5Nzk3ZjA0NjA1MmRhZGQwNmI3YThiNDVkYmZmYWZmYjEzN2U4Mjkw
IgogCiBpbmhlcml0IG1lc29uCiAKLS0gCjIuNDcuMQoK

--===============3302807019614468694==--
