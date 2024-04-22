Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDEE5C10F1A
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 15:05:03 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.20944.1713798302188885385
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Apr 2024 08:05:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=M5vKrX2j;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=G9Efypii;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018f0656c5fb-2b81f896-263d-4140-9770-ef64a35f13a3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713798301; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=jz9t7xUaxLPqaZBJlYsvububsm9SGJtjznYH1vhXY1A=;
	b=M5vKrX2j7/lDKe8yOeOQqEss4iRIzcWMjnAytbhg8CmkrOV3kVIx82vB8aii22bH
	wJJbwpNrIiCaQh0QhvlcCaBR1jDAsYVAlo5H6u6EifWIuW/6G1gBhpRyPAguEryoZ/2
	NYWMHIZ9+7OIcR2+ciBpQsahwuBv1xukUSjVhoRA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713798301;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=jz9t7xUaxLPqaZBJlYsvububsm9SGJtjznYH1vhXY1A=;
	b=G9EfypiiivKiMMSFAA0SlD/EUC4mMeXvxBX42gc7rdE87C8w1mSymKHGeqDOj+VF
	YcoW9IOeSy5OWP4+g3ojRhdH0D4MgTHY2sJxwWHUlskeQyfaPk2uhiQ8xVSQ0ppune2
	N2S4PJEF/p9ze2qcv7PmqgCYaGpqIYC6Aohh8Ejc=
From: patchtest@automation.yoctoproject.org
To: Michael <m.glembo@gmail.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [master][scarthgap][poky][PATCH] rootfs-postcommands.bbclass: Only
 set DROPBEAR_RSAKEY_DIR once
In-Reply-To: 
 <CAKDoKkPr57uXMpmDVZba_WCgH47hbRxU0HmOp6B27xQ2wh-MrQ@mail.gmail.com>
References: 
 <CAKDoKkPr57uXMpmDVZba_WCgH47hbRxU0HmOp6B27xQ2wh-MrQ@mail.gmail.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018f0656c5fb-2b81f896-263d-4140-9770-ef64a35f13a3-000000@us-west-2.amazonses.com>
Date: Mon, 22 Apr 2024 15:05:01 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.22-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Apr 2024 15:05:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198594

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/master-scarthgap-poky-rootfs-postcommands.bbclass-Only-set-DROPBEAR_RSAKEY_DIR-once.patch

FAIL: test mbox format: Series has malformed diff lines. Create the series again using git-format-patch and ensure it applies using git am (test_mbox.TestMbox.test_mbox_format)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: Python-unidiff parse error (test_python_pylint.PyLint.pretest_pylint)
SKIP: pretest src uri left files: Patch cannot be merged (test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test CVE check ignore: No modified recipes or older target branch, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
SKIP: test CVE tag format: Parse error Hunk diff line expected: ${IMAGE_ROOTFS}/etc/dropbear/dropbear_rsa_host_key
SKIP: test Signed-off-by presence: Parse error Hunk diff line expected: ${IMAGE_ROOTFS}/etc/dropbear/dropbear_rsa_host_key
SKIP: test Upstream-Status presence: Parse error Hunk diff line expected: ${IMAGE_ROOTFS}/etc/dropbear/dropbear_rsa_host_key
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test lic files chksum modified not mentioned: No modified recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
SKIP: test pylint: Python-unidiff parse error (test_python_pylint.PyLint.test_pylint)
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

