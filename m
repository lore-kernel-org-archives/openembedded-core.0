Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0121EC282D4
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:35 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.8091.1739623332163588576
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=WGebrdai;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=XtE5hL6d;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019509a1b2dd-f567e60f-d414-4437-9e4c-7cbd40cf4337-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623347;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zUqEtKHexTabfiEWPxzGeD5BI4aJ18qkkMJgHdH2AfE=;
	b=WGebrdaigAY6PDweZBOmHZCd1XG7OXByUARX0HzpXrRd0OYSHhSuGVz0JW1oEpmC
	08skSN15G4GowGhX4r5HsaFAn/4tzuIksHwAnwpnKfKNLV0cVm1UbP6m0jS5arNEqUA
	SXNJ2N2Gc96oLqFgmEv+KTkhZlsBJXWurllftWJ0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623347;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zUqEtKHexTabfiEWPxzGeD5BI4aJ18qkkMJgHdH2AfE=;
	b=XtE5hL6dQFfQWCXJCuiZQd7VhGSQ9N+A9DZvJ+cdF4cAXin6jm2ZVrXjpGVALxqV
	L4bTy/ja9ZgT+N6sA1ljH2ZwJHSMV9ypXpOnGzwhqww3q9VQDJVqz2DB8IUTDf+2fFy
	4x3An9BBsChmcQHUeCPSFTNmSmo8LiLoctiM4vS4=
Content-Type: multipart/mixed; boundary="===============3649118665930982201=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-headers: upgrading to 1.4.304.1 SUCCEEDED
Message-ID: <0101019509a1b2dd-f567e60f-d414-4437-9e4c-7cbd40cf4337-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211458

--===============3649118665930982201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-headers* to *1.4.304.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-headers-upgrade-1.3.296.0-1.4.304.1.patch
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
From d37a3acdf000553fdea03400b775b1873a311a68 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 10:06:14 +0000
Subject: [PATCH] vulkan-headers: upgrade 1.3.296.0 -> 1.4.304.1

---
 ...{vulkan-headers_1.3.296.0.bb => vulkan-headers_1.4.304.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.3.296.0.bb => vulkan-headers_1.4.304.1.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.304.1.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.4.304.1.bb
index 68f8f5b0a1..739305c0d9 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.304.1.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1bc355d8c4196f774c8b87ed1a8dd625"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "29f979ee5aa58b7b005f805ea8df7a855c39ff37"
+SRCREV = "d4a196d8c84e032d27f999adcea3075517c1c97f"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.1


--===============3649118665930982201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/vulkan-headers: PKGV changed from 1.3.296.0 [default] to 1.4.304.1 [default]
packages/core2-64-poky-linux/vulkan-headers: PV changed from "1.3.296.0" to "1.4.304.1"
Changes to packages/core2-64-poky-linux/vulkan-headers (sysroot):
  /usr/include/vk_video/vulkan_video_codec_av1std_encode.h was added
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dbg: PKGV changed from 1.3.296.0 [default] to 1.4.304.1 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dbg: PV changed from "1.3.296.0" to "1.4.304.1"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: PKGSIZE changed from 15470664 to 16217114 (+5%)
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: PKGV changed from 1.3.296.0 [default] to 1.4.304.1 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: FILELIST: added "/usr/include/vk_video/vulkan_video_codec_av1std_encode.h"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: PV changed from "1.3.296.0" to "1.4.304.1"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-doc: PKGV changed from 1.3.296.0 [default] to 1.4.304.1 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-doc: PV changed from "1.3.296.0" to "1.4.304.1"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-locale: PKGV changed from 1.3.296.0 [default] to 1.4.304.1 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-locale: PV changed from "1.3.296.0" to "1.4.304.1"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-src: PKGV changed from 1.3.296.0 [default] to 1.4.304.1 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-src: PV changed from "1.3.296.0" to "1.4.304.1"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-staticdev: PKGV changed from 1.3.296.0 [default] to 1.4.304.1 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-staticdev: PV changed from "1.3.296.0" to "1.4.304.1"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 12762298 to 13314354 (+4%)
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: PKGV changed from 1.3.296.0 [default] to 1.4.304.1 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: PV changed from "1.3.296.0" to "1.4.304.1"

--===============3649118665930982201==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-headers-upgrade-1.3.296.0-1.4.304.1.patch"

RnJvbSBkMzdhM2FjZGYwMDA1NTNmZGVhMDM0MDBiNzc1YjE4NzNhMzExYTY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMTA6MDY6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4taGVhZGVyczogdXBncmFkZSAxLjMuMjk2LjAgLT4gMS40LjMwNC4xCgotLS0KIC4uLnt2
dWxrYW4taGVhZGVyc18xLjMuMjk2LjAuYmIgPT4gdnVsa2FuLWhlYWRlcnNfMS40LjMwNC4xLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi1oZWFkZXJzXzEuMy4y
OTYuMC5iYiA9PiB2dWxrYW4taGVhZGVyc18xLjQuMzA0LjEuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4taGVhZGVyc18xLjMuMjk2LjAu
YmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuNC4zMDQu
MS5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yOTYuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4taGVhZGVyc18xLjQuMzA0LjEuYmIKaW5kZXggNjhm
OGY1YjBhMS4uNzM5MzA1YzBkOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1
bGthbi92dWxrYW4taGVhZGVyc18xLjMuMjk2LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3Z1bGthbi92dWxrYW4taGVhZGVyc18xLjQuMzA0LjEuYmIKQEAgLTExLDcgKzExLDcgQEAg
TElDRU5TRSA9ICJBcGFjaGUtMi4wICYgTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
TElDRU5TRS5tZDttZDU9MWJjMzU1ZDhjNDE5NmY3NzRjOGI4N2VkMWE4ZGQ2MjUiCiBTUkNfVVJJ
ID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1Z1bGthbi1IZWFkZXJzLmdpdDticmFu
Y2g9bWFpbjtwcm90b2NvbD1odHRwcyIKIAotU1JDUkVWID0gIjI5Zjk3OWVlNWFhNThiN2IwMDVm
ODA1ZWE4ZGY3YTg1NWMzOWZmMzciCitTUkNSRVYgPSAiZDRhMTk2ZDhjODRlMDMyZDI3Zjk5OWFk
Y2VhMzA3NTUxN2MxYzk3ZiIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi40NC4xCgo=

--===============3649118665930982201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/vulkan-headers (sysroot):
  /usr/include/vk_video/vulkan_video_codec_av1std_encode.h was added
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: FILELIST: added "/usr/include/vk_video/vulkan_video_codec_av1std_encode.h"

--===============3649118665930982201==--

