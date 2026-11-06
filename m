Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.486.1793944896959291960
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 22:01:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RHaA9sUJ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=OU+7Ca1F;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a1af72c13c-16e4dea7-76c6-4e6a-a0b2-d8eb9d97236b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793944895;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xbR8Doy180HfhkPKC+7ITSrTAIj9R7Bng9fBKGjzs00=;
	b=RHaA9sUJ9o6cWXhYH7EpyGvNVe9sBs8n6FEHKeYxZcuPBwCIEcRM3u8NcuwJ3fup
	RfH2m4y8qdmyRrMUzDJABrN8ZCXUzPvVy63uxKeVwvr89sz6b9HYD8tIE7lehFkP8q4
	IzrYG64gAKK12O/l08lfwtDkkn3YC+N+CPWD150I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793944895;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xbR8Doy180HfhkPKC+7ITSrTAIj9R7Bng9fBKGjzs00=;
	b=OU+7Ca1F12I+MAYCSwslLGBpiYrGToEXsmQWnmxGgOCnU5szfN+rAyKO34DJgNLg
	vTd9FFw/t6d97zJ/jgQEbTVGFyBlj6PcHTMnb+wK7DBL550mAhmdD0wRW8sEcP6l6LZ
	IimAWKpFZ2cFG5owFLs+OlxehPUMTL+zmprqGq1o=
Content-Type: multipart/mixed; boundary="===============0498771555486709058=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Viswanath Kraleti <quic_vkraleti@quicinc.com>, 
	Sai Sireesha T <saisireesha.t@windriver.com>, 
	Sai Sireesha T <saisireesha.t@windriver.com>, 
	Sai Sireesha T <saisireesha.t@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot-native,systemd-tools-native,systemd,systemd-boot:
 upgrading to 262.2 FAILED
Message-ID: <010101a1af72c13c-16e4dea7-76c6-4e6a-a0b2-d8eb9d97236b-000000@us-west-2.amazonses.com>
Date: Fri, 6 Nov 2026 06:01:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.06-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 06:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249585

--===============0498771555486709058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *systemd-boot-native,systemd-tools-native,systemd,systemd-boot* to *262.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe systemd-tools-native failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 2003 entries from dependency cache.
Parsing recipes...done.
Parsing of 961 .bb files complete (960 cached, 1 parsed). 2004 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-35d103be8b1a2346b7d0a7ff83745ad74d6817e2"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:35d103be8b1a2346b7d0a7ff83745ad74d6817e2"
meta-yocto-bsp       
meta-poky            = "master:dd6c2950bb507f8c311bd82410a032ed6eb38063"
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
INFO: Rebasing devtool onto 63511d7283d7d0e2a2fc28075481afaf1a7be8f5
WARNING: Command 'git rebase 63511d7283d7d0e2a2fc28075481afaf1a7be8f5' failed:
Auto-merging src/basic/chase.c
CONFLICT (content): Merge conflict in src/basic/chase.c
Auto-merging src/basic/fd-util.c
Auto-merging src/basic/fd-util.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/systemd-tools-native
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/systemd-tools-native/systemd-tools-native_262.2.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/systemd-tools-native.txt
INFO: Changelog metadata written to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/systemd-tools-native.json



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0498771555486709058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="systemd-boot-native-changelog.txt"

kernel command line, version, firmware properties and machine tags).

--===============0498771555486709058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="systemd-tools-native-changelog.txt"

kernel command line, version, firmware properties and machine tags).

--===============0498771555486709058==--
