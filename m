Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A943DD1266E
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:02 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14105.1764566282360021755
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gqaa17PT;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=gsDvOMsZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019ad858ae21-265f7c68-c1a8-4509-afdc-e50a3d9ff66c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566281;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=b13Y1fQOfnUlC7o/RKWcN/sN+yI7V7wCyYBoM3xrZzU=;
	b=gqaa17PT42+jXFyxiPKtv/+vJLsXzy5THiDr/oO2iU+OdGviheBctMrdq7EMv2dv
	fld5u8gn4hSEOpuZ/BbfEPMdIKn6u6+/P65XJkJ5lQ3Gm/L1um40V+/ycPKwMZTQsqx
	IUc7Z5I5gi8D2W67k/OZGtaWhocfU0kHu7nkvwu0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566281;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=b13Y1fQOfnUlC7o/RKWcN/sN+yI7V7wCyYBoM3xrZzU=;
	b=gsDvOMsZe+5znFQBPEOmEguJbv+fwSV6Sjx5Tp7bGkb4nCHdOo8RMDqGarftEBcs
	vm7Mga+7HZdanhR5WnhNg3th3lunM/qN7lCdUa9bhx32YkblcjuELyviehsUmb3KeR2
	tAcgdxyX1ce/W3jmgTBcZGkXd5XcHurvTa6HB1ME=
Content-Type: multipart/mixed; boundary="===============1817702269432178293=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycparser: upgrading to 2.23 FAILED
Message-ID: <0101019ad858ae21-265f7c68-c1a8-4509-afdc-e50a3d9ff66c-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227014

--===============1817702269432178293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pycparser* to *2.23* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake python3-pycparser' failed
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
--===============1817702269432178293==--

