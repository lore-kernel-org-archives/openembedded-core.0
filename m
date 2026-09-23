Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD4ACC9830D
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 06:27:48 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1209.1790144866655590448
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 23:27:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=U6EHCj+1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=27fGU/y2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a0ccf2e63c-8add7bc0-23e6-404f-b7fb-f2da8bce3611-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790144866;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5NYU2+A7B8zXoNnKE1XyPQ5ZTSpGgJmJ2JUSsNfU4RQ=;
	b=U6EHCj+1Z+Sei+J/OAJJ6zUsTYw7al5zJ5B/ZDgHiWDo0tf7ctVCK00SDrY1nP6a
	Yz2bONIfvRKKbfyUq+vCIpvjD76vQFaODBhagIU2+e5nLEtLLXkvwpxg/P81aAuKwOh
	uKHqkSRO3/2O+bPZOpKlRJma/9EuSYjQZQnju9eQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790144866;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5NYU2+A7B8zXoNnKE1XyPQ5ZTSpGgJmJ2JUSsNfU4RQ=;
	b=27fGU/y20oRwkHMkpb7P7XfEiCW3epIUVcOtIqVdIUIUloHibCqI+7lxKf+joE7I
	3pt6MMkEVABTwx3yHJ/10rfDWlBjV1qVziUXtdIMkm3KbPNidoEdaXq/wbS3X7zxsBZ
	r7eq39tCNUgtwmaKl+8lpRlijrIMwAk564Xx38M8=
Content-Type: multipart/mixed; boundary="===============5788960121683847382=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jan Schmidt <jan@centricular.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-plugins-rs: upgrading to 0.15.4 FAILED
Message-ID: <010101a0ccf2e63c-8add7bc0-23e6-404f-b7fb-f2da8bce3611-000000@us-west-2.amazonses.com>
Date: Wed, 23 Sep 2026 06:27:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.23-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 06:27:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246439

--===============5788960121683847382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-plugins-rs* to *0.15.4* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gstreamer1.0-plugins-rs -V 0.15.4 -S 1afff3711855238433862c0ce3bf34918e500386
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1994 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-d931446dac36811ff08d610f5e5ab87b785840ef"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:d931446dac36811ff08d610f5e5ab87b785840ef"
meta-yocto-bsp       
meta-poky            = "master:d36c827e02ab138b446386792fd7588b5a041507"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 14 Local 14 Mirrors 0 Missed 0 Current 16 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 1afff3711855238433862c0ce3bf34918e500386' failed with exit code 128:
fatal: unable to read tree (1afff3711855238433862c0ce3bf34918e500386)



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5788960121683847382==--

