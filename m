Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 437CEE77184
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 22:46:51 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.94127.1734475609115111800
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 14:46:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=AZOHz6oG;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=TiOnr4GG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010193d6cd7106-24176d77-5854-4e15-93f6-ebf70e3ba789-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1734475608; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=HnWkytx0X6X3Rh3JdmnZExtIVhGDY4h/jmKx+BAwQNs=;
	b=AZOHz6oG9U9Pg2+pdfT/Pvp5sihLixlk8/MvSM9vx2TotmAa8aXtFQ07GCrT04sb
	9hwmyzvyhOFzSdT/AbbeLAxR+pJKoIfmJBrZ33TxSqEhsUNhpgQOVzzZwljIWy+LmBs
	Kh8hspwslHBAySkW0+isFpZSxEh4PD2eBxI4Qm8M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1734475608;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=HnWkytx0X6X3Rh3JdmnZExtIVhGDY4h/jmKx+BAwQNs=;
	b=TiOnr4GGLdbfv+y6eRrQ0JYyThG4ScMnoWUKJwtEal9Qig9uM1k3t3NSdjZGQTfR
	Q98ruz60MqZMtlzlfDxFNVahbtk8KZRqcLrdL61kqPE6kFhhxXIv+BipB1aYMfYAuPY
	mbvb65z+DkXWFmNEaOQsIYxhz489jh/22ewXbsMU=
From: patchtest@automation.yoctoproject.org
To: Derek Straka <derek@asterius.io>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][PATCH 2/2] python3-*: Update recipes leveraging standard
 pytest ptests to use the new ptest-python-pytest class
In-Reply-To: <20241217223605.3383795-2-derek@asterius.io>
References: <20241217223605.3383795-2-derek@asterius.io>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <01010193d6cd7106-24176d77-5854-4e15-93f6-ebf70e3ba789-000000@us-west-2.amazonses.com>
Date: Tue, 17 Dec 2024 22:46:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.17-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 22:46:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208862

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/2-2-python3--Update-recipes-leveraging-standard-pytest-ptests-to-use-the-new-ptest-python-pytest-class.patch

FAIL: test shortlog length: Edit shortlog so that it is 90 characters or less (currently 100 characters) (test_mbox.TestMbox.test_shortlog_length)

PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
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

