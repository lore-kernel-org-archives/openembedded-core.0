Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D00C19F29
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 08:15:07 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web12.22466.1659341692043000541
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 01:14:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=kwEltewe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 010101825878d876-9d323c86-2a90-4901-8883-a49f1876c059-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659341691;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=entjITXMblCPl0eMHjG5tN5hRaGSOEzX8KmhIFtaKao=;
	b=kwElteweyktxV2cXfpDhgyuoZ4ReKNsKDsueMX9UU3NKEnsd8t5UrkUIydmtalXe
	XyehAl5I9blF1YvKRJVyD2rom4436lhBAKlCiU/ClzUOSiEXZxN7QH39wCFcSt9mPDu
	zdNpn6L/J9GVQPkLxU6qMbV0XK7az0xK02MpWlk8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659341691;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=entjITXMblCPl0eMHjG5tN5hRaGSOEzX8KmhIFtaKao=;
	b=ZUv2fWs+OxQqZxcja+E0A4iYQiI9fDF3ltCJQ4QAFQtS4lkFdyT0RaKpfnfkjsF5
	zEyFHCwD0+lDXkezgCb2JaVS7BrFil5uGOMxbsrojTASmgxJIWj18wx8JmxCua9PBxk
	pDLlv1NUc1kBpl5v5DUF/NGLL+J6C8qD3N6XCaxs=
Content-Type: multipart/mixed; boundary="===============4099486616717104335=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libnotify: upgrading to 0.8.1 FAILED
Message-ID: 
 <010101825878d876-9d323c86-2a90-4901-8883-a49f1876c059-000000@us-west-2.amazonses.com>
Date: Mon, 1 Aug 2022 08:14:51 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 08:15:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168731

--===============4099486616717104335==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libnotify* to *0.8.1* has Failed(get_env).

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
--===============4099486616717104335==--

