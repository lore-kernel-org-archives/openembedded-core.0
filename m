Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ABF8C48BF9
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:09 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.4581.1704114719239508894
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:11:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZPM89rjF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=By/7ISU4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018cc527072d-fed0e350-d0b2-4484-adcb-ae0c17082f86-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114718;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JioD/Xsk35l4NPdOycGTD+mOJGsjHFC1zs+K7mIslVs=;
	b=ZPM89rjFsSAFwGzvmQBF8b6nvn9mqzPNAYG9vZ2XduSDOJCqOFVP7gpSKSz6ojjH
	qagg3SMQMRsyr/KtSyf5xfvc8L5WEUcc4an7stIjhGNvvzziFE6DxsUbeh0fYXViaCt
	6Z3CqafJJanN/aTLwUwFdv2Ouv/Ys+T5YqJCPDi8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114718;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JioD/Xsk35l4NPdOycGTD+mOJGsjHFC1zs+K7mIslVs=;
	b=By/7ISU4o+9j9LXhHzqnP5/bZ1R4eEKSKJcrGp4pJf7rxtZjlZDKlsidbaoSx2R6
	mstEmQ3dGddDK075TX8ZIvFf4g536JmXinREkyy0YJpcxKIcdpy+A1OmfvAa3pna9V/
	zsXLWQwe+BfA/HhHMlS3pGrTsaGMuQjOjWCJs02Y=
Content-Type: multipart/mixed; boundary="===============9121650197074009598=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] autoconf: upgrading to 2.72e FAILED
Message-ID: <0101018cc527072d-fed0e350-d0b2-4484-adcb-ae0c17082f86-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:11:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193105

--===============9121650197074009598==
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
Loaded 1847 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-c79a4af9e8ee801eb28cebebc02eb3a819382b88"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c79a4af9e8ee801eb28cebebc02eb3a819382b88"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 15 Local 9 Mirrors 0 Missed 6 Current 14 (60% match, 79% complete)
Removing 4 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
Log data follows:
| DEBUG: Executing python function do_unpack
| DEBUG: Executing python function base_do_unpack
| NOTE: Unpacking /srv/autobuilder/autobuilder.yocto.io/current_sources/autoconf-2.72d.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-onfuo_nj/workdir/
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
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/program_prefix.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-onfuo_nj/workdir/
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
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-onfuo_nj/workdir/
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
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/remove-usr-local-lib-from-m4.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-onfuo_nj/workdir/
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
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/preferbash.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-onfuo_nj/workdir/
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
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-format.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-onfuo_nj/workdir/
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
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/man-host-perl.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-onfuo_nj/workdir/
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
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/no-man.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-onfuo_nj/workdir/
| DEBUG: Python function base_do_unpack finished
| DEBUG: Python function do_unpack finished
| DEBUG: Executing python function create_source_date_epoch_stamp
| DEBUG: Newest file found: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-onfuo_nj/workdir/autoconf-2.72d/.git/config
| DEBUG: SOURCE_DATE_EPOCH: 1704088108
| DEBUG: Python function create_source_date_epoch_stamp finished
| DEBUG: Executing python function do_qa_unpack
| DEBUG: Python function do_qa_unpack finished
| DEBUG: Executing python function devtool_post_unpack
| DEBUG: Python function devtool_post_unpack finished
Log data follows:
| DEBUG: Executing python function do_unpack
| DEBUG: Executing python function base_do_unpack
| NOTE: Unpacking /srv/autobuilder/autobuilder.yocto.io/current_sources/autoconf-2.72d.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-onfuo_nj/workdir/
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
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/program_prefix.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-onfuo_nj/workdir/
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
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-onfuo_nj/workdir/
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
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/remove-usr-local-lib-from-m4.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-onfuo_nj/workdir/
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
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/preferbash.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-onfuo_nj/workdir/
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
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-format.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-onfuo_nj/workdir/
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
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/man-host-perl.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-onfuo_nj/workdir/
| DEBUG: Python function base_do_unpack finished
| DEBUG: Python function do_unpack finished
| DEBUG: Executing python function create_source_date_epoch_stamp
| DEBUG: Newest file found: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-onfuo_nj/workdir/autoconf-2.72d/doc/autoconf.info
| DEBUG: SOURCE_DATE_EPOCH: 1704088108
| DEBUG: Python function create_source_date_epoch_stamp finished
| DEBUG: Executing python function do_qa_unpack
| DEBUG: Python function do_qa_unpack finished
| DEBUG: Executing python function devtool_post_unpack
| DEBUG: Python function devtool_post_unpack finished
NOTE: Tasks Summary: Attempted 75 tasks of which 58 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240101054819.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240101054819.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
ERROR: ExecutionError('git tag -f devtool-base', 128, '', "fatal: Failed to resolve 'HEAD' as a valid ref.\n")
ERROR: ExecutionError('git checkout -b devtool-orig', 128, '', "fatal: a branch named 'devtool-orig' already exists\n")
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-onfuo_nj/temp/log.do_unpack.2247876
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72d/devtooltmp-onfuo_nj/temp/log.do_unpack.2247835
ERROR: Extracting source for autoconf failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============9121650197074009598==--

