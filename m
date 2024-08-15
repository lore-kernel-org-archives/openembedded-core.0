Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F97FC5473D
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:03 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.131113.1723748335507818011
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=a0cf6ecT;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=3ZXpV3aj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019157683d5f-4ff2847e-f8da-4288-89cc-4f09759d82ba-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5RpV/0T0N/mprx8thZfiWGiV18lRYo6FoaR/CYK9B4M=;
	b=a0cf6ecT/eeD7tvWVUeBbCYOGHkpqNADIAqEFhuO3ZI76Fd8bKYrPFpK2VMYkquF
	tKMwNthkRLjZFd4qEv+bAakRYL2/sjIyzmlkLmBjtflbA/mnv0V6DZv9MjSYQVJG3xB
	5AETbdbN/V4X3qzyQZdyKlKgULBVoaHzZfIqeBeg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5RpV/0T0N/mprx8thZfiWGiV18lRYo6FoaR/CYK9B4M=;
	b=3ZXpV3ajJBT/7tTUKkLyRl60DLXLRObAOV8xjwQLRRpwiaHw6KxyOdV+aWK9VpEN
	m4tTk8XsbLh102wM+Z8w8Lu4i3JoAfjIuWZqbGAkukV9XM+eN66HrB8ppF+BL46ejjn
	7Q3zbxZeOzbVcjDmpWIqWJCLitqCB9YVMQ89ECsI=
Content-Type: multipart/mixed; boundary="===============8134729168386402197=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Carlos Rafael Giani <crg7475@mailbox.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] kmscube: upgrading to 467e86c5cbeb2a2051b31ce2c240d6ddf5bc3112
 SUCCEEDED
Message-ID: <0101019157683d5f-4ff2847e-f8da-4288-89cc-4f09759d82ba-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203424

--===============8134729168386402197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *kmscube* to *467e86c5cbeb2a2051b31ce2c240d6ddf5bc3112* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kmscube-upgrade-to-latest-revision.patch
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
From 50a483789203e0ac721b449c11cada94c8314ff4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 15:07:42 +0000
Subject: [PATCH] kmscube: upgrade to latest revision

---
 .../0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch     | 2 +-
 meta/recipes-graphics/kmscube/kmscube_git.bb                    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube/0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch b/meta/recipes-graphics/kmscube/kmscube/0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch
index f8608d4676..415515b908 100644
--- a/meta/recipes-graphics/kmscube/kmscube/0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch
+++ b/meta/recipes-graphics/kmscube/kmscube/0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch
@@ -1,4 +1,4 @@
-From 5f54f067da7ee24a61d6cb41e0636383729e2bad Mon Sep 17 00:00:00 2001
+From 38237aee63d671cc418902951b8945b59a41a4fd Mon Sep 17 00:00:00 2001
 From: Fabio Estevam <festevam@gmail.com>
 Date: Mon, 8 Jan 2024 15:00:01 -0300
 Subject: [PATCH] cube-gears: Change header file to <GLES3/gl3.h>
diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 19bbcd195d..34d5a7d71d 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm virtual/libgbm"
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
-SRCREV = "6ab022fdfcfedd28f4b5dbd8d3299414a367746f"
+SRCREV = "467e86c5cbeb2a2051b31ce2c240d6ddf5bc3112"
 SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https \
            file://0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch \
            "
-- 
2.44.0


--===============8134729168386402197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/kmscube/kmscube-dbg: PKGV changed from 0.0.1+git0+6ab022fdfc to 0.0.1+git0+467e86c5cb
packages/core2-64-poky-linux/kmscube/kmscube-dev: PKGV changed from 0.0.1+git0+6ab022fdfc to 0.0.1+git0+467e86c5cb
packages/core2-64-poky-linux/kmscube/kmscube-doc: PKGV changed from 0.0.1+git0+6ab022fdfc to 0.0.1+git0+467e86c5cb
packages/core2-64-poky-linux/kmscube/kmscube-locale: PKGV changed from 0.0.1+git0+6ab022fdfc to 0.0.1+git0+467e86c5cb
packages/core2-64-poky-linux/kmscube/kmscube-src: PKGV changed from 0.0.1+git0+6ab022fdfc to 0.0.1+git0+467e86c5cb
packages/core2-64-poky-linux/kmscube/kmscube-staticdev: PKGV changed from 0.0.1+git0+6ab022fdfc to 0.0.1+git0+467e86c5cb
packages/core2-64-poky-linux/kmscube/kmscube: PKGV changed from 0.0.1+git0+6ab022fdfc to 0.0.1+git0+467e86c5cb

