Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E788CD8CA8
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 12:01:30 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68844.1781265687744482079
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 05:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=P+QSQk3j;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=QaEDjw4j;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019ebbb56184-ecfb7a31-e0d7-4d94-9a63-37198fcf30c7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781265687; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=kkeyxXAX/sIu/podwWCpKns4Yr6f+CcLQbIVuog5Syc=;
	b=P+QSQk3jHgiT7IQH5bo+BVYj3NGVpfSxfHPASD8AuqeAOCn+QuGkkKa6lMecTdJf
	t1f7zeiFxvt/2lltqh5f4W4R40cBeN0OpWatAbGi91f9nKHg6EB/y82g/IgbPkMEJfq
	os+61e6TjC19wzNW6+V5b39lcWPpsWh3WNpg+uZU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781265687;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=kkeyxXAX/sIu/podwWCpKns4Yr6f+CcLQbIVuog5Syc=;
	b=QaEDjw4jtOjSWrZrL+06LDPLP8d0DXKkDfbziiScGLOav0EcqPkPNeySBSBDKd99
	YiGqD3zkdWCru1YYQGyCyty3xfbWwYxyowCQt0r8Oc1ChFOVCfjiEWJMIZsbW2crhzV
	mgIXWJ/E9dxRzCYqvmYquBKprppFULgMLOttQrWc=
From: patchtest@automation.yoctoproject.org
To: =?utf-8?q?Ulrich_=C3=96lmann?= <u.oelmann@pengutronix.de>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH] terminal.bbclass: fix typo
In-Reply-To: <20260612114506.939340-1-u.oelmann@pengutronix.de>
References: <20260612114506.939340-1-u.oelmann@pengutronix.de>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019ebbb56184-ecfb7a31-e0d7-4d94-9a63-37198fcf30c7-000000@us-west-2.amazonses.com>
Date: Fri, 12 Jun 2026 12:01:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.12-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 12:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238603

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/terminal.bbclass-fix-typo.patch

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

