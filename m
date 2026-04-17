Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5106FF8DFF7
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 08:46:05 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40180.1776415555774341388
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2026 01:45:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Ofdt9Xa/;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=UHjTIPGX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019d9a9e3d80-26a3dfdd-6151-4dcf-89b3-5a611ab2427c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776415555; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=KGENAfANmOyO0YL+vJZzRJiQCgHm4G1eKzIkUU4FK/k=;
	b=Ofdt9Xa/9IUUfmDsTqtGUwEfFCWaGGVPWI/jhQ2edbmpC00ECROfzyNsjDwFKKr7
	S5A4W0ABetosKyRmcmqXs3C2B+JOlWeyVmTTBbVHIsiWS2ARsbvwyTUh1MgxQvVKu5A
	IQZvdeFOA1yVd5acuoJo+BMyuPOzRD19IM7k3h2w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776415555;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=KGENAfANmOyO0YL+vJZzRJiQCgHm4G1eKzIkUU4FK/k=;
	b=UHjTIPGXapNtqqA9TOBA/60l1CUqA8tj5dCxM6r4kpqUY/w0plHlYfhe1l17Ad4X
	y76vxwHoCryyzTlmN0db7uk5xX7zH8mrbkiCflSLI4fUY7yDstwk9D4heUPbrP59Z69
	aH7H/IvWdPYQ8Ejz9MqSxanTPvfl0uOn9SR3ph+Q=
From: patchtest@automation.yoctoproject.org
To: libo.chen.cn@windriver.com
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [oe] [meta-oe][scarthgap][PATCH v3 03/11] hdf5: fix CVE-2025-6857
In-Reply-To: <20260417082520.3451816-1-libo.chen.cn@windriver.com>
References: <20260417082520.3451816-1-libo.chen.cn@windriver.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019d9a9e3d80-26a3dfdd-6151-4dcf-89b3-5a611ab2427c-000000@us-west-2.amazonses.com>
Date: Fri, 17 Apr 2026 08:45:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.17-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 08:46:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235491

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/oe-meta-oe-scarthgap-v3-03-11-hdf5-fix-CVE-2025-6857.patch

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

