Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6587.1794233316618827839
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 06:08:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=L3JhzP2T;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=IHMyG0pv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a1c0a3b113-4e37b8cc-90ae-4e9d-8fae-33c191e4e699-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794233315; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=/3RF5eaTOO0rSTDnB0D4OVmzHRx7LKF1U2S82P8fTU4=;
	b=L3JhzP2TZKZyyOQ5VjpdJJySMXO9TuGxItCP6Eykaoay2MKqXhRsgkuUWm3r4Lb6
	JsWz0C7UTaSLH7AapVSDt0jIVfSV6rqpbnD/7vzn0yZgQiJPC+ttqySAYff8BIpnS3Q
	HM5i6vd0nCoScCgX/ARGJS2w99Fs8DnkWt00s4X0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794233315;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=/3RF5eaTOO0rSTDnB0D4OVmzHRx7LKF1U2S82P8fTU4=;
	b=IHMyG0pvXDXZbA4N+Rejd57hxrlTqHVbfoRyK3hIN3y5/oEuvge6VM17xKHtprO1
	n1hEDbrCs54poUBGdQT7u1/UOvC4z0ThPJ90pdIeFCRp2FGt+FzHP1Eablj/cgImPvt
	ZBXnoyNxmkgk3QLBAIctGFEVDk6QU9ai9/jnofd4=
From: patchtest@automation.yoctoproject.org
To: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH v2 12/18] devtool: ide-sdk: remap Cargo sources for BitBake
 builds
In-Reply-To: <20261109-devtool-ide-sdk-cargo-v2-12-d56134000561@savoirfairelinux.com>
References: <20261109-devtool-ide-sdk-cargo-v2-12-d56134000561@savoirfairelinux.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <010101a1c0a3b113-4e37b8cc-90ae-4e9d-8fae-33c191e4e699-000000@us-west-2.amazonses.com>
Date: Mon, 9 Nov 2026 14:08:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.09-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 14:08:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249846

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/v2-12-18-devtool-ide-sdk-remap-Cargo-sources-for-BitBake-builds.patch

FAIL: test Signed-off-by presence: Mbox is missing Signed-off-by. Add it manually or with "git commit --amend -s" (test_mbox.TestMbox.test_signed_off_by_presence)

PASS: pretest pylint (test_python_pylint.PyLint.pretest_pylint)
PASS: test auh changelog truncation notice (test_mbox.TestMbox.test_auh_changelog_truncation_notice)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test pylint (test_python_pylint.PyLint.test_pylint)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test CVE check ignore: No modified recipes or older target branch, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
SKIP: test CVE tag format: No new source patches introduced (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new source patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new source patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test lic files chksum modified not mentioned: No modified recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
SKIP: test src uri left files: No modified recipes, skipping test (test_metadata.TestMetadata.test_src_uri_left_files)
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
