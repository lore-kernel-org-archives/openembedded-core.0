Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9385C30653
	for <webhook@archiver.kernel.org>; Sun,  7 Jul 2024 14:33:11 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.58770.1720362790047319000
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Jul 2024 07:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=C6O0qDOF;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=EbnflEXK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101908d9ce8fe-c252757e-4e6a-4f3d-a50c-b8bac03aec82-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1720362789; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=dNolBIYhljmqFD6Zf9E8oa4E/RbctYVcwqqPoNKOOa8=;
	b=C6O0qDOFPI2JUZBAGeRokDbxTzEo+oiHDJ0cPr1bdkvbwKkqH/I6Ogs4GQBenwsS
	DF8UEUVozlKUxd97NldHwKkBl8gTB1VBflKNn64ciAwSW3ja/Q4zHSmsmNjMEchYWpp
	/AkWvlAii9L8wxAseBPoRwc/WtEZJpOWuFYsy3J0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1720362789;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=dNolBIYhljmqFD6Zf9E8oa4E/RbctYVcwqqPoNKOOa8=;
	b=EbnflEXK+etxfC/SZ98L3vw+C5fTiCrt4SpSVAbLj9VWl7tojK4uXI6sG4g7y8iN
	8SfIlTrdcmPpm8h/xm62keRysnn4ILAxiqv1uLxAe0EqaESxaU58f5nRkpmdpHtVmjI
	HbVEuOZkuTbdpiSLxFKwQJ/esgjZnqnzZN0nintU=
From: patchtest@automation.yoctoproject.org
To: egyszeregy@freemail.hu
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH] mc: fix source URL
In-Reply-To: <20240707142910.1620-1-egyszeregy@freemail.hu>
References: <20240707142910.1620-1-egyszeregy@freemail.hu>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <010101908d9ce8fe-c252757e-4e6a-4f3d-a50c-b8bac03aec82-000000@us-west-2.amazonses.com>
Date: Sun, 7 Jul 2024 14:33:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.07-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Jul 2024 14:33:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201626

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/mc-fix-source-URL.patch

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
SKIP: test CVE check ignore: No modified recipes or older target branch, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
SKIP: test CVE tag format: Parse error Target without source: +++ b/meta/recipes-extended/mc/mc_4.8.31.bb
SKIP: test Signed-off-by presence: Parse error Target without source: +++ b/meta/recipes-extended/mc/mc_4.8.31.bb
SKIP: test Upstream-Status presence: Parse error Target without source: +++ b/meta/recipes-extended/mc/mc_4.8.31.bb
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

