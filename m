Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE1DBC3601C
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:20 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.10336.1742048299778298302
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=OX84yoSS;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ai8iRO9g;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101959a2b8852-0f6c2abc-a32b-42b5-9d07-2d561b994d31-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048299;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6gUNmaHBZ7eRkjyiTtX4TbBiVe0WIQ2HGtScaDe20pE=;
	b=OX84yoSSsxBeRKVNArc5u3ZLzLKA0nVjkGRA+DEb8qiceA90ghUUEGCx/JNS8Oip
	y2neRFDr4nLVSGnWrX4dCFMMdpJDssTSWb+0LruyNHg4zLK1UdhCVKsjf+rIj7ZfsHs
	ztlXeiDixW/GAU45zf99G3D+dfCDAUq9KiDFlV8s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048299;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6gUNmaHBZ7eRkjyiTtX4TbBiVe0WIQ2HGtScaDe20pE=;
	b=ai8iRO9gz7ZF+lqhixblGs+SqBjj62KEbj8zY5zU0NG1kxVerKbiNhfKamsVm+cf
	6uK0Euz8GdWXt08q2XVWW9huOCwPGpO5tt6kZ/Jl3myHucT6Yheudx2VgOXXAruHbqL
	133aThtU93RQYcYeJQXD0C3G+SUmEl14kS0xL3Es=
Content-Type: multipart/mixed; boundary="===============5007137334800463365=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jinja2: upgrading to 3.1.6 SUCCEEDED
Message-ID: <010101959a2b8852-0f6c2abc-a32b-42b5-9d07-2d561b994d31-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212911

--===============5007137334800463365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-jinja2* to *3.1.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jinja2-upgrade-3.1.5-3.1.6.patch
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
From 3a68b1d1a6e33f0931b73cc8e997ca061c5a7cde Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 09:17:26 +0000
Subject: [PATCH] python3-jinja2: upgrade 3.1.5 -> 3.1.6

