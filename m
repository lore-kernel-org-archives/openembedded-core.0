Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56628CD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 08:45:51 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24017.1780303549087641985
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 01:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=tM/vC9qx;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=q0HgSw6t;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019e825c4f85-f0321076-b0d7-4bcc-ab21-a596ecf1bb20-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780303548; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=u8FbXxoi+AGbxqEJgrTjiSpzb4tMdSdKhz6m/KzBpSI=;
	b=tM/vC9qxTFzQriENPvhBi/Cj44wYI730OM56UZFtWTy7KDqbIoolnlq/tDtg7xJ1
	ilP/LAym8PchC3AzSFgAm9X4CNZkmI9CI6vAyVPn7yXl01n059BuLCO30pHQ9H5vaYP
	2oB/BFnC6FBvkildTbSOlOuXEQTTxg/IROsXseZI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780303548;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=u8FbXxoi+AGbxqEJgrTjiSpzb4tMdSdKhz6m/KzBpSI=;
	b=q0HgSw6t2DEILxgf9oCl1ZYyXVXCyT9Q16iIC8dgvsz1GtlsJHkB6ER6A6+AhUGK
	Wxs0wUwjojXV8ltUMjkQ2rqTpQktMmmnZgSSSrBb7qrmmWuKv2+ro1Oz0k8AgVr/MlA
	b5oZShwjccExel04DBJ8AI7GiSQZxbE3T7zEws/E=
From: patchtest@automation.yoctoproject.org
To: Aditya GS <adityags2004@gmail.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH] gawk: improve randtest stability
In-Reply-To: <20260601082006.1496-1-adityags2004@gmail.com>
References: <20260601082006.1496-1-adityags2004@gmail.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019e825c4f85-f0321076-b0d7-4bcc-ab21-a596ecf1bb20-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 08:45:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 08:45:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237827

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/gawk-improve-randtest-stability.patch

FAIL: test Upstream-Status presence: Added patch file is missing Upstream-Status: <Valid status> in the commit message (test_patch.TestPatch.test_upstream_status_presence_format)

PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test bugzilla entry format (test_mbox.TestMbox.test_bugzilla_entry_format)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
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

