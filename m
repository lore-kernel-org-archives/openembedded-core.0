Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69D6EC61DF4
	for <webhook@archiver.kernel.org>; Sat, 25 Nov 2023 11:48:53 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.23760.1700912932085486761
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Nov 2023 03:48:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CIp3+rw9;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=EeyR8rSr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018c064fa0d8-9cf77619-ed3f-4d60-97f3-929cf7a4365d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700912931; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date;
	bh=KWhxroiJJoeoqpvynYtMmvAL/4733YeeIo5LgCAKjhw=;
	b=CIp3+rw99tN68I+kT3t0dRCbUD5NK6yNOI8RX3NPjzGZX8ZpQVsPS1M96f4f77NA
	otMnj0PFmE4o40F1xP75HkIuncEHyc8NRTJ2lr3SzqINMFCpABcXalGxdjyAB0mchlB
	sSgYVTEjortGMi5oAe/TwH07MqSs45PB8OgA8PJE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700912931;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=KWhxroiJJoeoqpvynYtMmvAL/4733YeeIo5LgCAKjhw=;
	b=EeyR8rSrOlY10XMzUKG0Y/wI84G6qIueiUJ8Aa4hLI3mWtDVPiMtIiaBaFndfPUd
	a9WCMJA9epn2Ff+DSwGBgTqsufAN5osQTV04hfsqZRB+LN7StWEXwa9nts8+uynjBtP
	MMy+XQ57karJiBPKy6ZECYLsiXrYe/KeCNLIGvPI=
From: patchtest@automation.yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [oe-core][PATCH] bluez5: fix connection for ps5/dualshock controllers
In-Reply-To: 20231125112823.3538-1-f_l_k@t-online.de
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018c064fa0d8-9cf77619-ed3f-4d60-97f3-929cf7a4365d-000000@us-west-2.amazonses.com>
Date: Sat, 25 Nov 2023 11:48:51 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.25-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Nov 2023 11:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191225

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Tests failed for the patch, but the results log could not be processed due to excessive result line length.
---

Please address the issues identified and
submit a new revision of the patch, or alternatively, reply to this
email with an explanation of why the patch should be accepted. If you
believe these results are due to an error in patchtest, please submit a
bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
under 'Yocto Project Subprojects'). For more information on specific
failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
you!

--NextPart


--NextPart--

