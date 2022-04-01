Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25125C47085
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 13:23:42 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web08.10616.1648819420977316279
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 06:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=1dJRNs1A;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 0101017fe54bbce8-bd61b4b8-0068-4943-91d6-a61f5ce83353-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1648819420;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lD6A9t1NwQbE4xJemmQv0/CHSoFK7aVU1mtIFn1NRz8=;
	b=1dJRNs1Ag5LxM8C4NnMdQqUXBXiigIEFgJd9091LqEa3Yv+z3JT+aLDLPSGStaCK
	t9KpbahSRTj4/zJiBkx9H/rkAdCv8abdNQmKcfFmpI7ZnnQVBmxQxjlnmu7jsqkMzKE
	j+mXG6ajupMNSE9eDp5BKjh1ZW6DldkVAqw7OunE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1648819420;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lD6A9t1NwQbE4xJemmQv0/CHSoFK7aVU1mtIFn1NRz8=;
	b=boqXi/qJ4BCew/b54WwVzcHFSXDequAxR8a3I0vPNOMydt/tlqld8S2N0hO1ePfI
	kGB9RW7l56WTzsf901ySDyse98uR3Eiw9cO6qo7vPEtlIJT/i434y60Pada302nxvKR
	eZkYTg3F7K51WH7xBm5C0LLmNWDfUQHSBNpzGBxU=
Content-Type: multipart/mixed; boundary="===============5444329566257807183=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] squashfs-tools: upgrading to 4.5.1 FAILED
Message-ID: 
 <0101017fe54bbce8-bd61b4b8-0068-4943-91d6-a61f5ce83353-000000@us-west-2.amazonses.com>
Date: Fri, 1 Apr 2022 13:23:40 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 13:23:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163905

--===============5444329566257807183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *squashfs-tools* to *4.5.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade squashfs-tools -V 4.5.1 -S afdd63fc386919b4aa40d573b0a6069414d14317
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1640 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d31b9d9377484317439d8e4f3d5d49e2fed9f0f1"
workspace            = "master:ee5f9d9fdd7d09aa3a86a19d07e3e64851ddc686"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 19 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout afdd63fc386919b4aa40d573b0a6069414d14317' failed with exit code 1:
error: Your local changes to the following files would be overwritten by checkout:
	squashfs-tools/Makefile
	squashfs-tools/unsquash-1.c
	squashfs-tools/unsquash-1234.c
	squashfs-tools/unsquash-2.c
	squashfs-tools/unsquash-3.c
	squashfs-tools/unsquash-4.c
	squashfs-tools/unsquashfs.c
	squashfs-tools/unsquashfs.h
Please commit your changes or stash them before you switch branches.
error: The following untracked working tree files would be overwritten by checkout:
	squashfs-tools/unsquash-12.c
Please move or remove them before you switch branches.
Aborting



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5444329566257807183==--

