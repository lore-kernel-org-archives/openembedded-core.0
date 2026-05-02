Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E48CD3423
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:49:56 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9721.1777740595556849590
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:49:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=zM4OZEtf;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=f2sCbDuJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019de998bf52-6ed7d6fe-c9f9-4566-b348-33382439e8a1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777740595; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=0yGsXx9TUDmUIU95aBjhF6fzfGefrAKvXQqA7Oi/HxI=;
	b=zM4OZEtfSAFzOhYGtkF2uOKCbFT119RQcHhAepPCWAMXYHibDyRXM4i/+QT84AB8
	s4epy9n+2FDrw3ab3uOT6nXPQlv+L01iBN7r9DUBWDP8Hsmi4IG6WUIQOdUKksVwPIa
	1YQWIAQhee5Bcl4MuIf06InfR5o27+v82WiuhbjE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777740595;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=0yGsXx9TUDmUIU95aBjhF6fzfGefrAKvXQqA7Oi/HxI=;
	b=f2sCbDuJSUkjRsD/3+eMhUpezm1AeVrfaMmEFWiX3kRGj42IecOzlMWZWBqwhfW0
	WG0UTe/muCOZzkrK9u+WCUubILfLy8FpNgk30XxoBIn+usUrzvzpEZgibbZz7VpW/Zz
	0pCzfchLz/ZgfwHG9rcxJ0OAx0ZADii3rHnq+Zr8=
From: patchtest@automation.yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH 47/62] python3-testtools: upgrade 2.9.0 -> 2.9.1
In-Reply-To: <20260502162929.1377831-47-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-47-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019de998bf52-6ed7d6fe-c9f9-4566-b348-33382439e8a1-000000@us-west-2.amazonses.com>
Date: Sat, 2 May 2026 16:49:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.02-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:49:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236412

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/47-62-python3-testtools-upgrade-2.9.0---2.9.1.patch

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

