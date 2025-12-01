Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF74FD11715
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:00 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13904.1764566269431105607
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:17:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=xwGRnHtG;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=QeJR8V8G;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019ad8588e87-a4062b82-7205-484b-b036-ddccc00b27ec-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566273;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vviita3114/X917eQ5XxzGv55w2tFRvPA+6iWeFIuyU=;
	b=xwGRnHtGX1Vd87+o+9VoB66479d1X/7KAxD2FJTJFcF9842Db0pJl0uCUrMPWXVH
	/LQzyNzsoh77YkI5FdoYpgc+HPaGrucTt9qVR3uK4xOGB1I5ms2phHySmZRUf1RQ5DD
	9rG8VvxGlj/5bUfufHI6txF4lVtJVURSmtICQZZ4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566273;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vviita3114/X917eQ5XxzGv55w2tFRvPA+6iWeFIuyU=;
	b=QeJR8V8GwtZc0WW1WtORuiHxGPxpFQ5K49sIqBOF0N8TzqOrz717ioNzDK7MF5IE
	g63zpZfThf/vrTY0Ks/4c0hbDIpYuJiFvKpi18CMV69h3PLdWSApOR8kKuMbpmXJrzd
	WUo/bQjyQD17ICBe3v43ezfut5Vl8T0cQ4tFWQz4=
Content-Type: multipart/mixed; boundary="===============6493950519070547497=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] perl: upgrading to 5.42.0 FAILED
Message-ID: <0101019ad8588e87-a4062b82-7205-484b-b036-ddccc00b27ec-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:17:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226990

--===============6493950519070547497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *perl* to *5.42.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake perl' failed
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
--===============6493950519070547497==--

