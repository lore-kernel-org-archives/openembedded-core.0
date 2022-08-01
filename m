Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6FA3C25B0C
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 08:14:56 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.22206.1659341692051362542
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 01:14:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=C/dkp33J;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 010101825878d9cd-38c26320-3aaf-4560-b671-3e4af8693527-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659341691;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=p1C0C7r9WWId4DsggCdB/5tGMwrH0geSJBr0ZrDwXMA=;
	b=C/dkp33JoFotkNHwwWxu4lnDpiTt2bMKUnT4qPxLFbMrfxcWsrs8fgW5ch9SP2JK
	fEjygH6rVmvi4USzBz8LdVwi8eX4wdgVF3QhpFpki+hEeIw25Zy7jomZIujgqxL+fKb
	6fj1U77/7NVDx1Sn7UPAkJN7OOG8veeklRQeQt2k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659341691;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=p1C0C7r9WWId4DsggCdB/5tGMwrH0geSJBr0ZrDwXMA=;
	b=Ki4KZrGTmkOlXdfGuxHefZd3KbKmhz4U/zEtBbRSgHrUXGPKG2NRkQwlo3OgZtwW
	T6T0lTs1macLPSglaGmps/veM6/3cjMSinUwRX6HbTOUCamG/FfxIJ0KaGKHP6CUWeB
	6xVQf33xhvx8PotaazWJssTZUi0sqI7MeoCZvHig=
Content-Type: multipart/mixed; boundary="===============7119491794135435172=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] kexec-tools: upgrading to 2.0.25 FAILED
Message-ID: 
 <010101825878d9cd-38c26320-3aaf-4560-b671-3e4af8693527-000000@us-west-2.amazonses.com>
Date: Mon, 1 Aug 2022 08:14:51 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 08:14:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168730

--===============7119491794135435172==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *kexec-tools* to *2.0.25* has Failed(get_env).

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
--===============7119491794135435172==--

