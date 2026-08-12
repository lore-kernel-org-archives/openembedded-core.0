Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E7BC5AD5A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 07:48:25 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2938.1786520897330871144
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 00:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KGzeW7kL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=vpJDwQEk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019ff4f1821b-b4843f35-b594-4213-8e92-ac114506db4d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786520896; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=dUPCZS6xyLLLKb9GtpttxxU6YDYx9v0CaGYtj0xd52M=;
	b=KGzeW7kLKBcJBYKryuwE9+ab2js3BbK95CX3pGNjjE/XCFdJ5JdG+1OZ5v1S/r8J
	hyPSRQJAfdosEAKUTitwtojCwGxA1SZl722rxMFuYyJFPW1HnnUrvoBrOZCOjjWkJQe
	Vww9bHy1Cd3cOYXl5uUogp7+UWecYDwrt66FUNeo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786520896;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=dUPCZS6xyLLLKb9GtpttxxU6YDYx9v0CaGYtj0xd52M=;
	b=vpJDwQEkw65P2oh3IbCqdC0ssH3Cc175RwHZguQXpevBXjfXSrnUyVKkkn4kZ6a/
	EIjkS+1fidjE3qO504OxqplAmOwRJxsQ/3+D4B83Scs219DmknuUwCZNo0myfhKc2uu
	U53/4REM8Af52+WNXCFYpH3/Hr4knAKgG5Qx6n1I=
From: patchtest@automation.yoctoproject.org
To: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [scarthgap][PATCH 1/4] binutils: fix CVE-2025-1147
In-Reply-To: <20260812072822.22227-2-jaipaul.cheernam@est.tech>
References: <20260812072822.22227-2-jaipaul.cheernam@est.tech>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019ff4f1821b-b4843f35-b594-4213-8e92-ac114506db4d-000000@us-west-2.amazonses.com>
Date: Wed, 12 Aug 2026 07:48:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.12-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 07:48:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243255

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/scarthgap-1-4-binutils-fix-CVE-2025-1147.patch

FAIL: test Upstream-Status presence: Upstream-Status is present only after the patch scissors. It must be placed in the patch header before the scissors line. (test_patch.TestPatch.test_upstream_status_presence_format)

PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
PASS: test auh changelog truncation notice (test_mbox.TestMbox.test_auh_changelog_truncation_notice)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
SKIP: pretest src uri left files: Patch cannot be merged (test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test CVE check ignore: No modified recipes or older target branch, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test lic files chksum modified not mentioned: No modified recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
SKIP: test src uri left files: Patch cannot be merged (test_metadata.TestMetadata.test_src_uri_left_files)
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

