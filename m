Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A7C2C02196
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 14:03:38 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.116992.1738677814308112467
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 06:03:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=cU/wuGNF;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=JDMD4UVZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010194d1460123-296888c5-d45a-4c84-9a3b-6cfd199c4fb5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738677813; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=CmSi9NFavxkkwLXRZBDU8H/D+Pelmq4SGNT8Vhps2RU=;
	b=cU/wuGNFFEpt2CFK/pIf5KdwxmkcTMbq+9V4rbuE1JQp4WW7Yw8a21lwoTUh7e/+
	dXXkEiDXeHWoOdHIWPSxzcCtOMVSk2gTUt51Znjv7fBgN+6qQm1WWF8+qAD6V/3eHGu
	jJFdwKXnIQicDV0gB8gltwXQcr3wGO94f6zQ6hjA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738677813;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=CmSi9NFavxkkwLXRZBDU8H/D+Pelmq4SGNT8Vhps2RU=;
	b=JDMD4UVZzOsH7oLmpKS+CO5tDBhgogSU3JJdIvg6put5wODXFdDJO4+0xH5i1Cft
	p/Z7ksqw+lhXM6DO1FlbAkTeUc5rGdGs4YepWjYxvY1uqYxDwXy016H8afSn7mxEVgf
	nuLEsJjOTMeVhRb2xU3zbxwvGg99WMoQudeoHfME=
From: patchtest@automation.yoctoproject.org
To: Mikko Rapeli <mikko.rapeli@linaro.org>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH v2 3/3] systemd-boot-native: fix kernel signature for
 secureboot
In-Reply-To: <20250204135457.1219477-3-mikko.rapeli@linaro.org>
References: <20250204135457.1219477-3-mikko.rapeli@linaro.org>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <01010194d1460123-296888c5-d45a-4c84-9a3b-6cfd199c4fb5-000000@us-west-2.amazonses.com>
Date: Tue, 4 Feb 2025 14:03:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.04-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 14:03:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210802

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/v2-3-3-systemd-boot-native-fix-kernel-signature-for-secureboot.patch

FAIL: test Signed-off-by presence: A patch file has been added without a Signed-off-by tag: '0001-ukify-measure-Revert-changes-to-use-SizeOfImage-from.patch' (test_patch.TestPatch.test_signed_off_by_presence)

PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_status_presence_format)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test lic files chksum modified not mentioned (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test src uri left files (test_metadata.TestMetadata.test_src_uri_left_files)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
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

