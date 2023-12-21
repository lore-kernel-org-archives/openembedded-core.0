Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 549C8C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 22:02:41 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.6087.1703196155819922664
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 14:02:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RCkf1z7W;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=goP/CHWg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018c8e66dbd2-3a37e68d-4e4c-4ca4-b31d-50768751c42d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1703196154; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date;
	bh=Yt3Pt+jcuSZLrBlI/9AiNKewMsOTnMbiGdRu18AXyeE=;
	b=RCkf1z7WbyLLriewQ0x/L3Bes+emEQjd+rpYF/XL3BYeheZL1Mz4qC1YOgGEQS2U
	JdUXSUJ/jMTN7FKQdCWpmEqHS9V25SSP/QTe6O2eNWMI9q/w/ZnqRbpFzBlkElptbJ3
	dOHrO6AZ+fIKEOZDpofStgRtVizdekFQB8KMRwe0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1703196154;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=Yt3Pt+jcuSZLrBlI/9AiNKewMsOTnMbiGdRu18AXyeE=;
	b=goP/CHWgWHL0EmZd0KtdJtUdokI1IEhdce53qav41THNMWJe/u54RLY5EXSR2brP
	TeogO/BlXrsRPkDi8TRTk/2LaGxdGnzPtzqzGIJK8raoulcm8XkA9hVOLjzkI4kY5bq
	sLQZJqTVdI1Lq3cf4PYfvRiMkcfKLAJG9lyiKc70=
From: patchtest@automation.yoctoproject.org
To: Etienne Cordonnier <ecordonnier@snap.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][PATCH v5] kernel.bbclass: make do_symlink_kernelsrc
 reentrant
In-Reply-To: CAHUKmYaFA8_eHrSCqknXqDfPfkwySdjqxWKvo6thuAAmD4guNw@mail.gmail.com
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018c8e66dbd2-3a37e68d-4e4c-4ca4-b31d-50768751c42d-000000@us-west-2.amazonses.com>
Date: Thu, 21 Dec 2023 22:02:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.21-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 22:02:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192853

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/v5-kernel.bbclass-make-do_symlink_kernelsrc-reentrant.patch

FAIL: test mbox format: Series has malformed diff lines. Create the series again using git-format-patch and ensure it applies using git am (test_mbox.TestMbox.test_mbox_format)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: Python-unidiff parse error (test_python_pylint.PyLint.pretest_pylint)
SKIP: pretest src uri left files: Patch cannot be merged (test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test CVE tag format: Parse error Hunk diff line expected: use s as
SKIP: test Signed-off-by presence: Parse error Hunk diff line expected: use s as
SKIP: test Upstream-Status presence: Parse error Hunk diff line expected: use s as
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test lic files chksum modified not mentioned: No modified recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
SKIP: test pylint: Python-unidiff parse error (test_python_pylint.PyLint.test_pylint)
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

