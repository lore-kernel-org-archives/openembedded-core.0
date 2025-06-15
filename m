Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53FF6C7EE24
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:14:52 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.8868.1749993286952159787
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jmt2Vl6l;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=fYoIPXEQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019773ba6b01-d88c87b1-c444-4aad-9ebc-6a49d85bed46-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993286;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7wZxn04hzyR39ZYOzEJXaP+3jnh9a3BBjb6/3zu5oJk=;
	b=jmt2Vl6l0TL6crMoxwPcd7WqUxGqULHk2x7JPXKfhxPkTG+hRV6eZJCHkdxsQI9M
	Xizm/lwe2udQB4cOLibZgq3ZhqHo7QdjNzLKhpaZ7Sp/fBO+Sqr66kBCjwVF7nLXoPw
	w+zt5PSrw7QlC9xR1NFk0qJNOY5omk6zQzvpQBvk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993286;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7wZxn04hzyR39ZYOzEJXaP+3jnh9a3BBjb6/3zu5oJk=;
	b=fYoIPXEQ/ZlOMjinHyaGxkPRUkFA2OjwHb7z6mhXkflllxsGRJmfni5/KB0LVO3Z
	xeoblBdZsF4kSBvQjwGrFPyYVl5OkueNhQ/L4YMv49rxcoEp8uWwLotClH88iSYrJff
	8Ora6r48KpOtwVvqUEa9LFQAjueqApLQxstDdC6w=
Content-Type: multipart/mixed; boundary="===============1606122451639074588=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cython: upgrading to 3.1.2 SUCCEEDED
Message-ID: <0101019773ba6b01-d88c87b1-c444-4aad-9ebc-6a49d85bed46-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:14:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218680

--===============1606122451639074588==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cython* to *3.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cython-upgrade-3.1.1-3.1.2.patch
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
From 6926e7a1b1689037d4dd51c9c83b149a645c9f98 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 08:18:10 +0000
Subject: [PATCH] python3-cython: upgrade 3.1.1 -> 3.1.2

