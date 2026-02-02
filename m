Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41965E7DF16
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 17:16:20 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.58446.1770052578748320473
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 09:16:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=xaa5WNsV;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=b+0M9sD1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019c1f5aea7a-faa5859a-4e1d-424a-ae09-5c91153c5e92-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1770052578; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=K7QAncj05J3RhtMvklcV9Pqnri55hoP2cxwxbxI0n+Y=;
	b=xaa5WNsVyTfg7RKP3viaY6f0t10Gav87ZLin7qOd5AZGDbRFkkLxCx4J1ihRvXTp
	iW+82JYAX+puiBh3ZIUQpHXHSGEc6DgNsDAF8ErozzjhClbAHANemAmdbTRpjOdJ9Hr
	xncdCplTh3Xeoe4DPAUS+7xCLwkGeUBlCHh3mC7A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1770052578;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=K7QAncj05J3RhtMvklcV9Pqnri55hoP2cxwxbxI0n+Y=;
	b=b+0M9sD1d4i8lTIRuWumSa7wObUX3qrozZXSkEHnFMchU0SkodYcAGmbx5UgSr39
	DnEobgbbLYIISiyr9TI0wO7NY/MykNuicnlZMl2whi5YqPaKmBZ7yS2G5dtiyOeDeGp
	8vV9Q8QuKdVE59hWGG0dktYrhIldr9VJRISh57jM=
From: patchtest@automation.yoctoproject.org
To: Trevor Woerner <twoerner@gmail.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [RFC][PATCH v2 8/9] oe-selftest -r wic.Wic2 (non-runqemu) -> PASS
In-Reply-To: <20260202170800.4172778-9-twoerner@gmail.com>
References: <20260202170800.4172778-9-twoerner@gmail.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019c1f5aea7a-faa5859a-4e1d-424a-ae09-5c91153c5e92-000000@us-west-2.amazonses.com>
Date: Mon, 2 Feb 2026 17:16:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.02-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 17:16:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230395

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---

Testing patch /home/patchtest/share/mboxes/RFC-v2-8-9-oe-selftest--r-wic.Wic2-non-runqemu---PASS.patch

FAIL: test shortlog format: Commit shortlog (first line of commit message) should follow the format "<target>: <summary>" (test_mbox.TestMbox.test_shortlog_format)
PASS: pretest pylint (test_python_pylint.PyLint.pretest_pylint)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test pylint (test_python_pylint.PyLint.test_pylint)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
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

