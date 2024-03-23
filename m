Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685B5C54E58
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 19:04:10 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.15278.1711220649448884815
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Mar 2024 12:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PWKNe5wf;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=0qUFpoaU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018e6cb2eaa5-25ddaf05-1aa3-4b4a-9bac-61c3822df829-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711220648; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=5tFcQ5rnuVJ8DM8eaLWX/AzLZ0E8CDy+6pXyHg4Zkf8=;
	b=PWKNe5wfxZ3b2kH5ipvWqIdQMQsvwDYcgp+fYe3IYWW5X+HkrdFSziiFRNIXMU7O
	Z1piOL6IcO8x91q/mTH7Rdk4I8KFrbHtizpkPxKrqlgkvo8ZpiDEQ44ZW9Ss/VXrg7q
	fU5HdP7J5i2qwbkGFNKcos6FxPypGVxkLI3sghYQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711220648;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=5tFcQ5rnuVJ8DM8eaLWX/AzLZ0E8CDy+6pXyHg4Zkf8=;
	b=0qUFpoaUKF0kYKkqj7gjBSl8MQi/RoYosmiorEDO5Et4vEP7aN7BtkDLhybuMRFC
	j2p9g/S93+tKsMjBB6GKv9JArqUAGj4ETbSvdPscbc474k+bT/gLwqnO8AnbzS5PwFt
	ptl7oFZ+QYu5/dSB4opPIsRXOZdixcIhWpp5ISZA=
From: patchtest@automation.yoctoproject.org
To: Alibek Omarov <a1ba.omarov@gmail.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH RESEND] wpa-supplicant: add support for building without DBus
In-Reply-To: <x1Pa.1711219993562897943.5Sfr@lists.openembedded.org>
References: <x1Pa.1711219993562897943.5Sfr@lists.openembedded.org>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018e6cb2eaa5-25ddaf05-1aa3-4b4a-9bac-61c3822df829-000000@us-west-2.amazonses.com>
Date: Sat, 23 Mar 2024 19:04:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.23-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Mar 2024 19:04:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197468

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/RESEND-wpa-supplicant-add-support-for-building-without-DBus.patch

FAIL: test mbox format: Series has malformed diff lines. Create the series again using git-format-patch and ensure it applies using git am (test_mbox.TestMbox.test_mbox_format)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: Python-unidiff parse error (test_python_pylint.PyLint.pretest_pylint)
SKIP: pretest src uri left files: Patch cannot be merged (test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test CVE check ignore: No modified recipes or older target branch, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
SKIP: test CVE tag format: Parse error Unexpected hunk found: @@ -25,9 +25,10 @@ S = "${WORKDIR}/wpa_supplicant-${P V}"
SKIP: test Signed-off-by presence: Parse error Unexpected hunk found: @@ -25,9 +25,10 @@ S = "${WORKDIR}/wpa_supplicant-${P V}"
SKIP: test Upstream-Status presence: Parse error Unexpected hunk found: @@ -25,9 +25,10 @@ S = "${WORKDIR}/wpa_supplicant-${P V}"
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

