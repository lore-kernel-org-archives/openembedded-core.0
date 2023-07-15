Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 772EFC2FC1E
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:40 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.5936.1689456453635722274
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OADm6FZI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101895b73a835-19a2e940-9e1d-47b4-aa92-49b2f84211f8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456453;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cA8ibpZElY4vPybBi3dKm04z/4p75CZs+gGe/Lugf/g=;
	b=OADm6FZI3FgoWRAuZDafHHD3uYATzfhPHsUUPQmkrP17aKuKQ3rasFQDOcIYMjF5
	HVW8vupcj9g+xBNuOXBxhDOQrHbqWmiUEF2NdbYfnvZeoj5/R7rvKplSkPTUSLfPIQh
	c1ciKKcQCqlr3zI25nwYNVAn2mvbe/BU+oS7O2g8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456453;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cA8ibpZElY4vPybBi3dKm04z/4p75CZs+gGe/Lugf/g=;
	b=nUuieNIn+9uqGZGx3Nd5tqr45TrUrWu8qmo9mP1Pjdh8R4YLZF5N/w0KLM39vXnx
	ypBRBZOc/1BpSzoQZdJEKvTrrJH7iR63pI/D2MWrbra1rl7/ZWNugreAFsXMmm8Hpet
	5Cza0573+7ljKUj3UiXYyrhVuU6srpiZGNjkYuTA=
Content-Type: multipart/mixed; boundary="===============4272448929132546669=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gcc-source-13.1.1: upgrading to 14-20230709 FAILED
Message-ID: <010101895b73a835-19a2e940-9e1d-47b4-aa92-49b2f84211f8-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184320

--===============4272448929132546669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gcc-source-13.1.1* to *14-20230709* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gcc-source-13.1.1 -V 14-20230709
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (10:44:28.774190)
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1804 entries from dependency cache.

Summary: There was 1 WARNING message.

ERROR: The gcc-source-13.1.1 recipe is not supported by this tool


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4272448929132546669==--

