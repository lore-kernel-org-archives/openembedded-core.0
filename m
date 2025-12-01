Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7888CD116F8
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:26 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14118.1764566291921290226
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Bosm/2dg;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=DgMRj8hB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019ad858f2a4-3e3fd272-32ef-4a84-8e85-993700d1cf0d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566299;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fCHd+eJ1HRlBBHXDQW1zl4hIUBccljsJuzL1dqx/9Yw=;
	b=Bosm/2dguw3vN/mruSVEps5ijkDq4050Xr8rOgflZMamln0R2Z76JccOePYb1syC
	Corq2q+jlOJJllRVkdO//fty37lTzAj1V0zZg+Mf2S+dCdISHcRiF4fz2v/PyBcB3AZ
	swW62moVEPonEu0MrrluiEeLlP2dz1bYemioL3dA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566299;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fCHd+eJ1HRlBBHXDQW1zl4hIUBccljsJuzL1dqx/9Yw=;
	b=DgMRj8hBkrzU4rgOkQiaMZJp+yntP0uZ6KgXZehKlJHOdI8j3EYSHx6lIqeKaopV
	DVw/2FY0NLB/E9Y1ofNxifOlsli6BblhbHikWPqiQfnyTdy3UMqrsls4MrQj9Zpo9AN
	Ux2usPEhKR5uDw73n/BzKTbhQyOWg+KAC+UA6E3o=
Content-Type: multipart/mixed; boundary="===============6103323881809812034=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libpng: upgrading to 1.6.51 FAILED
Message-ID: <0101019ad858f2a4-3e3fd272-32ef-4a84-8e85-993700d1cf0d-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227088

--===============6103323881809812034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libpng* to *1.6.51* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake libpng' failed
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
--===============6103323881809812034==--

