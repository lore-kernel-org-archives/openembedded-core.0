Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C7DD1170C
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:00 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14079.1764566266952370533
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:17:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=3AAV+mJI;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=bwZ6BQd1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019ad8587e1c-d6cbcc1b-19cb-48e2-94fd-d93524556771-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566269;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tfFe3V7Vg4gOGOGwEU6gOK53yekhFSXsvDMD0zsAMDg=;
	b=3AAV+mJIg+CdzPwp/74lV/op6AVDVqNC7qLI3uk+KZOQGc0OdaSg6hUvO7nKqlKY
	9HUmlk3sF6uw5m/X/luCyWHQg7AbDZt+4Ney31sICQ4rzpzMp9A3oPafCnuQwIO6bc+
	Dr4hWknc1WKE9QlPThwqvKmvBGGI+xq5cZky0/No=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566269;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tfFe3V7Vg4gOGOGwEU6gOK53yekhFSXsvDMD0zsAMDg=;
	b=bwZ6BQd1BVNuhM7PZ6lEnMJM8faj3m13S5jjzita7tttvdEDtFxNO6g29HV15AX3
	wh8EseXoMsbWv4WmQi+vtsZVl9aURB/HGC20WlwbugZJ/RulLyC7SgWNox0PV/kT4qh
	oplUD+6LZIlb7FhOsJVpPDAAkQfnamsYFVX30Brc=
Content-Type: multipart/mixed; boundary="===============8850323000438016695=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH]
 gstreamer1.0-rtsp-server,gstreamer1.0-plugins-bad,gstreamer1.0-plugins-base,gstreamer1.0-plugins-good,gstreamer1.0-plugins-ugly:
 upgrading to 1.26.8,1.26.8,1.26.8,1.26.8,1.26.8 FAILED
Message-ID: <0101019ad8587e1c-d6cbcc1b-19cb-48e2-94fd-d93524556771-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:17:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226968

--===============8850323000438016695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-rtsp-server,gstreamer1.0-plugins-bad,gstreamer1.0-plugins-base,gstreamer1.0-plugins-good,gstreamer1.0-plugins-ugly* to *1.26.8,1.26.8,1.26.8,1.26.8,1.26.8* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake gstreamer1.0-rtsp-server gstreamer1.0-plugins-bad gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly' failed
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
--===============8850323000438016695==--

