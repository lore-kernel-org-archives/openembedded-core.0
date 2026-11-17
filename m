Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4091.1794951987484357240
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 13:46:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=iGajqn88;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=GbY/naN4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a1eb79bd9d-5570bb0b-ab1e-4163-be5d-d6e3dae7ec2c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794951986; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=+rnf7z/nmrk64ai5RhTqor7LHOtNvx/vebv+sjoRTL0=;
	b=iGajqn88wQTHEFf043eoMpQ63r301PxOzeTFVMP+sDWD8Oy+aWUzSWG/Mnt3WuCv
	Rg/v9c8tdbQHh6NuPhQkMvSRc6oxvOJeaql9iF97c8V5Wke8vIe9hH8zZs1rihTfKv7
	3Gw6MemzjUv3uw8UAiA5I5jj0gBXt+arpPC8ubk0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794951986;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=+rnf7z/nmrk64ai5RhTqor7LHOtNvx/vebv+sjoRTL0=;
	b=GbY/naN4UuvRHhqWhR9D5t/KX7pL8LI0W5CnNNMw7hCDp+8hqlMaLAZ+3lRnuNA/
	FgkYT90K0/H8zNrBe0nwyAPhTk0XaUrdqDU6gO/TxbIdlDWy6+TXjY1hhmZEAFenye1
	so1TvRuZlLfcXyIYGnfYWEttlpQ7Q+/C0Ll9h/4I=
From: patchtest@automation.yoctoproject.org
To: Peter Marko <peter.marko@siemens.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH v2 2/2] grub: upgrade 2.14 -> 2.16
In-Reply-To: <20261117213048.842034-2-peter.marko@siemens.com>
References: <20261117213048.842034-2-peter.marko@siemens.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <010101a1eb79bd9d-5570bb0b-ab1e-4163-be5d-d6e3dae7ec2c-000000@us-west-2.amazonses.com>
Date: Tue, 17 Nov 2026 21:46:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.17-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 21:46:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250496

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/v2-2-2-grub-upgrade-2.14---2.16.patch

FAIL: test CVE tag format: Missing or incorrectly formatted CVE tag in patch file. Correct or include the CVE tag in the patch with format: "CVE: CVE-YYYY-XXXX" (test_patch.TestPatch.test_cve_tag_format)

PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_status_presence_format)
PASS: test auh changelog truncation notice (test_mbox.TestMbox.test_auh_changelog_truncation_notice)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test lic files chksum modified not mentioned (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
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
