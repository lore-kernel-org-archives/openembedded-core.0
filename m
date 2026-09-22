Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A795C98304
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 05:42:15 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3730.1790055731431429313
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 22:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BmjJZxaE;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZxeVmhiN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a0c7a2ccfd-0e3fb542-7acc-4fa3-ac94-a018bc80f02f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790055730;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aTn8oOq90XiOvjBJ0l7QRzJ0XN3k2H6bqLRHHF9TaxQ=;
	b=BmjJZxaEOD4ICGFWQ7MAnjYSabUBptE32AaPba9mYBbcVAFyKs3R2eWoBU7Qorn/
	16sonSkR1WNZkYQwjymzTbUo2155dLWJgnbsTrxVsN8sBxKkOEtZuys7brfbmzurjZC
	kpszbr84j8DbW5+QSWspZCscY4o3vk8Fkz9+lykU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790055730;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aTn8oOq90XiOvjBJ0l7QRzJ0XN3k2H6bqLRHHF9TaxQ=;
	b=ZxeVmhiNsylaf+oqBlgfTaaiNoni1bVLefek3rZuR2Q8SU7Dct8fh6TMTZpkdAmM
	fJMjQlww9x2DK0As9xJlNyvNAsB2o34TlVjZjIW19UFDcfq4LTkbyF3GxoBuNhR6sdN
	MW+3N75bd4MSSthRC80IvVjth0YJ2C86qbRnKqSk=
Content-Type: multipart/mixed; boundary="===============2156112865051582295=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>, Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux-libuuid,util-linux: upgrading to 2.42.4,2.42.4
 FAILED
Message-ID: <010101a0c7a2ccfd-0e3fb542-7acc-4fa3-ac94-a018bc80f02f-000000@us-west-2.amazonses.com>
Date: Tue, 22 Sep 2026 05:42:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.22-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 05:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246369

--===============2156112865051582295==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *util-linux-libuuid,util-linux* to *2.42.4,2.42.4* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe util-linux-libuuid failed.
NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1993 targets, 43 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
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
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 960 .bb files complete (0 cached, 960 parsed). 1994 targets, 43 skipped, 0 masked, 0 errors.
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
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  41% |###############                     | ETA:  0:00:01
Adding changed files:  83% |##############################      | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Creating workspace layer in /srv/pokybuild/yocto-worker/auh/build/build/workspace
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://cdn.kernel.org/pub/linux/utils/util-linux/v2.42/util-linux-2.42.4.tar.xz...
INFO: Rebasing devtool onto fbb11bf25d4e32c8901f67cd1ed7ea420c0ed93e
WARNING: Command 'git rebase fbb11bf25d4e32c8901f67cd1ed7ea420c0ed93e' failed:
Auto-merging sys-utils/mount.8.adoc
CONFLICT (content): Merge conflict in sys-utils/mount.8.adoc

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/util-linux-libuuid
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/util-linux-libuuid/util-linux-libuuid_2.42.4.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/util-linux-libuuid.txt
INFO: Changelog metadata written to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/util-linux-libuuid.json



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2156112865051582295==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="util-linux-libuuid-changelog.txt"

util-linux 2.42.4 Release Notes
===============================

This release enhances previously released security fixes and adds protection
against symlink attacks in the legacy mount(2)-based code in libmount.

Changes between v2.42.3 and v2.42.4:

libblkid:
    - minix don't detect erofs images as minix (by Clayton Craft)

lib/fileutils:
    - add safe FD-path and no-symlink helpers (by Karel Zak)
    - fix RESOLVE_NO_SYMLINKS fallback value (by Karel Zak)
    - fix unused parameter warnings without SYS_openat2 (by Karel Zak)

libmount:
    - add mnt_fs_fetch_ids() and populate uniq_id for utab (by Karel Zak)
    - use fchmodat2() for X-mount.mode= (by Karel Zak)
    - restore the original namespace on error paths (by Karel Zak)
    - secure the idmapped mount replacement (by Karel Zak)
    - pin the legacy mount target and bind/move source (by Karel Zak)
    - harden restricted mount targets and post-mount handling (by Karel Zak)
    - fix X-mount.idmap ID names in code and man page (by Karel Zak)
    - use USE_LIBMOUNT_MOUNTFD_SUPPORT for idmap hook (by Karel Zak)
    - add missing fileutils.h include to hook_idmap.c (by Karel Zak)

mount:
    - fix grammar and typo in X-mount.idmap documentation (by Karel Zak)

nsenter:
    - close cgroup.procs fd after join to prevent authority leak
      [CVE-2026-78408] (by Karel Zak)

po:
    - merge changes (by Karel Zak)
    - update sv.po (from translationproject.org) (by Daniel Nylander)
    - update nl.po (from translationproject.org) (by Benno Schulenberg)

po-man:
    - merge changes (by Karel Zak)
    - update sv.po (from translationproject.org) (by Daniel Nylander)

tools:
    - add non-newmount.conf config-gen profile (by Karel Zak)

--===============2156112865051582295==--

