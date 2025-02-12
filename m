Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CB5C021A0
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 15:18:58 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.18315.1739373533598455023
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 07:18:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ZHNxNW+5;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=j6cVrWqE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010194fabdd612-b1192c4b-03d9-4c22-b8ab-a6fda4ad70b7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739373532; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=vQP3gjBH5aKLh48lDZctjgjOe9Moebln5Tl55RYKj98=;
	b=ZHNxNW+5leFnDWHb/BOOwYCHqt5n+tLHkPjpt4jfDspJwJLXy53nSTERdRd71gkt
	zxg5lN5ddfOVUJRp71d5ZQfb3E+f1Hbsazq+xCh9R3CUHpqhWD8RHD6bNeu50fs0SO6
	GHtRJMP798NiXeQSg0SNcXoxSQCXqWiHoDPgTQA0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739373532;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=vQP3gjBH5aKLh48lDZctjgjOe9Moebln5Tl55RYKj98=;
	b=j6cVrWqEFoKnmQWeAyUhsc/5iuG0jgTUqrDfONvpu+M7vEynJFRbyik0jsv3QUeY
	vsyQvn0U6X6NItNeiq7Y5KYYaBRSqNbtBVjiclaieZn3vpv7AOrNeHULzGab4sHswhi
	HfJj3D+62Nx720/fbkh0344cv8AorjLrvw250Jh0=
From: patchtest@automation.yoctoproject.org
To: Steve Sakoman <steve@sakoman.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][kirkstone 2/7] linux-yocto/5.15: update to v5.15.176
In-Reply-To: 
 <b39adc1b4d9e705b1801684020a0bc12217f6db8.1739369945.git.steve@sakoman.com>
References: 
 <b39adc1b4d9e705b1801684020a0bc12217f6db8.1739369945.git.steve@sakoman.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <01010194fabdd612-b1192c4b-03d9-4c22-b8ab-a6fda4ad70b7-000000@us-west-2.amazonses.com>
Date: Wed, 12 Feb 2025 15:18:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.12-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 15:18:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211249

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/kirkstone-2-7-linux-yocto-5.15-update-to-v5.15.176.patch

FAIL: test commit message user tags: Mbox includes one or more GitHub-style username tags. Ensure that any "@" symbols are stripped out of usernames (test_mbox.TestMbox.test_commit_message_user_tags)

PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test lic files chksum modified not mentioned (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
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

