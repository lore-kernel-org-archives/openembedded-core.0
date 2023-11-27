Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C91C4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 13:33:39 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.94528.1701092013962673247
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 05:33:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TCJUiYmG;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=V1KKzUJB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018c10fc33e6-6df3ff32-13c7-48ff-aac3-24978e69be2a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701092013; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date;
	bh=KWhxroiJJoeoqpvynYtMmvAL/4733YeeIo5LgCAKjhw=;
	b=TCJUiYmGwYbiG2ylbcI2bMIam2TE9u4HXpqjEYEmMHCOt/Rgg6Ai8Gg0zoO7lr/9
	2AbDyj/fMb2ggphMV024837K0SBt/jEVGIgK2ssxPElfMxj1a6hl/k4VfPmz7NfDnD4
	6qvMGy+wBcm/RFm9cL49Buxf7bfQT86fTnotMgq0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701092013;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=KWhxroiJJoeoqpvynYtMmvAL/4733YeeIo5LgCAKjhw=;
	b=V1KKzUJBJM0pThb8QjmDM4K6fFXIZFcXm6O5MVEFEjwd+dRC66GMN8eF8VOGgfAK
	1pwcNz8rracQhoewKhBP7Oi0zEDpsH3Jt4LDvYIiP5aipvJqvcy5nnKLi7ETSGPPq7n
	J89SrMXKOM1lxyXLyH5K4KUiyVNNR+1ujGlHw2Mk=
From: patchtest@automation.yoctoproject.org
To: Viswanath Kraleti <quic_vkraleti@quicinc.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH v2] systemd-boot: fix build issues on armv7a-linux
In-Reply-To: 20231127131927.710690-2-quic_vkraleti@quicinc.com
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018c10fc33e6-6df3ff32-13c7-48ff-aac3-24978e69be2a-000000@us-west-2.amazonses.com>
Date: Mon, 27 Nov 2023 13:33:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.27-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 13:33:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191301

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

