Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D44CA5FED
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 06:50:23 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2260.1791528615683556987
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 23:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=sorNozip;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=tMn5Wbwn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a11f6d3b5b-9961b116-0712-4939-8d9d-660ef80857d3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791528614;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ynMAHCn0wXz5w73OqMwJuEuUfbfp4OJTla7iEj7Wul8=;
	b=sorNozip7lDillB9o/mO64y5yJxxATnHMCD2n920oTpQ+7EJQ523L7/gWvYcD21G
	AvEljrqx8K5ZsIJGoonBeF7rLdnoTV07GSZ0TlRRb8qyuzWMIXyLgW+TLJfqkWUCebY
	k0BuumaFYgVIOdonRxfYMeGA3csBSin6UwYXHXOI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791528614;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ynMAHCn0wXz5w73OqMwJuEuUfbfp4OJTla7iEj7Wul8=;
	b=tMn5Wbwn6zejqGT8wZQLSDaBGCeQiWhm2O8ln/gVGNmeMO+PS/1FBzx94UncYU1D
	qF4kEcaueJg5W1fBLgM5qWFLdCOBRhVLJvsU26sU3EosWWyW3/Y94rMLuEkLkGBdAtO
	g5U1ERjMRRx2GzUJEhmk2xIqr7HD2jXnGdD0WTaE=
Content-Type: multipart/mixed; boundary="===============4835078100116698172=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 go-crosssdk-x86_64-pokysdk-linux,go,go-runtime,go-cross-canadian-x86-64,go-cross-x86-64-v3:
 upgrading to 1.27.2 FAILED
Message-ID: <010101a11f6d3b5b-9961b116-0712-4939-8d9d-660ef80857d3-000000@us-west-2.amazonses.com>
Date: Fri, 9 Oct 2026 06:50:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.09-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2026 06:50:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247455

--===============4835078100116698172==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-crosssdk-x86_64-pokysdk-linux,go,go-runtime,go-cross-canadian-x86-64,go-cross-x86-64-v3* to *1.27.2* has Failed(get_env).

Detailed error information:

Empty environment returned
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1992 entries from dependency cache.

Summary: There was 1 ERROR message, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4835078100116698172==--

