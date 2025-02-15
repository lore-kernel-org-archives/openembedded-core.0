Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E90B7C021A7
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:21 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.8052.1739623332341286779
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=J3mysL1x;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=wJyJVLyi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019509a17779-21d48497-0d71-41d3-9a7d-e9c93a4b2274-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623331;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Yyh6QHedHTW8+s07iTMUgWUXEW2CvPobM77/fNhgZuY=;
	b=J3mysL1x7Za9GqBRa6ayTD3+1vpcEBSFRbSm2guaLm08P+I4RiK5idJOJwRUG8P4
	t3Jvnpjx9NAKjuhpIjXSDPspBe8FXOf9oByy+8QHX1zJD8oCkivkc1RxXP/qDuy8UIp
	izAjgfJrUShQMB3ody31WbTyq16Y9PzvSTTH1WKA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623331;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Yyh6QHedHTW8+s07iTMUgWUXEW2CvPobM77/fNhgZuY=;
	b=wJyJVLyiba87yiaTjDXZW6oS09L0zwYYCl6p6vqnN7Ht5c198lTF2hvtkse1tZ+D
	jyfX6SGPALphgP2a4sMjTySQ7j+nahoNzUNaXPTBoXYeIvhn8+ggWYsh8vAMSDo1eIy
	rB1GlIffSbcpXE0AQglCQLEHPFZrh1t9DUU5bmtI=
Content-Type: multipart/mixed; boundary="===============6032451392919349140=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libuv: upgrading to 1.50.0 FAILED
Message-ID: <0101019509a17779-21d48497-0d71-41d3-9a7d-e9c93a4b2274-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211403

--===============6032451392919349140==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libuv* to *1.50.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade libuv -V 1.50.0 -S 8fb9cb919489a48880680a56efecff6a7dfb4504
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1869 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:749ef203f571c1e9decce1b19a7c3f7f73b8445f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision 8fb9cb919489a48880680a56efecff6a7dfb4504 was found on multiple branches: 
  uv-fileno-type
  v1.x
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6032451392919349140==--

