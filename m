Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D310C55197
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 10:45:52 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35926.1771584344592997665
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 02:45:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=DWD0L4X0;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Cm7pq3Na;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019c7aa7ce9c-ca766818-961e-41cc-8f36-0fa0f29294d1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771584343; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=KqdQEXWnEl5oPI8Pl2+juEla9w5PvHfa2mrZpfuqI8k=;
	b=DWD0L4X0wnUNLO5KUarSt0tsgWzCLWC9HbNuXvbZ/e3VgSRJBpToX5aHn1gcpw37
	7GJuYZF8sEfZgG6i1Zmnx5p2Ira0/2AoTmYCzlECUBwNrxMmItyh+lSj4wrdcRl5pMA
	poS+1sgaVQqlXhxndzody+qbfJvJ7qA3Fwc5qoTQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771584343;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=KqdQEXWnEl5oPI8Pl2+juEla9w5PvHfa2mrZpfuqI8k=;
	b=Cm7pq3NaKHUhaqzARS0OaXaPr49Z0J9IuH8+RW4l4P3dr0/OSoD1m3AUg8gjFPKj
	2PCZuek1KbvRtFz2aPiuX2osSYK7AMNkYcBwV6PxRgUKC73+z2M4xzQzSJItDNhzNG6
	CFpJbrc8kYq/zbtRyYxEYcCQvmWIKS+vMwD2Wn4E=
From: patchtest@automation.yoctoproject.org
To: Mikko Rapeli <mikko.rapeli@linaro.org>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH] systemd 258.1: fix udev rootfs by-partuuid link generation
In-Reply-To: <20260220103739.3758464-1-mikko.rapeli@linaro.org>
References: <20260220103739.3758464-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019c7aa7ce9c-ca766818-961e-41cc-8f36-0fa0f29294d1-000000@us-west-2.amazonses.com>
Date: Fri, 20 Feb 2026 10:45:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.20-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 10:45:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231508

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/systemd-258.1-fix-udev-rootfs-by-partuuid-link-generation.patch

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

