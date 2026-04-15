Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D07DF4384E
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 15:45:51 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22392.1776267947883574594
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 08:45:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=m8iMaVYO;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Q4FC3iJC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019d91d1ebb6-a8fdc682-9e58-4eb7-bf5c-1c287bb4b302-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776267947; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=1ZNgdO8Dz0whkzdxwVqOffs9wr14xOLh+JkP5uZMxHg=;
	b=m8iMaVYOHDrH+Mr49mrtm0zy2U2w2eWsKMBac+Co2wr0D9sL63pc1jeFn1CfWJ39
	dzhvwpB2CtI2+Qm52raxBvf9ccTzbHqBUBpBwxcPJGgTqrIIJx41JKh2CZGAiIYKrpv
	nYqitYIyfjnaZy7VG9eY+2DzXL4d1YcGhHFrY+II=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776267947;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=1ZNgdO8Dz0whkzdxwVqOffs9wr14xOLh+JkP5uZMxHg=;
	b=Q4FC3iJC7sIQxphv9NPKJVcNcyGh7K5Eer2EcxX8FUuZil3/BPyAhziOE+nzRVyF
	DC+/5UhP1VJ0EuEio1Lla67KWGjc0FtLgBX6IDx+LuAl+NgbR4Ltv07ZfMCBt5QHYmu
	pcSIL0fFNPxoL793ABcGV55v+jvD4Df22mLFOU14=
From: patchtest@automation.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH 2/2] rsync: update comment about out-of-tree builds
In-Reply-To: <20260415152742.1597025-2-ross.burton@arm.com>
References: <20260415152742.1597025-2-ross.burton@arm.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019d91d1ebb6-a8fdc682-9e58-4eb7-bf5c-1c287bb4b302-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 15:45:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 15:45:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235312

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/2-2-rsync-update-comment-about-out-of-tree-builds.patch

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

