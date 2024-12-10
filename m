Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F52EE7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 21:18:57 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.4411.1733865534084195145
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 13:18:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=euiqiCgz;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=rk0/NgeO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010193b2706f49-7eb89488-2d36-492e-8f51-378982eb1ae6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733865533; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=eyhmFYmZEr3IVFImm4Bq/i3Y5aAc11G+A6MXftQ1hn0=;
	b=euiqiCgzV73F+lWvhsiV9nTsaAULUZiCALfdRXfU3VCXOjX3wcSheQ/B2DfqA6XF
	Ddomn66hzQPxqb0wPi3Ti0U/Fxbds6VluspOP5NLibfUqjpHOLhXxw7DW2dsPE5XowN
	Hk1yQQTW/dbYQNqi85ybAdp+3nJoIIYbw/DV5HUc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733865533;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=eyhmFYmZEr3IVFImm4Bq/i3Y5aAc11G+A6MXftQ1hn0=;
	b=rk0/NgeOecsCzGGqNWN9U7583gGU2GqNfxwJ3ObhIfHz6QWgQT3ZkbWxAN6Y+IwE
	h0eElA0bFnFcmzYRGC8ah2K03+wEYebd3jh0RcEqJ1RGoyso806swzENA0U1kYUGYcq
	uN0QYCFhn3mcrOUUQmjddsCQIbulg9sO7wtYNBe4=
From: patchtest@automation.yoctoproject.org
To: bruce.ashfield@gmail.com
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH 6/6] yocto-bsp: drop 6.10 bbappend
In-Reply-To: 
 <6b100ab4a08b463db909022b5bd2a6ac7513c29d.1733864271.git.bruce.ashfield@gmail.com>
References: 
 <6b100ab4a08b463db909022b5bd2a6ac7513c29d.1733864271.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <01010193b2706f49-7eb89488-2d36-492e-8f51-378982eb1ae6-000000@us-west-2.amazonses.com>
Date: Tue, 10 Dec 2024 21:18:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.10-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 21:18:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208564

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/6-6-yocto-bsp-drop-6.10-bbappend.patch

FAIL: test target mailing list: Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists (test_mbox.TestMbox.test_target_mailing_list)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)

SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
SKIP: pretest src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test CVE check ignore: No modified recipes or older target branch, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test lic files chksum modified not mentioned: No modified recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
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

