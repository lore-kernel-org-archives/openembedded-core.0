Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7494C55166
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 05:45:06 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5300.1785390306043045000
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 22:45:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=V8cLNfSx;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NY6wF8Ho;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019fb18e0f27-4efe600b-e2a0-4dbc-8096-b2c450aee940-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785390305;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NHn6X/zQ+TBmUGESb6Ut9EMaB/5PY6MwyX3fsL/zSG0=;
	b=V8cLNfSxk4JatVvZ8YKPmNXxQMRITY13HYcsUt4dw/bEb44ljHVvGGm/LSz8MjAL
	IrwPVyLFxuTvSSOgkP5nPvPTJiGYlsQz9CfeksSgWD/ukq1GxAwxQltsArRweNT/0Mg
	LQXWSeh9rPNz6SFW5B86/lcvQlUNlMiEVM0oSkFg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785390305;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NHn6X/zQ+TBmUGESb6Ut9EMaB/5PY6MwyX3fsL/zSG0=;
	b=NY6wF8Ho1d3FTmlWV6+o1vGDUJX87Wy2a/FDEhS3ouotTGcc2zmGpQFZAkpUO0Ah
	Sd3phmDd0Aolk+z/oeRrqoMd3H2AXkDvkHCqZvTaIRr3YKxMsSHTic5i1U62+WATqdP
	u7Ok08kTsKKKM3pZFv/HufuVIfg3BG4eb7E/11K4=
Content-Type: multipart/mixed; boundary="===============7482528982528105125=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] nasm: upgrading to 3.02 FAILED
Message-ID: <0101019fb18e0f27-4efe600b-e2a0-4dbc-8096-b2c450aee940-000000@us-west-2.amazonses.com>
Date: Thu, 30 Jul 2026 05:45:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.30-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 05:45:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242316

--===============7482528982528105125==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *nasm* to *3.02* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe nasm failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 954 .bb files complete (0 cached, 954 parsed). 1983 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-adeebe2220d17db68106ab1f8cbc26d85e9e6c22"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:adeebe2220d17db68106ab1f8cbc26d85e9e6c22"
meta-yocto-bsp       
meta-poky            = "master:e4690557fb0fffcb5e9a86d1c1ebc550bb0da090"
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
Parsing recipes...WARNING: /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/recipetool/tmp-recipetool-t91zyrtw.bb: tmp-recipetool-t91zyrtw: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-t91zyrtw-CLOSED"
done.
Parsing of 955 .bb files complete (0 cached, 955 parsed). 1984 targets, 40 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-adeebe2220d17db68106ab1f8cbc26d85e9e6c22"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:adeebe2220d17db68106ab1f8cbc26d85e9e6c22"
meta-yocto-bsp       
meta-poky            = "master:e4690557fb0fffcb5e9a86d1c1ebc550bb0da090"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-t91zyrtw: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-t91zyrtw-CLOSED"
WARNING: tmp-recipetool-t91zyrtw: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-t91zyrtw-CLOSED"
WARNING: tmp-recipetool-t91zyrtw: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-t91zyrtw-CLOSED"
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
WARNING: tmp-recipetool-t91zyrtw: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-t91zyrtw-CLOSED"
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  47% |#################                   | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching http://www.nasm.us/pub/nasm/releasebuilds/3.02/nasm-3.02.tar.bz2...
INFO: Rebasing devtool onto 639a54d14361fce19cdd286db483598ce7ba0641
WARNING: Command 'git rebase 639a54d14361fce19cdd286db483598ce7ba0641' failed:
Auto-merging Makefile.in
CONFLICT (content): Merge conflict in Makefile.in
Auto-merging configure.ac
CONFLICT (content): Merge conflict in configure.ac
Auto-merging include/compiler.h
CONFLICT (content): Merge conflict in include/compiler.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since recipe inherits autotools-brokensep
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/nasm
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/nasm/nasm_3.02.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7482528982528105125==--

