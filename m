Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6915.1792571464092047537
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 01:31:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=pB6nZ1E0;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=0oNIHAer;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a15d95d595-46d592c0-3a2c-4886-9f33-72762b6de31a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792571463; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=2eNkXgHd4JHVzGxqabFlw99huNBlHv/5mp87Y0dfl7o=;
	b=pB6nZ1E01mwn2+gDW52kkACf1UGU0MNb15s+AWMr9vPDdtT940B9rbIWNj9M4M8f
	k3Z06mmsK90OUlSS7bHIBekqbJhvtS0iZajBEq+FRCcGYNCjnCGHzm5Xq/D81YdCIdQ
	UjkfdTG9L/LRIj13+PDPG0NaEgVhV21Zut8pnf1A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792571463;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=2eNkXgHd4JHVzGxqabFlw99huNBlHv/5mp87Y0dfl7o=;
	b=0oNIHAerQGUZEGP0ajfl3npIyXNzxqaljayIc+j8gX+MklsNeaHVZz9N0KqMHbkB
	Flhj029Dm4OqKinx6yX9c0HIQzH90OtKiBSB+wQ1EpxbdXsRlYKv4k9h2jD7yVe+v6f
	xzSAa8tjXjxLoql7bNTVHSmN+wy/zr+tCOUKNCg0=
From: patchtest@automation.yoctoproject.org
To: Einar Gunnarsson <tolvupostur@gmail.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [meta-multimedia][PATCH] pipewire: Remove duplicate avahi from
 PACKAGECONFIG
In-Reply-To: <RGrU.1792570928474513034.9LmG@lists.openembedded.org>
References: <RGrU.1792570928474513034.9LmG@lists.openembedded.org>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <010101a15d95d595-46d592c0-3a2c-4886-9f33-72762b6de31a-000000@us-west-2.amazonses.com>
Date: Wed, 21 Oct 2026 08:31:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.21-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 08:31:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248374

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/meta-multimedia-pipewire-Remove-duplicate-avahi-from-PACKAGECONFIG.patch

FAIL: test mbox format: Series has malformed diff lines. Create the series again using git-format-patch and ensure it applies using git am (test_mbox.TestMbox.test_mbox_format)
FAIL: test target mailing list: Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists (test_mbox.TestMbox.test_target_mailing_list)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test auh changelog truncation notice (test_mbox.TestMbox.test_auh_changelog_truncation_notice)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)

SKIP: pretest pylint: Python-unidiff parse error (test_python_pylint.PyLint.pretest_pylint)
SKIP: pretest src uri left files: Patch cannot be merged (test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test CVE check ignore: No modified recipes or older target branch, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
SKIP: test CVE tag format: Parse error Hunk diff line expected: ${@bb.utils.contains('DISTRO_ FEATURES', 'systemd', 'systemd
SKIP: test Signed-off-by presence: Parse error Hunk diff line expected: ${@bb.utils.contains('DISTRO_ FEATURES', 'systemd', 'systemd
SKIP: test Upstream-Status presence: Parse error Hunk diff line expected: ${@bb.utils.contains('DISTRO_ FEATURES', 'systemd', 'systemd
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
