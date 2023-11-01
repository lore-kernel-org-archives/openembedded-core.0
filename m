Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53900C16A69
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:15 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.8663.1698848705063740353
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LAYr2kuD;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qUgU8Tf9;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.45, mailfrom: 0101018b8b460792-0d3ea7c3-2faa-4cb4-9eb4-eff0e97b15a7-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848704;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=VF3aHn6GM+4z1NswOWCyDRGjOJwN598/PuK8X9sQavw=;
	b=LAYr2kuDWLlxLvewqinoC2zY84WrbzwLuL+FCtqmtdt122pIkygyyffvkCIkjn3b
	aZpvWBQja0sR/JvsCZoIqdh0bEo4e5beOYYhfxHbpDdUFqDxIh/CaqTyLi2c3wGXCyE
	045lVo01YY3vcadTdBm5xZsGy37Mrtkb8xgroTq0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848704;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=VF3aHn6GM+4z1NswOWCyDRGjOJwN598/PuK8X9sQavw=;
	b=qUgU8Tf9kNwqTI4aYQfbBokX1jeaAnDWrmNd9kUpQ9wWn5Mh3oBf17rR7o+kwuJV
	HY5cUu2/Xaj1unaPlIhuuw/RwAFJSzewQBwypzFq31DZgKL9JMo6R0aZouiUipn3zEz
	Do6/z7uNBJRV12xfv/sPoZvk3exiqT0hh4pOSNNQ=
Content-Type: multipart/mixed; boundary="===============4858794579636426537=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.39 FAILED
Message-ID: <0101018b8b460792-0d3ea7c3-2faa-4cb4-9eb4-eff0e97b15a7-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189961

--===============4858794579636426537==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *repo* to *2.39* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe repo failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (09:44:40.779371)
Loading cache...done.
Loaded 1843 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-6e38f57c8f0bc68ea564765af10ac63d64160ab3"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6e38f57c8f0bc68ea564765af10ac63d64160ab3"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 2 Local 2 Mirrors 0 Missed 0 Current 28 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto b99272c601bc5f466c3cfc782bb852c2c967ad27
WARNING: Command 'git rebase b99272c601bc5f466c3cfc782bb852c2c967ad27' failed:
Auto-merging repo
CONFLICT (content): Merge conflict in repo

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/repo
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/repo/repo_2.39.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4858794579636426537==--

