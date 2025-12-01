Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B739D12691
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:27 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13928.1764566286089269369
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=cl6Vyeem;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=isk4Zts5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019ad858e6bc-971a3e57-94a1-4a77-811f-14c79f85da9a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566296;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+VzvQ+JyExzujeZh3PTbG/TZqJD3GoA81hQ5LMfqldY=;
	b=cl6VyeemMEUVIzv7pD71eEPUHiKj4rcIwF0B8Y5lw9q7wItFD4zf+SLOc63SCILF
	03vYNHL7Li2NJk6U8mzXMQC4OV0NtbHEBqOHzmZZMggLa2n8k54vuMIhK0qvznRfXIM
	H3sKcD1IQfbI5l/qOIqf8Cl/erGo4YqH3u3eoKe4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566296;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+VzvQ+JyExzujeZh3PTbG/TZqJD3GoA81hQ5LMfqldY=;
	b=isk4Zts5/N8WfVDm/O8pc1DxyMeEXPlW+Nl/P62FVZoXsYxNNO2bSnr/ThDfIVZM
	y7+4J0bCap9O6zc5iqrtIO7bdhVHEceYsMoLmVTCo81j8XuTbWEjMULIsh3CA95x+Xt
	l11/ws5amSvyZ6D7S/Me5Ppl9kRONeY08OzYqeAI=
Content-Type: multipart/mixed; boundary="===============5140558453725710758=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xkeyboard-config: upgrading to 2.46 FAILED
Message-ID: <0101019ad858e6bc-971a3e57-94a1-4a77-811f-14c79f85da9a-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227071

--===============5140558453725710758==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xkeyboard-config* to *2.46* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake xkeyboard-config' failed
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
--===============5140558453725710758==--

