Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E96D12663
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:01 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13898.1764566266684554756
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:17:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=lDmVQN/Q;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=dV25fds5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019ad858702f-b1bfe768-3ab4-44f8-81b0-2eb240a33940-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566266;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OHuy2wlYa/EsmGa1H3QBYlAj9vOp3U32L9yk9aLNsyg=;
	b=lDmVQN/QtJW5PhjzpAlmekjR4HgkuNyoL/T6Zu8aDqdrs75d7FB2g9l+mNyAAgmw
	jvJEHEDFYdbQzUFQvNEE4Zp1YB9p9cWQxLwef2ZhCUNhB3QFa7ZjQZ1757PmYmIqJ/v
	lAsm78b4UN4imycYEL4Me2PstiQGqlpd4PO45J4w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566266;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OHuy2wlYa/EsmGa1H3QBYlAj9vOp3U32L9yk9aLNsyg=;
	b=dV25fds5B4MtTha28sku04SYQreMQFp2VWofI/f9ejLhTdhijmZuX8kRBOtJqBNg
	l8viEhbpyEnYlvXsmGCmqvW8eKBXQmbgvXAC/cXbL6hYDGH9H3jHqkXlZkSoqPHYMpU
	IQeBTJg/94/NtGvn7ZES/KoNtICycR0mBJLVayXM=
Content-Type: multipart/mixed; boundary="===============5026181509559353150=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>, Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux,util-linux-libuuid: upgrading to 2.41.2,2.41.2
 FAILED
Message-ID: <0101019ad858702f-b1bfe768-3ab4-44f8-81b0-2eb240a33940-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:17:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226959

--===============5026181509559353150==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *util-linux,util-linux-libuuid* to *2.41.2,2.41.2* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake util-linux util-linux-libuuid' failed
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
--===============5026181509559353150==--

