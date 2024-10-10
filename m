Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B65A5CFC605
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:35:42 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.53253.1728588939658968366
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:35:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=D2IapOoF;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=fU2dX7T7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019277edfde8-a12b12ee-219d-4d14-b8da-6b93446bbaf9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588938;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=w6f6+5wHe9KOTmbZPG1HqT0A0i9BOUxwmvMK+qklnqo=;
	b=D2IapOoF061zkvmdVBsWOSgoDupNy5BdgXKhNlEIe8bAeuRqXrS8BW5z0lGjwf3m
	mrqyBHk9T7muMS1p2w1r/nMYrqLE4asl0MFqzRD4oA4xTrzrlYeZR44i7Z4SOw1XExX
	MPZomWdKGLim/1y7DTYWoelHmVtOvRIdmpY+DcyM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588938;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=w6f6+5wHe9KOTmbZPG1HqT0A0i9BOUxwmvMK+qklnqo=;
	b=fU2dX7T7orkWSQ/hDtnIb5m7zhvAEt9ZcfFWLY306q1e5Bqk8FaC1F+55tQwGxQc
	n4/x+NBV2mZ0sIPNs5e9Qgc5GMlyDOl8fKFyBPn/ZteHDeoXIZavviaLQUgBJnW6ISI
	rNqnJchYY3SKlpkLBSrlvDRvls6OZ1/I9f1viang=
Content-Type: multipart/mixed; boundary="===============0636653750954883878=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3: upgrading to 3.13.0 FAILED
Message-ID: <0101019277edfde8-a12b12ee-219d-4d14-b8da-6b93446bbaf9-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:35:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:35:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205432

--===============0636653750954883878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3* to *3.13.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3 -V 3.13.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1871 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
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
workspace            = "tmp-auh-upgrades:7fc2ca06e005099c255aad96f5798a9a128f188a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (0 cached, 918 parsed). 1872 targets, 40 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:7fc2ca06e005099c255aad96f5798a9a128f188a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-1csaiszv: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-am5obogc/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-am5obogc/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   3% |#                                   | ETA:  0:00:04
Adding changed files:   7% |##                                  | ETA:  0:00:02
Adding changed files:  11% |####                                | ETA:  0:00:02
Adding changed files:  15% |#####                               | ETA:  0:00:01
Adding changed files:  19% |######                              | ETA:  0:00:01
Adding changed files:  22% |########                            | ETA:  0:00:01
Adding changed files:  26% |#########                           | ETA:  0:00:01
Adding changed files:  30% |###########                         | ETA:  0:00:01
Adding changed files:  34% |############                        | ETA:  0:00:01
Adding changed files:  38% |#############                       | ETA:  0:00:01
Adding changed files:  42% |###############                     | ETA:  0:00:01
Adding changed files:  45% |################                    | ETA:  0:00:01
Adding changed files:  49% |#################                   | ETA:  0:00:01
Adding changed files:  53% |###################                 | ETA:  0:00:00
Adding changed files:  57% |####################                | ETA:  0:00:00
Adding changed files:  61% |######################              | ETA:  0:00:00
Adding changed files:  65% |#######################             | ETA:  0:00:00
Adding changed files:  68% |########################            | ETA:  0:00:00
Adding changed files:  72% |##########################          | ETA:  0:00:00
Adding changed files:  76% |###########################         | ETA:  0:00:00
Adding changed files:  80% |############################        | ETA:  0:00:00
Adding changed files:  84% |##############################      | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  91% |#################################   | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:02

INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching http://www.python.org/ftp/python/3.13.0/Python-3.13.0.tar.xz...
INFO: Rebasing devtool onto 072ac3e3a5ee7580f5d7801d6a2dcab4370d5fd5
WARNING: Command 'git rebase 072ac3e3a5ee7580f5d7801d6a2dcab4370d5fd5' failed:
CONFLICT (modify/delete): Lib/cgi.py deleted in HEAD and modified in dc9d198 (Lib/cgi.py: Update the script as mentioned in the comment).  Version dc9d198 (Lib/cgi.py: Update the script as mentioned in the comment) of Lib/cgi.py left in tree.

INFO: Rebasing devtool-override-class-native onto 072ac3e3a5ee7580f5d7801d6a2dcab4370d5fd5
ERROR: Execution of 'git checkout devtool-override-class-native' failed with exit code 1:
error: you need to resolve your current index first
Lib/cgi.py: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0636653750954883878==--

