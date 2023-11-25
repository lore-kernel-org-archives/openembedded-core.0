Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D61CC61DF4
	for <webhook@archiver.kernel.org>; Sat, 25 Nov 2023 12:18:53 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.24250.1700914731662550231
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Nov 2023 04:18:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hH0Qvyhe;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=K4mHuVrX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018c066b0fda-2e65f0bb-3f0a-47b7-a744-8ac8acbfda54-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700914729; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date;
	bh=KWhxroiJJoeoqpvynYtMmvAL/4733YeeIo5LgCAKjhw=;
	b=hH0Qvyhe7bp8AU9gvrwSQ38noqu2s7v3KJQOw63vIeOepGtqK3QRhG2q+wm8fSom
	M5rD1yt9Fb0nSEvuXYCzEM3nsBA7agcO/PP3l01BNt3ZovS/jUURzNYeiD/xAowgph4
	9q61PKBl+yMPrfo/hyt4qGxFPYPbaEL35wdP7P8M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700914729;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=KWhxroiJJoeoqpvynYtMmvAL/4733YeeIo5LgCAKjhw=;
	b=K4mHuVrXF76Lc9GSETQnzLGYnFcdFGzWboVIq9miumPKz0QTvS10UtuAMzo0pQD5
	MvPoCN6sMwAMicM1zQM+8aP8aZMR+qLTXcwEJ9LyM4KlQdO4kuUlofiYLc0QUgs43zw
	OfezJ8JLx5+thkAkSIl+K+a8SE7An7YsZ4Lq1pTI=
From: patchtest@automation.yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [oe-core][PATCHv2] bluez5: fix connection for ps5/dualshock
 controllers
In-Reply-To: 20231125121028.84257-1-f_l_k@t-online.de
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018c066b0fda-2e65f0bb-3f0a-47b7-a744-8ac8acbfda54-000000@us-west-2.amazonses.com>
Date: Sat, 25 Nov 2023 12:18:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.25-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Nov 2023 12:18:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191230

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

