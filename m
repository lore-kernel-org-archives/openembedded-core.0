Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D00CECD4F22
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:59 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15719.1777645545728518817
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=OWKZzNxS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=tY7HzaHv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019de3ee82be-91f27f7c-6d5e-48a1-9431-3d60e5d66920-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jHflSJA1QdchkOfOF2lluj1GfEPMmlBWxh4H5OKU5K4=;
	b=OWKZzNxSU7n3N5z8R6JllWw5fLJwfZCwCEHFR9ayVtk8pqchcNabh7D82O/i/E96
	V2bbTY/yfC3iM4dyFQnqK1hz+EFv1HUT+DmTABbmi8fxenvtveDzlYaZWV4livYN5Oz
	kk4cqgvToOHlDhGXhQk7xX5hGAyLU5VyIB2uLQlA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jHflSJA1QdchkOfOF2lluj1GfEPMmlBWxh4H5OKU5K4=;
	b=tY7HzaHvJw9WII4EfmXX5pUv/b1jBEdaMffZUFO5qoL9F7rPKDndDKW0D7nnh+Wz
	3NrnudOaRpEvC85VtMbtAJ2Wwxeq3eHf8JKpQDxmfXvFVDPSmogl+axLpg1k1ybPJB2
	DZxkDIONbbO9K6x9nzp+OcEzpTjTCpLldZKiaDUA=
Content-Type: multipart/mixed; boundary="===============5055859338362829887=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wayland: upgrading to 1.25.0 FAILED
Message-ID: <0101019de3ee82be-91f27f7c-6d5e-48a1-9431-3d60e5d66920-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236281

--===============5055859338362829887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *wayland* to *1.25.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe wayland failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1976 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-676d9f01245b30431c7442dba733efaa949f8d9b"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:676d9f01245b30431c7442dba733efaa949f8d9b"
meta-yocto-bsp       
meta-poky            = "master:a67ae0e83d8aba0c46cb8383808b2d1203fbb414"
workspace            = "<unknown>:<unknown>"

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
Parsing of 952 .bb files complete (0 cached, 952 parsed). 1977 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-676d9f01245b30431c7442dba733efaa949f8d9b"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:676d9f01245b30431c7442dba733efaa949f8d9b"
meta-yocto-bsp       
meta-poky            = "master:a67ae0e83d8aba0c46cb8383808b2d1203fbb414"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  76% |###########################         | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://gitlab.freedesktop.org/wayland/wayland/-/releases/1.25.0/downloads/wayland-1.25.0.tar.xz...
INFO: Rebasing devtool onto 05079200a7f0047d51d447eae6128c98047b4ae6
WARNING: Command 'git rebase 05079200a7f0047d51d447eae6128c98047b4ae6' failed:
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/wayland
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/wayland/wayland_1.25.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5055859338362829887==--

