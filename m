Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7371C3DA49
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 16:40:40 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.65815.1722012036127737470
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 09:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=YYuQ6C8e;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=H/Y8VeDK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010190efea6837-5a935a53-553d-4dbc-ab98-fd10c110873a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722012035; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=OzMRWsMDHwCFaRPxgY6pjDyfzqlpB/adPOLcd2O1lyM=;
	b=YYuQ6C8eXiNBDXjFnLOT7OoTx7Y6zIAQbGgzyNHci8P4ZmvCqpubAG2Lawxvq0lh
	2wjz9A+roZVQuz3E91KD7jw1e2GkClim1E69D5okB+ifxHRwnV4Kczji2893ZqAtYCy
	PK3w4E/2+rG2hR6AzvstQo1QLjMAMuUBUT8VhxYw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722012035;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=OzMRWsMDHwCFaRPxgY6pjDyfzqlpB/adPOLcd2O1lyM=;
	b=H/Y8VeDK8W/LcMs0eQcqHNLlIHBKYfAMC8DdY5q2W2PzvCLUmaSO7Kf8/Sn3zbm6
	WFuknBSw30f9GjJpxIUbWUjukt1PoQZGj+kuAjY1l1mrsIHzQ7WKMl4pzURgGYEZaXu
	MOoHS/QxrH6VGPdGAGtg7VlTL8AQ/dFaXrN1Qys4=
From: patchtest@automation.yoctoproject.org
To: Mark Hatle <mark.hatle@kernel.crashing.org>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [scarthgap][PATCH 5/8] create-spdx-3.0/populate_sdk_base: Add
 SDK_CLASSES inherit mechanism to fix tarball SPDX manifests
In-Reply-To: <1722010958-23635-5-git-send-email-mark.hatle@kernel.crashing.org>
References: <1722010958-23635-5-git-send-email-mark.hatle@kernel.crashing.org>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <01010190efea6837-5a935a53-553d-4dbc-ab98-fd10c110873a-000000@us-west-2.amazonses.com>
Date: Fri, 26 Jul 2024 16:40:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.26-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 16:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202559

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/scarthgap-5-8-create-spdx-3.0-populate_sdk_base-Add-SDK_CLASSES-inherit-mechanism-to-fix-tarball-SPDX-manifests.patch

FAIL: test shortlog length: Edit shortlog so that it is 90 characters or less (currently 110 characters) (test_mbox.TestMbox.test_shortlog_length)

PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test lic files chksum modified not mentioned (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
SKIP: pretest src uri left files: Patch cannot be merged (test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
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

