Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 918B9C71157
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:14:51 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.8866.1749993283002641928
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=M7/KjDgC;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=l9TloD/S;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019773ba7b1b-87542f02-1a67-4fc5-ad87-d92030135267-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993290;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LgxvF3jQVosCefLOjN0Bcjecsmo0Y6J57AgnIARX5Z0=;
	b=M7/KjDgC484BTyK3DzF3/4nxC051FWnyNH9MYoMb3S0MzUtO3vHjjbxaTsdN82NN
	Uf05Ol/iAFXyewW0lKsQRqdNC65UcGd6ecXflrSJwWRT75QUgj7uD5kU6+J3bKQHZej
	GjFmvl0hnB7LzC4fWfJtLGOWxYWUymiOAWF8fO8g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993290;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LgxvF3jQVosCefLOjN0Bcjecsmo0Y6J57AgnIARX5Z0=;
	b=l9TloD/SlIRkByezAhr8kYT2tmPapnXswmZqeKn/LZkaHRbEJTGrA8GeaRCTsre7
	A5y0fdU98htc3Ac5MJgP9Njjc98dvJGxHC+DSckJuBki05ecGMqiyCO5nqdyAc0Jxp4
	h0hmWGJ4+t+gfif26601m3OksQIY61YYnYox1uv0=
Content-Type: multipart/mixed; boundary="===============6037842637271702592=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-scm: upgrading to 8.3.1 SUCCEEDED
Message-ID: <0101019773ba7b1b-87542f02-1a67-4fc5-ad87-d92030135267-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:14:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218691

--===============6037842637271702592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools-scm* to *8.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-scm-upgrade-8.2.1-8.3.1.patch
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
From 939fd7df13a92367de0674a64fba57f3b12c4a56 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 08:57:26 +0000
Subject: [PATCH] python3-setuptools-scm: upgrade 8.2.1 -> 8.3.1

---
 ...-setuptools-scm_8.2.1.bb => python3-setuptools-scm_8.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_8.2.1.bb => python3-setuptools-scm_8.3.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_8.2.1.bb b/meta/recipes-devtools/python/python3-setuptools-scm_8.3.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-setuptools-scm_8.2.1.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_8.3.1.bb
index e35ef7c25e..70eaf312d3 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_8.2.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_8.3.1.bb
@@ -6,7 +6,7 @@ argument or in a SCM managed file."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
 
-SRC_URI[sha256sum] = "51cfdd1deefc9b8c08d1a61e940a59c4dec39eb6c285d33fa2f1b4be26c7874d"
+SRC_URI[sha256sum] = "3d555e92b75dacd037d32bafdf94f97af51ea29ae8c7b234cf94b7a5bd242a63"
 
 PYPI_PACKAGE = "setuptools_scm"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.47.1


--===============6037842637271702592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-setuptools-scm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools_scm/setuptools_scm-8.2.1.tar.gz;downloadfilename=setuptools_scm-8.2.1.tar.gz" to "https://files.pythonhosted.org/packages/source/s/setuptools_scm/setuptools_scm-8.3.1.tar.gz;downloadfilename=setuptools_scm-8.3.1.tar.gz"
packages/core2-64-poky-linux/python3-setuptools-scm: PV changed from "8.2.1" to "8.3.1"
packages/core2-64-poky-linux/python3-setuptools-scm: PKGV changed from 8.2.1 [default] to 8.3.1 [default]
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dbg: PV changed from "8.2.1" to "8.3.1"
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dbg: PKGV changed from 8.2.1 [default] to 8.3.1 [default]
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dev: PV changed from "8.2.1" to "8.3.1"
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dev: PKGV changed from 8.2.1 [default] to 8.3.1 [default]
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-doc: PV changed from "8.2.1" to "8.3.1"
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-doc: PKGV changed from 8.2.1 [default] to 8.3.1 [default]
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-locale: PV changed from "8.2.1" to "8.3.1"
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-locale: PKGV changed from 8.2.1 [default] to 8.3.1 [default]
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-src: PV changed from "8.2.1" to "8.3.1"
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-src: PKGV changed from 8.2.1 [default] to 8.3.1 [default]
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-staticdev: PV changed from "8.2.1" to "8.3.1"
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm-staticdev: PKGV changed from 8.2.1 [default] to 8.3.1 [default]
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PV changed from "8.2.1" to "8.3.1"
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PKGV changed from 8.2.1 [default] to 8.3.1 [default]
packages/core2-64-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PKGSIZE changed from 246420 to 244562 (-1%)
Changes to packages/core2-64-poky-linux/python3-setuptools-scm (sysroot):
  /usr/lib/python3.13/site-packages/setuptools_scm-8.2.1.dist-info moved to /usr/lib/python3.13/site-packages/setuptools_scm-8.3.1.dist-info
