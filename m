Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC92DD11700
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:17:59 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14094.1764566273179227802
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:17:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=JcmSvtoo;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=WIn+L7P+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019ad8588827-b93fdae5-3f95-48b2-9239-d7a2465fc9e7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566272;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0nb8DRrjN75WuIpUQdfsvLj9kOHBsipyxoEuDGUHz4M=;
	b=JcmSvtooR2bF+I3TEQl8irlsmrQ2qVgXWmb/G0Qje+tTqT2T0QtHZbkGh8DxVctn
	fG9ewqybURoIX/DYINzTFgHjsLPA53wha2IHAbuab92ANnpjkiIiTNB1zIetWZNEIzS
	iiYIWCR0Ugja9FxhbK6kd/e0Df4DLsvO7MhOaxRM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566272;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0nb8DRrjN75WuIpUQdfsvLj9kOHBsipyxoEuDGUHz4M=;
	b=WIn+L7P+WYsjFQSMk0qOnwkDQUcrK6YJuxSnG1NTvvJZ8JX/V4ygZ4pGpioRAKO6
	CF4Q21WAHkIABQ0HT6z2pacqoiy5y0g8VuW/90AoWw2yBf+PqjVcjLYLOVPcx2aBz1t
	8E3/wc7cQEsg/xuScNzb87jLELNb/yc6osoOExEg=
Content-Type: multipart/mixed; boundary="===============7926281162962927192=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ccache: upgrading to 4.12.2 FAILED
Message-ID: <0101019ad8588827-b93fdae5-3f95-48b2-9239-d7a2465fc9e7-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:17:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:17:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226984

--===============7926281162962927192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ccache* to *4.12.2* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake ccache' failed
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
--===============7926281162962927192==--

