Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D68FEEF42
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 13:31:50 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81432.1775568704388115546
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 06:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=RTO1rQXJ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=4Iwu+RzI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019d6824505d-8e443dc6-f48e-4ac3-a174-d84ad3912b9e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775568703; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=hXeAW+LYWZjfweCMVaQNoiM2Q/lywQAkdkdMafdcW6E=;
	b=RTO1rQXJRfv06w80snNQQeB4pafdb196/h6uJCCsSo8g7iBu/FykLI/aF3BOQ/uP
	8N6s62lguHIi/pcfit1kn9I2uLDBGre02TZW/sKpjvdTSD5ZPzXJJP29RaKZ7CCK+LJ
	ls/cwVUTWmumMkWLO0BncfWc3oJepoNPMtKZOEOw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775568703;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=hXeAW+LYWZjfweCMVaQNoiM2Q/lywQAkdkdMafdcW6E=;
	b=4Iwu+RzICRH28ZiUkoFwkjyiJjej3ylWqiswuX8UJbOsY/O3Q5EuMSj3nZWobPPY
	LQhWWYh9c0LRSRJwGsbAltM0+fly9znnnoz19C2ulsZCDa6RVWONz1Q5SET7mfQh8M6
	vAFR8Ejaik5Q2jGvByD0jAgkTpNZZ8e5soWMI5b8=
From: patchtest@automation.yoctoproject.org
To: =?utf-8?b?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [whinlatter][PATCH 1/2] binutils: Fix build with GLIBC 2.43 on the
 host
In-Reply-To: <20260407131555.838073-1-zboszor@gmail.com>
References: <20260407131555.838073-1-zboszor@gmail.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019d6824505d-8e443dc6-f48e-4ac3-a174-d84ad3912b9e-000000@us-west-2.amazonses.com>
Date: Tue, 7 Apr 2026 13:31:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.07-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 13:31:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234734

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/whinlatter-1-2-binutils-Fix-build-with-GLIBC-2.43-on-the-host.patch

FAIL: test Signed-off-by presence: A patch file has been added without a Signed-off-by tag: '0001-gprofng-protect-against-standard-library-macros.patch' (test_patch.TestPatch.test_signed_off_by_presence)

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

