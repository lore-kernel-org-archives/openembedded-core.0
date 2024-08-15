Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64471C53211
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:02 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.131412.1723748333004023832
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=UN+ai/Ba;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=yyVjImUw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101915768329f-c1ad5d38-ed1e-4f2f-8326-a3d9ffba733f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748332;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DMwcyZ/2/xGBuXaZpQJfnrgWOYhn3X3bQRHJdwmROuw=;
	b=UN+ai/BapuQhK7HGgK0bdhy4PTkBSxR/rO5raD0MNcBvesYwGOWpzOGCGiAbn4YQ
	6ZTsPJnJllEVWDS+98sWuv5Af0aj6civxZ8mJqCQDKU+Jr/2sU3cs22Cv+m34ObNaaF
	MgysbMerND5eN5v6GS0jO66ow/cIyuS/11se8UVY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748332;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DMwcyZ/2/xGBuXaZpQJfnrgWOYhn3X3bQRHJdwmROuw=;
	b=yyVjImUwCHnb23seC2fiVeXWdHGitxRjqKfMGRswkUnRlnIxUxZuzAk5Xbg7qhjY
	wslAJ4p5VU72sBkdkduwh2BjHqBBjIPQlMhR2x/rqaHJxo364BbpZ7b5SbZH9NOSvu9
	GCsb6kvqYPvfT5As0oa0SVxegmJ16WSFl0Bb3FkQ=
Content-Type: multipart/mixed; boundary="===============5630259932550959398=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>, Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-2.0-initial,glib-2.0: upgrading to 2.80.4,2.80.4 FAILED
Message-ID: <010101915768329f-c1ad5d38-ed1e-4f2f-8326-a3d9ffba733f-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203346

--===============5630259932550959398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *glib-2.0-initial,glib-2.0* to *2.80.4,2.80.4* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe glib-2.0-initial failed.
NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (0 cached, 916 parsed). 1867 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-033689b4a9667691b54216a5fc91ce614bd63b5e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:033689b4a9667691b54216a5fc91ce614bd63b5e"

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
Parsing of 917 .bb files complete (0 cached, 917 parsed). 1868 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-033689b4a9667691b54216a5fc91ce614bd63b5e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:033689b4a9667691b54216a5fc91ce614bd63b5e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-bq35n3xu: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-p8kopdtw/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-p8kopdtw/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Creating workspace layer in /home/pokybuild/yocto-worker/auh/build/build/workspace
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//glib/2.80/glib-2.80.4.tar.xz...
INFO: Rebasing devtool onto adc5b1004c9b3e882d70af0adb3d2b8bbdebd45a
WARNING: Command 'git rebase adc5b1004c9b3e882d70af0adb3d2b8bbdebd45a' failed:
Auto-merging girepository/introspection/meson.build
CONFLICT (content): Merge conflict in girepository/introspection/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto adc5b1004c9b3e882d70af0adb3d2b8bbdebd45a
WARNING: Command 'git rebase adc5b1004c9b3e882d70af0adb3d2b8bbdebd45a' failed:
Auto-merging girepository/introspection/meson.build
CONFLICT (content): Merge conflict in girepository/introspection/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/glib-2.0-initial
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/glib-2.0-initial/glib-2.0-initial_2.80.4.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5630259932550959398==--

