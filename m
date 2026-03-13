Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64904106ACFF
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 00:00:48 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4674.1773360044229717963
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 17:00:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=YJQERDto;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HZfV7h5t;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019ce47ed4cc-76ea34e3-7c42-4ed0-8658-390e8e0e4d1c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773360043; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=RFt+bqRlz19Bgm56r+Uyc7oZ0BnB+q6vONWlUqDg9UA=;
	b=YJQERDtonuov12J12c5UECo/1ICN4q9cpAjMHT+rG8yY/wT5nrW9yW1lv3GyUxbY
	sr/S7QEHeOyYMHNgNMI3yao/C+Syxbw4Bk4KVnrNSeefNg2amqtGwMBytW9gCmhyLju
	NP7ZjqgZTMtWMrWgShZsZBCRMiuMqJfFqNKlpZRE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773360043;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=RFt+bqRlz19Bgm56r+Uyc7oZ0BnB+q6vONWlUqDg9UA=;
	b=HZfV7h5tj1H0687R0oqTOksaDgmsQRCSYq1qzkTh4zxbgA4wCUq99c3Ikygs+BBa
	J7ToKQQcrmT//df/3StwVBtK3Y3fOvYDk2HS3SWTgdQgTy4nLKmDoyHUtDjYdEE+yJe
	lDrBfGQKsUivBv9Gpl2jfZxol5iR020U+bmKNu3A=
From: patchtest@automation.yoctoproject.org
To: Michael Halstead <mhalstead@linuxfoundation.org>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH] yocto-uninative: Update to 5.1 for glibc 2.43
In-Reply-To: 
 <CADfgfoZzWdveZE7D7OnGztj8gyH-bQ=2F__jSdf_sSM_j2nrQw@mail.gmail.com>
References: 
 <CADfgfoZzWdveZE7D7OnGztj8gyH-bQ=2F__jSdf_sSM_j2nrQw@mail.gmail.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019ce47ed4cc-76ea34e3-7c42-4ed0-8658-390e8e0e4d1c-000000@us-west-2.amazonses.com>
Date: Fri, 13 Mar 2026 00:00:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.13-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 00:00:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233014

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/yocto-uninative-Update-to-5.1-for-glibc-2.43.patch

FAIL: test mbox format: Series has malformed diff lines. Create the series again using git-format-patch and ensure it applies using git am (test_mbox.TestMbox.test_mbox_format)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: Python-unidiff parse error (test_python_pylint.PyLint.pretest_pylint)
SKIP: test CVE tag format: Parse error Hunk diff line expected: "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
SKIP: test Signed-off-by presence: Parse error Hunk diff line expected: "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
SKIP: test Upstream-Status presence: Parse error Hunk diff line expected: "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test pylint: Python-unidiff parse error (test_python_pylint.PyLint.test_pylint)
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

