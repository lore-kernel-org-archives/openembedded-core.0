Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1854.1792822998963485074
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 23:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=sa7F04fy;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=uXRTJtxA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a16c93f3e5-5bdd2832-d944-4018-a16e-6bedfed07780-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792822998;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jdItfON4NZfful7BCvKkL6ZzPwLy8qJJjs6AgJ/oeo4=;
	b=sa7F04fydfmfgpjz8mU6UxthIa+zsY4tI+rO1f6u4NKzyAtBL1KqqF2WKR83to4l
	k/R+GtIl1eJNlIKe6QNs6gM6U4/W2dJbb5LvugVFqdynhUDhFfYK0MA6G+rNNr12amd
	UYFXtwqxBKu4q+gXBvcgtiPbx0YX5JHiMZyztvU4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792822998;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jdItfON4NZfful7BCvKkL6ZzPwLy8qJJjs6AgJ/oeo4=;
	b=uXRTJtxAIO3eVH5TMr752k67b9GizH8tC19MzD9/Yrv64PWv5+kmhkTHtidWSjI7
	nKy/5fTG8Ky1wzIiOnYKpbvbVcrbNOTxK6U3YA1F6PuoZxf6HD4hT4Mw0OGA4U0l0HU
	LZ+dPWDcYxYHe43QwgR12rNM6GifxfvsccA+YjWo=
Content-Type: multipart/mixed; boundary="===============8260431013557946498=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] patch: upgrading to 2.8.1 FAILED
Message-ID: <010101a16c93f3e5-5bdd2832-d944-4018-a16e-6bedfed07780-000000@us-west-2.amazonses.com>
Date: Sat, 24 Oct 2026 06:23:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.24-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 06:23:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248575

--===============8260431013557946498==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *patch* to *2.8.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade patch -V 2.8.1
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1996 targets, 43 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-49e264bd850d4714d2e8e3728e9f5ac3d7b510bc"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:49e264bd850d4714d2e8e3728e9f5ac3d7b510bc"
meta-yocto-bsp       
meta-poky            = "master:82013b83db7ba41da07694e201a7c43f561a9e00"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 9 Mirrors 0 Missed 2 Current 18 (81% match, 93% complete)
done.
NOTE: Executing Tasks
Log data follows:
| rm: cannot remove '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/patch/2.8/devtooltmp-k0p9cqya/workdir/sources/patch-2.8/lib': Directory not empty
NOTE: Tasks Summary: Attempted 95 tasks of which 90 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261024051501.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261024051501.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
ERROR: Command '['rm', '-rf', '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/patch/2.8/devtooltmp-k0p9cqya/workdir/sources']' returned non-zero exit status 1.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/patch/2.8/devtooltmp-k0p9cqya/temp/log.do_unpack.1528738
ERROR: Extracting source for patch failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8260431013557946498==--
