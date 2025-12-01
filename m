Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F68D1268D
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:26 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13941.1764566296300695582
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=rSc6mcP3;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=qoblIWfc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019ad858ea87-80a11188-5ff8-4c40-8354-14dfd1794a27-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566297;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wVc1WOYGPXyblJK7HMHGefJFpGakiUOGypG7DYJFflE=;
	b=rSc6mcP3g7pdNa6OLvkolLx1n74Tc94Xn8/UOu0rlyW5xJjHbiwxDFeTKq2xenEv
	tcBEpF20gTDcf4v0d3MFSJZpWzjJzwU7BoLvnqTQ/X0fN4M7ewSrdU4yRsnegRR+NmK
	2mZzjpoIFIRo+j1ITFUsoVYFn7UYOb/j8fejDgD8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566297;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wVc1WOYGPXyblJK7HMHGefJFpGakiUOGypG7DYJFflE=;
	b=qoblIWfcL8cpwPIvA3Qa0zLTxUaHa0eGdn+WomJ91x4wm0pprNt/plmbyHCIUMlR
	aU2AMlB2OUpBovI80Mc+UclFcC/Xt1e4b5tgcATLcsKhPREncmHyxvDHN4XYAB4Pn77
	FycLUiV3Zw38xIzZBOzR7L6AVHI9WASafLxVMAMc=
Content-Type: multipart/mixed; boundary="===============5527549346919696313=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] linux-firmware: upgrading to 20251125 FAILED
Message-ID: <0101019ad858ea87-80a11188-5ff8-4c40-8354-14dfd1794a27-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227079

--===============5527549346919696313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *linux-firmware* to *20251125* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake linux-firmware' failed
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
--===============5527549346919696313==--

