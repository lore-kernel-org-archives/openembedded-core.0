Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A55C1D116F7
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:17:49 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14080.1764566267354778964
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:17:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dbc/wE1D;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=KgvhMUYv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019ad858713e-d39a200c-321a-4b25-8990-e6d9fb37af8c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566266;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=R6OSJAftwDMNaNrF016ofnNtF+HkzNHwMEQzmDazVR8=;
	b=dbc/wE1D9M7HkQRmMCRTE1IjYhqbnNsc4aA2Kk6XMsChba1gTLofOAmrt55k3hmq
	AxL88eKbL+eTkdje7Z9yLJYBAd6BBH5SIUudESnRQi/tFyJa3qFoqzQMcHfssj3107A
	5SZSCwwoiC7wJQ3xvTfI9LUR2rfq9uoG5HKQwzKY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566266;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=R6OSJAftwDMNaNrF016ofnNtF+HkzNHwMEQzmDazVR8=;
	b=KgvhMUYvyAHz/Ww7opL7cJ4QORxY8FQiVLvbOwRbPGNpEvd3Ixy0wEQL+Ci3/g3X
	qPsV1FrDtm81vtrnaWmVH1hXjaGM6fq52gE+x/s8jXhStvLFAOSMH93YioTa9rclTZ5
	Bm0NwZEXkM+o8kNlf/xjOOWR6N0FpRGCMZAAGC8k=
Content-Type: multipart/mixed; boundary="===============6363822231869205975=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 binutils,binutils-cross-canadian-x86-64,binutils-crosssdk-x86_64-pokysdk-linux,binutils-cross-x86_64,binutils-testsuite:
 upgrading to 2.45.1,2.45.1,2.45.1,2.45.1,2.45.1 FAILED
Message-ID: <0101019ad858713e-d39a200c-321a-4b25-8990-e6d9fb37af8c-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:17:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226963

--===============6363822231869205975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *binutils,binutils-cross-canadian-x86-64,binutils-crosssdk-x86_64-pokysdk-linux,binutils-cross-x86_64,binutils-testsuite* to *2.45.1,2.45.1,2.45.1,2.45.1,2.45.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake binutils binutils-cross-canadian-x86-64 binutils-crosssdk-x86_64-pokysdk-linux binutils-cross-x86_64 binutils-testsuite' failed
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
--===============6363822231869205975==--

