Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0891BD11719
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:01 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13897.1764566264045401888
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:17:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=IyHX38xK;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=SG+sYtAY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019ad8588af5-f9cdb161-3c7f-41a3-b0a4-e034f52522d7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566272;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YU5W+D8TVg85iZiL3IFrwdGfPLQvLdFejj5frnH/mpk=;
	b=IyHX38xK6dtcKgo/NX+eYtWITMLH7Ym/obqnFieVK3aUA7zR5Thqp9P4+YLxAyw2
	Qa8yu/hgymxopg+aQyQO9Kylf7qryTLUyHCmITt6BT6cD/fs3jymW0RXlTzPqSwDzkH
	suT76Rz9gEahPUYzyHAENIClqxbjxQMG6Ygkh3J8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566272;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YU5W+D8TVg85iZiL3IFrwdGfPLQvLdFejj5frnH/mpk=;
	b=SG+sYtAYjxZ2kQvI4GjYmWYwevZr0NS3YxlamWbB4JORnnyyWtse7DuAcLZTomXz
	K1Lr1daTHUKwR+1yjcZw2JH5vCsjoaQ/TLKO7sZ+PISUPy/XRfWa0dMj8K1ZZaprX2Z
	Oy4A3uKB2QwB+GI/BLHzbMuww5/D0r2IC56bTVZA=
Content-Type: multipart/mixed; boundary="===============2804957885985601418=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] perlcross: upgrading to 1.6.3 FAILED
Message-ID: <0101019ad8588af5-f9cdb161-3c7f-41a3-b0a4-e034f52522d7-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:17:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226983

--===============2804957885985601418==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *perlcross* to *1.6.3* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake perlcross' failed
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
--===============2804957885985601418==--

