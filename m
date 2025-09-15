Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE1ECAC5A1
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:54:59 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.30901.1757937287103732334
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=VrEuKBdT;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=q4ZIo5Rm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101994d3a6783-dd155a06-a9e9-4acd-8464-4983b736f393-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937297;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PzLKlBwsafre01duZQR3kotja6bvSU4n1gncri1pCj4=;
	b=VrEuKBdTe/FSs94i36xUgwZoPFZBsfTmS7uQUO68xI+JEa7sZvgvKdjZkIM/JjCP
	XC57Ke22NYaJS8SrzRlNFJ9/96mszrV9Gpm9kBauON7ccnYVROP23Lf2ZX7QjmnnWmA
	XM9/9qkmeyEMxgkBKtzCSTMM/QKbuX6hCDcjjJQA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937297;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PzLKlBwsafre01duZQR3kotja6bvSU4n1gncri1pCj4=;
	b=q4ZIo5RmHcN0LEncFpoeXZHQVEJCDMznkPSORLOq4ZbSZyicXi0BGnnBCO6mleU/
	amE1vQX/LEQkSJ0QoGLbq326kolmQTPH4DZsmU/Y0ulwPwdxlPyv2NNcfBbclBPM8tO
	m9KWTbOTqUupLGsEL2o3WtTawzRCB4kFU4T0IPlk=
Content-Type: multipart/mixed; boundary="===============0014597583586134727=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] nghttp2: upgrading to 1.67.0 SUCCEEDED
Message-ID: <010101994d3a6783-dd155a06-a9e9-4acd-8464-4983b736f393-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223480

--===============0014597583586134727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *nghttp2* to *1.67.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-nghttp2-upgrade-1.66.0-1.67.0.patch
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
From 54ea061bbf4eb7e1b513b9f42e02bfa9464447ea Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Sep 2025 11:44:29 +0000
Subject: [PATCH] nghttp2: upgrade 1.66.0 -> 1.67.0

