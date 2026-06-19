Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14FFECD4F26
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 20:17:34 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50923.1781900248303455995
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 13:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JW4vYLjI;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=yNiVZPhX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019ee1880194-99922989-1265-4ee8-832c-8e4ab6465ad1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781900247; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=JdXZw4jxrM0nmIjy/Sp96cVLF3ORCmRG55BN3rJha0g=;
	b=JW4vYLjIpALb74r5KV3Bl7E/IpLZ7lkv2/U2nTZkRTsCdUHAEqUtFk4+QBHMeMiF
	SX4GvmlbMZ3dqsghXf9INShRph7JWbrMgCtz4oZ2rkPZRFg15KHE2Ep/GreOSyerm+v
	JrSFsRzyBSRopuRWGYOf5jwbtc43tcPuOzZj4ipI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781900247;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=JdXZw4jxrM0nmIjy/Sp96cVLF3ORCmRG55BN3rJha0g=;
	b=yNiVZPhXvaYRrg00gBhEz0fSq1e1IHGqCL9rwq/Z2oK4yWGaFYgqueRm+HrE0RJ9
	DtdxedyPO8zaX8hdbISJltxXpZN+HoPrJXjgP9vm0XPmwKhYLwUaYPtaW0VOnYwJeQS
	Kro3d+Q1M/pc9vcQztfkv1snWpF2A/9pAx0YTSFw=
From: patchtest@automation.yoctoproject.org
To: Paul Barker <paul@pbarker.dev>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH 3/5] lsof: upgrade 4.99.6 -> 4.99.7
In-Reply-To: <20260619-auh-v1-3-62299dbd8231@pbarker.dev>
References: <20260619-auh-v1-3-62299dbd8231@pbarker.dev>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019ee1880194-99922989-1265-4ee8-832c-8e4ab6465ad1-000000@us-west-2.amazonses.com>
Date: Fri, 19 Jun 2026 20:17:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.19-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 20:17:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239193

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/3-5-lsof-upgrade-4.99.6---4.99.7.patch

FAIL: test commit message user tags: Mbox includes one or more GitHub-style username tags. Ensure that any "@" symbols are stripped out of usernames (test_mbox.TestMbox.test_commit_message_user_tags)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
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

