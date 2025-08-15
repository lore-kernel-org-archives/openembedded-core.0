Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD726CA0EFF
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:11 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.11416.1755263225187610882
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bffl9HBi;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Drvq0fiy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010198add74b22-322d1dac-65d8-403e-9ef4-6d034084bf20-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263224;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DSD0PygWjj7kSdEazt2ZOMu+xAgJdsie293o5b0d0Vg=;
	b=bffl9HBi+ezwMWVop5Dk780NvxPOYIMbZE6Sn0eNTV+7dmzxVPJpQwiyjTt7DfVz
	8GrNtWc3Cw4fRFT0W2Jr2lNNh0ujpBQU7TdoGi6p6F7wOWRR5rW5s0pCZFs7HvZs6xQ
	zuheYAB3SUhHhiRlZxjnnEEEDOCHjH1JKzbeAUjQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263224;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DSD0PygWjj7kSdEazt2ZOMu+xAgJdsie293o5b0d0Vg=;
	b=Drvq0fiy9uTZ0BFxlFsRL+tCcKh+dXjKHlx5Lw3cOXvIKbEFfblPwjBZxMd53qel
	mG/WZxsLX9NHUYyLOhaFG2Q2Ki3OOIC+KNvoQIuOwcyfPcrvdreaKCdvOAMAMXZGBe9
	PYpFdPJiwBBSZncPLiP37lVkfzohut/vR6YXrPNw=
Content-Type: multipart/mixed; boundary="===============7891017842787835268=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cython: upgrading to 3.1.3 SUCCEEDED
Message-ID: <01010198add74b22-322d1dac-65d8-403e-9ef4-6d034084bf20-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221907

--===============7891017842787835268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cython* to *3.1.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cython-upgrade-3.1.2-3.1.3.patch
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
From 16e85df123340958255f44a32ecd2cfa99a1716d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 08:59:58 +0000
Subject: [PATCH] python3-cython: upgrade 3.1.2 -> 3.1.3

