Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A752C88E41
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 14:45:50 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12893.1769525143939370091
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 06:45:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jctlQjjX;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=VlAYOcj3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019bffeae5f2-0889d9c6-1a82-418b-b573-49b1fd1e7f1f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769525143; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=3AXuXmxnx4+R6ZU2q6vtZTHLzJwuaE1d6j0I/X99oGw=;
	b=jctlQjjXAtayGep5g1/ikORG/s8+9ky6KN9Lfd6qckr6HX7sMZToxc1YITvE3yte
	2CD6n7ktBXFdOwpcA5jHZRNwB5MOjdux5arkf4mstCTvOMLwTLwXWnKZmy0zXaCGimM
	lF+vppN1fjShoOARdLGGhx/bh0a+1RQtRMc66AFc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769525143;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=3AXuXmxnx4+R6ZU2q6vtZTHLzJwuaE1d6j0I/X99oGw=;
	b=VlAYOcj3EHAqaTThyamPrExW/2LOwaOqbc+uiuwFxTMBTylY+/OfAKczdomdC0PN
	7rR2/nsL33JJAjhqdo76t5hz7Fk1FpIJFgn2sWBJ4PP31ZlDr6yb3ziUdwJxO+ZTFCM
	ZixuVYPaJtpLmAycgU1TDn5rDMVUWV4UaZ3QiAeg=
From: patchtest@automation.yoctoproject.org
To: adarsh.jagadish.kamini@est.tech
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][scarthgap][PATCH] avahi: Backport fix CVE-2025-68276
In-Reply-To: <20260127142742.81887-1-adarsh.jagadish.kamini@est.tech>
References: <20260127142742.81887-1-adarsh.jagadish.kamini@est.tech>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019bffeae5f2-0889d9c6-1a82-418b-b573-49b1fd1e7f1f-000000@us-west-2.amazonses.com>
Date: Tue, 27 Jan 2026 14:45:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.27-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 14:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230049

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/scarthgap-avahi-Backport-fix-CVE-2025-68276.patch

FAIL: test Signed-off-by presence: Mbox is missing Signed-off-by. Add it manually or with "git commit --amend -s" (test_mbox.TestMbox.test_signed_off_by_presence)

PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_status_presence_format)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
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

