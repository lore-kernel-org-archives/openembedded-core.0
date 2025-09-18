Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B33CA1013
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 21:48:21 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.1087.1758232094486891571
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 14:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fUSQeKA3;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=anQP0ONW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101995ecca344-ee88e3a5-6dd9-46b3-a410-2a94332e06ca-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1758232093; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=Q8VFiGK++YricJ7t1PQlXlrHAKR3NUH4QwWfgJ1snt8=;
	b=fUSQeKA3UhT4EsHk8VBI1vHe+ENiA8w7EvHX+KMnMI8NnQgoYJs5SQ/4T8h1/2u8
	P+MG5/B9MgnVkTv42a4YWSP2lztrJ9gcORVGPfHOHHHbUg7hrRjT+dpFZJ48t/qZKfT
	lnUobprnYckEqjDgFj1S1YodZq+kBLxmddoZl0MQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1758232093;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=Q8VFiGK++YricJ7t1PQlXlrHAKR3NUH4QwWfgJ1snt8=;
	b=anQP0ONWWU+Zkg31GziMeRyipnW4Q4GWD4hp69WvxHaclua0bZLY1/FlT+VGNCsA
	9Jkv6NEvj2E0pNKaGS5IoebeaQQdZ29XfHEsLIZhI5poCI/MTBnDQ2T8Dl4Q9oKamz0
	z6Af05+Hc2nZC9j+NUAzwyToZ/+zHlT4QLiMHDno=
From: patchtest@automation.yoctoproject.org
To: rs@ti.com
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [oe-core][PATCHv8 4/6] weston-init: convert to virtual-emptty-conf
In-Reply-To: <20250918213053.339280-6-rs@ti.com>
References: <20250918213053.339280-6-rs@ti.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <010101995ecca344-ee88e3a5-6dd9-46b3-a410-2a94332e06ca-000000@us-west-2.amazonses.com>
Date: Thu, 18 Sep 2025 21:48:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.18-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 21:48:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223693

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/PATCHv8-4-6-weston-init-convert-to-virtual-emptty-conf.patch

FAIL: test max line length: Patch line too long (current length 256, maximum is 200) (test_metadata.TestMetadata.test_max_line_length)

PASS: pretest pylint (test_python_pylint.PyLint.pretest_pylint)
PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test lic files chksum modified not mentioned (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test pylint (test_python_pylint.PyLint.test_pylint)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test src uri left files (test_metadata.TestMetadata.test_src_uri_left_files)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
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

