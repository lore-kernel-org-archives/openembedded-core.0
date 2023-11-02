Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 149B0C4167D
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 19:27:51 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.41715.1698953264514494398
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 12:27:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZodFztkk;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gvDctlo8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018b91817aa7-5bb71c82-fc57-4151-a9ca-c9bd94402f6c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698953263; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date;
	bh=zUbYsY8g2oxN+glLPN3tTRqBHMh9usz05uCh/GEvfFQ=;
	b=ZodFztkknmk0SPw3SlmqAprbhyUBo9vX4rAyKb84qIrkMqLVazz2uOFNgouxJ4sg
	fRG69i3BhZSSdn+V1g6Zx9j/H0c7rHLALJnDwaHZFHZpTtOQ+A00wudnrpfR6MxJiKV
	06sZ7eE31M/8tG41Pqp3RSqqBnS90nC52TGuH3Z8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698953263;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=zUbYsY8g2oxN+glLPN3tTRqBHMh9usz05uCh/GEvfFQ=;
	b=gvDctlo8boG6BEcs92r57TJfx+BfIGeFWkwE6a+Ji0HBx7ve1QnHkCkT0baPGl7A
	+mgZcQVu+MCJSdHWTg4v+S6hc5+CLETq9GDzbOfRcnLX+Id81boWsCt10yE6I/c30xo
	pBrmb3VvxF0CtO9KVqjjtZGDNRqBPLKS6WdY69nU=
From: patchtest@automation.yoctoproject.org
To: raj.khem@gmail.com
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH 5/6] rust-cross-canadian: Add riscv64 to cross-canadian hosts
In-Reply-To: 42c5e77d7bb58199c996c5107b77dedf705ab400.1698951553.git.raj.khem@gmail.com
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018b91817aa7-5bb71c82-fc57-4151-a9ca-c9bd94402f6c-000000@us-west-2.amazonses.com>
Date: Thu, 2 Nov 2023 19:27:43 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.02-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 19:27:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190101

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/5-6-rust-cross-canadian-Add-riscv64-to-cross-canadian-hosts.patch

FAIL: test commit message presence: Please include a commit message on your patch explaining the change (test_mbox.TestMbox.test_commit_message_presence)
FAIL: test max line length: Patch line too long (current length 375, maximum is 200) (test_metadata.TestMetadata.test_max_line_length)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)

SKIP: pretest lic files chksum modified not mentioned: No modified recipes, skipping pretest (test_metadata.TestMetadata.pretest_lic_files_chksum_modified_not_mentioned)
SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
SKIP: pretest src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test lic files chksum modified not mentioned: No modified recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
SKIP: test src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.test_src_uri_left_files)
SKIP: test summary presence: No added recipes, skipping test (test_metadata.TestMetadata.test_summary_presence)
SKIP: test target mailing list: Series merged, no reason to check other mailing lists (test_mbox.TestMbox.test_target_mailing_list)

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

