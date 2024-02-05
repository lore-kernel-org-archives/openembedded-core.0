Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA217C48295
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 15:02:07 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.64598.1707145324823813216
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 07:02:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=A1uQ+Oxg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=eJ68InUA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018d79ca6508-c7625699-6142-49bf-bb0b-0e4997a637d7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1707145323; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date;
	bh=92A0kpRLr0GC4VEOTPW6akzXyVeYhI+k1kroGlr7IaY=;
	b=A1uQ+Oxg/A1kDvXqVjlPEqSA0HZWeqchM50k8dPLG8am9Z3raAEfYEPQurSNk8CW
	9mekRZylFbVLSVx4ropim8fZ6rEAwwqVVHV15td3Ao3J8CMQVJdVR9UyK/AXkEwRWRV
	88MnEW90NvbgNLh43+Q2lX29w0qvLu6SQQEZLY0o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1707145323;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=92A0kpRLr0GC4VEOTPW6akzXyVeYhI+k1kroGlr7IaY=;
	b=eJ68InUAdNSHcUEACjZajNWN7c6f49ljk39Aw4ueKL3YOwNWvSkXo0uLcCWW6NDc
	OUBjE8mIdlZ5rylN6ict+xr+3Nyq7QkYwNyQNPYgrsHzADmNgrZBfzlMij12dtzdiFA
	k/iolbk169AtGiqkcKA7cmP2Hfexj/qtrEsviREI=
From: patchtest@automation.yoctoproject.org
To: Matthias Schmitz <matthias.schmitz@port4949.net>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [dunfell][PATCH] rsync: Fix rsync hanging when used with --relative
In-Reply-To: 20240205144905.49995-1-matthias.schmitz@port4949.net
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018d79ca6508-c7625699-6142-49bf-bb0b-0e4997a637d7-000000@us-west-2.amazonses.com>
Date: Mon, 5 Feb 2024 15:02:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.05-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 15:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194945

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/dunfell-rsync-Fix-rsync-hanging-when-used-with---relative.patch

FAIL: test CVE tag format: Missing or incorrectly formatted CVE tag in patch file. Correct or include the CVE tag in the patch with format: "CVE: CVE-YYYY-XXXX" (test_patch.TestPatch.test_cve_tag_format)
FAIL: test Signed-off-by presence: A patch file has been added without a Signed-off-by tag: '0001-Fix-relative-when-copying-an-absolute-path.patch' (test_patch.TestPatch.test_signed_off_by_presence)
FAIL: test Upstream-Status presence: Added patch file is missing Upstream-Status: <Valid status> in the commit message (test_patch.TestPatch.test_upstream_status_presence_format)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test bugzilla entry format (test_mbox.TestMbox.test_bugzilla_entry_format)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)

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

