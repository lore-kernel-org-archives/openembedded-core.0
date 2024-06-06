Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C2DC27C55
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 17:38:04 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.20918.1717695481934851686
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 10:38:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=VeayMi2z;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=tuGPDSnY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018feea1050f-44f53275-02d0-4eb4-85a8-8efe276d3bd1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1717695481; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=kQqay3IHpldrUURtgbaothBz+vEsOFnB+h2O2IBWDGk=;
	b=VeayMi2zxxYFGEPX8kVmoPt93IhZygIc8whD0Abyta8nQ9Z9dGNObhxMr+bvWAJP
	B8KyPLYT/N3exu5T3wn+T3mJdeATJmG3XQErfW25pSrgam1Cfnj6ZmdO5tjdZSMAfPG
	2et5DNZx9HclkSWWGsgdO/+pZsZ5owv6J3fQaecc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1717695481;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=kQqay3IHpldrUURtgbaothBz+vEsOFnB+h2O2IBWDGk=;
	b=tuGPDSnYHiU2rdXjUaynFLO5V14XQt5jwmUv1F8RiuzpzNABTMnEBnzNC6ZF/y0X
	XNRPLg6qVvMwtAmZoKlQqG+09JsdvM5zwQ0lQOYfXhLdCYfMN0ariTzE8qVuJaXXKq2
	81VDeNcX4y/n9PYdbDYx3Pieak18E8LtH3D8ceBE=
From: patchtest@automation.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH 2/2] python3-cython: remove redundant .inc file
In-Reply-To: <20240606172015.3118703-2-ross.burton@arm.com>
References: <20240606172015.3118703-2-ross.burton@arm.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018feea1050f-44f53275-02d0-4eb4-85a8-8efe276d3bd1-000000@us-west-2.amazonses.com>
Date: Thu, 6 Jun 2024 17:38:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.06-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 17:38:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200410

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/2-2-python3-cython-remove-redundant-.inc-file.patch

FAIL: test lic files chksum modified not mentioned: LIC_FILES_CHKSUM changed without "License-Update:" tag and description in commit message (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)

PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test src uri left files (test_metadata.TestMetadata.test_src_uri_left_files)

SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
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

