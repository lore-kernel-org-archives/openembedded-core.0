Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE41CD5BC9
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 01:45:54 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2136.1779932753086547330
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 18:45:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Y5S9apLA;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=4Hr/AsrX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019e6c4268ee-d51fbe88-f169-4bd0-b99f-906924b33fd1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1779932752; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=bajEP/5fyzhkZnYm7i3aFPUeHUcQ3Hi1X/LEsgFwXn0=;
	b=Y5S9apLAP4vZb2TdEKyGXbv8OZV5p9YHI16f3+VWf+vCeghhlVNzXiw1DqpcelZB
	16bywZUB7iiD/q/QpnrVT5IUzrYvUppiRkENiirx8VTLsO7udkzrrIlXumWmtqyanQc
	2TcWDQc/bh55uCP/ZQcrSTJwfdw9bvAZ7YjUXuNQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1779932752;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=bajEP/5fyzhkZnYm7i3aFPUeHUcQ3Hi1X/LEsgFwXn0=;
	b=4Hr/AsrXM/XkKJhLOoSNt0D6cJgrJx3UMxGvgzQlQbKHIaHzDTecBvLuyq57YXyt
	gJg/ipGljR/ThpYeIwf3kO4jZoBRt5wlW3cCPR2bVuLz6qP+9HKNi4C4c9WcrPJ2Alz
	iBTnu69x+LdW/sp7kFiintBOLdX6Y74MtPHSM5+I=
From: patchtest@automation.yoctoproject.org
To: haixiao.yan.cn@windriver.com
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH v3] subversion: fix svn-revision.txt conflict when building
 for qemux86-64
In-Reply-To: <20260528012701.1834030-1-haixiao.yan.cn@windriver.com>
References: <20260528012701.1834030-1-haixiao.yan.cn@windriver.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019e6c4268ee-d51fbe88-f169-4bd0-b99f-906924b33fd1-000000@us-west-2.amazonses.com>
Date: Thu, 28 May 2026 01:45:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.28-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 01:45:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237677

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/v3-subversion-fix-svn-revision.txt-conflict-when-building-for-qemux86-64.patch

FAIL: test Upstream-Status presence: Upstream-Status is Inappropriate, but no reason was provided (test_patch.TestPatch.test_upstream_status_presence_format)

PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
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

