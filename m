Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1CF3CEB2DF
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:38:29 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11926.1763224708299561039
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=DuDdXOXo;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=caY2ITZc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019a8861e164-62f81177-5dab-45b1-b64c-4d78fa8c5939-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224707;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=P281bILcJ0nEuo0F0I9ixg0QaXn13Ys7qbSq1Qhferw=;
	b=DuDdXOXoceFxefkVVvoqziw4ml6LHoySLyDLFJXk+sjG60hC6oB2OhVC1DoIefLG
	ei5GRWWb1h0zzvlNZ/55yAKr6DmiqY/av/yatuPtc/PyevIjDS0NVjfmIEj10Fof0n/
	jyKbYeFrnw3B/Fh7V4sFlC4AkW+sUEl8/l2nrgi8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224707;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=P281bILcJ0nEuo0F0I9ixg0QaXn13Ys7qbSq1Qhferw=;
	b=caY2ITZcdSZlKWCWTc+f9SVdavdYx2UrBZ8FcSao/ieypDIx9jH5AEyXPYdstE88
	CTaHxVRhT3Gb63B6u6yYIrdQ9Vzomh4cYi1UTlY0GmBRPpw1t+ksjOyu/k5/L9AmDLb
	zZwK5X0hZWXyPx2JGHGdWF9XhMo9nugI6Uj+0gf0=
Content-Type: multipart/mixed; boundary="===============7626348090633508260=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Viswanath Kraleti <quic_vkraleti@quicinc.com>, 
	Chen Qi <Qi.Chen@windriver.com>, Chen Qi <Qi.Chen@windriver.com>, 
	Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 systemd-boot-native,systemd-boot,systemd,systemd-systemctl-native: upgrading
 to 258.2,258.2,258.2,258.2 FAILED
Message-ID: <0101019a8861e164-62f81177-5dab-45b1-b64c-4d78fa8c5939-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:38:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226306

--===============7626348090633508260==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *systemd-boot-native,systemd-boot,systemd,systemd-systemctl-native* to *258.2,258.2,258.2,258.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe systemd-boot-native failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1944 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-98f4422981599e0a0f90b12b08d42456aa913dcd"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:98f4422981599e0a0f90b12b08d42456aa913dcd"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
done.
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 15bd1496c9b59c1ec8ee05e78c65eeb3f148c898
WARNING: Command 'git rebase 15bd1496c9b59c1ec8ee05e78c65eeb3f148c898' failed:
Auto-merging mkosi/mkosi.conf.d/arch/mkosi.conf
Auto-merging mkosi/mkosi.conf.d/centos-fedora/mkosi.conf
Auto-merging mkosi/mkosi.conf.d/debian-ubuntu/mkosi.conf
Auto-merging mkosi/mkosi.conf.d/opensuse/mkosi.conf
CONFLICT (content): Merge conflict in mkosi/mkosi.conf.d/opensuse/mkosi.conf

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/systemd-boot-native
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/systemd-boot-native/systemd-boot-native_258.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7626348090633508260==--

