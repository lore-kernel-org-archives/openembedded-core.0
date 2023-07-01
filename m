Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32CDDC25B7F
	for <webhook@archiver.kernel.org>; Sat,  1 Jul 2023 16:02:08 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.10761.1688227322845751078
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jul 2023 09:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FKfX9owe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018912309832-05ca1e62-8975-43e1-824f-2b8408574665-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1688227322;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8u1Quov61R42ib73ZNqTVGye6wggxUNMivq1/u9m3XQ=;
	b=FKfX9owejvZTIFiW7HkdBhSkYmg+01NyzUg0TXUzizERqUvQIiNyjPj6TkGmCl5F
	sRd4DcR2eAal4cRF9Cas4yTzeOVWviNhL0e/UrQjU8wHYBYNRWNW+8AcVNVtgp8ib/G
	bzFw8XHctL5mLmTiioxLJ5yR90MNAMyOkDZ3gBhQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1688227322;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8u1Quov61R42ib73ZNqTVGye6wggxUNMivq1/u9m3XQ=;
	b=IEuWvjjS2VZYCzGAjb5xHb9KNi6o8cWS8sLyA0Fqpk+hpkyImuBSeu58qVOMCSl2
	vd44P80M34U2XDf5YLfyge5zY6f8DeyUN2Mh/ZL9LJp2FRQAgAflaO5Q/ZYJ7ch/xWX
	09Rw35vM9IFQnLvbZAfp7puSaFv+9ajOu0jwpVps=
Content-Type: multipart/mixed; boundary="===============8418228609783574965=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gcc-source-13.1.1: upgrading to 14-20230625 FAILED
Message-ID: <0101018912309832-05ca1e62-8975-43e1-824f-2b8408574665-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jul 2023 16:02:01 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jul 2023 16:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183715

--===============8418228609783574965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gcc-source-13.1.1* to *14-20230625* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gcc-source-13.1.1 -V 14-20230625
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (08:34:53.531341)
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1799 entries from dependency cache.

Summary: There was 1 WARNING message.

ERROR: The gcc-source-13.1.1 recipe is not supported by this tool


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8418228609783574965==--

