Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78096C4167D
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 11:18:43 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.7931.1699355914970724517
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 03:18:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Yv/a16fK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FXanhXx1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018ba9816e0d-f635ad4e-2120-4984-854b-1e35a0fd2563-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699355914; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date;
	bh=71tz41cemmVpeXHMrN+TrEbSdPBsdKTc3p1mghOAcUQ=;
	b=Yv/a16fKjspSxlp/kJwkEBPGyfVYkAkVUiCPSCcSSG9hOxyUoSSe5QDa/4oi6DFB
	DnMkAdwnbVUrhG/kNh+QMNbXJsUrt247tvryL1LvLQFD0Xrau3gHZhZxBsLR5wUAH1W
	/62WSccOzmP0l9oONmwShr8qh+eSXsciQtzcSBEU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699355914;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=71tz41cemmVpeXHMrN+TrEbSdPBsdKTc3p1mghOAcUQ=;
	b=FXanhXx1MV7mYkZtiaT9WH7XQDhuMAlqpdp8xjuGaGNV/C1/r0SVHH1v5i1KrFdi
	+T8tyA5bCNSw/f5F8ins20b4NvlDnKc9gYByKG2YOPmWAt+DIuJyft+wjCP1jQMr/5R
	TbjUVXWLLNBufvrLAolonR11puO2SAsWzfGPhdls=
From: patchtest@automation.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [RFC PATCH] scripts/oe-replicate-build: add a script that packages
 and replicates a yocto build elsewhere
In-Reply-To: 20231107105844.712846-1-alex@linutronix.de
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018ba9816e0d-f635ad4e-2120-4984-854b-1e35a0fd2563-000000@us-west-2.amazonses.com>
Date: Tue, 7 Nov 2023 11:18:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.07-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 11:18:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190265

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/RFC-scripts-oe-replicate-build-add-a-script-that-packages-and-replicates-a-yocto-build-elsewhere.patch

FAIL: test shortlog length: Edit shortlog so that it is 90 characters or less (currently 93 characters) (test_mbox.TestMbox.test_shortlog_length)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)

SKIP: pretest lic files chksum modified not mentioned: No modified recipes, skipping pretest (test_metadata.TestMetadata.pretest_lic_files_chksum_modified_not_mentioned)
SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
SKIP: pretest src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.pretest_src_uri_left_files)
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

