Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7AB1E9A037
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 18:45:48 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19575.1771353944626904164
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 10:45:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=G1sRIPNW;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ERCq8E3C;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019c6cec2d46-afd22d02-1c5a-4e95-be3a-8f40c7794983-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771353943; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=9526LBXixO0fAYd5847poy7T/8nv4xXdcXoa2B00SZ8=;
	b=G1sRIPNWMyr/taEUqC9QxY7aWy4VgNiyDUjDo+0prI9y6+2yGLck3tsNeYjOfX6o
	clmFqPOWGgFJbe93S1Dg5tgRdlDAltS0KqN0Wy7vZ4412kQFLhd/1O/LMUOADlkOtt6
	ctem8xAgkYthvOD6O7OtApUbbVVFOuh4Nb8sH1Kk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771353943;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=9526LBXixO0fAYd5847poy7T/8nv4xXdcXoa2B00SZ8=;
	b=ERCq8E3CnoSrTQYfOSUwoDutqs1aBYj7X3AdSUNkvDpqI12ejNAqbE0zWhP/T+w1
	AR6ksfrPoVC3Fa29Wg3pecyWMcIZIV1jccSQaUSB2GkNZGFpbQk3Fpac0qRE+ehiS6T
	CX77nThxQVtnb8zOKiv6C8J4E561twoV8yKRbSZo=
From: patchtest@automation.yoctoproject.org
To: Adam Duskett <adam.duskett@amarulasolutions.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH 1/1] rpm-sequoia: upgrade 1.10.0 -> 1.10.1
In-Reply-To: <20260217183053.4036432-1-adam.duskett@amarulasolutions.com>
References: <20260217183053.4036432-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019c6cec2d46-afd22d02-1c5a-4e95-be3a-8f40c7794983-000000@us-west-2.amazonses.com>
Date: Tue, 17 Feb 2026 18:45:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.17-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 18:45:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231269

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/1-1-rpm-sequoia-upgrade-1.10.0---1.10.1.patch

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

