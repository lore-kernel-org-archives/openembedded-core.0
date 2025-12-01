Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 805B9D1267E
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:14 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14081.1764566269547724683
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mDkAE94o;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=q97L6wYI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019ad858b184-1727e2da-5f29-4e20-8814-53ef411483d0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566282;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZxrvoocogIDwPvBpI7BvLdiPU6/YUBtKCw61c9VQk8M=;
	b=mDkAE94oGOIDaE40IiCsCiwEdr0RBqIC79hixht9W2bS/cc0apDoLzWhj7UkA9Bz
	1t3qXpSAi+BZs/1WFjV71/TEqEmTuckwZqP5IlkTmm9QWymGxGgE5z9WwcFm+cc8ggz
	0nJ1YLPVYJGXm/mjgIoep++hTEEijC942yd7AiUY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566282;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZxrvoocogIDwPvBpI7BvLdiPU6/YUBtKCw61c9VQk8M=;
	b=q97L6wYI3g98CRmzKXT8qbS7GwJclzGKGZQ+Lb/AGFoHZHKTlR8Z8yTimgY+1RSy
	99Rby1IfltYMF+9+RSd0ayzfJSPVSl2WfgIxWk/H+1ESE8z8Nl6Nbth8YMlOMdMyrTK
	h99BzvKJoNjQtunaC/OtXia2lSuaQCF/2ltILaic=
Content-Type: multipart/mixed; boundary="===============7240549918103413673=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytest: upgrading to 9.0.1 FAILED
Message-ID: <0101019ad858b184-1727e2da-5f29-4e20-8814-53ef411483d0-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227019

--===============7240549918103413673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pytest* to *9.0.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake python3-pytest' failed
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
--===============7240549918103413673==--

