Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF95CA5FEF
	for <webhook@archiver.kernel.org>; Sun,  4 Oct 2026 05:24:52 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18576.1791091482908167969
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Oct 2026 22:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=c4JcbD3q;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=X1VVJP2G;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a1055f1e37-1dcf4fbf-be1a-45c1-8056-09403f2ad73d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791091482;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=CuZcgk3oI0uePPO2st3UNI2IbwD8liTV19EdabwLNtQ=;
	b=c4JcbD3qYgcUQ8W7rufOPkTwcZqb0CGxM5FqgZ5O3kwOPMWLO7DLIFTfUG+ibcok
	KO0+BuOCOZSsOIwNTH06fnaZ43ON7LuPL+aurbs5SKpJ4TCOHRn22ncDy02qhvIo+oB
	UG20hvt0MPqnN2pBmoO+tdkuVX/CF+nZgvmau9NA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791091482;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=CuZcgk3oI0uePPO2st3UNI2IbwD8liTV19EdabwLNtQ=;
	b=X1VVJP2GR7WL6gkOzaE1sTIc9cj5+i3QopuFao69FRZgkf/Oi44lpT4XokeLyAoV
	WDqGnOyUT9XkbEcxTlVX1Ztb1NjWMGXb98PJcFbjl3i6El+AMH083qzkbpml4ixp2Xh
	bfzbQdFeMdtvSc8Xxv9sOcgu9NE+j+lEg+D0Y1bM=
Content-Type: multipart/mixed; boundary="===============7531657636093482210=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xorgproto: upgrading to 2026.1 SUCCEEDED
Message-ID: <010101a1055f1e37-1dcf4fbf-be1a-45c1-8056-09403f2ad73d-000000@us-west-2.amazonses.com>
Date: Sun, 4 Oct 2026 05:24:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.04-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Oct 2026 05:24:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247188

--===============7531657636093482210==
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
From ec2ef35807109f65d5ce2c188a7993b3c4c3c118 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 4 Oct 2026 05:22:34 +0000
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


--===============7531657636093482210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xorgproto: PV changed from "2025.1" to "2026.1"
packages/x86-64-v3-poky-linux/xorgproto: SRC_URI changed from "https://www.x.org/releases//individual/proto/xorgproto-2025.1.tar.xz" to "https://www.x.org/releases//individual/proto/xorgproto-2026.1.tar.xz"
packages/x86-64-v3-poky-linux/xorgproto: PKGV changed from 2025.1 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-dbg: PV changed from "2025.1" to "2026.1"
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-dbg: PKGV changed from 2025.1 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-dev: PV changed from "2025.1" to "2026.1"
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-dev: PKGV changed from 2025.1 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-dev: PKGSIZE changed from 1183251 to 1184601 (+0%)
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-doc: PV changed from "2025.1" to "2026.1"
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-doc: PKGV changed from 2025.1 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-doc: PKGSIZE changed from 303973 to 303990 (+0%)
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-locale: PV changed from "2025.1" to "2026.1"
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-locale: PKGV changed from 2025.1 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-src: PV changed from "2025.1" to "2026.1"
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-src: PKGV changed from 2025.1 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-staticdev: PV changed from "2025.1" to "2026.1"
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-staticdev: PKGV changed from 2025.1 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/xorgproto/xorgproto: PV changed from "2025.1" to "2026.1"
packages/x86-64-v3-poky-linux/xorgproto/xorgproto: PKGV changed from 2025.1 [default] to 2026.1 [default]

--===============7531657636093482210==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xorgproto-upgrade-2025.1-2026.1.patch"

RnJvbSBlYzJlZjM1ODA3MTA5ZjY1ZDVjZTJjMTg4YTc5OTNiM2M0YzNjMTE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgNCBPY3QgMjAyNiAwNToyMjozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhv
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

--===============7531657636093482210==--

