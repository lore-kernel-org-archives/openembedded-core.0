Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA460C282C7
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:14 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.42642.1738416063598157238
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:21:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=GYcejgbz;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=RCI5SJSd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010194c1ac0c17-bff7d1f3-41af-4e91-bdfd-0c66c1b6b65a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416065;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=V8qSs7Y2WhiwLEij7YbgfctoUJuumnfKMdITyJzCg5Q=;
	b=GYcejgbzBz7w9ZeuqPns5G+0aN+xh9tZ1MZMhgKH+9jfBtcMu8PvAiVF36g2KAKc
	drZNv7PmIaPb7AVouj/kch/1YqdF79/dJBO4dcsGfD40/lJyJk/9AU43NG1BkdYEFIa
	cd9juGw+uHs/sOuD1AfJTTyH1HqCoWacRryqoIR8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416065;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=V8qSs7Y2WhiwLEij7YbgfctoUJuumnfKMdITyJzCg5Q=;
	b=RCI5SJSd4Y85W7yjEpwhu3A3FsAaJkvDLUgAkvNFhPZYGvYd4aAG9wONT8FVwfvW
	GTKgqPh55m0myGOAW6M57wA3OUYVNPtwdCV8O14vbeN09gB+I+oFvQjlPvB40mRbib3
	ud5rfSPqJXYriU2Vy3t749bku5nYQ5pZFxQK9sNk=
Content-Type: multipart/mixed; boundary="===============7886479430105463891=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-headers: upgrading to 1.4.304.0 SUCCEEDED
Message-ID: <01010194c1ac0c17-bff7d1f3-41af-4e91-bdfd-0c66c1b6b65a-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:21:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210581

--===============7886479430105463891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-headers* to *1.4.304.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-headers-upgrade-1.3.296.0-1.4.304.0.patch
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
From 0042b2f3c9f7abb519f981ecf74d03429dddc2d7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 11:56:40 +0000
Subject: [PATCH] vulkan-headers: upgrade 1.3.296.0 -> 1.4.304.0

---
 ...{vulkan-headers_1.3.296.0.bb => vulkan-headers_1.4.304.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.3.296.0.bb => vulkan-headers_1.4.304.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.304.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.4.304.0.bb
index 68f8f5b0a1..739305c0d9 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.304.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1bc355d8c4196f774c8b87ed1a8dd625"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "29f979ee5aa58b7b005f805ea8df7a855c39ff37"
+SRCREV = "d4a196d8c84e032d27f999adcea3075517c1c97f"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.1


--===============7886479430105463891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/vulkan-headers: PKGV changed from 1.3.296.0 [default] to 1.4.304.0 [default]
packages/core2-64-poky-linux/vulkan-headers: PV changed from "1.3.296.0" to "1.4.304.0"
Changes to packages/core2-64-poky-linux/vulkan-headers (sysroot):
  /usr/include/vk_video/vulkan_video_codec_av1std_encode.h was added
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dbg: PKGV changed from 1.3.296.0 [default] to 1.4.304.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dbg: PV changed from "1.3.296.0" to "1.4.304.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: FILELIST: added "/usr/include/vk_video/vulkan_video_codec_av1std_encode.h"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: PKGV changed from 1.3.296.0 [default] to 1.4.304.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: PKGSIZE changed from 15470664 to 16217114 (+5%)
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: PV changed from "1.3.296.0" to "1.4.304.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-doc: PKGV changed from 1.3.296.0 [default] to 1.4.304.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-doc: PV changed from "1.3.296.0" to "1.4.304.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-locale: PKGV changed from 1.3.296.0 [default] to 1.4.304.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-locale: PV changed from "1.3.296.0" to "1.4.304.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-src: PKGV changed from 1.3.296.0 [default] to 1.4.304.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-src: PV changed from "1.3.296.0" to "1.4.304.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-staticdev: PKGV changed from 1.3.296.0 [default] to 1.4.304.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-staticdev: PV changed from "1.3.296.0" to "1.4.304.0"
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: PKGV changed from 1.3.296.0 [default] to 1.4.304.0 [default]
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 12762298 to 13314354 (+4%)
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers: PV changed from "1.3.296.0" to "1.4.304.0"

--===============7886479430105463891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/vulkan-headers (sysroot):
  /usr/include/vk_video/vulkan_video_codec_av1std_encode.h was added
packages/core2-64-poky-linux/vulkan-headers/vulkan-headers-dev: FILELIST: added "/usr/include/vk_video/vulkan_video_codec_av1std_encode.h"

--===============7886479430105463891==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-headers-upgrade-1.3.296.0-1.4.304.0.patch"

RnJvbSAwMDQyYjJmM2M5ZjdhYmI1MTlmOTgxZWNmNzRkMDM0MjlkZGRjMmQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAxMTo1Njo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi1oZWFkZXJzOiB1cGdyYWRlIDEuMy4yOTYuMCAtPiAxLjQuMzA0LjAKCi0tLQogLi4ue3Z1
bGthbi1oZWFkZXJzXzEuMy4yOTYuMC5iYiA9PiB2dWxrYW4taGVhZGVyc18xLjQuMzA0LjAuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2FuLWhlYWRlcnNfMS4zLjI5
Ni4wLmJiID0+IHZ1bGthbi1oZWFkZXJzXzEuNC4zMDQuMC5iYn0gKDk1JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yOTYuMC5i
YiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLWhlYWRlcnNfMS40LjMwNC4w
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy92dWxrYW4vdnVsa2FuLWhlYWRlcnNfMS4zLjI5Ni4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuNC4zMDQuMC5iYgppbmRleCA2OGY4
ZjViMGExLi43MzkzMDVjMGQ5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVs
a2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yOTYuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuNC4zMDQuMC5iYgpAQCAtMTEsNyArMTEsNyBAQCBM
SUNFTlNFID0gIkFwYWNoZS0yLjAgJiBNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFLm1kO21kNT0xYmMzNTVkOGM0MTk2Zjc3NGM4Yjg3ZWQxYThkZDYyNSIKIFNSQ19VUkkg
PSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvVnVsa2FuLUhlYWRlcnMuZ2l0O2JyYW5j
aD1tYWluO3Byb3RvY29sPWh0dHBzIgogCi1TUkNSRVYgPSAiMjlmOTc5ZWU1YWE1OGI3YjAwNWY4
MDVlYThkZjdhODU1YzM5ZmYzNyIKK1NSQ1JFViA9ICJkNGExOTZkOGM4NGUwMzJkMjdmOTk5YWRj
ZWEzMDc1NTE3YzFjOTdmIgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCi0tIAoyLjQ0LjEKCg==

--===============7886479430105463891==--

