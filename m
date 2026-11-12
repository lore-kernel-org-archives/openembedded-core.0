Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7274.1794460829641080590
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 21:20:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hPTtnTB+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=UcjhDzWk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a1ce33436e-6ea3712e-5098-47ee-91ef-a02f6a57527b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794460828;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lEVCftxHYKObHVCtvBR1B0z7+hSZJUyL208xCorSsAs=;
	b=hPTtnTB+t9A2X+btk8wt6zVRdAigBC6EIZkkvaEXE+EdIyfo27w4Gx4hplsZNlRA
	WUHt9Pmqkzjoig+hs9vqXq8XNivOK4rqfOeD56NqQ3xpSky0v94tAw53NCkRhulkeaj
	9iTf5xOmSIELakIkry/SLXL+tsSc/rmgqlYN2a/4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794460828;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lEVCftxHYKObHVCtvBR1B0z7+hSZJUyL208xCorSsAs=;
	b=UcjhDzWkBIxiULOFv5Hk30sEwGdAPY60iWMudMpBwCJ33A1r5UiFnsOsKDdriVIr
	9f2Ro9xB9QisKIY2FuWUTusjj2gx0u63sRXWc7vU84/E/Agu0OBVT12dcIhqZtOnIrr
	N9wXLOHq7oZzrzClqW1ds33WNn4Y6S1IHcrewf70=
Content-Type: multipart/mixed; boundary="===============3456869187173048967=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] efivar: upgrading to 40 FAILED
Message-ID: <010101a1ce33436e-6ea3712e-5098-47ee-91ef-a02f6a57527b-000000@us-west-2.amazonses.com>
Date: Thu, 12 Nov 2026 05:20:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.12-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 05:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250065

--===============3456869187173048967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *efivar* to *40* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade efivar -V 40 -S 226c3299ece37424e9007b555f57f54b1f458b9c
NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 960 .bb files complete (0 cached, 960 parsed). 2004 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-c2ea9568b768de7c479aba22f15520793a7dace4"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:c2ea9568b768de7c479aba22f15520793a7dace4"
meta-yocto-bsp       
meta-poky            = "master:8becfabefdf5df564aafe2d07d10e4b05fbaedb1"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 22 Local 22 Mirrors 0 Missed 0 Current 8 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Creating workspace layer in /srv/pokybuild/yocto-worker/auh/build/build/workspace
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 226c3299ece37424e9007b555f57f54b1f458b9c' failed with exit code 128:
fatal: unable to read tree (226c3299ece37424e9007b555f57f54b1f458b9c)



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3456869187173048967==--
