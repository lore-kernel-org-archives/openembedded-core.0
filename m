Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F14C52CDA
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:17 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.13429.1713248038370661688
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=T2H9ASkV;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=MTThZhuF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018ee58a990f-497bceb2-de9d-4268-832f-3c28c9e8f3cc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248049;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RWbTd7PG0tN2QyYneUEWkJgY8ARD5NbNjrhkUc1szw4=;
	b=T2H9ASkVBB6jRSqWU8zGcXPYm/zkGuWyjDEg7ocLyddZlHVAh2EhuW6MJLJyo3M+
	ST8rfJjDxACq8tt+/ByO7NHIYUjaNvvYJmUaaLiDx6BucYl4oyJxdRZObeFP1eAjIl2
	Q+v3ZikC+1VDuTT3AvbNKqWhgJUKKsMWAS8uOxlk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248049;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RWbTd7PG0tN2QyYneUEWkJgY8ARD5NbNjrhkUc1szw4=;
	b=MTThZhuFqo1eI1JV8PwhkiXTyeZXoIlMRjKc2HnTUS/yYhjRtHGlgiBzmcFl7rcu
	zpNXWmWGGdlF6o9dirHeE27FTqyexlw7EB6/hu5F4aC7eFXdOkG3kytvFzof1CA3vEV
	E6oH3qEbwlE8OkPteNYbQf7p2Qc1TUclGkKMEWR0=
Content-Type: multipart/mixed; boundary="===============6649614396686456262=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-headers: upgrading to 1.3.280.0 SUCCEEDED
Message-ID: <0101018ee58a990f-497bceb2-de9d-4268-832f-3c28c9e8f3cc-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198366

--===============6649614396686456262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-headers* to *1.3.280.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-headers-upgrade-1.3.275.0-1.3.280.0.patch
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
From 3b0d8d0c3693f47001c988f0ce195717ef5f5489 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 23:36:30 +0000
Subject: [PATCH] vulkan-headers: upgrade 1.3.275.0 -> 1.3.280.0

---
 ...{vulkan-headers_1.3.275.0.bb => vulkan-headers_1.3.280.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.3.275.0.bb => vulkan-headers_1.3.280.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.275.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.280.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.3.275.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.3.280.0.bb
index aacec8cab1..371cc7304d 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.275.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.280.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1bc355d8c4196f774c8b87ed1a8dd625"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "217e93c664ec6704ec2d8c36fa116c1a4a1e2d40"
+SRCREV = "577baa05033cf1d9236b3d078ca4b3269ed87a2b"
 
 S = "${WORKDIR}/git"
 
-- 
2.42.0


--===============6649614396686456262==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-headers-upgrade-1.3.275.0-1.3.280.0.patch"

RnJvbSAzYjBkOGQwYzM2OTNmNDcwMDFjOTg4ZjBjZTE5NTcxN2VmNWY1NDg5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMjM6MzY6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4taGVhZGVyczogdXBncmFkZSAxLjMuMjc1LjAgLT4gMS4zLjI4MC4wCgotLS0KIC4uLnt2
dWxrYW4taGVhZGVyc18xLjMuMjc1LjAuYmIgPT4gdnVsa2FuLWhlYWRlcnNfMS4zLjI4MC4wLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi1oZWFkZXJzXzEuMy4y
NzUuMC5iYiA9PiB2dWxrYW4taGVhZGVyc18xLjMuMjgwLjAuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4taGVhZGVyc18xLjMuMjc1LjAu
YmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yODAu
MC5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yNzUuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4taGVhZGVyc18xLjMuMjgwLjAuYmIKaW5kZXggYWFj
ZWM4Y2FiMS4uMzcxY2M3MzA0ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1
bGthbi92dWxrYW4taGVhZGVyc18xLjMuMjc1LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3Z1bGthbi92dWxrYW4taGVhZGVyc18xLjMuMjgwLjAuYmIKQEAgLTExLDcgKzExLDcgQEAg
TElDRU5TRSA9ICJBcGFjaGUtMi4wICYgTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
TElDRU5TRS5tZDttZDU9MWJjMzU1ZDhjNDE5NmY3NzRjOGI4N2VkMWE4ZGQ2MjUiCiBTUkNfVVJJ
ID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1Z1bGthbi1IZWFkZXJzLmdpdDticmFu
Y2g9bWFpbjtwcm90b2NvbD1odHRwcyIKIAotU1JDUkVWID0gIjIxN2U5M2M2NjRlYzY3MDRlYzJk
OGMzNmZhMTE2YzFhNGExZTJkNDAiCitTUkNSRVYgPSAiNTc3YmFhMDUwMzNjZjFkOTIzNmIzZDA3
OGNhNGIzMjY5ZWQ4N2EyYiIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi40Mi4wCgo=

--===============6649614396686456262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/vulkan-headers (sysroot):
  /usr/share/vulkan/registry/vk.xml changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/include/vk_video/vulkan_video_codec_av1std_decode.h was added
  /usr/include/vk_video/vulkan_video_codec_av1std.h was added
  /usr/share/vulkan/registry/profiles/VP_KHR_roadmap.json was added
  /usr/share/vulkan/registry/profiles/VP_KHR_roadmap_2022.json was removed
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: FILELIST: added "/usr/include/vk_video/vulkan_video_codec_av1std_decode.h /usr/include/vk_video/vulkan_video_codec_av1std.h"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: FILELIST: removed "/usr/share/vulkan/registry/profiles/VP_KHR_roadmap_2022.json", added "/usr/share/vulkan/registry/profiles/VP_KHR_roadmap.json"

--===============6649614396686456262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/vulkan-headers: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-headers: PV changed from "1.3.275.0" to "1.3.280.0"
Changes to packages/core2-64-poky-linux/vulkan-headers (sysroot):
  /usr/share/vulkan/registry/vk.xml changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/include/vk_video/vulkan_video_codec_av1std_decode.h was added
  /usr/include/vk_video/vulkan_video_codec_av1std.h was added
  /usr/share/vulkan/registry/profiles/VP_KHR_roadmap.json was added
  /usr/share/vulkan/registry/profiles/VP_KHR_roadmap_2022.json was removed
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dbg: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dbg: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: PKGSIZE changed from 14407772 to 14852697 (+3%)
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: FILELIST: added "/usr/include/vk_video/vulkan_video_codec_av1std_decode.h /usr/include/vk_video/vulkan_video_codec_av1std.h"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-doc: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-doc: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-locale: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-locale: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-src: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-src: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-staticdev: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-staticdev: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 12065509 to 12344715 (+2%)
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: FILELIST: removed "/usr/share/vulkan/registry/profiles/VP_KHR_roadmap_2022.json", added "/usr/share/vulkan/registry/profiles/VP_KHR_roadmap.json"

--===============6649614396686456262==--

