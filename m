Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55287C54FB6
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:14 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.14628.1700059030845660108
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cMj2RUoC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=OvPXvgfz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018bd36a2aa7-c4c53320-55a2-446b-acb0-8f9d360776d9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059032;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xuhIdq3vHC7m+46k6PfMS+CLIjQPpiwuAZtsqCLOipA=;
	b=cMj2RUoCSULXHI82pMFIGRLC3XdyBaaha9sYi4g2Gh1FgSTA8oQWtTeNKBOrCaLC
	WmHScAZea6BnSQAJ5n9wkAdwoKi6JW0ZWGfrKxrdQNWzem1BXBk5hpZcWNzFndPKNQj
	EZTYgWYNekQahCZR6gh7IVt+0ES74SVwBILZzzfo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059032;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xuhIdq3vHC7m+46k6PfMS+CLIjQPpiwuAZtsqCLOipA=;
	b=OvPXvgfzNn+8gkpcvtILO2WWOX/3xBmgkg5JEgwuZroM+FHty2I0TYaiphjVG+3Z
	h4AJjdvwKS/Kyql9Z1y+2kjampnY0Zm21H3z617bH7M7Ul5i+ICimo3yG27fvJbeSpG
	8XwBaleXAqYH8VbsBZXJBSHNIzFHszp8PaZPPH/4=
Content-Type: multipart/mixed; boundary="===============7154173418010383082=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-validation-layers: upgrading to 1.3.268.0 FAILED
Message-ID: <0101018bd36a2aa7-c4c53320-55a2-446b-acb0-8f9d360776d9-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190692

--===============7154173418010383082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-validation-layers* to *1.3.268.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe vulkan-validation-layers failed.
NOTE: Reconnecting to bitbake server...
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
DISTRO_VERSION       = "4.3+snapshot-46bedbfc2f637059401d09573493f49013bfc00a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:46bedbfc2f637059401d09573493f49013bfc00a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 3c64adb4e052062fc60b6580c365429fddfbcfbf
WARNING: Command 'git rebase 3c64adb4e052062fc60b6580c365429fddfbcfbf' failed:
Auto-merging tests/framework/binding.cpp
CONFLICT (content): Merge conflict in tests/framework/binding.cpp
Auto-merging tests/framework/binding.h
Auto-merging tests/framework/layer_validation_tests.h
CONFLICT (content): Merge conflict in tests/framework/layer_validation_tests.h
Auto-merging tests/framework/render.cpp
CONFLICT (content): Merge conflict in tests/framework/render.cpp
Auto-merging tests/framework/render.h
CONFLICT (content): Merge conflict in tests/framework/render.h
Auto-merging tests/unit/shader_object.cpp
CONFLICT (content): Merge conflict in tests/unit/shader_object.cpp
Auto-merging tests/unit/shader_object_positive.cpp
CONFLICT (content): Merge conflict in tests/unit/shader_object_positive.cpp

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/vulkan-validation-layers
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/vulkan-validation-layers/vulkan-validation-layers_1.3.268.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7154173418010383082==--

