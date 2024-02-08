Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D4C4C4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 07:04:24 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.12558.1707375854269290215
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 23:04:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XNqJ67IQ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pydn+7Pa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018d8787ff0b-403ce35b-a73b-4bb8-9d05-ed67a85ac216-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1707375853; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date;
	bh=4ESg2rDOobKDWks8Tv1Q+ihiGUC/zfV58BANiHKeMd4=;
	b=XNqJ67IQo1kp8w5LIcOrzkHZ+UMeZX/rkxy6b0Xrh1rVpG+ffPKn67bHkUmSD2u8
	PPoAMnoRy4+1ThuH5tKM2dTgA1wCGJZQIkX8i58idzaJA8DwTRg+IDzcbkQ0jSdYy5s
	F622AzfwBMU3fJpfy0+3HjhJ6hl4HeBVt3a8weFk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1707375853;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=4ESg2rDOobKDWks8Tv1Q+ihiGUC/zfV58BANiHKeMd4=;
	b=pydn+7PasehGkyQz6qaen6EKEvYlE1pTeKCVn1UK+39C1WS1HUUveBJqCOj2NMwS
	bnrwpYF3q5JsuV8vE1/jw2GTi/R9Am6dR8Fb7l2UvRLzVNtwPWL2CEZcLkNKAdi21Jh
	hi+IkrCk4ZbKJHVuOmxIuiv+21SWTo8zW56FA5ks=
From: patchtest@automation.yoctoproject.org
To: vanusuri@mvista.com
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][kirkstone][PATCH] ghostscript: ignore CVE-2020-36773
In-Reply-To: 20240208064030.118190-1-vanusuri@mvista.com
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018d8787ff0b-403ce35b-a73b-4bb8-9d05-ed67a85ac216-000000@us-west-2.amazonses.com>
Date: Thu, 8 Feb 2024 07:04:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.08-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 07:04:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195103

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/kirkstone-ghostscript-ignore-CVE-2020-36773.patch

FAIL: test CVE check ignore: CVE_CHECK_IGNORE is deprecated and should be replaced by CVE_STATUS (test_metadata.TestMetadata.test_cve_check_ignore)

PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
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

