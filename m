Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED232C32765
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 08:14:56 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web08.22238.1659341691038237079
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 01:14:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jpTcEIVf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 010101825878d4a3-2b9d99a7-1406-4833-850e-e3665216effa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659341690;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1GgbfKOKbH5BBaWXmFZPJB7oab8wn3oOoUP/Aj1JUWs=;
	b=jpTcEIVfJbNYR6vnFEeyGVDh0HSFttepOGD659I8b5WBIzvvBH1v25sLvnxlRw7N
	olq2JzmPlNxVcx2MupZ0cKFVi1NsgeWDsJFXZ+dCjLYQEhUm5YsFpxqYhkkr4naGgbN
	oK0E/KNE1uFraMPWQPUCgsuWmrDeQmPhUI40I7RQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659341690;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1GgbfKOKbH5BBaWXmFZPJB7oab8wn3oOoUP/Aj1JUWs=;
	b=ICJ2BracQmpH8ghJz7mwHVhBiqje/RkfQvEjlBMqnJx0Iq/2txTbBnU9A+l5v2Mt
	fMmOTcaKKp6KfYdW8JGadmgXfEYfmaYzetjmuBF522KY+Tz0UsbzyC6s0RLU5nLCdp+
	dojAY0hHe6fdeMfNct/i6WZ9UKLOz9vrtatljoCc=
Content-Type: multipart/mixed; boundary="===============4739213757722997481=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dbusmock: upgrading to 0.28.4 FAILED
Message-ID: 
 <010101825878d4a3-2b9d99a7-1406-4833-850e-e3665216effa-000000@us-west-2.amazonses.com>
Date: Mon, 1 Aug 2022 08:14:50 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 08:14:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168709

--===============4739213757722997481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dbusmock* to *0.28.4* has Failed(get_env).

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
--===============4739213757722997481==--

