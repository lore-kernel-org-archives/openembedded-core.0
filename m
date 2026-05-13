Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D81CD4F24
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 10:14:36 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4233.1778667266736808819
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 03:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gFPCC0DC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jFR7ad3j;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019e20d49f1c-203df1c5-fbae-4e43-b569-ffcf994e9bda-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778667265; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=YStu8qvxCbWha2Xzy8T2OZxZgCNSYj9mjpb03O558zI=;
	b=gFPCC0DCPIa81p7ct/zo0EB66qrj0at8Ffh6LtxkdEAiVmNvy99ajvsXX/d9WVLR
	qb9XI70oGJrNxR9iELJZKu5dCb6ZYC7LKIS9UkSelkAyeOow0rvI23ewXdCo5OF/BRO
	Z3yJd///4/GObJv+OPqhhUOUh6KQD+E6h7vxJH+0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778667265;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=YStu8qvxCbWha2Xzy8T2OZxZgCNSYj9mjpb03O558zI=;
	b=jFR7ad3jr8o+3UTFeEpQSq+BDAI2hMhJSZxN5RHvREotvL+p76dZnP/PNvo2rGFQ
	Cp7kJztCyJoFKYXrhmlJKaHvp1GcqnNJoi2NfIVpLvRkSJwjZ3GZIGl42FSKvUSBGYm
	3FByRv66BMzuj8I60ki7UDyFsK/rbooY4eQexx1E=
From: patchtest@automation.yoctoproject.org
To: Changqing Li <changqing.li@windriver.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [meta-selftest][PATCH] meta-selftest/files: add
 postfix/vmail/postgrop to static-passwd/-group
In-Reply-To: <20260513072651.2235181-1-changqing.li@windriver.com>
References: <20260513072651.2235181-1-changqing.li@windriver.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019e20d49f1c-203df1c5-fbae-4e43-b569-ffcf994e9bda-000000@us-west-2.amazonses.com>
Date: Wed, 13 May 2026 10:14:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.13-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 10:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236958

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/meta-selftest-meta-selftest-files-add-postfix-vmail-postgrop-to-static-passwd--group.patch

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