---
 .../nghttp2/{nghttp2_1.66.0.bb => nghttp2_1.67.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nghttp2/{nghttp2_1.66.0.bb => nghttp2_1.67.0.bb} (84%)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.66.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.67.0.bb
similarity index 84%
rename from meta/recipes-support/nghttp2/nghttp2_1.66.0.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.67.0.bb
index 49d6d7e632..bb31a36c1f 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.66.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.67.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz"
-SRC_URI[sha256sum] = "00ba1bdf0ba2c74b2a4fe6c8b1069dc9d82f82608af24442d430df97c6f9e631"
+SRC_URI[sha256sum] = "d21cf317837f5176b76bed7eded54a4e4583dfa378c9f915913329d9d4a1be86"
 
 inherit cmake manpages python3native github-releases
 
-- 
2.47.1


--===============0014597583586134727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/nghttp2: SRC_URI changed from "https://github.com/nghttp2/nghttp2/releases//download/v1.66.0/nghttp2-1.66.0.tar.xz" to "https://github.com/nghttp2/nghttp2/releases//download/v1.67.0/nghttp2-1.67.0.tar.xz"
packages/x86-64-v3-poky-linux/nghttp2: PV changed from "1.66.0" to "1.67.0"
packages/x86-64-v3-poky-linux/nghttp2: PKGV changed from 1.66.0 [default] to 1.67.0 [default]
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-dbg: PKGSIZE changed from 561344 to 562672 (+0%)
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-dbg: FILELIST: removed "/usr/lib/.debug/libnghttp2.so.14.28.5", added "/usr/lib/.debug/libnghttp2.so.14.29.0"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-dbg: PV changed from "1.66.0" to "1.67.0"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-dbg: PKGV changed from 1.66.0 [default] to 1.67.0 [default]
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-dev: PKGSIZE changed from 248995 to 253583 (+2%)
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-dev: FILELIST: removed "/usr/lib/cmake/nghttp2/nghttp2-targets-relwithdebinfo.cmake /usr/lib/cmake/nghttp2/nghttp2-targets.cmake", added "/usr/lib/cmake/nghttp2/nghttp2ConfigVersion.cmake /usr/lib/cmake/nghttp2/nghttp2Targets.cmake /usr/lib/cmake/nghttp2/nghttp2Config.cmake /usr/lib/cmake/nghttp2/nghttp2Targets-relwithdebinfo.cmake"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-dev: PV changed from "1.66.0" to "1.67.0"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-dev: PKGV changed from 1.66.0 [default] to 1.67.0 [default]
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-doc: PKGSIZE changed from 49545 to 49547 (+0%)
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-doc: PV changed from "1.66.0" to "1.67.0"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-doc: PKGV changed from 1.66.0 [default] to 1.67.0 [default]
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-locale: PV changed from "1.66.0" to "1.67.0"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-locale: PKGV changed from 1.66.0 [default] to 1.67.0 [default]
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-src: PKGSIZE changed from 1041649 to 1048450 (+1%)
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-src: PV changed from "1.66.0" to "1.67.0"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-src: PKGV changed from 1.66.0 [default] to 1.67.0 [default]
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-staticdev: PV changed from "1.66.0" to "1.67.0"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-staticdev: PKGV changed from 1.66.0 [default] to 1.67.0 [default]
packages/x86-64-v3-poky-linux/nghttp2/nghttp2: FILELIST: removed "/usr/lib/libnghttp2.so.14.28.5", added "/usr/lib/libnghttp2.so.14.29.0"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2: PV changed from "1.66.0" to "1.67.0"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2: PKGV changed from 1.66.0 [default] to 1.67.0 [default]
Changes to packages/x86-64-v3-poky-linux/nghttp2 (sysroot):
  /usr/lib/libnghttp2.so.14 changed symlink target from libnghttp2.so.14.28.5 to libnghttp2.so.14.29.0
  /usr/lib/libnghttp2.so.14.28.5 moved to /usr/lib/libnghttp2.so.14.29.0
  /usr/lib/cmake/nghttp2/nghttp2Config.cmake was added
  /usr/lib/cmake/nghttp2/nghttp2ConfigVersion.cmake was added
  /usr/lib/cmake/nghttp2/nghttp2Targets.cmake was added
  /usr/lib/cmake/nghttp2/nghttp2Targets-relwithdebinfo.cmake was added
  /usr/lib/cmake/nghttp2/nghttp2-targets.cmake was removed
  /usr/lib/cmake/nghttp2/nghttp2-targets-relwithdebinfo.cmake was removed

--===============0014597583586134727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/nghttp2/nghttp2-dev: FILELIST: removed "/usr/lib/cmake/nghttp2/nghttp2-targets.cmake /usr/lib/cmake/nghttp2/nghttp2-targets-relwithdebinfo.cmake", added "/usr/lib/cmake/nghttp2/nghttp2ConfigVersion.cmake /usr/lib/cmake/nghttp2/nghttp2Targets.cmake /usr/lib/cmake/nghttp2/nghttp2Config.cmake /usr/lib/cmake/nghttp2/nghttp2Targets-relwithdebinfo.cmake"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2: FILELIST: removed "/usr/lib/libnghttp2.so.14.28.5", added "/usr/lib/libnghttp2.so.14.29.0"
Changes to packages/x86-64-v3-poky-linux/nghttp2 (sysroot):
  /usr/lib/libnghttp2.so.14 changed symlink target from libnghttp2.so.14.28.5 to libnghttp2.so.14.29.0
  /usr/lib/libnghttp2.so.14.28.5 moved to /usr/lib/libnghttp2.so.14.29.0
  /usr/lib/cmake/nghttp2/nghttp2Config.cmake was added
  /usr/lib/cmake/nghttp2/nghttp2ConfigVersion.cmake was added
  /usr/lib/cmake/nghttp2/nghttp2Targets.cmake was added
  /usr/lib/cmake/nghttp2/nghttp2Targets-relwithdebinfo.cmake was added
  /usr/lib/cmake/nghttp2/nghttp2-targets.cmake was removed
  /usr/lib/cmake/nghttp2/nghttp2-targets-relwithdebinfo.cmake was removed

--===============0014597583586134727==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-nghttp2-upgrade-1.66.0-1.67.0.patch"

RnJvbSA1NGVhMDYxYmJmNGViN2UxYjUxM2I5ZjQyZTAyYmZhOTQ2NDQ0N2VhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMTE6NDQ6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBu
Z2h0dHAyOiB1cGdyYWRlIDEuNjYuMCAtPiAxLjY3LjAKCi0tLQogLi4uL25naHR0cDIve25naHR0
cDJfMS42Ni4wLmJiID0+IG5naHR0cDJfMS42Ny4wLmJifSAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbmdodHRwMi97bmdodHRwMl8xLjY2LjAuYmIgPT4gbmdodHRwMl8xLjY3
LjAuYmJ9ICg4NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmdodHRwMi9u
Z2h0dHAyXzEuNjYuMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L25naHR0cDIvbmdodHRwMl8x
LjY3LjAuYmIKc2ltaWxhcml0eSBpbmRleCA4NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbmdodHRwMi9uZ2h0dHAyXzEuNjYuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbmdodHRwMi9uZ2h0dHAyXzEuNjcuMC5iYgppbmRleCA0OWQ2ZDdlNjMyLi5iYjMxYTM2
YzFmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9uZ2h0dHAyL25naHR0cDJfMS42
Ni4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L25naHR0cDIvbmdodHRwMl8xLjY3LjAu
YmIKQEAgLTUsNyArNSw3IEBAIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9NzY0YWJkZjMwYjJlYWRkMzdjZTQ3ZGNiY2UwZWExZWMiCiAKIFNS
Q19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkL3Yke1BWfS9uZ2h0dHAyLSR7UFZ9
LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwMGJhMWJkZjBiYTJjNzRiMmE0ZmU2Yzhi
MTA2OWRjOWQ4MmY4MjYwOGFmMjQ0NDJkNDMwZGY5N2M2ZjllNjMxIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImQyMWNmMzE3ODM3ZjUxNzZiNzZiZWQ3ZWRlZDU0YTRlNDU4M2RmYTM3OGM5ZjkxNTkx
MzMyOWQ5ZDRhMWJlODYiCiAKIGluaGVyaXQgY21ha2UgbWFucGFnZXMgcHl0aG9uM25hdGl2ZSBn
aXRodWItcmVsZWFzZXMKIAotLSAKMi40Ny4xCgo=

--===============0014597583586134727==--

