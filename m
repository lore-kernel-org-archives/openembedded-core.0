Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CBA7C5CFE7
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 22:00:51 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8711.1771624845007043153
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 14:00:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=xY4Bw6rn;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=MyM0ZHHF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019c7d11cb53-c9036152-8f64-4f5b-8a84-695b993831a5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771624844; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=lCBsUdtI8M1GkUKqCkuJJHybDHOLmOUNRKbJGIQ+EQ4=;
	b=xY4Bw6rnMiZqtCAdmy00QI9wHF57pVRm2tZfyjNuD0qI43ZEu98Ms8Vgt5kqsvQw
	alSWJnknr5/sl12UhCl9P/FGesJJ9jiTJYTbmzIrmcbST19I0clnLpAzYQT8zTHu3f7
	Ja93yGp419zYgq2R7b5maisKff1GqNWBfT4sSCsc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771624844;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=lCBsUdtI8M1GkUKqCkuJJHybDHOLmOUNRKbJGIQ+EQ4=;
	b=MyM0ZHHFt4UM0DF2kQ/SwxbaF/JG0W6P8uu7jORQRsiqPtj4XujGaFZf1dWrXBKL
	cSp5XBunFJLVhvRWFDumZ1P3tGtcHxZblp0xnJ8UcQJj1WM76KLOylltklcibwdnf6L
	hrScS3kvPMlOZQa9Kh0Jc2VnjxUUeFsm/kt64B/k=
From: patchtest@automation.yoctoproject.org
To: Livin Sunny <livinsunny519@gmail.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][scarthgap][PATCH] busybox: Fixes CVE-2025-60876 malicious
 URL can be used to inject HTTP headers in the request.
In-Reply-To: <20260220215043.2883581-1-livinsunny519@gmail.com>
References: <20260220215043.2883581-1-livinsunny519@gmail.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019c7d11cb53-c9036152-8f64-4f5b-8a84-695b993831a5-000000@us-west-2.amazonses.com>
Date: Fri, 20 Feb 2026 22:00:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.20-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 22:00:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231553

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/scarthgap-busybox-Fixes-CVE-2025-60876-malicious-URL-can-be-used-to-inject-HTTP-headers-in-the-request..patch

FAIL: test shortlog length: Edit shortlog so that it is 90 characters or less (currently 94 characters) (test_mbox.TestMbox.test_shortlog_length)

PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_status_presence_format)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
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

