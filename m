Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC47C5475B
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 11:33:06 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.19782.1709897576450021608
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Mar 2024 03:32:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VUE6e875;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=d75vrfY9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018e1dd66c95-f78b9d2a-f99f-4c7d-9cfc-dfc0f94529e1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709897575; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=rC9h75lUtnNsfjdvY1wssI8wl9p1Xx24vNWPNMxTXAk=;
	b=VUE6e875v6daxjNEB82LV6E/vKHEIU8r9JzisqKqGI4Q06uUNo2q/UgcGTckX1x6
	gzDpk3FrD4Ng9+1ux3P6xNI5t+l/0sGo5t4L9jjfguNEZbwosoadGYTpFZh0omN2ysZ
	s6eyPWbRx5q64sBAcntytZrn9MBIgLhsQVvDrwqs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709897575;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=rC9h75lUtnNsfjdvY1wssI8wl9p1Xx24vNWPNMxTXAk=;
	b=d75vrfY9pp8u66RYmrPfthtKFjLSXpqfkhSvTPQLu/RWvFl/n8fHa3wKxOcKs3aj
	StktUwrIWvjN+k/cEae0AZDrR7YyyCF7WDK0YNrCV/xzlBoF3BjiAoATX2UJ16Cn/Lh
	G+zjW7V8BRUaVXkeCkPDcUUXBEljE49MsTunuGMs=
From: patchtest@automation.yoctoproject.org
To: =?utf-8?b?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for Yocto rpm packages do not keep the modified CONFFILES (was: BB
 Equivalent for %config(noreplace))
In-Reply-To: <0e38566f-a1f9-4ebb-8492-2c50945eeeb4@gmail.com>
References: <0e38566f-a1f9-4ebb-8492-2c50945eeeb4@gmail.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018e1dd66c95-f78b9d2a-f99f-4c7d-9cfc-dfc0f94529e1-000000@us-west-2.amazonses.com>
Date: Fri, 8 Mar 2024 11:32:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.08-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 11:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196849

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/Yocto-rpm-packages-do-not-keep-the-modified-CONFFILES-was-BB-Equivalent-for-config-noreplace.patch

FAIL: test Signed-off-by presence: Mbox is missing Signed-off-by. Add it manually or with "git commit --amend -s" (test_mbox.TestMbox.test_signed_off_by_presence)
FAIL: test mbox format: Series has malformed diff lines. Create the series again using git-format-patch and ensure it applies using git am (test_mbox.TestMbox.test_mbox_format)
FAIL: test shortlog length: Edit shortlog so that it is 90 characters or less (currently 97 characters) (test_mbox.TestMbox.test_shortlog_length)

PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: Python-unidiff parse error (test_python_pylint.PyLint.pretest_pylint)
SKIP: pretest src uri left files: Patch cannot be merged (test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test CVE check ignore: No modified recipes or older target branch, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
SKIP: test CVE tag format: Parse error Unexpected hunk found: @@ -250,13 +250,19 @@ python write_specfile () {
SKIP: test Signed-off-by presence: Parse error Unexpected hunk found: @@ -250,13 +250,19 @@ python write_specfile () {
SKIP: test Upstream-Status presence: Parse error Unexpected hunk found: @@ -250,13 +250,19 @@ python write_specfile () {
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

