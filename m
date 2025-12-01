Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 729B2D11708
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:13 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13899.1764566267190971333
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=CBhJq2Tx;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=nkvIx0Qz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019ad858c764-e237b329-b309-46de-a315-01533b75f5d5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566288;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/PgUkDh6ylsEp5Gxr/FNLqCr/mtLtyh+CImGc+5bB+o=;
	b=CBhJq2Txw7T3bj4O3g1hB5iQOMErl3v4D8s0dAku3hhbvvqvi7h6TqCQJdn/9CCV
	PmF/jgmMKfoOtvwK+gUxm4oraPgoNnxITN7Slpgdd4HdMbNhsa0mGdNjf5bsuX3fI1T
	zlf2lEKr+hNTVOQmZzNuW+l3yMWMthuu1Md1m0N4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566288;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/PgUkDh6ylsEp5Gxr/FNLqCr/mtLtyh+CImGc+5bB+o=;
	b=nkvIx0Qz2B9vW9SvGVVRUr1RvRpbBF/6RNC3nfFRl9g3uX7b5pdqlijkHD8ZmEri
	d8WyKv9fuPmiFruuLD1wTt54JcVl7OnMAxNpDwefSnLWjoriA1PsgiAyzZOn5vpfX3d
	e+U8z5/eBNtAwtyHnnKGlczd6BYb98DcqSXMdEa0=
Content-Type: multipart/mixed; boundary="===============3619705774417997407=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] cargo-c: upgrading to 0.10.18+cargo-0.92.0 FAILED
Message-ID: <0101019ad858c764-e237b329-b309-46de-a315-01533b75f5d5-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227039

--===============3619705774417997407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cargo-c* to *0.10.18+cargo-0.92.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake cargo-c' failed
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
--===============3619705774417997407==--

