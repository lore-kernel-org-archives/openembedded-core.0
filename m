Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D20C982C1
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 08:31:09 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10190.1789547464939753594
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 01:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EICC7vOg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NWBtI0XO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a0a95744d4-0cbaf9a7-f881-4434-9e7f-cc8f0b5f1a29-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789547464; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=mfP2d3aImoVPrly63EJjC7lj9/Fb87ArlpGzBQLIC3k=;
	b=EICC7vOg820vejxGafTFYF0QNVpud+p6U9XTiDtn2IqYQAlFnmrziZTgmGwVFKNw
	N0hhFZY9uXwLB3OsZJqJMBv/sNAWN7Os+SA+GYROkFdak6Es7egHT7H8uNy+5b4nMtp
	3yuUKf/ycnIhmYdIUM1ExcELXLGlroj6eQUlpXKg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789547464;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=mfP2d3aImoVPrly63EJjC7lj9/Fb87ArlpGzBQLIC3k=;
	b=NWBtI0XOzlwZWZMs4NhU3m1oGtGl15o8Rol8Qq8FUX9ZSJYHBEq97uctRC4tkuwN
	nSAg+6wNISWUyyz1j9sI1iOXGbCx7Xu2Kn6KeC1lSSBeBoSrU513Ll/UEcj4RyqonoN
	/MKMPXscAl5Oo28dxGZepjFuOycFaAd3B+3tbOWU=
From: patchtest@automation.yoctoproject.org
To: Pratik Farkase <pratik.farkase@est.tech>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][PATCH v2] psmisc: add ptest support
In-Reply-To: <20260916081624.11957-1-pratik.farkase@est.tech>
References: <20260916081624.11957-1-pratik.farkase@est.tech>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <010101a0a95744d4-0cbaf9a7-f881-4434-9e7f-cc8f0b5f1a29-000000@us-west-2.amazonses.com>
Date: Wed, 16 Sep 2026 08:31:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 08:31:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245936

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/v2-psmisc-add-ptest-support.patch

FAIL: test mbox format: Series has malformed diff lines. Create the series again using git-format-patch and ensure it applies using git am (test_mbox.TestMbox.test_mbox_format)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test auh changelog truncation notice (test_mbox.TestMbox.test_auh_changelog_truncation_notice)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: Python-unidiff parse error (test_python_pylint.PyLint.pretest_pylint)
SKIP: pretest src uri left files: Patch cannot be merged (test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test CVE check ignore: No modified recipes or older target branch, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
SKIP: test CVE tag format: Parse error Unexpected hunk found: @@ -25,6 +26,48 @@ do_configure:prepend() {
SKIP: test Signed-off-by presence: Parse error Unexpected hunk found: @@ -25,6 +26,48 @@ do_configure:prepend() {
SKIP: test Upstream-Status presence: Parse error Unexpected hunk found: @@ -25,6 +26,48 @@ do_configure:prepend() {
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test lic files chksum modified not mentioned: No modified recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
SKIP: test pylint: Python-unidiff parse error (test_python_pylint.PyLint.test_pylint)
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
SKIP: test src uri left files: Patch cannot be merged (test_metadata.TestMetadata.test_src_uri_left_files)
SKIP: test summary presence: No added recipes, skipping test (test_metadata.TestMetadata.test_summary_presence)

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

