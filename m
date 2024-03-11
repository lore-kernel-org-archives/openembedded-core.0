Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F1DC54E5D
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 17:41:42 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.1253.1710178893151675418
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 10:41:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=afPeByoL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=G6yEIo/8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018e2e9af93e-c1d40585-9802-450a-b5f8-4fcd47b3797b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710178892; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=wuU37cM5U+vGz0/legSBQruoR6SZCvzSNF54B92rwQs=;
	b=afPeByoLFvB4hn2r9Cijmle87fToqF2ODOKXPCbXuQxo1/s29VR6j8ZSeTeDVzkT
	p1yFKODS7Q3Y58V1QTXO7zS0/6c2aac2AmZ73kLZcIOMe9b2TF1rOs8uc+OK4vfmAaj
	jI9thoxV+PlY0NybahVuvejTUfkcha2vqvCbtalM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1710178892;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=wuU37cM5U+vGz0/legSBQruoR6SZCvzSNF54B92rwQs=;
	b=G6yEIo/86yos+nNUZi1pmLRlqe5rwX8Xzo6nGHHBGr1hT3Gj1FPnI8rzGytfMO70
	6an34D0+g0e2uPX2iCah3y2iehVzO+buSN6ot9CBcoYuuEnrjoMTgH4IKj9Wqd/4hlA
	KZhFvXknNEDwBxJsUP8tOvO1/+4DH3FEvIgL+qHk=
From: patchtest@automation.yoctoproject.org
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH 1/7] openssh: replace complete configuration files by patch
In-Reply-To: 
 <c9c255c5e5c0a01ac9110f7e4745ede3c11b9431.1710177387.git.enrico.scholz@sigma-chemnitz.de>
References: 
 <c9c255c5e5c0a01ac9110f7e4745ede3c11b9431.1710177387.git.enrico.scholz@sigma-chemnitz.de>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018e2e9af93e-c1d40585-9802-450a-b5f8-4fcd47b3797b-000000@us-west-2.amazonses.com>
Date: Mon, 11 Mar 2024 17:41:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.11-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 17:41:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196961

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/1-7-openssh-replace-complete-configuration-files-by-patch.patch

FAIL: test Signed-off-by presence: A patch file has been added without a Signed-off-by tag: 'include-conf.patch' (test_patch.TestPatch.test_signed_off_by_presence)
FAIL: test Upstream-Status presence: Upstream-Status is Inappropriate, but no reason was provided (test_patch.TestPatch.test_upstream_status_presence_format)

PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test lic files chksum modified not mentioned (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test src uri left files (test_metadata.TestMetadata.test_src_uri_left_files)

SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
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

