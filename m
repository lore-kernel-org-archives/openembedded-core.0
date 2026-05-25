Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7ADFCD5BCF
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 19:16:00 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22663.1779736559463368090
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2026 12:15:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gZfgmP5x;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=I8N4Il+D;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019e6090bc3c-ec84c8a4-eebb-479a-bf98-1e4dbd05679c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1779736558; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=TRWWYMw5srQeP81F5GoK3/0I27EifSpynYOr1VY8O8M=;
	b=gZfgmP5xBhwiqwWt6pyQTNCO7Gt8yuFl2cZ/S6gBzJ0E6H1imeQz/uyKy3GF9ADM
	Ix6NgIMcwpr1tgu5uLn5+1ye+UJizWBXJuNY+gnXacliw0OlyySPKoO05VnxrNGmZ24
	wFrHBH582UV5XIoarzkwSK8DlKjxMGFFxFmOri2I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1779736558;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=TRWWYMw5srQeP81F5GoK3/0I27EifSpynYOr1VY8O8M=;
	b=I8N4Il+DkGwaf3KlUl9SRRcvSjSh8/naf4Rvx/s8qaSYq5kJ1l6EgmFWLl2HrrJd
	BGT6bL4RDPJavfrVDagbQxBt0mQ+hSsuOJ5UwUjFV8pJb2TjayUOpBQ0JFtW0udV+ui
	otXc+1pF6EFP72am1JcovKI4JtjMywwReaxUwzxc=
From: patchtest@automation.yoctoproject.org
To: Suresh H A <sureshannaiah.mailbox@gmail.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [poky][scarthgap][PATCH v3] systemd: backport patch to fix
 journal-file issue
In-Reply-To: <20260525190926.2812079-1-sureshannaiah.mailbox@gmail.com>
References: <20260525190926.2812079-1-sureshannaiah.mailbox@gmail.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019e6090bc3c-ec84c8a4-eebb-479a-bf98-1e4dbd05679c-000000@us-west-2.amazonses.com>
Date: Mon, 25 May 2026 19:15:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.25-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 May 2026 19:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237580

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/poky-scarthgap-v3-systemd-backport-patch-to-fix-journal-file-issue.patch

FAIL: test Signed-off-by presence: A patch file has been added without a Signed-off-by tag: '0023-journal-file-do-not-trigger-assertion-on-removed-or-.patch' (test_patch.TestPatch.test_signed_off_by_presence)

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

