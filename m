Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B20D3CCA473
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:46 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.7622.1685693431477013554
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QhOG8scj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101887b287b1b-a49aef34-48af-4674-b721-c80d988720a7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693430;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=t9vOAJWeZeFo0WgJMH8hmVbkQyycXScxrOUBRfRK43w=;
	b=QhOG8scjZFIP7TFG+RjnwkGXpV5epJb1ZkZDHrnmyjNynstBg9mXb58QwA4xGN2S
	6qVbHI9ckHLG02ruq9YelCiPYdjBcKFlaDuWAS4k+8+7Tw7OzmALSPq7qEyK0LgYGPX
	/6ddQbAYpsVugQoPMQciawTlAeRs6TRVTgoDh9rg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693430;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=t9vOAJWeZeFo0WgJMH8hmVbkQyycXScxrOUBRfRK43w=;
	b=NYURuplSsHt4ciTr6Je9wDr0S+piksY4Z5+39OT5g/Afo/PYQfIVitrI2/M1Hsrw
	YNv3GcNAAxo/Un+DNDkL8wSgaVgSeXfggDNPqr4h/ei8fp0bcgs24F4XW6HDJm/taLA
	3mmdCKbdk09KIufIRUTrDF+vAxRK7gN/NeLirxh8=
Content-Type: multipart/mixed; boundary="===============7214468412629561309=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ovmf: upgrading to edk2-stable202305 FAILED
Message-ID: <010101887b287b1b-a49aef34-48af-4674-b721-c80d988720a7-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:30 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182160

--===============7214468412629561309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ovmf* to *edk2-stable202305* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe ovmf failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Previous bitbake instance shutting down?, waiting to retry... (08:35:19.178020)
NOTE: Directory listing: ['sstate-cache', 'downloads', 'bitbake-cookerdaemon.log', 'tmp', 'conf', 'workspace', 'upgrade-helper', 'buildhistory', 'cache']
NOTE: Retrying server connection (#1)... (08:35:19.362014)
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1801 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:054b4b9ca8e51157c3c7f02f1db32539fe8c0110"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto ba91d0292e593df8528b66f99c1b0b14fadc8e16
WARNING: Command 'git rebase ba91d0292e593df8528b66f99c1b0b14fadc8e16' failed:
Auto-merging BaseTools/Source/C/Makefiles/header.makefile
CONFLICT (content): Merge conflict in BaseTools/Source/C/Makefiles/header.makefile

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/ovmf
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/ovmf/ovmf_git.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7214468412629561309==--

