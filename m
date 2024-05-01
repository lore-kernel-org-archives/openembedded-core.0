Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60756C10F1A
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 22:10:47 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.9909.1714601440088041649
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 15:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=e+hwEXJL;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=W7KS0zaC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018f3635afca-11842871-ef2c-4a0a-a6f4-a880a28cca92-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714601439; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=3q3rTmBX9rLRSSmZeO9rwRsVrz35da1+Ihkp2SUgq+w=;
	b=e+hwEXJLoonBvwY2BtfL3dFn1KyAPoIz89ZBMb2kZheGZUytOEus1HSJiE72Gqro
	kNG52bMl7Ivn9hrMlOCcrkphyAW2/OoGTjZ9TBkr+CbnSu7tTpBPLXKPxw2rqmPewjo
	2H3tPXWan/AQi/PH+8O4nN9aMoRr/vQYjBgiIMGQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714601439;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=3q3rTmBX9rLRSSmZeO9rwRsVrz35da1+Ihkp2SUgq+w=;
	b=W7KS0zaCANgPUHzNXdS8b0PWB9bHVu8E2d2xj/mEd8NDchcwkPh0XYYCt8KwbpX7
	KteTcS3QRSvfXwbRlf34x52d3BFwbvluYsIrS9N8BjO51U8xXn6klxRyw+TBxrkDhRX
	1AAUARI0AAD+KmHx8VQM328nB8A7NCkKYp7ju5VU=
From: patchtest@automation.yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH 3/4] recipes: Update S = WORKDIR recipes to use ${S} correctly
In-Reply-To: <20240501215643.3386307-3-richard.purdie@linuxfoundation.org>
References: <20240501215643.3386307-3-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018f3635afca-11842871-ef2c-4a0a-a6f4-a880a28cca92-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 22:10:39 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 22:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198893

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/3-4-recipes-Update-S-WORKDIR-recipes-to-use-S-correctly.patch

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

