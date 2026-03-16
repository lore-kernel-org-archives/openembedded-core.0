Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0951DC5DF77
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 03:30:51 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43349.1773631843253098486
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 20:30:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=xsc+7dnE;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=2k8wbMpA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019cf4b22841-57c35a30-5cf1-4ab4-821f-c242471c2dbf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773631842; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=LU3TxoPGA+6TRbpYd+GppZch/TNdhEUfretauwLTNDg=;
	b=xsc+7dnE2AI692YXdag0Xq6M35zeo94DOEiPyd4iHv7ORWYUnmkHHHOyazc3L2JP
	XM5zdiMABibBf1NqVP1Vm0u64LWks46G5rA6tLvdqXKW24PtTdLW2SDvhOpFDauCK6A
	K4ohA7whRp3xfg0r7NtFIGMI+qYk9QNLPi5xWpE0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773631842;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=LU3TxoPGA+6TRbpYd+GppZch/TNdhEUfretauwLTNDg=;
	b=2k8wbMpAbp1la/Ag+SwazfqCzJlw+DOnkOJxZtCw/1G2Gr688LyE4kJCiEDrxqbW
	zN4FCEFeY9KjLdu8zAztm5pr9rJlCp7Mr7d9TLuNT3y9SgKtLKZWplrX/yWHDjgvaH+
	6lWUj5rfaDu8qlcx+mUScN+eGLguWBWPPFrDHLbY=
From: patchtest@automation.yoctoproject.org
To: sunilkumar.dora@windriver.com
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH V4 1/1] gdb: Upgrade 16.3 -> 17.1
In-Reply-To: <20260316032329.2695161-2-sunilkumar.dora@windriver.com>
References: <20260316032329.2695161-2-sunilkumar.dora@windriver.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019cf4b22841-57c35a30-5cf1-4ab4-821f-c242471c2dbf-000000@us-west-2.amazonses.com>
Date: Mon, 16 Mar 2026 03:30:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 03:30:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233205

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/V4-1-1-gdb-Upgrade-16.3---17.1.patch

FAIL: test Upstream-Status presence: Upstream-Status is Submitted, but it is not mentioned where (test_patch.TestPatch.test_upstream_status_presence_format)

PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
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

