Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5563.1793252418251227158
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 22:40:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=iiFVWAHy;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=EJUiGWWk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a1862c5eac-ebf54b7d-c4b1-45b0-b45d-2f082e6218f6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793252417;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BEmrJMelfT2lZi7kDBVhfR3bghPV9N/s3R5n2a8mmlk=;
	b=iiFVWAHynZstODgQs6QuFdY7NLJ5QrXdgds3/LIoAKyFhNcSjVR2KQqMxeAuXtZl
	BZaF03+BEe+YRoU+7QqDJQ2zEFgcJUgZ3pzJq1tQgSn9DEaJSQugrmIgb++EXs/NyWJ
	TZCqdv4HRnlar3ER7Gsri/vryonefjKjYl31ZkAI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793252417;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BEmrJMelfT2lZi7kDBVhfR3bghPV9N/s3R5n2a8mmlk=;
	b=EJUiGWWkXGu33dqaW0M5eJ8lVWoIvfL65yM5GSKX04S+mJ5PI18x8fb01fzigjZN
	T5pCucnqVGJycamHOIxAsAwINC8gZT2HKAWVVdbbL880sLGkxof1dXmaDnJiGtgXpW1
	EE7S6CYKvC8X3lmUUTFZJeRJlSFMH+gNoS4tyBZc=
Content-Type: multipart/mixed; boundary="===============5648601536369458583=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu-system-native,qemu-native,qemu: upgrading to 11.1.3 FAILED
Message-ID: <010101a1862c5eac-ebf54b7d-c4b1-45b0-b45d-2f082e6218f6-000000@us-west-2.amazonses.com>
Date: Thu, 29 Oct 2026 05:40:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.29-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 05:40:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248890

--===============5648601536369458583==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *qemu-system-native,qemu-native,qemu* to *11.1.3* has Failed(get_env).

Detailed error information:

Empty environment returned
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1997 entries from dependency cache.

Summary: There was 1 ERROR message, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5648601536369458583==--
