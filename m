Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D304FE7718B
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 03:16:28 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.27370.1735010182147601067
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 19:16:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=L8kp76be;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=U/QWvNDO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010193f6aa6012-d78373e6-a1b7-4828-a150-9b6fde33cba2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1735010181; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=/97z8mIdT/umYxNku4vj/RbvVPjsEv0Z1r3dMo4/LoU=;
	b=L8kp76bee0ekrDnrvs2QEPqcbEff/SnwUDxLiJ3y4muCgHzbYWpdQuPBXTDwYlP6
	dXJcQfxkk61SQef5y7ULB+T18gtWFJQkZwUIBa3Canlcm0LZw5gUk1p4DpPn3mbh8vm
	/mdNc4cn1L+43iIclIw5U1chvKAPhHJ9/yfmFYoI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1735010181;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=/97z8mIdT/umYxNku4vj/RbvVPjsEv0Z1r3dMo4/LoU=;
	b=U/QWvNDO6I7g56d8s5qaHnL7y8BeMmYE74GxYDnKoPoH6cVlBsRcwovxM6we2bA1
	m3r0XJtvti53s5Q5Mf6dVuZGofO6FJ4b4NMbhmmJoMCEzVUv6nSR4bsED+DW+a/cDw8
	7m+lkTgUjI1zUkyqEvDdhXb9k0vGFVOCdNPfKY18=
From: patchtest@automation.yoctoproject.org
To: Qi.Chen@windriver.com
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][PATCH] lib32-64k-pagesize.inc: add conf file for easier
 building of 32bit binary with 64K alignment
In-Reply-To: <20241224025708.4192067-1-Qi.Chen@windriver.com>
References: <20241224025708.4192067-1-Qi.Chen@windriver.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <01010193f6aa6012-d78373e6-a1b7-4828-a150-9b6fde33cba2-000000@us-west-2.amazonses.com>
Date: Tue, 24 Dec 2024 03:16:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.24-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Dec 2024 03:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209057

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/lib32-64k-pagesize.inc-add-conf-file-for-easier-building-of-32bit-binary-with-64K-alignment.patch

FAIL: test shortlog length: Edit shortlog so that it is 90 characters or less (currently 92 characters) (test_mbox.TestMbox.test_shortlog_length)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
SKIP: pretest src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test CVE check ignore: No modified recipes or older target branch, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test lic files chksum modified not mentioned: No modified recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
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

