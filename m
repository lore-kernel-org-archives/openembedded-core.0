Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC3BD12660
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:01 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13904.1764566269431105607
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:17:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=f8vjo/fm;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=oPyT0dmb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019ad8587d4a-54aac52c-2607-4f1f-8637-9d007406a031-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566269;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+3uHjCL92M/D+LhkomNjKZmPT52sMhrYZGMVb8p3Umw=;
	b=f8vjo/fmntNPpPCzg6S66Wg9nPuxMGKatHGxVIQW/MdPr2ZMZsOdJABzL+lO1bVC
	j/a80LWUOEBCqvIHVsGyFXAJF58p+hurV7iEl8PDrOICKNzSD3BBS2gL9I6tPiMOaun
	QBGbfjJqiDzyxYU2cNKQfjTtg9u1/wE/3A9LXJhY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566269;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+3uHjCL92M/D+LhkomNjKZmPT52sMhrYZGMVb8p3Umw=;
	b=oPyT0dmbU8E+H5q+YDtomZL39bWhKMPFkRVIxeKd9W9wV1VcuO+EdP82LMdsr/BI
	T2Y+0cm7t3oy1y936HFebmyqW2xUICtKL3Ry0Z0wo0GUdj2+iVGrXnNYYf9IvlaqWpw
	j41e41tINSNf2Bl6mpf+AsUTaNy97zlBwZzELkfE=
Content-Type: multipart/mixed; boundary="===============7102103322922501261=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xeyes: upgrading to 1.3.1 FAILED
Message-ID: <0101019ad8587d4a-54aac52c-2607-4f1f-8637-9d007406a031-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:17:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226967

--===============7102103322922501261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xeyes* to *1.3.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake xeyes' failed
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
--===============7102103322922501261==--

