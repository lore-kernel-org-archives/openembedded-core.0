Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EC55C07E97
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:13 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.8501.1698848705679498923
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VuPWTIKz;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=XNlymnZT;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.192, mailfrom: 0101018b8b460903-adf57e3c-50bd-4a0a-9ed5-6ae81adb66a1-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848704;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=y9nmjR+jiQkquTepcSezuJu0EsJoR5vn3ozHrgMaINY=;
	b=VuPWTIKzkqLyI+YggJIsd95ebFkdqVFjj6rMckQzhSQK11qJki3jBAbseZPaANXh
	4CL2G8a1HoVOWmfvTx0jAbd+UcouK5JtQEK1I/Y4GRWl1SUtRCq+SlGo3jHMILPyvmM
	C8WqdntL/7xGtG9cH4CQki6DdLrsT/y36xEDAUjw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848704;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=y9nmjR+jiQkquTepcSezuJu0EsJoR5vn3ozHrgMaINY=;
	b=XNlymnZT3Xk3NW/mwFJm0lFPTLAnliXHxR+DeoVET6Po6WAr1izzuw7cIXog3s9v
	4KbWf4l2auFFkWtD4x8VCF0ZhIye5phASlNl4ImQocMtHV43C3WPzXShhpRu9qYtE4g
	K+PEc2FG+b2b+KxDrpuQMItvo9gcGenb+KJu/ajM=
Content-Type: multipart/mixed; boundary="===============6516338016801136451=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 1d6d2400d4027025cb8edc86a139c9c581d672f7 FAILED
Message-ID: <0101018b8b460903-adf57e3c-50bd-4a0a-9ed5-6ae81adb66a1-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189995

--===============6516338016801136451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go-helloworld* to *1d6d2400d4027025cb8edc86a139c9c581d672f7* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S 1d6d2400d4027025cb8edc86a139c9c581d672f7
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (11:11:32.922302)
Loading cache...done.
Loaded 1842 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-808d97b2d64aa3041d006ed8dc6207613564a10c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:808d97b2d64aa3041d006ed8dc6207613564a10c"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 2 Local 2 Mirrors 0 Missed 0 Current 28 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 1d6d2400d4027025cb8edc86a139c9c581d672f7' failed with exit code 128:
fatal: reference is not a tree: 1d6d2400d4027025cb8edc86a139c9c581d672f7



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6516338016801136451==--

