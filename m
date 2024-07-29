Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C6EC3DA4A
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 12:34:16 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.55152.1722256448796829800
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 05:34:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=j32kKSH4;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=RmzkfIiE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010190fe7bda19-f7756246-0b33-49a4-85c7-ac5b9e5e3806-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722256448; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=x53PuK5sRo7kq5vVkWNHiSEA0yad1P15cgdh7OYNYDI=;
	b=j32kKSH4ZZ3EgEC6iB73xgcS9L3etxvZ5nCRutTeI/SYNQH1JCbBlkdr75VHN2kr
	f6Z+JhFY8NH68dCCFOusw9sCpXihPSOmiVF91QF7WiOZcpG8mLFSielyAFowxiXjZCJ
	h1WYp8XyGBMYvH2r9fb8RYArXEiXiyAgv2rT0GBA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722256448;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=x53PuK5sRo7kq5vVkWNHiSEA0yad1P15cgdh7OYNYDI=;
	b=RmzkfIiExrIuI+lFgaDL2Igf5e+7VHuG0Ne9KXuQTy55T07sOfGxi0wo0qz9oVZT
	5fiK/WqWfzgH4zWqy96ikF+pcoH8bdV8er1gD6SQelAseli9izI4DcAIdoc5+Jj+w95
	qA9kmpCvcv21LUg1Izt3Y2Cdt66avpRV0jkhMJsI=
From: patchtest@automation.yoctoproject.org
To: "Theodore A. Roth" <troth@openavr.org>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH] ca-certificates: Add comment for provenance of SRCREV
In-Reply-To: <20240729122206.8396-1-troth@openavr.org>
References: <20240729122206.8396-1-troth@openavr.org>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <01010190fe7bda19-f7756246-0b33-49a4-85c7-ac5b9e5e3806-000000@us-west-2.amazonses.com>
Date: Mon, 29 Jul 2024 12:34:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.29-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 12:34:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202613

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/ca-certificates-Add-comment-for-provenance-of-SRCREV.patch

FAIL: test commit message presence: Please include a commit message on your patch explaining the change (test_mbox.TestMbox.test_commit_message_presence)

PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test lic files chksum modified not mentioned (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
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

