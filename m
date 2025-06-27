Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A94C7EE31
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 12:17:46 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.12118.1751026658351190457
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 05:17:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=W/GuI8YD;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=JPZ6lF0A;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010197b1526ff1-b361c7a1-3da9-4e16-b6a8-fd21659911f5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751026659; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=KXyGDou0E9Uw0ZfSMEtzrMHWYm73/sxyqnC+MIFhH4o=;
	b=W/GuI8YD5T8CpFzYv9CX+cru4dHl5WADW68p1ppN4se7UFDsm2Apfu1NGFjnzlKO
	OVXUF0DcoF7a7Pa/X5PnZWpG9flWyyLO1ypS74ZlEV8EPF1DtnQwjF/QCfz6MGbSwDn
	LWSw9Ue3ffaySmbZBUKgSmgdjfsIX78mIt3/ip8A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751026659;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=KXyGDou0E9Uw0ZfSMEtzrMHWYm73/sxyqnC+MIFhH4o=;
	b=JPZ6lF0AbY6pAc6WDp8p0pIkdoNqiiaxx9da5/GFXfOM/udG6VUhuFfFVKPWlGEi
	7Jpo/USqa1dTGwdUtaEDpHD04xE+Kb2u1++ueNQqG8L59cY+G4rCs7+b+5ewZ/ZABbx
	FvJ0xX5gJEX3uKyUQNBMPpYGNgP5oN/unqZRbq/4=
From: patchtest@automation.yoctoproject.org
To: Moritz Haase <Moritz.Haase@bmw.de>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH 4/4] createrepo-c: Backport patches to support builds with
 CMake 4+
In-Reply-To: <20250627120633.4084140-5-Moritz.Haase@bmw.de>
References: <20250627120633.4084140-5-Moritz.Haase@bmw.de>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <01010197b1526ff1-b361c7a1-3da9-4e16-b6a8-fd21659911f5-000000@us-west-2.amazonses.com>
Date: Fri, 27 Jun 2025 12:17:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.27-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 12:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219402

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/4-4-createrepo-c-Backport-patches-to-support-builds-with-CMake-4.patch

FAIL: test Signed-off-by presence: A patch file has been added without a Signed-off-by tag: '0001-Fix-libname-of-Libs.private.patch' (test_patch.TestPatch.test_signed_off_by_presence)

PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_status_presence_format)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test lic files chksum modified not mentioned (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test src uri left files (test_metadata.TestMetadata.test_src_uri_left_files)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
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

