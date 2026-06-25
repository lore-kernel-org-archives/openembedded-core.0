Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8052CDB479
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 05:42:40 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5191.1782366150953467972
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 22:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MXIp04DD;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NLYrtZgM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019efd4d1ce6-0efe0140-0014-4857-931d-0fd6e96541e7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782366150;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=aNNbwcsFZxeVEbS7q6wMklwX1gxweDIn5R0QFNFwln4=;
	b=MXIp04DD1lzsbxA74b9ZIY8mQNs2F6JPCGRzD45rUjZ+ma2ZepBnHjhjFT/iWi8a
	cp/5oHl1/m6ujqLuE7Egv1x01On9ref53ed7mdPbjP1nftAhoAnAnqtYVeEpTTG3moU
	R9TMoubcdUtAaQcdXO9312Do8bJ2SWYOaUjDNMUs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782366150;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=aNNbwcsFZxeVEbS7q6wMklwX1gxweDIn5R0QFNFwln4=;
	b=NLYrtZgMqEZiiULtYTIWkO6jbA+prILuZTDPqaiwQlxUvxjlAhjFqzhyoGPOAkXt
	GpF10XVQGlm5XU22V/u3NCdFZsQGpblNdOfhFbLKneiWePCJtYRb1dmMrmcRE8i7UwR
	SZW85JpIbx4YgMEK/i25lRUy7so3R3peYh6HkL3A=
Content-Type: multipart/mixed; boundary="===============8116864452503855847=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] kea: upgrading to 3.2.0 FAILED
Message-ID: <0101019efd4d1ce6-0efe0140-0014-4857-931d-0fd6e96541e7-000000@us-west-2.amazonses.com>
Date: Thu, 25 Jun 2026 05:42:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.25-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 05:42:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239536

--===============8116864452503855847==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *kea* to *3.2.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe kea failed.
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
Sstate summary: Wanted 22 Local 22 Mirrors 0 Missed 0 Current 8 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 952 .bb files complete (0 cached, 952 parsed). 1979 targets, 40 skipped, 0 masked, 0 errors.
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
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   6% |##                                  | ETA:  0:00:02
Adding changed files:  13% |####                                | ETA:  0:00:01
Adding changed files:  19% |#######                             | ETA:  0:00:01
Adding changed files:  26% |#########                           | ETA:  0:00:01
Adding changed files:  33% |###########                         | ETA:  0:00:00
Adding changed files:  39% |##############                      | ETA:  0:00:00
Adding changed files:  46% |################                    | ETA:  0:00:00
Adding changed files:  52% |###################                 | ETA:  0:00:00
Adding changed files:  59% |#####################               | ETA:  0:00:00
Adding changed files:  66% |#######################             | ETA:  0:00:00
Adding changed files:  72% |##########################          | ETA:  0:00:00
Adding changed files:  79% |############################        | ETA:  0:00:00
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01
INFO: Creating workspace layer in /srv/pokybuild/yocto-worker/auh/build/build/workspace
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching http://ftp.isc.org/isc/kea/3.2.0/kea-3.2.0.tar.xz...
INFO: Rebasing devtool onto 88d39a11effa12529af2868bf4c223354b7e137d
WARNING: Command 'git rebase 88d39a11effa12529af2868bf4c223354b7e137d' failed:
CONFLICT (modify/delete): src/bin/keactrl/kea-ctrl-agent.conf.pre deleted in HEAD and modified in c94833d (There are conflict of config files between kea and lib32-kea:).  Version c94833d (There are conflict of config files between kea and lib32-kea:) of src/bin/keactrl/kea-ctrl-agent.conf.pre left in tree.
Auto-merging src/bin/keactrl/kea-dhcp4.conf.pre
Auto-merging src/bin/keactrl/kea-dhcp6.conf.pre

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/kea
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/kea/kea_3.2.0.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/kea.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8116864452503855847==--

