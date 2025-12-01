Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB4C7D116FE
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:12 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14081.1764566269547724683
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PXAJHMRk;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=DU1qe0e0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019ad858d0e5-c4fc8e3b-3b63-47c1-9bd5-cfb5d2c344f6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566291;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lBpPcgra1dnKVeeNpbZGZqfga32YRaZEcuRLI8k6K4w=;
	b=PXAJHMRkzJ59pVZ12Sac0mNuloJ0E5IKZ1h0w/oweGjCB8iYY454A0xI2zVkfmZi
	d5iHP1a0voJVBa6LW+SCM2KoX/ob50YS1Sl1yxWpFgaWPGm0+mU7y1yC3iaeMtCuSJp
	TXppUPQd+bcFUgp/Nbfbt4IMKJUpA/pbOwGF5IEw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566291;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lBpPcgra1dnKVeeNpbZGZqfga32YRaZEcuRLI8k6K4w=;
	b=DU1qe0e0+AADuI81W/Nkp1ZB4b56FWAMeZe6Lcd7IfEhaz7vIMKg+fQgKwyY1vCp
	TNxJ+1N6jMzvrhTRwgMqKXuBwG455Iyerfy50RHngg1bMGu18/rNaKinlP/urvwWWRw
	do7fijXatADnwxkDg3sIEbO423opvd/hhPXfAmPs=
Content-Type: multipart/mixed; boundary="===============0534498895084829468=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 7f05d217867b2af52b0a28c6d1c91df97e1b5b39 FAILED
Message-ID: <0101019ad858d0e5-c4fc8e3b-3b63-47c1-9bd5-cfb5d2c344f6-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227049

--===============0534498895084829468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-helloworld* to *7f05d217867b2af52b0a28c6d1c91df97e1b5b39* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake go-helloworld' failed
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
--===============0534498895084829468==--

