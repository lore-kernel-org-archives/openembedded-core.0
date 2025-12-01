Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1703FD1171A
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:01 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13907.1764566270883169101
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:17:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SI0eGOLv;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=RnG/uvOL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019ad858806e-160e5e8c-81ee-4d16-99b6-68450687112c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566270;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=euO0n9uJxnUKbUCEEJMfbfEqnVjV6qSQB0n8snnM/tk=;
	b=SI0eGOLvnLyBSBKwsQZRxeGB+Y/eZBhtoP4KjreMpoO1BULARGzrV8B7FZjn4yQH
	xJSFXT/lrnXv2dlw1ERFueIwOeziC+CJ+dBZgCsiDJP12K5I1WuvhDXuMIZPuIiXCPL
	nVG/HCyb8P8En21DTQvQ7B4K7PM6P9/cWcBPBPDM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566270;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=euO0n9uJxnUKbUCEEJMfbfEqnVjV6qSQB0n8snnM/tk=;
	b=RnG/uvOLerJwsqaYtMOgUpIKjSgdoWuTmY2jHPhwZRmuG1PIDxikUwpFYLXkjxlf
	23pUDj3vOJW4Tf60ebHABeM3dTRwD0iOe5RZXJC4Dsl45uDM55PBEQAiDCIDVUx7ss/
	0LijamUEp+D8GavhpZJDBTmqwSFfTHCciZ/1O2js=
Content-Type: multipart/mixed; boundary="===============7998830085109825258=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] kea: upgrading to 3.0.2 FAILED
Message-ID: <0101019ad858806e-160e5e8c-81ee-4d16-99b6-68450687112c-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:17:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226978

--===============7998830085109825258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *kea* to *3.0.2* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake kea' failed
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
--===============7998830085109825258==--

