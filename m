Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C513BC54781
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:34:01 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.88840.1705340029293973474
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Pe6uRLa+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=WcBB9/N/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018d0e2fc719-687c1156-edf4-4f19-ac7a-15a552e8f7c6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340028;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4KeEBFRoResh9vBuBreyHa0Y+koYoj3rVg0LJLboztA=;
	b=Pe6uRLa+0QHY3FKXuIdAepwSNwOTCBeOHF2dPJQ8lTX/Bj3IBeLzcxOlUmVIU+dP
	w34U3IWLUQg8jcQ/4WI4F633R+2+aQp1tr5KF/3Lyuyv+O4HyhEucd/5TsYg2t0QchZ
	msQ0Xrt4q1xokekU2rtMl8hGS0lLjgtBVXIgyy20=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340028;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4KeEBFRoResh9vBuBreyHa0Y+koYoj3rVg0LJLboztA=;
	b=WcBB9/N/5Qoju0ODQHS0VrZY0CcWgJ+PFzn4PHVZXLDl22NSs1V9kLKb7wCL79AC
	fdNEQbiOyEQEg5YS1m052oRFW5dpnLyUG8kM3aL4QIep0rOUHyAC5ANvGPePj3y29Tf
	c2OiL77ZN1hZ9QVI6QgjlU5/jGGoY0CSS4TH0YQA=
Content-Type: multipart/mixed; boundary="===============6608957997856937026=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] autoconf: upgrading to 2.72e FAILED
Message-ID: <0101018d0e2fc719-687c1156-edf4-4f19-ac7a-15a552e8f7c6-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193699

--===============6608957997856937026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *autoconf* to *2.72e* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade autoconf -V 2.72e
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1850 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-c41f9d0eb006b99014a83e1bcb27696608082aa5"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c41f9d0eb006b99014a83e1bcb27696608082aa5"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 15 Local 9 Mirrors 0 Missed 6 Current 14 (60% match, 79% complete)
Removing 4 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
Log data follows:
| DEBUG: Executing python function do_unpack
| DEBUG: Executing python function base_do_unpack
| NOTE: Unpacking /srv/autobuilder/autobuilder.yocto.io/current_sources/autoconf-2.72d.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-7xs6et3j/workdir/
| DEBUG: Searching for program_prefix.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/program_prefix.patch for program_prefix.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/program_prefix.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-7xs6et3j/workdir/
| DEBUG: Searching for autoreconf-exclude.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch for autoreconf-exclude.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-7xs6et3j/workdir/
| DEBUG: Searching for remove-usr-local-lib-from-m4.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/remove-usr-local-lib-from-m4.patch for remove-usr-local-lib-from-m4.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/remove-usr-local-lib-from-m4.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-7xs6et3j/workdir/
| DEBUG: Searching for preferbash.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/preferbash.patch for preferbash.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/preferbash.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-7xs6et3j/workdir/
| DEBUG: Searching for autotest-automake-result-format.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-format.patch for autotest-automake-result-format.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-format.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-7xs6et3j/workdir/
| DEBUG: Searching for man-host-perl.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/man-host-perl.patch for man-host-perl.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/man-host-perl.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-7xs6et3j/workdir/
| DEBUG: Searching for no-man.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/no-man.patch for no-man.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/no-man.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-7xs6et3j/workdir/
| DEBUG: Python function base_do_unpack finished
| DEBUG: Python function do_unpack finished
| DEBUG: Executing python function create_source_date_epoch_stamp
| DEBUG: Newest file found: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-7xs6et3j/workdir/autoconf-2.72d/.git/HEAD
| DEBUG: SOURCE_DATE_EPOCH: 1705298233
| DEBUG: Python function create_source_date_epoch_stamp finished
| DEBUG: Executing python function do_qa_unpack
| DEBUG: Python function do_qa_unpack finished
| DEBUG: Executing python function devtool_post_unpack
| DEBUG: Python function devtool_post_unpack finished
Log data follows:
| DEBUG: Executing python function do_unpack
| DEBUG: Executing python function base_do_unpack
| NOTE: Unpacking /srv/autobuilder/autobuilder.yocto.io/current_sources/autoconf-2.72d.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-7xs6et3j/workdir/
| DEBUG: Searching for program_prefix.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/program_prefix.patch for program_prefix.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/program_prefix.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-7xs6et3j/workdir/
| DEBUG: Searching for autoreconf-exclude.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch for autoreconf-exclude.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-7xs6et3j/workdir/
| DEBUG: Searching for remove-usr-local-lib-from-m4.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/remove-usr-local-lib-from-m4.patch for remove-usr-local-lib-from-m4.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/remove-usr-local-lib-from-m4.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-7xs6et3j/workdir/
| DEBUG: Searching for preferbash.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/preferbash.patch for preferbash.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/preferbash.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-7xs6et3j/workdir/
| DEBUG: Searching for autotest-automake-result-format.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-format.patch for autotest-automake-result-format.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-format.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-7xs6et3j/workdir/
| DEBUG: Searching for man-host-perl.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72d/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/man-host-perl.patch for man-host-perl.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/man-host-perl.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-7xs6et3j/workdir/
| DEBUG: Python function base_do_unpack finished
| DEBUG: Python function do_unpack finished
| DEBUG: Executing python function create_source_date_epoch_stamp
| DEBUG: Newest file found: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-7xs6et3j/workdir/autoconf-2.72d/bin/autom4te.in
| DEBUG: SOURCE_DATE_EPOCH: 1705298233
| DEBUG: Python function create_source_date_epoch_stamp finished
| DEBUG: Executing python function do_qa_unpack
| DEBUG: Python function do_qa_unpack finished
| DEBUG: Executing python function devtool_post_unpack
| DEBUG: Python function devtool_post_unpack finished
NOTE: Tasks Summary: Attempted 75 tasks of which 58 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240115055704.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240115055704.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
ERROR: ExecutionError('git tag -f devtool-base', 128, '', "fatal: Failed to resolve 'HEAD' as a valid ref.\n")
ERROR: ExecutionError('git checkout -b devtool-orig', 128, '', "fatal: a branch named 'devtool-orig' already exists\n")
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-7xs6et3j/temp/log.do_unpack.1440560
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-7xs6et3j/temp/log.do_unpack.1440509
ERROR: Extracting source for autoconf failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6608957997856937026==--

