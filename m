Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78031C71137
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:32:14 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.11257.1747312308478905269
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:32:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=vbYOMl4q;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=h6i8nfP1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010196d3ee2b2a-ee6b5ecd-ec95-45a0-99a3-b61cbe9d0643-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GATocodnAeKRtIuUvhDWuh+dOCc+8NoOPjA2aJHB0OQ=;
	b=vbYOMl4qeU6vfFCJd688H98QTIZ9sGoY1e/of5Zw8RwHyTm+GWFFYOjG5cX7tTE/
	W02BsYwDruGRNFvAU8dTkEkfhbfBBtFCoSyEu1bCwJrFRSRXIhghxj6f4h5ve4fQfGr
	lTJFoTrQPOwptcvO78TV2aLpCeFX7NJU6418D3XI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GATocodnAeKRtIuUvhDWuh+dOCc+8NoOPjA2aJHB0OQ=;
	b=h6i8nfP1zWdGlC6qAGwf44QukWpt7WjMKY6BlNYDS9VAh2CzaNhm8wC7QHs6zxTm
	6k1Ab9zTnEMMjOw4Zwvv2dXFT+azkcWlTOoxMmcJVpnUbZbSpH+VApsuWsVEQDxrywn
	wSJ/kmwm31inZRd3C0pD8d6go+ag8eKFmJBAgtmw=
Content-Type: multipart/mixed; boundary="===============7449668776440633765=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libsecret: upgrading to 0.21.7 FAILED
Message-ID: <01010196d3ee2b2a-ee6b5ecd-ec95-45a0-99a3-b61cbe9d0643-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:32:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:32:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216642

--===============7449668776440633765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libsecret* to *0.21.7* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libsecret failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1916 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a39985595a7ded52ec019318f647d82a41e64534"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 938 .bb files complete (0 cached, 938 parsed). 1917 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a39985595a7ded52ec019318f647d82a41e64534"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-l3bw8hxe: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-rmeuftir/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-rmeuftir/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//libsecret/0.21/libsecret-0.21.7.tar.xz;name=archive...
INFO: Rebasing devtool onto 8b544aee1f1780d00d4551dd05018f374dcbe180
WARNING: Command 'git rebase 8b544aee1f1780d00d4551dd05018f374dcbe180' failed:
Auto-merging meson_options.txt
CONFLICT (content): Merge conflict in meson_options.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libsecret
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libsecret/libsecret_0.21.7.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7449668776440633765==--

