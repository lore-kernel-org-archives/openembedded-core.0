Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1404CD98F2
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 17:07:47 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24432.1781802458657766745
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 10:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UXiWe6el;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=l9Ah+wrc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019edbb3daa5-02b40a46-97da-4882-9dfa-5b133dbe12d0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781802457; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=qhYdy2VUvR4mKeBH684cW1rO5s49LA818YQxxUyybyA=;
	b=UXiWe6elVgno/8jy/SdFCn5ov+9AWPV3ztu+x6Ew2fvdWYINbA9kIk3ibhcYivl9
	ASvwoFGdD2DTQNLh6XGBuTTsFAqH8s1WCEFPytkhHVDx/Sy9r29rKVMCE/wT2ncnutU
	aKlkw3C6SjmuHzeoAuYL68MAXUzWVeAHpVrwmOT4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781802457;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=qhYdy2VUvR4mKeBH684cW1rO5s49LA818YQxxUyybyA=;
	b=l9Ah+wrcmT4GRdr5EduHquOQ1TLxGJe163Ph4C+/+EZQ1WTauq7NZFc9vJgq/ZXe
	pevEHcN/ClA5FAXR6PeP0uY4qFBR+mWnGNV/jQ9Ct3ITQg4ArATG6b4i7c49GPOWcDJ
	2ysaDD6NTRUMC29kCD/ZMHh1rf1oufaVoDcnUFAs=
From: patchtest@automation.yoctoproject.org
To: Joshua Watt <jpewhacker@gmail.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][PATCH v2 3/5] Add SPDX deploy tasks to various recipes
In-Reply-To: <20260618165032.347436-4-JPEWhacker@gmail.com>
References: <20260618165032.347436-4-JPEWhacker@gmail.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019edbb3daa5-02b40a46-97da-4882-9dfa-5b133dbe12d0-000000@us-west-2.amazonses.com>
Date: Thu, 18 Jun 2026 17:07:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.18-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 17:07:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239097

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/v2-3-5-Add-SPDX-deploy-tasks-to-various-recipes.patch

FAIL: test shortlog format: Commit shortlog (first line of commit message) should follow the format "<target>: <summary>" (test_mbox.TestMbox.test_shortlog_format)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
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

