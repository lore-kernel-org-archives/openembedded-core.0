Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A363ACD3427
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:49:28 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9857.1777740564769065309
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:49:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=RCikwyTL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=zEt9wTFY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019de99845c0-2d776f82-9056-4ef4-8805-2fe621236b77-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777740564; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=pE601vxjRJR+QSsBmIqyMeUP2Y130SjIcF/jh0MBDwU=;
	b=RCikwyTL++/o78eecQ/OjuYXIjON1q+s0mGi3iixM3s3gmUS6sEjXs0HpEs13a1Z
	xhvvvA5o5JomntL6Hj5sOjY3fJx1t4TM3H4CIW0HWZY+1wc97TdpniYOZGTbcoHE5WX
	N/l3HzBR7RUPgc8/CCl+eGjZXv9d1/UJmFKW/0Fk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777740564;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=pE601vxjRJR+QSsBmIqyMeUP2Y130SjIcF/jh0MBDwU=;
	b=zEt9wTFY4/QFO23rg5VEO7fOz9mmA+FKng+mMytfZbgT/8JvxyX/K3+Td9jhQA5q
	GqP08WEJPolF3bbY+fX0xoacDSZkhPh64nsBzoa0vgbW+L7mdkhOlZOro9lFMiruP36
	Zgcf914ng8q+O4sdx1CnA3JdYtmW1ouB7kdqvpOU=
From: patchtest@automation.yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH 04/62] coreutils: upgrade 9.10 -> 9.11
In-Reply-To: <20260502162929.1377831-4-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-4-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019de99845c0-2d776f82-9056-4ef4-8805-2fe621236b77-000000@us-west-2.amazonses.com>
Date: Sat, 2 May 2026 16:49:23 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:49:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236375

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/04-62-coreutils-upgrade-9.10---9.11.patch

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

