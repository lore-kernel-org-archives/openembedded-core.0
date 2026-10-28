Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6950.1793221263905413240
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 14:01:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=k27VRQVe;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=W5z9JqD/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a18450fee9-cac596dd-0446-4885-acd8-a316b1f7306a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793221263; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=+9p01zZh/47RhFVad6y2VwH8cdMyIRMxsq4jBKyPBiA=;
	b=k27VRQVeZGOz/eGIH2SATh/6dA7oT/j4ELNluhQeuks9onx2JHanIf5TL0buAL9+
	/5iwYZygVvxspg4d1A+VyKT7ao/g97n6zGnaiJdIoaxjIzCzHwBaF7B5jsnrNuJNXWI
	AcRfNq/xvkHN9nGwIXZtb9ol39l6hdUM20ljkBfQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793221263;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=+9p01zZh/47RhFVad6y2VwH8cdMyIRMxsq4jBKyPBiA=;
	b=W5z9JqD/CoO8A2QqE+p/lkAZ1pTZapBhk4qSgy3Zw3ybR3U4J4bHmH+hBMoG2rnG
	hRAyPyLYYuINwp+ehkz4lvqlA6crvRc3czZi9whK6NFh1Kc+gY/AScR5k8cjYUgKa/7
	HR19Wj0j19eRDoZ0Wg+wn5rarodY8nE/LtX5KFgI=
From: patchtest@automation.yoctoproject.org
To: jeroen@myspectrum.nl
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [wrynose][PATCH] python3-pip: patch the vendored python3-certifi
In-Reply-To: <20261028205033.617954-2-jeroen@myspectrum.nl>
References: <20261028205033.617954-2-jeroen@myspectrum.nl>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <010101a18450fee9-cac596dd-0446-4885-acd8-a316b1f7306a-000000@us-west-2.amazonses.com>
Date: Wed, 28 Oct 2026 21:01:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.28-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 21:01:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248829

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/wrynose-python3-pip-patch-the-vendored-python3-certifi.patch

FAIL: test Signed-off-by presence: A patch file has been added without a Signed-off-by tag: '0001-Remove-emsign-437.patch' (test_patch.TestPatch.test_signed_off_by_presence)

PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
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
