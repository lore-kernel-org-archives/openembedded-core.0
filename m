Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC4CC4167B
	for <webhook@archiver.kernel.org>; Sun,  3 Dec 2023 16:33:45 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.42782.1701621222962193421
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Dec 2023 08:33:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AyecdRha;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bAPuDg6W;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018c30874843-c31eae1e-0aa2-41f0-832a-7c03e92ab619-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701621222; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date;
	bh=KWhxroiJJoeoqpvynYtMmvAL/4733YeeIo5LgCAKjhw=;
	b=AyecdRha3cWKPYOqed0MNaw7DDUSeCAQitxMJ+XorqUy79uHxqfN5e7LsR3zd1Xu
	H6yOTvQq4UKAtxuffpS/82bXaKNob2lVlBcJUlrkke/Q3wZRLsIz8WPYHEG7vZhTdvl
	aBFSvKulAFUMuOJlkAlyYFwm4MzG10TSpR9uK924=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701621222;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=KWhxroiJJoeoqpvynYtMmvAL/4733YeeIo5LgCAKjhw=;
	b=bAPuDg6WjUImBLsY+Bl+HaFmbEr4SHRIdJywdK2m+5LYeB+mld4ziaUJMD0w5zXn
	kRovN+zfIVa3pRqLecA4G9tXmu9Y8+ZYXbV+Vety2kJ4YgnaNklOM5wNFJu9mwHpS68
	0cqwKUj8FIUgTidvrSsB8uZR0NZXcBEzXr+mOHQs=
From: patchtest@automation.yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH] tiff: Backport fixes for CVE-2023-6277
In-Reply-To: 20231203162038.3434707-1-raj.khem@gmail.com
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018c30874843-c31eae1e-0aa2-41f0-832a-7c03e92ab619-000000@us-west-2.amazonses.com>
Date: Sun, 3 Dec 2023 16:33:41 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.03-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Dec 2023 16:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191718

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

