Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5062CC35FF9
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:07 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.115636.1726410840556902467
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=GOyO4HGG;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=kJ0jBUwn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010191f61ad789-b2ee3ee2-7087-4fb3-a8e8-fc63fc365126-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410840;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oZUfXZkOVvOr9Ev+PdraUpWaUCkW4NfBxAgj22iaD8o=;
	b=GOyO4HGGTMjQog3iYElBfB47ptOFcuFSsseFiP17JCeytdbyyvwEbA8uueiTvC7V
	9S9Oy5tfATdeI/042GNtHJv6x6Wm5y/do7jElMKEjpJYUxhiE4RSLxxe+R8QRfGfrgf
	NQeHNiXZSvGFkisJ5Mhzz8zNLCOAQzszKpsaTGYA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410840;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oZUfXZkOVvOr9Ev+PdraUpWaUCkW4NfBxAgj22iaD8o=;
	b=kJ0jBUwn8R0cdW/OQwkEQ7mfpOkch5MOF36NQZdWypUY9GaXcu6SoHVNwPjGGKuR
	KxP+jgSkNJWBJCNpzJKVx0HChB7WqdJe6EWFPvPyCWW1m130KySMYl8aai+u9hIeLMr
	Mdd0Pt1aBYuVWsgwcTAKLiQRrIJN7hKs/A0q8Y6o=
Content-Type: multipart/mixed; boundary="===============7490319557216876902=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cffi: upgrading to 1.17.1 SUCCEEDED
Message-ID: <01010191f61ad789-b2ee3ee2-7087-4fb3-a8e8-fc63fc365126-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:33:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204521

--===============7490319557216876902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cffi* to *1.17.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cffi-upgrade-1.17.0-1.17.1.patch
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
From 2dfb52fea81b1f10414bd52021b68047d972c89c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Sep 2024 08:23:17 +0000
Subject: [PATCH] python3-cffi: upgrade 1.17.0 -> 1.17.1

