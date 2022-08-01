Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7988C25B0D
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 08:14:56 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.22121.1659341691867517811
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 01:14:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=DkpJDC9C;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 010101825878d949-35025501-c300-40cc-8099-067cc6bfb5da-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659341691;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=N5fb/ccvkkGRjyIj2k0N83JTzJIeuvBi3MR456yBpyI=;
	b=DkpJDC9Cri6rLofDKaKULknZJ9Kd9+EDWj07b1S6r2Ae6OVFYCS2EcfTXFfkv9v/
	/AHe7MZQsVxbZg8YtABcPj6FtoCETbvoUs61q46umJwTcFcSyhchPFovSTOwlUYTTH6
	hwVztH7FStBJANBVRpj0SVGaW6QDnhSoG58PRHSk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659341691;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=N5fb/ccvkkGRjyIj2k0N83JTzJIeuvBi3MR456yBpyI=;
	b=M1GzAuxZRvFzgwqMs2hddP/XzzXprzoqOkhZ4oZ71pHBlLe4EMdK5YerB3CkJsTi
	s7kF0besp4w1d8py/CE2UHkI2LR9va2FBmW49xbTOAuBawNYbgndpBGQ9m7HVvx6wwB
	68GpZXMdLh9Fr7Qln0SvrDAbpUIX05HLm+LHiQFY=
Content-Type: multipart/mixed; boundary="===============1918114524130301760=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxcvt: upgrading to 0.1.2 FAILED
Message-ID: 
 <010101825878d949-35025501-c300-40cc-8099-067cc6bfb5da-000000@us-west-2.amazonses.com>
Date: Mon, 1 Aug 2022 08:14:51 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 08:14:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168728

--===============1918114524130301760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxcvt* to *0.1.2* has Failed(get_env).

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
--===============1918114524130301760==--

