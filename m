Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B72C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 04:18:58 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.52388.1723090732911598458
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 21:18:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=YvBIAqsL;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=sHanqlJz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101913035feb0-4209b8ca-9841-4c68-acd9-4bc83b7cf599-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723090730; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=bZ0XnW05bu6cu20O0AltcZ4G9/I7ykgN7J3Sl1PFVtQ=;
	b=YvBIAqsLQv6O8f6+Z6csGYgsJIPRPv4lEuTBdNbTWa7gneaUPyg6iHF4Y64XSLAq
	fqRvGbeFkCmCsizpi7Fn07swVzoK5EZHPxbDvfBPerOqNHqntt920vj2cl1tFHpmSdZ
	TQs9yi5JgeGC5QkIH0YepR3dPTMLrT64UKmsdm/M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723090730;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=bZ0XnW05bu6cu20O0AltcZ4G9/I7ykgN7J3Sl1PFVtQ=;
	b=sHanqlJzSn2UF/7KtFoi4Iwm2ogTzcz8r6/NbQTbKUBnhsC8IzHfJYZFP117k2Ak
	DqKJ65L2/S4exLJR8ZnsBYRCFLx81CDismXJpKo6T1/63S8l701Cij+Kg/lxukm3Hf3
	Jg3Kwck4gFSwmW5AMdAIlrVX6jOHLBrpXzbXL7nI=
From: patchtest@automation.yoctoproject.org
To: robert.joslyn@redrectangle.org
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH v2] curl: Update to 8.9.1
In-Reply-To: <20240808040726.1461912-1-robert.joslyn@redrectangle.org>
References: <20240808040726.1461912-1-robert.joslyn@redrectangle.org>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <010101913035feb0-4209b8ca-9841-4c68-acd9-4bc83b7cf599-000000@us-west-2.amazonses.com>
Date: Thu, 8 Aug 2024 04:18:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.08-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 04:18:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203112

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/v2-curl-Update-to-8.9.1.patch

FAIL: test CVE tag format: Missing or incorrectly formatted CVE tag in patch file. Correct or include the CVE tag in the patch with format: "CVE: CVE-YYYY-XXXX" (test_patch.TestPatch.test_cve_tag_format)

PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_status_presence_format)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test lic files chksum modified not mentioned (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test src uri left files (test_metadata.TestMetadata.test_src_uri_left_files)

SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
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

