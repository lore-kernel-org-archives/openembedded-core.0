Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CFB9CED619
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:05 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11951.1763224737567327213
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=NIxnq+0Y;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Gf2d2krg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019a88625368-dbf0bd88-6c9e-4de8-b327-ea5ddca14109-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224737;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Fj5ycxkeJJmsfdqvYsj//BRLh2UC6WDOIujHoZXOFbQ=;
	b=NIxnq+0Yp9bgwfkmvxDF3rYviARFyUlMg5m583zbpbUbr2LxGwTewBTy8KTNywzw
	7Kg3fdwSeijiO/MkpLg2vQrBQKOPQMCAXsMmqEffcYY+OXVXh1Tyz3VKrRC3zm1BbY+
	JwBfgLsWcrpliPSjPQ2TUp6DT7N/9kUGeVO+/0Zg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224737;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Fj5ycxkeJJmsfdqvYsj//BRLh2UC6WDOIujHoZXOFbQ=;
	b=Gf2d2krgG5JhqocCvZEPIFR0NOMz2EzXwWEeBcTSSn1+YP76oudD2OArgxRuhfcp
	MWztflNk3HE/XpwLPi/l/YTqJXQyLq0QJ1vRw4Mti374b/IcKovP2gCRkf5M+Cz/gBK
	8lV/wsnRn/YK4ztnopBviiTM6aXNl0P7DPp/HhEU=
Content-Type: multipart/mixed; boundary="===============1431890872134172633=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-webcolors: upgrading to 25.10.0 SUCCEEDED
Message-ID: <0101019a88625368-dbf0bd88-6c9e-4de8-b327-ea5ddca14109-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226384

--===============1431890872134172633==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-webcolors* to *25.10.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-webcolors-upgrade-24.11.1-25.10.0.patch
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
From ca334c49f542bdc20a8fec49280b9013dcb52ba7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 11:34:59 +0000
Subject: [PATCH] python3-webcolors: upgrade 24.11.1 -> 25.10.0

---
 ...ython3-webcolors_24.11.1.bb => python3-webcolors_25.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-webcolors_24.11.1.bb => python3-webcolors_25.10.0.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb b/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
rename to meta/recipes-devtools/python/python3-webcolors_25.10.0.bb
index d537614545..8e4f264d04 100644
--- a/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
+++ b/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/webcolors/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cbaebec43b7d199c7fd8f5411b3b0448"
 
-SRC_URI[sha256sum] = "ecb3d768f32202af770477b8b65f318fa4f566c22948673a977b00d589dd80f6"
+SRC_URI[sha256sum] = "62abae86504f66d0f6364c2a8520de4a0c47b80c03fc3a5f1815fedbef7c19bf"
 
 inherit pypi python_pdm ptest-python-pytest
 
-- 
2.47.1


--===============1431890872134172633==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-webcolors: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/webcolors/webcolors-24.11.1.tar.gz;downloadfilename=webcolors-24.11.1.tar.gz" to "https://files.pythonhosted.org/packages/source/w/webcolors/webcolors-25.10.0.tar.gz;downloadfilename=webcolors-25.10.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-webcolors: PV changed from "24.11.1" to "25.10.0"
packages/x86-64-v3-poky-linux/python3-webcolors: PKGV changed from 24.11.1 [default] to 25.10.0 [default]
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-dbg: PV changed from "24.11.1" to "25.10.0"
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-dbg: PKGV changed from 24.11.1 [default] to 25.10.0 [default]
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-dev: PV changed from "24.11.1" to "25.10.0"
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-dev: PKGV changed from 24.11.1 [default] to 25.10.0 [default]
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-doc: PV changed from "24.11.1" to "25.10.0"
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-doc: PKGV changed from 24.11.1 [default] to 25.10.0 [default]
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-locale: PV changed from "24.11.1" to "25.10.0"
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-locale: PKGV changed from 24.11.1 [default] to 25.10.0 [default]
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-ptest: PKGSIZE changed from 35834 to 37693 (+5%)
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-ptest: PV changed from "24.11.1" to "25.10.0"
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-ptest: PKGV changed from 24.11.1 [default] to 25.10.0 [default]
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-src: PV changed from "24.11.1" to "25.10.0"
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-src: PKGV changed from 24.11.1 [default] to 25.10.0 [default]
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-staticdev: PV changed from "24.11.1" to "25.10.0"
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-staticdev: PKGV changed from 24.11.1 [default] to 25.10.0 [default]
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors: PKGSIZE changed from 85537 to 85262 (-0%)
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors: PV changed from "24.11.1" to "25.10.0"
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors: PKGV changed from 24.11.1 [default] to 25.10.0 [default]
Changes to packages/x86-64-v3-poky-linux/python3-webcolors (sysroot):
  /usr/lib/python3.13/site-packages/webcolors-24.11.1.dist-info moved to /usr/lib/python3.13/site-packages/webcolors-25.10.0.dist-info

--===============1431890872134172633==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-webcolors-upgrade-24.11.1-25.10.0.patch"

RnJvbSBjYTMzNGM0OWY1NDJiZGMyMGE4ZmVjNDkyODBiOTAxM2RjYjUyYmE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTE6MzQ6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXdlYmNvbG9yczogdXBncmFkZSAyNC4xMS4xIC0+IDI1LjEwLjAKCi0tLQogLi4ueXRo
b24zLXdlYmNvbG9yc18yNC4xMS4xLmJiID0+IHB5dGhvbjMtd2ViY29sb3JzXzI1LjEwLjAuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy13ZWJjb2xvcnNfMjQu
MTEuMS5iYiA9PiBweXRob24zLXdlYmNvbG9yc18yNS4xMC4wLmJifSAoODAlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13ZWJjb2xvcnNfMjQuMTEu
MS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13ZWJjb2xvcnNfMjUu
MTAuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDgwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2ViY29sb3JzXzI0LjExLjEuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13ZWJjb2xvcnNfMjUuMTAuMC5iYgppbmRl
eCBkNTM3NjE0NTQ1Li44ZTRmMjY0ZDA0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtd2ViY29sb3JzXzI0LjExLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdlYmNvbG9yc18yNS4xMC4wLmJiCkBAIC0zLDcgKzMs
NyBAQCBIT01FUEFHRSA9ICJodHRwczovL3B5cGkub3JnL3Byb2plY3Qvd2ViY29sb3JzLyIKIExJ
Q0VOU0UgPSAiQlNELTMtQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5T
RTttZDU9Y2JhZWJlYzQzYjdkMTk5YzdmZDhmNTQxMWIzYjA0NDgiCiAKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICJlY2IzZDc2OGYzMjIwMmFmNzcwNDc3YjhiNjVmMzE4ZmE0ZjU2NmMyMjk0ODY3M2E5
NzdiMDBkNTg5ZGQ4MGY2IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjYyYWJhZTg2NTA0ZjY2ZDBm
NjM2NGMyYTg1MjBkZTRhMGM0N2I4MGMwM2ZjM2E1ZjE4MTVmZWRiZWY3YzE5YmYiCiAKIGluaGVy
aXQgcHlwaSBweXRob25fcGRtIHB0ZXN0LXB5dGhvbi1weXRlc3QKIAotLSAKMi40Ny4xCgo=

--===============1431890872134172633==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-webcolors (sysroot):
  /usr/lib/python3.13/site-packages/webcolors-24.11.1.dist-info moved to /usr/lib/python3.13/site-packages/webcolors-25.10.0.dist-info

--===============1431890872134172633==--

