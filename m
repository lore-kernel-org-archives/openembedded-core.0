Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 863ABD3569D
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 04:01:14 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7850.1769659264187902415
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 20:01:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=lqzgskZj;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Z7vJI/6z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019c07e9692e-8ad2f832-bf38-4fab-b2ab-cdfec86b728e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769659263; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=D10/DN8q7FjnJ0P7OXbpfsXU7JUl2ik/9mdMqfWrCIg=;
	b=lqzgskZjhGylv4g5Eos0oTSyvh1UDKn0BRog3mbPt31ZdkA4qF3ETeptU+Ys2wFk
	ykytGHWqh+VzH6vsek/Jyd4V7Kie1uPQusJ8G7TbCLin7OAh0QroXmIm7cyuT4KITSY
	1S6Kbylt1Mndxrlzev2OexRJMXIk+FLfFGuxH1Oc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769659263;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=D10/DN8q7FjnJ0P7OXbpfsXU7JUl2ik/9mdMqfWrCIg=;
	b=Z7vJI/6zTJlA4CZvo2oUC9+sUxjYSgjtgA8diN8+H/N7wXzajItt6/XFhOvHmwvl
	pRymg/Gfc5c+jas0zNETtl65i8/m8auwbV6ZK8WYVfdcnV1gn9pb/jJQ0bSyQKsgmwD
	eIXutwjRiSROhXgXP/QSSjVsK+G402aVadPt7SPM=
From: patchtest@automation.yoctoproject.org
To: Liu Yiding <liuyd.fnst@fujitsu.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][PATCH 6/6] orc: Enable hotdoc to produce doc
In-Reply-To: <20260129035353.8982-7-liuyd.fnst@fujitsu.com>
References: <20260129035353.8982-7-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019c07e9692e-8ad2f832-bf38-4fab-b2ab-cdfec86b728e-000000@us-west-2.amazonses.com>
Date: Thu, 29 Jan 2026 04:01:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.29-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 04:01:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230119

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/6-6-orc-Enable-hotdoc-to-produce-doc.patch

FAIL: test commit message presence: Please include a commit message on your patch explaining the change (test_mbox.TestMbox.test_commit_message_presence)

PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_status_presence_format)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
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

