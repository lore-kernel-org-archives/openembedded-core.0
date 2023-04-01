Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3869C6FD1D
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:03 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.32127.1680384533484086979
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UqfFEcCz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101873eb9205c-d2ca865e-ac8b-4a03-9ff4-9b72058b3544-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384532;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uGzvHCevwr+KsJ3NggTv1hpxQdory2QcqMfFKqfXoKs=;
	b=UqfFEcCz7VgykpsvxvqLc4fDlGSA6pGtuBobb87Su978FQyIZ+t1XOkXDgEpVJZS
	j9UbZZj3UVmiekWZr7k7iX9KapjAdbMjV3s12SvUGBl105hlFgt+RWnEdNDLdadpVTa
	sLSijtkn09U6wF4S47ij5dy5C7mNV8FlqHxolIpI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384532;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uGzvHCevwr+KsJ3NggTv1hpxQdory2QcqMfFKqfXoKs=;
	b=gGZNNqj/nk0FblAzev6UvEwr7sy6yZ3yeKswM8oFMlTMmFfvQbIzEFp8CtpRIoHB
	8ub8gbbc9BTbfCkxUhoTjspCohuvZUNqUCRkiQ3jo72CatERU8Flcg5dAz+vi/7kNiJ
	PmAcl1amQ38FEnDvL5FxKqJkZaLGOEtUOU1qhYZA=
Content-Type: multipart/mixed; boundary="===============5181251806203955680=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ovmf: upgrading to edk2-stable202302 FAILED
Message-ID: <010101873eb9205c-d2ca865e-ac8b-4a03-9ff4-9b72058b3544-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179475

--===============5181251806203955680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ovmf* to *edk2-stable202302* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe ovmf failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (07:20:14.087347)
Loading cache...done.
Loaded 1797 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-f2c3f208c646ba9c8a128de4e8c3eb38d35caf46"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f2c3f208c646ba9c8a128de4e8c3eb38d35caf46"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto f80f052277c88a67c55e107b550f504eeea947d3
WARNING: Command 'git rebase f80f052277c88a67c55e107b550f504eeea947d3' failed:
Auto-merging BaseTools/Conf/tools_def.template
CONFLICT (content): Merge conflict in BaseTools/Conf/tools_def.template

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/ovmf
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/ovmf/ovmf_git.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5181251806203955680==--

