Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 895CFC27C6E
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 07:48:17 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.6213.1718351290204341750
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jun 2024 00:48:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=acCgsoFB;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=QvSukMgF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019015b7db6c-dab822e6-30e0-4bf6-954a-1acee540a613-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718351289; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=OPi8VL2qtk7SgjZtjkO6W5QRrXje6romccIYvirMU/U=;
	b=acCgsoFBX27CuwJI8RU6/FRwiF8lQ6oYjUCRSrw47SNuWYgp1iDtyVppl8NCVFxe
	6jsuocQTzChE+J6WUdL50zFH+foJL3LuTArQMKTnuRP+dYiBcwcwqZzPZdzbHqp7KoP
	wBAAQ7bf1LBw/hKGs/2NqX5hvrwwUyyM9PeCAQS8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718351289;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=OPi8VL2qtk7SgjZtjkO6W5QRrXje6romccIYvirMU/U=;
	b=QvSukMgFbSL+T93VRrhjR6As87g+MmGHbSffR8JAg4wIloEBFWminlAjTv2LuchY
	q1NCENgtKD1xAKiWrtlbsd6fDTA+1Dm6cG11EkdL7fBbtGBurzCGhZT69moYJlcJQDA
	ATpe8/2/YQiXoQIdhpZ9YNU9Pamw8HQWlobN9OfE=
From: patchtest@automation.yoctoproject.org
To: egyszeregy@freemail.hu
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH v2] archiver.bbclass: Fix work-shared checking for kernel
 recipes
In-Reply-To: <20240614073729.269-1-egyszeregy@freemail.hu>
References: <20240614073729.269-1-egyszeregy@freemail.hu>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019015b7db6c-dab822e6-30e0-4bf6-954a-1acee540a613-000000@us-west-2.amazonses.com>
Date: Fri, 14 Jun 2024 07:48:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.14-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jun 2024 07:48:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200651

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/v2-archiver.bbclass-Fix-work-shared-checking-for-kernel-recipes.patch

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
SKIP: test CVE tag format: Parse error Target without source: +++ b/meta/classes/archiver.bbclass
SKIP: test Signed-off-by presence: Parse error Target without source: +++ b/meta/classes/archiver.bbclass
SKIP: test Upstream-Status presence: Parse error Target without source: +++ b/meta/classes/archiver.bbclass
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

