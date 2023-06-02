Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F317CCA463
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:46 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.7529.1685693432018974057
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ghBSYxpU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101887b287da2-96590f41-bd26-4219-aaaa-c71f5c26a9a2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693431;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ExW2rtFgC8EyMGP1oby9YG5KNcxtaN84wnxnW0GmbSA=;
	b=ghBSYxpUuaDCAnoEZLB011zNxXy6DJjhI3K7kHXAaKWlstSXdjtX5cD6RDri5tcC
	f7uUzV6DlGVGM9QXdhcwJDraxRDIgPKnQFIymMMsq9uraQqKnyen7e6zPLgYrcXQy0E
	B2+7Ls2dzO2P7Fkz8uI80eqP/5V3o0fLigKFIz20=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693431;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ExW2rtFgC8EyMGP1oby9YG5KNcxtaN84wnxnW0GmbSA=;
	b=AUgnx7VuChbOaPhxE9euU1VnZTLrOx2oX/uGjwkHuHM335H88+WidEc6Rnq11AlC
	75dZAzzmRu6ddIJWOdNTWZhhx2SkgqjKOT7GQ2PRwru/PnljJ26L8LTpLZFtMJ/zcqc
	dhNV4R1MpXYV6YrGhBs+Fer6TcuGYrZvLuveIrZQ=
Content-Type: multipart/mixed; boundary="===============5279755248761010493=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gcc-source-13.1.1: upgrading to 14-20230529 FAILED
Message-ID: <010101887b287da2-96590f41-bd26-4219-aaaa-c71f5c26a9a2-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:31 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182175

--===============5279755248761010493==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gcc-source-13.1.1* to *14-20230529* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gcc-source-13.1.1 -V 14-20230529
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (09:56:50.087163)
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1801 entries from dependency cache.

Summary: There was 1 WARNING message.

ERROR: The gcc-source-13.1.1 recipe is not supported by this tool


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5279755248761010493==--

