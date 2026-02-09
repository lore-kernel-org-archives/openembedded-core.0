Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 178E2E94623
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 23:16:00 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8090.1770678954477298338
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 15:15:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PUA0u1UQ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=HgSDXX30;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019c44b0a75e-d1df6f63-6566-4c51-81a3-7fd840cdba73-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1770678953; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=AQRaD1fZTDdvYE4v9YMGCuZ9LWDyeb8uOcRZdkCATgA=;
	b=PUA0u1UQOOTDMrRlza3JAU8uxYn7sZ4A9bX7MZ9n5Uk4cTRjEr0zFuveiZWXq8P5
	B6nRZqj4uTiCb+R2T8uYUe/VspRi8SrPoEFrFNAqALxptKbP3od+TPwHzKmDdZuz83M
	R1ErLzB1yxENVXqLZfZrOEtH6O2vB3D0XUGTZo74=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1770678953;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=AQRaD1fZTDdvYE4v9YMGCuZ9LWDyeb8uOcRZdkCATgA=;
	b=HgSDXX30wm/l3GM4duSbIYCGqxXIHp1A7N7I7KfA++Kk5wrwZ5JPO37iiXkUbS8H
	kM9dG4/b2A2734kx1/xrNuXz9vKJSsBhhcPUU7vxZ8QpYwcdxr1IZRqfLZ02osfVuEM
	DjYW8Tm/i2dHxUfmH0qcBuJ3I5BCE8dD5VHPwV1I=
From: patchtest@automation.yoctoproject.org
To: Logan Gallois <logan.gallois@gmail.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-Core][whinlatter][PATCH v3] oe-setup-build: TEMPLATECONF were not
 applied correctly
In-Reply-To: <20260209230701.2979-1-logan.gallois@gmail.com>
References: <20260209230701.2979-1-logan.gallois@gmail.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019c44b0a75e-d1df6f63-6566-4c51-81a3-7fd840cdba73-000000@us-west-2.amazonses.com>
Date: Mon, 9 Feb 2026 23:15:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.09-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 23:15:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230825

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/whinlatter-v3-oe-setup-build-TEMPLATECONF-were-not-applied-correctly.patch

FAIL: test commit message presence: Please include a commit message on your patch explaining the change (test_mbox.TestMbox.test_commit_message_presence)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
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

