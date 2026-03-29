Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F51FF4927
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 23:01:21 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38733.1774825280670425787
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 16:01:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=METwXSBT;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=LQlwmtOO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019d3bd4913b-52891144-1d9c-4295-920f-f3a8cadccf8b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1774825279; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=GNFji55zXyE2OEdHD+iWx4W8l1xq0PxNMX2NA0WAdJs=;
	b=METwXSBTzpQ6AL/BF1x/2x1uZ1vbxHoIjQmoNvW68y9tuyJEAW8JUNU16iEvYuwI
	x8eSj5MM3FOp3QddInraG4xHz6/XjBMf5BKAsgss6UbI/pO6THO2CXmxTJmgqoj7l3I
	8hH55VWpBpFhomo00rL52t+sVQyqm/bjxTXeHcaU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1774825279;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=GNFji55zXyE2OEdHD+iWx4W8l1xq0PxNMX2NA0WAdJs=;
	b=LQlwmtOOTCO4vLTIGDfYScJ+b3nAhw+NkhNi/DUvFjGK3yh9SfiFpwi4rlXtYgYD
	VVoWwh4eDl9H0XP+9XwQj+OkfTDWP1G+MpjEzF0DxCjsMUWxgiHn+wpQccBI9yojFdz
	v2O49cDaBR7loCEYhew4KZzly6mVdxpyuQE+70aQ=
From: patchtest@automation.yoctoproject.org
To: Yoann Congal <yoann.congal@smile.fr>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][scarthgap 02/11] python3-cryptography: Fix CVE-2026-26007
In-Reply-To: 
 <80637cd1b9e2045e9f19fb8337704007fef67e41.1774824253.git.yoann.congal@smile.fr>
References: 
 <80637cd1b9e2045e9f19fb8337704007fef67e41.1774824253.git.yoann.congal@smile.fr>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019d3bd4913b-52891144-1d9c-4295-920f-f3a8cadccf8b-000000@us-west-2.amazonses.com>
Date: Sun, 29 Mar 2026 23:01:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.29-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 23:01:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234194

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/scarthgap-02-11-python3-cryptography-Fix-CVE-2026-26007.patch

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

