Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.487.1793944897109022030
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 22:01:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VnA8F/Hk;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=1yEnYkX4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a1af72c1f0-75b0cd3b-d195-40ec-9c97-ff26fe2083fa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793944896;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=jtnnFGK3bYGX1qYJGZ6fwschz9h2cc5iTp9SGwE+avk=;
	b=VnA8F/HkMom6IefxjOwLqY0vdWFZ0O2GK5oSjYxZj+jhxIp8/6fxzwlQqgugdlEE
	rjBi48UMWRZwAdSWUaPHcnKbQIZnmany5lpzDPE7mwWleVh78pkoF79VjA5vY6k+i3c
	L8+3LzmMPPuN0HLN/o8Kb/CfFN6R45Ve04bvLpbE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793944896;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=jtnnFGK3bYGX1qYJGZ6fwschz9h2cc5iTp9SGwE+avk=;
	b=1yEnYkX4cwJhymEAQ6x9OLtC60/KrLaAiqCyaXqcqq0MMOoX7VOfW6zAVvNPb8CU
	xiMGxVtVX/jTsFcICsmoJv7uZnHSHU9IPKnoZGrb2mPAMtQorwPtszOeBVLIPn2ZlQK
	kmLI7KIhzwJ8QXwqqPA278k6WN/CAx3PXZYysJYM=
Content-Type: multipart/mixed; boundary="===============4440250240171826339=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] bluez5: upgrading to 5.88 FAILED
Message-ID: <010101a1af72c1f0-75b0cd3b-d195-40ec-9c97-ff26fe2083fa-000000@us-west-2.amazonses.com>
Date: Fri, 6 Nov 2026 06:01:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.06-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 06:01:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249587

--===============4440250240171826339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *bluez5* to *5.88* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe bluez5 failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 2003 entries from dependency cache.
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
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 961 .bb files complete (0 cached, 961 parsed). 2004 targets, 43 skipped, 0 masked, 0 errors.
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
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  25% |#########                           | ETA:  0:00:00
Adding changed files:  51% |##################                  | ETA:  0:00:00
Adding changed files:  76% |###########################         | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://cdn.kernel.org/pub/linux/bluetooth/bluez-5.88.tar.xz...
INFO: Rebasing devtool onto 9821001184203c2e1ebf3d50e11ce824c0b034bc
WARNING: Command 'git rebase 9821001184203c2e1ebf3d50e11ce824c0b034bc' failed:
Auto-merging Makefile.am
CONFLICT (content): Merge conflict in Makefile.am

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/bluez5
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/bluez5/bluez5_5.88.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/bluez5.txt
INFO: Changelog metadata written to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/bluez5.json



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4440250240171826339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bluez5-changelog.txt"

ver 5.88:
Fix issue with UUID discovery filter match.
Fix issue with handling unsupported MAP events.
Fix issue with AVRCP and ListPlayerAttributes response.
Add support for Shorter Connection Interval settings.
Add support for Connection Subrating settings.
Add support for Channel Sounding interfaces.

--===============4440250240171826339==--
