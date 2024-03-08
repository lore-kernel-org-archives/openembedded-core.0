Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2D5C5475B
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 17:04:09 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.82.1709917440567336933
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Mar 2024 09:04:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EtPqoj8d;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pz9cED4c;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018e1f05869b-1d7fdea2-1188-4ecd-b76c-13e778b92258-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709917439; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=HCKnEj+ySGGYlIRJQCtxah5OWErrZQnN0Quo42jqy5s=;
	b=EtPqoj8dLMunEbTZFspj4Pe7zvI8uldKJhjfiuG/1qPdFTz7to0+97eibOtqEpwR
	iPoMwkACxPNHUAWeo2oz+UsG1XjT7gYsVSfpNXsLS/xybxiLckv3y8XVnjQa55Hkhhw
	PavszBnF65qvMbAsg6y9aMJQ0s00cWYOIugmXtQQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709917439;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=HCKnEj+ySGGYlIRJQCtxah5OWErrZQnN0Quo42jqy5s=;
	b=pz9cED4chm4aZ0KLAsVZz8NXwQdGbdG9vAc4hnxZDKL+ehvyGlDbc5ccHf2CGcRM
	cGEonJX20UK16gpYjsL1OkDGaAGdZkgNv/DGKObPuJwa8+LPJQ48+R5Y4pKnlv5CpuM
	QNfk1n2iIQHtfJpneDv//A2Rv+9QJTh1WhnRG2eo=
From: patchtest@automation.yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [oe-core][PATCH] mesa: fix opencl-spirv build
In-Reply-To: <20240308164728.1933548-1-f_l_k@t-online.de>
References: <20240308164728.1933548-1-f_l_k@t-online.de>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018e1f05869b-1d7fdea2-1188-4ecd-b76c-13e778b92258-000000@us-west-2.amazonses.com>
Date: Fri, 8 Mar 2024 17:03:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.08-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 17:04:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196858

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/mesa-fix-opencl-spirv-build.patch

FAIL: test Signed-off-by presence: A patch file has been added without a Signed-off-by tag: '0001-Revert-meson-do-not-pull-in-clc-for-clover.patch' (test_patch.TestPatch.test_signed_off_by_presence)
FAIL: test Upstream-Status presence: Upstream-Status is Inappropriate, but no reason was provided (test_patch.TestPatch.test_upstream_status_presence_format)

PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)

SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
SKIP: pretest src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test CVE check ignore: No modified recipes or older target branch, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
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

