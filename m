Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43942C5B567
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 06:00:11 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1783.1786514407900377535
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 23:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SzBJ7EtP;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=OazEdEib;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019ff48e7d87-c9003220-76c6-400c-898a-0c97daf20be6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786514406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LaIlata61tmx4IReyGgDcgGt/KKVF4w8hGUhaj5LOVY=;
	b=SzBJ7EtPJjLNf7kC+QWvi5ogTYSI7XGNNAhptYhjFtFZ8J4zvdt6roiqcCZRpiJ8
	V9U2+CkIcaxrJxZlunKoxcDmQDu4KDJaTvWl0cBtryM4h0F2WviiMx35HLZF8+pHCER
	iIBwZX8lsPOgPXEhfXP296jxzJlMkhmfr9x7cxN8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786514406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LaIlata61tmx4IReyGgDcgGt/KKVF4w8hGUhaj5LOVY=;
	b=OazEdEibXE5aCOQTA/cdX3x907XiZVhpUVHObEJbitwD5I/QxrxkGzreu5517AJj
	lRqg5D4jvVd+oGVenTiDdp1vedn4k4NxHCgnkYP46CmY9s8vyhFRxRMT9jBf+rTmBwx
	kab51v6HyjP3+BoAqmKi47fby8cQzDimK8F6Pv7E=
Content-Type: multipart/mixed; boundary="===============6119436811367914412=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu-system-native,qemu-native,qemu: upgrading to
 11.1.0,11.1.0,11.1.0 FAILED
Message-ID: <0101019ff48e7d87-c9003220-76c6-400c-898a-0c97daf20be6-000000@us-west-2.amazonses.com>
Date: Wed, 12 Aug 2026 06:00:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.12-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 06:00:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243235

--===============6119436811367914412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *qemu-system-native,qemu-native,qemu* to *11.1.0,11.1.0,11.1.0* has Failed(get_env).

Detailed error information:

Empty environment returned
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1987 entries from dependency cache.

Summary: There was 1 ERROR message, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6119436811367914412==--

