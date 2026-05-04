Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF64CD3423
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 06:45:53 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9330.1777877151267856478
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2026 23:45:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=o2Ldailh;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=WPBPrGYU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019df1bc6aaa-7068c06f-db57-41df-96e7-46111480b0b0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777877150; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=+3XhyEF/AJP1wQDIcJP50+pbLJACcJgEu4lxKl4FEPA=;
	b=o2LdailhjcDMlrUIqCK2FMnzw+3RnwyOnHxrzYvI0fp1WgwX0QVwzLul74snD8V+
	jNXzQcmblms5vOhl3atuS8veey75uYtmzHrQ9uzsVQRdSAxfOim7eIz0c63uenoPV//
	F3mt6DpdsAn0LfxYlMK0rlgdPYtXk6ijQbTTmyr0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777877150;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=+3XhyEF/AJP1wQDIcJP50+pbLJACcJgEu4lxKl4FEPA=;
	b=WPBPrGYUhz7I3QIOVRlWP9Dlhn0YwdGXe41VJ9Rv1f2cOR9F4nf5SZzCmVTbjcrg
	k/5plWtug5hQ1QYqgyhH4YQ7H/I/eKfoX1A5qd2ck+I0YwmuiQO0b9Qcb22O4pxvqb3
	OV9siIYsf6inbqpGORjkd4tM1k7zInZTngVBfYpE=
From: patchtest@automation.yoctoproject.org
To: Hitendra Prajapati <hprajapati@mvista.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [scarthgap][PATCH 1/3] libexif: upgrade 0.6.24 -> 0.6.25
In-Reply-To: <20260504063159.30681-1-hprajapati@mvista.com>
References: <20260504063159.30681-1-hprajapati@mvista.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019df1bc6aaa-7068c06f-db57-41df-96e7-46111480b0b0-000000@us-west-2.amazonses.com>
Date: Mon, 4 May 2026 06:45:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.04-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 May 2026 06:45:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236434

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/scarthgap-1-3-libexif-upgrade-0.6.24---0.6.25.patch

FAIL: test commit message presence: Please include a commit message on your patch explaining the change (test_mbox.TestMbox.test_commit_message_presence)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
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

