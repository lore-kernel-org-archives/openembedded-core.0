Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F87AC43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 07:31:01 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32523.1782718251209047688
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 00:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=kuOBJlOF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=x03UQV4U;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019f1249bd47-65e9429b-26fc-423b-b653-a3a7dd218aac-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782718250; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=NjdgJltFnwTSuML7FkLgcWTD4bNfgrEXDt49Yc2zGUg=;
	b=kuOBJlOF46UekmTI9y8f77zv9A0w6fjwGfZyMPIVsgE5iISL0t4gxEmo5JyJRnpB
	ddEsedzps/RnsM106IMQVo7FLU5t3RD1Vfr2ougif0HfYULspPM7wNnDEmgydjqtHP2
	K3Gds/I0v2muApNCYUaDqosp6TWIcJQut7Abggpc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782718250;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=NjdgJltFnwTSuML7FkLgcWTD4bNfgrEXDt49Yc2zGUg=;
	b=x03UQV4UjpzyPcrsAsmGWbwK8VoCMt+0b6k8eajtE0b6laGLX5bMVDUTiF6YQJyO
	okLzPsm8+OcYN6b5b/I3caI5E9MhXtSQ4S7UoD4GveexN3i9c6yiXu3Ke6YqQkCXX95
	x1HSZre60nnIFXt1tvNj6OFXYUlK12Cs/QmxyuOc=
From: patchtest@automation.yoctoproject.org
To: Vijay Anusuri <vanusuri@mvista.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][wrynose][patch] gnutls: upgrade 3.8.12 -> 3.8.13
In-Reply-To: <20260629071648.1471849-1-vanusuri@mvista.com>
References: <20260629071648.1471849-1-vanusuri@mvista.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019f1249bd47-65e9429b-26fc-423b-b653-a3a7dd218aac-000000@us-west-2.amazonses.com>
Date: Mon, 29 Jun 2026 07:30:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.29-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 07:31:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239731

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/wrynose-gnutls-upgrade-3.8.12---3.8.13.patch

FAIL: test CVE tag format: Missing or incorrectly formatted CVE tag in patch file. Correct or include the CVE tag in the patch with format: "CVE: CVE-YYYY-XXXX" (test_patch.TestPatch.test_cve_tag_format)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_status_presence_format)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
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

