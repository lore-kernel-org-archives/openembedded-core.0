Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B22BC83035
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:15:04 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.8874.1749993301246768195
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=xrgiQ+lR;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=CuBoSKav;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019773baa5d8-e8b94aba-e377-4e0a-a3de-597ecb31c679-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993301;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1QXQGsXFsk4y0Q18rYodkJT1+OELdjvySs8hgc4HEIQ=;
	b=xrgiQ+lR+OKD4lzO1qsr9jz2rRk1dusK2HeYbQU+7x76KAKUWKw2e6sPD34AN+Ym
	asiT0bqvBqME73YeU2rC+qdQjxisYwwZsu9/G6FG9KHKr8EySxCiPa/KbRJJtkZAL1X
	F/KWr2iqV5f3ep+w0q8ai7NEjvB41IKS1OEQDEYY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993301;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1QXQGsXFsk4y0Q18rYodkJT1+OELdjvySs8hgc4HEIQ=;
	b=CuBoSKavrRssq84T3pZtCccfqbqXzibsvNSRBd5Rlt68pDrTZK5MUrm1wloTyBZA
	boNKiBzx/6bt9OFjSf0p6yjQq40aOlny6wuljeAL4fOyZUk+kgJpBkrrThoL/WvbPpP
	0u7Lu8Q5yK0iqJUTAp2c5l68PqaAWy8PGX30GEuw=
Content-Type: multipart/mixed; boundary="===============7080672799053474757=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gst-examples: upgrading to 13.0.1 FAILED
Message-ID: <0101019773baa5d8-e8b94aba-e377-4e0a-a3de-597ecb31c679-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:15:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:15:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218729

--===============7080672799053474757==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gst-examples* to *13.0.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gst-examples failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1910 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:dbd3b654ac4af86cc3fa5685eea193b9d842a9dd"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 2b607442d9e49d3f1ba3882e5e5060d5967c8cd7
WARNING: Command 'git rebase 2b607442d9e49d3f1ba3882e5e5060d5967c8cd7' failed:
Auto-merging AUTHORS
Auto-merging COPYING
CONFLICT (add/add): Merge conflict in COPYING
Auto-merging NEWS

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/gst-examples
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/gst-examples/gst-examples_13.0.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7080672799053474757==--

