Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22695C3064E
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:13 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.174031.1692224344397052198
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Cnkntamv;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=occ4WF0P;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018a006e4e1c-9d4d8562-1f31-499e-9325-955b27db5f54-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1JGmxMJA3Hd2hMW3SdJcMkpKKAOE/t7O0uK660RG4u0=;
	b=CnkntamvWQC+aUojt/cnoRG1Bq5IyuVtsTSdPeH2rJC5kH7l630/w0+DG4SpKije
	XyC1iAaq5UqUnV59oQOXnO9OTnHDs6hbXrGe8NiI6dppHYY1U9hFb/Wno+OMiRk9JQO
	1r/FptvpauDLZeyPHMFHMzB4djeYzDiytsSf2CF0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1JGmxMJA3Hd2hMW3SdJcMkpKKAOE/t7O0uK660RG4u0=;
	b=occ4WF0PxXtwKR0cZFmjkM6Yn29hJR0t6kftwYpDzeJrO73TMB2xj3vrRoWV5tic
	HVeddgn6ryVOBA4EJrXuIGp+CHke/+dHrZcif6jQOtuAYKvlQZLSmSrBir/cPIx2994
	kxX4VxdUy+jaFEHtlNtDJX0epu2d0DogBCfwVHS4=
Content-Type: multipart/mixed; boundary="===============9167178819698300898=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] perl: upgrading to 5.38.0 FAILED
Message-ID: <0101018a006e4e1c-9d4d8562-1f31-499e-9325-955b27db5f54-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186175

--===============9167178819698300898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *perl* to *5.38.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe perl failed.
NOTE: Starting bitbake server...
Loading cache...done.
Loaded 1805 entries from dependency cache.
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
meta-yocto-bsp       = "tmp-auh-upgrades:fd21a9cc44525b7e1e796a83c6490ed826df6105"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 3 Local 3 Mirrors 0 Missed 0 Current 27 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
Loading cache...done.
Loaded 1805 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (897 cached, 2 parsed). 1806 targets, 37 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:fd21a9cc44525b7e1e796a83c6490ed826df6105"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   6% |##                                  | ETA:  0:00:03
Adding changed files:  13% |####                                | ETA:  0:00:02
Adding changed files:  20% |#######                             | ETA:  0:00:02
Adding changed files:  27% |#########                           | ETA:  0:00:01
Adding changed files:  34% |############                        | ETA:  0:00:01
Adding changed files:  41% |##############                      | ETA:  0:00:01
Adding changed files:  48% |#################                   | ETA:  0:00:00
Adding changed files:  54% |###################                 | ETA:  0:00:00
Adding changed files:  61% |######################              | ETA:  0:00:00
Adding changed files:  68% |########################            | ETA:  0:00:00
Adding changed files:  75% |###########################         | ETA:  0:00:00
Adding changed files:  82% |#############################       | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.cpan.org/src/5.0/perl-5.38.0.tar.gz;name=perl...
INFO: Rebasing devtool onto d2f8255fc082030fde659fb646f48ee6585add9b
WARNING: Command 'git rebase d2f8255fc082030fde659fb646f48ee6585add9b' failed:
Auto-merging cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
CONFLICT (content): Merge conflict in cpan/HTTP-Tiny/lib/HTTP/Tiny.pm

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto d2f8255fc082030fde659fb646f48ee6585add9b
WARNING: Command 'git rebase d2f8255fc082030fde659fb646f48ee6585add9b' failed:
Auto-merging cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
CONFLICT (content): Merge conflict in cpan/HTTP-Tiny/lib/HTTP/Tiny.pm

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-target onto d2f8255fc082030fde659fb646f48ee6585add9b
WARNING: Command 'git rebase d2f8255fc082030fde659fb646f48ee6585add9b' failed:
Auto-merging cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
CONFLICT (content): Merge conflict in cpan/HTTP-Tiny/lib/HTTP/Tiny.pm

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/perl
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/perl/perl_5.38.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============9167178819698300898==--

