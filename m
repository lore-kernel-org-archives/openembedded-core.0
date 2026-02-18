Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F03E9A047
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:36 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1408.1771440093928930767
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=E4R9rpst;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=cFsEREKW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019c720eb822-4ce67014-04e1-4c93-865c-e12a6a78412d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440093;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qj49M1IvZ1bIXmiuSkNiGI0tK/q94Doosf0hYr7r/4g=;
	b=E4R9rpstxL2Xhy2ySy49rsWz6yRGACL9Gux/iR/x8PuNy6uGWRKlQcq3Bf5jBl19
	pjkzWusylfMJDy84R73v793H/X85H5IJw7Y5TEVfZdapq7En/y44DU6xGOKAkLaUOTN
	1Q2G0Ubjf2jVhXorrYLhX6r3fB4iVisHJS8GlxKc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440093;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qj49M1IvZ1bIXmiuSkNiGI0tK/q94Doosf0hYr7r/4g=;
	b=cFsEREKW68Zby8jsNbbr1jQV+vUHJrZ7dPuyyiuGAFAjM3K9cn5PieCwVRIHlma4
	R0TvcBfB1jREthArp7W7GzXbh8dX/gTiUJniEDVTragfd7SGMiYIAE+m3EA79uDkIB6
	eVs347LcBY8KcW53a9Ls8AHwby8Sv7+9vRR0zHmE=
Content-Type: multipart/mixed; boundary="===============6565071077978793583=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>, Chen Qi <Qi.Chen@windriver.com>, 
	Chen Qi <Qi.Chen@windriver.com>, 
	Viswanath Kraleti <quic_vkraleti@quicinc.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 systemd,systemd-systemctl-native,systemd-boot,systemd-boot-native: upgrading
 to 259.1,259.1,259.1,259.1 FAILED
Message-ID: <0101019c720eb822-4ce67014-04e1-4c93-865c-e12a6a78412d-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231320

--===============6565071077978793583==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *systemd,systemd-systemctl-native,systemd-boot,systemd-boot-native* to *259.1,259.1,259.1,259.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe systemd failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1952 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-0dbc300ff37660960f604b020bd9afe190dab7a3"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:0dbc300ff37660960f604b020bd9afe190dab7a3"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 6a36f1c7420dcb8e5176796676047f058466fe7a
WARNING: Command 'git rebase 6a36f1c7420dcb8e5176796676047f058466fe7a' failed:
Auto-merging .semaphore/semaphore-runner.sh
CONFLICT (content): Merge conflict in .semaphore/semaphore-runner.sh

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-libc-musl onto 6a36f1c7420dcb8e5176796676047f058466fe7a
WARNING: Command 'git rebase 6a36f1c7420dcb8e5176796676047f058466fe7a' failed:
Auto-merging .semaphore/semaphore-runner.sh
CONFLICT (content): Merge conflict in .semaphore/semaphore-runner.sh

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/systemd
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/systemd/systemd_259.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6565071077978793583==--

