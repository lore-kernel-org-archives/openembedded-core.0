Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB6A7C9830E
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 05:22:37 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6777.1790745754299468318
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 22:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Um3T2wIq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=JQqrCu/K;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a0f0c3b6f5-969c99b5-8700-471d-ae60-7dd3be5765a8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790745753;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wKSE10Y+QEGhMwaSjMlohFDAartwTbssHGVaQ+NflDg=;
	b=Um3T2wIq3LEXjDFUszW6JsrjoFoTAUw6LwVNkKC2Lym7pPa4R2S6HozTG0QFATMf
	7TM5nQujbfFgRCWvdfr8T7bL+Nf4ufxIj9bMTnxKuo4g0et4fnLUEM6iTIBHf8EwR60
	Hz9ES0uRtjM7IHbrmloe+zc36FwXB9RxvO0b7s6o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790745753;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wKSE10Y+QEGhMwaSjMlohFDAartwTbssHGVaQ+NflDg=;
	b=JQqrCu/KKEpNPmVpXPebpj3xQbeaMAOUy61GmYcrh67pyS9UKMruW6wi/BzNrJ1x
	MXrHZjX1CcroaRT7jwQwTUhDmc2LkKcn9JaoB3gcAQzv216hY0h52QnZsTPX7zMsIiG
	sKVrz8hCaWVbvSax+J7Y7Twnl68X9nOLqWsjMYwQ=
Content-Type: multipart/mixed; boundary="===============6160812685559617149=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu-native,qemu,qemu-system-native: upgrading to 11.1.2 FAILED
Message-ID: <010101a0f0c3b6f5-969c99b5-8700-471d-ae60-7dd3be5765a8-000000@us-west-2.amazonses.com>
Date: Wed, 30 Sep 2026 05:22:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.30-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 05:22:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246908

--===============6160812685559617149==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *qemu-native,qemu,qemu-system-native* to *11.1.2* has Failed(get_env).

Detailed error information:

Empty environment returned
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1991 entries from dependency cache.

Summary: There was 1 ERROR message, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6160812685559617149==--

