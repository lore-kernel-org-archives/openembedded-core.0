Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B18BD1266C
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:02 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13911.1764566275843661686
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZywNPH2E;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=mFNVhYEi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019ad858addf-94afbbf1-7825-46f6-9fd7-542d33ad109d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566281;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9WlqLNs+MwmQvJrMILfb+bsWyrfP7d8aK3jAv0XWltE=;
	b=ZywNPH2EO2muMpZbzDPKrNQPa2poaSryvLOGMZz9uL0rcmKg+yQv7/tNrwflWqu9
	M0bdjbj0Ly70nkMuLGpp542oSWbafBPm7Z0ITJ0I7186I+Zv0DJcL0U+L1lFagwLxyU
	cpIPyKpshL+BvoOUcYoNFkzTN0kMZUtfQDR7Ow7g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566281;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9WlqLNs+MwmQvJrMILfb+bsWyrfP7d8aK3jAv0XWltE=;
	b=mFNVhYEi3D6+b5CO2Gaf2ihiWkwOAC7Sju6+pkHfN6KrEyPRVw9lJEj0UyBm/gU0
	73fIJSv0cEb9CrjcpFE5s0C96PX/ne8hihEOkKOC2Z03//uG2YN7ELwB8UZ1Nq4i9Gb
	xXwt5GfKE83rZKBwg5LsG6cKv8pFW/szyEfNbjWE=
Content-Type: multipart/mixed; boundary="===============5940338134277270504=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycairo: upgrading to 1.29.0 FAILED
Message-ID: <0101019ad858addf-94afbbf1-7825-46f6-9fd7-542d33ad109d-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227013

--===============5940338134277270504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pycairo* to *1.29.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake python3-pycairo' failed
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
--===============5940338134277270504==--

