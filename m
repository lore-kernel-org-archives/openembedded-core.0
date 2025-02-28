Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF705C19776
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 05:46:26 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.9638.1740721581888507675
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 21:46:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=bwALMG5Q;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=QvkFoNX9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101954b176b05-e91fee16-1551-4ac9-b235-fce671d96bce-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740721580; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=MLp0Zx8t7JhE5aormm/j0b6mcPFt1JH1kKXihpwZe4I=;
	b=bwALMG5Qh0blzuMEH8DPeARaCxcGXLva02PaTvdWrc8BJhIiPxwiy4x5qvrEdRNq
	8kjZGQbeKUIw46jMQmwZlHLBKuOrClt8+fG2goazVXo1O/qgUMvcZrMjpIxIVr1ZuXB
	63vTDoI9kntGoQOjzuCuPKUqrZUjRGdtnze73Q04=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740721580;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=MLp0Zx8t7JhE5aormm/j0b6mcPFt1JH1kKXihpwZe4I=;
	b=QvkFoNX9VZB0F5eMIh4kwbO0EIdsY87SrO6dKs7dL5GoNYavaC5RcOUFxjmIBSYR
	pkbVB8pJGYzDeNr2HW/NGzjmSIT3j50+5CcW3i9vEUFWFKSLoTrJ9XmddylJqSPFUfS
	ZBOk4kv9zwkQFJCscpUs4qG0yoC0XUTU2y1hxwiI=
From: patchtest@automation.yoctoproject.org
To: unit exe <unitexe70@gmail.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][PATCH] python3-protobuf: upgrade 4.25.3 -> 5.29.3
In-Reply-To: 
 <CAGqXGjQPi6+Bq1eSFLJ2fusuNv0QQLv9o1ityXLGu5873r875A@mail.gmail.com>
References: 
 <CAGqXGjQPi6+Bq1eSFLJ2fusuNv0QQLv9o1ityXLGu5873r875A@mail.gmail.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <010101954b176b05-e91fee16-1551-4ac9-b235-fce671d96bce-000000@us-west-2.amazonses.com>
Date: Fri, 28 Feb 2025 05:46:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.28-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 05:46:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212050

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/python3-protobuf-upgrade-4.25.3---5.29.3.patch

FAIL: test mbox format: Series has malformed diff lines. Create the series again using git-format-patch and ensure it applies using git am (test_mbox.TestMbox.test_mbox_format)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: Python-unidiff parse error (test_python_pylint.PyLint.pretest_pylint)
SKIP: pretest src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test CVE check ignore: No modified recipes or older target branch, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
SKIP: test CVE tag format: Parse error Hunk diff line expected: https://github.com/protocolbuffers/protobuf/blob/main/third_party/utf8_range/LICENSE
SKIP: test Signed-off-by presence: Parse error Hunk diff line expected: https://github.com/protocolbuffers/protobuf/blob/main/third_party/utf8_range/LICENSE
SKIP: test Upstream-Status presence: Parse error Hunk diff line expected: https://github.com/protocolbuffers/protobuf/blob/main/third_party/utf8_range/LICENSE
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test lic files chksum modified not mentioned: No modified recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
SKIP: test pylint: Python-unidiff parse error (test_python_pylint.PyLint.test_pylint)
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
SKIP: test src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.test_src_uri_left_files)
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

