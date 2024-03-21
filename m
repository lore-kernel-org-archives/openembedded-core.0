Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31FFDC6FD1F
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 20:36:45 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.8162.1711053403084697909
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Mar 2024 13:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ehQQYR9l;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=CuDNeGsA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018e62baf0af-f9e4f859-cc52-4a6b-82dc-7c5c5affc6e6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711053402; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=hIQwMqAINGy9AjuaEs3VHcTXUTOiIfZzerOA9EgdgRI=;
	b=ehQQYR9ln3L2RLnmN4nc/nvOFdSFUUE1rbv0dmY3Q4LqT5RHxQztYIiPu1eSkhXW
	XaxHZhKqKXiNL0iKn/JTTsM8J7GyF4kmhBw6NA6eEHprLeCBmvuQODED3aIXDZ8ObTW
	MPpLMGC+xlTjIE+3nNzL6v3oYjz6ZJ2E5QAQJG6c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711053402;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=hIQwMqAINGy9AjuaEs3VHcTXUTOiIfZzerOA9EgdgRI=;
	b=CuDNeGsAqtbcBbdtmqVhSc11WrbPtF0EGtxYmfH/KHoBRCwjcN3xDAxXSvTJhqDe
	DpbtU4Ufa6x8Xo8xmkpHZe4c0+JqinqImuC+MAdIsn2O/zT7EALhCM7K25ow4kDsVpI
	48ZIsswGmSCPdPHvEYn3eH5/H6ezZlgAv60CyCZA=
From: patchtest@automation.yoctoproject.org
To: ross.burton@arm.com
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH 2/2] tcl: skip I/O channel 46.1
In-Reply-To: <20240321201557.2309256-2-ross.burton@arm.com>
References: <20240321201557.2309256-2-ross.burton@arm.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018e62baf0af-f9e4f859-cc52-4a6b-82dc-7c5c5affc6e6-000000@us-west-2.amazonses.com>
Date: Thu, 21 Mar 2024 20:36:42 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.21-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 20:36:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197430

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/2-2-tcl-skip-I-O-channel-46.1.patch

FAIL: test bugzilla entry format: Bugzilla issue ID is not correctly formatted - specify it with format: "[YOCTO #<bugzilla ID>]" (test_mbox.TestMbox.test_bugzilla_entry_format)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
SKIP: pretest src uri left files: Patch cannot be merged (test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test CVE check ignore: No modified recipes or older target branch, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
SKIP: test lic files chksum modified not mentioned: No modified recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
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