---
 .../python/{python3-jinja2_3.1.5.bb => python3-jinja2_3.1.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jinja2_3.1.5.bb => python3-jinja2_3.1.6.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.5.bb b/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-jinja2_3.1.5.bb
rename to meta/recipes-devtools/python/python3-jinja2_3.1.6.bb
index b9ef57f599..2e96eb0dcb 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.1.5.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/Jinja2/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "8fefff8dc3034e27bb80d67c671eb8a9bc424c0ef4c0826edbff304cceff43bb"
+SRC_URI[sha256sum] = "0137fb05990d35f1275a587e9aee6d56da821fc83491a0fb838183be43f66d6d"
 
 PYPI_PACKAGE = "jinja2"
 
-- 
2.44.1


--===============5007137334800463365==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jinja2-upgrade-3.1.5-3.1.6.patch"

RnJvbSAzYTY4YjFkMWE2ZTMzZjA5MzFiNzNjYzhlOTk3Y2EwNjFjNWE3Y2RlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMDk6MTc6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWppbmphMjogdXBncmFkZSAzLjEuNSAtPiAzLjEuNgoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLWppbmphMl8zLjEuNS5iYiA9PiBweXRob24zLWppbmphMl8zLjEuNi5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWppbmphMl8zLjEuNS5iYiA9PiBw
eXRob24zLWppbmphMl8zLjEuNi5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtamluamEyXzMuMS41LmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWppbmphMl8zLjEuNi5iYgpzaW1pbGFyaXR5IGluZGV4IDkx
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtamluamEy
XzMuMS41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
amluamEyXzMuMS42LmJiCmluZGV4IGI5ZWY1N2Y1OTkuLjJlOTZlYjBkY2IgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1qaW5qYTJfMy4xLjUuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWppbmphMl8zLjEuNi5iYgpA
QCAtNCw3ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9weXBpLm9yZy9wcm9qZWN0L0ppbmph
Mi8iCiBMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0xJQ0VOU0UudHh0O21kNT01ZGM4ODMwMDc4NmYxYzIxNGMxZTk4MjdhNTIyOTQ2MiIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjhmZWZmZjhkYzMwMzRlMjdiYjgwZDY3YzY3MWViOGE5YmM0MjRj
MGVmNGMwODI2ZWRiZmYzMDRjY2VmZjQzYmIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDEzN2Zi
MDU5OTBkMzVmMTI3NWE1ODdlOWFlZTZkNTZkYTgyMWZjODM0OTFhMGZiODM4MTgzYmU0M2Y2NmQ2
ZCIKIAogUFlQSV9QQUNLQUdFID0gImppbmphMiIKIAotLSAKMi40NC4xCgo=

--===============5007137334800463365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-jinja2: PV changed from "3.1.5" to "3.1.6"
packages/core2-64-poky-linux/python3-jinja2: PKGV changed from 3.1.5 [default] to 3.1.6 [default]
packages/core2-64-poky-linux/python3-jinja2: SRC_URI changed from "https://files.pythonhosted.org/packages/source/j/jinja2/jinja2-3.1.5.tar.gz;downloadfilename=jinja2-3.1.5.tar.gz" to "https://files.pythonhosted.org/packages/source/j/jinja2/jinja2-3.1.6.tar.gz;downloadfilename=jinja2-3.1.6.tar.gz"
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2-dbg: PV changed from "3.1.5" to "3.1.6"
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2-dbg: PKGV changed from 3.1.5 [default] to 3.1.6 [default]
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2-dev: PV changed from "3.1.5" to "3.1.6"
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2-dev: PKGV changed from 3.1.5 [default] to 3.1.6 [default]
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2-doc: PV changed from "3.1.5" to "3.1.6"
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2-doc: PKGV changed from 3.1.5 [default] to 3.1.6 [default]
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2-locale: PV changed from "3.1.5" to "3.1.6"
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2-locale: PKGV changed from 3.1.5 [default] to 3.1.6 [default]
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2-ptest: PV changed from "3.1.5" to "3.1.6"
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2-ptest: PKGSIZE changed from 242179 to 242472 (+0%)
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2-ptest: PKGV changed from 3.1.5 [default] to 3.1.6 [default]
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2-src: PV changed from "3.1.5" to "3.1.6"
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2-src: PKGV changed from 3.1.5 [default] to 3.1.6 [default]
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2-staticdev: PV changed from "3.1.5" to "3.1.6"
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2-staticdev: PKGV changed from 3.1.5 [default] to 3.1.6 [default]
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2: PV changed from "3.1.5" to "3.1.6"
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2: PKGSIZE changed from 1171498 to 1171692 (+0%)
packages/core2-64-poky-linux/python3-jinja2/python3-jinja2: PKGV changed from 3.1.5 [default] to 3.1.6 [default]
Changes to packages/core2-64-poky-linux/python3-jinja2 (sysroot):
  /usr/lib/python3.13/site-packages/jinja2-3.1.5.dist-info moved to /usr/lib/python3.13/site-packages/jinja2-3.1.6.dist-info
Changes to packages/x86_64-linux/python3-jinja2-native (sysroot):
  /usr/lib/python3.13/site-packages/jinja2-3.1.5.dist-info moved to /usr/lib/python3.13/site-packages/jinja2-3.1.6.dist-info

--===============5007137334800463365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-jinja2 (sysroot):
  /usr/lib/python3.13/site-packages/jinja2-3.1.5.dist-info moved to /usr/lib/python3.13/site-packages/jinja2-3.1.6.dist-info
Changes to packages/x86_64-linux/python3-jinja2-native (sysroot):
  /usr/lib/python3.13/site-packages/jinja2-3.1.5.dist-info moved to /usr/lib/python3.13/site-packages/jinja2-3.1.6.dist-info

--===============5007137334800463365==--

