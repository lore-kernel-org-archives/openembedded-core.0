Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D1A4C2BB3F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 21:35:55 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.13780.1700516153753418242
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 13:35:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=atI28mpe;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dpYKIf0X;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018beea945fb-286e1f16-1599-4b9c-a409-b1a4d2240e1a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700516153; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date;
	bh=dpgP2B4fcU8Vg3nQG1n6GzCHB7yOASPM/T+RXCzihd0=;
	b=atI28mpemwMK90gcdqaq7UI44rr0NUQFPgPRX5yajxs2vuveGdoR/cp80M9lC4hW
	r1XJdLH3bMRXvsd2uRdB6VE2M5EDcS7GplIhQm+CNlPywuidCdWXOPrN7AJG+yHEQ4b
	T5G+YB+Jom/Dp8FdWwe0xoeo9ee0apU9cl/DmmvA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700516153;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=dpgP2B4fcU8Vg3nQG1n6GzCHB7yOASPM/T+RXCzihd0=;
	b=dpYKIf0XRxBCLJb2TKaSN/QoMJckw0xnF0nVfi4CxU/eitlNXtcZbDhy4QxXbDcT
	ksR/AVuKEuLSFWmL0ByzSjgIWJGCSq/REbFqxFNK44GHq68tWZyBMajYImuMLJoA/HD
	TGxFnXClKZBBn2X+HyXL0p4m/8t46/ns6P9DAmVI=
From: patchtest@automation.yoctoproject.org
To: Stefan Ghinea <stefan.ghinea@windriver.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core] [hardknott] [PATCH 2/2] nfs-utils: add krb5 PACKAGECONFIG
 to allow building with gss and svcgss
In-Reply-To: 20231120212436.27604-2-stefan.ghinea@windriver.com
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018beea945fb-286e1f16-1599-4b9c-a409-b1a4d2240e1a-000000@us-west-2.amazonses.com>
Date: Mon, 20 Nov 2023 21:35:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.20-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 21:35:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190935

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/hardknott-2-2-nfs-utils-add-krb5-PACKAGECONFIG-to-allow-building-with-gss-and-svcgss.patch

FAIL: test shortlog length: Edit shortlog so that it is 90 characters or less (currently 95 characters) (test_mbox.TestMbox.test_shortlog_length)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)

SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
SKIP: test target mailing list: Series merged, no reason to check other mailing lists (test_mbox.TestMbox.test_target_mailing_list)

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

