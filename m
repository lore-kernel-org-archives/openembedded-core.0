Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8AB5C5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 05:30:41 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36317.1786080635042624574
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 22:30:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=lsTRU9Er;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=oOPPt4kh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019fdab3ad8d-636e518e-0254-470c-bad2-cde6f8ae4a94-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786080636;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eS02kofZID/qM8uzVAiusXEm54ttHFMYYgPbBS8Yk8Q=;
	b=lsTRU9ErxopXbtUaiL4agwA5IbSJP5xU2dtfgEf5ODrFN/2rT49CNxVmRyy8+NqM
	vKNCBA2//nTASvYCDs7V1seBV0UbndiYJIbuCXksSKVb/VqoDjaa1K1AT46ya2hH3nB
	WgSBhwN8qNl9pcsVMO1gsXlZIeDlQm38stO7wQ0E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786080636;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eS02kofZID/qM8uzVAiusXEm54ttHFMYYgPbBS8Yk8Q=;
	b=oOPPt4kh47bituFqaPy52V3i2cITDsi74flZWcnAF4umxzniSkz/dpGqtMRQdx5H
	Q347WYF+zK3EFh7icTRcB3GGPRW1KcGuSEhyCJPIKhAg3OK52kCHqNyDZt0+QpJG/sg
	j/xCKSUTuJJpcJzM6NR8FqSS9fFoWMHaWiZczjcs=
Content-Type: multipart/mixed; boundary="===============8997389657757993878=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] apr-util: upgrading to 1.6.4 FAILED
Message-ID: <0101019fdab3ad8d-636e518e-0254-470c-bad2-cde6f8ae4a94-000000@us-west-2.amazonses.com>
Date: Fri, 7 Aug 2026 05:30:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.07-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 05:30:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242978

--===============8997389657757993878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *apr-util* to *1.6.4* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe apr-util failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1987 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-f198bbe538ed0d698f12c8cca3ea999639e4b6cc"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:f198bbe538ed0d698f12c8cca3ea999639e4b6cc"
meta-yocto-bsp       
meta-poky            = "master:9c6cf36c3511b94957aba04002d98bec665e9f1e"
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
Parsing recipes...WARNING: /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/recipetool/tmp-recipetool-ncc5lt2y.bb: tmp-recipetool-ncc5lt2y: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-ncc5lt2y-CLOSED"
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
DISTRO_VERSION       = "6.0.99+snapshot-f198bbe538ed0d698f12c8cca3ea999639e4b6cc"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:f198bbe538ed0d698f12c8cca3ea999639e4b6cc"
meta-yocto-bsp       
meta-poky            = "master:9c6cf36c3511b94957aba04002d98bec665e9f1e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-ncc5lt2y: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-ncc5lt2y-CLOSED"
WARNING: tmp-recipetool-ncc5lt2y: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-ncc5lt2y-CLOSED"
WARNING: tmp-recipetool-ncc5lt2y: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-ncc5lt2y-CLOSED"
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
WARNING: tmp-recipetool-ncc5lt2y: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-ncc5lt2y-CLOSED"
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://archive.apache.org/dist/apr/apr-util-1.6.4.tar.gz...
INFO: Rebasing devtool onto 5cd539d5f920ca288bc65a643cfc8675e1881bf2
WARNING: Command 'git rebase 5cd539d5f920ca288bc65a643cfc8675e1881bf2' failed:
Auto-merging test/testxlate.c
CONFLICT (content): Merge conflict in test/testxlate.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/apr-util
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/apr-util/apr-util_1.6.4.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/apr-util.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8997389657757993878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="apr-util-changelog.txt"

Changelog for apr-util: 1.6.3 -> 1.6.4
Source: CHANGES

Changes with APR-util 1.6.4

  *) apr_brigade: Don't split the final LF in apr_brigade_split_line() to
     avoid producing an empty bucket.  PR 64273
     [Barnim Dzwillo <dzwillo strato.de>, Joe Orton]

  *) apr_brigade: Metadata buckets are now ignored in
     apr_brigade_split_line, apr_brigade_flatten and
     apr_brigade_to_iovec, fixing possible undefined behaviour.  PR 68278
     [Ben Kallus <benjamin.p.kallus.gr dartmouth.edu>, Joe Orton]

  *) apr_crypto_openssl: Compatibility with OpenSSL 3.  [Yann Ylavic]

  *) apr_crypto_openssl: use OPENSSL_init_crypto() to initialise OpenSSL
     on versions 1.1+. [Graham Leggett]

  *) apr_memcache: Fix name lookup to allow IPv6 as well as IPv4.
     [Lubos Uhliarik <luhliari redhat.com>]

  *) configure: Fix Berkeley DB detection with compilers enforcing
     strict C99 compliance.  PR 66396.
     [Florian Weimer <fweimer redhat.com>]

Changes with APR-util 1.6.3

  *) Correct a packaging issue in 1.6.2. The contents of the release were
     correct, but the top level directory was misnamed.

--===============8997389657757993878==--

