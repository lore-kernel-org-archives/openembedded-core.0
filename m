Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F72CCA0EF9
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:08:13 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.88618.1754057264357149762
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:08:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=vBDp6MNY;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=qBbhm2bm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019865f616ee-fb09479e-c8ea-4afe-a9c4-4521efe815ee-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057283;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yFpR+4R5XlKs+sBroxYmxWPwF5KLdBzhqdk+0EhcL2A=;
	b=vBDp6MNYy7pafsmmYGd/H1IMxftWQetq+nxvvqqWOKArbArXNbxfxuzs3brDzdce
	lZCuaXE8W50i+Yi18PFWI1QiOvB6nFWEvAxRrucfjEy/+zPwttNZAVBXPg/nneTNtTf
	+ReH0j9J2ZOubSZ5mauCfIwzQYWHt7ITJWENPIWw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057283;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yFpR+4R5XlKs+sBroxYmxWPwF5KLdBzhqdk+0EhcL2A=;
	b=qBbhm2bmiSLbRyM7HQBEs3TOGPU/jWpozBCcC29NNh4ge6n28BovQ7nuGJ/nvhBw
	xA7gYrE9gU8U6OAOT2u6fKXacP66AjhmGjYXLb/QaKP4mlHK9E38HXDpj9HFoJWCv+Z
	NO/gCIshwnOTzMSrbwqgb64ndmzbLAFjkaHzBuAU=
Content-Type: multipart/mixed; boundary="===============0345163080913107802=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-headers: upgrading to 1.4.321.0 SUCCEEDED
Message-ID: <0101019865f616ee-fb09479e-c8ea-4afe-a9c4-4521efe815ee-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:08:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221313

--===============0345163080913107802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-headers* to *1.4.321.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-headers-upgrade-1.4.313.0-1.4.321.0.patch
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
From 78a5a4a88b74be9b8824351af206dbaf3d173375 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 11:47:59 +0000
Subject: [PATCH] vulkan-headers: upgrade 1.4.313.0 -> 1.4.321.0

