Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 406FBF327A8
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 06:01:07 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11854.1776751264066179127
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 23:01:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=sftnGiyO;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Z6kexlIC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019daea0bd9b-e3673b7d-e3b8-4522-8343-f97351177d06-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776751263; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=yr9KmLmlFo1e9p52OSD7NsYZshnx4JEbYak037KHkFs=;
	b=sftnGiyO54AG+Z2gn6m3vM9+0CSeKa5XtFjClEYJqiT+eSUhyjkoLiZI9hO/nOf1
	CD6411VGP95srqbxlpthZDTo239ZxuKkDgdCFvtsVpsnfK6TmX4WLZX6zEYqk4uOuN2
	UOCGcZVhbFKS8QfqInCDMR8J+bnlTaotf68/4ePE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776751263;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=yr9KmLmlFo1e9p52OSD7NsYZshnx4JEbYak037KHkFs=;
	b=Z6kexlICv9sZcSoIwxJYuVxBm6dPojSt/4E9/SR8OayXcsADbV9u6rPCVVJyF5cc
	Ua/p9TjOMyPCF4fWQZuq9xvAq3EnPDFeJ/qzWuO5SJZp4RbLJWJ15J3Phy44RZKVXxT
	CYa8+ip72IAx7Uis5QfKQK1c1jlBFSEvYe45IVas=
From: patchtest@automation.yoctoproject.org
To: martin.jansa@gmail.com
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [scarthgap][PATCH 3/6] meta/conf/distro/include/yocto-uninative.inc
In-Reply-To: <20260421054240.3264-3-martin.jansa@gmail.com>
References: <20260421054240.3264-3-martin.jansa@gmail.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019daea0bd9b-e3673b7d-e3b8-4522-8343-f97351177d06-000000@us-west-2.amazonses.com>
Date: Tue, 21 Apr 2026 06:01:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.21-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 06:01:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235597

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

