Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B4DDCDE00C
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:32:10 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50619.1781195511408346341
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=mAw2KG1j;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jFAn42mn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019eb786b661-3011c27c-605e-4048-ab69-6ccadef7aa65-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195519;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IllEU9+VtS8RHvi1ZDK5aH9r3lzKzMhMV4BJ/3MqgKw=;
	b=mAw2KG1jafJkErJ4keTb2yZmxNzQUFARR+OFo7eZJY+ZlLJCknIMJ47F0yfhZJGb
	L/452mub7eLFxnMYuv0TzNyNJZ3/og28r1Wo8SlajnpximowYXJstwVXckBC5RtZLy1
	e7b66htEKXIohxvlex7vVuBs+IOChNQJ15AYua0A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195519;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IllEU9+VtS8RHvi1ZDK5aH9r3lzKzMhMV4BJ/3MqgKw=;
	b=jFAn42mnuweY0MNALZEVNP/LSlDmP/gkJNEhMVSovDmOS7u3XX0gohEeDdjzSHQ5
	6sPbUp5ihkEFUQ2qlslVWmhEkqfzKuGm1voVj5/nzNjf+nVYlEiD2Obq1KYWSI5ffUU
	nNEByKsz2fvLo4AYb2OZl9aBd2kG8g1oUQPD6y4Y=
Content-Type: multipart/mixed; boundary="===============4739306806430094063=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-ucm-conf: upgrading to 1.2.16 FAILED
Message-ID: <0101019eb786b661-3011c27c-605e-4048-ab69-6ccadef7aa65-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:32:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238551

--===============4739306806430094063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *alsa-ucm-conf* to *1.2.16* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe alsa-ucm-conf failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1980 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-71c1ecede6f1fe6000080d4a533d29047c199815"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:71c1ecede6f1fe6000080d4a533d29047c199815"
meta-yocto-bsp       
meta-poky            = "master:59c41245ad231f5320defcb275477e3d25a2203e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 952 .bb files complete (0 cached, 952 parsed). 1981 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-71c1ecede6f1fe6000080d4a533d29047c199815"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:71c1ecede6f1fe6000080d4a533d29047c199815"
meta-yocto-bsp       
meta-poky            = "master:59c41245ad231f5320defcb275477e3d25a2203e"
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
Adding changed files:  86% |###############################     | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.alsa-project.org/files/pub/lib/alsa-ucm-conf-1.2.16.tar.bz2...
INFO: Rebasing devtool onto da723bbc8e2d604eab2b9c491c72de189d2ad6fd
WARNING: Command 'git rebase da723bbc8e2d604eab2b9c491c72de189d2ad6fd' failed:
Auto-merging ucm2/codecs/da7213/HeadphoneMic2DisableSeq.conf
CONFLICT (content): Merge conflict in ucm2/codecs/da7213/HeadphoneMic2DisableSeq.conf
Auto-merging ucm2/codecs/da7213/HeadphoneMic2EnableSeq.conf
CONFLICT (content): Merge conflict in ucm2/codecs/da7213/HeadphoneMic2EnableSeq.conf

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/alsa-ucm-conf
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/alsa-ucm-conf/alsa-ucm-conf_1.2.16.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4739306806430094063==--

