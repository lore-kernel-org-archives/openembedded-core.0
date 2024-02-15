Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0261BC54E8A
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:36 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.20337.1708018346064708194
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AyuwW2Ud;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kvR3oCBF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018dadd3a59e-f037cf1c-d13c-4a93-b866-635c1db371b5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018345;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XCmS9TywY2rwCZZSHS2i67scbjyms0SXu/yeA5LlbGw=;
	b=AyuwW2UdsYiTUVXsqQnWQSezKSGLi77QkLk94gzUc9FRk69BQXOwb+O4bbYNi0QW
	Bo+wqvYB9yTpi6x1qeSg+4UQ/kZ3pi6hrzmZm+LAoOUqxteK/3nyOUXGd3DBpkijFQ6
	EsQxe8VUGWT6b1nPORKmkRKvC35GAx41AagxDUbQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018345;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XCmS9TywY2rwCZZSHS2i67scbjyms0SXu/yeA5LlbGw=;
	b=kvR3oCBFQYI5jihYnDH3sa5N1ft/UGE8q+wRepwsUK+UnVL9wxSvb0qx6A2bZqMC
	HHwwa2OpDwQDCp7OC8I5hQOackXqI6G5wM+nTV9VBRksUB3u8Rue7hgW6sZBgJ+/oPw
	xd69Lc/28QiI/e6ktkdZKu/1ne0+/9hWSSU0e9BQ=
Content-Type: multipart/mixed; boundary="===============8687307809140335312=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 32022caedd6a177a7717aa8680cbe179e1045935 FAILED
Message-ID: <0101018dadd3a59e-f037cf1c-d13c-4a93-b866-635c1db371b5-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195615

--===============8687307809140335312==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go-helloworld* to *32022caedd6a177a7717aa8680cbe179e1045935* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S 32022caedd6a177a7717aa8680cbe179e1045935
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1857 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-f7c43ef513e7232ac77b0e4be16e650a71aa97d7"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f7c43ef513e7232ac77b0e4be16e650a71aa97d7"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 32022caedd6a177a7717aa8680cbe179e1045935' failed with exit code 128:
fatal: reference is not a tree: 32022caedd6a177a7717aa8680cbe179e1045935



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8687307809140335312==--

