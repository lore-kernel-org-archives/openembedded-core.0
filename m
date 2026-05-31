Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D01CD4F54
	for <webhook@archiver.kernel.org>; Sun, 31 May 2026 00:31:45 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17116.1780187498452024417
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 May 2026 17:31:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=IrPklz15;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=KevdgWmk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019e7b7184bb-a0f541d9-e30f-4268-82e8-44d0b866ddcc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780187497; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=GOtraT2UDMlY2FNQibyAVGexXI8Bqh63oJ1kl7V+5Jw=;
	b=IrPklz15RJNTUXYDrl3Y/gYoPRC40/RcfmFbfwlfjvl2R3a1YVZliPsxcGsvzIrJ
	nTrwsHkELyZFcxc1Q3z6CccS7ulRR3puwOWs4Tat2dqDfGZYXsn/at1Fcq+deEXiMWS
	hsEEv2v4lagzmPcO574vJfAxg3uw4rjfXjDMfCdk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780187497;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=GOtraT2UDMlY2FNQibyAVGexXI8Bqh63oJ1kl7V+5Jw=;
	b=KevdgWmk89CheUqpQdjzQFu/yqbJ5DmnqiESYMuocmQAjPxStSQn0R0DJ7YKH2Xy
	HfzQN2AFdOmYNd8lf6S5XhjOo7UPjv/JYMZ+h3qm/8R4h9555dLFl+T4nmTzzgqtrCv
	GpeM9nwAuseRWB5kRYcntlha9s2SVuNBIoi0Py6M=
From: patchtest@automation.yoctoproject.org
To: tim.orling@konsulko.com
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH 5/9] python3-pytz: upgrade 2026.1 -> 2026.2
In-Reply-To: <20260531001756.1582306-5-tim.orling@konsulko.com>
References: <20260531001756.1582306-5-tim.orling@konsulko.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019e7b7184bb-a0f541d9-e30f-4268-82e8-44d0b866ddcc-000000@us-west-2.amazonses.com>
Date: Sun, 31 May 2026 00:31:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.31-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 May 2026 00:31:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237789

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/5-9-python3-pytz-upgrade-2026.1---2026.2.patch

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

