Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 379DAC4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 07:20:27 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.32124.1699860019905166114
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Nov 2023 23:20:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=K6qK608a;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=i+GOZbOf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018bc78d72cf-f350bfdc-abd5-42e2-ba8a-d2cd840078a8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699860018; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date;
	bh=e/+q+njzPRWjoV9BcDR/xe6OkUko0+SO9bMKVXsT+hc=;
	b=K6qK608a+LKrUUOioSF8t/kYUZmpB18uvnB8RlKheulU+F72uVVaFj3kr2+OaHed
	YZQLmevKljG8GmN1JC++ypeBzae5w9DiPKJcTOhKSSaAkXxvmwLe9u5X3NrKxoanDvZ
	fADuXJ4ekZpgDozedgxrLpEtamUzfqJKGAKBzyr0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699860018;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=e/+q+njzPRWjoV9BcDR/xe6OkUko0+SO9bMKVXsT+hc=;
	b=i+GOZbOfshXsy2CH/d2BcCFEpD5wdkQTHfDGx6+H+BhmBCY4jqkFGdn04qEfhSEL
	PTTtYNDPE8FmpjnabitjEn8Pq3JrQ0DpPHI/Z0BEgLsq4mEOpHq5A7h/IACeov48eSJ
	kN/YsUlb3Hz1M3Sqv4dkbAeVm9XGSqfT7GVEtcn0=
From: patchtest@automation.yoctoproject.org
To: Martin Jansa <martin.jansa@gmail.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH 2/2] bitbake.conf, ovmf, go-cross-canadian, cargo,
 libjpeg-turbo, ffmpeg, acpica,
 perf: drop ${PE} and ${PR} from -f{file,macro,debug}-prefix-map
In-Reply-To: 20231113070844.5142-2-martin.jansa@gmail.com
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018bc78d72cf-f350bfdc-abd5-42e2-ba8a-d2cd840078a8-000000@us-west-2.amazonses.com>
Date: Mon, 13 Nov 2023 07:20:17 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.13-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 07:20:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190460

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/2-2-bitbake.conf-ovmf-go-cross-canadian-cargo-libjpeg-turbo-ffmpeg-acpica-perf-drop-PE-and-PR-from--f-file-macro-debug--prefix-map.patch

FAIL: test shortlog length: Edit shortlog so that it is 90 characters or less (currently 140 characters) (test_mbox.TestMbox.test_shortlog_length)

PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test lic files chksum modified not mentioned (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
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

