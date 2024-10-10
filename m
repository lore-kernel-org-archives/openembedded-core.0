Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D86FCFC61C
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:29 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.53367.1728588951632949875
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=i6Fi/Bit;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=T7xyrs0S;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019277eeba97-857d1def-b667-42d0-b2d9-2d4103e8642b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588987;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=F9qIHqmWvM5ZFuGrtXWo7xXFxd0Iif+sRCNg/9VEQ3Q=;
	b=i6Fi/BitA6ch9uNhIYTXEuYekeYPfhkbFL+bBO6/2ZT8yOmrvVdBeyNaKtUjzPZK
	/l3hVSpsVtOgLSoC7iHab9VKpv0AZ3/tDfOx02q45N+N8bapPZ8I0usJ8NRHSjPZkyO
	d8ZmOimnEyQwlLLOo+DrCt9LjNe5Z9mNImb7fPzQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588987;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=F9qIHqmWvM5ZFuGrtXWo7xXFxd0Iif+sRCNg/9VEQ3Q=;
	b=T7xyrs0SXR907vvn+voprHhLthNeZdVhkC8SyxHQLxfV5AKbYt7+RfM2woSNsYF8
	zEYC3Q+2IvajabpFeh3PAoO3d+H3+EZNQRUihz1iuav6q7ZrguuBMJXAxgVHVj3Ja5i
	pfYp3GYbvQFC8dED1Z05pw3u2tHaXcuRbnCEn4C0=
Content-Type: multipart/mixed; boundary="===============8173663140795002552=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.11 FAILED
Message-ID: <0101019277eeba97-857d1def-b667-42d0-b2d9-2d4103e8642b-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205580

--===============8173663140795002552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *btrfs-tools* to *6.11* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade btrfs-tools -V 6.11 -S 8859114eaee39c117ff95f5b60b4e81fc22f96e7
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1871 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:dcc2f296fa2e47885783548da8535e6e21a620a8"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision 8859114eaee39c117ff95f5b60b4e81fc22f96e7 was found on multiple branches: 
  
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8173663140795002552==--

