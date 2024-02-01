Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B56C48BF7
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:16 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.2167.1706810407702328640
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=I09adbx+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=YKTRfoNi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018d65d3f82b-dcc4a112-507d-4fbd-be92-6549bef24279-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SIHvqOepAyU1OchbMMXIEKzRcl7APuxt79VR2EVKMiI=;
	b=I09adbx+J4FfRkEraheSQE9QxD7L3qoG+jnkEhU6fpgMbc3b+EK5eo0WKzI1+Ae4
	oTAbDNRW97DHhdJ4pVfQW5MLGaxKy7E9ARjezoUA0xf0kevtqeZwC3kWURogaH48Cyb
	ufaqEkv87FjCkYVUED4UikrRIR14SaeX5CTVlJBU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SIHvqOepAyU1OchbMMXIEKzRcl7APuxt79VR2EVKMiI=;
	b=YKTRfoNiyXHsKkdTybgg2t2L1nLO1G9Be9lRwMY00/NFFvZn1/FEMvGFFi4V0nGQ
	zqPb2KbhrSOE+hQ9Xe7chapMGLwz7uV122A3BbD5jhnsIrVYSahpBeZ/f3gCtvjJNvK
	fRF6GH2VVdgsAzlwPzOSY39vV8LCkb+Asx++IVZw=
Content-Type: multipart/mixed; boundary="===============0330080517184404993=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2023.8 FAILED
Message-ID: <0101018d65d3f82b-dcc4a112-507d-4fbd-be92-6549bef24279-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194689

--===============0330080517184404993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *shaderc* to *2023.8* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe shaderc failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1849 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-d6611caf3eacd91b3e4727e087604f796c7e742c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d6611caf3eacd91b3e4727e087604f796c7e742c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto e6edd6d48fa5bdd9d176794c6810fae7f8e938e1
WARNING: Command 'git rebase e6edd6d48fa5bdd9d176794c6810fae7f8e938e1' failed:
Auto-merging glslc/CMakeLists.txt
CONFLICT (content): Merge conflict in glslc/CMakeLists.txt
Auto-merging libshaderc/CMakeLists.txt
CONFLICT (content): Merge conflict in libshaderc/CMakeLists.txt
Auto-merging libshaderc/README.md
CONFLICT (content): Merge conflict in libshaderc/README.md
Auto-merging libshaderc_util/CMakeLists.txt
CONFLICT (content): Merge conflict in libshaderc_util/CMakeLists.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/shaderc
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/shaderc/shaderc_2023.8.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0330080517184404993==--

