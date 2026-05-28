Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 448D9CD4F54
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 21:30:56 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21312.1780003852982216848
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 14:30:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=nFqdc1Ou;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=sGd6KkPY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019e707f4f5a-9a72d5d4-6549-4b7a-bfd8-88596d80a968-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780003852; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=566cTS/xHzlTOe+ff8JEEbc1NRX68rzn7Y6iXJCSbqM=;
	b=nFqdc1Ou1uwqSCnIqeLuhj0DX6PeUfJU6ydvV4hA41+xPEYJdo8BoOESFPMNp1dv
	1iagwEKTxoA05VsRRsmFM92NVHv54Wve4sDzAmeoqEhHGinNhUjvE2BYXcuCENTGSxZ
	zUD7gF00v2XDi5+RYaQ5ak8cMb/JnXe3tolVQTEw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780003852;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=566cTS/xHzlTOe+ff8JEEbc1NRX68rzn7Y6iXJCSbqM=;
	b=sGd6KkPYqpLuprXPKtsiHbxCWnsjEm34cH/BIXEVweWKyYSPQdn9ObiQ/FBZbcY9
	lVFEj2ySoIZmJbakNLX/R1lpq5XSUtEXAmP010wseuh4jZIcvC2rTh+DUcdjK4JVQt2
	eEylk8C5VcNPO1hPb4U6E4mo1KNhevzfGwF31aDI=
From: patchtest@automation.yoctoproject.org
To: Aditya GS <adityags2004@gmail.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH] gawk: backport randtest stability fix
In-Reply-To: <20260528184427.517-1-adityags2004@gmail.com>
References: <20260528184427.517-1-adityags2004@gmail.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019e707f4f5a-9a72d5d4-6549-4b7a-bfd8-88596d80a968-000000@us-west-2.amazonses.com>
Date: Thu, 28 May 2026 21:30:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.28-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 21:30:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237735

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/gawk-backport-randtest-stability-fix.patch

FAIL: test Signed-off-by presence: A patch file has been added without a Signed-off-by tag: 'randtest-fix.patch' (test_patch.TestPatch.test_signed_off_by_presence)

PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
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

