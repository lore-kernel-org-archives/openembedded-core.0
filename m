Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D817C35280
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 17:42:26 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web09.13950.1646329344392980145
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 09:42:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=7WLLYIJd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 0101017f50e0321f-6ee0eefa-ba83-477e-8427-4a54527ed256-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1646329345;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=467lSmEXacZDW4X08hvzxkiQw5A4EXhsSCtq1ygTM6U=;
	b=7WLLYIJdb2SRRbYbszJ4N8EMBJlC4LJqqTzn5rCQp018Tq9BnyaicZmGw8uMsM+D
	3uOcDuuUwAlHYYEGOE/hF4KyPx8iahHPwlWNpepTB90ulCHIRdft5qWF0cbPKiy+5iP
	kF2Ur3ffKXQzAS8MBhiz39/s2sL5uPIY4zbeObxg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1646329345;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=467lSmEXacZDW4X08hvzxkiQw5A4EXhsSCtq1ygTM6U=;
	b=ZrFYOUqVdmz9lo85I58EL2ajzZpNCmTDHy1AxOeOLvarDh+fkYgANVtIsUr8atWa
	x9Ks207JMExxVoqoU8dBLtoh7EW/4J2C0fDxefLiKAlQcDMaUNPp3ZG9bwNRHKO/5+b
	aONabLdqkDHNEmNC2UPS8JXjQ1r+bqqiORE+vdRI=
Content-Type: multipart/mixed; boundary="===============7555463458265293148=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-tools: upgrading to 1.3.204.1 SUCCEEDED
Message-ID: 
 <0101017f50e0321f-6ee0eefa-ba83-477e-8427-4a54527ed256-000000@us-west-2.amazonses.com>
Date: Thu, 3 Mar 2022 17:42:24 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.03-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 17:42:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162691

--===============7555463458265293148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-tools* to *1.3.204.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-tools-upgrade-1.3.204.0-1.3.204.1.patch
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
--===============7555463458265293148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vulkan-tools: PV changed from "1.3.204.0" to "1.3.204.1"
packages/core2-32-poky-linux/vulkan-tools: PKGV changed from 1.3.204.0 [default] to 1.3.204.1 [default]
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-dbg: PV changed from "1.3.204.0" to "1.3.204.1"
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-dbg: PKGV changed from 1.3.204.0 [default] to 1.3.204.1 [default]
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-dev: PV changed from "1.3.204.0" to "1.3.204.1"
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-dev: PKGV changed from 1.3.204.0 [default] to 1.3.204.1 [default]
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-doc: PV changed from "1.3.204.0" to "1.3.204.1"
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-doc: PKGV changed from 1.3.204.0 [default] to 1.3.204.1 [default]
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-locale: PV changed from "1.3.204.0" to "1.3.204.1"
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-locale: PKGV changed from 1.3.204.0 [default] to 1.3.204.1 [default]
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-src: PV changed from "1.3.204.0" to "1.3.204.1"
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-src: PKGV changed from 1.3.204.0 [default] to 1.3.204.1 [default]
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-staticdev: PV changed from "1.3.204.0" to "1.3.204.1"
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-staticdev: PKGV changed from 1.3.204.0 [default] to 1.3.204.1 [default]
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools: PV changed from "1.3.204.0" to "1.3.204.1"
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools: PKGV changed from 1.3.204.0 [default] to 1.3.204.1 [default]

--===============7555463458265293148==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.3.204.0-1.3.204.1.patch"

From bf3474ae0e5e8206ed1ca56f007fff464a68c392 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 3 Mar 2022 16:38:03 +0000
Subject: [PATCH] vulkan-tools: upgrade 1.3.204.0 -> 1.3.204.1

---
 .../{vulkan-tools_1.3.204.0.bb => vulkan-tools_1.3.204.1.bb}      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.204.0.bb => vulkan-tools_1.3.204.1.bb} (100%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.204.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.204.1.bb
similarity index 100%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.204.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.3.204.1.bb
-- 
2.27.0


--===============7555463458265293148==--

