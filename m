Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2836C2FC0D
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:29 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.807.1686887482858698740
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gS7DAWAq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010188c2544266-2feecd34-75c5-4182-b756-9f665f5db0eb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Urf1HUPNf5rCxGIY9Bhpu2XLm/VSROuScougd1t58qU=;
	b=gS7DAWAq/C4BNCEP60wz9p/dYYGVmFrltYHAs7pmumcPpEVYS+/SAedbEU3Hmn6r
	hwZXSpv57ySRLg4hQ+Ql7i9bXktSzmoGL2yl5xtctj1S8A6L85Sia9MpaOu85NjdzLp
	3iwTolcZu4zx5ZXWfur6noD9ZtsjzHofMfbvd3nY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Urf1HUPNf5rCxGIY9Bhpu2XLm/VSROuScougd1t58qU=;
	b=JdU59wxeHYaqwraJ29ueweYkCAWxBxseFwgSqkd8agGWWrvXhXx5Boso0l77KiIb
	6W2kqOv+bKPklgpcIADpb5NF5FcEs6G494Bq9dKdwcfKSZiT60E+5bUgH9teIVLpj82
	hgmTuwjhFj/27GKXaDcEin7c2xOR9/z0Oz22xifg=
Content-Type: multipart/mixed; boundary="===============9086882641239531768=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gcc-source-13.1.1: upgrading to 14-20230611 FAILED
Message-ID: <01010188c2544266-2feecd34-75c5-4182-b756-9f665f5db0eb-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182908

--===============9086882641239531768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gcc-source-13.1.1* to *14-20230611* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gcc-source-13.1.1 -V 14-20230611
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (08:42:28.140513)
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1802 entries from dependency cache.

Summary: There was 1 WARNING message.

ERROR: The gcc-source-13.1.1 recipe is not supported by this tool


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============9086882641239531768==--

