Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C630FCB602
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 14:16:11 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39355.1772979367782062528
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 07:16:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZLBzjriU;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=UqaZ+wVK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019ccdce2bc2-392db9ef-a3c9-4122-84bb-87f974e3496b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1772979367; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=SHSVUEWWFMhiJjL3d3ZqKEbrZP5+pdP/9SvNzxFzms0=;
	b=ZLBzjriU87qJZpf2YSEqA2rfWp5KSPdarUzW6/MVHGt0Gwo5eAXsK2ghtoVTMy5z
	9EBnbo/RqWpx86C0Oer6+noWj/JfRhwcnX9EB9pbAbPftKhold26dmeaedGE7E3u9DZ
	U/SMxNs/1NIUFzAhjdFfDRQfq8pnwLSRLaFcpRv0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1772979367;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=SHSVUEWWFMhiJjL3d3ZqKEbrZP5+pdP/9SvNzxFzms0=;
	b=UqaZ+wVKvmLPrLu+mI3P8gcwdwvIDlzv/xzyPJeZk6y5l6OkmL7MdwU+ttfZObyO
	07CA0b6f6wsKkWT5engRJBMMiDHrEPNigwUOBZyUWQlc98lJ9CEaPvjb5nVyRuvs364
	71uMNGxTgAXATC5+2BvksX/PL1o1F498839duglE=
From: patchtest@automation.yoctoproject.org
To: Hemanth.KumarMD@windriver.com
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH 7/7] ltp: workaround openat2 build failure with glibc 2.43
In-Reply-To: <20260308140337.2503858-7-Hemanth.KumarMD@windriver.com>
References: <20260308140337.2503858-7-Hemanth.KumarMD@windriver.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019ccdce2bc2-392db9ef-a3c9-4122-84bb-87f974e3496b-000000@us-west-2.amazonses.com>
Date: Sun, 8 Mar 2026 14:16:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.08-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 14:16:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232651

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/7-7-ltp-workaround-openat2-build-failure-with-glibc-2.43.patch

FAIL: test Signed-off-by presence: A patch file has been added without a Signed-off-by tag: '0001-ltp-fix-build-failure-with-glibc-2.43.patch' (test_patch.TestPatch.test_signed_off_by_presence)

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

