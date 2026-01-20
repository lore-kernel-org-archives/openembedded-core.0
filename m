Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E497CD2ECE9
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 13:47:16 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6633.1768916832527707721
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 05:47:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=JkVdLwDC;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Ue5dj9cw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019bdba8cd9c-53c2fb56-e648-41f9-8f7a-94a616b99e4f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768916831; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=SoS2cOwFi0O1etPWVJaRdqTpt8wgul6jkQW2/hf3Qfo=;
	b=JkVdLwDCvuDgW737Znv4hjE4HTXevAdCYmk7m+5kdlD1GibGp3XkMg8+vJWCL4VH
	uITINjMUPvOBapZRRFOQoy6TNu49RX3oziV0qUVU2b6a2z9Bp78awKF8ydC+eQGBg0X
	rwqrEup6N+LQgVyIl7p7f2dejNjQ6BChHFMfFqiE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768916831;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=SoS2cOwFi0O1etPWVJaRdqTpt8wgul6jkQW2/hf3Qfo=;
	b=Ue5dj9cwXsxeXo087XGnasm+O48LPhbGu3P9I5ihHTgLAqGiAhO6l9dakXQ5Z6y9
	DABbZP1Hu0Jos0n8iqih2smWkjRduO9K/+PsOMo49CMGuwCK2HWILl/JpZbVlz7bfS9
	IMXArHYqtt25tnRDUWomUdRzD95HsTrapAPrSBdQ=
From: patchtest@automation.yoctoproject.org
To: Yoann Congal <yoann.congal@smile.fr>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][kirkstone 10/26] python3-urllib3: patch CVE-2025-66418
In-Reply-To: 
 <49af1e1ee78adc165a2c1d6905d0de79015a942c.1768914702.git.yoann.congal@smile.fr>
References: 
 <49af1e1ee78adc165a2c1d6905d0de79015a942c.1768914702.git.yoann.congal@smile.fr>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019bdba8cd9c-53c2fb56-e648-41f9-8f7a-94a616b99e4f-000000@us-west-2.amazonses.com>
Date: Tue, 20 Jan 2026 13:47:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.20-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 13:47:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229734

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/kirkstone-10-26-python3-urllib3-patch-CVE-2025-66418.patch

FAIL: test CVE tag format: Missing or incorrectly formatted CVE tag in patch file. Correct or include the CVE tag in the patch with format: "CVE: CVE-YYYY-XXXX" (test_patch.TestPatch.test_cve_tag_format)
FAIL: test Signed-off-by presence: A patch file has been added without a Signed-off-by tag: 'CVE-2025-66418.patch' (test_patch.TestPatch.test_signed_off_by_presence)
FAIL: test Upstream-Status presence: Added patch file is missing Upstream-Status: <Valid status> in the commit message (test_patch.TestPatch.test_upstream_status_presence_format)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
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

