Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E491C02185
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 09:32:25 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.11330.1735723937339781061
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 01:32:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=NPDUR01k;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=SB9amgIA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019421356ba1-519a2cba-0ada-4abb-81d6-015ec0014a99-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1735723936;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=o8lBZq410dsku6jTFXAU3WZZzpI44o1tfo7DsyKFhMM=;
	b=NPDUR01k6kAlFSGvGUDDbXKDExTyQZQgXIjztIpqWL3GuoK621FjE12JtkqZhPL/
	X5R25rTmg5QJrShz8qhDNy6xQjs+7C4CpjyqFMQMVUTAfPhPMpWzpqTgrJZXH/Q3py8
	bRkVm7O+Sy2kFLXytQFzXeIH2SVI0cZlMl+NFwvg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1735723936;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=o8lBZq410dsku6jTFXAU3WZZzpI44o1tfo7DsyKFhMM=;
	b=SB9amgIA3Q4H8Lj9DrZsdv90lg3wzwPoYXPrfQeYDPfcUaYR5O+1wdfogp78ZfW4
	JuypNOQPuCr1GC1Rehlja1afAXXhBPmWSjPHLSDzV1LBMO45cZjZF2ZqUYsuokFT1hi
	jFqRBtlLbL0WWGAi2uRTPfNFctI5PW+1RN7X4MQM=
Content-Type: multipart/mixed; boundary="===============5982509796478488161=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>, 
	Viswanath Kraleti <quic_vkraleti@quicinc.com>, 
	Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot,systemd-boot-native,systemd: upgrading to
 257.1,257.1,257.1 FAILED
Message-ID: <0101019421356ba1-519a2cba-0ada-4abb-81d6-015ec0014a99-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jan 2025 09:32:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jan 2025 09:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209194

--===============5982509796478488161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *systemd-boot,systemd-boot-native,systemd* to *257.1,257.1,257.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade systemd-boot -V 257.1 -S 47eea9ee9f46537bc18d6a64fa21fd9c50538e13
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1875 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:a9e088161678b25d37c177c2bb0d9463fd98b498"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 47eea9ee9f46537bc18d6a64fa21fd9c50538e13
WARNING: Command 'git rebase 47eea9ee9f46537bc18d6a64fa21fd9c50538e13' failed:
CONFLICT (modify/delete): mkosi.images/system/mkosi.sync deleted in HEAD and modified in 8abb2e0f55 (mkosi: Don't touch the packaging checkout if work is being done).  Version 8abb2e0f55 (mkosi: Don't touch the packaging checkout if work is being done) of mkosi.images/system/mkosi.sync left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
mkosi.images/system/mkosi.sync: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5982509796478488161==--

