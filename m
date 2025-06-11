Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46281C71133
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 15:47:38 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.140.1749656848689541560
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jun 2025 08:47:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=EMCPEJJq;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=f9CmQ0U7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101975facc60e-aec107a7-9a0b-48a0-ad68-91e30142e767-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749656848; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=2KShLoQu9vJg3r9jRmhs9gQuQAPCURhgCXrnGb2yklU=;
	b=EMCPEJJqBpnv3nQuevb1SnBPLQ/Wc4q5Lw9bbiH3yKT7LiO0pjIXi9QfbYroWsD2
	hxgOOw9fgiL5AcNRouNUcyRQcsiHe58SEIEGt7MXSckWLOPKwnAI1ccrcxb/7BnJIZr
	SNkaH0/YDp5+JfFTd8ohbuLp6aOEwWKyujy3dLss=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749656848;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=2KShLoQu9vJg3r9jRmhs9gQuQAPCURhgCXrnGb2yklU=;
	b=f9CmQ0U7bsHAGVwevQjv0iJAj6cU0P19hl8GNiiWTE+UPHri6XbrUnmYGNN9H4mC
	XMiwIpqn1MfE5Uku47YzZM1O1b8gvvfHFmk3MbwWshcd7S93j7LuH9PfN8IfcmMjS+w
	XaWF3xrfAnD92xsBeXpXwFDH5ZlHY3HL9tAd+3Cw=
From: patchtest@automation.yoctoproject.org
To: Quentin Schulz <quentin.schulz@cherry.de>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for How to fix Panfrost support in mesa?
In-Reply-To: <c64ef50a-10d3-4fe0-8025-96defb817e53@cherry.de>
References: <c64ef50a-10d3-4fe0-8025-96defb817e53@cherry.de>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <010101975facc60e-aec107a7-9a0b-48a0-ad68-91e30142e767-000000@us-west-2.amazonses.com>
Date: Wed, 11 Jun 2025 15:47:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.11-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 15:47:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218462

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/How-to-fix-Panfrost-support-in-mesa.patch

FAIL: test Signed-off-by presence: Mbox is missing Signed-off-by. Add it manually or with "git commit --amend -s" (test_mbox.TestMbox.test_signed_off_by_presence)
FAIL: test commit message user tags: Mbox includes one or more GitHub-style username tags. Ensure that any "@" symbols are stripped out of usernames (test_mbox.TestMbox.test_commit_message_user_tags)
FAIL: test mbox format: Series has malformed diff lines. Create the series again using git-format-patch and ensure it applies using git am (test_mbox.TestMbox.test_mbox_format)
FAIL: test shortlog format: Commit shortlog (first line of commit message) should follow the format "<target>: <summary>" (test_mbox.TestMbox.test_shortlog_format)

PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: Python-unidiff parse error (test_python_pylint.PyLint.pretest_pylint)
SKIP: pretest src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test CVE check ignore: No modified recipes or older target branch, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
SKIP: test CVE tag format: Parse error Unexpected hunk found: @@ -173,12 +173,13 @@ GALLIUMDRIVERS:append = 
SKIP: test Signed-off-by presence: Parse error Unexpected hunk found: @@ -173,12 +173,13 @@ GALLIUMDRIVERS:append = 
SKIP: test Upstream-Status presence: Parse error Unexpected hunk found: @@ -173,12 +173,13 @@ GALLIUMDRIVERS:append = 
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

