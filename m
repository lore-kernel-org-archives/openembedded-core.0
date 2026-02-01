Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C9EAE65278
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:13:09 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29196.1769951573142473470
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=1CqGJwCu;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=PAcpFoYF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019c1955ca1f-6192f3f6-18f2-4ee1-99e3-7c532a054a22-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951578;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NFnos73bfY6tfORthZo0roNbcmeiK+J4gTaECRepEfs=;
	b=1CqGJwCuVyBCf1ZzrG0BzXVSsnlw2JsZfCx4CgcwPRSzRb/pqs5c8odeq8aXCCtq
	7Fq8Ow1RXsLV3Lf+eIFDFdTJFY5VR507pU/IWzcrbWVl0nBEwr/u/T72SA8yS/P514F
	dguIHbS3O92XZi7vmQHeQhXy+lLQexiv6Bj91uus=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951578;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NFnos73bfY6tfORthZo0roNbcmeiK+J4gTaECRepEfs=;
	b=PAcpFoYFBO46TP0MpfqgDCmSFRNy6RRvhMQkZ5mrYv0Zws9/R1qB4CBHzzZJFTqk
	k8fWsUFtSQScIYEmiKfcftoqo60PLNc3p3fY/rHA8qLBPoZ/ijcbQM29jVl9IHqpGXg
	Yi1YGCeeGFpT9efgtI71QInhUHT0bJKcezr4KNK0=
Content-Type: multipart/mixed; boundary="===============7820619981698005815=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xorgproto: upgrading to 2025.1 SUCCEEDED
Message-ID: <0101019c1955ca1f-6192f3f6-18f2-4ee1-99e3-7c532a054a22-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:13:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230315

--===============7820619981698005815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xorgproto* to *2025.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xorgproto-upgrade-2024.1-2025.1.patch
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
From 38111e5f207db8ce985e6fe2525a1fd09f03ca5c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 12:05:33 +0000
Subject: [PATCH] xorgproto: upgrade 2024.1 -> 2025.1

---
 .../xorg-proto/{xorgproto_2024.1.bb => xorgproto_2025.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-proto/{xorgproto_2024.1.bb => xorgproto_2025.1.bb} (90%)

diff --git a/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb b/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb
similarity index 90%
rename from meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb
rename to meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb
index d79dc23f1b..e187c56fbc 100644
--- a/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb
+++ b/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING-x11proto;md5=0b9fe3db4015bcbe920e7c67a39ee3f1"
 
 SRC_URI = "${XORG_MIRROR}/individual/proto/${BP}.tar.xz"
-SRC_URI[sha256sum] = "372225fd40815b8423547f5d890c5debc72e88b91088fbfb13158c20495ccb59"
+SRC_URI[sha256sum] = "56898c716c0578df8a2d828c9c3e5c528277705c0484381a81960fe1a67668e8"
 
 inherit meson
 
-- 
2.47.1


--===============7820619981698005815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xorgproto: SRC_URI changed from "https://www.x.org/releases//individual/proto/xorgproto-2024.1.tar.xz" to "https://www.x.org/releases//individual/proto/xorgproto-2025.1.tar.xz"
packages/x86-64-v3-poky-linux/xorgproto: PKGV changed from 2024.1 [default] to 2025.1 [default]
packages/x86-64-v3-poky-linux/xorgproto: PV changed from "2024.1" to "2025.1"
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-dbg: PKGV changed from 2024.1 [default] to 2025.1 [default]
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-dbg: PV changed from "2024.1" to "2025.1"
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-dev: PKGSIZE changed from 1169393 to 1183251 (+1%)
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-dev: PKGV changed from 2024.1 [default] to 2025.1 [default]
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-dev: PV changed from "2024.1" to "2025.1"
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-doc: PKGSIZE changed from 303975 to 303973 (-0%)
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-doc: PKGV changed from 2024.1 [default] to 2025.1 [default]
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-doc: PV changed from "2024.1" to "2025.1"
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-locale: PKGV changed from 2024.1 [default] to 2025.1 [default]
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-locale: PV changed from "2024.1" to "2025.1"
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-src: PKGV changed from 2024.1 [default] to 2025.1 [default]
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-src: PV changed from "2024.1" to "2025.1"
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-staticdev: PKGV changed from 2024.1 [default] to 2025.1 [default]
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-staticdev: PV changed from "2024.1" to "2025.1"
packages/x86-64-v3-poky-linux/xorgproto/xorgproto: PKGV changed from 2024.1 [default] to 2025.1 [default]
packages/x86-64-v3-poky-linux/xorgproto/xorgproto: PV changed from "2024.1" to "2025.1"

--===============7820619981698005815==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xorgproto-upgrade-2024.1-2025.1.patch"

RnJvbSAzODExMWU1ZjIwN2RiOGNlOTg1ZTZmZTI1MjVhMWZkMDlmMDNjYTVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAxMjowNTozMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhv
cmdwcm90bzogdXBncmFkZSAyMDI0LjEgLT4gMjAyNS4xCgotLS0KIC4uLi94b3JnLXByb3RvL3t4
b3JncHJvdG9fMjAyNC4xLmJiID0+IHhvcmdwcm90b18yMDI1LjEuYmJ9ICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy94b3JnLXByb3RvL3t4b3JncHJvdG9fMjAyNC4xLmJiID0+IHhvcmdw
cm90b18yMDI1LjEuYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3hvcmctcHJvdG8veG9yZ3Byb3RvXzIwMjQuMS5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94
b3JnLXByb3RvL3hvcmdwcm90b18yMDI1LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MCUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctcHJvdG8veG9yZ3Byb3RvXzIwMjQuMS5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctcHJvdG8veG9yZ3Byb3RvXzIw
MjUuMS5iYgppbmRleCBkNzlkYzIzZjFiLi5lMTg3YzU2ZmJjIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MveG9yZy1wcm90by94b3JncHJvdG9fMjAyNC4xLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy94b3JnLXByb3RvL3hvcmdwcm90b18yMDI1LjEuYmIKQEAgLTksNyAr
OSw3IEBAIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlO
Ry14MTFwcm90bzttZDU9MGI5ZmUzZGI0MDE1YmNiZTkyMGU3YzY3YTM5ZWUzZjEiCiAKIFNSQ19V
UkkgPSAiJHtYT1JHX01JUlJPUn0vaW5kaXZpZHVhbC9wcm90by8ke0JQfS50YXIueHoiCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiMzcyMjI1ZmQ0MDgxNWI4NDIzNTQ3ZjVkODkwYzVkZWJjNzJlODhi
OTEwODhmYmZiMTMxNThjMjA0OTVjY2I1OSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI1Njg5OGM3
MTZjMDU3OGRmOGEyZDgyOGM5YzNlNWM1MjgyNzc3MDVjMDQ4NDM4MWE4MTk2MGZlMWE2NzY2OGU4
IgogCiBpbmhlcml0IG1lc29uCiAKLS0gCjIuNDcuMQoK

--===============7820619981698005815==--

