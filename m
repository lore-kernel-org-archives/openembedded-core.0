Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB2EAD1268B
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:26 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13944.1764566298643080045
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=JhmHJ1UR;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=l3XJhLhg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019ad858ee45-efbbc1fe-50ef-45d8-b67f-e63bd04611a6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566298;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zZ6rvI1sBeeUfokNk05GVH9MQLigxRXLz9tbXq5WmSw=;
	b=JhmHJ1UREZa+7AvWGlur/6JFZI0ST2Unb+xN9h8IJoHdjcaf53pEERb7cmDMRg3f
	+Hd1XYsTwjifURETBs02qkafKuEgDmNyC8d+3w1C7qMoD/FAVdFSuCPzWHSLUsuFhsV
	0ZyxyFNmILXOvmTlUIe/ArxQ9fDIXnVRIBX0MIlY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566298;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zZ6rvI1sBeeUfokNk05GVH9MQLigxRXLz9tbXq5WmSw=;
	b=l3XJhLhgo7z45quFTxvjx+E5+7H0KxM/8hJB9IWpVxk185J/kwh8en5j/J21xIfn
	vhpHKqpDyO+Tvu515FIgZkuZLfKETlrFz/0FELI1GlKdpc+dByiNZ7jMQUwzFtNFBpA
	jmUyegsGQEJGc13sA+k68OVWoOCGB9OSaJ1N3Sbo=
Content-Type: multipart/mixed; boundary="===============3034539733130181118=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ffmpeg: upgrading to 8.0.1 FAILED
Message-ID: <0101019ad858ee45-efbbc1fe-50ef-45d8-b67f-e63bd04611a6-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227082

--===============3034539733130181118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ffmpeg* to *8.0.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake ffmpeg' failed
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
--===============3034539733130181118==--

