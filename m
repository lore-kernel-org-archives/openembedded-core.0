Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B5BC54FB9
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:14 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.14636.1700059032733415021
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CtdGvFFz;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=D1yT4Rtb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018bd36a2a17-f0e082d5-6450-41fd-86c3-c6fa09ed251b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059032;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JNAOGtiV8I2y6fiXTFDysdES9hYnBC38ZyIDjPCy1fQ=;
	b=CtdGvFFzO/BIsMe7xt494YDfbimAYLMCxCsPW2m6iKYSygp2UM8z4n/PiCNjMYc/
	93LdAsSrilKIPPysj910Bl7wxIYC35/XgFHFuegqDlwmAMIXPNKGhunfxlRYgMiKm28
	PlqzWUqGRNTc0LRTi1GpBQ6Z40g+1RUxQGWX9XWg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059032;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JNAOGtiV8I2y6fiXTFDysdES9hYnBC38ZyIDjPCy1fQ=;
	b=D1yT4Rtb6s3m+9oiGMM0UUpLIhEXN/5R2H+yqnDMtGYsnKV14kVTrNWoKlGYUaPQ
	Tp6DlXWOD/V1L0+ByjIrHhdYEbT41hONBSiolQAS6HuWUGMPQLZ/l5ywSTDoKhlsmBn
	1QKl3K+I1+xSnRCK4jguc8fFErhpW9Gq+jgc+V/8=
Content-Type: multipart/mixed; boundary="===============3292205079288821108=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-headers: upgrading to 1.3.268.0 SUCCEEDED
Message-ID: <0101018bd36a2a17-f0e082d5-6450-41fd-86c3-c6fa09ed251b-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190690

--===============3292205079288821108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-headers* to *1.3.268.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-headers-upgrade-1.3.261.1-1.3.268.0.patch
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
From e1c805623cbb7f34e54b8dde107a5de5afad168b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 12:03:10 +0000
Subject: [PATCH] vulkan-headers: upgrade 1.3.261.1 -> 1.3.268.0

---
 ...{vulkan-headers_1.3.261.1.bb => vulkan-headers_1.3.268.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.3.261.1.bb => vulkan-headers_1.3.268.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb
index 01eb14b9fb..c26a54360b 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1bc355d8c4196f774c8b87ed1a8dd625"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "85c2334e92e215cce34e8e0ed8b2dce4700f4a50"
+SRCREV = "7b3466a1f47a9251ac1113efbe022ff016e2f95b"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============3292205079288821108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/vulkan-headers: PKGV changed from 1.3.261.1 [default] to 1.3.268.0 [default]
packages/core2-64-poky-linux/vulkan-headers: PV changed from "1.3.261.1" to "1.3.268.0"
Changes to packages/core2-64-poky-linux/vulkan-headers (sysroot):
  /usr/include/vulkan/vulkan_hpp_macros.hpp was added
  /usr/include/vulkan/vulkan_shared.hpp was added
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dbg: PKGV changed from 1.3.261.1 [default] to 1.3.268.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dbg: PV changed from "1.3.261.1" to "1.3.268.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: PKGV changed from 1.3.261.1 [default] to 1.3.268.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: FILELIST: added "/usr/include/vulkan/vulkan_hpp_macros.hpp /usr/include/vulkan/vulkan_shared.hpp"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: PKGSIZE changed from 13556354 to 13847115 (+2%)
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: PV changed from "1.3.261.1" to "1.3.268.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-doc: PKGV changed from 1.3.261.1 [default] to 1.3.268.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-doc: PV changed from "1.3.261.1" to "1.3.268.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-locale: PKGV changed from 1.3.261.1 [default] to 1.3.268.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-locale: PV changed from "1.3.261.1" to "1.3.268.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-src: PKGV changed from 1.3.261.1 [default] to 1.3.268.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-src: PV changed from "1.3.261.1" to "1.3.268.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-staticdev: PKGV changed from 1.3.261.1 [default] to 1.3.268.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-staticdev: PV changed from "1.3.261.1" to "1.3.268.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: PKGV changed from 1.3.261.1 [default] to 1.3.268.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 10546716 to 11675666 (+11%)
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: PV changed from "1.3.261.1" to "1.3.268.0"

--===============3292205079288821108==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-headers-upgrade-1.3.261.1-1.3.268.0.patch"

RnJvbSBlMWM4MDU2MjNjYmI3ZjM0ZTU0YjhkZGUxMDdhNWRlNWFmYWQxNjhiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMTI6MDM6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4taGVhZGVyczogdXBncmFkZSAxLjMuMjYxLjEgLT4gMS4zLjI2OC4wCgotLS0KIC4uLnt2
dWxrYW4taGVhZGVyc18xLjMuMjYxLjEuYmIgPT4gdnVsa2FuLWhlYWRlcnNfMS4zLjI2OC4wLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi1oZWFkZXJzXzEuMy4y
NjEuMS5iYiA9PiB2dWxrYW4taGVhZGVyc18xLjMuMjY4LjAuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4taGVhZGVyc18xLjMuMjYxLjEu
YmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yNjgu
MC5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yNjEuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4taGVhZGVyc18xLjMuMjY4LjAuYmIKaW5kZXggMDFl
YjE0YjlmYi4uYzI2YTU0MzYwYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1
bGthbi92dWxrYW4taGVhZGVyc18xLjMuMjYxLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3Z1bGthbi92dWxrYW4taGVhZGVyc18xLjMuMjY4LjAuYmIKQEAgLTExLDcgKzExLDcgQEAg
TElDRU5TRSA9ICJBcGFjaGUtMi4wICYgTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
TElDRU5TRS5tZDttZDU9MWJjMzU1ZDhjNDE5NmY3NzRjOGI4N2VkMWE4ZGQ2MjUiCiBTUkNfVVJJ
ID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1Z1bGthbi1IZWFkZXJzLmdpdDticmFu
Y2g9bWFpbjtwcm90b2NvbD1odHRwcyIKIAotU1JDUkVWID0gIjg1YzIzMzRlOTJlMjE1Y2NlMzRl
OGUwZWQ4YjJkY2U0NzAwZjRhNTAiCitTUkNSRVYgPSAiN2IzNDY2YTFmNDdhOTI1MWFjMTExM2Vm
YmUwMjJmZjAxNmUyZjk1YiIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi4zOS4yCgo=

--===============3292205079288821108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/vulkan-headers (sysroot):
  /usr/include/vulkan/vulkan_hpp_macros.hpp was added
  /usr/include/vulkan/vulkan_shared.hpp was added
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: FILELIST: added "/usr/include/vulkan/vulkan_hpp_macros.hpp /usr/include/vulkan/vulkan_shared.hpp"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 10546716 to 11675666 (+11%)

--===============3292205079288821108==--

