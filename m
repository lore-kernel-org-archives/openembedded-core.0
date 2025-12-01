Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A38D116F3
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:02 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14100.1764566279770090488
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:17:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=R/eEMZ3m;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=kWR1FhcQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019ad858a29a-9ff8d08a-107a-4a4f-996d-7bbbda790825-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566279;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RO0Yjfzeay3AJdYUo8f0EuOfFVbkU3x/1EVW25Lhgcc=;
	b=R/eEMZ3mGVkG/wIQOJ7ta2JkboPDUlVKuKivrXZazTivkQkfxT6eHaEPnc/PHNBH
	50xydONFMK8QaPvzhnDDnTG1kD4s6un+PPaby9HoNPsZbkGDMPoVmbusCw0LxX71dLG
	OG9TofoH2j73kZieF9bW2z8FxPe+kZp3dhUphNZY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566279;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RO0Yjfzeay3AJdYUo8f0EuOfFVbkU3x/1EVW25Lhgcc=;
	b=kWR1FhcQbec1O/fQBuqi/ss1uQNwPOGc317G1FLSJSigVP6sVJLuqGPXJfk+lGI4
	nC6xBViXFz4M+TavBAzjz9XMplxN40cR8+Nq2ENW/eqeAxYGHB2bkhJvS74h3WH1dZk
	u/3tK4eWZlxE7VGz1IlbEQDNC0ODU9UdEkAEqNYw=
Content-Type: multipart/mixed; boundary="===============7688064808235071559=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-iniconfig: upgrading to 2.3.0 FAILED
Message-ID: <0101019ad858a29a-9ff8d08a-107a-4a4f-996d-7bbbda790825-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:17:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227005

--===============7688064808235071559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-iniconfig* to *2.3.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake python3-iniconfig' failed
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
--===============7688064808235071559==--