---
 .../python/{python3-cffi_1.17.0.bb => python3-cffi_1.17.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cffi_1.17.0.bb => python3-cffi_1.17.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-cffi_1.17.0.bb b/meta/recipes-devtools/python/python3-cffi_1.17.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-cffi_1.17.0.bb
rename to meta/recipes-devtools/python/python3-cffi_1.17.1.bb
index 28200f9b43..99979a73e8 100644
--- a/meta/recipes-devtools/python/python3-cffi_1.17.0.bb
+++ b/meta/recipes-devtools/python/python3-cffi_1.17.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS += "libffi python3-pycparser"
 
-SRC_URI[sha256sum] = "f3157624b7558b914cb039fd1af735e5e8049a87c817cc215109ad1c8779df76"
+SRC_URI[sha256sum] = "1c39c6016c32bc48dd54561950ebd6836e1670f2ae46128f67cf49e789c52824"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.44.0


--===============7490319557216876902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-cffi (sysroot):
  /usr/lib/python3.12/site-packages/cffi-1.17.0.dist-info moved to /usr/lib/python3.12/site-packages/cffi-1.17.1.dist-info

--===============7490319557216876902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-cffi: PKGV changed from 1.17.0 [default] to 1.17.1 [default]
packages/core2-64-poky-linux/python3-cffi: PV changed from "1.17.0" to "1.17.1"
packages/core2-64-poky-linux/python3-cffi: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cffi/cffi-1.17.0.tar.gz;downloadfilename=cffi-1.17.0.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/c/cffi/cffi-1.17.1.tar.gz;downloadfilename=cffi-1.17.1.tar.gz file://run-ptest"
packages/core2-64-poky-linux/python3-cffi/python3-cffi-dbg: PKGV changed from 1.17.0 [default] to 1.17.1 [default]
packages/core2-64-poky-linux/python3-cffi/python3-cffi-dbg: PV changed from "1.17.0" to "1.17.1"
packages/core2-64-poky-linux/python3-cffi/python3-cffi-dev: PKGV changed from 1.17.0 [default] to 1.17.1 [default]
packages/core2-64-poky-linux/python3-cffi/python3-cffi-dev: PV changed from "1.17.0" to "1.17.1"
packages/core2-64-poky-linux/python3-cffi/python3-cffi-doc: PKGV changed from 1.17.0 [default] to 1.17.1 [default]
packages/core2-64-poky-linux/python3-cffi/python3-cffi-doc: PV changed from "1.17.0" to "1.17.1"
packages/core2-64-poky-linux/python3-cffi/python3-cffi-locale: PKGV changed from 1.17.0 [default] to 1.17.1 [default]
packages/core2-64-poky-linux/python3-cffi/python3-cffi-locale: PV changed from "1.17.0" to "1.17.1"
packages/core2-64-poky-linux/python3-cffi/python3-cffi-ptest: PKGV changed from 1.17.0 [default] to 1.17.1 [default]
packages/core2-64-poky-linux/python3-cffi/python3-cffi-ptest: PV changed from "1.17.0" to "1.17.1"
packages/core2-64-poky-linux/python3-cffi/python3-cffi-ptest: PKGSIZE changed from 676787 to 677014 (+0%)
packages/core2-64-poky-linux/python3-cffi/python3-cffi-src: PKGV changed from 1.17.0 [default] to 1.17.1 [default]
packages/core2-64-poky-linux/python3-cffi/python3-cffi-src: PV changed from "1.17.0" to "1.17.1"
packages/core2-64-poky-linux/python3-cffi/python3-cffi-staticdev: PKGV changed from 1.17.0 [default] to 1.17.1 [default]
packages/core2-64-poky-linux/python3-cffi/python3-cffi-staticdev: PV changed from "1.17.0" to "1.17.1"
packages/core2-64-poky-linux/python3-cffi/python3-cffi: PKGV changed from 1.17.0 [default] to 1.17.1 [default]
packages/core2-64-poky-linux/python3-cffi/python3-cffi: PV changed from "1.17.0" to "1.17.1"
packages/core2-64-poky-linux/python3-cffi/python3-cffi: PKGSIZE changed from 984580 to 986254 (+0%)
Changes to packages/core2-64-poky-linux/python3-cffi (sysroot):
  /usr/lib/python3.12/site-packages/cffi-1.17.0.dist-info moved to /usr/lib/python3.12/site-packages/cffi-1.17.1.dist-info

--===============7490319557216876902==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cffi-upgrade-1.17.0-1.17.1.patch"

RnJvbSAyZGZiNTJmZWE4MWIxZjEwNDE0YmQ1MjAyMWI2ODA0N2Q5NzJjODljIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgU2VwIDIwMjQgMDg6MjM6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNmZmk6IHVwZ3JhZGUgMS4xNy4wIC0+IDEuMTcuMQoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLWNmZmlfMS4xNy4wLmJiID0+IHB5dGhvbjMtY2ZmaV8xLjE3LjEuYmJ9ICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWNmZmlfMS4xNy4wLmJiID0+IHB5
dGhvbjMtY2ZmaV8xLjE3LjEuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWNmZmlfMS4xNy4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWNmZmlfMS4xNy4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jZmZpXzEuMTcu
MC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNmZmlf
MS4xNy4xLmJiCmluZGV4IDI4MjAwZjliNDMuLjk5OTc5YTczZTggMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jZmZpXzEuMTcuMC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2ZmaV8xLjE3LjEuYmIKQEAgLTQsNyAr
NCw3IEBAIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5T
RTttZDU9NTY3N2UyZmRiZjdjZGRhNjFkNmRkMmI1N2RmNTQ3YmYiCiBERVBFTkRTICs9ICJsaWJm
ZmkgcHl0aG9uMy1weWNwYXJzZXIiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmMzE1NzYyNGI3
NTU4YjkxNGNiMDM5ZmQxYWY3MzVlNWU4MDQ5YTg3YzgxN2NjMjE1MTA5YWQxYzg3NzlkZjc2Igor
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjFjMzljNjAxNmMzMmJjNDhkZDU0NTYxOTUwZWJkNjgzNmUx
NjcwZjJhZTQ2MTI4ZjY3Y2Y0OWU3ODljNTI4MjQiCiAKIFNSQ19VUkkgKz0gImZpbGU6Ly9ydW4t
cHRlc3QiCiAKLS0gCjIuNDQuMAoK

--===============7490319557216876902==--

