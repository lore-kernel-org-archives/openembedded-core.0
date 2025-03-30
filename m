Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E6FAC36008
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 02:57:40 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.24264.1743303454514029106
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Mar 2025 19:57:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=g8Dy56fZ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=IoUVYLp4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010195e4fbab20-5b6692e8-ba12-4dec-b7ac-7e773fc33c8e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743303453; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=KWhxroiJJoeoqpvynYtMmvAL/4733YeeIo5LgCAKjhw=;
	b=g8Dy56fZQCR4WukEC7kwbupJg6EJa3KuoXwm6Zftp4eYonELIF5x8g4ZxjTWDsbD
	9EykwFKETBtD5temH1LOQs7HVbzaX23GjmBhzCYzQnA7xeuXIF0I3GoKlYsFp1XCN0O
	nonPACO1CKYiBaeWpxRy6owNowaHPygeZ15Y6EFI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743303453;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=KWhxroiJJoeoqpvynYtMmvAL/4733YeeIo5LgCAKjhw=;
	b=IoUVYLp4f1VXp7FZueA6mtcwec6Rh+r1M+HfBEx3xr6Z+4K5ePiusj/GtqJ5kVyr
	6Gu2Ggk1XPDD3pk8J9z7b1B7UXCqj8ZB/ZnDsuN1BA6vePmYLluPozmucDSFxNzBUHx
	YgufiS1Oe4wJGf98MKaNo//XEW/zWPrj9ljyPPGY=
From: patchtest@automation.yoctoproject.org
To: =?utf-8?q?Gu=C3=B0ni_M=C3=A1r_Gilbert?= <gudni.m.g@gmail.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH v2 2/3] bluez5: add missing tools to noinst-tools package This
 change will prevent these tools from being installed if the image doesn't
 install bluez5-noinst-tools package.
In-Reply-To: <20250330023624.58070-2-gudni.m.g@gmail.com>
References: <20250330023624.58070-2-gudni.m.g@gmail.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <01010195e4fbab20-5b6692e8-ba12-4dec-b7ac-7e773fc33c8e-000000@us-west-2.amazonses.com>
Date: Sun, 30 Mar 2025 02:57:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.30-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 02:57:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213914

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

