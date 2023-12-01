Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 961C9C27C60
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 13:15:01 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.22312.1701436490558185201
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 05:14:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NFkqvk0b;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=WQomCTci;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018c2584827e-cfd9f3c6-75c3-4476-a9a0-4f6245f63838-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701436490;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gR6VsYpfwffpV0Hp0uUtDmKh7P2ZnNTNBNMCKhO79ME=;
	b=NFkqvk0b+14agqlFfg5b1F9lRYTC4qJI0z40wpjcPKn0wpBmdN0QskzT+5ZOlch8
	DKqDdOhaFV5d/WEJF4LJ3JrmKfE1zTZm+e6mMHVco2aCn5rF5+3n8l/RYhQajp6H3eW
	EJ/heRLwCwdQbguB75J6pY36kYB8w4qAOToQ1jn0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701436490;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gR6VsYpfwffpV0Hp0uUtDmKh7P2ZnNTNBNMCKhO79ME=;
	b=WQomCTciPNs245NIm5O6PKSSt5FhJ4rRCzNzFHc5Q+w+MCx5yRyibTqPkQkgO709
	VGOavzbGjqYfhtHBkbHyEJS4y8u1jTJ0BAIVwQbI+anHkxmjfXePCvbs1BUU1PcVL0U
	RoBWr3k0QS37a9PAJ6bWGR4rNIDPJcC0BpLFMvsQ=
Content-Type: multipart/mixed; boundary="===============1370489992516294240=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] psplash: upgrading to ecc1913756698d0c87ad8fa10e44b29537f09ad1
 FAILED
Message-ID: <0101018c2584827e-cfd9f3c6-75c3-4476-a9a0-4f6245f63838-000000@us-west-2.amazonses.com>
Date: Fri, 1 Dec 2023 13:14:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 13:15:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191576

--===============1370489992516294240==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *psplash* to *ecc1913756698d0c87ad8fa10e44b29537f09ad1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade psplash -S ecc1913756698d0c87ad8fa10e44b29537f09ad1
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1844 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-6f5f3356e20fc01c16a5bdf1c829fac2a2105fa3"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6f5f3356e20fc01c16a5bdf1c829fac2a2105fa3"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto ecc1913756698d0c87ad8fa10e44b29537f09ad1
ERROR: Could not decode SRC_URI: The URL: '${SPLASH_IMAGES}' is invalid and cannot be interpreted


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1370489992516294240==--

