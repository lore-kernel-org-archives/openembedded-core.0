Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29637C48286
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 20:15:53 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.5894.1706818552615812540
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 12:15:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=e5E0HK8g;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=J0z+nRJ+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018d66503fca-c4fd433d-eaa2-4f4d-aa35-9aa3c73281f6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706818551; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date;
	bh=j5LrF7AD+9GEZL9PfM+DsplC5gaCUyXAKAkycMFXwZI=;
	b=e5E0HK8gNn0GpCmERGtWjH4vmp2XFzrJ6DKE/omfjWP3g04MGlEWaAOeU5m0glQC
	03g4Kn0MVNalEUURVtxZOHssJtIi/h1oD4haD07esDt8+zOdvvxmDe6Kl1+wnpMPb4o
	QaGYVCICUrlXui7yzzJFnv7sdlt/O8ezK4Cops1g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706818551;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=j5LrF7AD+9GEZL9PfM+DsplC5gaCUyXAKAkycMFXwZI=;
	b=J0z+nRJ+UWgGLULy0MLc8Ps1Ks4sgpHgz4Etbx9VSNA+XCc2HHnUXnN1+h6tEvHQ
	gncOQxldZf8cg3Qfims53MDVvw9W32RLrIPvcPEG0zsYYPwwhVyiMT9fCu9y8+EaC9P
	7XD6qJJ/OQW8EQMEaXJOmwj+rRN8uwTSNnc3M7cM=
From: patchtest@automation.yoctoproject.org
To: auh@yoctoproject.org
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [AUH] iso-codes: upgrading to 4.16.0 SUCCEEDED
In-Reply-To: 0101018d65db7fe1-35223d6f-8f49-4fb7-b3fc-b632be835b8e-000000@us-west-2.amazonses.com
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018d66503fca-c4fd433d-eaa2-4f4d-aa35-9aa3c73281f6-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 20:15:51 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 20:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194739

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/AUH-iso-codes-upgrading-to-4.16.0-SUCCEEDED.patch

FAIL: test Signed-off-by presence: Mbox is missing Signed-off-by. Add it manually or with "git commit --amend -s" (test_mbox.TestMbox.test_signed_off_by_presence)
FAIL: test author valid: Invalid author Upgrade Helper <auh@yoctoproject.org>. Resend the series with a valid patch author (test_mbox.TestMbox.test_author_valid)
FAIL: test commit message presence: Please include a commit message on your patch explaining the change (test_mbox.TestMbox.test_commit_message_presence)

PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
PASS: test lic files chksum modified not mentioned (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
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

