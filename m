Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017F7C3DA62
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 18:39:00 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.696.1721241532180579453
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jul 2024 11:38:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=KhlYbb/9;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=plDEW9Kx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010190c1fd73fc-08f9bd35-496b-43f5-a61f-65286bab100e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721241531; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=jf63FTi5KPx+lZ91Pkl5vi2BFQMAt8IH5bj35UtmrKE=;
	b=KhlYbb/9VVkxuzRTWyEhP9/aI0msB/k7ofpWwjB85R0b9MfrclS8+Zuuj/Uyh1cY
	kbLLMdrHHoxOsKJxQozpp/mdocnzQi3YwBMG5+XAGUxQYKebW8+1fq72VRq8OMdhayG
	SWPhQSCDZQPanuscTJW2EJP/QL4wjHJGZDJ/OfAs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721241531;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=jf63FTi5KPx+lZ91Pkl5vi2BFQMAt8IH5bj35UtmrKE=;
	b=plDEW9Kxwzy8FCcPoyH9gIY50FoIwfFMKK1co7/OSyHQQhhyl7izzg6tVJP/Fd7I
	xieH60KhX8ZtBxOyl/g68vtQVRiEGM1Hpu5ahBttZS/KZ2r24A0jVISKKUINkMwyYVX
	+YTEuEnhXLQ1fuHU5Q1+3Syr2Uyp+sEKhWq0jYc0=
From: patchtest@automation.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH 3/4] recipeutils/get_recipe_upgrade_status: group recipes when
 they need to be upgraded together
In-Reply-To: <20240717182216.1661015-3-alex.kanavin@gmail.com>
References: <20240717182216.1661015-3-alex.kanavin@gmail.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <01010190c1fd73fc-08f9bd35-496b-43f5-a61f-65286bab100e-000000@us-west-2.amazonses.com>
Date: Wed, 17 Jul 2024 18:38:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.17-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 18:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202177

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/3-4-recipeutils-get_recipe_upgrade_status-group-recipes-when-they-need-to-be-upgraded-together.patch

FAIL: test max line length: Patch line too long (current length 217, maximum is 200) (test_metadata.TestMetadata.test_max_line_length)
FAIL: test shortlog length: Edit shortlog so that it is 90 characters or less (currently 91 characters) (test_mbox.TestMbox.test_shortlog_length)

PASS: pretest pylint (test_python_pylint.PyLint.pretest_pylint)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test pylint (test_python_pylint.PyLint.test_pylint)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest src uri left files: Patch cannot be merged (test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test CVE check ignore: No modified recipes or older target branch, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test lic files chksum modified not mentioned: No modified recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
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

