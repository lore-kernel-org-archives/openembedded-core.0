Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB89D12668
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:26 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14091.1764566272084136270
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=aObIx/JJ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=fnoG9uJ/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019ad858f2fa-fc66c895-5485-483a-a409-d7a9a1ffd941-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566299;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XRvY3Rb74VGhTA+AXAlcLWRU0S86JPhGie33pdf5KBU=;
	b=aObIx/JJxW+5MU7jLS4HljA7Ev1VjuSeHtv1tE1+08gRfY8zPv63lBA8ERzhCNyp
	uygb6Iv4MYMkdvV+IbBN9TLey5gNOJAJta9JZG1qGqXo7ZGXALBKdKcXZxsLUY3wr5G
	AF+NdvPFV14+esxdzKMgsFfwLtgtB1uNUJWr7cqM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566299;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XRvY3Rb74VGhTA+AXAlcLWRU0S86JPhGie33pdf5KBU=;
	b=fnoG9uJ/r7m2E0oA98UGJTBOEmqEul8ZMrGIxSmwt5xUJEYLAEU6S9d9adRPamdv
	/kk7E+69rCsj4S8kW0LWYOskO5i76T6h9LC/5Mfso96hvH9Cilw4fp1zGTK1ejMcObe
	z/vKcVm4XwnEr+SBLpZcnCipXIXOMIYFNiKCOsfc=
Content-Type: multipart/mixed; boundary="===============0275385358265382028=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] x264: upgrading to b35605ace3ddf7c1a5d67a2eb553f034aef41d55
 FAILED
Message-ID: <0101019ad858f2fa-fc66c895-5485-483a-a409-d7a9a1ffd941-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227091

--===============0275385358265382028==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *x264* to *b35605ace3ddf7c1a5d67a2eb553f034aef41d55* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake x264' failed
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
--===============0275385358265382028==--

