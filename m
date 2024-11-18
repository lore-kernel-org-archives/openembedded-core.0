Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E28D62071
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:53 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.4679.1731964633083259581
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=SrSUwyUm;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=kc7qipeV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019341237f92-d7e08b9a-d6f1-450e-90cb-ade0b076b169-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964665;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jzYqIVUaV+hrQTF7aEl5LPQiI2pB8QM7uz0WsDy//Tk=;
	b=SrSUwyUmTP1WO61PGiUleYDKqrWZj7oEbereM7jgrzT//KApk5uKe/1B2faUIB07
	yO0oAncd9s2emIdcIKuTyMqDjtsxF1NNLdQ7PPOjrMU+Law1s4QYFWgPiqzmOPUHQke
	11BuG85UCO8EKITAiOPtaUA5K3r6e9MeTwRGztHo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964665;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jzYqIVUaV+hrQTF7aEl5LPQiI2pB8QM7uz0WsDy//Tk=;
	b=kc7qipeVUM8JPG20h4JltWYhMFUL9VpwOUTyp0ooXnpYsbAHi6inXbuRLyBo6YGX
	qLDSCHhaamYP5KXcEI0ECKJcoXyADYc7mDVtKNFt5QAnwlL306Z9zNnBwZu0oilDCaV
	5wJRyM3xpaov5x5PT/AEcG8CcVehOPLKfatg9WOE=
Content-Type: multipart/mixed; boundary="===============9174152359792225102=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-headers: upgrading to 1.3.296.0 SUCCEEDED
Message-ID: <0101019341237f92-d7e08b9a-d6f1-450e-90cb-ade0b076b169-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207331

--===============9174152359792225102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-headers* to *1.3.296.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-headers-upgrade-1.3.290.0-1.3.296.0.patch
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
From 86004ab465359945bd3a2edf8451d45f366397b3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 18 Nov 2024 00:19:04 +0000
Subject: [PATCH] vulkan-headers: upgrade 1.3.290.0 -> 1.3.296.0

---
 ...{vulkan-headers_1.3.290.0.bb => vulkan-headers_1.3.296.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.3.290.0.bb => vulkan-headers_1.3.296.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb
index 9f17ddc525..68f8f5b0a1 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1bc355d8c4196f774c8b87ed1a8dd625"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "b379292b2ab6df5771ba9870d53cf8b2c9295daf"
+SRCREV = "29f979ee5aa58b7b005f805ea8df7a855c39ff37"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.1


--===============9174152359792225102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/vulkan-headers (sysroot):
  /usr/share/vulkan/registry/vk.xml changed permissions from rwxr-xr-x to rw-r--r--

--===============9174152359792225102==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-headers-upgrade-1.3.290.0-1.3.296.0.patch"

RnJvbSA4NjAwNGFiNDY1MzU5OTQ1YmQzYTJlZGY4NDUxZDQ1ZjM2NjM5N2IzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTggTm92IDIwMjQgMDA6MTk6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4taGVhZGVyczogdXBncmFkZSAxLjMuMjkwLjAgLT4gMS4zLjI5Ni4wCgotLS0KIC4uLnt2
dWxrYW4taGVhZGVyc18xLjMuMjkwLjAuYmIgPT4gdnVsa2FuLWhlYWRlcnNfMS4zLjI5Ni4wLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi1oZWFkZXJzXzEuMy4y
OTAuMC5iYiA9PiB2dWxrYW4taGVhZGVyc18xLjMuMjk2LjAuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4taGVhZGVyc18xLjMuMjkwLjAu
YmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yOTYu
MC5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yOTAuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4taGVhZGVyc18xLjMuMjk2LjAuYmIKaW5kZXggOWYx
N2RkYzUyNS4uNjhmOGY1YjBhMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1
bGthbi92dWxrYW4taGVhZGVyc18xLjMuMjkwLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3Z1bGthbi92dWxrYW4taGVhZGVyc18xLjMuMjk2LjAuYmIKQEAgLTExLDcgKzExLDcgQEAg
TElDRU5TRSA9ICJBcGFjaGUtMi4wICYgTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
TElDRU5TRS5tZDttZDU9MWJjMzU1ZDhjNDE5NmY3NzRjOGI4N2VkMWE4ZGQ2MjUiCiBTUkNfVVJJ
ID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1Z1bGthbi1IZWFkZXJzLmdpdDticmFu
Y2g9bWFpbjtwcm90b2NvbD1odHRwcyIKIAotU1JDUkVWID0gImIzNzkyOTJiMmFiNmRmNTc3MWJh
OTg3MGQ1M2NmOGIyYzkyOTVkYWYiCitTUkNSRVYgPSAiMjlmOTc5ZWU1YWE1OGI3YjAwNWY4MDVl
YThkZjdhODU1YzM5ZmYzNyIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi40NC4xCgo=

--===============9174152359792225102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/vulkan-headers: PV changed from "1.3.290.0" to "1.3.296.0"
packages/core2-64-poky-linux/vulkan-headers: PKGV changed from 1.3.290.0 [default] to 1.3.296.0 [default]
Changes to packages/core2-64-poky-linux/vulkan-headers (sysroot):
  /usr/share/vulkan/registry/vk.xml changed permissions from rwxr-xr-x to rw-r--r--
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dbg: PV changed from "1.3.290.0" to "1.3.296.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dbg: PKGV changed from 1.3.290.0 [default] to 1.3.296.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: PKGSIZE changed from 14997684 to 15470664 (+3%)
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: PV changed from "1.3.290.0" to "1.3.296.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: PKGV changed from 1.3.290.0 [default] to 1.3.296.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-doc: PV changed from "1.3.290.0" to "1.3.296.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-doc: PKGV changed from 1.3.290.0 [default] to 1.3.296.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-locale: PV changed from "1.3.290.0" to "1.3.296.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-locale: PKGV changed from 1.3.290.0 [default] to 1.3.296.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-src: PV changed from "1.3.290.0" to "1.3.296.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-src: PKGV changed from 1.3.290.0 [default] to 1.3.296.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-staticdev: PV changed from "1.3.290.0" to "1.3.296.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-staticdev: PKGV changed from 1.3.290.0 [default] to 1.3.296.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 12298344 to 12762298 (+4%)
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: PV changed from "1.3.290.0" to "1.3.296.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: PKGV changed from 1.3.290.0 [default] to 1.3.296.0 [default]

--===============9174152359792225102==--

