Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44DEC4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 13:12:53 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.34817.1702041164878328470
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 05:12:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gYpy4A5O;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Dzia1iVz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018c498f18cf-27ac4c58-2cb4-4e3f-956b-42e345717504-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1702041164; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date;
	bh=2drvpHw1mThNLPIhrVbL4GilayCAV/Q8mKqqQWnAALE=;
	b=gYpy4A5O2rypcCqbWal3Y7ycRV/cUMM7PzD38BALB35RzZ2gEKrYLeGBpBD24hok
	jOMLYS9Iabt8pAZUFR/wZMRyXFg//oktFamBJCb6Hmwjzxkb+xDijmTPqClaR7jaIYE
	O/rxLhC5YNr7iEvSpPUjDgEvd/jo8vx/p+Kh2h90=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1702041164;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=2drvpHw1mThNLPIhrVbL4GilayCAV/Q8mKqqQWnAALE=;
	b=Dzia1iVzR1DggwuSgsgM5UySnenwRWR7VGob7jx1H3+Q1nPLNBz6XQuD+SB1k4pH
	+9s+a4RDRbJF4YJET8GiW9I8K7TeCnaQYfIIOa3+Fmq2dp/ussC/Z7QIDJWOE/E+6aL
	iau8vHW1jR70ZYhjPC7ZYCJSCECPjLaV8s1i//Yc=
From: patchtest@automation.yoctoproject.org
To: Pavel Zhukov <pavel@zhukoff.net>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH] bbtests.py: Add test for unexpanded variables in the dirname
In-Reply-To: 20231208113813.766894-1-pavel@zhukoff.net
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018c498f18cf-27ac4c58-2cb4-4e3f-956b-42e345717504-000000@us-west-2.amazonses.com>
Date: Fri, 8 Dec 2023 13:12:43 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.08-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 13:12:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192057

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/bbtests.py-Add-test-for-unexpanded-variables-in-the-dirname.patch

FAIL: test max line length: Patch line too long (current length 250, maximum is 200) (test_metadata.TestMetadata.test_max_line_length)

PASS: pretest pylint (test_python_pylint.PyLint.pretest_pylint)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test pylint (test_python_pylint.PyLint.test_pylint)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)

SKIP: pretest src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test lic files chksum modified not mentioned: No modified recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
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

