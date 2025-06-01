Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A953C7113E
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:34 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.27788.1748786127611541400
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=XYGJ464O;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=koRR95lx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101972bc6ab4c-4598728c-095d-4896-8a7f-458da046852f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786129;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nLLBriH3qJ89smIlyjIef6ZOjuCpuzZW/+jNtLx7p70=;
	b=XYGJ464OrUrIXxTnCBv5gTAG5PhsqGy5pWU0dECJilbwLEi7AYqQsuoXl5TqFkNu
	FrzsQ8RfW5sCl4dYceO4oesAv9UTHhkviYlImZyRryA0qCzM0jI2CThPkQO6xiUzhcj
	61vS11dIOwPBblOzNcYvdFAWhISDPhuYqNq5Kc1I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786129;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nLLBriH3qJ89smIlyjIef6ZOjuCpuzZW/+jNtLx7p70=;
	b=koRR95lxMJ4JGlzZFdX9/+n9dsfN5Z2VbdR6++e7e2KWpKBnyfqOEcgp5BvDe9Aj
	wjrw3x2/wXhg/8jCbubOWaqgE4im/fE29tjTTu34vow0XUXAu2N7WaN++1GeCl/T06y
	C/IxYs/JVrwhzYKZDn+8Z+iRd3kGLsz8X/t9DmfA=
Content-Type: multipart/mixed; boundary="===============7432834895883182198=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-networking: upgrading to 2.80.1 FAILED
Message-ID: <010101972bc6ab4c-4598728c-095d-4896-8a7f-458da046852f-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217580

--===============7432834895883182198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *glib-networking* to *2.80.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe glib-networking failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1915 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:320a055fcb1ce663f1b84ff3cf9f37e56ed6d6ce"

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
Parsing of 937 .bb files complete (0 cached, 937 parsed). 1916 targets, 39 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:320a055fcb1ce663f1b84ff3cf9f37e56ed6d6ce"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-32e9hhaa: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-e8wzwkpn/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-e8wzwkpn/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//glib-networking/2.80/glib-networking-2.80.1.tar.xz;name=archive...
INFO: Rebasing devtool onto deb0b06dc5c5a1f0642b4e531cd20d456563a6ff
WARNING: Command 'git rebase deb0b06dc5c5a1f0642b4e531cd20d456563a6ff' failed:
Auto-merging tls/tests/connection.c
CONFLICT (content): Merge conflict in tls/tests/connection.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/glib-networking
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/glib-networking/glib-networking_2.80.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7432834895883182198==--

