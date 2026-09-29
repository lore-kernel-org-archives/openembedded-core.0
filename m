Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63FB1CA5FBA
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 06:18:53 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1828.1790662721141627978
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 23:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PEw05sV8;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=rG2h/krj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a0ebd0bb1b-e2dfa265-1612-49b7-bd3c-d4724fa9c1e9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790662720;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=RK/u1ozK5ApEcG+JGTvVD5XHnhIeQ1O4vLYVnkJAk2M=;
	b=PEw05sV8wEyN0UtPvTxJ+0omUxAe5fkCSwe92Y+ui40tjYdIgBrBQFbgcQW4qSd2
	PC7lnvp5Txq2xuBqD24Sjz1FgpzIpeytCs2zZ6/UrSeMbyM8q5hiSbuwSTUECB0yeJE
	1+HmuEEptNFs1WALo4679rti2w3hruj+uaMXgbnI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790662720;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=RK/u1ozK5ApEcG+JGTvVD5XHnhIeQ1O4vLYVnkJAk2M=;
	b=rG2h/krjkwexOtt/4Gv9KzNRoAELN65xcM+2S/hkb9FXzxg0GCcUaIZQpLBVraoH
	37OIMxKKoO8PJKdaj/jrMYvDJ6b501grsrUX4f0qSpRBN8qgKP9y5z/fLvh14Wgs4/f
	mABRx7FMBqjEFrRQOrRdPlTSXMpROjrviXPawzqI=
Content-Type: multipart/mixed; boundary="===============6832287091209937918=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-loader: upgrading to 1.4.363.0 FAILED
Message-ID: <010101a0ebd0bb1b-e2dfa265-1612-49b7-bd3c-d4724fa9c1e9-000000@us-west-2.amazonses.com>
Date: Tue, 29 Sep 2026 06:18:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.29-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 06:18:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246824

--===============6832287091209937918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-loader* to *1.4.363.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-loader -V 1.4.363.0 -S fa218055ff4948b159f31d43f800c808a13d51df
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1991 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-3ff4fe21c9d23a3a4f5771fcdf7b18d147d85ec2"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:3ff4fe21c9d23a3a4f5771fcdf7b18d147d85ec2"
meta-yocto-bsp       
meta-poky            = "master:d36c827e02ab138b446386792fd7588b5a041507"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision fa218055ff4948b159f31d43f800c808a13d51df was found on multiple branches: 
  stabilized_release_2026_09
  vulkan-sdk-1.4.363
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6832287091209937918==--

