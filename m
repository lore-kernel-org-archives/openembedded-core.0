Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14567.1795780018172956024
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 03:46:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=rE3WfuW3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=uLY2WAQI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a21cd47cd5-9776bd4e-1297-4ce9-b8b3-53f1721fc37d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795780017; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=UDLlmvCvo+F6CMZd8kN3DPdkQ7HSUjLJjzXuz1yZ9tg=;
	b=rE3WfuW3CB5r9iLFiTcMg28+74PdHjRV+Mls7xTRuE06SkSku3fRbbwxu4UzN6yi
	POqTW4LtZ5s4HJWIjnR/6aS9BCd6v/07kfudNdj+tzPb4+Lsc6LVSgMoEUe8y0MRhEg
	4rdZpT0QXlDoPydO1LuJyuRUFTTJgFyMhI29i6NY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795780017;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=UDLlmvCvo+F6CMZd8kN3DPdkQ7HSUjLJjzXuz1yZ9tg=;
	b=uLY2WAQIhiJ6I2teUTvJ7YBhQmzdchlu23MasVq+L54D9sbZ3dvT+G6RJ9GYX+a7
	VvuV/3G+uywSnNIuNBUro39/mey50jf57eGi11J3bQ1OfLsIK5qH7ZbCtAIxG7TzSPE
	QGk7GeiDo8gE+9wA/gJzAyXF9/+isQ1apN4w1flk=
From: patchtest@automation.yoctoproject.org
To: Karsten Meinecke <kmeinecke@triplebit-solutions.de>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [scarthgap] Backport request: insane: fix unimplemented-ptest error
 handling
In-Reply-To: <1c58c344-a241-46fe-a473-3e4ce20b24b8@triplebit-solutions.de>
References: <1c58c344-a241-46fe-a473-3e4ce20b24b8@triplebit-solutions.de>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <010101a21cd47cd5-9776bd4e-1297-4ce9-b8b3-53f1721fc37d-000000@us-west-2.amazonses.com>
Date: Fri, 27 Nov 2026 11:46:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.27-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 11:47:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251380

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/scarthgap-Backport-request-insane-fix-unimplemented-ptest-error-handling.patch

FAIL: test mbox format: Series has malformed diff lines. Create the series again using git-format-patch and ensure it applies using git am (test_mbox.TestMbox.test_mbox_format)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test auh changelog truncation notice (test_mbox.TestMbox.test_auh_changelog_truncation_notice)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: Python-unidiff parse error (test_python_pylint.PyLint.pretest_pylint)
SKIP: pretest src uri left files: Patch cannot be merged (test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test CVE check ignore: No modified recipes or older target branch, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
SKIP: test CVE tag format: Parse error Hunk diff line expected: while scanning (disappearing file while scanning?). Check was ignored." 
SKIP: test Signed-off-by presence: Parse error Hunk diff line expected: while scanning (disappearing file while scanning?). Check was ignored." 
SKIP: test Upstream-Status presence: Parse error Hunk diff line expected: while scanning (disappearing file while scanning?). Check was ignored." 
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
