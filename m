Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C4F0CD4F24
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 17:46:26 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.81491.1778607983594765840
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 10:46:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=m+9GftG7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ncZUMcQz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019e1d4c08b3-1cbce957-130b-485c-a707-8cb48fb14c3c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778607982; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=QZzeMIawFeerO4Vg3cstn2uzwq87+j7CHXLsZEPOobI=;
	b=m+9GftG7wTByngz8xgydv54SZw1lmeF9BIHKjTwT+YCVrIOwfu57dMYLnbWrGjRo
	pixnjSeYU2I87pIQfoLI0qwpjdzXvBx2BHWOTcjHvUK+llxZth2glDqMqW48s3KVr3V
	ZKZ8FvWW2nV/WRrniSxkqVnZRpqXCF0VonnzKSXE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778607982;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=QZzeMIawFeerO4Vg3cstn2uzwq87+j7CHXLsZEPOobI=;
	b=ncZUMcQzTE4i0WjhUtyaFOk6yj/Y6u+L3z3oMenAWwuypuoXItjXN0qMs68MVsF1
	8k01AocDswUcIhubCRKhPlD9vVmO+JpZZ/QGolg9VhvOFEGO2Zijz5rKCim+qE3KAiy
	iZ57d/OmGuovK56yJw4bFP1QloHZjMjNn39q/+Ws=
From: patchtest@automation.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH 2/5] libportal split out gtk libs
In-Reply-To: <20260512173702.4114193-2-ross.burton@arm.com>
References: <20260512173702.4114193-2-ross.burton@arm.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019e1d4c08b3-1cbce957-130b-485c-a707-8cb48fb14c3c-000000@us-west-2.amazonses.com>
Date: Tue, 12 May 2026 17:46:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.12-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 17:46:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236903

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/2-5-libportal-split-out-gtk-libs.patch

FAIL: test Signed-off-by presence: Mbox is missing Signed-off-by. Add it manually or with "git commit --amend -s" (test_mbox.TestMbox.test_signed_off_by_presence)
FAIL: test commit message presence: Please include a commit message on your patch explaining the change (test_mbox.TestMbox.test_commit_message_presence)
FAIL: test shortlog format: Commit shortlog (first line of commit message) should follow the format "<target>: <summary>" (test_mbox.TestMbox.test_shortlog_format)

PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
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

