Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33891D12689
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:15 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13924.1764566285337802572
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=JN9/twkx;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Qs5GtE0K;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019ad858df2c-57d0ee65-6acd-42a8-bd88-51af20e5ba0d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566294;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=s6wnrHB0thM436OzeFgrjjEbg8erNShmtmCBMh6hKGs=;
	b=JN9/twkxcc/MWOMk7OagclqBBwTLdd+tEuaHgJgmBrl0ZenPlwI2C9jH2C5IFYdz
	Lq4XuHXYtb7GyvViwOjoSqFbZVsH/ve8zXB0pKZDLT3tDKcSabH62NrBcl43qXOFB9m
	C4VvSauWtTD4Q38CMTF+NpUYrgP23mfAP1/Cspc4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566294;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=s6wnrHB0thM436OzeFgrjjEbg8erNShmtmCBMh6hKGs=;
	b=Qs5GtE0KK3ZiJ+pkh1mQkAYi8Qvc9xpHXWfpqcDZQpxg33E/Tt5f5oPMvVspgITn
	mPgre9QJVUtmFj0q7tEQ5J4HmtElNZYLochsXIffGI0zvaIE3ZKZzCHZPvaC9LyQlTH
	nmgTl9p6ifVJtqKUxq+/le09GR8iMNXxPoIxqZz4=
Content-Type: multipart/mixed; boundary="===============7977780989738956511=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] igt-gpu-tools: upgrading to 2.2 FAILED
Message-ID: <0101019ad858df2c-57d0ee65-6acd-42a8-bd88-51af20e5ba0d-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227066

--===============7977780989738956511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *igt-gpu-tools* to *2.2* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake igt-gpu-tools' failed
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
--===============7977780989738956511==--

