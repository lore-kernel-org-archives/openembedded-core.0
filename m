Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F37C04FF6
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:06 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.13578.1713248036779554887
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NTB0TAW4;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=lGJuiELC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018ee58a63f2-8e9e66be-24be-4ed4-a20f-26dbb33c85a5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248036;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fvv/nKHtzSKKNMHUAzGppEMvkU4MEK7oBqr1XHUtRro=;
	b=NTB0TAW4eeLlJEa8ZsTkeawJ1cO6LmC3YMH7Mi3IpU0ftIR/A1HlN2cZo52tpsKw
	ZkuljK5za/9ncmx5dX5SLwSOSoQJzZZFm7q3/up7iptM2yrT1UlHQPqAQYf3IXImVnS
	f0bF0PA8QHAk/eL75G/P8Ni0ALiWJalKQrxvIoR0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248036;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fvv/nKHtzSKKNMHUAzGppEMvkU4MEK7oBqr1XHUtRro=;
	b=lGJuiELCFMSnk6xqJoYM8wsfwjo1SPJUGfutZPjly0i4xf9fMfwo944GX7ZncrL5
	+1mNwSuIZk5UOXppzotBdkzIF6Xu68B6PxFluxGU13ZsgXdXZQlprTpf/UwLx4DAO8a
	peflMPn9nvUsJxtzf21M/X57PxNAgXPf4LFRwQLY=
Content-Type: multipart/mixed; boundary="===============3441112218326276582=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnu-efi: upgrading to 3.0.18 FAILED
Message-ID: <0101018ee58a63f2-8e9e66be-24be-4ed4-a20f-26dbb33c85a5-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198247

--===============3441112218326276582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnu-efi* to *3.0.18* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gnu-efi failed.
NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (0 cached, 922 parsed). 1878 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-6bd8367aa98e3108e9f1de9bdf809ded5dfc7413"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6bd8367aa98e3108e9f1de9bdf809ded5dfc7413"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 22 Local 22 Mirrors 0 Missed 0 Current 8 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 1878 entries from dependency cache.
Parsing recipes...done.
Parsing of 923 .bb files complete (921 cached, 2 parsed). 1879 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-6bd8367aa98e3108e9f1de9bdf809ded5dfc7413"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6bd8367aa98e3108e9f1de9bdf809ded5dfc7413"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Creating workspace layer in /home/pokybuild/yocto-worker/auh/build/build/workspace
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://downloads.sourceforge.net/gnu-efi/files/gnu-efi-3.0.18.tar.bz2...
INFO: Rebasing devtool onto 17ac504b015caeef648c55ca24a70c0bbd5e2990
WARNING: Command 'git rebase 17ac504b015caeef648c55ca24a70c0bbd5e2990' failed:
Auto-merging Make.defaults
CONFLICT (content): Merge conflict in Make.defaults

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/gnu-efi
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/gnu-efi/gnu-efi_3.0.18.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3441112218326276582==--

