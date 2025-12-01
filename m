Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E668D12661
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:26 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14112.1764566286080832132
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HhXT3F/Y;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=idS3qDXl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019ad858f65c-1b5d1949-b990-4d26-af4f-096e94363028-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566300;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Hz5OLitr6N1khb+PRmoSZMwkccQu+b2PPv5L/sDawYA=;
	b=HhXT3F/YD/2CxDnm3640UI5UMarzIL17E9okPZdQIkDBFLQO3wYrljONj3B3+DLX
	/HYgOnaXP3iirqQ6LRuYPZ0Ng8pxLGJqlach1ln6vv6V6RlPBiJ6mjJVyXb6c7wtsWy
	uWHh50FpepjPdlkoKqrfZgZ94zvzT2IlXtZpun4k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566300;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Hz5OLitr6N1khb+PRmoSZMwkccQu+b2PPv5L/sDawYA=;
	b=idS3qDXlKK2z2smPHZRpsMruKFpEut7oWtbNwGqvtzrSC+O02WSOkhFJcKYJofYi
	ro/ARSSwrMZW8T0kELF8qeSlE7EoHXqT61vWr9q5RkAJFBX08V6vtYN5RlxnCu175jq
	bEmy3g2G896gGnM0XA+umvrKOpjVfugqFhPUy7fQ=
Content-Type: multipart/mixed; boundary="===============1879801935674038758=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] at-spi2-core: upgrading to 2.58.2 FAILED
Message-ID: <0101019ad858f65c-1b5d1949-b990-4d26-af4f-096e94363028-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227096

--===============1879801935674038758==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *at-spi2-core* to *2.58.2* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake at-spi2-core' failed
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
--===============1879801935674038758==--

