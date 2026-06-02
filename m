Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2DB5CD6E57
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 14:31:17 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26868.1780410667556082930
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 07:31:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=jNkk+va0;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=sq288c3T;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019e88becede-f0a2c704-f5ca-4418-a4ed-bef0600f9826-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780410666; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=8/fMxUQUpTlozdIrKMWCzwcVzrWhj93Wlqy7RUico2s=;
	b=jNkk+va0zRVGLSZ/5exnCNOkzqS7QvqOS/LtLfzZ6GxjSjopbEquw2HUQ2+2/mYM
	NBpurLKlJL2/NiFtp9BdumRLjgkcIuYesd52FTSqyfFLUyJyruUQKI9xlB8czQCsvCG
	8dAucoomK78wc96Q4/zCFcz5dNxGw20yRiuh0e7g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780410666;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=8/fMxUQUpTlozdIrKMWCzwcVzrWhj93Wlqy7RUico2s=;
	b=sq288c3T4SxnsBOFDEXLBGL0N+tB7tzFJLAnOfVNdQZjX2dMxLWte/knFG2EAHgZ
	9uMxQdX7q5BSXZSF17z3VDZUHaFMKd090qoEPykHqmtsCpQ9VL4cp4FidJdO6huXOB1
	yFy8PD9TymNBiRbr3RUiZvoxDkZykFeNXbwT0en8=
From: patchtest@automation.yoctoproject.org
To: Robin Lintermann <rl@karo-electronics.de>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [scarthgap][PATCH 4/5] alsa-utils: add runtime dependency on ncurses
 for 'alsamixer'
In-Reply-To: <20260602142132.976138-4-rl@karo-electronics.de>
References: <20260602142132.976138-4-rl@karo-electronics.de>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019e88becede-f0a2c704-f5ca-4418-a4ed-bef0600f9826-000000@us-west-2.amazonses.com>
Date: Tue, 2 Jun 2026 14:31:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 14:31:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238056

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/scarthgap-4-5-alsa-utils-add-runtime-dependency-on-ncurses-for-alsamixer.patch

FAIL: test commit message presence: Please include a commit message on your patch explaining the change (test_mbox.TestMbox.test_commit_message_presence)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)

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

