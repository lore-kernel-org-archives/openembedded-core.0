Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 156D3C54E49
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 00:03:49 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.24639.1710029027775778205
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Mar 2024 16:03:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gAnz/97r;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Wt/xilNR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018e25ac3600-ea73cddb-18da-4d4d-8e06-d4e55499a1d2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710029027; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=eJ9iMg7LIP16oloL2TEyjWpRzFI+BHlg/8PHagcWwfw=;
	b=gAnz/97rqEWR8Oope16EvVGT/EehmIHPhKudMP7UsnY7fjuVwhnMbp4NSandd17Q
	dkFXYVJyt9v2TFDVRF41C5evqFwMmdonDx8Hx4e/W5zJyBaYUVwHcad2p1rbf1R5/DO
	6tMOV27+76B2Lq7wNrc9Vhc4voKweuA47dZfcVo4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1710029027;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=eJ9iMg7LIP16oloL2TEyjWpRzFI+BHlg/8PHagcWwfw=;
	b=Wt/xilNR6n9RmmbjmJYCyuVNKVT0z2quOakwiY3XvSGjBJsRmMVblJIfyKkRDaKu
	mwTTg3vyKqpd07NiynxQEX7hVzGjiTd6Uivj/jp3HoXrgeQumPoIcdHF/QQnyZLhRZt
	T1dRHV3blRLM3FCn265wLCT7HZ4FHvQKUotwfJBk=
From: patchtest@automation.yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH] elfutils: Fix build break with clang
In-Reply-To: <20240309235748.517154-1-raj.khem@gmail.com>
References: <20240309235748.517154-1-raj.khem@gmail.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018e25ac3600-ea73cddb-18da-4d4d-8e06-d4e55499a1d2-000000@us-west-2.amazonses.com>
Date: Sun, 10 Mar 2024 00:03:46 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.10-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 00:03:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196876

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/elfutils-Fix-build-break-with-clang.patch

FAIL: test commit message presence: Please include a commit message on your patch explaining the change (test_mbox.TestMbox.test_commit_message_presence)

PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_status_presence_format)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
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