---
 .../python/{python3-cython_3.1.2.bb => python3-cython_3.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_3.1.2.bb => python3-cython_3.1.3.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-cython_3.1.2.bb b/meta/recipes-devtools/python/python3-cython_3.1.3.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-cython_3.1.2.bb
rename to meta/recipes-devtools/python/python3-cython_3.1.3.bb
index 77dbbe8b2c..dcb61a3634 100644
--- a/meta/recipes-devtools/python/python3-cython_3.1.2.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.1.3.bb
@@ -7,7 +7,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 
-SRC_URI[sha256sum] = "6bbf7a953fa6762dfecdec015e3b054ba51c0121a45ad851fa130f63f5331381"
+SRC_URI[sha256sum] = "10ee785e42328924b78f75a74f66a813cb956b4a9bc91c44816d089d5934c089"
 
 inherit pypi setuptools3 cython
 
-- 
2.47.1


--===============7891017842787835268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-cython/python3-cython: FILELIST: directory renamed /usr/lib/python3.13/site-packages/cython-3.1.2.dist-info -> /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info, directory renamed /usr/lib/python3.13/site-packages/cython-3.1.2.dist-info/licenses -> /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info/licenses, removed "/usr/lib/python3.13/site-packages/Cython/Utility/Lock.c", added "/usr/lib/python3.13/site-packages/Cython/Utility/Synchronization.c"
Changes to packages/core2-64-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.13/site-packages/cython-3.1.2.dist-info moved to /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info
  /usr/lib/python3.13/site-packages/Cython/Utility/Synchronization.c was added
  /usr/lib/python3.13/site-packages/Cython/Utility/Lock.c was removed

--===============7891017842787835268==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cython-upgrade-3.1.2-3.1.3.patch"

RnJvbSAxNmU4NWRmMTIzMzQwOTU4MjU1ZjQ0YTMyZWNkMmNmYTk5YTE3MTZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMDg6NTk6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWN5dGhvbjogdXBncmFkZSAzLjEuMiAtPiAzLjEuMwoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLWN5dGhvbl8zLjEuMi5iYiA9PiBweXRob24zLWN5dGhvbl8zLjEuMy5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWN5dGhvbl8zLjEuMi5iYiA9PiBw
eXRob24zLWN5dGhvbl8zLjEuMy5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uXzMuMS4yLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbl8zLjEuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDkz
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9u
XzMuMS4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
Y3l0aG9uXzMuMS4zLmJiCmluZGV4IDc3ZGJiZThiMmMuLmRjYjYxYTM2MzQgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jeXRob25fMy4xLjIuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbl8zLjEuMy5iYgpA
QCAtNyw3ICs3LDcgQEAgU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNFTlNFID0gIkFwYWNo
ZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9NjFjM2Vl
ODk2MTU3NTg2MWZhODZjN2U2MmJjOWY2OWMiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI2YmJm
N2E5NTNmYTY3NjJkZmVjZGVjMDE1ZTNiMDU0YmE1MWMwMTIxYTQ1YWQ4NTFmYTEzMGY2M2Y1MzMx
MzgxIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjEwZWU3ODVlNDIzMjg5MjRiNzhmNzVhNzRmNjZh
ODEzY2I5NTZiNGE5YmM5MWM0NDgxNmQwODlkNTkzNGMwODkiCiAKIGluaGVyaXQgcHlwaSBzZXR1
cHRvb2xzMyBjeXRob24KIAotLSAKMi40Ny4xCgo=

--===============7891017842787835268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-cython: PV changed from "3.1.2" to "3.1.3"
packages/core2-64-poky-linux/python3-cython: PKGV changed from 3.1.2 [default] to 3.1.3 [default]
packages/core2-64-poky-linux/python3-cython: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cython/cython-3.1.2.tar.gz;downloadfilename=cython-3.1.2.tar.gz" to "https://files.pythonhosted.org/packages/source/c/cython/cython-3.1.3.tar.gz;downloadfilename=cython-3.1.3.tar.gz"
packages/core2-64-poky-linux/python3-cython/python3-cython-dbg: PV changed from "3.1.2" to "3.1.3"
packages/core2-64-poky-linux/python3-cython/python3-cython-dbg: PKGV changed from 3.1.2 [default] to 3.1.3 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-dbg: PKGSIZE changed from 26109400 to 26055376 (-0%)
packages/core2-64-poky-linux/python3-cython/python3-cython-dev: PV changed from "3.1.2" to "3.1.3"
packages/core2-64-poky-linux/python3-cython/python3-cython-dev: PKGV changed from 3.1.2 [default] to 3.1.3 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-doc: PV changed from "3.1.2" to "3.1.3"
packages/core2-64-poky-linux/python3-cython/python3-cython-doc: PKGV changed from 3.1.2 [default] to 3.1.3 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-locale: PV changed from "3.1.2" to "3.1.3"
packages/core2-64-poky-linux/python3-cython/python3-cython-locale: PKGV changed from 3.1.2 [default] to 3.1.3 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-src: PV changed from "3.1.2" to "3.1.3"
packages/core2-64-poky-linux/python3-cython/python3-cython-src: PKGV changed from 3.1.2 [default] to 3.1.3 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-src: PKGSIZE changed from 23069706 to 23081148 (+0%)
packages/core2-64-poky-linux/python3-cython/python3-cython-staticdev: PV changed from "3.1.2" to "3.1.3"
packages/core2-64-poky-linux/python3-cython/python3-cython-staticdev: PKGV changed from 3.1.2 [default] to 3.1.3 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython: PV changed from "3.1.2" to "3.1.3"
packages/core2-64-poky-linux/python3-cython/python3-cython: FILELIST: directory renamed /usr/lib/python3.13/site-packages/cython-3.1.2.dist-info/licenses -> /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/cython-3.1.2.dist-info -> /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info, removed "/usr/lib/python3.13/site-packages/Cython/Utility/Lock.c", added "/usr/lib/python3.13/site-packages/Cython/Utility/Synchronization.c"
packages/core2-64-poky-linux/python3-cython/python3-cython: PKGV changed from 3.1.2 [default] to 3.1.3 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython: PKGSIZE changed from 14786749 to 14790735 (+0%)
Changes to packages/core2-64-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.13/site-packages/cython-3.1.2.dist-info moved to /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info
  /usr/lib/python3.13/site-packages/Cython/Utility/Synchronization.c was added
  /usr/lib/python3.13/site-packages/Cython/Utility/Lock.c was removed

--===============7891017842787835268==--

