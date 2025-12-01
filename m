Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39FC2D12667
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:26 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13905.1764566270092520694
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=3V1JGpf6;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=A0XnYubL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019ad858f3c7-c2f01542-297c-4d4b-b859-50203c8d9b8f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566299;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6LsNdKHbgRKsTRMqls39YVArPrgbIkJG0F6tNZlw5QU=;
	b=3V1JGpf6n1HZYjv05uqGnUdg0BJW2Nvxc5KfxeOczLSu6jYTYj7Lel5HRRf22yoy
	InpflhYsw1qeb8SM0NXiv4BwCO5xSjMk3Otm9j3+HtVCQI2ScpqdZR3nGR6yqVpr2uH
	fC5rEtxSuKrEKkFK6j/72+2pTCLiUVgDK32FW4E0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566299;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6LsNdKHbgRKsTRMqls39YVArPrgbIkJG0F6tNZlw5QU=;
	b=A0XnYubL1TeqG5tuFOaRU4a90XDekad+lJMwsZM2FPQQHvHKLk2RRfR+bhpQSthW
	MyB+7AgBkEEf/TEfK2JSPL/PolIgNeMbNfbVKUxprCmM3jbwT6lA8qy9+cEiyu8+dDJ
	qJ8RDYdaluQuAA6abhq9gnM6OP4rpLBw8PBGO84k=
Content-Type: multipart/mixed; boundary="===============5607569171745948585=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] appstream: upgrading to 1.1.1 FAILED
Message-ID: <0101019ad858f3c7-c2f01542-297c-4d4b-b859-50203c8d9b8f-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227093

--===============5607569171745948585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *appstream* to *1.1.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake appstream' failed
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
--===============5607569171745948585==--