---
 ...{vulkan-headers_1.4.313.0.bb => vulkan-headers_1.4.321.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.4.313.0.bb => vulkan-headers_1.4.321.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb
index 1136e4795a..b3413b0e6b 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1bc355d8c4196f774c8b87ed1a8dd625"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "409c16be502e39fe70dd6fe2d9ad4842ef2c9a53"
+SRCREV = "2cd90f9d20df57eac214c148f3aed885372ddcfe"
 
 inherit cmake
 
-- 
2.47.1


--===============0345163080913107802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/vulkan-headers: PKGV changed from 1.4.313.0 [default] to 1.4.321.0 [default]
packages/core2-64-poky-linux/vulkan-headers: PV changed from "1.4.313.0" to "1.4.321.0"
Changes to packages/core2-64-poky-linux/vulkan-headers (sysroot):
  /usr/share/vulkan/registry/vk.xml changed permissions from rwxr-xr-x to rw-r--r--
  /usr/include/vk_video/vulkan_video_codec_vp9std_decode.h was added
  /usr/include/vk_video/vulkan_video_codec_vp9std.h was added
  /usr/include/vulkan/vulkan_ohos.h was added
  /usr/include/vulkan/vulkan_video.cppm was added
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dbg: PKGV changed from 1.4.313.0 [default] to 1.4.321.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dbg: PV changed from "1.4.313.0" to "1.4.321.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: PKGV changed from 1.4.313.0 [default] to 1.4.321.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: FILELIST: added "/usr/include/vk_video/vulkan_video_codec_vp9std_decode.h /usr/include/vulkan/vulkan_video.cppm /usr/include/vulkan/vulkan_ohos.h /usr/include/vk_video/vulkan_video_codec_vp9std.h"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: PKGSIZE changed from 18496847 to 19343148 (+5%)
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: PV changed from "1.4.313.0" to "1.4.321.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-doc: PKGV changed from 1.4.313.0 [default] to 1.4.321.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-doc: PV changed from "1.4.313.0" to "1.4.321.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-locale: PKGV changed from 1.4.313.0 [default] to 1.4.321.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-locale: PV changed from "1.4.313.0" to "1.4.321.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-src: PKGV changed from 1.4.313.0 [default] to 1.4.321.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-src: PV changed from "1.4.313.0" to "1.4.321.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-staticdev: PKGV changed from 1.4.313.0 [default] to 1.4.321.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-staticdev: PV changed from "1.4.313.0" to "1.4.321.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: PKGV changed from 1.4.313.0 [default] to 1.4.321.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 13896032 to 14305242 (+3%)
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: PV changed from "1.4.313.0" to "1.4.321.0"

--===============0345163080913107802==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-headers-upgrade-1.4.313.0-1.4.321.0.patch"

RnJvbSA3OGE1YTRhODhiNzRiZTliODgyNDM1MWFmMjA2ZGJhZjNkMTczMzc1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAxMTo0Nzo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi1oZWFkZXJzOiB1cGdyYWRlIDEuNC4zMTMuMCAtPiAxLjQuMzIxLjAKCi0tLQogLi4ue3Z1
bGthbi1oZWFkZXJzXzEuNC4zMTMuMC5iYiA9PiB2dWxrYW4taGVhZGVyc18xLjQuMzIxLjAuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2FuLWhlYWRlcnNfMS40LjMx
My4wLmJiID0+IHZ1bGthbi1oZWFkZXJzXzEuNC4zMjEuMC5iYn0gKDk1JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuNC4zMTMuMC5i
YiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLWhlYWRlcnNfMS40LjMyMS4w
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy92dWxrYW4vdnVsa2FuLWhlYWRlcnNfMS40LjMxMy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuNC4zMjEuMC5iYgppbmRleCAxMTM2
ZTQ3OTVhLi5iMzQxM2IwZTZiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVs
a2FuL3Z1bGthbi1oZWFkZXJzXzEuNC4zMTMuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuNC4zMjEuMC5iYgpAQCAtMTEsNyArMTEsNyBAQCBM
SUNFTlNFID0gIkFwYWNoZS0yLjAgJiBNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFLm1kO21kNT0xYmMzNTVkOGM0MTk2Zjc3NGM4Yjg3ZWQxYThkZDYyNSIKIFNSQ19VUkkg
PSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvVnVsa2FuLUhlYWRlcnMuZ2l0O2JyYW5j
aD1tYWluO3Byb3RvY29sPWh0dHBzIgogCi1TUkNSRVYgPSAiNDA5YzE2YmU1MDJlMzlmZTcwZGQ2
ZmUyZDlhZDQ4NDJlZjJjOWE1MyIKK1NSQ1JFViA9ICIyY2Q5MGY5ZDIwZGY1N2VhYzIxNGMxNDhm
M2FlZDg4NTM3MmRkY2ZlIgogCiBpbmhlcml0IGNtYWtlCiAKLS0gCjIuNDcuMQoK

--===============0345163080913107802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/vulkan-headers (sysroot):
  /usr/share/vulkan/registry/vk.xml changed permissions from rwxr-xr-x to rw-r--r--
  /usr/include/vk_video/vulkan_video_codec_vp9std_decode.h was added
  /usr/include/vk_video/vulkan_video_codec_vp9std.h was added
  /usr/include/vulkan/vulkan_ohos.h was added
  /usr/include/vulkan/vulkan_video.cppm was added
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: FILELIST: added "/usr/include/vulkan/vulkan_video.cppm /usr/include/vk_video/vulkan_video_codec_vp9std_decode.h /usr/include/vk_video/vulkan_video_codec_vp9std.h /usr/include/vulkan/vulkan_ohos.h"

--===============0345163080913107802==--

