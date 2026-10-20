Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1923.1792480399685638720
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 00:13:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=I5Skz/OO;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=MfqCK3rY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a158284d36-69224ab5-0d45-47b5-ac1b-ad256617f346-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792480398;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vedNujN4fI2nQZLdJNvfOW8bo06qM89n6kRdJ/AeLNo=;
	b=I5Skz/OOp9R4S7Q2LNh3kjS6P9VhjBi1N+62r1a+hRqe/k3y+cJE2GKoCNLDv1Ug
	9EqRJ8eVt3bSgiFrElyN9aRAQ6MVi1s1AdWbkYPSwcjVuqfE6yBQzAG8RpmVITx0Dz3
	5oYLZ6E3hdHH+HYZa0aMz7Bul3lxnONLQnYxU7MM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792480398;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vedNujN4fI2nQZLdJNvfOW8bo06qM89n6kRdJ/AeLNo=;
	b=MfqCK3rYsK+nUMN0ozbiQgOIy2Wj06FGOnpofXKU1eA4ezrvGHAqIVxcllplKJ8H
	Hlv8igLtsyzI/cspga4CsyILClQjjTV4xE3E1240jl1g6eBFwcJCgK4QUGLEa4RBKpP
	h54JpTw8lVtFEC5dFtJdC5Z6zWYr1wpEhIKGSEBk=
Content-Type: multipart/mixed; boundary="===============0596423567483831252=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 go-cross-x86-64-v3,go-cross-canadian-x86-64,go-runtime,go-crosssdk-x86_64-pokysdk-linux,go:
 upgrading to 1.27.3 FAILED
Message-ID: <010101a158284d36-69224ab5-0d45-47b5-ac1b-ad256617f346-000000@us-west-2.amazonses.com>
Date: Tue, 20 Oct 2026 07:13:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.20-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 07:13:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248222

--===============0596423567483831252==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-cross-x86-64-v3,go-cross-canadian-x86-64,go-runtime,go-crosssdk-x86_64-pokysdk-linux,go* to *1.27.3* has Failed(get_env).

Detailed error information:

Empty environment returned
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1993 targets, 61 skipped, 0 masked, 0 errors.
Removing 7 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 6 recipes from the qemuarm sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0596423567483831252==--
