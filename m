Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4760.1793246629315102253
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 21:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Rukvnz0F;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=brOXaYnh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a185d40a52-4598fbbf-b7bc-41e1-8dc0-ca5ea794ba1b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793246628; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=6a4DhLD76g+de1UvCvyk1j6GgWUpuTtGPQUy59YCWSU=;
	b=Rukvnz0FtjXgGbvdkgRGcHYLn8OniV9eP/sxac7+i6FVZ29kRpB/mdnXccTt/Xns
	Sbco2ma55wADaHFTq3gRWrktyRFncw2w5hi5qgCIzFtBOnZcubCL4yiF/xokZ41QWn2
	gxmc2zkV22Fq6/mFzcH/s6cjAc1gmItADfM2/jIg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793246628;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=6a4DhLD76g+de1UvCvyk1j6GgWUpuTtGPQUy59YCWSU=;
	b=brOXaYnhE/k4uvCLFnqqACl/YNVVCVrBbe9GxLkcrn9LnVnTuanGLge985GV/m0u
	xlp7eK3eUPw1N9BRV1GxSoBWOaMbZYLVq+0N08lfJQIHzMhZPbQyw3V5vrDJCGmpBVb
	nqAeGFlFNxEDhopVNQxEJSN7KUNkWXEwNTR9kp8s=
From: patchtest@automation.yoctoproject.org
To: bruce.ashfield@gmail.com
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [meta-yocto-bsp][scarthgap][PATCH 07/07] yocto-bsps: update to
 v6.6.160
In-Reply-To: <20261029034503.3153661-8-bruce.ashfield@gmail.com>
References: <20261029034503.3153661-8-bruce.ashfield@gmail.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <010101a185d40a52-4598fbbf-b7bc-41e1-8dc0-ca5ea794ba1b-000000@us-west-2.amazonses.com>
Date: Thu, 29 Oct 2026 04:03:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.29-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 04:03:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248888

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/meta-yocto-bsp-scarthgap-07-07-yocto-bsps-update-to-v6.6.160.patch

FAIL: test commit message user tags: Mbox includes one or more GitHub-style username tags. Ensure that any "@" symbols are stripped out of usernames (test_mbox.TestMbox.test_commit_message_user_tags)
FAIL: test target mailing list: Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists (test_mbox.TestMbox.test_target_mailing_list)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test auh changelog truncation notice (test_mbox.TestMbox.test_auh_changelog_truncation_notice)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)

SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
SKIP: pretest src uri left files: Patch cannot be merged (test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test CVE check ignore: No modified recipes or older target branch, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
SKIP: test CVE tag format: No new source patches introduced (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new source patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new source patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
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
