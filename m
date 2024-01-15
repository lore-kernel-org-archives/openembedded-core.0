Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32377C48277
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:33:59 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.88871.1705340031516801782
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=E3Jq7pz4;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=I5MOm91i;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018d0e2fcf13-df8f577b-0ed3-48bf-b91e-ea98182ddc8e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340030;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=l9Op4KX57ZDlP8ZMLJX4+ty0mLqf8EZfvRgAV8u5HHo=;
	b=E3Jq7pz4E7jg6bzaypFJfbMYThdHkfq9I6GN/kfaCDWssGv1qeBh00RRzzV0cRmx
	GJyDm5y+UHYHS5m8j4D4Xd5uUZMBmxlTg2xpo2ZLOrDuOSZmtsRKXfb5gdWAEHkujCI
	vCaiB4M7ApRtCfjQA/q/5YiHHmytsVh/9qazIAD0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340030;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=l9Op4KX57ZDlP8ZMLJX4+ty0mLqf8EZfvRgAV8u5HHo=;
	b=I5MOm91iDjMOe+Ei1y32xTzDB0+2czRmFrTbIH/hv1SftFkjHKi+Y2Gj7WAMMQf3
	a34IJgCxzOjUXRon73GsskJNlCbrueHSKu4cMH+oeBdN17gvhEbpWxMeQpJXODcRin7
	YFAsWjXzJmSP13+BdDYMBlZfG3yVP6tWcjmltQMY=
Content-Type: multipart/mixed; boundary="===============4955495496179818661=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 d9a6b1069f8008e83a74ae6c08fc7b0235aa2830 FAILED
Message-ID: <0101018d0e2fcf13-df8f577b-0ed3-48bf-b91e-ea98182ddc8e-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:33:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193766

--===============4955495496179818661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-samples* to *d9a6b1069f8008e83a74ae6c08fc7b0235aa2830* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe vulkan-samples failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1850 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-fc3e14ac6765e671f7ba65634cf52807f64d254a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:fc3e14ac6765e671f7ba65634cf52807f64d254a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto d9a6b1069f8008e83a74ae6c08fc7b0235aa2830
WARNING: Command 'git rebase d9a6b1069f8008e83a74ae6c08fc7b0235aa2830' failed:
Failed to merge submodule third_party/spdlog
CONFLICT (submodule): Merge conflict in third_party/spdlog
Recursive merging with submodules currently only supports trivial cases.
Please manually handle the merging of each conflicted submodule.
This can be accomplished with the following steps:
 - go to submodule (third_party/spdlog), and either merge commit 637a6feb
   or update to an existing commit which has merged those changes
 - come back to superproject and run:

      git add third_party/spdlog

   to record the above merge or update
 - resolve any other conflicts in the superproject
 - commit the resulting index in the superproject

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool onto f55f67fd3c5a9f9208ab9e646b02ff11917fa4ce
INFO: Rebasing devtool onto 437e135dbd94eb65b45533d9ce8ee28b5bd37b6d
INFO: Rebasing devtool onto 4861c3db1ca50eb5f5767d95d1cd1bacb98ac8a5
INFO: Rebasing devtool onto a6c48261d4fb62b232c46277acbcc3d14d5b7e14
INFO: Rebasing devtool onto 8f470597d625ae28758c16b4293dd42d63e8a83a
INFO: Rebasing devtool onto fce2abd01ce21063bd25ba67c9318be83bf48813
INFO: Rebasing devtool onto 6d41bb9c557c5a0eec61ffba1f775dc5f717a8f7
INFO: Rebasing devtool onto 5a0c3d0b527bea96154998f29177f3b449cebd3a
INFO: Rebasing devtool onto c23a19c26fa9cc778f755e76799f0cafdcb5a13b
INFO: Rebasing devtool onto 6a38a0694b4d73d22c5d1e22f865d03545e808ea
INFO: Rebasing devtool onto 5e3df1cf058074145c6bc71e3e7cfc4314796b5c
INFO: Rebasing devtool onto 7e635fca68d014934b4af8a1cf874f63989352b7
WARNING: Command 'git rebase 7e635fca68d014934b4af8a1cf874f63989352b7' failed:
Auto-merging include/spdlog/details/os.h
CONFLICT (content): Merge conflict in include/spdlog/details/os.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool onto 7512345f61e5f9b543ebb87df678f3fe7735587b
INFO: Rebasing devtool onto 2c2908f50515dcd939f24be261c3ccbcd277bb49
INFO: Rebasing devtool onto c0d0251e2c7f2273a894aa1b125af9313a88eae4
INFO: Rebasing devtool onto f9921aefddee2437cc2e3303d3175bd8ef23e22c
INFO: Rebasing devtool onto 623a5504a9eb9314d9c18ba36d64ef3208c215a1
INFO: Rebasing devtool onto 4f51aac14f65629dfe83702b806f740dbd7bd701
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/vulkan-samples
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/vulkan-samples/vulkan-samples_git.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4955495496179818661==--

