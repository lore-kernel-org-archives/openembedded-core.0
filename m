Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 315BCC88C96
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:45:19 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.24046.1677681915650582038
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 06:45:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=icJKQAXB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101869da27383-de3fa476-ac05-4a5e-a2ab-313e6f4f65c1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1677681914;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=w1xx9TJSLp2Wj8zaR3KierCtAkEy0FEwHF0TIUQHWEg=;
	b=icJKQAXB0LktEEHIoP3qsx19BAoRfH3AEOMwQsmhaqdsDBExwY7y8CgATLjh3I62
	FJR5KurmgeFJRhDvaOAnIcTdyG4U1FBd9LoFU5HXA+1hKNdikiW5M4rqui8WGUZd4wq
	Lcv0nk5TTrsqy5IUu9Dqp+nvxftyz5uAa65X4KeM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1677681914;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=w1xx9TJSLp2Wj8zaR3KierCtAkEy0FEwHF0TIUQHWEg=;
	b=Pn+Jq8/4p9yj4xUV3xJQPvJuQOD0bHbX8aYDMXhbeOjRKwwm65KbaLe1lDLdUDRS
	V7Cq0bjyLkYiBsi5E9vIeWOjoIjmk6r2t5zbSJ/xyD/IqY1llCnyEfwwNX/NlszqCAj
	U/t0rXuKZC1abDAoXoIz1V7ZJ/pAULfqGkYSlTdY=
Content-Type: multipart/mixed; boundary="===============5791182040312718115=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 566bedacf26b2820f75bc52fd3c8607b89f9247e FAILED
Message-ID: <010101869da27383-de3fa476-ac05-4a5e-a2ab-313e6f4f65c1-000000@us-west-2.amazonses.com>
Date: Wed, 1 Mar 2023 14:45:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 14:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177922

--===============5791182040312718115==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-samples* to *566bedacf26b2820f75bc52fd3c8607b89f9247e* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake vulkan-samples' failed
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1697 targets, 38 skipped, 0 masked, 0 errors.
Removing 69 recipes from the core2-32 sysroot...done.
Removing 79 recipes from the qemux86 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'vulkan-samples'
vulkan-samples was skipped: incompatible with host i686-poky-linux (not in COMPATIBLE_HOST)


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5791182040312718115==--

