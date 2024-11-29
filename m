Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5387DD729E5
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 15:02:35 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.117440.1732892544444003095
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Nov 2024 07:02:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Qql24H2t;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=C/s1jgJ/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101937871cae3-bf1faa99-593c-4479-97da-f0be5a715507-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1732892543; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=JxT8etVYYoMUvt3xi41lgHo8b3tFYyETA9pD4/PKbLA=;
	b=Qql24H2tEpnEmVOOA/ogooMoQJLDqN59yVsyJAZ5rnf005X0Psun4FFav7JxOA6o
	rG8pqohyYMWl7amOe0fkh7wJgAL/AhdB8GN01QfYPkLqgbLiX2r6yyJiISIREGZodmF
	kTSOPc2uxC7mU9WzhhGDRA4f2L3VGfkoPpIoXh0g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1732892543;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=JxT8etVYYoMUvt3xi41lgHo8b3tFYyETA9pD4/PKbLA=;
	b=C/s1jgJ/PdFsTsP8231+r/NaAqMBtTPRQXxEv71WtZZ95OY0Tm1DqQuqzcut0CyR
	ejhtxLusTAOxgT4HYTjK47XD+UEWdy8N6/77xWDbtDTcBhHdqmS2FfoiQuexxT01Xrl
	w7ZDmtUdHCDd+oLrHmgo9SWlt++U2QTa9pjZZuGo=
From: patchtest@automation.yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [oe-ore][PATCHv3] libsecret: add pam support depending on
 DISTRO_FEATURES
In-Reply-To: <20241129145012.8093-1-f_l_k@t-online.de>
References: <20241129145012.8093-1-f_l_k@t-online.de>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <010101937871cae3-bf1faa99-593c-4479-97da-f0be5a715507-000000@us-west-2.amazonses.com>
Date: Fri, 29 Nov 2024 15:02:23 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.29-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 15:02:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208022

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/oe-ore-PATCHv3-libsecret-add-pam-support-depending-on-DISTRO_FEATURES.patch

FAIL: test lic files chksum modified not mentioned: LIC_FILES_CHKSUM changed without "License-Update:" tag and description in commit message (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
FAIL: test summary presence: SUMMARY is missing in newly added recipe (test_metadata.TestMetadata.test_summary_presence)

PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_status_presence_format)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test lic files chksum presence (test_metadata.TestMetadata.test_lic_files_chksum_presence)
PASS: test license presence (test_metadata.TestMetadata.test_license_presence)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test src uri left files (test_metadata.TestMetadata.test_src_uri_left_files)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)

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

