Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B77D12696
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:27 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13936.1764566291672985723
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WatTmSSP;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=I5J1844i;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019ad858e51d-ee14de32-02a9-4b78-ab61-1bd4d39d541d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566295;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1Ygrdzg4sq1hHhtGxgfVS+cLbc+Nsz/7eX3GSD6dvLs=;
	b=WatTmSSP9YvSnkAD5V11PqmXpQD4j2j4UNT+aXRki49f/kvnvjwYTvDi5iHCMkOr
	lFQDxbC0Ewxj2SVAkLIQheWfsQ9UjazjUljrMq0hMqWQckOGbyi1QcdCaCIogLvtKJf
	c991YM8PS7rmnn7ZIJtxqCgY+uUlIT4XI8ihrsNk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566295;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1Ygrdzg4sq1hHhtGxgfVS+cLbc+Nsz/7eX3GSD6dvLs=;
	b=I5J1844isd0tHzAJ+dykrrE6eQ5niz+/6+iJcyqeISTpSK8Fr1SlIKeU+fuKaIVm
	r4yDlb51jRUJYB0Mvtqr5dx/3MdHqr5tCn42er2bF6NEesCLldjlgafoYxFT7/EqwAx
	mHIfXBSMQ/vhYLpPHjKqFzvDYpx+IGRTe1aqCXhg=
Content-Type: multipart/mixed; boundary="===============5122621150511961329=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] virglrenderer: upgrading to 1.2.0 FAILED
Message-ID: <0101019ad858e51d-ee14de32-02a9-4b78-ab61-1bd4d39d541d-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227069

--===============5122621150511961329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *virglrenderer* to *1.2.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake virglrenderer' failed
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
--===============5122621150511961329==--

