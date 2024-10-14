Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C93CFC52F
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 09:33:55 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.50903.1728898433712276954
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 02:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=FvjV4OxG;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=iHDfIWIw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101928a607ef5-87d667ee-4d95-4650-9e29-5b65921bdf71-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728898432; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=xbUbC0fHLlhN3VUQ1aze4Pwaq/hcHxyC1N5e+SZsXrw=;
	b=FvjV4OxGfN0/GM2E3BM6vIQ7Pp/Fxlk+V1wHrsvmv5OqXffdDb59YbmGYfkvqUMs
	K+PUDo1XL782CqFvoijQxsja66hbIsh/PEPu6p/W5R8hJ0prx8612kBkCGR8MheRStf
	/K/arHNKbuBasS7KuWwC9lcAfKN4k/2Mii+englc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728898432;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=xbUbC0fHLlhN3VUQ1aze4Pwaq/hcHxyC1N5e+SZsXrw=;
	b=iHDfIWIwAHR9badxNXEQVtQoI2JdkQ6UVHoK0AWDx5sJpIqj+HM/BubW9GGQp++X
	IlBLUNyvNAiD7MMmUOYDjW3di8XqQ06UAp3w6pF3DDpNwgSD+22Ak/bE1WJA9YyDMxM
	Ft07JCTPZ5arQMa9yOyI1i/cQ6zzyGVLjont3is8=
From: patchtest@automation.yoctoproject.org
To: ecordonnier@snap.com
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH] makedumpfile: import 1.7.5 from meta-openembedded
In-Reply-To: <20241014091117.2953622-2-ecordonnier@snap.com>
References: <20241014091117.2953622-2-ecordonnier@snap.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <010101928a607ef5-87d667ee-4d95-4650-9e29-5b65921bdf71-000000@us-west-2.amazonses.com>
Date: Mon, 14 Oct 2024 09:33:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.14-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 09:33:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205736

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/makedumpfile-import-1.7.5-from-meta-openembedded.patch

FAIL: test lic files chksum modified not mentioned: LIC_FILES_CHKSUM changed without "License-Update:" tag and description in commit message (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)

PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_status_presence_format)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test lic files chksum presence (test_metadata.TestMetadata.test_lic_files_chksum_presence)
PASS: test license presence (test_metadata.TestMetadata.test_license_presence)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test src uri left files (test_metadata.TestMetadata.test_src_uri_left_files)
PASS: test summary presence (test_metadata.TestMetadata.test_summary_presence)
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

