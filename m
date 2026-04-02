Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3E2111224B
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 00:30:48 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5573.1775089846500938518
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 17:30:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ByRuKvTT;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=GNNNSRWz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019d4b9984fe-c4a51397-c694-4e96-b2c6-ae74620ba018-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775089845; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=yOvvpw7NqDpBGlaFHLjpCnBEKHnc8PcDtQ4Qnl8E7wg=;
	b=ByRuKvTTDD4lj20/Be/R4CQ2CcCl6ewcULOnEaD3a3I45uuA+Y43oOVpm0eFWNUR
	mKJNMuXxexORjrLdEwgLzBcbE+/yPGs4eUGLfJsBYTyWAGOTMR9OyURnnb0qhZIgio2
	4dnNiXLXEDlizX21DAZcshswaprlH7V489z7OYe0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775089845;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=yOvvpw7NqDpBGlaFHLjpCnBEKHnc8PcDtQ4Qnl8E7wg=;
	b=GNNNSRWzD50yzS+orQGcRTV+RAalgNbv3/7j4NEZSlDXHrOC4nC7CTLCAXIX+Dqn
	crYdfxnEsrqn0s3pVrUmSUBZ6mMvfneJgEgyHQrbxJ2EjsQKk1kF2ImW+C7EjIQk8Dk
	5KjtUkNtvGhxiunZjZcR5oLg2AgGlqTGDnfpvWaU=
From: patchtest@automation.yoctoproject.org
To: martin.jansa@gmail.com
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH] native/cross: ar wrapper: don't prepend 'D' when @<file> is
 used
In-Reply-To: <20260402001458.1717490-1-martin.jansa@gmail.com>
References: <20260402001458.1717490-1-martin.jansa@gmail.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019d4b9984fe-c4a51397-c694-4e96-b2c6-ae74620ba018-000000@us-west-2.amazonses.com>
Date: Thu, 2 Apr 2026 00:30:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.02-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 00:30:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234469

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/native-cross-ar-wrapper-don-t-prepend-D-when-file-is-used.patch

FAIL: test commit message user tags: Mbox includes one or more GitHub-style username tags. Ensure that any "@" symbols are stripped out of usernames (test_mbox.TestMbox.test_commit_message_user_tags)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
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

