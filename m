Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A38D3C920
	for <webhook@archiver.kernel.org>; Sat, 19 Oct 2024 16:19:04 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.9003.1729354742670091551
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Oct 2024 09:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Ni/gh6ad;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=fga/MZ78;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010192a593370a-4cc220e6-f982-4a19-86d0-9cfc88584fc2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1729354741; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=7YqAPV+iMjs61n+0SAGqV9tMw1scEK2rW3sgpDcwx2k=;
	b=Ni/gh6addPiBGlHIaM36PeSDtbIIbf3RWbW9ibPT/xwC/1ysCfCrk79C3vZlm198
	Jd7rInB6QV2Vg42l870yv7M3Zj/hC+wgfd5l0sLACSCmOnCWxRRhd9uarjVV1LL21Px
	4Q4teFYN3TjX3sRGSr31aBe340FtCZ4sdRuXDr+c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1729354741;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=7YqAPV+iMjs61n+0SAGqV9tMw1scEK2rW3sgpDcwx2k=;
	b=fga/MZ78ol5Jz8BAq8CyzHL6N00Isp7Cgz62lR6rwWUT3BDz+uVgIsjUB56r/sH9
	jIZotPLJ7/vV1dZiposdTaZJgLr+KdpNzif2tcPhH9TvBjrdUG6308dAbGa50xKSmhM
	3hMEUzA2RM3z8ia01wn/IXQ/w/AFfkGR2SWUaLpc=
From: patchtest@automation.yoctoproject.org
To: Andrej Valek <andrej.v@skyrain.eu>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][PATCH v3] busybox: 1.36.1 -> 1.37.0
In-Reply-To: <20241019160221.47501-1-andrej.v@skyrain.eu>
References: <20241019160221.47501-1-andrej.v@skyrain.eu>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <01010192a593370a-4cc220e6-f982-4a19-86d0-9cfc88584fc2-000000@us-west-2.amazonses.com>
Date: Sat, 19 Oct 2024 16:19:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.19-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Oct 2024 16:19:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206084

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/v3-busybox-1.36.1---1.37.0.patch

FAIL: test src uri left files: Patches not removed from tree. Remove them and amend the submitted mbox (test_metadata.TestMetadata.test_src_uri_left_files)

PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_status_presence_format)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test lic files chksum modified not mentioned (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
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

