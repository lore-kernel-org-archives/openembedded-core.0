Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF93CD98F2
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 12:31:00 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41962.1782131451584401786
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 05:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LtaxlAFK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pWrK/O8B;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019eef4fe2b4-ad5a82e6-6d54-4fb8-acfb-83b55554d3e3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782131450; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=qByMw1uC4ZZC3ChFkNUX8txzqDGl5zYQ6VISCbBolYw=;
	b=LtaxlAFK/76TNJNOZU2HetzX2AUqhN+z3G3SevXyHbfKbH0tUaxW/vZ9cLbUwdvx
	v34zcmMb7wggoK3azaM81HK5Xpfv7LhytHuQK+vwmQMjVBRzdIiy3ow69wiNdTtsvj7
	dg7dI30eAW7iSezQfa+XCZNnr4pb5qQ6wB+Mp3S4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782131450;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=qByMw1uC4ZZC3ChFkNUX8txzqDGl5zYQ6VISCbBolYw=;
	b=pWrK/O8BBUiBoTSYqConeA+E5vpvTXn5z8I9z2PIkFdE5DKed/sxnomieYC+5K3T
	ajneUUc9tIfVaiZU1fK8yi4RVi7IqJrioMOIgDpF6PhJDngxpiuXEzbybWx7heLuj0r
	a+p0ju7AJxYE9gdPmqYUEU3NvO4aiio64fPuwkLY=
From: patchtest@automation.yoctoproject.org
To: Hitendra Prajapati <hprajapati@mvista.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [scarthgap][PATCHv2] vim: Security fix for CVE-2026-28420 &
 CVE-2026-46483
In-Reply-To: <20260622122522.25851-1-hprajapati@mvista.com>
References: <20260622122522.25851-1-hprajapati@mvista.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019eef4fe2b4-ad5a82e6-6d54-4fb8-acfb-83b55554d3e3-000000@us-west-2.amazonses.com>
Date: Mon, 22 Jun 2026 12:30:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.22-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 12:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239284

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/scarthgap-PATCHv2-vim-Security-fix-for-CVE-2026-28420-CVE-2026-46483.patch

FAIL: test mbox format: Series has malformed diff lines. Create the series again using git-format-patch and ensure it applies using git am (test_mbox.TestMbox.test_mbox_format)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: Python-unidiff parse error (test_python_pylint.PyLint.pretest_pylint)
SKIP: test CVE tag format: Parse error Hunk is shorter than expected (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: Parse error Hunk is shorter than expected (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: Parse error Hunk is shorter than expected (test_patch.TestPatch.test_upstream_status_presence_format)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test pylint: Python-unidiff parse error (test_python_pylint.PyLint.test_pylint)
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

