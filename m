Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A8FF4211C
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:38 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19729.1776261867843336968
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=FpOzioc6;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gTWpCfbD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019d91753db7-fe86190f-731b-43ee-8143-fa56e67b8bd8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261873;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=B6YOBlesqQrwvxWiVaiQwzC57yGkjaRr+dnkzF5XU/M=;
	b=FpOzioc6Jl7esl4SS/J6KVz5dN+3ODc+/wfsGLCQe12ZIlw6x/tw0YiYErEJHtDQ
	O0XObuU0NbeXRNHdueXNrj9lbSkorNh5wwvwr3px7GlPRNLeRtzb/hfX0d/Sj1eXAp5
	xYEDutKmapPLmndiYE1OQ2cmSm44jfsNTQRxX9pY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261873;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=B6YOBlesqQrwvxWiVaiQwzC57yGkjaRr+dnkzF5XU/M=;
	b=gTWpCfbDgvh9Z2NEVwSiKB9uMltqdWDCgKiGB6xxBRSXCvb4A1QjXupEgzVes3Sx
	X/eRQxeBchQ+H1FXGgiVwcchmcTS5VIm/G/PMg8CJV9o62SbaYCeAyahgvhxaT/qV8j
	IqOHcVC+ahj8vcnxkp4zBlaykEoEMZZOEeLLUshA=
Content-Type: multipart/mixed; boundary="===============4213012455454320842=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ccache: upgrading to 4.13.3 SUCCEEDED
Message-ID: <0101019d91753db7-fe86190f-731b-43ee-8143-fa56e67b8bd8-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235210

--===============4213012455454320842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ccache* to *4.13.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ccache-upgrade-4.13.2-4.13.3.patch
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
From 0662ed2a38ddac771f633da1989fccc3471ec7ca Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 06:55:39 +0000
Subject: [PATCH] ccache: upgrade 4.13.2 -> 4.13.3

