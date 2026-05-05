Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD08CD342C
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 01:00:47 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29649.1777942843070093780
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2026 18:00:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HRyTICrs;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Ytt3UyYc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019df5a6cb42-a19f62a8-2632-4d0f-9d73-1a315a01b32c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777942842; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=w0BlJVYW1c7GVFU/y4FXBErt9KC50y9RKmt+uVB22IU=;
	b=HRyTICrshBGz9xzkeiLf/TqtQNddqOveew3Bti7GEvcgIlzDH4+C9QqjKgs9JcX9
	URqDlfN275mFWvXQZdwONvO2w3BYCdTGvBpmbb8Pvq25RIdJA1rzyS5fNKyjQoKgNYe
	UJ7Qy4V9SH3k0bfU+aX97zO75lPENHxJ5E1N3llQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777942842;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=w0BlJVYW1c7GVFU/y4FXBErt9KC50y9RKmt+uVB22IU=;
	b=Ytt3UyYcEUIyWsfzQr0D67OqZDHvC7yJGiOSGJ1t+AAft86xE7WRHpcf0sQtFKut
	cXzeb4ITichMSvXj/0nZ4+xk3dgVEk0kiP304KOPmIwADq+midsp/vwVkueQ8IstsbU
	sS+xPg2j4lq2BWqof7DG7MeGiFJKwIV191fzh7jU=
From: patchtest@automation.yoctoproject.org
To: Quan.Sun@windriver.com
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
In-Reply-To: <20260505001613.1203967-1-Quan.Sun@windriver.com>
References: <20260505001613.1203967-1-Quan.Sun@windriver.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019df5a6cb42-a19f62a8-2632-4d0f-9d73-1a315a01b32c-000000@us-west-2.amazonses.com>
Date: Tue, 5 May 2026 01:00:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.05-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 01:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236460

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/qemu-upgrade-10.2.0---11.0.0.patch

FAIL: test Signed-off-by presence: A patch file has been added without a Signed-off-by tag: '0010-meson-fix-subproject-include-paths-for-standalone-bu.patch' (test_patch.TestPatch.test_signed_off_by_presence)

PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_status_presence_format)
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

