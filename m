Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E8CCF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 14:39:14 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.15755.1727188750177549798
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 07:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=C8ZDjZsC;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=jvALfXwN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101922478cc30-abca10dd-68c8-4c4e-a92c-c35f8dff5199-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1727188749; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=E8nE0cdIz7RDONpNao39wc0oikrcP0zmTWqi7usbD2A=;
	b=C8ZDjZsCRhMozAZkUv+x9V/wNU8GDAYQizy0Mf1xiOdm4k6tL8FqRKb3MuQYf+xS
	cIorUuxL1OnZANcm3qJ6rWtoAeEJyfg7DW6B7zxHy4ALDVkGTlKo5iYexgyvCnh8Ot4
	wKQoliAri8lD7CFIu+T9Gu/Uy+Dxa3EQjUgYgLKU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1727188749;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=E8nE0cdIz7RDONpNao39wc0oikrcP0zmTWqi7usbD2A=;
	b=jvALfXwNmWo0zmhkkmvombq5or/6xEMhryMQcNnH6uNFk88uInyGDFKmDGYMIHlE
	csCs5puVLc4ycXFTdzI0W3w1f01VFl1vgW6JL8TpL5vwz8HndC27x8yuxOJdocxwajA
	QVSTRhONKNp4rcJdlKbzQTY5S2FNjQGvI2D9uaFE=
From: patchtest@automation.yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][PATCH 2/4] python3-pytest: upgrade 8.3.2 -> 8.3.3
In-Reply-To: <20240924141212.2579675-2-tgamblin@baylibre.com>
References: <20240924141212.2579675-2-tgamblin@baylibre.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <010101922478cc30-abca10dd-68c8-4c4e-a92c-c35f8dff5199-000000@us-west-2.amazonses.com>
Date: Tue, 24 Sep 2024 14:39:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.24-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 14:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204870

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/2-4-python3-pytest-upgrade-8.3.2---8.3.3.patch

FAIL: test Signed-off-by presence: Mbox is missing Signed-off-by. Add it manually or with "git commit --amend -s" (test_mbox.TestMbox.test_signed_off_by_presence)

PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
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
SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
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

--NextPart


--NextPart--

