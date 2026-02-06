Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 320CCEE6B44
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 17:31:05 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2995.1770399064327906599
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 09:31:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gZt4Tyn+;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=WAPEs+bI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019c3401ddc1-fce5ad19-d9f9-42f0-b62a-d81109123b16-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1770399063; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=NwV38OU8KiVSk85GY3znasZgPX+ECLDtWzToKgCcMFc=;
	b=gZt4Tyn+0C4GqoeOaQ83ZoAdwgnbtF7wXnUX64qOGqdnspjOFWA4I7IZ1Gj7ImgS
	eqVv+3aXfn+9/seKzRqXeo3B34L/v4H5BnuA4YlzOkxwWokTbddyMM63Ut1Vmvw+gEj
	urP8FZ2xBLsTXLUQHblrXFNUivQuvtlUPs8/t2lY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1770399063;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=NwV38OU8KiVSk85GY3znasZgPX+ECLDtWzToKgCcMFc=;
	b=WAPEs+bIBm0eWbWpzQYrmmsD420+FmNwxh2tSVGzv3uz1xYGyvzcd7wiuHkOaw5m
	rvHVrsNIoO5s7jgLxyMTHUQkj0qDkfvDSlteDU1n18hhPJ2QTPQGlbSmE8ITWba7fia
	WvOOzr+cG9Qg8c0y2t9Tv4o2iTqgfnvNmuNc7Z/A=
From: patchtest@automation.yoctoproject.org
To: Quentin Schulz <foss+yocto@0leil.net>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH 6/7] add mesa-tools native-only recipe
In-Reply-To: <20260206-mesa-tools-native-v1-6-166935b0e379@cherry.de>
References: <20260206-mesa-tools-native-v1-6-166935b0e379@cherry.de>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019c3401ddc1-fce5ad19-d9f9-42f0-b62a-d81109123b16-000000@us-west-2.amazonses.com>
Date: Fri, 6 Feb 2026 17:31:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.06-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 17:31:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230639

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/6-7-add-mesa-tools-native-only-recipe.patch

FAIL: test shortlog format: Commit shortlog (first line of commit message) should follow the format "<target>: <summary>" (test_mbox.TestMbox.test_shortlog_format)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)

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

