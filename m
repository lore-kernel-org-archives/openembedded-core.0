Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5B59D5808D
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:01:53 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.17093.1732536108445944993
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=FSloSbrX;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Eayzk+uM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010193633301b7-c26dabb2-8f01-49fe-9b9f-7a1dc8b7a8ab-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1732536107; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=wNDKS6pDed7qGhbLT73zGkdfamENA6j4yC7K2Nwwhf8=;
	b=FSloSbrXaQj8xEaGI07LsqIzSy/RUMEFonet+pdCjPU58aq7jIWbGOBE4qtBSC4Z
	2/F2Po3TCdwaTyfwX56ECaoe4OHlzkkTyFJVquTiC1+E1pXjj279BDUrK1N0zXxmd9z
	/Akxq/d6RVwjR8/xxjf5b4zcKUhXFLc/3Tu4g0SY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1732536107;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=wNDKS6pDed7qGhbLT73zGkdfamENA6j4yC7K2Nwwhf8=;
	b=Eayzk+uMLG0SA81vij6UvKnQgewp/U3xhOs7FdSXzvHwSmAyoXgpHsHZhPPFNKd+
	gtZF7hYmX2u63XDBehn9xjcb8+do73GFIa1Zr72ISo37YOGVj0Zl5Qq7nf+U4V4wd3j
	2H/5c4Iz4+C/stb/eAWkFaF4mUe1qT/zd8Qx0mp4=
From: patchtest@automation.yoctoproject.org
To: Denis OSTERLAND-HEIM <denis.osterland@diehl.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH 2/3] spdx: add support for WITH operator
In-Reply-To: <b4f524ba554e48738c2307d44b8304ae@diehl.com>
References: <b4f524ba554e48738c2307d44b8304ae@diehl.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <01010193633301b7-c26dabb2-8f01-49fe-9b9f-7a1dc8b7a8ab-000000@us-west-2.amazonses.com>
Date: Mon, 25 Nov 2024 12:01:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.25-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:01:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207769

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/2-3-spdx-add-support-for-WITH-operator.patch

FAIL: test mbox format: Series has malformed diff lines. Create the series again using git-format-patch and ensure it applies using git am (test_mbox.TestMbox.test_mbox_format)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: Python-unidiff parse error (test_python_pylint.PyLint.pretest_pylint)
SKIP: pretest src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test CVE check ignore: No modified recipes or older target branch, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
SKIP: test CVE tag format: Parse error Hunk diff line expected: license_data):
SKIP: test Signed-off-by presence: Parse error Hunk diff line expected: license_data):
SKIP: test Upstream-Status presence: Parse error Hunk diff line expected: license_data):
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test lic files chksum modified not mentioned: No modified recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
SKIP: test pylint: Python-unidiff parse error (test_python_pylint.PyLint.test_pylint)
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
SKIP: test src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.test_src_uri_left_files)
SKIP: test summary presence: No added recipes, skipping test (test_metadata.TestMetadata.test_summary_presence)

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

