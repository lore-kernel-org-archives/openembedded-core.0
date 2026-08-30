Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00CA8C61DD9
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 14:01:12 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8952.1788098466845026686
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 07:01:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eEyHO+YP;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=A3zWT0Ie;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a052f950a9-82c5481b-be36-42c4-ac78-506ee59524e8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788098466; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=nUNq7sX87FveykSky//5sZv2+XZJo+9bOBMUWi4Ccgc=;
	b=eEyHO+YPANhxFZ+R2ocHuqWCsEDBS+RuWYe+IC+32KrtbDKeId8CvQoQSvLF6CXB
	WFu5dJwxacFP9eqHCvMSRnH0TR/ajosn6IvNeuhcJoy89ceiINd7q1LaPDKfeBKiwUk
	f8Et3As4dbsCIpAl6nkbMxawLzkKklQX2CnnZhak=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788098466;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=nUNq7sX87FveykSky//5sZv2+XZJo+9bOBMUWi4Ccgc=;
	b=A3zWT0IeM0bFHlxawvvo+WEVOWq91Q9NFbaSZB8Uyv3IgAAXbeA6SWmIT0X76ZgR
	/4Kgax/ghFfqW4ngCFwDXRBbB1eyHr97Vd1fDhAIk+YMRIlXi/xOAQXQzUky2zNBvC2
	19ouSWeA+jISzCHbihIXQM0W70Vi1OUjOPmggS84=
From: patchtest@automation.yoctoproject.org
To: chris.laplante@agilent.com
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH] oeqa/selftest/bbtests: tweak test_git_unpack_nonetwork_fail
 to match either fetch or fetch2 in error message
In-Reply-To: <20260830134952.4182115-2-chris.laplante@agilent.com>
References: <20260830134952.4182115-2-chris.laplante@agilent.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <010101a052f950a9-82c5481b-be36-42c4-ac78-506ee59524e8-000000@us-west-2.amazonses.com>
Date: Sun, 30 Aug 2026 14:01:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.30-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 14:01:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244655

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/oeqa-selftest-bbtests-tweak-test_git_unpack_nonetwork_fail-to-match-either-fetch-or-fetch2-in-error-message.patch

FAIL: test max line length: Patch line too long (current length 244, maximum is 200) (test_metadata.TestMetadata.test_max_line_length)
FAIL: test shortlog length: Edit shortlog so that it is 90 characters or less (currently 108 characters) (test_mbox.TestMbox.test_shortlog_length)

PASS: pretest pylint (test_python_pylint.PyLint.pretest_pylint)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test auh changelog truncation notice (test_mbox.TestMbox.test_auh_changelog_truncation_notice)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test pylint (test_python_pylint.PyLint.test_pylint)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test CVE check ignore: No modified recipes or older target branch, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
SKIP: test CVE tag format: No new source patches introduced (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new source patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new source patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test lic files chksum modified not mentioned: No modified recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
SKIP: test src uri left files: No modified recipes, skipping test (test_metadata.TestMetadata.test_src_uri_left_files)
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

