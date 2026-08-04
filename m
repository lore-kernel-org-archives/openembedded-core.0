Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05C31C55184
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 04:22:55 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9844.1785817370203192748
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 21:22:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Tx5dVAsq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CCIScoAG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019fcb028a8e-eb178a09-9962-4f78-a143-08aa816aeece-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785817369; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=ZJLwQWYTuWDvZOj1B1iYj4n7OYKd194yUKQ8c6L3uvY=;
	b=Tx5dVAsqVvskxKrXu0dxl+xdXwKRQxxueEgGYoo+lMJtJzX1k4sklBGgU8n4MaFg
	XE977I2mPvmWO1T60eH4ZgIpXKZXemUdNCA8VDe+o5q3OYy1CSZ0YbzqEw14K37MV0c
	qSzKUOiVDGocoiFSTxYen52otORZu7aBZ8mCJ5bo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785817369;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=ZJLwQWYTuWDvZOj1B1iYj4n7OYKd194yUKQ8c6L3uvY=;
	b=CCIScoAGorv1nHwzTfcJcKQmorLNc4uHbvUwv0qqlAjo/AoInDES1PiOdEb7n2aI
	3M2AmFInKb9f8Lp0y+ze/+wOfgm48kxfIqSI/Z4bZ1dzmLnqDUQZhoLgIFBp29+dglz
	9QW32I/blnd+MCLzed+PxGj/zIDLZFNC29e1Bje8=
From: patchtest@automation.yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core] [PATCH 8/8] xwininfo,xvinfo,xmodmap: upgrade 1.1.6 ->
 1.1.7,1.1.5 -> 1.1.6,1.0.11 -> 1.0.12xwininfo,xvinfo,xmodmap: upgrade 1.1.6
 -> 1.1.7,1.1.5 -> 1.1.6,1.0.11 -> 1.0.12
In-Reply-To: <20260804040509.1454-8-wangmy@fujitsu.com>
References: <20260804040509.1454-8-wangmy@fujitsu.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019fcb028a8e-eb178a09-9962-4f78-a143-08aa816aeece-000000@us-west-2.amazonses.com>
Date: Tue, 4 Aug 2026 04:22:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.04-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 04:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242695

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/8-8-xwininfo-xvinfo-xmodmap-upgrade-1.1.6---1.1.7-1.1.5---1.1.6-1.0.11---1.0.12xwininfo-xvinfo-xmodmap-upgrade-1.1.6---1.1.7-1.1.5---1.1.6-1.0.11---1.0.12.patch

FAIL: test shortlog length: Edit shortlog so that it is 90 characters or less (currently 158 characters) (test_mbox.TestMbox.test_shortlog_length)

PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test auh changelog truncation notice (test_mbox.TestMbox.test_auh_changelog_truncation_notice)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test lic files chksum modified not mentioned (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test src uri left files (test_metadata.TestMetadata.test_src_uri_left_files)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
SKIP: test CVE tag format: No new source patches introduced (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new source patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new source patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
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

