Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6634.1794980486099135512
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 21:41:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GqpBv/8+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kJ0RinI+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a1ed2c9736-c22a70c7-a261-4ec6-adfc-c38f9c16dd1d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794980485;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RxhHeHKRn11rnrDeb7BSjodq0e5qMyjwu2SyXCBvoYg=;
	b=GqpBv/8+eAwlGdnNkqzHZj3yXzoN5m8CvRE/uXtHLIKcq/G0TNITnVJNteCB6opv
	NQtHlIX8ydAHyrTXsJYNh8xFMY5I/bmfi56+PgtTGNjPZwYmi3c4f0aFv5RKsnNQslu
	RTo92w0bHCreJUVp86TvFfakiMDJQojf7Nit/0N8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794980485;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RxhHeHKRn11rnrDeb7BSjodq0e5qMyjwu2SyXCBvoYg=;
	b=kJ0RinI+6Oypg5QQZdURzet3LHD5mfJu00JXXsJ8WRNbg2/XUdMDELjM0mlKxOIY
	BDT0MMs1SLUti8JPf1wWUnorPjSzmKodl0cPEtxntGlnCUWn+os07SOiRzAnqUcnnPo
	NozBPlmqKo7UP/k3itj0ifVgdgV3wxDnYc979FIw=
Content-Type: multipart/mixed; boundary="===============5294490405137022328=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libfaketime: upgrading to 0.9.14 FAILED
Message-ID: <010101a1ed2c9736-c22a70c7-a261-4ec6-adfc-c38f9c16dd1d-000000@us-west-2.amazonses.com>
Date: Wed, 18 Nov 2026 05:41:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.18-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 05:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250511

--===============5294490405137022328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libfaketime* to *0.9.14* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libfaketime failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 961 .bb files complete (0 cached, 961 parsed). 2010 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-9029d212e2b26324b29b3318a3f8495a1d5fb495"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:9029d212e2b26324b29b3318a3f8495a1d5fb495"
meta-yocto-bsp       
meta-poky            = "master:8becfabefdf5df564aafe2d07d10e4b05fbaedb1"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto c88b79b4e9cc1c94294037b4677b69185861c2a1
WARNING: Command 'git rebase c88b79b4e9cc1c94294037b4677b69185861c2a1' failed:
Auto-merging src/libfaketime.c
CONFLICT (content): Merge conflict in src/libfaketime.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libfaketime
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libfaketime/libfaketime_0.9.14.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/libfaketime.txt
INFO: Changelog metadata written to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/libfaketime.json



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5294490405137022328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libfaketime-changelog.txt"

List of changes for v0.9.14 (November 2026)
============================================

Since 0.9.13:
    - Added the wrapper's --freeze mode, which resolves user-friendly date
      syntax once and then uses the resulting absolute timestamp.
    - Fixed glibc >= 2.33 stat-entry-point coverage so stat64, lstat64,
      fstat64, and fstatat64 expose one consistent virtual timestamp model.
      This prevents mixed real and faked metadata from invalidating timestamp
      based caches such as Python bytecode caches.
    - Improved glibc time64 helper selection and linker compatibility,
      including a dedicated helper version map and lld build coverage.
    - Hardened initialization, descriptor ownership, and flock-based locking
      for current and legacy glibc loaders, including safer behaviour after
      descriptor closure and loader re-entry.
    - Made FAKETIME_XRESET rate transitions safe for concurrent readers and
      documented the wall-clock transition contract.
    - Added bounded Tokio diagnostics and documented the required
      FAKETIME_DONT_FAKE_MONOTONIC workaround for runtimes that issue direct
      absolute-monotonic futex system calls.
    - Expanded CI and Docker coverage, including reproducible architecture,
      sanitizer, clean-build, linker, and Linux distribution checks.
    - Documented Debian ARM package preload-path diagnosis and clarified
      compatibility boundaries for language runtimes and filesystem metadata.

--===============5294490405137022328==--
