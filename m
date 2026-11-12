Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7361.1794460832566742086
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 21:20:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=C3Nrw4Gf;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=sOVps+9p;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a1ce334fd1-361b214d-b453-4c92-b475-2bbbb63956cd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794460831;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3R3MPhf0bw+9ymYavYk2GLnhH0f9TRQiZPh2nY7KgzY=;
	b=C3Nrw4GfkRLYUxYW/J2Rk5d4hmxRDqU2dTfMTDhYjdl0hrgCvFk3oI0hzeMDXMjH
	ZkJ0DenxdUq9O0a/oPNiG+Oue0ozcWE7Rtf74wV1FiZO/iFoZQteajaQVP4qzR1qx3y
	qaIq3ABGstNj8Z3IeQTrKGt1W4QYNRi67XBjQiaQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794460831;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3R3MPhf0bw+9ymYavYk2GLnhH0f9TRQiZPh2nY7KgzY=;
	b=sOVps+9pwq//jv8WXnsG3+UbJKfttYOQ1wLJBiqQx2nyOXUteo5p10+2JsVIUJ3P
	Vm8JftYBGqNlR1m+klFHEker8Aa7jwq/oV5Rtow8od6ZUMqnGd+Uj7Uexbn7pkSTk0L
	/XEEd+dePBCtVQm+MdMTrpd71NSlA0xXKuXLiEOo=
Content-Type: multipart/mixed; boundary="===============1709460025424014543=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Liu Yiding <liuyd.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] blueprint-compiler: upgrading to 0.22.2 FAILED
Message-ID: <010101a1ce334fd1-361b214d-b453-4c92-b475-2bbbb63956cd-000000@us-west-2.amazonses.com>
Date: Thu, 12 Nov 2026 05:20:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.12-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 05:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250068

--===============1709460025424014543==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *blueprint-compiler* to *0.22.2* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade blueprint-compiler -V 0.22.2 -S ed35ac74de0c1bb1f5e852410b97edd1f08904c9
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
DISTRO_VERSION       = "6.1.99+snapshot-1e268f24080cb7b0f9b4744fc18aef226ea841f1"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:1e268f24080cb7b0f9b4744fc18aef226ea841f1"
meta-yocto-bsp       
meta-poky            = "master:8becfabefdf5df564aafe2d07d10e4b05fbaedb1"
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
ERROR: Execution of 'git checkout ed35ac74de0c1bb1f5e852410b97edd1f08904c9' failed with exit code 128:
fatal: unable to read tree (ed35ac74de0c1bb1f5e852410b97edd1f08904c9)



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1709460025424014543==--
