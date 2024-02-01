Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DBFC54EB7
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:20 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.2097.1706810405211298550
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SaSywwLH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=XODx6B3q;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018d65d3eed2-3282103f-3d7f-459e-ad25-340d5db83f3e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810404;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=ppgxs/aRqgrSk5T7dSDtZJywLaPcPNNVYRx8qfMKH6o=;
	b=SaSywwLHDXNVuq5WbopOmOVNbFMyNc1dxocvQ4GJMnW9NsWQvQPZdsSR3p47FZKd
	NGSaPK7w/gd3DO3+o/SualfuJ1KmV7+Tms4zf1M3EHRUQRCHmA3pcAwYwlc4xJsl9cS
	Fy5ovhGoIWIEdfbHEZneFfjB681cQFMlVQAu0S4g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810404;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=ppgxs/aRqgrSk5T7dSDtZJywLaPcPNNVYRx8qfMKH6o=;
	b=XODx6B3qY2jFDASbqzcX9a23MaNesOi5wiIQG6M7/CV/2JnQyc31luRKCqBWylqs
	33iGs/1WVT9AswJBr5XJvdqSed++EjgHHwEG84e0xMQP67bq498N91pV4bZuUtq9VvM
	uNBbj6mp13s6txrzwNSYFV7Bpc69uO5a3Ysm0PCo=
Content-Type: multipart/mixed; boundary="===============2836770558308363444=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] dpkg: upgrading to 1.22.4 FAILED
Message-ID: <0101018d65d3eed2-3282103f-3d7f-459e-ad25-340d5db83f3e-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194614

--===============2836770558308363444==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dpkg* to *1.22.4* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe dpkg failed.
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
DISTRO_VERSION       = "4.3+snapshot-ffc31e5529131836cd20c624185671a0c9d9bee0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ffc31e5529131836cd20c624185671a0c9d9bee0"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 4baf1e5485b6eaf4eb4347bfb9c4923fd2737488
WARNING: Command 'git rebase 4baf1e5485b6eaf4eb4347bfb9c4923fd2737488' failed:
Auto-merging data/ostable
Auto-merging data/tupletable
CONFLICT (content): Merge conflict in data/tupletable

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto 4baf1e5485b6eaf4eb4347bfb9c4923fd2737488
WARNING: Command 'git rebase 4baf1e5485b6eaf4eb4347bfb9c4923fd2737488' failed:
Auto-merging data/ostable
Auto-merging data/tupletable
CONFLICT (content): Merge conflict in data/tupletable

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/dpkg
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/dpkg/dpkg_1.22.4.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2836770558308363444==--

