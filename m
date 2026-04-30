Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD714FF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 09:00:48 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15871.1777539645965222798
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 02:00:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=MnPjNrzC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Kqov81Qx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019ddd9e7e9e-4f8986ca-d2ac-406e-950b-89a51d34dea2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777539645; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=4AT1wGGEsAVrF2zj3KRuv56Aj72XK/tbreaNm6zdZEo=;
	b=MnPjNrzCdOtIEiC3YjjlXbItELewxr4Grz5RNBqKoc1I89rL//xAHSGg3ZmNU/Wp
	t1JKC90SltY7BxnRn9w9aKnInMhMfwTuGCg5Sd7fYV6YW6cTPFwflkP9VzmAXK03ngD
	o/UV6M1tdLjEr99c90Opo9X/9S+x7FGFI1j6qkb8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777539645;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=4AT1wGGEsAVrF2zj3KRuv56Aj72XK/tbreaNm6zdZEo=;
	b=Kqov81QxAXpbjWDjbd+rlTcYLu+BugHYA6zpbI2vOeTQD+oiWvx3n9WE4WZgXcL1
	jh0W3EuvO5/zvR8JLV3th3dYCi2xRnm2Z81oz13FS/gND362XtULUeGHwqwUsGK9DF6
	2Hl1U2WPWPynlHLMreNRLqpNb0pveqiXDat/I4TA=
From: patchtest@automation.yoctoproject.org
To: Moritz Haase <Moritz.Haase@bmw.de>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH] devtool: Disable gpg signing when setting up source tree
 repos
In-Reply-To: <20260430084724.116381-1-Moritz.Haase@bmw.de>
References: <20260430084724.116381-1-Moritz.Haase@bmw.de>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019ddd9e7e9e-4f8986ca-d2ac-406e-950b-89a51d34dea2-000000@us-west-2.amazonses.com>
Date: Thu, 30 Apr 2026 09:00:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.30-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 09:00:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236149

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/devtool-Disable-gpg-signing-when-setting-up-source-tree-repos.patch

FAIL: test Signed-off-by presence: Mbox is missing Signed-off-by. Add it manually or with "git commit --amend -s" (test_mbox.TestMbox.test_signed_off_by_presence)

PASS: pretest pylint (test_python_pylint.PyLint.pretest_pylint)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test pylint (test_python_pylint.PyLint.test_pylint)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
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

