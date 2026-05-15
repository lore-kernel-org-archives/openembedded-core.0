Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E75CD4F4D
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:33 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34829.1778851231040779576
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=N9vp4ZuR;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=oPe6vqxB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019e2bcbb2d9-981cfba5-9812-44a6-b339-4a15b625ee2f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851230;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JojQYMGdvcNPrarCYBFfRQD6mJvmIPJHEYREwzyREbI=;
	b=N9vp4ZuRaflELGhT2sk0porrbCNPKiHeo6EYlQIA4FZOz1Zq8X/7NYuf6tnsZT8s
	Up+RuEdajX7aLe+Ilhd5076Oyk70coIrDQZIHNi+GOevlPVYC4o3S47/cHFQxV+X5iM
	hEkx5ZEmOpfk3YFp22VTNKk7kHq3ovd24NCDuRWE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851230;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JojQYMGdvcNPrarCYBFfRQD6mJvmIPJHEYREwzyREbI=;
	b=oPe6vqxBfpG5QrgQHvXsub/9p5dwKicF7JawK91EBiYcrdJhhbLWWc+OS+uge++u
	qJ4SLxBqUjY+OsUR/LFOXFzP6osB+bhCX1BQKaW4DirwSzgPUU0oYf0E7wquiq7MCF+
	ml1aAeL4NxRnEOEF/KUw5SFtzt9s5vCfkuZD3oOI=
Content-Type: multipart/mixed; boundary="===============6313091440493879100=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.152.7 SUCCEEDED
Message-ID: <0101019e2bcbb2d9-981cfba5-9812-44a6-b339-4a15b625ee2f-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237112

--===============6313091440493879100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.152.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.152.4-6.152.7.patch
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
From 4e4b78a731f77d7eecf856ed874de1d404dbf841 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 07:39:45 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.152.4 -> 6.152.7

---
 ...hon3-hypothesis_6.152.4.bb => python3-hypothesis_6.152.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.152.4.bb => python3-hypothesis_6.152.7.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb b/meta/recipes-devtools/python/python3-hypothesis_6.152.7.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.152.7.bb
index f08e0bad79..2200f0c8e9 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.152.7.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "31c8f9ce619716f543e2710b489b1633c833586641d9e6c94cee03f109a5afc4"
+SRC_URI[sha256sum] = "741dedcede2ae0f32c32929a5992804b61f2b0400403b6a51a881a2b58482782"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============6313091440493879100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis: PKGV changed from 6.152.4 [default] to 6.152.7 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.152.4.tar.gz;downloadfilename=hypothesis-6.152.4.tar.gz file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.152.7.tar.gz;downloadfilename=hypothesis-6.152.7.tar.gz file://test_binary_search.py file://test_rle.py"
packages/x86-64-v3-poky-linux/python3-hypothesis: PV changed from "6.152.4" to "6.152.7"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.152.4 [default] to 6.152.7 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.152.4" to "6.152.7"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.152.4 [default] to 6.152.7 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.152.4" to "6.152.7"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.152.4 [default] to 6.152.7 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.152.4" to "6.152.7"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.152.4 [default] to 6.152.7 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.152.4" to "6.152.7"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.152.4 [default] to 6.152.7 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.152.4" to "6.152.7"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.152.4 [default] to 6.152.7 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.152.4" to "6.152.7"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.152.4 [default] to 6.152.7 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.152.4" to "6.152.7"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.152.4 [default] to 6.152.7 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 3855563 to 3872595 (+0%)
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.152.4" to "6.152.7"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.152.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.152.7.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.152.4.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.152.7.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.152.4.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.152.7.dist-info

--===============6313091440493879100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.152.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.152.7.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.152.4.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.152.7.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.152.4.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.152.7.dist-info

--===============6313091440493879100==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.152.4-6.152.7.patch"

RnJvbSA0ZTRiNzhhNzMxZjc3ZDdlZWNmODU2ZWQ4NzRkZTFkNDA0ZGJmODQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMDc6Mzk6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xNTIuNCAtPiA2LjE1Mi43CgotLS0KIC4uLmhv
bjMtaHlwb3RoZXNpc182LjE1Mi40LmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE1Mi43LmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNpc182
LjE1Mi40LmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE1Mi43LmJifSAoOTElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYu
MTUyLjQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNp
c182LjE1Mi43LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTUyLjQuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTUyLjcu
YmIKaW5kZXggZjA4ZTBiYWQ3OS4uMjIwMGYwYzhlOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNTIuNC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjE1Mi43LmJiCkBA
IC0xMyw3ICsxMyw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgZmlsZTovL3Rlc3RfcmxlLnB5IFwK
ICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzMWM4ZjljZTYxOTcxNmY1NDNlMjcxMGI0
ODliMTYzM2M4MzM1ODY2NDFkOWU2Yzk0Y2VlMDNmMTA5YTVhZmM0IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjc0MWRlZGNlZGUyYWUwZjMyYzMyOTI5YTU5OTI4MDRiNjFmMmIwNDAwNDAzYjZhNTFh
ODgxYTJiNTg0ODI3ODIiCiAKIFJERVBFTkRTOiR7UE59ICs9ICIgXAogICAgIHB5dGhvbjMtYXR0
cnMgXAotLSAKMi40Ny4xCgo=

--===============6313091440493879100==--

