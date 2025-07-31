Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D74AEC87FCA
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 19:31:02 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.70962.1753990259701928187
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 12:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=qjB2z8Bl;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=c3EnhaZD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019861f7603e-856e6046-ae89-4b6f-8667-9cd03e408188-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1753990258; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=P/iOJodeyc3KHf8LNCuDSkkShzZDbznfqOSKBzpuFeI=;
	b=qjB2z8Bl1KqiBLn+YFkC549ol66ayYqrimvMYf4MuL9qSsvDfiyLsBMEjWsOvmGR
	rBn4S8AjQ41tLI5Pwn5lN1PI2HXKPRV+iO/Tm95iSzg7n2Vi8mF3eDTPNgzHnq9fR8E
	9e4Tu/HXI6Hi9k9c7uV//Igo5kg6R5HdIfoSgNTg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1753990258;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=P/iOJodeyc3KHf8LNCuDSkkShzZDbznfqOSKBzpuFeI=;
	b=c3EnhaZDy0C52bbjfHg4oP62hmW6I3Qwyd7iPGvpzRXY9OwAdgMpxgc2rOj305Qx
	s5AfOArX649L2eBepaMqWvtVWjAOpKPbGL52BiU5OcZrchYMhjCP2/vMjSRME/Saq+j
	WUyWRnYBlcEwEPHCoBb2E5ZznJR8dI76GrRAHaU4=
From: patchtest@automation.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH v3] clang: split lld into a separate lld recipe
In-Reply-To: <20250731191213.1382928-1-ross.burton@arm.com>
References: <20250731191213.1382928-1-ross.burton@arm.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019861f7603e-856e6046-ae89-4b6f-8667-9cd03e408188-000000@us-west-2.amazonses.com>
Date: Thu, 31 Jul 2025 19:30:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.31-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 19:31:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221207

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/v3-clang-split-lld-into-a-separate-lld-recipe.patch

FAIL: test lic files chksum modified not mentioned: LIC_FILES_CHKSUM changed without "License-Update:" tag and description in commit message (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)

PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test src uri left files (test_metadata.TestMetadata.test_src_uri_left_files)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

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

