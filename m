Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5B76C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 14:02:29 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.14126.1702994539730297685
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 06:02:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SPnzSlHc;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=VajamgJe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018c82626cd1-148e0d57-5c0c-49c0-a059-e9fde85289a1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1702994537; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date;
	bh=jWhFcQ28jf8TqjVV96plAKZHeASc/7P5/XPJvMzWCT0=;
	b=SPnzSlHcxqjaC5CYPUc4ehdTlN1Rayfoyhgc/yCxaKcKTGoYdZAK4fQR8HadE8o/
	Wl6tcIHvtOxfwiRU7M6ftXr8oAYln5T3FI/eZVIkBy7T6LUCCVYg1lZoKLLMWhiO+Z4
	p7VjEkclpp2r2riYLTdWtAlxthSKCUcSDg/w/iJU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1702994537;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=jWhFcQ28jf8TqjVV96plAKZHeASc/7P5/XPJvMzWCT0=;
	b=VajamgJel7g7AVD9cZ2Z8zrBsHuzZvz3SqkCS97apsqHFxeAyXsRJJXfHdZRZE43
	MpzQjwXv797zzT7L5APZfHCI8zj8LAYHJKJXhuEKWtHsGH14lBw54TGP6+ZTSUZXBSI
	3WN6L1hYuKLBwZxzzlDVS1MI8MW3yxlLUkuMa3Uc=
From: patchtest@automation.yoctoproject.org
To: Steve Sakoman <steve@sakoman.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][dunfell 4/5] libsndfile: fix CVE-2021-4156 heap
 out-of-bounds read in src/flac.c in flac_buffer_copy
In-Reply-To: d922a288f79834d8f1120a4454b97803290e5c36.1702993573.git.steve@sakoman.com
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018c82626cd1-148e0d57-5c0c-49c0-a059-e9fde85289a1-000000@us-west-2.amazonses.com>
Date: Tue, 19 Dec 2023 14:02:17 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.19-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 14:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192738

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/dunfell-4-5-libsndfile-fix-CVE-2021-4156-heap-out-of-bounds-read-in-src-flac.c-in-flac_buffer_copy.patch

FAIL: test shortlog length: Edit shortlog so that it is 90 characters or less (currently 101 characters) (test_mbox.TestMbox.test_shortlog_length)

PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_status_presence_format)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)

SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
SKIP: test target mailing list: Series merged, no reason to check other mailing lists (test_mbox.TestMbox.test_target_mailing_list)

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

