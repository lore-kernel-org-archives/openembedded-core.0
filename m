Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 078E4D12686
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:15 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14104.1764566281589692121
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=BhpaBqmu;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=klA+WTE9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019ad858da92-83e3eef6-84e5-4404-80dd-518402e7707b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566293;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mSHc8MX4g/FrIDn7Xdc/5TveeQ47KZW9B7fLP8gKrwI=;
	b=BhpaBqmuTLVCQDwLebYO+0G7yiR+iqxp9dv35xp2tzNxHDpqhlaXxVRxaDEyvdnH
	ohWbBp8TWGhMyf9IMPR9BZQ4yjfRPAyeish9MozvdSMEosHMn+41wasXtg6t4T5DDMF
	2gMtqyy5eQuzpkYabBeE/GgcmoBvIMFQx9LX8dH8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566293;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mSHc8MX4g/FrIDn7Xdc/5TveeQ47KZW9B7fLP8gKrwI=;
	b=klA+WTE96WxptcV20zXcLyr10CFIsoZm8g3HZPspId1eIRLc69PXI/ClieSpxgbD
	UOrW/WbHrMoBP7QVrqRyAzxhOu60M0B6N8sMjOjRSNUko60OblKQ7vMJwOULzkRknQZ
	gPWS6D2rHkcTPs8BgHiZkQ7CiBrp5E4g5gk8SDpU=
Content-Type: multipart/mixed; boundary="===============3754947414502474815=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Simone_Wei=C3=9F_=3Csimone=2Ep=2Eweiss=40posteo=2Ecom=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libadwaita: upgrading to 1.8.2 FAILED
Message-ID: <0101019ad858da92-83e3eef6-84e5-4404-80dd-518402e7707b-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227057

--===============3754947414502474815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libadwaita* to *1.8.2* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake libadwaita' failed
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
--===============3754947414502474815==--

