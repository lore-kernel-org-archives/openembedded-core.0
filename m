Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AAA6E94625
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 23:16:00 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8089.1770678953828737987
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 15:15:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hDzfPg/P;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=pPh8x+fg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019c44b0a444-60a801b4-857b-455a-921f-faeeb6b62eb3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1770678953; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=/QfQrW2B1/nLIKg/3JF3Cq5QiXM94VVt3P0aKs+SRGQ=;
	b=hDzfPg/PM7Bs8S6OZ8SOLQ4OXngD5GQ6ykEdw0VGQXssHC+q85B8AUdeE3aPReOm
	KVcIA5V92uDifxxh1hyZx6/BdhbK7K6dpfkhK1KWgq+SBZsQwtouQdyOTB0wMpgkKrn
	ceCS3MgScK5/+FqUXRCcs1xN0cnR5RY5vCVxo2qA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1770678953;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=/QfQrW2B1/nLIKg/3JF3Cq5QiXM94VVt3P0aKs+SRGQ=;
	b=pPh8x+fgxDH/y25sHCPK7nKd1ncGUrNhoBe7Rsuigg5MUq5AgqMbJu377ewmgbK8
	v7+E8BuGWMEMCCPACb3VyDJ/97VkUQdKrJY5jKiRdXFm+joRT7Ph0EQfjG09Dd6smQw
	VyfTmY69Hl6xRqdkBNmqarEXrxbUiZoI7FMJhBPc=
From: patchtest@automation.yoctoproject.org
To: Logan Gallois <logan.gallois@gmail.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-Core][whinlatter][PATCH v2] oe-setup-build: TEMPLATECONF were not
 applied correctly
In-Reply-To: <20260209230359.2050-1-logan.gallois@gmail.com>
References: <20260209230359.2050-1-logan.gallois@gmail.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019c44b0a444-60a801b4-857b-455a-921f-faeeb6b62eb3-000000@us-west-2.amazonses.com>
Date: Mon, 9 Feb 2026 23:15:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.09-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 23:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230824

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/whinlatter-v2-oe-setup-build-TEMPLATECONF-were-not-applied-correctly.patch

FAIL: test Signed-off-by presence: Mbox is missing Signed-off-by. Add it manually or with "git commit --amend -s" (test_mbox.TestMbox.test_signed_off_by_presence)
FAIL: test commit message presence: Please include a commit message on your patch explaining the change (test_mbox.TestMbox.test_commit_message_presence)

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

