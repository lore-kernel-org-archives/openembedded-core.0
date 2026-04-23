Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38982FC037F
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:46:54 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.796.1776959206632501249
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:46:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=qbfiqSAT;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DETq2Z4f;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019dbb05b17c-f01b6f9c-73a4-4552-b0be-a56631f5762c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776959205; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=dwuIILxpKm0AmBOTbmIcA5iu3d8EfxDvbwINOD95+e8=;
	b=qbfiqSATgcXRUN3NNpiExEBf6ONX1GOHjBEC/m08unf+iz9i60kdkaUTkBAUxlcx
	Jp9HqAnPWDozW6hwTKmJighBmc9gUoPRK0Yi+2cRDvHPH7BYTWShVulrrhlmwRGFBMI
	aRYMjDZ18YYDgBrnyGd26FkSWDN+a7mf6G2GJaxU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776959205;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=dwuIILxpKm0AmBOTbmIcA5iu3d8EfxDvbwINOD95+e8=;
	b=DETq2Z4faCCdfS+YcXahlv91TaPGERR0NWLfJhCzIgRrGvx80601VztKHf2Ojzi1
	tYwSM+E6pEvZ1s9CnWHQHPiXtI0cLbcufyZvQvaqruiOAJi3eikMXaQlQwtMiaMOGoI
	drZmbIagl8ZZHqnO6lNmlsUeKnOPQt0WcjjpgBvk=
From: patchtest@automation.yoctoproject.org
To: bruce.ashfield@gmail.com
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [meta-yocto-bsp][PATCH 11/15] yocto-bsps: update to v6.18.20
In-Reply-To: <20260423153222.1932256-12-bruce.ashfield@gmail.com>
References: <20260423153222.1932256-12-bruce.ashfield@gmail.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019dbb05b17c-f01b6f9c-73a4-4552-b0be-a56631f5762c-000000@us-west-2.amazonses.com>
Date: Thu, 23 Apr 2026 15:46:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.23-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:46:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235820

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/meta-yocto-bsp-11-15-yocto-bsps-update-to-v6.18.20.patch

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