Changes to packages/x86_64-linux/python3-setuptools-scm-native (sysroot):
  /usr/lib/python3.13/site-packages/setuptools_scm-8.2.1.dist-info moved to /usr/lib/python3.13/site-packages/setuptools_scm-8.3.1.dist-info

--===============6037842637271702592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-setuptools-scm (sysroot):
  /usr/lib/python3.13/site-packages/setuptools_scm-8.2.1.dist-info moved to /usr/lib/python3.13/site-packages/setuptools_scm-8.3.1.dist-info
Changes to packages/x86_64-linux/python3-setuptools-scm-native (sysroot):
  /usr/lib/python3.13/site-packages/setuptools_scm-8.2.1.dist-info moved to /usr/lib/python3.13/site-packages/setuptools_scm-8.3.1.dist-info

--===============6037842637271702592==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-scm-upgrade-8.2.1-8.3.1.patch"

RnJvbSA5MzlmZDdkZjEzYTkyMzY3ZGUwNjc0YTY0ZmJhNTdmM2IxMmM0YTU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMDg6NTc6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHMtc2NtOiB1cGdyYWRlIDguMi4xIC0+IDguMy4xCgotLS0KIC4uLi1z
ZXR1cHRvb2xzLXNjbV84LjIuMS5iYiA9PiBweXRob24zLXNldHVwdG9vbHMtc2NtXzguMy4xLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc2V0dXB0b29scy1z
Y21fOC4yLjEuYmIgPT4gcHl0aG9uMy1zZXR1cHRvb2xzLXNjbV84LjMuMS5iYn0gKDkwJSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29s
cy1zY21fOC4yLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0
dXB0b29scy1zY21fOC4zLjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMtc2NtXzguMi4xLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29s
cy1zY21fOC4zLjEuYmIKaW5kZXggZTM1ZWY3YzI1ZS4uNzBlYWYzMTJkMyAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMtc2NtXzguMi4x
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xz
LXNjbV84LjMuMS5iYgpAQCAtNiw3ICs2LDcgQEAgYXJndW1lbnQgb3IgaW4gYSBTQ00gbWFuYWdl
ZCBmaWxlLiIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElD
RU5TRTttZDU9ODM4YzM2NmY2OWI3MmM1ZGYwNWM5NmRmZjc5YjM1ZjIiCiAKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICI1MWNmZGQxZGVlZmM5YjhjMDhkMWE2MWU5NDBhNTljNGRlYzM5ZWI2YzI4NWQz
M2ZhMmYxYjRiZTI2Yzc4NzRkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNkNTU1ZTkyYjc1ZGFj
ZDAzN2QzMmJhZmRmOTRmOTdhZjUxZWEyOWFlOGM3YjIzNGNmOTRiN2E1YmQyNDJhNjMiCiAKIFBZ
UElfUEFDS0FHRSA9ICJzZXR1cHRvb2xzX3NjbSIKIFVQU1RSRUFNX0NIRUNLX1BZUElfUEFDS0FH
RSA9ICIke1BZUElfUEFDS0FHRX0iCi0tIAoyLjQ3LjEKCg==

--===============6037842637271702592==--

