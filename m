Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 919F5E7DEEB
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 14:01:28 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53131.1770040880048136433
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 06:01:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=c0zYW21l;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=U+gPm7yR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019c1ea86847-3b06c070-0f2b-498a-8fa3-92d7d7db90f5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1770040879; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=hMDb1Qsgpsis9Z3o3mrih8aGWoYwEIAH4llDswFbQrk=;
	b=c0zYW21lv/+F9y7B51NhT93NFQ+ZzHCRoVNfa5kzhK7L6LlGpMYXEid/KTVpWomv
	KvY8ixoCuQJtnfEbQthGKvMDJoTAOQOjkSy4daI+Eeda2oJvZ+wdWl/Q9cnuywEatXy
	xrDNqmWmMQW9j+DFmEAElPCdKZPD0Gjc/cqwBUSA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1770040879;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=hMDb1Qsgpsis9Z3o3mrih8aGWoYwEIAH4llDswFbQrk=;
	b=U+gPm7yRxDKRbGoXhaorgnedak1ThA20mQbtw/DFh6ViUHwPQeWHLdNQeRIWY9UZ
	AfpHuYLf0rTcyXqua8Zia86vDzkV6byTuxTxTGIffp0N2r0VNLAFbgHPDQai5tfkR8W
	FstKnQb9w62dSexp98djOBwL6oKmxUW2HE8xfqls=
From: patchtest@automation.yoctoproject.org
To: Trevor Woerner <twoerner@gmail.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [RFC][PATCH 7/9] oe-selftest -r wic.Wic -> PASS
In-Reply-To: <20260202135414.682558-7-twoerner@gmail.com>
References: <20260202135414.682558-7-twoerner@gmail.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019c1ea86847-3b06c070-0f2b-498a-8fa3-92d7d7db90f5-000000@us-west-2.amazonses.com>
Date: Mon, 2 Feb 2026 14:01:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.02-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 14:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230367

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---

Testing patch /home/patchtest/share/mboxes/RFC-7-9-oe-selftest--r-wic.Wic---PASS.patch

FAIL: test shortlog format: Commit shortlog (first line of commit message) should follow the format "<target>: <summary>" (test_mbox.TestMbox.test_shortlog_format)
PASS: pretest pylint (test_python_pylint.PyLint.pretest_pylint)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test pylint (test_python_pylint.PyLint.test_pylint)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
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

