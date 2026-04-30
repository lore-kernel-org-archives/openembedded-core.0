Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2206CD13D3
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 16:30:56 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2981.1777566649683293881
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 09:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=oj1cBk7K;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=biMWayB3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019ddf3a89a3-22d532f4-5a53-4fb3-b703-2b9c2a0dd3fc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777566648; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=fnfa5CSKQP2dHfK9rgeA1iguqgEqh5sgQ2clcsNzpB8=;
	b=oj1cBk7Kcv8eZqPNGYDyMvmNjfMKn5dzVSs7MzAjH66oikKP96WElycB4x65UPW4
	+Iix4NWOjSCTO7lvtZxcvenEHW6Q9gdK05GSAjVw9dcM+h/2oKP3erw9sCTsNlk0uD0
	SiiBQqXXljzhvTImgKjqt1Bq6R6H8s6CdFbIVObA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777566648;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=fnfa5CSKQP2dHfK9rgeA1iguqgEqh5sgQ2clcsNzpB8=;
	b=biMWayB3qzDACiIhQeSu2nHVCgqyKa9oljgMrOdJZpjk19a+PrAsLDs0lGbZ78aM
	2zuuFe7FUWbYBLylOfgdDDwxbQUH+mQaFilE0wcF6SG8SeUjtpvjJbQKEzaZkFXSDc/
	xlNDL7QIJhtEqWeiFUfiihgBhfsdvoVrQfMgbdsE=
From: patchtest@automation.yoctoproject.org
To: Dan McGregor <danismostlikely@gmail.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH 2/2] python3-requests: Increase chardet upper limit
In-Reply-To: <20260430161702.77076-2-danismostlikely@gmail.com>
References: <20260430161702.77076-2-danismostlikely@gmail.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019ddf3a89a3-22d532f4-5a53-4fb3-b703-2b9c2a0dd3fc-000000@us-west-2.amazonses.com>
Date: Thu, 30 Apr 2026 16:30:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.30-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 16:30:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236177

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/2-2-python3-requests-Increase-chardet-upper-limit.patch

FAIL: test Signed-off-by presence: A patch file has been added without a Signed-off-by tag: '0001-Increase-chardet-upper-limit-to-7.patch' (test_patch.TestPatch.test_signed_off_by_presence)

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

