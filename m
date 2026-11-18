Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11210.1795004162575077894
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 04:16:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=jk5clSw+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mhb2Er9T;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a1ee95decd-1d4a2ca5-66d0-4f68-8e6b-4f89a035d69d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795004161; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=+uGBdNOfem1MDDrgEY5UJwkm8ZQsSvkFscb2Mgd8Iy0=;
	b=jk5clSw+B7jckPS36l3jzGKuYZ/QdeF88FoA6k1A+Ii6oR/uoPqu4FyITLC6JrTM
	TpLt424yA9Y7RAdoLke291Q/Efbn+MlVkAH9i08xAnO0aU7/DDjlXzDqVuebZRt6fYj
	yBncqHkvDfUJR6un1HQbBDPTE3OI2EJLv3qSx25I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795004161;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=+uGBdNOfem1MDDrgEY5UJwkm8ZQsSvkFscb2Mgd8Iy0=;
	b=mhb2Er9THjT1WF6dV5mG9K34ezr3fBKReLyKOT0KGJqqntfOT86Ryrnkr7vlGTgS
	KCadItYpk7eQjNx273aQgdkoRPN0BXBU/wxbwBcsZk0JFnE2brPqBg8fhXw49QtK0JJ
	7OzOKau6DLiNEctloAEEYTeSD9X3iDUiC4zneeYc=
From: patchtest@automation.yoctoproject.org
To: sunilkumar.dora@windriver.com
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH v2] pseudo: Tell makewrappers the target architecture
In-Reply-To: <20261118120426.1918842-1-sunilkumar.dora@windriver.com>
References: <20261118120426.1918842-1-sunilkumar.dora@windriver.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <010101a1ee95decd-1d4a2ca5-66d0-4f68-8e6b-4f89a035d69d-000000@us-west-2.amazonses.com>
Date: Wed, 18 Nov 2026 12:16:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.18-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 12:16:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250544

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/v2-pseudo-Tell-makewrappers-the-target-architecture.patch

FAIL: test max line length: Patch line too long (current length 270, maximum is 200) (test_metadata.TestMetadata.test_max_line_length)

PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_status_presence_format)
PASS: test auh changelog truncation notice (test_mbox.TestMbox.test_auh_changelog_truncation_notice)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test bugzilla entry format (test_mbox.TestMbox.test_bugzilla_entry_format)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test lic files chksum modified not mentioned (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test src uri left files (test_metadata.TestMetadata.test_src_uri_left_files)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
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
