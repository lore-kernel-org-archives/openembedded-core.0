Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89773C369C5
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:24 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.18063.1743511388576499051
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Loe0d1t5;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=bpX/hE5+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010195f160945a-a14f09fd-82f1-4c47-a4a7-3746b3eff756-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZVNDIwGJMvQ+MOP5FbopUS21908GMaWxnCzjJA9IcrQ=;
	b=Loe0d1t5rWp1RcHd5Zf4gJ1QZfCjuDX22lcvXdlG1ubKMUixH0ag1rGnrPvolAYt
	SmUA8MsR+dRUl81T0HjmV/QXIrQtF3eHd+RjoczjqV1l53cYGBrwJERnBmc4zmMxd9p
	/4H8JZwFpLTskSnll5ZrIgotXDWzngMtud8MFHfE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZVNDIwGJMvQ+MOP5FbopUS21908GMaWxnCzjJA9IcrQ=;
	b=bpX/hE5+FHySq+qtFy1ucrl1bD+vmpuQwsekH7NSu6NIWSGn6wzOUntBr26lfCk6
	BYmFc+fFHxsNxfAtXtLWCnHUMct3CsPTJ2PldUEdNtCVWZ0Tw1GG8M6KuCvk/quat8b
	qeT6/wARmDvx5mT2ibNEiwwC1/fLrETCf6f8575Y=
Content-Type: multipart/mixed; boundary="===============0546583210058882349=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libdnf: upgrading to 0.74.0 FAILED
Message-ID: <01010195f160945a-a14f09fd-82f1-4c47-a4a7-3746b3eff756-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214047

--===============0546583210058882349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libdnf* to *0.74.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libdnf failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1886 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:2d8ace20ec409d26787ae9a9d450a4e451e5510a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 91a0bf9aada36a722855051526f012e0b5ab1af9
WARNING: Command 'git rebase 91a0bf9aada36a722855051526f012e0b5ab1af9' failed:
Auto-merging CMakeLists.txt
CONFLICT (content): Merge conflict in CMakeLists.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libdnf
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libdnf/libdnf_0.74.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0546583210058882349==--

