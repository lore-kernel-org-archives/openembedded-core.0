Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 664AFC46CD2
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 13:52:06 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.23695.1704462725784303292
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jan 2024 05:52:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DU1zIBSp;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Wp9Tmka5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018cd9e52f41-5450c61b-cffb-4731-8a84-50070ea63cbf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704462725; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date;
	bh=dr0teM+A9BOm31InslTbRdS3AVuKXQxK7srZBYSmyuY=;
	b=DU1zIBSp7kBxAZ3BHCjqDXHpKjFZ69UgAsyWshTmCzn6X42y89eyYEUNPoMvBGqq
	S+EGuGrlj/pZySzXsuBpuQ2JTmHxR40R+j56m3HblZ8seneusETZy+lnFIFGKkoBUnN
	uwXrKHdlBV+dkdLNXyavnb3T91PfvP8vQy8MW/gM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704462725;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=dr0teM+A9BOm31InslTbRdS3AVuKXQxK7srZBYSmyuY=;
	b=Wp9Tmka5DPhkRihJF8lHfqxY/fxp7A9P87xJoCOBfSHt7u5oFFYPnNUHfrLmSBO3
	q++GophTuq1s5wCHzybGAv00/KU+PGWnfs8evPiUJcV4PzpZcR55k0g6Og0PZFP0B36
	Iu3EdUYul6lc3KSz+66FBa5B75vGVIiSKQdq2U9E=
From: patchtest@automation.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH 3/3] python3-cython: update 0.29.36 -> 3.0.7
In-Reply-To: 20240105133543.3017997-3-alex@linutronix.de
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018cd9e52f41-5450c61b-cffb-4731-8a84-50070ea63cbf-000000@us-west-2.amazonses.com>
Date: Fri, 5 Jan 2024 13:52:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.05-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 13:52:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193358

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/3-3-python3-cython-update-0.29.36---3.0.7.patch

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

