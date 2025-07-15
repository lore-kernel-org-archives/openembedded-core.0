Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D79C7CA0ED3
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:51 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.12482.1752594935884226447
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=AkbXrMAy;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Ka9GgjPC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101980eccac73-fc12d0f4-6e48-417c-9bdc-f3ae4772bfe6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594951;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OUaEnSyMMxJ9uDIT8VpkQuZ/6Czc6OzEIzJmLl3OkgQ=;
	b=AkbXrMAybFgIDyI2zG7L/EwKpU4ZqAz3bIIWvYfr1S+ME3XEP6TIF4VOAP05+h/K
	gz1tExv7hzaSl40C0PTzxHU1FPgZoX1xkbDKOYLGaTYltfIGBLBnzovcXsXTAUv7Z6Q
	YRVSa69Eb6DuLsxGsBkeWNOO2iGyzGJr5/f45VzQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594951;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OUaEnSyMMxJ9uDIT8VpkQuZ/6Czc6OzEIzJmLl3OkgQ=;
	b=Ka9GgjPCQ/KuAvneOVPiE2rbFHvu9irf4UBwNZLmlf1sJrIHdcb/fkG3TnTPXWDJ
	KKkHQdIE6FoizuqIxWq/3peHOCgqYATZtR1a3kHf6Fs2s0kiYLKON90i4XYaXPj323/
	2xyfg/9HnW4WMxo50DoAQj2Y2MS4UEDfnnIXQITM=
Content-Type: multipart/mixed; boundary="===============5592614580112608581=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 47d9b80425599c4dec2b9c510cb2ede3416317ec FAILED
Message-ID: <010101980eccac73-fc12d0f4-6e48-417c-9bdc-f3ae4772bfe6-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220378

--===============5592614580112608581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *47d9b80425599c4dec2b9c510cb2ede3416317ec* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-samples -S 47d9b80425599c4dec2b9c510cb2ede3416317ec
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1928 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-8d8353e61e120881c9c3ba4e5ebca0251179b1bd"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:8d8353e61e120881c9c3ba4e5ebca0251179b1bd"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 47d9b80425599c4dec2b9c510cb2ede3416317ec
WARNING: Command 'git rebase 47d9b80425599c4dec2b9c510cb2ede3416317ec' failed:
CONFLICT (modify/delete): third_party/glslang deleted in HEAD and modified in e1f3b14 (Add changes from do_patch).  Version e1f3b14 (Add changes from do_patch) of third_party/glslang left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
third_party/glslang: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5592614580112608581==--

