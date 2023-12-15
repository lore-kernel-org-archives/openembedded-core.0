Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D229C47422
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 14:17:51 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.63136.1702649863339255368
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 06:17:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CljIYehz;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Hpb7HRK8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018c6dd72e50-34411fb6-f1ad-4f58-8837-25a01dddab70-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1702649867;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Xak4mwq6BR/qlyepD5Fs0MhS7giClsBoXVoP5H+tLZM=;
	b=CljIYehzw0QVFe9K/8py0ZZb17gVXu782o5CHFLuPoarbJkubdbvPy22di5h/WIQ
	FrsLsrJvEoVU2ykS+Q+EFi8ZPg2FjntUi/qnpFBoEapMsahbmeL9b46JG9xnt44KM6t
	sT29Ll3ctvA6SFq8pYxKH07+qog0xFcIEPnDz1Wc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1702649867;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Xak4mwq6BR/qlyepD5Fs0MhS7giClsBoXVoP5H+tLZM=;
	b=Hpb7HRK8ZT6wWWB39/9QH8qQXkZwmG/GC27GrRRJg5XBpf2FCeEAf6plT//aslO2
	MrWI8E1HT62B8iX7mihmk1ALkouVyYYUjzh0iTNiOeGyRJgpXFWYhMbnVEB8iM08bk/
	NjJWbyoz5JBPn1iWI2MsdQDB4fHxTFoCuIYVes+A=
Content-Type: multipart/mixed; boundary="===============2413418064054992557=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 2be6f826269be1731cf9f8631b4f4d97364164f8 FAILED
Message-ID: <0101018c6dd72e50-34411fb6-f1ad-4f58-8837-25a01dddab70-000000@us-west-2.amazonses.com>
Date: Fri, 15 Dec 2023 14:17:47 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 14:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192498

--===============2413418064054992557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-samples* to *2be6f826269be1731cf9f8631b4f4d97364164f8* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe vulkan-samples failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1842 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-cf470c5b663c79fa6d930dcbe6a37b93674afb59"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:cf470c5b663c79fa6d930dcbe6a37b93674afb59"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 2be6f826269be1731cf9f8631b4f4d97364164f8
WARNING: Command 'git rebase 2be6f826269be1731cf9f8631b4f4d97364164f8' failed:
Failed to merge submodule third_party/spdlog
CONFLICT (submodule): Merge conflict in third_party/spdlog
Recursive merging with submodules currently only supports trivial cases.
Please manually handle the merging of each conflicted submodule.
This can be accomplished with the following steps:
 - go to submodule (third_party/spdlog), and either merge commit 81ac86e9
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
--===============2413418064054992557==--

