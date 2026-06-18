Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC415CD98ED
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 12:30:58 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18486.1781785849992293691
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 05:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JhqbPaMR;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Pbd4Lydt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019edab66d1c-7a898faf-c23c-4f29-9414-bb0eaa21f77c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781785849; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=maIB2x0N66iGl+2Q2z6SoQMHn6fVPBYqsySpr+qEh30=;
	b=JhqbPaMRUm1wHH/PoD9VhiZZhNbFcyp/PUhhbx4eiK7ZXxcd/ycPjr7OIXqlr7Se
	oiRUCjWkbl/NzGeg0/wpJ6cOWtYYbaw7lYPj9DxM59bzOUhUFIsPhg1A3AnJKA4izcM
	n41AGt0Lboeo3qffq4p2R6zCXHGVy8tDeouq7ExU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781785849;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=maIB2x0N66iGl+2Q2z6SoQMHn6fVPBYqsySpr+qEh30=;
	b=Pbd4LydtGMTBw9U5UueP4LQd0Vu2TQdGHtCHY8z0EoV13vdJclkexApTrgnq3x16
	q+NWXE8nZVDbuuIY9wUsfTUK7EZng0/ytqOio1gpDe/O7hZsSM3TugYOA8Ri7weH/QH
	5zH95H7T8alvH4D+A4rxi5lvy93WvKjJ3Jw/lojE=
From: patchtest@automation.yoctoproject.org
To: Nate Kent <nathan@otiv.ai>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH] Update sed usage by 'pam-wheel' for sudoers
In-Reply-To: <20260618095943.361698-1-nathan@otiv.ai>
References: <20260618095943.361698-1-nathan@otiv.ai>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019edab66d1c-7a898faf-c23c-4f29-9414-bb0eaa21f77c-000000@us-west-2.amazonses.com>
Date: Thu, 18 Jun 2026 12:30:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.18-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 12:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239082

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/Update-sed-usage-by-pam-wheel-for-sudoers.patch

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

