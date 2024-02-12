Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A86C4829F
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 14:11:59 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.7209.1707747108616321499
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 06:11:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hHa+WnRP;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=OMfrNZgD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018d9da8e349-8003ab99-7dde-49d2-9036-ba4c8ba0ddc6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1707747107; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=KJghg2O9a5SfeXjD0CA4lZjnHIjfXPMOTzpOiOX0t+g=;
	b=hHa+WnRPvIMJi0L6rQnvYdnSH8qJaFGfTm63rfIoPmG+5fXTIcLj7YBd+XEmuoIM
	/1w3dsLpiB+XXHp+eAqbZkNqZ10oogcD5Av1MjnbuoGNKbgPAnHAMewWWz7tknKlz7P
	1owe/j/e1jz2kX3tL5HlcxN7SOAlmuiaPspArqJs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1707747107;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=KJghg2O9a5SfeXjD0CA4lZjnHIjfXPMOTzpOiOX0t+g=;
	b=OMfrNZgDBMl953kPLN8ffWdQMctp7thWnsOgmUFPhw4DLN7N5+JsO22SXypC/ZKU
	NafocjJGvRKrBONfmuT+UdeRqWArYyyENtyPAovoVomnqQap0nyChe9fiZ9tFMXVbNu
	bgmnEZcpY0cmgSR9jBdHJsMucfJvIC44V61rqGXA=
From: patchtest@automation.yoctoproject.org
To: Steve Sakoman <steve@sakoman.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][kirkstone 1/8] libxml2: Fix for CVE-2024-25062
In-Reply-To: 55027bc882cf6cab830f4e4f21fa9a2ffb4ad72e.1707745886.git.steve@sakoman.com
References: 55027bc882cf6cab830f4e4f21fa9a2ffb4ad72e.1707745886.git.steve@sakoman.com
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018d9da8e349-8003ab99-7dde-49d2-9036-ba4c8ba0ddc6-000000@us-west-2.amazonses.com>
Date: Mon, 12 Feb 2024 14:11:47 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.12-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 14:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195333

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/kirkstone-1-8-libxml2-Fix-for-CVE-2024-25062.patch

FAIL: test CVE check ignore: CVE_CHECK_IGNORE is deprecated and should be replaced by CVE_STATUS (test_metadata.TestMetadata.test_cve_check_ignore)

PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_status_presence_format)
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

