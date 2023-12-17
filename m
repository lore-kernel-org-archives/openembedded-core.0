Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20FB5C3DA6E
	for <webhook@archiver.kernel.org>; Sun, 17 Dec 2023 23:02:41 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.29377.1702854155971355341
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Dec 2023 15:02:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UyFPZ9o+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kGAdAQZ1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018c7a045b3e-d452d2bf-f59f-4fbd-b462-637c5cc11d34-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1702854155; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date;
	bh=0BpdPYmNDlzNh9QDgwLhBpHJDP3D1tLJ7uL0YCmf+0Q=;
	b=UyFPZ9o+E6avZH8ByoCZOnqCZvtvMEQky3BYL8FfXrtNj6xiqB8jXvrlx3LzkLsQ
	c0vQkdx6bWgh+38HUx5wf9lELgoSii+AYQCJTiOb5rBo1t2pChI7a1I2ZLK6C3e34um
	rhqlg9tPDd/hujWc+UcnHW0QraSzSqxpQ7KlcSTg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1702854155;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=0BpdPYmNDlzNh9QDgwLhBpHJDP3D1tLJ7uL0YCmf+0Q=;
	b=kGAdAQZ1vgM84G2SMiK6oFjJ/ovGkFaBNcb1FwOAxzpm7EMjUCkMEuUA/swEqMCC
	K2X/77P1xAIWpm4dmL+rIc6cRKVke8ZcA7KKQ9w7W2FqJ8n0wUEgIm2g0kiZfsmZzgz
	Gbv/hk4d2W2EnoT+3ikdWpM2Y5EsqcKVesngmdgE=
From: patchtest@automation.yoctoproject.org
To: Tim Orling <ticotimo@gmail.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH] oeqa: add runtime 'maturin develop' test case
In-Reply-To: 20231217225128.22995-1-tim.orling@konsulko.com
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018c7a045b3e-d452d2bf-f59f-4fbd-b462-637c5cc11d34-000000@us-west-2.amazonses.com>
Date: Sun, 17 Dec 2023 23:02:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.17-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Dec 2023 23:02:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192594

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/oeqa-add-runtime-maturin-develop-test-case.patch

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
SKIP: test CVE tag format: Parse error Hunk is shorter than expected (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: Parse error Hunk is shorter than expected (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: Parse error Hunk is shorter than expected (test_patch.TestPatch.test_upstream_status_presence_format)
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

