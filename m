Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39494D1A44D
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:31 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.53361.1728588948281790444
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=M7KPbxDf;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Y1GohbWc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019277eea2cf-17b9819f-2037-45bf-9eb6-a5c78a94824e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588981;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GpOcqhiXzHQRKDh8K6lB62r8IY9lci53HxOUHAxq8Bc=;
	b=M7KPbxDfyK6jaqW0n5hKotM9U9ebtTaXuNpwqqRfTw2R3fNxy1vwbBIXTXSTxYMk
	VuyWPk0GMEmZpD75u0jftEPC4FbvMHGZ/kg9SOzBSoKYT+dWylb7GZ677fJU2dauGJg
	DhW8NJPfuvOguMi7CMdbMTkuj15f9v2kgDtJjyEs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588981;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GpOcqhiXzHQRKDh8K6lB62r8IY9lci53HxOUHAxq8Bc=;
	b=Y1GohbWc3j7uuLpb1PzroRiLQE/VSBmaHi4XhL3hi54dNb0z2ceQar1bVaDYlzEL
	a8Z/gK93Bw4Z86IjwOpzmVCY85z9kzYMzHEdReNBYrmv533d/47azXJHlfQhcAfd0aw
	AZWMOAHAYcASiqZlOPD+RnaRB87FAFUcK+zp6IFM=
Content-Type: multipart/mixed; boundary="===============5834754164406136960=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtc: upgrading to 1.7.1 FAILED
Message-ID: <0101019277eea2cf-17b9819f-2037-45bf-9eb6-a5c78a94824e-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205559

--===============5834754164406136960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-dtc* to *1.7.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe python3-dtc failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1871 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:81fcf84d5144f545f7e50c942d85ff6cccd14f75"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 99031e3a4a6e479466ae795790b44727434ca27d
WARNING: Command 'git rebase 99031e3a4a6e479466ae795790b44727434ca27d' failed:
Auto-merging libfdt/fdt_overlay.c
Auto-merging libfdt/libfdt.h
Auto-merging libfdt/version.lds
CONFLICT (content): Merge conflict in libfdt/version.lds

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/python3-dtc
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/python3-dtc/python3-dtc_1.7.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5834754164406136960==--

