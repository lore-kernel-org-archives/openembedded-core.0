Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5ACFC5AC79
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 06:24:26 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13405.1785997456630718837
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 23:24:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=R96zQze+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Zp+wDPel;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019fd5be7261-ddf642bd-ae73-4ee7-8ee8-ac1e31d79c1e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785997456;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=lzNZW3hfCxIV3KSWwTU6Qfwv1cu0Zm9c6cyDlnOeb+M=;
	b=R96zQze+grSut9aSAlUOTdDBqdlFXHsKQL/1NtiB5BEsxiGNmtZiHQudI36xTacB
	9Y0mILzQ3RZw6DcrPN5eTNppuagHEo/OFt5ozgsbwUE6565M5XkULXvIjSEvoUU3qnx
	YfcMeCu6oIJ5UaH/27oHhTNmt/nS9h8O3miMa8i4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785997456;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=lzNZW3hfCxIV3KSWwTU6Qfwv1cu0Zm9c6cyDlnOeb+M=;
	b=Zp+wDPelJN17cP+Y/jr7i2CBHVPg46bEqIu1bTqDXzcYLJfd1t388ST3DxTt5TDP
	KJP0KOruAWqXRZ5+NYe/4GqvFczIQxfvxRxwavGe4Rbd+pfG3xDwW/KGQhGWfdEBo9b
	zy8ZX0gaudNRi8mFkfp8mpKiKeebegTQ91l4Mo88=
Content-Type: multipart/mixed; boundary="===============4447753289045314590=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] swig: upgrading to 4.5.0 FAILED
Message-ID: <0101019fd5be7261-ddf642bd-ae73-4ee7-8ee8-ac1e31d79c1e-000000@us-west-2.amazonses.com>
Date: Thu, 6 Aug 2026 06:24:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.06-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 06:24:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242906

--===============4447753289045314590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *swig* to *4.5.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe swig failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1987 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-ae37417315d91d7270efd21a50caca6ebb9b2735"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:ae37417315d91d7270efd21a50caca6ebb9b2735"
meta-yocto-bsp       
meta-poky            = "master:9c6cf36c3511b94957aba04002d98bec665e9f1e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...WARNING: /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/recipetool/tmp-recipetool-sr4e0g6l.bb: tmp-recipetool-sr4e0g6l: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-sr4e0g6l-CLOSED"
done.
Parsing of 957 .bb files complete (0 cached, 957 parsed). 1988 targets, 40 skipped, 0 masked, 0 errors.

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
DISTRO_VERSION       = "6.0.99+snapshot-ae37417315d91d7270efd21a50caca6ebb9b2735"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:ae37417315d91d7270efd21a50caca6ebb9b2735"
meta-yocto-bsp       
meta-poky            = "master:9c6cf36c3511b94957aba04002d98bec665e9f1e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-sr4e0g6l: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-sr4e0g6l-CLOSED"
WARNING: tmp-recipetool-sr4e0g6l: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-sr4e0g6l-CLOSED"
WARNING: tmp-recipetool-sr4e0g6l: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-sr4e0g6l-CLOSED"
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
WARNING: tmp-recipetool-sr4e0g6l: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-sr4e0g6l-CLOSED"
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   6% |##                                  | ETA:  0:00:01
Adding changed files:  12% |####                                | ETA:  0:00:01
Adding changed files:  19% |######                              | ETA:  0:00:00
Adding changed files:  25% |#########                           | ETA:  0:00:00
Adding changed files:  32% |###########                         | ETA:  0:00:00
Adding changed files:  38% |#############                       | ETA:  0:00:00
Adding changed files:  44% |################                    | ETA:  0:00:00
Adding changed files:  51% |##################                  | ETA:  0:00:00
Adding changed files:  57% |####################                | ETA:  0:00:00
Adding changed files:  64% |#######################             | ETA:  0:00:00
Adding changed files:  70% |#########################           | ETA:  0:00:00
Adding changed files:  77% |###########################         | ETA:  0:00:00
Adding changed files:  83% |##############################      | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://downloads.sourceforge.net/swig/swig-4.5.0.tar.gz...
INFO: Rebasing devtool onto 4ce883ba29e308f92b187c6214fd3d277b84bcc6
WARNING: Command 'git rebase 4ce883ba29e308f92b187c6214fd3d277b84bcc6' failed:
Auto-merging Source/Modules/main.cxx
CONFLICT (content): Merge conflict in Source/Modules/main.cxx

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/swig
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/swig/swig_4.5.0.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/swig.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4447753289045314590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="swig-changelog.txt"

Changelog for swig: 4.4.1 -> 4.5.0
Source: CHANGES

Version 4.4.1 (7 Dec 2025)
==========================

2025-12-03: jschueller
            [Python] #3285 Fix builds with python>=3.13 and Py_LIMITED_API<3.13.

2025-11-14: jschueller
            [Python] #3280 Add override specifier to SwigPyIterator methods for c++11
            and later.

2025-11-06: degasus
	    #3284 Fix -fsanitize=undefined problem in the SWIG runtime code.

--===============4447753289045314590==--

