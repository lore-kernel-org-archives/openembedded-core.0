Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B02FC77B7C
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 13:49:16 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.23135.1751550548907977777
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jul 2025 06:49:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bJ/UF9nj;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=kTFJxYNH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010197d08c5818-3f5aaf18-6f85-466c-bbce-f34ed9768245-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751550548; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=CgAPbEHi8bieFzsWQqmvZLBz/HohmjcB6u+qQOn4zbQ=;
	b=bJ/UF9njzhYW+ZpTmGW0Ua5RVSOxM3M9EFAVCYzESP5xNGyNiRcbvyqynW1X4Eng
	Jg9MouBOJDoRn8ViGxy5KErCJmtE/qadbRlmg+A2ArRo6qM7EuhvKD3+lNhZ6uDM2s/
	Ip6up4PqHOZ3JziI2zoPqnu69KxzlR4AXmwwYCuQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751550548;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=CgAPbEHi8bieFzsWQqmvZLBz/HohmjcB6u+qQOn4zbQ=;
	b=kTFJxYNHqO4XXw+n/JrhQeBTgUlgGvsAkw846TRzNZhQe4AyeiIi0tKpRuv6Ntgj
	VJP5mxbAjTSOqvz9S/3oyzbGFgn9pDDiX6chPvJl26fCKV1CHRRumIpglvRsBTHmGiQ
	Dzt+r3etCDMu+r+RRAf3aTa8848zZvTBqnlvuTkE=
From: patchtest@automation.yoctoproject.org
To: Moritz Haase <Moritz.Haase@bmw.de>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH v5 7/7] cmake: upgrade 3.31.6 -> 4.0.3
In-Reply-To: <20250703132720.3378569-8-Moritz.Haase@bmw.de>
References: <20250703132720.3378569-8-Moritz.Haase@bmw.de>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <01010197d08c5818-3f5aaf18-6f85-466c-bbce-f34ed9768245-000000@us-west-2.amazonses.com>
Date: Thu, 3 Jul 2025 13:49:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.03-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 13:49:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219889

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/v5-7-7-cmake-upgrade-3.31.6---4.0.3.patch

FAIL: test src uri left files: Patches not removed from tree. Remove them and amend the submitted mbox (test_metadata.TestMetadata.test_src_uri_left_files)

PASS: pretest pylint (test_python_pylint.PyLint.pretest_pylint)
PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test lic files chksum modified not mentioned (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test pylint (test_python_pylint.PyLint.test_pylint)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
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

