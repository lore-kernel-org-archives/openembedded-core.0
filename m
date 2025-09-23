Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D20CAC5B0
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 23:03:54 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.91.1758668628959379315
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 16:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=j15u3a0b;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=oNED5wDh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019978d1a06e-3265bd57-7c8a-458c-83c6-0187506c56c5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1758668628; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=fwp3Oas2TdPJU5dOQ2FSPgWcyuUIuGP+ZIsAPdmDJa4=;
	b=j15u3a0bwCreGj2m3zgGHXGF5+pDegPnInCEkeQf0g1DMW4iH1nt1QDEIRdYEW8M
	oXuY9OiUq1WxFufn4ovOIImMNQ0YmIW922axNfrb4gNZqzg+zAORwCVHons39OnHXR1
	gkwlYYKLboPirAXOnrWR4Sa8QgqBKiQQldr7VoQQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1758668628;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=fwp3Oas2TdPJU5dOQ2FSPgWcyuUIuGP+ZIsAPdmDJa4=;
	b=oNED5wDhyBCQQTT+BYgBISnwny7IaUhTO/DD58PQvgN9qZKzQuHSzSlMoD/o5iWa
	ffwE2MuVx9pfoCNmj1kHvdjWezAAJGFL7TUCOifTT8Hdil1DsKg15kkv9fQuOeIKuZU
	2IXG0ZlvmZnieh4xmhjiHLSXl//BkJlx/olyf8Wg=
From: patchtest@automation.yoctoproject.org
To: rs@ti.com
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [oe-core][PATCHv10 4/7] weston-init: convert to virtual-emptty-conf
In-Reply-To: <20250923225150.2407390-5-rs@ti.com>
References: <20250923225150.2407390-5-rs@ti.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019978d1a06e-3265bd57-7c8a-458c-83c6-0187506c56c5-000000@us-west-2.amazonses.com>
Date: Tue, 23 Sep 2025 23:03:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.23-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 23:03:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223941

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/PATCHv10-4-7-weston-init-convert-to-virtual-emptty-conf.patch

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

