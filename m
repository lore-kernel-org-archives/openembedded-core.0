Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65BCDCD3427
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 07:49:07 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.33787.1725263338788047954
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 00:48:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=aTg+iLBe;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=WgA2/3/Y;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010191b1b559bb-c7fe810c-0b11-4dd9-9a7d-e51cc5d32ab2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725263338; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=Ku8fRikDWjUdEL4t4VtN8AdlunWZyIRfF4ydvuXcrWU=;
	b=aTg+iLBejxI3TGQY6inx4wqRnxCBmehundVuld644IO/ipObStkl+ZjFfgNvxsae
	qKxqI6P9D4ZBJfgO7SKR0w26KVijZJCGWrInlJfk6Hl95Pn6RHZQtzsJXOmw1tRks05
	QFeZqEV0Wvjt42CzGjPlC2ORjZ0YY5b19xcA/Gcc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725263338;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=Ku8fRikDWjUdEL4t4VtN8AdlunWZyIRfF4ydvuXcrWU=;
	b=WgA2/3/YutJMQo4JhmEZs2SVdjKPzRwTd2VLEa/MRKfcoipln0FuxA2qdqtvfvgF
	gMSEzMy1+6QMLfTRNLzJLTvh/GRMC1e8Q8sfFJ8X5sKd/rqZjwqNnIYJdlUE0FQc4bb
	ZVsDrm1eIO+xs6esYR6u2JghhWhHa2JVXxE++IgY=
From: patchtest@automation.yoctoproject.org
To: Deepthi.Hemraj@windriver.com
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH] gcc-sanitizers: Add ptest support for AddressSanitizer tests
In-Reply-To: <20240902073918.490722-1-Deepthi.Hemraj@windriver.com>
References: <20240902073918.490722-1-Deepthi.Hemraj@windriver.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <01010191b1b559bb-c7fe810c-0b11-4dd9-9a7d-e51cc5d32ab2-000000@us-west-2.amazonses.com>
Date: Mon, 2 Sep 2024 07:48:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 07:49:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204061

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/gcc-sanitizers-Add-ptest-support-for-AddressSanitizer-tests.patch

FAIL: test Signed-off-by presence: A patch file has been added without a Signed-off-by tag: 'asan-exp.patch' (test_patch.TestPatch.test_signed_off_by_presence)

PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_status_presence_format)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test bugzilla entry format (test_mbox.TestMbox.test_bugzilla_entry_format)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)

SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
SKIP: pretest src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test CVE check ignore: No modified recipes or older target branch, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
SKIP: test lic files chksum modified not mentioned: No modified recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
SKIP: test src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.test_src_uri_left_files)
SKIP: test summary presence: No added recipes, skipping test (test_metadata.TestMetadata.test_summary_presence)
SKIP: test target mailing list: Series merged, no reason to check other mailing lists (test_mbox.TestMbox.test_target_mailing_list)

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

