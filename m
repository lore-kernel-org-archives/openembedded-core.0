Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 504E2F8DFDF
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 08:46:05 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40366.1776415556634873529
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2026 01:45:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=4BiuHvEZ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=MiIguFld;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019d9a9e40d7-21826752-8d5d-40ef-8fb2-fc6630873cf2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776415555; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=pYtwkubDQIHqxWopWvns3WKxi/kpWuzh83K7zXLFhRY=;
	b=4BiuHvEZ/PX2IAeiyxUw7syLGp6SKGspTWuw7Y9v1IPOkQOsrHneIecYP9V4PWxO
	UUMhQhiXviJudvdL2J4W/Aioqo1SwxOtIe7OlkXXyByUoSmQpH6YeaWHfaQXkeOXp3p
	3VzBOPPcIgbCdRZ2z/kxz8N9fOMzbNxgEvC5lCCQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776415555;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=pYtwkubDQIHqxWopWvns3WKxi/kpWuzh83K7zXLFhRY=;
	b=MiIguFld21ikY2g2+9TllgViZRaNwruWpgwF1meU/ebxpUuKaKF3UQvfXRgNe4Ug
	H/QWndOMLArCY/ZE3dz8bSpkggYfBOtBrkpT643k3BXNj9aL/HlCcwJPtbR08e7kBBw
	9Cbwv7alwJGJ9ofv1LsVB5tyOWUZoC+iQ4aINrR0=
From: patchtest@automation.yoctoproject.org
To: libo.chen.cn@windriver.com
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [oe] [meta-oe][scarthgap][PATCH v3 08/11] hdf5: fix CVE-2025-2308
In-Reply-To: <20260417083032.3462824-1-libo.chen.cn@windriver.com>
References: <20260417083032.3462824-1-libo.chen.cn@windriver.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019d9a9e40d7-21826752-8d5d-40ef-8fb2-fc6630873cf2-000000@us-west-2.amazonses.com>
Date: Fri, 17 Apr 2026 08:45:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.17-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 08:46:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235492

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/oe-meta-oe-scarthgap-v3-08-11-hdf5-fix-CVE-2025-2308.patch

FAIL: test target mailing list: Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists (test_mbox.TestMbox.test_target_mailing_list)

PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_status_presence_format)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)

SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
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

