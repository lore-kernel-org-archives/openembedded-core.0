Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B79C43327
	for <webhook@archiver.kernel.org>; Sat, 27 Jun 2026 06:07:54 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50702.1782540473039989104
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 23:07:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ISTH9JZE;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Uf7HdPjU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019f07b10e3f-55a1816c-1bc6-4ce7-a7d1-308308154d75-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782540472;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XEa4H8+prz1Mu1gCsgSl2w3I8s3Oz1wn340VTuKX9zY=;
	b=ISTH9JZERnkFY51BgYMDhzqRpEf9eUPmyEMM7lbV5lUNl3dVXQvlc3OeNOVtxEaK
	3jYJ3qaCrxe1XxRmacwincZfeG9WP4rKDWum1KF9YNUYky6WBQezhNrTT0OxWu9Ev+O
	0nol98MN1YpckTwSfPFHfcAyK5zPNrdCsGF6hUDQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782540472;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XEa4H8+prz1Mu1gCsgSl2w3I8s3Oz1wn340VTuKX9zY=;
	b=Uf7HdPjU44zwXf1von/rC3m5n8qPYo4PWVxg06KJyMxxY138ZE4sUuwqBna/XfXv
	Ujn6/8NlNIQxkUNL/9KA9iWZ/G64MjwkW6jnZtPNhvpzp2dOmbufpvz8S8eIr6+OyJg
	7Q6M6alAhhYnDoVAvx5W+GJborkGhUWN6NINy84o=
Content-Type: multipart/mixed; boundary="===============1956460411153709561=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Viswanath Kraleti <quic_vkraleti@quicinc.com>, 
	Chen Qi <Qi.Chen@windriver.com>, Chen Qi <Qi.Chen@windriver.com>, 
	Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 systemd-boot-native,systemd-boot,systemd-systemctl-native,systemd: upgrading
 to 261.1,261.1,261.1,261.1 FAILED
Message-ID: <0101019f07b10e3f-55a1816c-1bc6-4ce7-a7d1-308308154d75-000000@us-west-2.amazonses.com>
Date: Sat, 27 Jun 2026 06:07:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.27-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 06:07:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239674

--===============1956460411153709561==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *systemd-boot-native,systemd-boot,systemd-systemctl-native,systemd* to *261.1,261.1,261.1,261.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe systemd-boot-native failed.
NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1978 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-d595615c6a027b80d6f7ea80ab25e85e97b2436f"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:d595615c6a027b80d6f7ea80ab25e85e97b2436f"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
done.
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Creating workspace layer in /srv/pokybuild/yocto-worker/auh/build/build/workspace
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto eff9446d505d62c075bed37d606860b38cfe51fb
WARNING: Command 'git rebase eff9446d505d62c075bed37d606860b38cfe51fb' failed:
Auto-merging .semaphore/semaphore-runner.sh
CONFLICT (content): Merge conflict in .semaphore/semaphore-runner.sh

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/systemd-boot-native
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/systemd-boot-native/systemd-boot-native_261.1.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/systemd-boot-native.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1956460411153709561==--

