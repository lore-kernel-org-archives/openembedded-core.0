Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB75AEA3F36
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 10:00:53 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16614.1770717652063167683
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 02:00:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=2/H9C1AY;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=PNES0frN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019c46ff2150-c2b795c2-726b-4274-8690-58a40f98be10-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1770717651; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=PGMpZL9g8EieidTq3l60uQAuR+h/1OUswEUvwJJCUjE=;
	b=2/H9C1AYR2PIUi/I/FEp7Q+mObxdB0cX4neH3dQFNUcBzD6aIZ2kWFjykDApsTEY
	S+dCKwq3wSsRc0SO8Cxm/c15UdvIeOgkIEqhX5MQhsS7XoZ4ok4Jn1ePMhruDxOsdu0
	dSgveyFKX/21SHkK/UJFJir1Oe9R7PGjrE8xQQE4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1770717651;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=PGMpZL9g8EieidTq3l60uQAuR+h/1OUswEUvwJJCUjE=;
	b=PNES0frNwLR0mrRo87ViSFQdBlqq7IdW+jQkkyQAX3lPsW7Q2/lsvmLX6la+Ob+3
	/BhIGUrvNyreR4oR7loKBjlf/1GExXgv6vezI8KaGbvi7bIx6GyPupBIGnNpLTSiOSY
	Bu1xB3zCdTDyFwMQqzBE6iXm0HSFUXi/22CWBiQw=
From: patchtest@automation.yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH 3/3] gnupg: 2.5.14 -> 2.5.17
In-Reply-To: <20260210095025.633860-3-hongxu.jia@windriver.com>
References: <20260210095025.633860-3-hongxu.jia@windriver.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019c46ff2150-c2b795c2-726b-4274-8690-58a40f98be10-000000@us-west-2.amazonses.com>
Date: Tue, 10 Feb 2026 10:00:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.10-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 10:00:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230877

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/3-3-gnupg-2.5.14---2.5.17.patch

FAIL: test commit message presence: Please include a commit message on your patch explaining the change (test_mbox.TestMbox.test_commit_message_presence)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
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

