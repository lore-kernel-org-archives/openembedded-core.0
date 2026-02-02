Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69550E7DF19
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 17:16:20 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.58443.1770052577915720341
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 09:16:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ROoR5k4F;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=NFIEsmoe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019c1f5ae750-18491d5c-352e-4716-8f34-2c8df5fb6584-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1770052577; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=h1VtPu00oPEjNgS5yjzMGiwY+g1qtJhEOypIVJJA0nU=;
	b=ROoR5k4F+sUlJz8mYbwT5xdGKE3VjuMYUiQ2aFJnUNXttI6RPLIbyFY+JAuWjCoe
	142LD7I2twrfLTz4s1Bd7Q09gSQoggISggsGDDV8Borxi+JdLUNdE94ouXP/aV4ix72
	k3omcD5cyeXh4AZQAu05d/HZFa4Yy99ql0cQTwCQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1770052577;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=h1VtPu00oPEjNgS5yjzMGiwY+g1qtJhEOypIVJJA0nU=;
	b=NFIEsmoe2V34CN+TJhNvfCmz5sQBXZmTcpaHVAzE6Py9DDfwlAy84dKj37KOmcoZ
	Sy8UOIoqKO3ojyHes2Ho1XdKr05J0rnmY/EvBuIwc15/1iKNRPL0ZvZ8WtsVPdToBsm
	8gYNe6Nj8+1tc4wcxd1IxDrCS+pxNsTG90JCi8RI=
From: patchtest@automation.yoctoproject.org
To: Trevor Woerner <twoerner@gmail.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [RFC][PATCH v2 7/9] oe-selftest -r wic.Wic -> PASS
In-Reply-To: <20260202170800.4172778-8-twoerner@gmail.com>
References: <20260202170800.4172778-8-twoerner@gmail.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019c1f5ae750-18491d5c-352e-4716-8f34-2c8df5fb6584-000000@us-west-2.amazonses.com>
Date: Mon, 2 Feb 2026 17:16:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.02-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 17:16:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230394

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---

Testing patch /home/patchtest/share/mboxes/RFC-v2-7-9-oe-selftest--r-wic.Wic---PASS.patch

FAIL: test shortlog format: Commit shortlog (first line of commit message) should follow the format "<target>: <summary>" (test_mbox.TestMbox.test_shortlog_format)
PASS: pretest pylint (test_python_pylint.PyLint.pretest_pylint)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test pylint (test_python_pylint.PyLint.test_pylint)
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

