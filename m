Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E124FC4167B
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 22:20:04 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.8757.1698790799905320800
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 15:20:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Slv7EYtW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=lY6j7peL;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.31, mailfrom: 0101018b87d275c6-e3f68aec-61a4-477a-aec6-a2287493a798-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698790799; i=@automation.yoctoproject.org;
	h=From:Reply-To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date;
	bh=4DGl8D7PMM0JiRIxcc93DSe8K6XsPOkYe4FDUoPb4Ig=;
	b=Slv7EYtWDMfmRj148x5YtWjKVV6m0W2eOd/KICQEPr4D76mK1S+Sy8ceKQvJ65o4
	kF+7kVRCqH9YOU9erP104C1iKVBwsVRGdiNI/999qk/URCmK4Bv3rWbcS3S4pPkyavy
	RHPWOuqPtF5iwgiuizSucD54oC/tcFn2WmOFY7P8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698790799;
	h=From:Reply-To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:Feedback-ID;
	bh=4DGl8D7PMM0JiRIxcc93DSe8K6XsPOkYe4FDUoPb4Ig=;
	b=lY6j7peLJgwJXMc7XWW+pTcUvX5JiL64AXRFs1N1PDJGztQD5UskQyWVOX9wv3lQ
	7LK/dNytejLGM5dupbQ8DSS+2O6Tduc7wJwncSkiPr29N3tfKwVThc++BuKJUaORDQk
	94aV6hke6Wa8c4B05jhgYteRlkzQvorhRYbBSp4U=
From: patchtest@automation.yoctoproject.org
Reply-To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][kirkstone 1/3] libxml2: Patch
 CVE-2023-45322
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Message-ID: <0101018b87d275c6-e3f68aec-61a4-477a-aec6-a2287493a798-000000@us-west-2.amazonses.com>
Date: Tue, 31 Oct 2023 22:19:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.31-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 22:20:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189874

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/kirkstone-1-3-libxml2-Patch-CVE-2023-45322.patch

FAIL: test CVE presence in commit message: A CVE tag should be provided in the commit message with format: "CVE: CVE-YYYY-XXXX" (test_mbox.TestMbox.test_cve_presence_in_commit_message)

PASS: pretest lic files chksum modified not mentioned (test_metadata.TestMetadata.pretest_lic_files_chksum_modified_not_mentioned)
PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
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

