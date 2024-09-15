Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB2FC35FEC
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:06 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.115626.1726410839524246122
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=X6XD0ke6;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=syz1SpYD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010191f61ad1e0-9eb1a10a-c1ab-4aac-a4f7-97bada92ae5b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410838;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UrCwM97WMsMQup3ktfissfGb1+PDmJBrY5gDTVqjlwI=;
	b=X6XD0ke68kHFByx6Vj4PWRxxzxxHfvAUsL+vYJd3WAzH130x96nXNFK7OmuIojks
	nJC2n3hJuCl7tUzxBiQmUSALzeStPOATY1vbs9o7KTEFAI6dZPIhsTgsy3n36CBuixt
	AMfUq6gC4kZ4SyX1ZyWnKlra4P2Qa4ZQcSqhh7Z8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410838;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UrCwM97WMsMQup3ktfissfGb1+PDmJBrY5gDTVqjlwI=;
	b=syz1SpYDyoJgjqXC/DtH5WYxjd1wNUdHDCNwBrLBckbGk3RUVoZ47OHUOF2Rqn06
	m/oSXt6BUL1+AAN8GOMTX8F8SucUtkEj0yx1RDh/YaLpAFttKne80R1s8cL+k2rJS4V
	4HAo4VAFRNNboqmg9M6SyGNgVcX/BvZ9E5NWzTgo=
Content-Type: multipart/mixed; boundary="===============0781805257892872225=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>, Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-2.0,glib-2.0-initial: upgrading to 2.82.0,2.82.0 FAILED
Message-ID: <01010191f61ad1e0-9eb1a10a-c1ab-4aac-a4f7-97bada92ae5b-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:33:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204504

--===============0781805257892872225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *glib-2.0,glib-2.0-initial* to *2.82.0,2.82.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe glib-2.0 failed.
NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (0 cached, 916 parsed). 1867 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-7004840f3dc12e76822cee7b48902c08a553a118"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7004840f3dc12e76822cee7b48902c08a553a118"

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
DISTRO_VERSION       = "5.0+snapshot-7004840f3dc12e76822cee7b48902c08a553a118"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7004840f3dc12e76822cee7b48902c08a553a118"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-hsu98h75: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-hs3untrt/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-hs3untrt/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  26% |#########                           | ETA:  0:00:00
Adding changed files:  52% |##################                  | ETA:  0:00:00
Adding changed files:  78% |############################        | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Creating workspace layer in /home/pokybuild/yocto-worker/auh/build/build/workspace
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//glib/2.82/glib-2.82.0.tar.xz...
INFO: Rebasing devtool onto 5d354ed3bb65ef58f51d2b54124789b071602f6c
WARNING: Command 'git rebase 5d354ed3bb65ef58f51d2b54124789b071602f6c' failed:
Auto-merging gio/gdbus-2.0/codegen/gdbus-codegen.in
CONFLICT (content): Merge conflict in gio/gdbus-2.0/codegen/gdbus-codegen.in
Auto-merging gobject/glib-genmarshal.in
CONFLICT (content): Merge conflict in gobject/glib-genmarshal.in
Auto-merging gobject/glib-mkenums.in
CONFLICT (content): Merge conflict in gobject/glib-mkenums.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto 5d354ed3bb65ef58f51d2b54124789b071602f6c
WARNING: Command 'git rebase 5d354ed3bb65ef58f51d2b54124789b071602f6c' failed:
Auto-merging gio/gdbus-2.0/codegen/gdbus-codegen.in
CONFLICT (content): Merge conflict in gio/gdbus-2.0/codegen/gdbus-codegen.in
Auto-merging gobject/glib-genmarshal.in
CONFLICT (content): Merge conflict in gobject/glib-genmarshal.in
Auto-merging gobject/glib-mkenums.in
CONFLICT (content): Merge conflict in gobject/glib-mkenums.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/glib-2.0
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/glib-2.0/glib-2.0_2.82.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0781805257892872225==--

