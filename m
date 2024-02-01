Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B127C54E7C
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:20 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.2093.1706810404801875450
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZaxmirnM;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NwD8NdMJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018d65d3ee90-8899bc6b-8dfd-4768-9cc0-586dbb580b39-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810404;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=myN56Y2ZF33nj8l9TSRuf6HySWq8FkJ6ZmFyVgFUmOU=;
	b=ZaxmirnMFutIag1z03Cw95A5AHCBiOarGJjqxBUBVHUezPGRCxA4FU7wAc0KtSeP
	FJge2Qz3SEf4nn/EaagqIC83QQrTN8xVwxxqHZJcbF28oY06MPsP9VAPx9fPO2Ka+07
	drWkYQCpzyYX6ASKr48HQYbgnMrTJkK92v71cpOw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810404;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=myN56Y2ZF33nj8l9TSRuf6HySWq8FkJ6ZmFyVgFUmOU=;
	b=NwD8NdMJ9HewcuM/qYfO4gv/HzZ4I6qHSYS+lk7ppqbXu2wo+Da1Q8QU6fXn3wgZ
	2hdJCEedovX8HaCTzm5vKE33BWysU0arJicrq8VUA7K8Ygfv0mnSUMoUJW59uM2vEfP
	D9EnQ8VX9GvqvUY0B96k1WliW9/jjc0xpuum/6nE=
Content-Type: multipart/mixed; boundary="===============3080088537324105376=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] binutils: upgrading to 2.42 FAILED
Message-ID: <0101018d65d3ee90-8899bc6b-8dfd-4768-9cc0-586dbb580b39-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194609

--===============3080088537324105376==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *binutils* to *2.42* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade binutils -V 2.42 -S c7f28aad0c99d1d2fec4e52ebfa3735d90ceb8e9
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1850 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-257c025af81fec912f44e28f344f14c8935b904e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:257c025af81fec912f44e28f344f14c8935b904e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto c7f28aad0c99d1d2fec4e52ebfa3735d90ceb8e9
WARNING: Command 'git rebase c7f28aad0c99d1d2fec4e52ebfa3735d90ceb8e9' failed:
Auto-merging bfd/ChangeLog
Auto-merging bfd/configure
CONFLICT (content): Merge conflict in bfd/configure
Auto-merging bfd/po/bfd.pot
CONFLICT (content): Merge conflict in bfd/po/bfd.pot
Auto-merging bfd/version.m4
CONFLICT (content): Merge conflict in bfd/version.m4
Auto-merging binutils/ChangeLog
Auto-merging binutils/configure
CONFLICT (content): Merge conflict in binutils/configure
Auto-merging binutils/po/binutils.pot
CONFLICT (content): Merge conflict in binutils/po/binutils.pot
Auto-merging gas/ChangeLog
Auto-merging gas/configure
CONFLICT (content): Merge conflict in gas/configure
Auto-merging gas/po/gas.pot
CONFLICT (content): Merge conflict in gas/po/gas.pot
Auto-merging gold/po/gold.pot
CONFLICT (content): Merge conflict in gold/po/gold.pot
Auto-merging gprof/ChangeLog
Auto-merging gprof/configure
CONFLICT (content): Merge conflict in gprof/configure
Auto-merging gprof/po/gprof.pot
CONFLICT (content): Merge conflict in gprof/po/gprof.pot
Auto-merging gprofng/configure
CONFLICT (content): Merge conflict in gprofng/configure
Auto-merging gprofng/doc/version.texi
CONFLICT (content): Merge conflict in gprofng/doc/version.texi
Auto-merging gprofng/libcollector/configure
CONFLICT (content): Merge conflict in gprofng/libcollector/configure
Auto-merging ld/ChangeLog
Auto-merging ld/configure
CONFLICT (content): Merge conflict in ld/configure
Auto-merging ld/po/ld.pot
CONFLICT (content): Merge conflict in ld/po/ld.pot
Auto-merging opcodes/ChangeLog
Auto-merging opcodes/configure
CONFLICT (content): Merge conflict in opcodes/configure
Auto-merging opcodes/po/opcodes.pot
CONFLICT (content): Merge conflict in opcodes/po/opcodes.pot

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-nativesdk onto c7f28aad0c99d1d2fec4e52ebfa3735d90ceb8e9
WARNING: Command 'git rebase c7f28aad0c99d1d2fec4e52ebfa3735d90ceb8e9' failed:
Auto-merging bfd/ChangeLog
Auto-merging bfd/configure
CONFLICT (content): Merge conflict in bfd/configure
Auto-merging bfd/po/bfd.pot
CONFLICT (content): Merge conflict in bfd/po/bfd.pot
Auto-merging bfd/version.m4
CONFLICT (content): Merge conflict in bfd/version.m4
Auto-merging binutils/ChangeLog
Auto-merging binutils/configure
CONFLICT (content): Merge conflict in binutils/configure
Auto-merging binutils/po/binutils.pot
CONFLICT (content): Merge conflict in binutils/po/binutils.pot
Auto-merging gas/ChangeLog
Auto-merging gas/configure
CONFLICT (content): Merge conflict in gas/configure
Auto-merging gas/po/gas.pot
CONFLICT (content): Merge conflict in gas/po/gas.pot
Auto-merging gold/po/gold.pot
CONFLICT (content): Merge conflict in gold/po/gold.pot
Auto-merging gprof/ChangeLog
Auto-merging gprof/configure
CONFLICT (content): Merge conflict in gprof/configure
Auto-merging gprof/po/gprof.pot
CONFLICT (content): Merge conflict in gprof/po/gprof.pot
Auto-merging gprofng/configure
CONFLICT (content): Merge conflict in gprofng/configure
Auto-merging gprofng/doc/version.texi
CONFLICT (content): Merge conflict in gprofng/doc/version.texi
Auto-merging gprofng/libcollector/configure
CONFLICT (content): Merge conflict in gprofng/libcollector/configure
Auto-merging ld/ChangeLog
Auto-merging ld/configure
CONFLICT (content): Merge conflict in ld/configure
Auto-merging ld/po/ld.pot
CONFLICT (content): Merge conflict in ld/po/ld.pot
Auto-merging opcodes/ChangeLog
Auto-merging opcodes/configure
CONFLICT (content): Merge conflict in opcodes/configure
Auto-merging opcodes/po/opcodes.pot
CONFLICT (content): Merge conflict in opcodes/po/opcodes.pot

You will need to resolve conflicts in order to complete the upgrade.
ERROR: Could not decode SRC_URI: The URL: '${BINUTILS_GIT_URI}' is invalid and cannot be interpreted


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3080088537324105376==--

