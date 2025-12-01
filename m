Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A31F2D116E2
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:17:49 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14076.1764566264023757777
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:17:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=kypVIswJ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=fHzKDYYE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019ad8586556-58e58d1e-3e65-4dba-a48b-c6fd9100827f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566263;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eFh+pLclKMUX/a+Ib1c5oohHPTZlWxKYAkyDn67Pq+8=;
	b=kypVIswJUA6ROmotsnUyVDj1r2wBb4R7OXrBk3A1CKkXeVZhVhJ7VtJkwBOxtQs3
	73iN4y9YVtmFoXVA1uMV9b5zp86+6LxTTPvcLrQTPZpOSeNEQphpc8nj+6zX8w5PS0S
	whGAVINggKMLEel5PB691DXniWoBPaXylrmKEB5w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566263;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eFh+pLclKMUX/a+Ib1c5oohHPTZlWxKYAkyDn67Pq+8=;
	b=fHzKDYYE56o/wdGsALrF+5k78RFISxgDCZ9TistH+3wKvQl3XwT8A3gT0A2mpcu+
	D0iTFes+LRCq7ux/tp3VOjRfcxCYc7BpVzkPhg1h+tjF8iV2s0zGQu2TtELozCxKOTG
	HHDy/eDi0EnwUZ9X49b7Vp6N9Iz8KV22V5wW/xMM=
Content-Type: multipart/mixed; boundary="===============7913000301545840917=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxcrypt-compat,libxcrypt: upgrading to 4.5.2,4.5.2 FAILED
Message-ID: <0101019ad8586556-58e58d1e-3e65-4dba-a48b-c6fd9100827f-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:17:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226957

--===============7913000301545840917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxcrypt-compat,libxcrypt* to *4.5.2,4.5.2* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake libxcrypt-compat libxcrypt' failed
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
--===============7913000301545840917==--

