Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1096.1792734602036992753
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 22:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=M5tQbbEY;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=sIQsAe9U;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a1674f1eff-0475a34d-67eb-41de-bd74-2847e5fb2491-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792734601;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=lPxJbhBq65puY87WqIBNletl0LF06ENwdXXmvhE34eY=;
	b=M5tQbbEYWNgbOjAGPbwrJXf+WISm8pXDhTHzh0kRSUo7lB93bZ/PRj+AsaXyJOZC
	mc7I+jjfcFBNWfWsLIOP0mXC37bFbwR27ZAXecbwOvF0lUhhFU5zihPV3eAX2GuBd3I
	8P0RX0sJaPs6obO8vh89Zp7rT6bt04EQJ4nUmmPo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792734601;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=lPxJbhBq65puY87WqIBNletl0LF06ENwdXXmvhE34eY=;
	b=sIQsAe9UXf7DcjI3v3BL44LUf0UZBJnA+oRIRO05ARSMD8JAFbUbcUyl1oGJMcii
	c8VJnFWGBmwKZtIPm275F5OWVXiAD32b3Znok0PESlhWtcsO3p7UbqsnlGSYbOMpF7I
	Vg2N6HtrCA9TxpI1jGnhU+JItORF5IWpTEg8U2xI=
Content-Type: multipart/mixed; boundary="===============8347671587660788659=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] ovmf: upgrading to edk2-stable202608 FAILED
Message-ID: <010101a1674f1eff-0475a34d-67eb-41de-bd74-2847e5fb2491-000000@us-west-2.amazonses.com>
Date: Fri, 23 Oct 2026 05:50:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.23-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 05:50:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248475

--===============8347671587660788659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ovmf* to *edk2-stable202608* has Failed(get_env).

Detailed error information:

Empty environment returned
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1996 targets, 61 skipped, 0 masked, 0 errors.
Removing 66 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 64 recipes from the qemuarm sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8347671587660788659==--
