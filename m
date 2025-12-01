Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4549D111A8
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:17:49 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14079.1764566266952370533
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:17:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=lVvKwddd;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=hQlMD7/T;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019ad8587198-5f585314-4457-4d26-8247-1c83d865eea5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566266;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GZ+tADjnn8cSLVZ6UARLvYJM9MvOX8zaJtlr9krsFvY=;
	b=lVvKwddd7jbcv7JYWMIZqH1KG6fS1rTIGO2oJzzia+6m9NmLmTNSfjhUPxGh/sLG
	Qp7TWyvgImg98BuGfy8Rx3eCXuNmnmHpfvwKiJHtU7kpLFjSb1stfqU01DMi3ly0u5S
	LxYfNSgJpT20xaZjqD3J9i0DP+pd6kNDgn8b8gFM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566266;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GZ+tADjnn8cSLVZ6UARLvYJM9MvOX8zaJtlr9krsFvY=;
	b=hQlMD7/TObYqL52hVBY6p7++X9my0W81CCpRRVSR5+zPZZL4Zc0CmF/9yT9H5Lw4
	oirkAE4uaD4NQmLTl12wbEGIjDOKK5r0lA8zwPEyqy1dcwp5NrEZ8H9FSbMe25B0BxJ
	VsMZxG3RsjVJmHt64JVWbuV9BarbRv/FQdMWS/rE=
Content-Type: multipart/mixed; boundary="===============5901154516752870083=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rust,libstd-rs,cargo: upgrading to 1.91.1,1.91.1,1.91.1 FAILED
Message-ID: <0101019ad8587198-5f585314-4457-4d26-8247-1c83d865eea5-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:17:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226961

--===============5901154516752870083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rust,libstd-rs,cargo* to *1.91.1,1.91.1,1.91.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake rust libstd-rs cargo' failed
NOTE: Reconnecting to bitbake server...
ERROR: A builtin fragment 'machine/qemux86-64' is used while MACHINE has already got an assignment.
Please either disable the fragment or remove the value assignment.
To disable the fragment, use 'bitbake-config-build disable-fragment machine/qemux86-64'.
ERROR: Unable to parse /srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/__init__.py
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/__init__.py", line 262, in fatal
    raise BBHandledException()
bb.BBHandledException




Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5901154516752870083==--

