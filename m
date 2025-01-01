Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E0AE7719E
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 09:32:35 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.11500.1735723951899710580
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 01:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=doCue4tI;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=C5OtweGJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101942135a3ea-66e745b6-6b44-4b13-b2e5-150c565e9bd9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1735723951;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Zfsr2yhCTXQif/IaKwcyBkPT6IePxaciiboNCCu+Gvs=;
	b=doCue4tIJIAUGQMit3VrAdg7ihdr8+0vOM7sSBnOJuHOnL8S2EPgiMqmlPPKf/hj
	PeCEHoE8LrxjIDMBViYyNeSFi/WxuP7HtwF24uXqwpAzpeqS9csyO/15n86KAAoisRj
	/oNaKXAIsYK7eXjlnD0BOyfBI4U/JBKyR5iW3gbM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1735723951;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Zfsr2yhCTXQif/IaKwcyBkPT6IePxaciiboNCCu+Gvs=;
	b=C5OtweGJu03aVLB+qw0p4Y9UkjmrdjWH8CvHw48lzUXZrW1d0oP+kJOK+Ys/0i8r
	t8Srj1WsE13TuHSx9A/igtP61R2U9l51OOyHd8SZEquyKIOJFfnzPOuPAkfLRreUro+
	R/4tOuxtmLpyjTGo6GlM8OEFbtPy/ObWnbruqsWA=
Content-Type: multipart/mixed; boundary="===============0820905392639903390=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] procps: upgrading to 4.0.5 FAILED
Message-ID: <010101942135a3ea-66e745b6-6b44-4b13-b2e5-150c565e9bd9-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jan 2025 09:32:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jan 2025 09:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209230

--===============0820905392639903390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *procps* to *4.0.5* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe procps failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1875 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ff3540d6756fd098144bfea8b0996a5170b590eb"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto f46b2f7929cdfe2913ed0a7f585b09d6adbf994e
WARNING: Command 'git rebase f46b2f7929cdfe2913ed0a7f585b09d6adbf994e' failed:
Auto-merging configure.ac
CONFLICT (content): Merge conflict in configure.ac
Auto-merging src/pgrep.c
CONFLICT (content): Merge conflict in src/pgrep.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/procps
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/procps/procps_4.0.5.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0820905392639903390==--

