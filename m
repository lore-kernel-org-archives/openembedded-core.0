Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DAACC54E4A
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 18:51:22 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.1494.1709837477359791914
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 10:51:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RzJqGRlK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Sa5XpCiJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018e1a4162b0-4500d455-ee1d-459f-95d2-46b95ce01faf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709837476; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=P2dvvKR5UbmYdTB+kbOzADV6eepeqDGPFLY6pijX4e8=;
	b=RzJqGRlKhIjmmhLlunjSCACMPMaV3EEhI2796YnNxYrpmDSVUE9BHup1uryrsSqB
	ehYsC8TijtZ2hWB8WAHpCmO/a/mXU4CAxpp8TDiTf0WGbvWibDwmIrhAel3eqZqpsM4
	8S4DaaBXERAA7GTFDaFfblsQ8IVxJlwpCermyoiw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709837476;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=P2dvvKR5UbmYdTB+kbOzADV6eepeqDGPFLY6pijX4e8=;
	b=Sa5XpCiJfjpZ/dZTlhh3+qtdVkSiZeahNy8wavyRix6e+CM4zcDY13n6XqFYJaYE
	RR+2dtxytmBkEyy5mCvRD391TyVW27UHz+/fsuRz7sLpToQui30wNRz7+t1CrGam/OR
	+FBL+l4twEqJF7VL9//Z/vSI+OKsYi5X8a9auzKo=
From: patchtest@automation.yoctoproject.org
To: Steve Sakoman <steve@sakoman.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][kirkstone 3/4] selftest: skip virgl gtk/sdl test on ubuntu
 18.04
In-Reply-To: 
 <20c70400ea7739a20bec174ac5df6841cbf0b4de.1709836581.git.steve@sakoman.com>
References: 
 <20c70400ea7739a20bec174ac5df6841cbf0b4de.1709836581.git.steve@sakoman.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018e1a4162b0-4500d455-ee1d-459f-95d2-46b95ce01faf-000000@us-west-2.amazonses.com>
Date: Thu, 7 Mar 2024 18:51:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.07-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 18:51:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196816

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/kirkstone-3-4-selftest-skip-virgl-gtk-sdl-test-on-ubuntu-18.04.patch

FAIL: test commit message presence: Please include a commit message on your patch explaining the change (test_mbox.TestMbox.test_commit_message_presence)

PASS: pretest pylint (test_python_pylint.PyLint.pretest_pylint)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test pylint (test_python_pylint.PyLint.test_pylint)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)

SKIP: pretest src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test CVE check ignore: No modified recipes or older target branch, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
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

