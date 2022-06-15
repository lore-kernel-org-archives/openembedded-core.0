Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD875CCA486
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:03:45 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.4420.1655298221479653195
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=i3StCdn6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 0101018167766721-c748c53a-4172-47d5-a74f-a0cf43e40599-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1655298221;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=j+Q3aptU90DShYc7x+ecePWkdXXV2iM18EdUBlEQ+E0=;
	b=i3StCdn6/GZqLXhBboOmEohV9/hY3HOSnCmzj4N0b4AjVZXf7yvR6p6qhf79yVSR
	DxttlpR1YUEvR/XcW9+nGhbEG7HqNq+wRjUh1gL+cq24qiCBj2iHn95+pKEdS/IG1Mu
	RuUrUHzedDhQv4puzKN01ku7fjs5T5M8MtUDNJFA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1655298221;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=j+Q3aptU90DShYc7x+ecePWkdXXV2iM18EdUBlEQ+E0=;
	b=j/1S8aqh9cH0k64FZYiZTYJZgL7JzVICro7A9fiwr4F8nVyspzMQcf2R8jxA0N09
	HdEbmZDrQmdHADu+NCuabjx7egzgQh6OT6zzOjJKLChDqJq8F3CkW5EZgtv/FxOIwPx
	KitE5272sFoTVxLGhNBpu/LlaI/yet/JVh/3f2LA=
Content-Type: multipart/mixed; boundary="===============0212350113627468051=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libx11: upgrading to 1.8.1 SUCCEEDED
Message-ID: 
 <0101018167766721-c748c53a-4172-47d5-a74f-a0cf43e40599-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jun 2022 13:03:41 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:03:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166970

--===============0212350113627468051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libx11* to *1.8.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libx11-upgrade-1.8-1.8.1.patch
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
--===============0212350113627468051==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libx11-upgrade-1.8-1.8.1.patch"

From d6060720bff9f4a0f67d61918ca0d0422955be1b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jun 2022 12:28:13 +0000
Subject: [PATCH] libx11: upgrade 1.8 -> 1.8.1

---
 .../xorg-lib/{libx11_1.8.bb => libx11_1.8.1.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.8.bb => libx11_1.8.1.bb} (94%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.bb b/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb
similarity index 94%
rename from meta/recipes-graphics/xorg-lib/libx11_1.8.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb
index 6d5a8626d6..1dcc3abee9 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb
@@ -16,7 +16,7 @@ SRC_URI = "${XORG_MIRROR}/individual/lib/${XORG_PN}-${PV}.tar.xz"
 
 SRC_URI += "file://disable_tests.patch \
            "
-SRC_URI[sha256sum] = "081bf42ebab023aa92cfdb20c7af8c5ae13d13e88a5e22f90f4453ef80bbdde4"
+SRC_URI[sha256sum] = "1bc41aa1bbe01401f330d76dfa19f386b79c51881c7bbfee9eb4e27f22f2d9f7"
 
 PROVIDES = "virtual/libx11"
 
-- 
2.31.1


--===============0212350113627468051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libx11: SRC_URI changed from "https://www.x.org/releases//individual/lib/libX11-1.8.tar.xz file://disable_tests.patch" to "https://www.x.org/releases//individual/lib/libX11-1.8.1.tar.xz file://disable_tests.patch"
packages/core2-32-poky-linux/libx11: PV changed from "1.8" to "1.8.1"
packages/core2-32-poky-linux/libx11: PKGV changed from 1.8 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libx11/libx11-dbg: PV changed from "1.8" to "1.8.1"
packages/core2-32-poky-linux/libx11/libx11-dbg: PKGV changed from 1.8 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libx11/libx11-dbg: PKGSIZE changed from 10900732 to 10901796 (+0%)
packages/core2-32-poky-linux/libx11/libx11-dev: PV changed from "1.8" to "1.8.1"
packages/core2-32-poky-linux/libx11/libx11-dev: PKGV changed from 1.8 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libx11/libx11-dev: PKGSIZE changed from 251569 to 251573 (+0%)
packages/core2-32-poky-linux/libx11/libx11-doc: PV changed from "1.8" to "1.8.1"
packages/core2-32-poky-linux/libx11/libx11-doc: PKGV changed from 1.8 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libx11/libx11-doc: PKGSIZE changed from 1995971 to 1996741 (+0%)
packages/core2-32-poky-linux/libx11/libx11-locale: PV changed from "1.8" to "1.8.1"
packages/core2-32-poky-linux/libx11/libx11-locale: PKGV changed from 1.8 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libx11/libx11-src: PV changed from "1.8" to "1.8.1"
packages/core2-32-poky-linux/libx11/libx11-src: PKGV changed from 1.8 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libx11/libx11-staticdev: PV changed from "1.8" to "1.8.1"
packages/core2-32-poky-linux/libx11/libx11-staticdev: PKGV changed from 1.8 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libx11/libx11-xcb: PV changed from "1.8" to "1.8.1"
packages/core2-32-poky-linux/libx11/libx11-xcb: PKGV changed from 1.8 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/libx11/libx11: PV changed from "1.8" to "1.8.1"
packages/core2-32-poky-linux/libx11/libx11: PKGV changed from 1.8 [default] to 1.8.1 [default]

--===============0212350113627468051==--

