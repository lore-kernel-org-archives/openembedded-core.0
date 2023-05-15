Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65067CCA467
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:18 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.3750.1684186745881673784
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PoRjwnTn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010188215a48ea-cc3544d4-9cd8-469e-9d07-c64aa5cd482c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186745;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=NAbns/cZB3d3d7AvH0m/4GVGz36qo1zxzL5U9RpBcxY=;
	b=PoRjwnTnZS0n+7UhZk8SVgDI/A29G0jelqzrRqzhBg+VoLDgbuIqGB45WlpjZaRo
	x8+0i/4XSWSC7ezsREuKbPsC22+CgZP9lHibWrGkBLjfn7Ru7aotLOOU2a8xA6MODbg
	iwaJHJyONpZKtVaxUXtX5VtERACtZycvOAzpYSys=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186745;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=NAbns/cZB3d3d7AvH0m/4GVGz36qo1zxzL5U9RpBcxY=;
	b=V+dkU+ogYgzX3EXNUJkMHySEnX/TU72toBoM+pIntu8r0mjIQrNDBDkeX0qurC+l
	y5O5OCinRPuWkzUpjVCTMC/AypNAaWBUvyIxHe7+xBNXUDzPIoY+UB5tOvtv3+4kSH8
	U2U0fJBj8FkJ5mOMXTC1QH3egJhaLhN++eh33r8M=
Content-Type: multipart/mixed; boundary="===============0312655422144026046=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] dhcpcd: upgrading to 10.0.1 FAILED
Message-ID: <01010188215a48ea-cc3544d4-9cd8-469e-9d07-c64aa5cd482c-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181274

--===============0312655422144026046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dhcpcd* to *10.0.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe dhcpcd failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (06:43:42.156212)
Loading cache...done.
Loaded 1804 entries from dependency cache.
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
meta-yocto-bsp       = "tmp-auh-upgrades:0555bbbdd74a74818a84fea13929a7b14803d161"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 5d9bf80c26b4b7dc9d8aa175d96d5a24e75b4d48
WARNING: Command 'git rebase 5d9bf80c26b4b7dc9d8aa175d96d5a24e75b4d48' failed:
Auto-merging src/dhcp.c
CONFLICT (content): Merge conflict in src/dhcp.c
Auto-merging src/dhcp6.c
Auto-merging src/dhcpcd.8.in
CONFLICT (content): Merge conflict in src/dhcpcd.8.in
Auto-merging src/dhcpcd.c
CONFLICT (content): Merge conflict in src/dhcpcd.c
Auto-merging src/dhcpcd.conf.5.in
CONFLICT (content): Merge conflict in src/dhcpcd.conf.5.in
Auto-merging src/if-options.c
Auto-merging src/if-options.h
Auto-merging src/ipv6.c
Auto-merging src/privsep-control.c
Auto-merging src/privsep-inet.c
Auto-merging src/privsep-root.c
CONFLICT (content): Merge conflict in src/privsep-root.c
Auto-merging src/privsep.c
CONFLICT (content): Merge conflict in src/privsep.c
Auto-merging src/privsep.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since recipe inherits autotools-brokensep
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/dhcpcd
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/dhcpcd/dhcpcd_10.0.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0312655422144026046==--