--===============8134729168386402197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/kmscube/kmscube-dbg: PKGV changed from 0.0.1+git0+6ab022fdfc to 0.0.1+git0+467e86c5cb
packages/core2-64-poky-linux/kmscube/kmscube-dbg: PKGSIZE changed from 349264 to 349720 (+0%)
packages/core2-64-poky-linux/kmscube/kmscube-dev: PKGV changed from 0.0.1+git0+6ab022fdfc to 0.0.1+git0+467e86c5cb
packages/core2-64-poky-linux/kmscube/kmscube-doc: PKGV changed from 0.0.1+git0+6ab022fdfc to 0.0.1+git0+467e86c5cb
packages/core2-64-poky-linux/kmscube/kmscube-locale: PKGV changed from 0.0.1+git0+6ab022fdfc to 0.0.1+git0+467e86c5cb
packages/core2-64-poky-linux/kmscube/kmscube-src: PKGV changed from 0.0.1+git0+6ab022fdfc to 0.0.1+git0+467e86c5cb
packages/core2-64-poky-linux/kmscube/kmscube-src: PKGSIZE changed from 4610109 to 4610560 (+0%)
packages/core2-64-poky-linux/kmscube/kmscube-staticdev: PKGV changed from 0.0.1+git0+6ab022fdfc to 0.0.1+git0+467e86c5cb
packages/core2-64-poky-linux/kmscube/kmscube: PKGV changed from 0.0.1+git0+6ab022fdfc to 0.0.1+git0+467e86c5cb

--===============8134729168386402197==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-kmscube-upgrade-to-latest-revision.patch"

RnJvbSA1MGE0ODM3ODkyMDNlMGFjNzIxYjQ0OWMxMWNhZGE5NGM4MzE0ZmY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTU6MDc6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBr
bXNjdWJlOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiAuLi4vMDAwMS1jdWJlLWdl
YXJzLUNoYW5nZS1oZWFkZXItZmlsZS10by1HTEVTMy1nbDMuaC5wYXRjaCAgICAgfCAyICstCiBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3Mva21zY3ViZS9rbXNjdWJlX2dpdC5iYiAgICAgICAgICAgICAg
ICAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mva21zY3ViZS9rbXNjdWJl
LzAwMDEtY3ViZS1nZWFycy1DaGFuZ2UtaGVhZGVyLWZpbGUtdG8tR0xFUzMtZ2wzLmgucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mva21zY3ViZS9rbXNjdWJlLzAwMDEtY3ViZS1nZWFycy1D
aGFuZ2UtaGVhZGVyLWZpbGUtdG8tR0xFUzMtZ2wzLmgucGF0Y2gKaW5kZXggZjg2MDhkNDY3Ni4u
NDE1NTE1YjkwOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ttc2N1YmUva21z
Y3ViZS8wMDAxLWN1YmUtZ2VhcnMtQ2hhbmdlLWhlYWRlci1maWxlLXRvLUdMRVMzLWdsMy5oLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9rbXNjdWJlL2ttc2N1YmUvMDAwMS1jdWJl
LWdlYXJzLUNoYW5nZS1oZWFkZXItZmlsZS10by1HTEVTMy1nbDMuaC5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gNWY1NGYwNjdkYTdlZTI0YTYxZDZjYjQxZTA2MzYzODM3MjllMmJhZCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMzgyMzdhZWU2M2Q2NzFjYzQxODkwMjk1MWI4OTQ1
YjU5YTQxYTRmZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEZhYmlvIEVzdGV2YW0g
PGZlc3RldmFtQGdtYWlsLmNvbT4KIERhdGU6IE1vbiwgOCBKYW4gMjAyNCAxNTowMDowMSAtMDMw
MAogU3ViamVjdDogW1BBVENIXSBjdWJlLWdlYXJzOiBDaGFuZ2UgaGVhZGVyIGZpbGUgdG8gPEdM
RVMzL2dsMy5oPgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ttc2N1YmUva21z
Y3ViZV9naXQuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mva21zY3ViZS9rbXNjdWJlX2dpdC5i
YgppbmRleCAxOWJiY2QxOTVkLi4zNGQ1YTdkNzFkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3Mva21zY3ViZS9rbXNjdWJlX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3Mva21zY3ViZS9rbXNjdWJlX2dpdC5iYgpAQCAtMTAsNyArMTAsNyBAQCBERVBFTkRTID0gInZp
cnR1YWwvbGliZ2xlczMgdmlydHVhbC9saWJnbGVzMiB2aXJ0dWFsL2VnbCBsaWJkcm0gdmlydHVh
bC9saWJnYm0iCiAKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL2ttc2N1YmUuYztiZWdpbmxp
bmU9MTtlbmRsaW5lPTIzO21kNT04YjMwOWQ0ZWU2N2I3MzE1ZmY3MzgxMjcwZGQ2MzFmYiIKIAot
U1JDUkVWID0gIjZhYjAyMmZkZmNmZWRkMjhmNGI1ZGJkOGQzMjk5NDE0YTM2Nzc0NmYiCitTUkNS
RVYgPSAiNDY3ZTg2YzVjYmViMmEyMDUxYjMxY2UyYzI0MGQ2ZGRmNWJjMzExMiIKIFNSQ19VUkkg
PSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL2ttc2N1YmU7YnJhbmNoPW1hc3Rl
cjtwcm90b2NvbD1odHRwcyBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWN1YmUtZ2VhcnMtQ2hh
bmdlLWhlYWRlci1maWxlLXRvLUdMRVMzLWdsMy5oLnBhdGNoIFwKICAgICAgICAgICAgIgotLSAK
Mi40NC4wCgo=

--===============8134729168386402197==--

