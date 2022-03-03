Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7547AC4707A
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 17:42:26 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web12.13956.1646329345441828667
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 09:42:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Di0+po17;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 0101017f50e031de-46887ebe-4be9-46ba-85f3-30698dabc3af-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1646329344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=enMD3iOpUnkxgn0kRnq+nt3s4gU2FgwMZnlNBV21ThA=;
	b=Di0+po171tIXXUJuqkNAHnz50MIw6cNfJK/A6sf4hLjVpE023KqGdPLk2WcKnnlB
	rGN0FepIUiGPwQlSHdVwx78lYli9hjkWlUpzLariBlzpvuamoFPtCpspQn8hMoYkigy
	KF/VoV+KU1FuQn8h+TTGu3yXCHu20qm8vImMdXOI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1646329344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=enMD3iOpUnkxgn0kRnq+nt3s4gU2FgwMZnlNBV21ThA=;
	b=TjMNIjALadtcx3lRsW7LS9CdMPID2GnkMSMz8O2KktZV4ihGcwbcEZUXP5WT7yIB
	6X4OJakx5sbX83Nmqpep556ak+lE0wBDZC64o968IfNRA/7SmafOYW0JxGEZYoOAq97
	dh0i3ZRuIOehO/pZ8zMzH7t3kF6HNUzJ6KluKI1M=
Content-Type: multipart/mixed; boundary="===============0137326007230346794=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-headers: upgrading to 1.3.204.1 SUCCEEDED
Message-ID: 
 <0101017f50e031de-46887ebe-4be9-46ba-85f3-30698dabc3af-000000@us-west-2.amazonses.com>
Date: Thu, 3 Mar 2022 17:42:24 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.03-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 17:42:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162692

--===============0137326007230346794==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-headers* to *1.3.204.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-headers-upgrade-1.3.204.0-1.3.204.1.patch
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
--===============0137326007230346794==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-vulkan-headers-upgrade-1.3.204.0-1.3.204.1.patch"

From db2e25da3a93001fc4fb4548a7ea03ba7230e8b9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 3 Mar 2022 16:27:23 +0000
Subject: [PATCH] vulkan-headers: upgrade 1.3.204.0 -> 1.3.204.1

---
 .../{vulkan-headers_1.3.204.0.bb => vulkan-headers_1.3.204.1.bb}  | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.3.204.0.bb => vulkan-headers_1.3.204.1.bb} (100%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb
similarity index 100%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb
-- 
2.27.0


--===============0137326007230346794==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vulkan-headers: PV changed from "1.3.204.0" to "1.3.204.1"
packages/core2-32-poky-linux/vulkan-headers: PKGV changed from 1.3.204.0 [default] to 1.3.204.1 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dbg: PV changed from "1.3.204.0" to "1.3.204.1"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dbg: PKGV changed from 1.3.204.0 [default] to 1.3.204.1 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PV changed from "1.3.204.0" to "1.3.204.1"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-dev: PKGV changed from 1.3.204.0 [default] to 1.3.204.1 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-doc: PV changed from "1.3.204.0" to "1.3.204.1"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-doc: PKGV changed from 1.3.204.0 [default] to 1.3.204.1 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-locale: PV changed from "1.3.204.0" to "1.3.204.1"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-locale: PKGV changed from 1.3.204.0 [default] to 1.3.204.1 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-src: PV changed from "1.3.204.0" to "1.3.204.1"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-src: PKGV changed from 1.3.204.0 [default] to 1.3.204.1 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-staticdev: PV changed from "1.3.204.0" to "1.3.204.1"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers-staticdev: PKGV changed from 1.3.204.0 [default] to 1.3.204.1 [default]
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PV changed from "1.3.204.0" to "1.3.204.1"
packages/core2-32-poky-linux/vulkan-headers/vulkan-headers: PKGV changed from 1.3.204.0 [default] to 1.3.204.1 [default]

--===============0137326007230346794==--

