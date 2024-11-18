Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFDADD6005E
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:31 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.4659.1731964617240623107
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Ijw/D0sE;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=lkqxQRsQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010193412341df-3841812f-5ee6-44b8-9c06-4f81610ea3c7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964650;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=y4jMou5yagKvS/ML3AMd8NMUHviqZkLhBxMybaUui68=;
	b=Ijw/D0sENqF8jHcB8NSG531i1dclhxaUMKDfHSdZ9KgEvuOc9itSlfERw2qP+XSK
	bay2iEz3tz7oXPcff8P+pArsprkr+sItQM1k7NIOVu+35PhT5j3UqrEclZYbj2RL9kY
	ZPziiT8h2oFmuwm6kp/7QRQ3k/q67WHQADvH1YtA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964650;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=y4jMou5yagKvS/ML3AMd8NMUHviqZkLhBxMybaUui68=;
	b=lkqxQRsQHHtZmFqjW7rAN8Wld6g6b4kg5lV8zAyMQUCKSCofYAouzWCCR/wJLlGW
	RYP6mbMHOB18F5km/38+jrMzG3J3v9wYsQB/QxJDA3r3MG+Q32I6RyeGxaYXx/cVNeO
	RfD9QHPTsjRZWK8HxYtAZLaqQ99H3ZekKA2+5teA=
Content-Type: multipart/mixed; boundary="===============5382884486509882532=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 d7b0ac1278591aea848a99258ccfdee8e4d454c1 FAILED
Message-ID: <01010193412341df-3841812f-5ee6-44b8-9c06-4f81610ea3c7-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207309

--===============5382884486509882532==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-helloworld* to *d7b0ac1278591aea848a99258ccfdee8e4d454c1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S d7b0ac1278591aea848a99258ccfdee8e4d454c1
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:590e0aab89572c54a195cf7cd18428948e9b36ae"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 12 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout d7b0ac1278591aea848a99258ccfdee8e4d454c1' failed with exit code 128:
fatal: reference is not a tree: d7b0ac1278591aea848a99258ccfdee8e4d454c1



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5382884486509882532==--

