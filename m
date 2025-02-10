Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79BB5C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 08:46:26 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.46307.1739177182918970474
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 00:46:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=A80WPEhk;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=KbrroIu2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010194ef09c2af-93345d45-e6cc-4070-94ea-5aab76a8fc99-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739177182; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=Iq+wMEyZ2nD8VuwrymRHxsZyFsg+Bb30Uj4LBHnwXq8=;
	b=A80WPEhkFaW/2T4KD5F9oWi/at2swS1Eho7kt3VJ/UJNPAs//y2tX2rnF9qvR0Kw
	lntfVfmy7yngg3WxynkerDrOtJzgQADAxWFPPEm7Dsktxzcf8BRSoFUfYqifnBc9cd5
	d9g1L+F49mcIhU+VuBpyRuiMmQunzIpJuD5I5peI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739177182;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=Iq+wMEyZ2nD8VuwrymRHxsZyFsg+Bb30Uj4LBHnwXq8=;
	b=KbrroIu2lEa2E1szW+sqFTnu/ZDJf7WHg+zXZ48FYnVwGe6vx8fIobycYIVBC2Xd
	91YdPZ2ZPMUDAhB8c5Fh/4isLLCQgtRQhxgDmpm84WrB424THN6dOVaSWQ8E0rPjl7c
	4UZzNN7JipmAuUkmDbHk+yhQ2+948miKh8+oUVjg=
From: patchtest@automation.yoctoproject.org
To: Chris Moore <cmoore@hanoverdisplays.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH] psplash.c: fix crash from length becoming negative
In-Reply-To: 
 <036b2d9feb26fd94e2f80d6fc46ede8c2775e6d8.camel@hanoverdisplays.com>
References: 
 <036b2d9feb26fd94e2f80d6fc46ede8c2775e6d8.camel@hanoverdisplays.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <01010194ef09c2af-93345d45-e6cc-4070-94ea-5aab76a8fc99-000000@us-west-2.amazonses.com>
Date: Mon, 10 Feb 2025 08:46:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.10-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 08:46:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211082

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/psplash.c-fix-crash-from-length-becoming-negative.patch

FAIL: test mbox format: Series has malformed diff lines. Create the series again using git-format-patch and ensure it applies using git am (test_mbox.TestMbox.test_mbox_format)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: Python-unidiff parse error (test_python_pylint.PyLint.pretest_pylint)
SKIP: pretest src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test CVE check ignore: No modified recipes or older target branch, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
SKIP: test CVE tag format: Parse error Unexpected hunk found: @@ -170,15 +171,16 @@ psplash_main (PSplashFB *fb, int pipe_fd, int
SKIP: test Signed-off-by presence: Parse error Unexpected hunk found: @@ -170,15 +171,16 @@ psplash_main (PSplashFB *fb, int pipe_fd, int
SKIP: test Upstream-Status presence: Parse error Unexpected hunk found: @@ -170,15 +171,16 @@ psplash_main (PSplashFB *fb, int pipe_fd, int
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test lic files chksum modified not mentioned: No modified recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
SKIP: test pylint: Python-unidiff parse error (test_python_pylint.PyLint.test_pylint)
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
SKIP: test src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.test_src_uri_left_files)
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

