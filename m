Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF1AC369C1
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:17 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.20169.1744723986590637766
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=VwrsRWjt;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=F0+M4Wnn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019639a76740-d1a2192e-ff2e-4198-a1ef-9e7abc3bb975-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723994;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DeZnLDwAeMrx3uLja0MVq2mD+f8kvNSogpsilbHf+4Y=;
	b=VwrsRWjtjP3r+vMPbPvrDnjqoNP+DgFOEqR8wXAGx9IGHO6zCsx6d9d8+yIODktw
	PbuVmC3FjEEx8jp+TpxkCN3i1xvnLkCPPQxQVAL92GalrAFX0v38JzCRNeRqR/ly5E/
	6HBT/un8JB7G/JIVBZjxdghZ3ic+Jm5cA7htMxBw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723994;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DeZnLDwAeMrx3uLja0MVq2mD+f8kvNSogpsilbHf+4Y=;
	b=F0+M4Wnnr9XexioNokJ2OJbqbb9yB/B8LzH8AZvvC1jqkVPtZ/m4spUuBFJ4GPZa
	WoFzp682kHIMDH9FBTkDE/2AZ54eCoxFlE01Rkr6IzlrRtqY3CSbHZ4VUbdYfxc/YNe
	/f7/BXWrES3/fJRfdcJfuEhn0Yxo2kaSJz7HAjPI=
Content-Type: multipart/mixed; boundary="===============2833466261458250646=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vte: upgrading to 0.80.1 FAILED
Message-ID: <0101019639a76740-d1a2192e-ff2e-4198-a1ef-9e7abc3bb975-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:33:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214940

--===============2833466261458250646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vte* to *0.80.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe vte failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1897 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:9ddf261cda661b8ee4272aa30da3c748022864f1"

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
Parsing of 929 .bb files complete (0 cached, 929 parsed). 1898 targets, 39 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:9ddf261cda661b8ee4272aa30da3c748022864f1"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-ggamnpti: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-gezh5tl5/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-gezh5tl5/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//vte/0.80/vte-0.80.1.tar.xz;name=archive...
INFO: Rebasing devtool onto c13645716c3ff4243d7632ee536a701f0ca77cc3
WARNING: Command 'git rebase c13645716c3ff4243d7632ee536a701f0ca77cc3' failed:
Auto-merging README.md
CONFLICT (content): Merge conflict in README.md

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/vte
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/vte/vte_0.80.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2833466261458250646==--

