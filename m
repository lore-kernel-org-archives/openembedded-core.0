Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3797.1794377107533835400
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 22:05:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eezMcaun;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=vs+30iNv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a1c935c4ac-d652f78f-993c-45dc-8058-5dc17b07c79e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794377106;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+085oD5I+xbV3d7GQWfz7S54O+51Kugf4x1PDO9B4+g=;
	b=eezMcaun1XhddTJS9LNVcEmE/Yvn9rGWyK3hMrQ9DA1f0K/DtwXfYnQC5C3fzvxa
	470anmdoAnZzEO80Kpva0M1SeXHxYReCsFxb3Rj4M0F3FUxpLhCGugQ2K7z+ElzMRio
	hkddcdrf8to+hh4mMf0TjM4q0ebnbdzSJkAkUnhY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794377106;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+085oD5I+xbV3d7GQWfz7S54O+51Kugf4x1PDO9B4+g=;
	b=vs+30iNvTG4gfbij0ZHg75VdjKfBbITvlH2Bgax9LfAu3XHFlCphCdbf/Ftwsz7Q
	r1Ic7zwR8Vna3ylSoIMkOq2D7yNFuHu3UXmCO0m4Oocc1GD8BsR9xe83ZZy1acfJ0td
	+El2sBeCvVF13a0OHYtobo++dpwx5kjyGGOUSilo=
Content-Type: multipart/mixed; boundary="===============6532329457687120911=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 go-cross-x86-64-v3,go,go-crosssdk-x86_64-pokysdk-linux,go-runtime,go-cross-canadian-x86-64:
 upgrading to 1.27.4 FAILED
Message-ID: <010101a1c935c4ac-d652f78f-993c-45dc-8058-5dc17b07c79e-000000@us-west-2.amazonses.com>
Date: Wed, 11 Nov 2026 06:05:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.11-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 06:05:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249952

--===============6532329457687120911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-cross-x86-64-v3,go,go-crosssdk-x86_64-pokysdk-linux,go-runtime,go-cross-canadian-x86-64* to *1.27.4* has Failed(get_env).

Detailed error information:

Empty environment returned
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 960 .bb files complete (0 cached, 960 parsed). 2004 targets, 61 skipped, 0 masked, 0 errors.
Removing 7 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 6 recipes from the qemuarm sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6532329457687120911==--
