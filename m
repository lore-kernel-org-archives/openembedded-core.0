Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E73FCD12C5
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:29 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.1996.1711994601949391663
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eMMF06Dg;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=haW/btV4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018e9ad484da-5af34a08-78fb-49b9-97c4-68b852740064-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WrFIyrdsD4AUDnkbVI70OoK1opA8InRvRgnyQHN8Ch4=;
	b=eMMF06Dg8ZfMGaHXsUrVxQOFKxk8u6imEDl2bbsfVHhidWXjL/PzmiIv04c2YOcI
	FQbzlrkWNDHhilfEhm9XnF7jTKxQlahym8uCx/ItjskWxY9jwgcxZp+cVNIjT2tlDiE
	N4hpzFXxZadNYrKo6qEcnJlfbcbuJER/pf8X7Gu8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WrFIyrdsD4AUDnkbVI70OoK1opA8InRvRgnyQHN8Ch4=;
	b=haW/btV4AOnGz3JNhgX2rxYlA3qhuAxr9YFsBvATdHgxTpQH4a3rXvvcuzoaHTW8
	+gTYPjtPrHe0uKHZv/aoC+9onPY4s2XLwIUgCmvfrTPsxTOqP12P9LHN9Bpt3U00pvT
	ghsG75j3P6C8Uu+sdlXLNiINRk+VxkpkAOPnVTrc=
Content-Type: multipart/mixed; boundary="===============5839551870467535973=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-headers: upgrading to 1.3.280.0 SUCCEEDED
Message-ID: <0101018e9ad484da-5af34a08-78fb-49b9-97c4-68b852740064-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197769

--===============5839551870467535973==
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
From b9c14e062d91eae96aaccc7044d6e8b9bd07c6d4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 13:56:18 +0000
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


--===============5839551870467535973==
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

--===============5839551870467535973==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-headers-upgrade-1.3.275.0-1.3.280.0.patch"

RnJvbSBiOWMxNGUwNjJkOTFlYWU5NmFhY2NjNzA0NGQ2ZThiOWJkMDdjNmQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxMzo1NjoxOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi1oZWFkZXJzOiB1cGdyYWRlIDEuMy4yNzUuMCAtPiAxLjMuMjgwLjAKCi0tLQogLi4ue3Z1
bGthbi1oZWFkZXJzXzEuMy4yNzUuMC5iYiA9PiB2dWxrYW4taGVhZGVyc18xLjMuMjgwLjAuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2FuLWhlYWRlcnNfMS4zLjI3
NS4wLmJiID0+IHZ1bGthbi1oZWFkZXJzXzEuMy4yODAuMC5iYn0gKDk1JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yNzUuMC5i
YiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLWhlYWRlcnNfMS4zLjI4MC4w
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy92dWxrYW4vdnVsa2FuLWhlYWRlcnNfMS4zLjI3NS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yODAuMC5iYgppbmRleCBhYWNl
YzhjYWIxLi4zNzFjYzczMDRkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVs
a2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yNzUuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yODAuMC5iYgpAQCAtMTEsNyArMTEsNyBAQCBM
SUNFTlNFID0gIkFwYWNoZS0yLjAgJiBNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFLm1kO21kNT0xYmMzNTVkOGM0MTk2Zjc3NGM4Yjg3ZWQxYThkZDYyNSIKIFNSQ19VUkkg
PSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvVnVsa2FuLUhlYWRlcnMuZ2l0O2JyYW5j
aD1tYWluO3Byb3RvY29sPWh0dHBzIgogCi1TUkNSRVYgPSAiMjE3ZTkzYzY2NGVjNjcwNGVjMmQ4
YzM2ZmExMTZjMWE0YTFlMmQ0MCIKK1NSQ1JFViA9ICI1NzdiYWEwNTAzM2NmMWQ5MjM2YjNkMDc4
Y2E0YjMyNjllZDg3YTJiIgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCi0tIAoyLjQyLjAKCg==

--===============5839551870467535973==
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
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: PKGSIZE changed from 14407772 to 14852697 (+3%)
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: FILELIST: added "/usr/include/vk_video/vulkan_video_codec_av1std.h /usr/include/vk_video/vulkan_video_codec_av1std_decode.h"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-doc: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-doc: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-locale: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-locale: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-src: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-src: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-staticdev: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-staticdev: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 12065509 to 12344715 (+2%)
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: FILELIST: removed "/usr/share/vulkan/registry/profiles/VP_KHR_roadmap_2022.json", added "/usr/share/vulkan/registry/profiles/VP_KHR_roadmap.json"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: PV changed from "1.3.275.0" to "1.3.280.0"

--===============5839551870467535973==--

