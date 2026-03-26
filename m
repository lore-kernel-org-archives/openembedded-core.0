Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF574109C047
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 10:30:50 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44311.1774521047980469003
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 03:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=01iJ6bZa;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=O43aaz61;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019d29b25820-7c47b118-41c7-4904-b842-6d6eb99f709a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1774521047; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=UqBnS2bHv95Mmqv16y6bVhoEwXzV1Cl/izuZ/5tdu4Y=;
	b=01iJ6bZaaHRVSJCcS7o6HgwTQdDVNQlCOsBr8DAe2uWn8GDCr8rYIizSEzJWvjhP
	dTmzq0xqzppg5HPmQ52rBFfJvqZRoHXWU6yPqMpx10GwE98/6CgyaD+o9qsN+mYJbDI
	B6KIXhbdRvYLWzZZrrqmT14UztrfGlwPMEdjRP2M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1774521047;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=UqBnS2bHv95Mmqv16y6bVhoEwXzV1Cl/izuZ/5tdu4Y=;
	b=O43aaz61BekVXpZKctwRo6RjrQnUIfnEt+wGuO2MAJnPj21DjAkdn1jLnVEHM+WY
	D/C9AUBbuaom9kclZyqPk8c0+SdI+3bfw6+tIfOPU+4MP/dUzAWUEiYm0ecouPPdKVN
	bxvTX0dLTXzoyOUCB+81zGUAm44SHwfDyaiF7TqA=
From: patchtest@automation.yoctoproject.org
To: liezhi.yang@windriver.com
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [meta-openembedded][PATCH 1/2] gtkmm3/gtkmm4: not set BPN
In-Reply-To: <20260326102150.1059814-2-liezhi.yang@windriver.com>
References: <20260326102150.1059814-2-liezhi.yang@windriver.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019d29b25820-7c47b118-41c7-4904-b842-6d6eb99f709a-000000@us-west-2.amazonses.com>
Date: Thu, 26 Mar 2026 10:30:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.26-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 10:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233968

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/meta-openembedded-1-2-gtkmm3-gtkmm4-not-set-BPN.patch

FAIL: test target mailing list: Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists (test_mbox.TestMbox.test_target_mailing_list)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)

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

