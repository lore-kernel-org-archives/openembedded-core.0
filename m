Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC46C021A0
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 07:32:48 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.46407.1739777558107310437
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Feb 2025 23:32:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=YQ0pEXPR;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=YSt/dv3k;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019512d2c2ff-3836b707-0887-4709-816a-1a004d363910-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739777557; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=DLL+GDDhZQAhC2rxCRnfIdPDkKPoBw2DznOgYjHv6pA=;
	b=YQ0pEXPRDMoIlqe9QxgdBeJK2RZdH/AzTIFAgvWIRByzVOEwmwpOVFg8we04D6yt
	pYGYWRpWyHN72qLXvEnMG490FWnuaeYzoL9CfKGqiwFqaNaIONhJ2bwuN5fXHcAiTVi
	0z7KuqcKXhES/mLGw5aonMG7GKpln0S0XBqVg8t8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739777557;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=DLL+GDDhZQAhC2rxCRnfIdPDkKPoBw2DznOgYjHv6pA=;
	b=YSt/dv3kbp6+EMwFk3T2e4ajbCif537wd61WHhNYFPLgCHYDuiUm1zuxhn4abYTF
	/fOkg8Cwe2pGvm9dYTAKUmLhi1VpAnytEW5T/v/z39fBw9+fUNomSqK4/8yhfXrw2Vw
	vSnVu6TUBygvCQPLEa9pbFgDM0MjCOfAy9MU02xA=
From: patchtest@automation.yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH 2/3] gpgme: upgrade 1.24.1 -> 1.24.2
In-Reply-To: <20250217071432.4144843-2-hongxu.jia@windriver.com>
References: <20250217071432.4144843-2-hongxu.jia@windriver.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019512d2c2ff-3836b707-0887-4709-816a-1a004d363910-000000@us-west-2.amazonses.com>
Date: Mon, 17 Feb 2025 07:32:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.17-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 07:32:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211521

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/2-3-gpgme-upgrade-1.24.1---1.24.2.patch

FAIL: test Signed-off-by presence: Mbox is missing Signed-off-by. Add it manually or with "git commit --amend -s" (test_mbox.TestMbox.test_signed_off_by_presence)
FAIL: test non-AUH upgrade: Invalid author auh@yoctoproject.org. Resend the series with a valid patch author (test_mbox.TestMbox.test_non_auh_upgrade)

PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test lic files chksum modified not mentioned (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test src uri left files (test_metadata.TestMetadata.test_src_uri_left_files)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

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

