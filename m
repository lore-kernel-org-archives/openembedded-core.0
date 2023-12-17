Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C293C46CD4
	for <webhook@archiver.kernel.org>; Sun, 17 Dec 2023 06:11:26 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.14514.1702793477400910487
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Dec 2023 22:11:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Z+mM9Kb1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FfRDcclW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018c766679ee-77b8dcf8-a1d9-483e-a587-7ca8837ef1a4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1702793476; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date;
	bh=pXm2+x602sd6yTbBP2EiSf9ks2lRQDVqT6n6PHwuSBM=;
	b=Z+mM9Kb1I11s0t9J28f7gxG9m/GgXv2HVbvTIVcat+UUuSVy/asRjKFygxMOYeq4
	AXarOTwFV98+winpwi2gZqWoqiyOgs7hoptYm6NYI1W+LqOqACR5JUpMmXQeGjUZyL5
	R8B0p6TZ/ZELXC/uE8tier7yBPoBcAj7Q2yLZmJQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1702793476;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=pXm2+x602sd6yTbBP2EiSf9ks2lRQDVqT6n6PHwuSBM=;
	b=FfRDcclW4WJ5eY2hmT+xXchb6aCCPCWBbWjyJdhRcSNz1KrDPdnE0EYFdVWks8pm
	V1v8TU/8B0nX5okkiBwbT4vyoLXdQmRh0ZpgoYVGRW87DI21/F/2Xd/WfhLq91EosVb
	Cwn0DVXmMEhDBlh98dHbMjsAGRJK5p8Jujh3WEts=
From: patchtest@automation.yoctoproject.org
To: Tim Orling <ticotimo@gmail.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH 6/7] oeqa: add simple 'maturin' SDK (testsdk) test case
In-Reply-To: 403b882dd93344b2d268f92fd756dfbef2be48a5.1702791173.git.tim.orling@konsulko.com
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018c766679ee-77b8dcf8-a1d9-483e-a587-7ca8837ef1a4-000000@us-west-2.amazonses.com>
Date: Sun, 17 Dec 2023 06:11:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.17-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Dec 2023 06:11:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192583

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/6-7-oeqa-add-simple-maturin-SDK-testsdk-test-case.patch

FAIL: test mbox format: Series has malformed diff lines. Create the series again using git-format-patch and ensure it applies using git am (test_mbox.TestMbox.test_mbox_format)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: Python-unidiff parse error (test_python_pylint.PyLint.pretest_pylint)
SKIP: pretest src uri left files: Patch cannot be merged (test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test CVE tag format: Parse error Hunk is shorter than expected (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: Parse error Hunk is shorter than expected (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: Parse error Hunk is shorter than expected (test_patch.TestPatch.test_upstream_status_presence_format)
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

