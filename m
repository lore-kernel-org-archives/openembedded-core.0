Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0929F3C98B
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:48:23 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21842.1771944501959977714
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:48:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=0iICJtQB;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=AhDu+wnW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019c901f62dd-bb29e7aa-6d48-4802-87e7-eac6f03f9137-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771944502; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=mlQPWQSA+/002SnkvPpV1RN8NZcanUdGEcIUWSFHVpg=;
	b=0iICJtQB8ym98ji8svnexyuNnK0bA13xXldjTkm5obBDNZRoSFqYLsCxEC5uIS+9
	6tZeivb5QRI0GbZHbXHSnYj4rbwHe7/ncHImbQQUZ7P3cAdgF2pwPQvfoq+FxiroFKB
	9SaGBOxz+o0kvuu+ArSPMGRoJEzSESsYwh2d7nRQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771944502;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=mlQPWQSA+/002SnkvPpV1RN8NZcanUdGEcIUWSFHVpg=;
	b=AhDu+wnWZkTICmV2BQtRcWbovqY7xJIJESajHUxk1xnqH76xL2EpfR8oWedWeFq5
	NVZv4uzh3vNIOmY9Vl3sQUv8b3GT2vTnpG+AcsfW7fTbeqMTtrrVg6/kBioIRlLgxJy
	zcKTk0zgxgACUcY+vawvb7or+QeeIK5Hc3KYk1VA=
From: patchtest@automation.yoctoproject.org
To: Yoann Congal <yoann.congal@smile.fr>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][scarthgap 17/44] linux-yocto/6.6: update to v6.6.123
In-Reply-To: 
 <4d1aea57d818ce892be5e2bc8cb4d6090ecbc339.1771943404.git.yoann.congal@smile.fr>
References: 
 <4d1aea57d818ce892be5e2bc8cb4d6090ecbc339.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019c901f62dd-bb29e7aa-6d48-4802-87e7-eac6f03f9137-000000@us-west-2.amazonses.com>
Date: Tue, 24 Feb 2026 14:48:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.24-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:48:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231863

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/scarthgap-17-44-linux-yocto-6.6-update-to-v6.6.123.patch

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

