Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A6FD116F7
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:12 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14093.1764566272902260200
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=aWNOxdzl;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Phpo65Dd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019ad858b036-180009e5-6d6f-41e8-b40f-6fcb79a65f6a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566282;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7mZwVnVDb3Fgll1PBpn4iouzXnXoG3PzbV+Si0DB/xE=;
	b=aWNOxdzlOqvbvZOmucRPC8D8WZDw7CGi2ljb/niT53OiMVD0/P6kgW2JuxS4JPoy
	SixFJjRVEnXI9Zdr4Nm++IKVqKEUlV/fU7VK+x9h6pBBDj8/oZX3ih5RrZrxjsPU5PB
	i2vW7/CiopeZYbPCrMZB8U9IvIYVGUBTbHeA4OPQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566282;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7mZwVnVDb3Fgll1PBpn4iouzXnXoG3PzbV+Si0DB/xE=;
	b=Phpo65DdFgTph0A+gvcOKgS4EXqfWIEhd29eDUmOhdcdhAWvzntGYGRnROYvs5Yv
	W5pxSC5g4h+l0hi0XbU3c7lVtzxzj5uGs9+o/kvYjq2Q4ZpkwPhYwmljdFHwi4pu/8c
	Oj7cVwkHWtlWzcsgOrRauN/jC74Yhq+9WI6ofJEc=
Content-Type: multipart/mixed; boundary="===============1328674414664033933=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyparsing: upgrading to 3.2.5 FAILED
Message-ID: <0101019ad858b036-180009e5-6d6f-41e8-b40f-6fcb79a65f6a-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227017

--===============1328674414664033933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyparsing* to *3.2.5* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake python3-pyparsing' failed
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
--===============1328674414664033933==--

