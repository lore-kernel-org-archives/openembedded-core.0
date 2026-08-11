Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5731C5CFD9
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 07:24:00 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49084.1786433035734846059
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 00:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=q+Sba5Yh;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Zr2nCgZ0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019fefb4da32-345ae141-e488-4950-b36b-c0badb034fa7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786433034;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=veHh1OsnaA9IkoAKkI6IuxOcxkZ5iuIQ16fzwq/08dY=;
	b=q+Sba5YhEiPUONLO3Q92xrQWJr5uLdxW+/bTks1OxSijcO2aDT4bmk3sjRyc6ARY
	JxiExPhgjBhir5ZuvrToRPJWg5P2w43JiiUAkeADWhcy6jnXb5FCrhUJeZlsXOqSAnv
	P1MnxFKEVD9ZhmYn/fprE5s3cDWqGsuzzc4Ge7MA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786433034;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=veHh1OsnaA9IkoAKkI6IuxOcxkZ5iuIQ16fzwq/08dY=;
	b=Zr2nCgZ08hnXQld2GfxBMHArHGBGl8zo/v5XpW3iXm/OfF3jdpWzG6iW8AUYDNFK
	xNmLWylOc7GK0OoJ1je1uZ3opGIjU4ltM3zn3CVyt5OTHnM9PDnPGqVhmY9NhvUONLL
	t3fgn4R9puGtYdnj0Zo8fKIpjd/9M/+qcuj83IyM=
Content-Type: multipart/mixed; boundary="===============2425284333464856913=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Liu Yiding <liuyd.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] blueprint-compiler: upgrading to 0.22.2 FAILED
Message-ID: <0101019fefb4da32-345ae141-e488-4950-b36b-c0badb034fa7-000000@us-west-2.amazonses.com>
Date: Tue, 11 Aug 2026 07:23:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.11-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 07:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243165

--===============2425284333464856913==
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
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1987 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-8ac08b210186db385d4ebd085134155416076c02"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:8ac08b210186db385d4ebd085134155416076c02"
meta-yocto-bsp       
meta-poky            = "master:0afedb9b1195525861f9140d6f33e9cd4118b199"
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
ERROR: Revision ed35ac74de0c1bb1f5e852410b97edd1f08904c9 was found on multiple branches: 
  
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2425284333464856913==--

