Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF08D116F3
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:17:59 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14085.1764566270274186682
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:17:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=zw9vS1AW;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=VGtQntgO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019ad8589fa0-7b38da4b-90e8-4988-83be-605df96fd25b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566278;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZB9r8nFM8de2pNEurPDgIr/fgXULL1D1OkNB0HANaEU=;
	b=zw9vS1AWkWyfY3hx3ECDYjo1xm7RAYVN5nreBjDbBGlPshLRq1v1tVgYmpdFIaoM
	mWBAWaZYdrvKRUOCUvOpn+AFIWdg11WO93fpWBZ6bfyy4W6tjheS7FSNr9gEwiYLUsv
	/KYAw0xz04xoI9+jU5fXEVq/1m3O/Dt3lggPA8E0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566278;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZB9r8nFM8de2pNEurPDgIr/fgXULL1D1OkNB0HANaEU=;
	b=VGtQntgOePCdG03rVDOXgczXyrRcpi4y3v3PPcbkAUk0GAxxiqZigRxuN0AvQxxy
	r0m80zjpUANo3aIl3c5zY4wHXBnGjgDj4wgAN1/tSRBGEymdfbhmWS+l69bME6jslHa
	Is5WOYv9WCkB9YkL1D7ZzQTP+Z7U4FXWN+OpBl/A=
Content-Type: multipart/mixed; boundary="===============0526848140414922634=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.148.4 FAILED
Message-ID: <0101019ad8589fa0-7b38da4b-90e8-4988-83be-605df96fd25b-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:17:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:17:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227001

--===============0526848140414922634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.148.4* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake python3-hypothesis' failed
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
--===============0526848140414922634==--

