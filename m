Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8419C54ECF
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:21 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.2093.1706810404801875450
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=IBeqIXaR;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=p3mZX3zT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018d65d3eb85-5dd83f78-d246-4608-9e85-809fc697928b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810403;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wd6S2inLWBw2Pu+hwJN2Mrl2rKof6m++370M7jF3dXM=;
	b=IBeqIXaRDsVdggQ0NfUCQnEAWq7yZJp4af9YCBekNAa5YN/7nXYBpj1JEWAxJrlH
	lUEEKavSFyS2s/QnQfvVbIeiaa3OsOcIvX39nMTHgXpcboclkbH0zaOAkVPX0ptjcwb
	xw8nUXv7ISqloh3E9T6KlHh8r91HJRi+OET1kpR4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810403;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wd6S2inLWBw2Pu+hwJN2Mrl2rKof6m++370M7jF3dXM=;
	b=p3mZX3zTUYdm/CNl8adSFz5UXRpLvk5vf0vSwt0zl5krdiCFiUC6zbyDQqWmnUif
	v84KMnNc1AhcL/MqClSdfp60U1mrUgfJNlKi95lGq7BOTE0Gl03LlMewRT6QCDMReTl
	vn+3s83ulT5WfUG0XTZ/rbnCz0KuF+Qit3fbDPD4=
Content-Type: multipart/mixed; boundary="===============1044882481264591295=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Lukasz Majewski <lukma@denx.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glibc-y2038-tests: upgrading to 2.39 FAILED
Message-ID: <0101018d65d3eb85-5dd83f78-d246-4608-9e85-809fc697928b-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194604

--===============1044882481264591295==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glibc-y2038-tests* to *2.39* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade glibc-y2038-tests -V 2.39 -S 903cd866060555c77abbf70d0d85994ec5a18193
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1849 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-704ba8e8fdd25a4c407f2cf700bc67d4677683ff"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:704ba8e8fdd25a4c407f2cf700bc67d4677683ff"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 903cd866060555c77abbf70d0d85994ec5a18193
WARNING: Command 'git rebase 903cd866060555c77abbf70d0d85994ec5a18193' failed:
Auto-merging NEWS
CONFLICT (content): Merge conflict in NEWS
Auto-merging elf/dl-close.c
CONFLICT (content): Merge conflict in elf/dl-close.c
Auto-merging elf/dl-fini.c
Auto-merging elf/dl-init.c
Auto-merging elf/dso-sort-tests-1.def
CONFLICT (content): Merge conflict in elf/dso-sort-tests-1.def
Auto-merging elf/tst-audit23.c
Auto-merging include/link.h
Auto-merging sysdeps/generic/ldsodefs.h

You will need to resolve conflicts in order to complete the upgrade.
ERROR: Could not decode SRC_URI: The URL: '${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc' is invalid and cannot be interpreted


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1044882481264591295==--

