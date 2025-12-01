Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A874D11708
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:00 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14084.1764566270249472282
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:17:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gNcWir/r;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=q8r3/0XO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019ad8587f3c-653c5953-0215-47dc-87df-3cff484ee0ad-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566269;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0neqvP6mdKv093sXvUa7ibwkqknfmRuKuvFWWaZ7jaw=;
	b=gNcWir/rBRgzEnAmcKdJicPYCxk0gt6Aitd0yvrFsB+D5ix16WYg2PxH14t6PbtS
	WlZjomy07zEE1I4kvdtUN8qzilebi6Xy/BO/j1tLJ6/ZtJkWx421Pr3AXreemPSOvDk
	25vBTpNgIupVXWAUSCJk2giFDBriz8+rZy6aRtPY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566269;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0neqvP6mdKv093sXvUa7ibwkqknfmRuKuvFWWaZ7jaw=;
	b=q8r3/0XO5Vqdb+3dLLtFuT0LfrbUyqGAAIUe42ngyvDUEbQEwVgc4iOtZulM1woS
	0QrPkyGv3xULlI6Qi/VqIlxX9b1o2u3hTZQL+cZveIlOhuoc5wSAhnvPEEPWvlhW22a
	kLOdm4zBG0UtUGHk6BKVTHaU6FnnTQicJe/rss/E=
Content-Type: multipart/mixed; boundary="===============8665136803074375358=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] dhcpcd: upgrading to 10.3.0 FAILED
Message-ID: <0101019ad8587f3c-653c5953-0215-47dc-87df-3cff484ee0ad-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:17:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226973

--===============8665136803074375358==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dhcpcd* to *10.3.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake dhcpcd' failed
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
--===============8665136803074375358==--

