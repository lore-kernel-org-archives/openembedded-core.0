Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63D64C4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 11:05:28 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.4264.1707735922739806429
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 03:05:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RQdPDc03;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=YSYmwV4H;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018d9cfe33f3-071841ed-eff0-457a-bca8-69a685277485-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1707735921; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date;
	bh=lGs8oaXMJGfZYMemSVxyDBC47XW5aS9NQKBuMv4by1w=;
	b=RQdPDc03/t7iLx9ZGCorxxoHmERS1N6ABxZdZlORkpeVcJgjjuaSwBz+M7niLPj6
	7VKClvkfUFFn+HqNG6zUfK25HRnG+FoLlDeTxILPg2beNFlltmZDy1P0lXFSPG1Fl/E
	U3vuZNtm6HiwmHBwBwKgIa/nDzV1snu8uUp3XPG8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1707735921;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=lGs8oaXMJGfZYMemSVxyDBC47XW5aS9NQKBuMv4by1w=;
	b=YSYmwV4H50rOUrZHZQlVaGmISTP+511wk+vbQMx/1Acr5O8clBhIpwiD5KTvTJOx
	VTGLA0Q8HQoR1TiayhtsbvVzSkqhKZ1OFXxlQaGNnKZCoQyVuvXveO65tVyYZy7dyBC
	HB6tdw5o9xHojsRfi9HLdd62SxbOnLyQ7kxyzr+k=
From: patchtest@automation.yoctoproject.org
To: Poonam Jadhav <ppjadhav456@gmail.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][kirkstone][PATCH 2/3] scsi-disk: ensure block size is
 non-zero and changes limited to bits 8-15
In-Reply-To: 20240212104647.376386-2-ppjadhav456@gmail.com
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018d9cfe33f3-071841ed-eff0-457a-bca8-69a685277485-000000@us-west-2.amazonses.com>
Date: Mon, 12 Feb 2024 11:05:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.12-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 11:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195311

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/kirkstone-2-3-scsi-disk-ensure-block-size-is-non-zero-and-changes-limited-to-bits-8-15.patch

FAIL: test shortlog length: Edit shortlog so that it is 90 characters or less (currently 96 characters) (test_mbox.TestMbox.test_shortlog_length)

PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_status_presence_format)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
SKIP: pretest src uri left files: Patch cannot be merged (test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test CVE check ignore: No modified recipes, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
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

