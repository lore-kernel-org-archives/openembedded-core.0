Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8370.1794115342866521663
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Nov 2026 21:22:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MniA42G0;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=w6l1r1gw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a1b99b8e3b-a2b817b9-057a-444a-afcb-66f2ff0122c7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794115342;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mgDaOssFKQ9Cy1oYDsGAWdUZoFU9mqYtLBT+Zs6RTbU=;
	b=MniA42G0VHKIOs+EE3B1cTwpQlqjLVs/bS5VpDv3PHIZcyoEBM4F4mUmx9GqarJY
	34HRl+uwklWJzBL8hDQkx22wqDHycts84c7DBegt5LRrUm7q9FUfnDJnfwFWGXpuGVU
	XcYXnJTvQ+1W/B89XRnygoCmf6ksavN9EDVDWTt8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794115342;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mgDaOssFKQ9Cy1oYDsGAWdUZoFU9mqYtLBT+Zs6RTbU=;
	b=w6l1r1gwJ+1G5kaEpKlQiODjHxGcetjASAIg6lbOoke5XWK3tlk5ENSXabollbtd
	c0Yy2hC7oWXRvpJtODBEQHEfjtllJ/8T6F1bUysgcGIxjTb4mzhf/IRqf5krWn2pwt7
	vC0LTnw4sKqPgHUB5digkyap3+2/BIU/nwt5jOE0=
Content-Type: multipart/mixed; boundary="===============8614612880810898173=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Aravind Bandari <Aravind.Bandari@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] automake: upgrading to 1.20 FAILED
Message-ID: <010101a1b99b8e3b-a2b817b9-057a-444a-afcb-66f2ff0122c7-000000@us-west-2.amazonses.com>
Date: Sun, 8 Nov 2026 05:22:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.08-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 05:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249747

--===============8614612880810898173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *automake* to *1.20* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade automake -V 1.20
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 960 .bb files complete (0 cached, 960 parsed). 2003 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-bf5baee869147090fa7a72cff72a08b087b2328b"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:bf5baee869147090fa7a72cff72a08b087b2328b"
meta-yocto-bsp       
meta-poky            = "master:dd6c2950bb507f8c311bd82410a032ed6eb38063"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 16 Local 11 Mirrors 0 Missed 5 Current 13 (68% match, 82% complete)
done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 101 tasks of which 81 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261108050918.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261108050918.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
ERROR: Bitbake Fetcher Error: UnpackError("Unpack command ['tar', '--extract', '--no-same-owner', '-z', '-f', '/srv/pokybuild/yocto-worker/auh/build/build/downloads/automake-1.19.tar.gz'] failed with return value 2", 'https://ftpmirror.gnu.org//automake/automake-1.19.tar.gz')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/automake/1.19/devtooltmp-qib7zho7/temp/log.do_unpack.3712010
ERROR: Extracting source for automake failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8614612880810898173==--
