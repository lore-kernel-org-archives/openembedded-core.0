Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD45ACD3443
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:40 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15607.1777645529547085677
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=JdvShUhn;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=3un7r6Bt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019de3ee26c2-d6d650d1-3a66-4d5d-aaf7-162a3a6cd7db-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645528;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1ZABeMFahKlltLQ7b1/6XAfz/AiNOdvCCDko/FJ3pp8=;
	b=JdvShUhnENeyIDCGZiuwFUDnti3nBT0aJqnk+oHbZOH7dJAF+UabnIVEwHPvetEO
	OODzVwKYH8wTZjYzZo7U79Glf//CvLU6VE2Qe7SDdzskItaRZrpyC9yehNnXLD5bPxi
	IGR4LOGhJhP37XBZzYnKvceNTgZE+jKTOg1Kzvp0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645528;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1ZABeMFahKlltLQ7b1/6XAfz/AiNOdvCCDko/FJ3pp8=;
	b=3un7r6Btz/TtZSBSumo4R1pgywoZmGecxidu+obTCiWRBfGuvmucAIFdZajJq9o6
	4STb/YlOyPfTp6+QsuZ8djV5SDHm5MYs0q0jjXaemRbrp8a4Q6IUt0SR4gcQVnJZ0fX
	SYhW9xqqLwRMPWS/eE7hIw5m7cDQGHmLuBsqNL3I=
Content-Type: multipart/mixed; boundary="===============9035941669496458983=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>, 
	Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography,python3-cryptography-vectors: upgrading to
 47.0.0,47.0.0 FAILED
Message-ID: <0101019de3ee26c2-d6d650d1-3a66-4d5d-aaf7-162a3a6cd7db-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236200

--===============9035941669496458983==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cryptography,python3-cryptography-vectors* to *47.0.0,47.0.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe python3-cryptography-vectors failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1977 entries from dependency cache.
Parsing recipes...done.
Parsing of 952 .bb files complete (950 cached, 2 parsed). 1979 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-9ca41405e6bca276468a3b6f67eaa328b8016485"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:9ca41405e6bca276468a3b6f67eaa328b8016485"
meta-yocto-bsp       
meta-poky            = "master:a67ae0e83d8aba0c46cb8383808b2d1203fbb414"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 953 .bb files complete (0 cached, 953 parsed). 1980 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-9ca41405e6bca276468a3b6f67eaa328b8016485"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:9ca41405e6bca276468a3b6f67eaa328b8016485"
meta-yocto-bsp       
meta-poky            = "master:a67ae0e83d8aba0c46cb8383808b2d1203fbb414"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-47.0.0.tar.gz;downloadfilename=cryptography_vectors-47.0.0.tar.gz...
INFO: Rebasing devtool onto 2ac877ce79787d7ba38494979a80d587daed6bdd
WARNING: Command 'git rebase 2ac877ce79787d7ba38494979a80d587daed6bdd' failed:
Auto-merging pyproject.toml
CONFLICT (content): Merge conflict in pyproject.toml

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/python3-cryptography-vectors
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/python3-cryptography-vectors/python3-cryptography-vectors.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============9035941669496458983==--

