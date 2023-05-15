Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A12CA9EC4
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:17 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.3713.1684186747962006618
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=G2kaauyZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010188215a4fe4-7226f348-be00-4085-a7e4-06bed62c217c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Z9MxdLHKoykspM97Hlg9fMz1R+iwhGvgf+Wo8Ju+s8c=;
	b=G2kaauyZ//oRgpQB86ObUHqcyROwYzdUz0A64eQuexWoBRtUPpzVs+9Gi39VaVcX
	P8iA3OYQQ6fFr1qDNXKsHZof9/yxx4E6eK39HqoyyMaJ+J/SKjTIwLwIRs5AY8sDl89
	PhvTDltlGN1vxQE2K/acJSDJiAkSoKvYF1TjTe7g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Z9MxdLHKoykspM97Hlg9fMz1R+iwhGvgf+Wo8Ju+s8c=;
	b=UcPuvhRXz+8rtsjm9lsdciyIpn/kzaKhgwzpgh8QwdunpVvf6nLMqIddnjNPpJtU
	ispYtpDWt0KlKRBfadwo5686YdeESKfBwtJ9HmipjUXR/3XKz2ThR9/rXdLXL8HRXKs
	bpvABQz4iw78jEg6PQ+oa13D6litIGDu5Pq7gf0M=
Content-Type: multipart/mixed; boundary="===============6986900121566937912=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] perl: upgrading to 5.36.1 FAILED
Message-ID: <01010188215a4fe4-7226f348-be00-4085-a7e4-06bed62c217c-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181310

--===============6986900121566937912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *perl* to *5.36.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe perl failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (09:40:51.785901)
Loading cache...done.
Loaded 1804 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4f6fa55f283e7990e73f0acb8f01463cd5298815"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 1804 entries from dependency cache.
Parsing recipes...done.
Parsing of 901 .bb files complete (899 cached, 2 parsed). 1805 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4f6fa55f283e7990e73f0acb8f01463cd5298815"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.cpan.org/src/5.0/perl-5.36.1.tar.gz;name=perl...
INFO: Rebasing devtool onto 0b251c5a1345e2367b03ad39667798bad8325a91
WARNING: Command 'git rebase 0b251c5a1345e2367b03ad39667798bad8325a91' failed:
Auto-merging proto.h
CONFLICT (content): Merge conflict in proto.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto 0b251c5a1345e2367b03ad39667798bad8325a91
WARNING: Command 'git rebase 0b251c5a1345e2367b03ad39667798bad8325a91' failed:
Auto-merging proto.h
CONFLICT (content): Merge conflict in proto.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-target onto 0b251c5a1345e2367b03ad39667798bad8325a91
WARNING: Command 'git rebase 0b251c5a1345e2367b03ad39667798bad8325a91' failed:
Auto-merging proto.h
CONFLICT (content): Merge conflict in proto.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/perl
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/perl/perl_5.36.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6986900121566937912==--

