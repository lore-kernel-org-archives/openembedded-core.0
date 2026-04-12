Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30AF3F4487B
	for <webhook@archiver.kernel.org>; Sun, 12 Apr 2026 10:45:56 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.236977.1775990748249217682
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2026 03:45:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hlx6u5n1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=08Lx3i8j;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019d814c30c3-e37a93bb-262e-4c79-9cbc-2d049e03ad0c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775990747; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=fg+ygxZhAgG+bMnTgms+ycIC23NXc0ekrwXut1zLOMA=;
	b=hlx6u5n1FrdNibO2/j7Uf1ULOwsjZUf/Va3xXZP+Zbk2MFY02evfs5NwiVZHMPGR
	6aA5+YmbPBUcBARQC6EbIO48qOsxmUZa7J19h6w1xU1FgFJHzI1iVHJ4+uXpKP3oMtR
	YKR7aPWVfXUFNhickYU3FGr7imoMAreKI96tWNME=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775990747;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=fg+ygxZhAgG+bMnTgms+ycIC23NXc0ekrwXut1zLOMA=;
	b=08Lx3i8jlyQ+SUB8u/EtKBYKp+Rs5SBsFUdOHCS8oVgJDNCJrLQoppZPWMIG6oZt
	uQxDoDHmk+NUz7ZBAZ5NE4zNFxcGlnb81YhDEDQVtHeZBEOZlhBi5NI4sQhhGKhgzwg
	fVY0Ixub22rmVct5xhowVEdFTSCzD6Ew+Y6TkdSM=
From: patchtest@automation.yoctoproject.org
To: =?utf-8?b?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH v2 1/2] atop: Add packages atop-acctd and atop-gpud
In-Reply-To: 
 <5a2e6c6a750bb04263768f47307607f17b77f4fe.1775990357.git.joerg.sommer@navimatix.de>
References: 
 <5a2e6c6a750bb04263768f47307607f17b77f4fe.1775990357.git.joerg.sommer@navimatix.de>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019d814c30c3-e37a93bb-262e-4c79-9cbc-2d049e03ad0c-000000@us-west-2.amazonses.com>
Date: Sun, 12 Apr 2026 10:45:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.12-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 10:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235063

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/v2-1-2-atop-Add-packages-atop-acctd-and-atop-gpud.patch

FAIL: test target mailing list: Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists (test_mbox.TestMbox.test_target_mailing_list)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)

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

