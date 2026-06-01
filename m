Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2476BCD6E55
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:29 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1549.1780328126343726066
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VS60OFm9;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=3P7QbTZm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019e83d35441-229f53f9-cc0b-4cff-a856-065e8a8dd29e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328125;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CmNZW79QmjGOAnm99UhSV9u2dJmFP2sQ3FCiaW4kq7I=;
	b=VS60OFm9ntYSCv3e2/utdrhKr97tM+PUIKipt0GjZYzsT6SDPjPXdvOHqejtxTq0
	X69oHCh17qrd/Uk1mGPLU/aHxdG0XTiu0cO3KtG26LcpPGCPXc8iBcQEMF4ZfQnU9np
	fCk0AjYMnueOdi64sRfDlFkdarGtq6ZBJLJDJJtw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328125;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CmNZW79QmjGOAnm99UhSV9u2dJmFP2sQ3FCiaW4kq7I=;
	b=3P7QbTZmxRCJ+Q2FF3ULD82v5HmrdkaGCj6H4pLRayPhb7uQZ5uuo09+X1YV7Ete
	vIUMK0ZsMoSGYJoiR2Rjr7A7HQonorafKWZho4cU4/wBjW0NbEEWe21MzOOZh5MSKR0
	o8epdX9vXDgrLV+taAUXUuZzGQKYibcTPFzgMIVQ=
Content-Type: multipart/mixed; boundary="===============2305895218145935308=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>, Chen Qi <Qi.Chen@windriver.com>, 
	Chen Qi <Qi.Chen@windriver.com>, 
	Viswanath Kraleti <quic_vkraleti@quicinc.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 systemd,systemd-systemctl-native,systemd-boot,systemd-boot-native: upgrading
 to 260.2,260.2,260.2,260.2 FAILED
Message-ID: <0101019e83d35441-229f53f9-cc0b-4cff-a856-065e8a8dd29e-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237841

--===============2305895218145935308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *systemd,systemd-systemctl-native,systemd-boot,systemd-boot-native* to *260.2,260.2,260.2,260.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe systemd failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1975 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-d98e3b4418811c903798f3b4811e16b84b371a0f"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:d98e3b4418811c903798f3b4811e16b84b371a0f"
meta-yocto-bsp       
meta-poky            = "master:d13ca2a2e0f478046d920b8fc7dd3098952b5ad8"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto f1d0952a125b96b7ab2f1ff29a87448ade8ac29b
WARNING: Command 'git rebase f1d0952a125b96b7ab2f1ff29a87448ade8ac29b' failed:
Auto-merging .semaphore/semaphore-runner.sh
CONFLICT (content): Merge conflict in .semaphore/semaphore-runner.sh

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/systemd
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/systemd/systemd_260.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2305895218145935308==--

