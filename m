Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E055C064F9
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:12 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.8503.1698848706448771654
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MalZ7zya;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CbpcXqZ0;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.29, mailfrom: 0101018b8b460d17-a6e66990-7ac0-430e-a05f-0242fa186aa2-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848706;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WzEkbBqce9fgMKJtQnCwkRNZ1Ug/sWB4k/iFxkQqukc=;
	b=MalZ7zyaLdW4xhNK00zxkz8qhOdfb9khiPViG7Ur3byn4XHy5Sf0btD+RgLweOSx
	znK3yVu4pC3vtP2/zn7DDN4BY79fAOXSRcqdtJVWLLKKzsbgY5wfCG6orTrWi8I4ERF
	GyjRuEidO+aLQmoWORqapXQshAt/TQj4i2d3NjEo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848706;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WzEkbBqce9fgMKJtQnCwkRNZ1Ug/sWB4k/iFxkQqukc=;
	b=CbpcXqZ0FmVzHt88zSBy+2oRmhd5oRB/xERfZTEv3vG9GocMzUQ2iumsLOuITfbB
	wiMeQp8KI7pvWx2k4hdSL633eY1zgp8Y0oK7NzLZI3IDo28TjcYQBy8lnMAkg8HvXm8
	hf+Ey6O6hLEpA4QMUmyDYlUE8LElqzX0lsLQRWZ0=
Content-Type: multipart/mixed; boundary="===============0176418651676856243=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-validation-layers: upgrading to 1.3.268.0 FAILED
Message-ID: <0101018b8b460d17-a6e66990-7ac0-430e-a05f-0242fa186aa2-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190019

--===============0176418651676856243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-validation-layers* to *1.3.268.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe vulkan-validation-layers failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (13:20:19.344831)
Loading cache...done.
Loaded 1842 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-0c4169c2145802e0b88588951c8d5c4b5724c74c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0c4169c2145802e0b88588951c8d5c4b5724c74c"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 2 Local 2 Mirrors 0 Missed 0 Current 28 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
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
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/vulkan-validation-layers
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/vulkan-validation-layers/vulkan-validation-layers_1.3.268.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0176418651676856243==--