---
 .../python/{python3-cython_3.1.1.bb => python3-cython_3.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_3.1.1.bb => python3-cython_3.1.2.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-cython_3.1.1.bb b/meta/recipes-devtools/python/python3-cython_3.1.2.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-cython_3.1.1.bb
rename to meta/recipes-devtools/python/python3-cython_3.1.2.bb
index 1bc6eda4ac..77dbbe8b2c 100644
--- a/meta/recipes-devtools/python/python3-cython_3.1.1.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.1.2.bb
@@ -7,7 +7,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 
-SRC_URI[sha256sum] = "505ccd413669d5132a53834d792c707974248088c4f60c497deb1b416e366397"
+SRC_URI[sha256sum] = "6bbf7a953fa6762dfecdec015e3b054ba51c0121a45ad851fa130f63f5331381"
 
 inherit pypi setuptools3 cython
 
-- 
2.47.1


--===============1606122451639074588==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cython-upgrade-3.1.1-3.1.2.patch"

RnJvbSA2OTI2ZTdhMWIxNjg5MDM3ZDRkZDUxYzljODNiMTQ5YTY0NWM5Zjk4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMDg6MTg6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWN5dGhvbjogdXBncmFkZSAzLjEuMSAtPiAzLjEuMgoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLWN5dGhvbl8zLjEuMS5iYiA9PiBweXRob24zLWN5dGhvbl8zLjEuMi5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWN5dGhvbl8zLjEuMS5iYiA9PiBw
eXRob24zLWN5dGhvbl8zLjEuMi5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uXzMuMS4xLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbl8zLjEuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDkz
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9u
XzMuMS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
Y3l0aG9uXzMuMS4yLmJiCmluZGV4IDFiYzZlZGE0YWMuLjc3ZGJiZThiMmMgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jeXRob25fMy4xLjEuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbl8zLjEuMi5iYgpA
QCAtNyw3ICs3LDcgQEAgU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNFTlNFID0gIkFwYWNo
ZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9NjFjM2Vl
ODk2MTU3NTg2MWZhODZjN2U2MmJjOWY2OWMiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1MDVj
Y2Q0MTM2NjlkNTEzMmE1MzgzNGQ3OTJjNzA3OTc0MjQ4MDg4YzRmNjBjNDk3ZGViMWI0MTZlMzY2
Mzk3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjZiYmY3YTk1M2ZhNjc2MmRmZWNkZWMwMTVlM2Iw
NTRiYTUxYzAxMjFhNDVhZDg1MWZhMTMwZjYzZjUzMzEzODEiCiAKIGluaGVyaXQgcHlwaSBzZXR1
cHRvb2xzMyBjeXRob24KIAotLSAKMi40Ny4xCgo=

--===============1606122451639074588==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-cython: PV changed from "3.1.1" to "3.1.2"
packages/core2-64-poky-linux/python3-cython: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-64-poky-linux/python3-cython: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cython/cython-3.1.1.tar.gz;downloadfilename=cython-3.1.1.tar.gz" to "https://files.pythonhosted.org/packages/source/c/cython/cython-3.1.2.tar.gz;downloadfilename=cython-3.1.2.tar.gz"
packages/core2-64-poky-linux/python3-cython/python3-cython-dbg: PV changed from "3.1.1" to "3.1.2"
packages/core2-64-poky-linux/python3-cython/python3-cython-dbg: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-dbg: PKGSIZE changed from 26064008 to 26086280 (+0%)
packages/core2-64-poky-linux/python3-cython/python3-cython-dev: PV changed from "3.1.1" to "3.1.2"
packages/core2-64-poky-linux/python3-cython/python3-cython-dev: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-doc: PV changed from "3.1.1" to "3.1.2"
packages/core2-64-poky-linux/python3-cython/python3-cython-doc: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-locale: PV changed from "3.1.1" to "3.1.2"
packages/core2-64-poky-linux/python3-cython/python3-cython-locale: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-src: PV changed from "3.1.1" to "3.1.2"
packages/core2-64-poky-linux/python3-cython/python3-cython-src: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-src: PKGSIZE changed from 22976934 to 23069706 (+0%)
packages/core2-64-poky-linux/python3-cython/python3-cython-staticdev: PV changed from "3.1.1" to "3.1.2"
packages/core2-64-poky-linux/python3-cython/python3-cython-staticdev: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython: PV changed from "3.1.1" to "3.1.2"
packages/core2-64-poky-linux/python3-cython/python3-cython: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython: FILELIST: directory renamed /usr/lib/python3.13/site-packages/cython-3.1.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/cython-3.1.2.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/cython-3.1.1.dist-info -> /usr/lib/python3.13/site-packages/cython-3.1.2.dist-info, added "/usr/lib/python3.13/site-packages/Cython/Includes/numpy/math.pxd"
packages/core2-64-poky-linux/python3-cython/python3-cython: PKGSIZE changed from 14750913 to 14769465 (+0%)
Changes to packages/core2-64-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.13/site-packages/cython-3.1.1.dist-info moved to /usr/lib/python3.13/site-packages/cython-3.1.2.dist-info
  /usr/lib/python3.13/site-packages/Cython/Includes/numpy was added
  /usr/lib/python3.13/site-packages/Cython/Includes/numpy/math.pxd was added

--===============1606122451639074588==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-cython/python3-cython: FILELIST: directory renamed /usr/lib/python3.13/site-packages/cython-3.1.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/cython-3.1.2.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/cython-3.1.1.dist-info -> /usr/lib/python3.13/site-packages/cython-3.1.2.dist-info, added "/usr/lib/python3.13/site-packages/Cython/Includes/numpy/math.pxd"
Changes to packages/core2-64-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.13/site-packages/cython-3.1.1.dist-info moved to /usr/lib/python3.13/site-packages/cython-3.1.2.dist-info
  /usr/lib/python3.13/site-packages/Cython/Includes/numpy was added
  /usr/lib/python3.13/site-packages/Cython/Includes/numpy/math.pxd was added

--===============1606122451639074588==--

