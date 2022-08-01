Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BAFCC49EC5
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 08:14:57 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web09.22367.1659341690747898704
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 01:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=CFD5tgAv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 010101825878d459-9611aac2-a749-47e6-a848-334b26dd3f36-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659341690;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=akMGXUVhCV9+jicomlBxGQsEENUKNrt05MWscpYHzKs=;
	b=CFD5tgAvE7+5WzbgRviEiKdkElAOSIaXRlulnevLKY0kjnt2UnSJdpjNrx5iscKg
	L5oGzqUggCyUjK6DnX/xAZsazCVOUIXMxv1zuOfuOVCTu5+HV0Zj/3YHM+dYvArWjA4
	J73+HtHFZO8uvYyFJkmNscMeu6F6SS67cTKGCYS4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659341690;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=akMGXUVhCV9+jicomlBxGQsEENUKNrt05MWscpYHzKs=;
	b=iEkHncw1Wwk3DgVV6d2VyjiZuSA76auhvYVoh1dCWThrFQV770lIV7hsqEyL4Tn5
	L4L4XPeQrKfLPg93hNnaPl4exNGTsmE5FVaMlMyzcWiqhtKXYFP5eNCliL6uBRzKO4y
	k8zv+DcACeNlu0XF4aL53Kbsdy/BqI2FjbsFW66o=
Content-Type: multipart/mixed; boundary="===============7028903159317455515=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] patchelf: upgrading to 0.15.0 FAILED
Message-ID: 
 <010101825878d459-9611aac2-a749-47e6-a848-334b26dd3f36-000000@us-west-2.amazonses.com>
Date: Mon, 1 Aug 2022 08:14:50 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 08:14:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168702

--===============7028903159317455515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *patchelf* to *0.15.0* has Failed(get_env).

Detailed error information:

Empty environment returned
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1659 entries from dependency cache.
Parsing recipes...
Summary: There was 1 WARNING message.
Summary: There were 3 ERROR messages, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7028903159317455515==--

