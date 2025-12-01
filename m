Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9765CD116F7
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:17:59 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14083.1764566269966864716
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:17:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fd34U4QI;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=q22uyYJ5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019ad8589a97-c579488a-635c-40a5-8a87-913c2af22f13-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566276;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NYBxOQLBi4R3Kg2BrLOXTr3bDQlZV3jmBQeza9xbai0=;
	b=fd34U4QIVpBiO3nxbERYrTES5+illQuxu+uKb2iqfVZYwpUPNjRpBkImiU4YW/IA
	cUj7HQQ+aWMGzT3I9O4jMfontEJUfToOv/pV4RsW7L6aqGgTy/NZFMhiGV4bJ2/pRfr
	/QwjE3Y+d7yWMqmLwDb43a4XACDAe4DuIGM2OPkI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566276;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NYBxOQLBi4R3Kg2BrLOXTr3bDQlZV3jmBQeza9xbai0=;
	b=q22uyYJ5/DN0tUD3I2MDSaGOEUoqNVbBTEz4ZZ9rCE3Q37ND5u2AUuvBrtKLbkDn
	Dk2QGbeIXiZOmtJ3eg/nHztEufmf0qVimbekapV/CGeLjBE8nJCDmkDo3Dz0EFHBrko
	WPlt8F3eYQqgwSob3wzyxJJ1sD5LK5tPTz6QJJR0=
Content-Type: multipart/mixed; boundary="===============2158437012453265148=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatchling: upgrading to 1.28.0 FAILED
Message-ID: <0101019ad8589a97-c579488a-635c-40a5-8a87-913c2af22f13-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:17:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:17:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226999

--===============2158437012453265148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hatchling* to *1.28.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake python3-hatchling' failed
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
--===============2158437012453265148==--

