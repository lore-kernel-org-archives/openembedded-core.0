Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E319CC6B00
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 07:00:56 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10276.1775113248090866360
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 00:00:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QcRr0E02;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=A2ZaEbI5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019d4cfe99d3-1d747288-4f88-4752-b1c6-4c6c41072e10-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775113247; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=pTjza9K1AQAXc6AtKBgU4gRhw1vYdTuaCSc2a29n5LI=;
	b=QcRr0E02m1S7Uo7efGXGh5IyH90vSieQ7A/JVi5XEQCJdF3DXk2FZ7AWqTSPmevz
	+k2KtJJRCIiT0mxMNDwnYDYUBvhgxQALMrzeCKWZClG3g6GG4x7xxOzh0v4AvHhfKaq
	aSUs5WCLrpFaO0oqRnKqc3gfcAu4NvU4bQqW5xoY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775113247;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=pTjza9K1AQAXc6AtKBgU4gRhw1vYdTuaCSc2a29n5LI=;
	b=A2ZaEbI5aHQKUeg1gkg4Sp6C0Bw6SCDG11RkzMAWUfqNxmaHbCo7YrYTej7zEi9M
	FQGAwEK1Es8n/+7VTKmNzP0V0065s72UM8l/O+srTzyxK7V7zFd6p0N3E5RJ2TOdgDn
	nhr2s2MMyrkqj5LoAYyRgJa7wqNaqdjNeg5qvZCg=
From: patchtest@automation.yoctoproject.org
To: Hemanth.KumarMD@windriver.com
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [scarthgap][PATCH] unfs3: Fix race issue causing a glibc test hang
In-Reply-To: <20260402064443.1506368-1-Hemanth.KumarMD@windriver.com>
References: <20260402064443.1506368-1-Hemanth.KumarMD@windriver.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019d4cfe99d3-1d747288-4f88-4752-b1c6-4c6c41072e10-000000@us-west-2.amazonses.com>
Date: Thu, 2 Apr 2026 07:00:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 07:00:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234494

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/scarthgap-unfs3-Fix-race-issue-causing-a-glibc-test-hang.patch

FAIL: test Signed-off-by presence: A patch file has been added without a Signed-off-by tag: 'fixrace.patch' (test_patch.TestPatch.test_signed_off_by_presence)

PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_status_presence_format)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test bugzilla entry format (test_mbox.TestMbox.test_bugzilla_entry_format)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
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

