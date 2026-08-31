Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 883BBC61DFD
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 09:19:48 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25688.1788167980536173355
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 02:19:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ET3XX1F/;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dha94p6Z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a0571e023f-27b599e5-7128-467b-a5f4-e4b679e11a99-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788167979; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=KWhxroiJJoeoqpvynYtMmvAL/4733YeeIo5LgCAKjhw=;
	b=ET3XX1F/fadYb6hcdC4CTZf4dhhLAi8g1Ds4JHv7bIVT8TWGHlAl6fF5iWCNXF4k
	R1aX+yJ7PVe4ItJyhZoUKFGF6WqeD7fekgi9Ahko4Fee2/Uprk/B7hQ6B/UWgjykiD+
	e59LRgyXTyJ4rNMByO1sWTMgocKohIlj+pT7cNI0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788167979;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=KWhxroiJJoeoqpvynYtMmvAL/4733YeeIo5LgCAKjhw=;
	b=dha94p6ZTsgTSSt7Xj8njpPgmyDatt7tI0NtvL6wAX6+y07rPiuhRR2oonxhMips
	oaRlSifvmr6QRsO/HW1u00mpm5rsrWNzt83nnQQeoXZTFVTPIlWL9pQpBPZ2XZvvdmR
	ruoQ6x//vEN7YP/Uel8DWzoOkUK0O8p3D0SydYp0=
From: patchtest@automation.yoctoproject.org
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH 3/9] appstream: upgrade 1.1.6 -> 1.2.0
In-Reply-To: 
 <20260831-mathieu-updates-2026-08-31-v1-3-58b54db72860@bootlin.com>
References: 
 <20260831-mathieu-updates-2026-08-31-v1-3-58b54db72860@bootlin.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <010101a0571e023f-27b599e5-7128-467b-a5f4-e4b679e11a99-000000@us-west-2.amazonses.com>
Date: Mon, 31 Aug 2026 09:19:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.31-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:19:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244755

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

