Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56DB0C4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 04:49:38 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.180091.1698727773372326904
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Oct 2023 21:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=U57je3CT;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=GxyjwH6k;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.191, mailfrom: 0101018b8410c098-acdeafd9-77a9-46fc-a716-9cc3e07d37ab-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698727772; i=@automation.yoctoproject.org;
	h=From:Reply-To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date;
	bh=Mn0GN/iU+Jrjp+eJ5jHUYbWJOcZVpVurVCHcU++885E=;
	b=U57je3CTmT1q972iGCKSuT2E6A2RYUH+QxnT1NA7/weomsHVByVbBVrO+5ENwgew
	iitWzq9bsyTNaNNpdCdcx86MGAH5z1dx6FdJ5dfMytUASeTkucNopMXjR1C8ffVnXL1
	Wx2UJU62d2rM+ULw0r96TOGzU8C0JJKdnHYKiU+0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698727772;
	h=From:Reply-To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:Feedback-ID;
	bh=Mn0GN/iU+Jrjp+eJ5jHUYbWJOcZVpVurVCHcU++885E=;
	b=GxyjwH6kd9S385SEnD914ErzyTzPtnFs6jr2u6FF/PEYHp0HuVHN8ocwtwqS1rFr
	AedymwjO/buxBzgfuG/Bw32VYDdprOHuaBJmP14P/ZuSnRQXuUfgbCtUfcEJAN9JORT
	e5/Ct7BMEyHhakJhq/SBUI7I6xJynAkBxGSlG7Xg=
From: patchtest@automation.yoctoproject.org
Reply-To: soumya.sambu@windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][kirkstone][PATCH 1/1] libwebp: Fix
 CVE-2023-4863
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Message-ID: <0101018b8410c098-acdeafd9-77a9-46fc-a716-9cc3e07d37ab-000000@us-west-2.amazonses.com>
Date: Tue, 31 Oct 2023 04:49:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.31-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 04:49:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189827

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/kirkstone-1-1-libwebp-Fix-CVE-2023-4863.patch

FAIL: test CVE presence in commit message: A CVE tag should be provided in the commit message with format: "CVE: CVE-YYYY-XXXX" (test_mbox.TestMbox.test_cve_presence_in_commit_message)

PASS: pretest lic files chksum modified not mentioned (test_metadata.TestMetadata.pretest_lic_files_chksum_modified_not_mentioned)
PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
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
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test src uri left files (test_metadata.TestMetadata.test_src_uri_left_files)

SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
SKIP: test summary presence: No added recipes, skipping test (test_metadata.TestMetadata.test_summary_presence)
SKIP: test target mailing list: Series merged, no reason to check other mailing lists (test_mbox.TestMbox.test_target_mailing_list)

---

Please address the issues identified and
submit a new revision of the patch, or alternatively, reply to this
email with an explanation of why the patch should be accepted. If you
believe these results are due to an error in patchtest, please submit a
bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
under 'Yocto Project Subprojects'). For more information on specific
failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
you!

