Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63BAB10A1E63
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 18:31:02 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54993.1774549860914224162
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 11:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=twcQh6Fw;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ixAtiuxd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019d2b69feca-f09138c7-dfc1-4515-99c0-ff4edd76f0b8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1774549860; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=yr9KmLmlFo1e9p52OSD7NsYZshnx4JEbYak037KHkFs=;
	b=twcQh6FwY4IxD1w/vWOTeEMYEn3CVGe1LO0t+TAAv4Hc6h6WMghalRejxghDa5E8
	phHvn7Ob+M0zUc4pgeUtdd6O+7q3sXszh97umkyiZ6mtd9CGdLDnCMFetF1iAb1cer/
	Ii7T5wetOfahVrYdPqO4K/tUuC2rR2I7ha3s8iMk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1774549860;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=yr9KmLmlFo1e9p52OSD7NsYZshnx4JEbYak037KHkFs=;
	b=ixAtiuxdcr/zUjFzKInJAyR0s8se3AHd5yA6soGx8exw/DSi1aVAutmH0N7YM3Ns
	rBwlTJKZpEJyaEfWBZ/tMbVw1gs9n3uarXrNdGJNyUVw/6osVGiw1S5DRn/vyyjungP
	XPb2VjPSNfzLtEvU9UTe4dAmLDxaJ+35IAY/x0lY=
From: patchtest@automation.yoctoproject.org
To: martin.jansa@gmail.com
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [scarthgap][PATCH 3/6] meta/conf/distro/include/yocto-uninative.inc
In-Reply-To: <20260326181450.1262870-3-martin.jansa@gmail.com>
References: <20260326181450.1262870-3-martin.jansa@gmail.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019d2b69feca-f09138c7-dfc1-4515-99c0-ff4edd76f0b8-000000@us-west-2.amazonses.com>
Date: Thu, 26 Mar 2026 18:31:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.26-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 18:31:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234041

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/scarthgap-3-6-meta-conf-distro-include-yocto-uninative.inc.patch

FAIL: test shortlog format: Commit shortlog (first line of commit message) should follow the format "<target>: <summary>" (test_mbox.TestMbox.test_shortlog_format)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test bugzilla entry format (test_mbox.TestMbox.test_bugzilla_entry_format)
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

