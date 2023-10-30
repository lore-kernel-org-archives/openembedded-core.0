Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C3EC4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 13:42:02 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.149146.1698673315450320338
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Oct 2023 06:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LXLAQq9V;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cLfRc0ji;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.23, mailfrom: 0101018b80d1cad3-5f3395e3-7f2c-42d9-8a51-6c5e31582ee2-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698673314; i=@automation.yoctoproject.org;
	h=From:Reply-To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date;
	bh=+jGGFNYLjfrqFR6gfHH8ReRiUyOFI4QRuKGKz8DaAOE=;
	b=LXLAQq9Vnss7fQgOb/qRhaRGmA2QDyEDv5eUnR9nFAX2ui33KMBI/e9wrs17r17S
	042WrDTEzxwtMM0VjXqypDndflpl7i+VWUFCbS29ZRnpiddxaNwJ8wFcXwo4e8eMqP5
	L99MG4qVfW6URnrsJClbRBXSvZsC0JuR3wJEov2I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698673314;
	h=From:Reply-To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:Feedback-ID;
	bh=+jGGFNYLjfrqFR6gfHH8ReRiUyOFI4QRuKGKz8DaAOE=;
	b=cLfRc0jiNwNXx6RZezKRBwnUJIXdwN1rf62UESLRwpBYpL+OWz2uRJugilAUcrqT
	NHZPCNb7F7vjwACNEIVqDeiu5ihtc+cRH2GsrzF2fzA7Djhxa9nAJOYEGlzCrx/p0Kq
	AuzNk4WUiGCHGxWj4NshKmEtg5b10X0tDTN/1QoU=
From: patchtest@automation.yoctoproject.org
Reply-To: tgamblin@baylibre.com
Cc: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][PATCH] patchtest: shorten test
 result outputs
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Message-ID: <0101018b80d1cad3-5f3395e3-7f2c-42d9-8a51-6c5e31582ee2-000000@us-west-2.amazonses.com>
Date: Mon, 30 Oct 2023 13:41:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.30-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 13:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189795

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/patchtest-shorten-test-result-outputs.patch

FAIL: test lic files chksum modified not mentioned: LIC_FILES_CHKSUM changed without "License-Update:" tag and description in commit message (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)

PASS: pretest pylint (test_python_pylint.PyLint.pretest_pylint)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test pylint (test_python_pylint.PyLint.test_pylint)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)

SKIP: pretest lic files chksum modified not mentioned: No modified recipes, skipping pretest (test_metadata.TestMetadata.pretest_lic_files_chksum_modified_not_mentioned)
SKIP: pretest src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test CVE presence in commit message: No new patches introduced (test_mbox.TestMbox.test_cve_presence_in_commit_message)
SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
SKIP: test src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.test_src_uri_left_files)
SKIP: test summary presence: No added recipes, skipping test (test_metadata.TestMetadata.test_summary_presence)
SKIP: test target mailing list: Series merged, no reason to check other mailing lists (test_mbox.TestMbox.test_target_mailing_list)

---

Please address the issues identified and
submit a new revision of the patch, or alternatively, reply to this
email with an explanation of why the patch format should be accepted. If
you believe these results are due to an error in patchtest, please
submit a bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest'
category under 'Yocto Project Subprojects'). Thank you!

