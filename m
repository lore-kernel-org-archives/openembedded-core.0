Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E46A10D1484
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 21:15:49 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19219.1774732543171353454
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Mar 2026 14:15:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=1qGiCBxr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=AMkJKRSo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019d364d814c-751d58c6-bc7c-4534-b716-0e83c28f38a9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1774732542; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=EGuZetiOa6e8Yl7tm1rkFIomQzNu/lkCQXj9fLZMYYg=;
	b=1qGiCBxrmp+i4yp/5IKby1dKdxi2OI4wZwqp/Jh8P4AVBzrv1u/aoGu0+QeS+FOu
	OmbZI1aeqGe0jtLc3tnb4jtx10KVsbtNlgEmHFEVEra7VvUmQRXOKMMrSWh2HNvr0oP
	birK3bZ6SIbiF+yJjZ1y6Uyp5VkH+WgFDV3R1EOQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1774732542;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=EGuZetiOa6e8Yl7tm1rkFIomQzNu/lkCQXj9fLZMYYg=;
	b=AMkJKRSov5tsu/+dy3iCZYuyz6jgG24fo0reOyFpxgwLEuEh//ITKoTp/ApW70xe
	9gFl7/ndVPoA3jrm2iucoRxjHkwsADs0tmPc0aPqvtf23+5rtTDtSFd7aIwTo7bkXaO
	/RBC1KuZEPEBgUzHRwdyJnY5vmmqjsK4xH1Z3G+4=
From: patchtest@automation.yoctoproject.org
To: =?utf-8?b?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH v2] icu: Workaround buildpaths QA check, if TMPDIR is
 /build/tmp
In-Reply-To: 
 <6401da269fe72dc465d76c60f7ae5fd6eff27652.1774731856.git.joerg.sommer@navimatix.de>
References: 
 <6401da269fe72dc465d76c60f7ae5fd6eff27652.1774731856.git.joerg.sommer@navimatix.de>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019d364d814c-751d58c6-bc7c-4534-b716-0e83c28f38a9-000000@us-west-2.amazonses.com>
Date: Sat, 28 Mar 2026 21:15:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.28-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Mar 2026 21:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234135

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/v2-icu-Workaround-buildpaths-QA-check-if-TMPDIR-is-build-tmp.patch

FAIL: test Upstream-Status presence: Upstream-Status is present only after the patch scissors. It must be placed in the patch header before the scissors line. (test_patch.TestPatch.test_upstream_status_presence_format)

PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

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

