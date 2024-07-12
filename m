Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF1FC2BD09
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 13:34:22 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.7847.1720791258846748278
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 06:34:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=KkQtbunS;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=pxSea1h1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010190a726d3f6-73cc2343-2986-45a8-b01b-c86b0cf6d031-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1720791258; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=q8iIWN9MYW2fzthRCnMIlT30QHBSmSXtZTBKfYpJuwM=;
	b=KkQtbunSHQuqXTNKkLERzfyq4uStnVgz2TZ2nyFRQ/gYQbh40EIOB6D9DTpAZGer
	b7mfrWTag0PWORw/F+UzMWFDqr6FYDlp/en2dsoF2k3LwCLXGH0V2d8k3zi/i7Jh76S
	fblrNyJOKRs4pu36P5IQB1qwXXZGtWHizHPxhJQI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1720791258;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=q8iIWN9MYW2fzthRCnMIlT30QHBSmSXtZTBKfYpJuwM=;
	b=pxSea1h1rBwKaFIYjkMM/fSMPVjn5bq4OIXYju54+d0GhSGDRQwsBtHwMK+shclh
	eB6/dRcTY8Gr6wGx6tDm+HFZOIfBGvl5aAhPZ0+7jcOuuupK4KaT7I939ZHzDkiDa7s
	PL4xHa8hY+6sNaTfqxKGYxMHSy7/8tlNynNv9TCc=
From: patchtest@automation.yoctoproject.org
To: "Gassner, Tobias.ext" <tobias.gassner.ext@karlstorz.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH] execute pkg_postinst_ontarget task for read only rootfs when
 read-only-rootfs-delayed-postinsts is set
In-Reply-To: <20240712131551.3516167-1-tobias.gassner.ext@karlstorz.com>
References: <20240712131551.3516167-1-tobias.gassner.ext@karlstorz.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <01010190a726d3f6-73cc2343-2986-45a8-b01b-c86b0cf6d031-000000@us-west-2.amazonses.com>
Date: Fri, 12 Jul 2024 13:34:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.12-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 13:34:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201829

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/execute-pkg_postinst_ontarget-task-for-read-only-rootfs-when-read-only-rootfs-delayed-postinsts-is-set.patch

FAIL: test commit message presence: Please include a commit message on your patch explaining the change (test_mbox.TestMbox.test_commit_message_presence)
FAIL: test shortlog format: Commit shortlog (first line of commit message) should follow the format "<target>: <summary>" (test_mbox.TestMbox.test_shortlog_format)
FAIL: test shortlog length: Edit shortlog so that it is 90 characters or less (currently 102 characters) (test_mbox.TestMbox.test_shortlog_length)

PASS: pretest pylint (test_python_pylint.PyLint.pretest_pylint)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test pylint (test_python_pylint.PyLint.test_pylint)

SKIP: pretest src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test CVE check ignore: No modified recipes or older target branch, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test lic files chksum modified not mentioned: No modified recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
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

