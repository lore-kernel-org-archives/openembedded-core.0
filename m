Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A54E77188
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 22:46:51 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.93778.1734475608392997057
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 14:46:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=JM5sNd8t;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=wpVlVXd7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010193d6cd6de8-787dc88a-6371-4427-ab6f-e6ea34b2544d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1734475607; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=oU/FrPCyHyZxoVOSQ3wCHoYrgnSDK06JTSUsTjTUPoA=;
	b=JM5sNd8t+8GolLQv/yoJTO14xEXK40m1iWYCYLp0ybZXRQXAuQ/hQgGIvXYARg+l
	elfzpXn35fObq2W+cOOkbRqgyagVFt50R53FwqiPlTyxHyvxkzAwSXrXsCCv3rIy29S
	cbQGlb9yT0S3L+gnZlm6IAkmCgsFrz8IAW5GAx9g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1734475607;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=oU/FrPCyHyZxoVOSQ3wCHoYrgnSDK06JTSUsTjTUPoA=;
	b=wpVlVXd7CffTNXHZiudH493Wy9xFzRJUeJSwH5r7cY0Q6JUGfCq7kl+HpGh3AG9U
	oYuV+8dWhNeW2bNcCzPdA7jMBfquel7+3WfMBm/XlgW51I6kiJa/sDe8pAVkHxXLB4o
	AnbHns/XMGkidmXR980pyjHoggZYhhlkCk2M2kOQ=
From: patchtest@automation.yoctoproject.org
To: Derek Straka <derek@asterius.io>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][PATCH 1/2] classes/ptest-python-pytest: add a new class to
 consolidate ptest functionality for python pytest based tests
In-Reply-To: <20241217223605.3383795-1-derek@asterius.io>
References: <20241217223605.3383795-1-derek@asterius.io>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <01010193d6cd6de8-787dc88a-6371-4427-ab6f-e6ea34b2544d-000000@us-west-2.amazonses.com>
Date: Tue, 17 Dec 2024 22:46:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.17-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 22:46:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208861

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/1-2-classes-ptest-python-pytest-add-a-new-class-to-consolidate-ptest-functionality-for-python-pytest-based-tests.patch

FAIL: test shortlog length: Edit shortlog so that it is 90 characters or less (currently 109 characters) (test_mbox.TestMbox.test_shortlog_length)

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

