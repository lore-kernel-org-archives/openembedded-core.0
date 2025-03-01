Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A84CFC35FF7
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:38 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.7047.1740828318618550201
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Ph+V1Uo8;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=HrDOZgBe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019551745d0b-77cc6fda-4688-4884-b9f5-0e5ff3538cc4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QihfU2wqljEcI81aOd2epmbeFvxTgfaglo3Ijjk5cRQ=;
	b=Ph+V1Uo8LUymkURANjPkYY6bWQVj50hrTUwYTxosicZMBkMM4QQk+8NfJTGBs/lr
	+k/PWiuQRO4zyQMzekKkpLqPvcwC8gPZmMU6kx+JmNG3rGmVlf32KqO4PyFvlaJs/Ah
	lH+TYD6ywvFzb2QdVhL0+GzxPXFDeBpr781yJvQM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QihfU2wqljEcI81aOd2epmbeFvxTgfaglo3Ijjk5cRQ=;
	b=HrDOZgBeiPzdUlxKbWVx9HvL9etXO6BgvTHprK85BWBK42oOsqZmn7fmwC9PIFmv
	i2ka/XA3C7uSn9ukvHuqYknw99CmDcwAvdPw1vvL0qTwvm8SRSTcwXsNqY2Qa97smaD
	GI8nWJhWSArVKssLxmZSJ3wHT0SixMxcwXldp/N8=
Content-Type: multipart/mixed; boundary="===============5448586784713959106=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-headers: upgrading to 1.4.304.1 SUCCEEDED
Message-ID: <0101019551745d0b-77cc6fda-4688-4884-b9f5-0e5ff3538cc4-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212158

--===============5448586784713959106==
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
From 55e9801d7b4287476d5da013464e7fe5c1176845 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 10:11:41 +0000
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


--===============5448586784713959106==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-headers-upgrade-1.3.296.0-1.4.304.1.patch"

RnJvbSA1NWU5ODAxZDdiNDI4NzQ3NmQ1ZGEwMTM0NjRlN2ZlNWMxMTc2ODQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAxMDoxMTo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi1oZWFkZXJzOiB1cGdyYWRlIDEuMy4yOTYuMCAtPiAxLjQuMzA0LjEKCi0tLQogLi4ue3Z1
bGthbi1oZWFkZXJzXzEuMy4yOTYuMC5iYiA9PiB2dWxrYW4taGVhZGVyc18xLjQuMzA0LjEuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2FuLWhlYWRlcnNfMS4zLjI5
Ni4wLmJiID0+IHZ1bGthbi1oZWFkZXJzXzEuNC4zMDQuMS5iYn0gKDk1JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yOTYuMC5i
YiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLWhlYWRlcnNfMS40LjMwNC4x
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy92dWxrYW4vdnVsa2FuLWhlYWRlcnNfMS4zLjI5Ni4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuNC4zMDQuMS5iYgppbmRleCA2OGY4
ZjViMGExLi43MzkzMDVjMGQ5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVs
a2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yOTYuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuNC4zMDQuMS5iYgpAQCAtMTEsNyArMTEsNyBAQCBM
SUNFTlNFID0gIkFwYWNoZS0yLjAgJiBNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFLm1kO21kNT0xYmMzNTVkOGM0MTk2Zjc3NGM4Yjg3ZWQxYThkZDYyNSIKIFNSQ19VUkkg
PSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvVnVsa2FuLUhlYWRlcnMuZ2l0O2JyYW5j
aD1tYWluO3Byb3RvY29sPWh0dHBzIgogCi1TUkNSRVYgPSAiMjlmOTc5ZWU1YWE1OGI3YjAwNWY4
MDVlYThkZjdhODU1YzM5ZmYzNyIKK1NSQ1JFViA9ICJkNGExOTZkOGM4NGUwMzJkMjdmOTk5YWRj
ZWEzMDc1NTE3YzFjOTdmIgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCi0tIAoyLjQ0LjEKCg==

--===============5448586784713959106==
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
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: PKGV changed from 1.3.296.0 [default] to 1.4.304.1 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: PV changed from "1.3.296.0" to "1.4.304.1"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: FILELIST: added "/usr/include/vk_video/vulkan_video_codec_av1std_encode.h"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: PKGSIZE changed from 15470664 to 16217114 (+5%)
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-doc: PKGV changed from 1.3.296.0 [default] to 1.4.304.1 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-doc: PV changed from "1.3.296.0" to "1.4.304.1"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-locale: PKGV changed from 1.3.296.0 [default] to 1.4.304.1 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-locale: PV changed from "1.3.296.0" to "1.4.304.1"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-src: PKGV changed from 1.3.296.0 [default] to 1.4.304.1 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-src: PV changed from "1.3.296.0" to "1.4.304.1"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-staticdev: PKGV changed from 1.3.296.0 [default] to 1.4.304.1 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-staticdev: PV changed from "1.3.296.0" to "1.4.304.1"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: PKGV changed from 1.3.296.0 [default] to 1.4.304.1 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: PV changed from "1.3.296.0" to "1.4.304.1"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 12762298 to 13314354 (+4%)

--===============5448586784713959106==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/vulkan-headers (sysroot):
  /usr/include/vk_video/vulkan_video_codec_av1std_encode.h was added
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: FILELIST: added "/usr/include/vk_video/vulkan_video_codec_av1std_encode.h"

--===============5448586784713959106==--

