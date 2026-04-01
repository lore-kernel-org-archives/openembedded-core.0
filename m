Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C70D35170
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 10:15:59 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9727.1775038556962846576
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 03:15:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gTMlGm1c;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=0GQnTlIw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019d488ae67c-b00cffd0-fee2-4440-8ffc-18e23d21dcea-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775038556; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=d0MYyFF2rm2AKj1MXfx0uYbT4VkeMC4OqYC4yUDSH6M=;
	b=gTMlGm1cqLV4Yq1Vs2MKdyXhWGcXVEdo7m5QW0/vX4gPJse99wo29cyrD4DMS0Rz
	6IS2YGO98LrbFsqVuvUrPwbaYCa2qS3ZOhFFNBpNGmOJyCG62ZyT8L70rl8dsrT14dh
	y+xLAfirapstF1sJcwW0tiuAbqtIXRqjl7pShEkE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775038556;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=d0MYyFF2rm2AKj1MXfx0uYbT4VkeMC4OqYC4yUDSH6M=;
	b=0GQnTlIwXUgoeVn7DS8o8qvQNGxsAM38R9WaE59Bqv+F2ZwcQMTfA51urEGcYqQs
	FHEYHgznMRdmBKIbkzkoT8gX3Es3Smz2bI1wEQCtJpdTohaWb5K2QlWH1ffPAfvs4wQ
	h1GALm4lhga/9hag6wQ+8TpEdLrRPECIJChELxZ8=
From: patchtest@automation.yoctoproject.org
To: 
	"Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][whinlatter][PATCH v2 1/4] binutils: Fix CVE-2025-69648
In-Reply-To: <20260401100022.1173083-1-deeratho@cisco.com>
References: <20260401100022.1173083-1-deeratho@cisco.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019d488ae67c-b00cffd0-fee2-4440-8ffc-18e23d21dcea-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 10:15:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 10:15:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234340

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/whinlatter-v2-1-4-binutils-Fix-CVE-2025-69648.patch

FAIL: test Upstream-Status presence: Added patch file is missing Upstream-Status: <Valid status> in the commit message (test_patch.TestPatch.test_upstream_status_presence_format)

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

