Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B3CBD1267F
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:14 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14114.1764566288534989630
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=BguYiNLr;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=rUxcGog4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019ad858dd6f-9f79a0e0-1978-4eb0-a43d-f1abf900a641-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566294;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WzyWyONPTXVGsbZ9cXaGyObMLvkSnHaFvN2uN6mhxYM=;
	b=BguYiNLryzt9lV2+HSDygY/O7RirMYjh6rZV7Q4rzF0epxuUst+FOy1RtkiKnmoH
	Gtui9pWsAGpvv4D12X1BOIJn6QjPhYm2hTpx8dtDTr8FY7ptkNCt2MneRBjeizCFKoP
	Irpr4/Ll+RXjda1O42YURoQq7EAMrqJ2+mt08ZE8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566294;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WzyWyONPTXVGsbZ9cXaGyObMLvkSnHaFvN2uN6mhxYM=;
	b=rUxcGog4HpXcAnDLR0K9rcAjZTwUaP5Sj+FaJ56JC28n3F9NlR+ETqp91miZzO2U
	sHaWqiDFDeLHSIHxIfPPohiQ9RVesHDJXkgCuaxYe23EH4MFgVo7QyIYcJF57t07FcF
	dxmAqrrjNMto2AZUZG1iTQcSMODnhMsqAWlQS/DM=
Content-Type: multipart/mixed; boundary="===============5004631868353907919=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] mesa: upgrading to 25.3.0 FAILED
Message-ID: <0101019ad858dd6f-9f79a0e0-1978-4eb0-a43d-f1abf900a641-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227064

--===============5004631868353907919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mesa* to *25.3.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake mesa' failed
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
--===============5004631868353907919==--

