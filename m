Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D29EC27C54
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:10 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.13597.1713248039189377481
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FM0NEs9T;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=t89hEqvD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018ee58a6e97-9cb53024-b2f2-48ca-94dd-d634bd2eac3d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7zcsFJHwfa20UQNV3SxDOh2KcyhFlxsvhqDWIwsgtnQ=;
	b=FM0NEs9TeE3XdYneEdqr7uWqq5w/gtjszwYr08SmlYau/3K/bHkZW05QGiCmK3cl
	unVVmcp5MBBLXA9DJ+xtoK2sv24oNkGEm3QdaRW3p3UC03pRDMiLshP2wX8gA+Qtc9A
	aF7gEfH2dpfgsyyZFs6Jdm0j/mWSC4lQXH5UFGPM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7zcsFJHwfa20UQNV3SxDOh2KcyhFlxsvhqDWIwsgtnQ=;
	b=t89hEqvDha3JC4TPevxxMd+cMOM4vS+H+Z74EGHfKmqPMZl3kSKG+4jY8930m/pw
	Im/Dyi8qvBXiQZ+xqfJgxtDGni3aVjITLmL8WeliXcedBGmwi4swcZmcbn42Y8u7sRY
	afMNKMGCZfBfl33b97ZwuKZIEiG+NnfkPB2V/ZIg=
Content-Type: multipart/mixed; boundary="===============6320002610999165590=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-mako: upgrading to 1.3.3 SUCCEEDED
Message-ID: <0101018ee58a6e97-9cb53024-b2f2-48ca-94dd-d634bd2eac3d-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198294

--===============6320002610999165590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-mako* to *1.3.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-mako-upgrade-1.3.2-1.3.3.patch
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
From 4890c165a60330895b6c7a19b87e1b2f28896ef0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 19:22:29 +0000
Subject: [PATCH] python3-mako: upgrade 1.3.2 -> 1.3.3

---
 .../python/{python3-mako_1.3.2.bb => python3-mako_1.3.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-mako_1.3.2.bb => python3-mako_1.3.3.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.3.2.bb b/meta/recipes-devtools/python/python3-mako_1.3.3.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-mako_1.3.2.bb
rename to meta/recipes-devtools/python/python3-mako_1.3.3.bb
index 5b7df9192f..7545cbef99 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.2.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.3.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "Mako"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "2a0c8ad7f6274271b3bb7467dd37cf9cc6dab4bc19cb69a4ef10669402de698e"
+SRC_URI[sha256sum] = "e16c01d9ab9c11f7290eef1cfefc093fb5a45ee4a3da09e2fec2e4d1bae54e73"
 
 RDEPENDS:${PN} = "python3-html \
                   python3-markupsafe \
-- 
2.42.0


--===============6320002610999165590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.12/site-packages/Mako-1.3.2.dist-info moved to /usr/lib/python3.12/site-packages/Mako-1.3.3.dist-info

--===============6320002610999165590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-mako: SRC_URI changed from "https://files.pythonhosted.org/packages/source/M/Mako/Mako-1.3.2.tar.gz;downloadfilename=Mako-1.3.2.tar.gz" to "https://files.pythonhosted.org/packages/source/M/Mako/Mako-1.3.3.tar.gz;downloadfilename=Mako-1.3.3.tar.gz"
packages/core2-64-poky-linux/python3-mako: PV changed from "1.3.2" to "1.3.3"
packages/core2-64-poky-linux/python3-mako: PKGV changed from 1.3.2 [default] to 1.3.3 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-dbg: PV changed from "1.3.2" to "1.3.3"
packages/core2-64-poky-linux/python3-mako/python3-mako-dbg: PKGV changed from 1.3.2 [default] to 1.3.3 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-dev: PV changed from "1.3.2" to "1.3.3"
packages/core2-64-poky-linux/python3-mako/python3-mako-dev: PKGV changed from 1.3.2 [default] to 1.3.3 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-doc: PV changed from "1.3.2" to "1.3.3"
packages/core2-64-poky-linux/python3-mako/python3-mako-doc: PKGV changed from 1.3.2 [default] to 1.3.3 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-locale: PV changed from "1.3.2" to "1.3.3"
packages/core2-64-poky-linux/python3-mako/python3-mako-locale: PKGV changed from 1.3.2 [default] to 1.3.3 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-src: PV changed from "1.3.2" to "1.3.3"
packages/core2-64-poky-linux/python3-mako/python3-mako-src: PKGV changed from 1.3.2 [default] to 1.3.3 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-staticdev: PV changed from "1.3.2" to "1.3.3"
packages/core2-64-poky-linux/python3-mako/python3-mako-staticdev: PKGV changed from 1.3.2 [default] to 1.3.3 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako: PV changed from "1.3.2" to "1.3.3"
packages/core2-64-poky-linux/python3-mako/python3-mako: PKGV changed from 1.3.2 [default] to 1.3.3 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako: PKGSIZE changed from 636096 to 638645 (+0%)
Changes to packages/core2-64-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.12/site-packages/Mako-1.3.2.dist-info moved to /usr/lib/python3.12/site-packages/Mako-1.3.3.dist-info

--===============6320002610999165590==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-mako-upgrade-1.3.2-1.3.3.patch"

RnJvbSA0ODkwYzE2NWE2MDMzMDg5NWI2YzdhMTliODdlMWIyZjI4ODk2ZWYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMTk6MjI6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1ha286IHVwZ3JhZGUgMS4zLjIgLT4gMS4zLjMKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1tYWtvXzEuMy4yLmJiID0+IHB5dGhvbjMtbWFrb18xLjMuMy5iYn0gICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1tYWtvXzEuMy4yLmJiID0+IHB5dGhv
bjMtbWFrb18xLjMuMy5iYn0gKDg0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtbWFrb18xLjMuMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1tYWtvXzEuMy4zLmJiCnNpbWlsYXJpdHkgaW5kZXggODQlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYWtvXzEuMy4yLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFrb18xLjMuMy5i
YgppbmRleCA1YjdkZjkxOTJmLi43NTQ1Y2JlZjk5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFrb18xLjMuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFrb18xLjMuMy5iYgpAQCAtOCw3ICs4LDcgQEAgUFlQ
SV9QQUNLQUdFID0gIk1ha28iCiAKIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWls
ZF9tZXRhCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyYTBjOGFkN2Y2Mjc0MjcxYjNiYjc0Njdk
ZDM3Y2Y5Y2M2ZGFiNGJjMTljYjY5YTRlZjEwNjY5NDAyZGU2OThlIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImUxNmMwMWQ5YWI5YzExZjcyOTBlZWYxY2ZlZmMwOTNmYjVhNDVlZTRhM2RhMDllMmZl
YzJlNGQxYmFlNTRlNzMiCiAKIFJERVBFTkRTOiR7UE59ID0gInB5dGhvbjMtaHRtbCBcCiAgICAg
ICAgICAgICAgICAgICBweXRob24zLW1hcmt1cHNhZmUgXAotLSAKMi40Mi4wCgo=

--===============6320002610999165590==--

