Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A52B9C4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 17:47:42 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.715.1698860861030906558
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 10:47:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GzpRhzFM;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gWAnJN20;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.192, mailfrom: 0101018b8bff82df-ae8a61d8-b6be-40ed-8b85-e94c07538560-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698860860; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:References:MIME-Version:Content-type:Message-ID:Date;
	bh=nmXmnvHtGQc4RN+pM5vL8s6q54PpDKjn+JSHYJNJP3E=;
	b=GzpRhzFMyxmljI76ay0TH9qPTajpFS77wzO81jI97oWN7Ttx+MIisluiWaYgzW6c
	Fr+ciSgp7FsMvdCgLvZexbcvRxJgOgOWf+6zwWcTK9y1PGo22W+logjFyUR+RqUHP4A
	Gm2dQR7dMij25wTCAYGfFUm2PWtsYapQg/+DLnAs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698860860;
	h=From:To:CC:Subject:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=nmXmnvHtGQc4RN+pM5vL8s6q54PpDKjn+JSHYJNJP3E=;
	b=gWAnJN20fb71z202l+7/GZDgWb78oTNWSwaF+FPtfnE82iz/GgESbEvvOnd1Y0zK
	JKK/xymmJXFy0AGJJaw1MRrsNxK0jYTDN/JsEzDl6sxwSo0CX2TomVcwIyT6epGnHUR
	/lBhO5MhcPxyWEgKNG/XM791OSpp70g94/7vqxuU=
From: patchtest@automation.yoctoproject.org
To: tgamblin@baylibre.com
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][PATCH] patchtest: shorten test result outputs
References: 20231029145426.212694-1-tgamblin@baylibre.com
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018b8bff82df-ae8a61d8-b6be-40ed-8b85-e94c07538560-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 17:47:40 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 17:47:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190045

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/patchtest-shorten-test-result-outputs.patch

FAIL: test CVE presence in commit message: A CVE tag should be provided in the commit message with format: "CVE: CVE-YYYY-XXXX" (test_mbox.TestMbox.test_cve_presence_in_commit_message)

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
SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test lic files chksum modified not mentioned: No modified recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
SKIP: test src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.test_src_uri_left_files)
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

