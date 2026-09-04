Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB3BEC79F82
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 14:32:38 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15190.1788532349197740745
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 07:32:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Yi/OHdbV;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=WiNQ5Bl8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a06cd5d533-8a83d0bb-241a-4563-a3a3-b84a10fe2bf8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788532348; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=PMBaTI3bn1RrVnWdZuOJGBT47vQXXv8L/yVRNL7ZXiA=;
	b=Yi/OHdbVTSU8UiLjkAvTKMh/Cp+bf7ZwaTsfM5rMqUKBnqgnPSnbP/p7K41saW5v
	zScDxRwRrqaNWUmZAtBRe0Xqj3fm2TDsNUuGBDSkJgJ9Dk8aviXN6XgSQnp9tAsHyXP
	+fV/jOiRHaMvygdISxsO2+08jFjoPm2OM17fKxYM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788532348;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=PMBaTI3bn1RrVnWdZuOJGBT47vQXXv8L/yVRNL7ZXiA=;
	b=WiNQ5Bl8jdWmeqbnahUUHWBuauot+mtW0KB6pqwr7y1UyR10bwOIwA7pYj58hMN1
	ETgxgeMyzB4fSQupyAPzIRV51E/9EYNLRYWHYcV0L/qlhzH9GBkogC6Y+Qjpq/IG73c
	y2/8pnBny6UKKvRMlo9X/gnaZUFEogThiwdGlqO4=
From: patchtest@automation.yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH 1/4] enchant2: upgrade 2.8.19 -> 2.8.21
In-Reply-To: <20260904142343.1608107-1-richard.purdie@linuxfoundation.org>
References: <20260904142343.1608107-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <010101a06cd5d533-8a83d0bb-241a-4563-a3a3-b84a10fe2bf8-000000@us-west-2.amazonses.com>
Date: Fri, 4 Sep 2026 14:32:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.04-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 14:32:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245121

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/1-4-enchant2-upgrade-2.8.19---2.8.21.patch

FAIL: test commit message user tags: Mbox includes one or more GitHub-style username tags. Ensure that any "@" symbols are stripped out of usernames (test_mbox.TestMbox.test_commit_message_user_tags)

PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test auh changelog truncation notice (test_mbox.TestMbox.test_auh_changelog_truncation_notice)
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
SKIP: test CVE tag format: No new source patches introduced (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new source patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new source patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
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

