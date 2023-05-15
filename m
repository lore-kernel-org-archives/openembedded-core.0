Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 323F2C87FE7
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:16 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.3771.1684186748712335923
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NG2DL0UZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010188215a5db2-c5a38b8f-a9d8-4551-8458-4b3b41d42260-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186750;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UsASwzKeUaPQ7DR+NFvRNiUd2pxR4V/i3iCbZAUvaIg=;
	b=NG2DL0UZ76UM0ecJ34TBGK0U70ehVyFqvqpVfO7dGjB7piH7joZlG2sexBqeLugR
	qR1CSofki1GSGBAvv3FMcpwUH9RXZZowOr2zuBfCp/vQabcIk67GUxNCTE5EqCFO3SA
	7gkIrQM6zMVJpy98yyp3+hW/m8T/5jp0soBYeSdE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186750;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UsASwzKeUaPQ7DR+NFvRNiUd2pxR4V/i3iCbZAUvaIg=;
	b=GhyNdcmO2kSlqhayPdmw7SsVm39exO47Uc6KGcv3la4K1vEVMZnRomNJ6HMz84f+
	5pdsmi+SrnL/CAyP22lCgZoZaXbQGhAvFlMLiXaXl9uF656Ma7X36EgI6Rm91MUtqS5
	tgVj+hnIbhYPeb/YLXnX6Wh39iqbsNvTkp35/v4o=
Content-Type: multipart/mixed; boundary="===============6784478769046844690=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Victor Kamensky <victor.kamensky7@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemtap-uprobes: upgrading to 4.9 FAILED
Message-ID: <01010188215a5db2-c5a38b8f-a9d8-4551-8458-4b3b41d42260-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181367

--===============6784478769046844690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemtap-uprobes* to *4.9* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade systemtap-uprobes -V 4.9 -S ebb424eee5599fcc131901c0d82d0bfc0d2f57ab
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (19:59:37.927791)
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
meta-yocto-bsp       = "tmp-auh-upgrades:bc0b4e7d6bd878a87e4bc22a52011eefa0c7d9e6"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision ebb424eee5599fcc131901c0d82d0bfc0d2f57ab was found on multiple branches: 
  
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6784478769046844690==--

