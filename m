Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61B71CA5FD7
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 18:01:38 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12740.1768932096669710133
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 10:01:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=tprsRvXr;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=GJerBdPl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019bdc91b5ae-7d40dbdb-f61e-4af3-8b15-6b80cae532ff-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768932095; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=BQmx/NiNLFcP0DFYkN17VNAFbg9BlV/bV9kxFp5oKRE=;
	b=tprsRvXrJBQS91sbjvLk0LAVoDApYOessNmuGyYvMY/9RpN7zKaPLHJcFqahpTZD
	1UQuzdd3pUd1lMOFZrZmlKolLvqJTQMK494nWbyczOKFmZGq9drlJGVdWQG/9lPxhUv
	5xRaGbG0J+3eKL3Vhg5E82jGoztAPnXXBMq4njFE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768932095;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=BQmx/NiNLFcP0DFYkN17VNAFbg9BlV/bV9kxFp5oKRE=;
	b=GJerBdPlE+AGthTbC+ix33kr5Y/jdXcsraM5R1kSGW/FQriIx9AcQhUfouDgHFTU
	77DjxLQHINZ8ikPDZ8daC2KBED1kQsT92K+YX3WyfQdbAcpujllMVUbVMpBO6K6h+/B
	WSYh0YzTxHkx7GnAqtVdVCRIIj+yj9IlW2it60EY=
From: patchtest@automation.yoctoproject.org
To: Harish.Sadineni@windriver.com
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH v3 02/16] rust: Install the Rust source
In-Reply-To: <20260120175246.2052341-3-Harish.Sadineni@windriver.com>
References: <20260120175246.2052341-3-Harish.Sadineni@windriver.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019bdc91b5ae-7d40dbdb-f61e-4af3-8b15-6b80cae532ff-000000@us-west-2.amazonses.com>
Date: Tue, 20 Jan 2026 18:01:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.20-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 18:01:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229766

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/v3-02-16-rust-Install-the-Rust-source.patch

FAIL: test Signed-off-by presence: A patch file has been added without a Signed-off-by tag: '0001-bootstrap-Ensure-host-documentation-is-built-before-.patch' (test_patch.TestPatch.test_signed_off_by_presence)

PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
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

