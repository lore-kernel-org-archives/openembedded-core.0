Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D08D6204E
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:42 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.4845.1731964652359464121
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=iIr1ea0K;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=z+1p9Eih;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010193412349c1-89761a0c-e087-4e75-9868-a687a10375ae-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964652;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9GyMtButrRD/ruIDVfUqsADhEHuTM6fJXWTFvDLPmaY=;
	b=iIr1ea0KGvPj0JqxTqbuksIShyTvUf3wFAyfbKlOVkLUffReNCVaJWGEmStQL+YI
	cR65CDAIbaOmXTDZJmMMPitAKyHurxfCIJcY1dZHSwn37xae0bFFwjhPZ9xEvvIkIYB
	d0Y5LGqrln/Oq9PNTZcvzVWldfGZcDaxhMSp8qns=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964652;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9GyMtButrRD/ruIDVfUqsADhEHuTM6fJXWTFvDLPmaY=;
	b=z+1p9EihgJSawZtDTxVuAeSzWwQyvAi1hqU5jwR+KwZLA0KfB5YmgwIjbSmG6OU/
	Txcq7NnZkQGUBhgvXRrCSYVuf61Vluk6YBtdzUIBkBdjoJsdlb4CPZS+K2NlpwtaxiO
	GHZ7uDLC0wk2axmnRe5B40Jr3I4wyfMmPw8WRip4=
Content-Type: multipart/mixed; boundary="===============7191196883368166965=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libpipeline: upgrading to 1.5.8 FAILED
Message-ID: <01010193412349c1-89761a0c-e087-4e75-9868-a687a10375ae-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207311

--===============7191196883368166965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libpipeline* to *1.5.8* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libpipeline failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c0b4a59c305aa2f30537f1878e65e782b9654d4e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 12 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (0 cached, 922 parsed). 1881 targets, 41 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c0b4a59c305aa2f30537f1878e65e782b9654d4e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-41vgxoyv: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-n6pvi776/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-n6pvi776/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 12 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  30% |##########                          | ETA:  0:00:02
Adding changed files:  60% |#####################               | ETA:  0:00:01
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.savannah.gnu.org/releases/libpipeline/libpipeline-1.5.8.tar.gz...
INFO: Rebasing devtool onto dae39a8531cbf37b50d0d9b38a2545a0244fc603
WARNING: Command 'git rebase dae39a8531cbf37b50d0d9b38a2545a0244fc603' failed:
Auto-merging gl/m4/largefile.m4
CONFLICT (content): Merge conflict in gl/m4/largefile.m4

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libpipeline
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libpipeline/libpipeline_1.5.8.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7191196883368166965==--

