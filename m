Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5171BCD6E57
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 09:15:53 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20893.1780391752715627197
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 02:15:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bW3TCc2M;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=wEcfs5Ay;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019e879e2ebb-51655b8f-baf5-468f-87da-fd4f4e00b288-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780391751; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=NjdgJltFnwTSuML7FkLgcWTD4bNfgrEXDt49Yc2zGUg=;
	b=bW3TCc2M/jjjQeAq1qjhYWk2ha8qXJUnQ8Mdb4rOVWc4bd98wGMDMp5/ASFz9tCW
	32Vb0xN5PPiZNWCul1rCbvZANjTE9xQWdut0t3g93H3aqYN0SnT6UbQQawEuH4y7Dy3
	c4JDkIsj8k4g92o4WubNs3BSs4F29NP08SRkRewQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780391751;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=NjdgJltFnwTSuML7FkLgcWTD4bNfgrEXDt49Yc2zGUg=;
	b=wEcfs5AyiqHom91w/CBQovV5SLIH34rtjy3Pgji/6oZywElcTmNmtwJBH7sOx4It
	CAOyygxf5MpXCpoigfA9QG6xaFxxpR2tPNYQ7/NFJH3PGqFQy0KRr9qxLFTviIdBnr3
	N9HPMmLVpgQtMf6B0Y2b/yhRaH+lMzmp0/kfPi48=
From: patchtest@automation.yoctoproject.org
To: haixiao.yan.cn@windriver.com
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [wrynose][PATCH] gnutls: upgrade 3.8.12 -> 3.8.13
In-Reply-To: <20260602091035.4108103-1-haixiao.yan.cn@windriver.com>
References: <20260602091035.4108103-1-haixiao.yan.cn@windriver.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019e879e2ebb-51655b8f-baf5-468f-87da-fd4f4e00b288-000000@us-west-2.amazonses.com>
Date: Tue, 2 Jun 2026 09:15:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.02-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 09:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238022

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/wrynose-gnutls-upgrade-3.8.12---3.8.13.patch

FAIL: test CVE tag format: Missing or incorrectly formatted CVE tag in patch file. Correct or include the CVE tag in the patch with format: "CVE: CVE-YYYY-XXXX" (test_patch.TestPatch.test_cve_tag_format)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
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

