Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8E5DC197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 11:37:37 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.4811.1700134651588732983
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 03:37:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=R/GW0YBg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=nTeoxsJS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018bd7ec00f8-d3e0c10a-6322-49d9-9329-9db32e336d61-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700134650; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date;
	bh=FBqUTZj5kVryKv5Pbe0VfG70/RvjvbyALKDm3IakCqM=;
	b=R/GW0YBgHiGC5oOEGFUK2uOOHpfSdFo+7ITB6/tqr6R9ZNaxoeRISg4e7kSeeGEt
	JXjmHDyQmZ3E8KMlrCjpjH+bSsC9EqqQMs+godcKIG4R6Ma9tdUB1XIULy5DgDtRCRQ
	tMyHne79ThhDziSda1O3KhRKvuMg/OCeQGkB0Jec=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700134650;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=FBqUTZj5kVryKv5Pbe0VfG70/RvjvbyALKDm3IakCqM=;
	b=nTeoxsJSzN/Po3W+um5gnsuw4jZIkWuZ7x7Go6teux4Q6QuZC71OGDc7G+1DgFeK
	qXSqz6Mj+KZ3qrvp7hJloFi3s6YEcFTd3K/scrQJH0AT/SHOusUUatp14xUms1fjSSQ
	mA/dDKVNf1DKCdBvi+jJS6iGivjoV57mTMT5MrcQ=
From: patchtest@automation.yoctoproject.org
To: mgupta1 <meenali.gupta@windriver.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [oe-core][PATCH 4/5] avahi fix CVE-2023-38472
In-Reply-To: 20231116111849.712496-1-meenali.gupta@windriver.com
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018bd7ec00f8-d3e0c10a-6322-49d9-9329-9db32e336d61-000000@us-west-2.amazonses.com>
Date: Thu, 16 Nov 2023 11:37:30 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 11:37:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190783

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/4-5-avahi-fix-CVE-2023-38472.patch

FAIL: test shortlog format: Commit shortlog (first line of commit message) should follow the format "<target>: <summary>" (test_mbox.TestMbox.test_shortlog_format)

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
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
SKIP: pretest src uri left files: Patch cannot be merged (test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
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

