Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58DA8C27C50
	for <webhook@archiver.kernel.org>; Sat,  1 Jul 2023 16:02:08 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.10759.1688227322745009749
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jul 2023 09:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KN4AkHgt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101891230988e-a3897e0a-9667-4343-b315-1ff41fd01d83-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1688227322;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nhMK+sMhFpDtaGTTZLelE93lGexN1CmHsjwy1YqT8+o=;
	b=KN4AkHgtaiYqyAOVXyYsnwhgN8kq06YuxjeFXdka95lg5/hMzwhTp9+NZ0FJhBv6
	6px5KjNaNlGFK9qshlpVMrxn0tBeVOfp8qy7pl9oe3PLq/bjfIuT2BAZsD7S3rFdmQy
	sM2NrYponL5J4Bw0ecBGf4p0tXJyloCuLTuZMoPw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1688227322;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nhMK+sMhFpDtaGTTZLelE93lGexN1CmHsjwy1YqT8+o=;
	b=JQtPz7VfeK6AlCBhsuMN/ZMspptFycRZDeRKvHSlvh6XimJPTrl1ESPuRsmwFFjI
	5JHyfLJn46aPpYumih2oTtdQbr9tTU5nB7DKbwesCmXS2vsRdOVTnpCkzXRrx93Bj43
	/G/4NTDzmKyhr/mtiw5bmnI1EB13j/4cgLJLUo0E=
Content-Type: multipart/mixed; boundary="===============4346656988754710958=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.3.2 FAILED
Message-ID: <010101891230988e-a3897e0a-9667-4343-b315-1ff41fd01d83-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jul 2023 16:02:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jul 2023 16:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183713

--===============4346656988754710958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *btrfs-tools* to *6.3.2* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade btrfs-tools -V 6.3.2 -S d1d8fb4b599e76a3d6bc355df9e5787955104a72
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (08:34:30.239770)
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1799 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
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
meta-yocto-bsp       = "tmp-auh-upgrades:207a8944e1893c95b282780029bf48daa9693d92"
workspace            = "master:d221e59a5067266c3f620259a1e56a56823df1fb"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision d1d8fb4b599e76a3d6bc355df9e5787955104a72 was found on multiple branches: 
  
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4346656988754710958==--