---
 .../ccache/{ccache_4.13.2.bb => ccache_4.13.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_4.13.2.bb => ccache_4.13.3.bb} (93%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.13.2.bb b/meta/recipes-devtools/ccache/ccache_4.13.3.bb
similarity index 93%
rename from meta/recipes-devtools/ccache/ccache_4.13.2.bb
rename to meta/recipes-devtools/ccache/ccache_4.13.3.bb
index 9fe82f5ee0..ec440900f6 100644
--- a/meta/recipes-devtools/ccache/ccache_4.13.2.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.13.3.bb
@@ -16,7 +16,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "e87efda8ae54f94b1cb0e8dbfdf26397bd7d0a9c0c4f38b18dde73f4ec9ac721"
+SRC_URI[sha256sum] = "c149d71f47f6fe08e4f2e43db4b0b091c61e8ea3daa23aa998b094bd84ecdfe8"
 
 inherit cmake github-releases
 
-- 
2.47.1


--===============4213012455454320842==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ccache-upgrade-4.13.2-4.13.3.patch"

RnJvbSAwNjYyZWQyYTM4ZGRhYzc3MWY2MzNkYTE5ODlmY2NjMzQ3MWVjN2NhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDY6NTU6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
Y2FjaGU6IHVwZ3JhZGUgNC4xMy4yIC0+IDQuMTMuMwoKLS0tCiAuLi4vY2NhY2hlL3tjY2FjaGVf
NC4xMy4yLmJiID0+IGNjYWNoZV80LjEzLjMuYmJ9ICAgICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvY2NhY2hlL3tjY2FjaGVfNC4xMy4yLmJiID0+IGNjYWNoZV80LjEzLjMu
YmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9jY2Fj
aGVfNC4xMy4yLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9jY2FjaGVfNC4xMy4z
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9jY2FjaGUvY2NhY2hlXzQuMTMuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2NjYWNoZS9jY2FjaGVfNC4xMy4zLmJiCmluZGV4IDlmZTgyZjVlZTAuLmVjNDQwOTAwZjYgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2NhY2hlXzQuMTMuMi5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80LjEzLjMuYmIKQEAgLTE2
LDcgKzE2LDcgQEAgREVQRU5EUyA9ICJ6c3RkIGZtdCB4eGhhc2giCiAKIFNSQ19VUkkgPSAiJHtH
SVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkL3Yke1BWfS8ke0JQfS50YXIuZ3oiCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICJlODdlZmRhOGFlNTRmOTRiMWNiMGU4ZGJmZGYyNjM5N2JkN2QwYTljMGM0
ZjM4YjE4ZGRlNzNmNGVjOWFjNzIxIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImMxNDlkNzFmNDdm
NmZlMDhlNGYyZTQzZGI0YjBiMDkxYzYxZThlYTNkYWEyM2FhOTk4YjA5NGJkODRlY2RmZTgiCiAK
IGluaGVyaXQgY21ha2UgZ2l0aHViLXJlbGVhc2VzCiAKLS0gCjIuNDcuMQoK

--===============4213012455454320842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ccache/ccache-dbg: PKGSIZE changed from 40536472 to 40658216 (+0%)
packages/x86-64-v3-poky-linux/ccache/ccache-dbg: PV changed from "4.13.2" to "4.13.3"
packages/x86-64-v3-poky-linux/ccache/ccache-dbg: PKGV changed from 4.13.2 [default] to 4.13.3 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-dev: PV changed from "4.13.2" to "4.13.3"
packages/x86-64-v3-poky-linux/ccache/ccache-dev: PKGV changed from 4.13.2 [default] to 4.13.3 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-doc: PV changed from "4.13.2" to "4.13.3"
packages/x86-64-v3-poky-linux/ccache/ccache-doc: PKGV changed from 4.13.2 [default] to 4.13.3 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-locale: PV changed from "4.13.2" to "4.13.3"
packages/x86-64-v3-poky-linux/ccache/ccache-locale: PKGV changed from 4.13.2 [default] to 4.13.3 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-src: PKGSIZE changed from 1842207 to 1843836 (+0%)
packages/x86-64-v3-poky-linux/ccache/ccache-src: PV changed from "4.13.2" to "4.13.3"
packages/x86-64-v3-poky-linux/ccache/ccache-src: FILELIST: directory renamed /usr/src/debug/ccache/4.13.2/src/ccache/util -> /usr/src/debug/ccache/4.13.3/src/ccache/util, directory renamed /usr/src/debug/ccache/4.13.2/src/third_party/tl-expected/tl -> /usr/src/debug/ccache/4.13.3/src/third_party/tl-expected/tl, directory renamed /usr/src/debug/ccache/4.13.2/src/ccache/storage/local -> /usr/src/debug/ccache/4.13.3/src/ccache/storage/local, directory renamed /usr/src/debug/ccache/4.13.2/src/ccache/storage -> /usr/src/debug/ccache/4.13.3/src/ccache/storage, directory renamed /usr/src/debug/ccache/4.13.2/src/third_party/cpp-httplib -> /usr/src/debug/ccache/4.13.3/src/third_party/cpp-httplib, directory renamed /usr/src/debug/ccache/4.13.2/src/third_party/blake3/blake3 -> /usr/src/debug/ccache/4.13.3/src/third_party/blake3/blake3, directory renamed /usr/src/debug/ccache/4.13.2/src/third_party/cxxurl/cxxurl -> /usr/src/debug/ccache/4.13.3/src/third_party/cxxurl/cxxurl, directory renamed /us
 r/src/debug/ccache/4.13.2/src/ccache/compiler -> /usr/src/debug/ccache/4.13.3/src/ccache/compiler, directory renamed /usr/src/debug/ccache/4.13.2/src/ccache/storage/remote -> /usr/src/debug/ccache/4.13.3/src/ccache/storage/remote, directory renamed /usr/src/debug/ccache/4.13.2/src/ccache/core -> /usr/src/debug/ccache/4.13.3/src/ccache/core, directory renamed /usr/src/debug/ccache/4.13.2/src/ccache -> /usr/src/debug/ccache/4.13.3/src/ccache
packages/x86-64-v3-poky-linux/ccache/ccache-src: PKGV changed from 4.13.2 [default] to 4.13.3 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-staticdev: PV changed from "4.13.2" to "4.13.3"
packages/x86-64-v3-poky-linux/ccache/ccache-staticdev: PKGV changed from 4.13.2 [default] to 4.13.3 [default]
packages/x86-64-v3-poky-linux/ccache/ccache: PKGSIZE changed from 1810016 to 1818208 (+0%)
packages/x86-64-v3-poky-linux/ccache/ccache: PV changed from "4.13.2" to "4.13.3"
packages/x86-64-v3-poky-linux/ccache/ccache: PKGV changed from 4.13.2 [default] to 4.13.3 [default]
packages/x86-64-v3-poky-linux/ccache: PV changed from "4.13.2" to "4.13.3"
packages/x86-64-v3-poky-linux/ccache: SRC_URI changed from "https://github.com/ccache/ccache/releases//download/v4.13.2/ccache-4.13.2.tar.gz" to "https://github.com/ccache/ccache/releases//download/v4.13.3/ccache-4.13.3.tar.gz"
packages/x86-64-v3-poky-linux/ccache: PKGV changed from 4.13.2 [default] to 4.13.3 [default]

--===============4213012455454320842==--

