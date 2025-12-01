Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB28ED116FF
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:17:59 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14095.1764566273595916511
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:17:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=rSknr3XI;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=jCub7P4t;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019ad8588c3a-0054073a-3ec9-49fc-a95f-fea39c4a71d5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566273;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YjUFqIu+j1cuXBABpuSNsyc9nc8GLbAvJicH77V+dEU=;
	b=rSknr3XIABqcGi9X90xF8kheDTMWnoSsJU8JwyX2KRM+NUhzuwj0YSD9LMRSlJof
	UbFagm5Y+U2VD3XWcSuqPUqk8vLkdloiBXYeofcbFNVzV23x19JkVG/8cjQnSxzq312
	zeI/0f5affMtxS0FpvWgsfaCFutgw8qQMieEQa0Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566273;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YjUFqIu+j1cuXBABpuSNsyc9nc8GLbAvJicH77V+dEU=;
	b=jCub7P4tRfHllCBNBHybmzNAlBqZfGIbkDotJ8n/nOHpULkw2kXkp+BUf4GLqv3Q
	FFCJKiFFN/h3TewCC8WODItgul3ItwuWnxYXngh8Lk0ts4zK3Cifkn6SzU3aQ6Dnlcl
	Fdn0KgWqqHrI4/EUklsfs+PPSmp+MeFlUaif3FEQ=
Content-Type: multipart/mixed; boundary="===============5834000109974577263=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gn: upgrading to 6e0b557db44b3c164094e57687d20ba036a80667
 FAILED
Message-ID: <0101019ad8588c3a-0054073a-3ec9-49fc-a95f-fea39c4a71d5-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:17:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:17:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226988

--===============5834000109974577263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gn* to *6e0b557db44b3c164094e57687d20ba036a80667* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake gn' failed
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
--===============5834000109974577263==--

