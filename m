Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29FFCC3ABA1
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:06 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.20160.1744723980087972619
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=YGERUvw5;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=mxtvln26;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019639a72c76-c92e75ab-5f8b-4255-b92d-41f8a45099f0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723979;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=M3WAYL+UwEZpRvn8alYxe/upEkmrCoHWfFLHW62KNL8=;
	b=YGERUvw55eROU+F6MyFT/mUrpF7K2wBHi9evtPgoukf6/potr/2BVMAQBUZgsKJ8
	nd3EnYuaIPwR0ekQRz/cx3ChNrz/su2NlbYdLewzo9kt6/1J7KdSjEsTceOMTEnrdTE
	/4PW8+F34bwAR55n9DkNqxRluJYEkGQrzYdMhpfc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723979;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=M3WAYL+UwEZpRvn8alYxe/upEkmrCoHWfFLHW62KNL8=;
	b=mxtvln26bpWbH77DSA7psk/TUIdyj/wvPHMoMxYuXYRXhwK7bh1pig3RA+TsI/6J
	N9cVIwjiOKVJYtUOAtk2iKgxFuiDFtO5Bq2e+FMFkm84vM4xoqnG170LBmSViHXCDH5
	08jJsAWLlB+hfIjKBoWRR89oPKcnFov+tTEcdebg=
Content-Type: multipart/mixed; boundary="===============6481313886173526033=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?b?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aSA8emJvc3pvckBnbWFpbC5jb20+?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm-sequoia-crypto-policy: upgrading to
 86c0178416fe7998bbf553a3e713a9c4b7205757 FAILED
Message-ID: <0101019639a72c76-c92e75ab-5f8b-4255-b92d-41f8a45099f0-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:32:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214888

--===============6481313886173526033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rpm-sequoia-crypto-policy* to *86c0178416fe7998bbf553a3e713a9c4b7205757* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade rpm-sequoia-crypto-policy -S 86c0178416fe7998bbf553a3e713a9c4b7205757
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1897 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:4bdc159161f7a82d68c564c0f1ebe376563efc4b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 86c0178416fe7998bbf553a3e713a9c4b7205757' failed with exit code 128:
fatal: unable to read tree (86c0178416fe7998bbf553a3e713a9c4b7205757)



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6481313886173526033==--

