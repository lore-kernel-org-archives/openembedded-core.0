Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2242AC4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 14:02:58 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.32217.1701871372145940211
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 06:02:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YCpCk4Ct;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=myg+xJ/g;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018c3f70443e-a18bc62c-b526-410b-984f-3707c8f65f87-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701871371; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date;
	bh=0x0S8xJFtWHBJUx08NwDfwg/Yqx1mHTlJ/T+YUhweEg=;
	b=YCpCk4Ct4qaRA/XEWtWJnjNk9AJne4PJdD6GhDlmopLrY3S8zd76fWAUcShrfN4Y
	nFzUCnRPENA/XL5Yt5VPlH73Y/PS4JLJoDS9Eg23If5fuEieQ7Fg0XWajqhtzgV/A+D
	MeTBT+qGhkgpcH5tGBS4N3SqLmuIoHq7MG+DsT+E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701871371;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=0x0S8xJFtWHBJUx08NwDfwg/Yqx1mHTlJ/T+YUhweEg=;
	b=myg+xJ/gHsfnjdJoHDZpcVgVXbrgWAMM5OEFSFfIAAkUQFcgVjbU5Uj/lWubwjCZ
	d1ZB8h41iwPuAFo8DNjhd2Nb/285BsIimcbwzMVK1U70MGF8UqXEs7cMLquWMOR04rn
	UOz7ay0lEca44922Qc1qZfvfC1WsHaTzZpzWkx34=
From: patchtest@automation.yoctoproject.org
To: Steve Sakoman <steve@sakoman.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][dunfell 11/11] cve-exclusion_5.4.inc: update for 5.4.262
In-Reply-To: a929aa6c0a57ed4e1192e1552eacc6dfda8eeee7.1701870718.git.steve@sakoman.com
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018c3f70443e-a18bc62c-b526-410b-984f-3707c8f65f87-000000@us-west-2.amazonses.com>
Date: Wed, 6 Dec 2023 14:02:51 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.06-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 14:02:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191899

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/dunfell-11-11-cve-exclusion_5.4.inc-update-for-5.4.262.patch

FAIL: test commit message presence: Please include a commit message on your patch explaining the change (test_mbox.TestMbox.test_commit_message_presence)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)

SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
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

