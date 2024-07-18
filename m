Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E38C3DA63
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 17:05:11 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.59.1721322307702978401
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 10:05:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=gIfpmnAO;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=WL/MnVrx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010190c6cdfd5a-a8ebf2b2-c025-4f7a-a569-3b424eff051a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721322307; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=519ZK0/h74dR0u9TK2yfIkh8Av6md+NxuNiGFtDHU/k=;
	b=gIfpmnAOOaScLGU2mAkf78idsJiOzlXVPb+gXpc9qVhrGWCTlSBPUDJ0A9GE5DCt
	QSGvqCKyABwunpQeFixDQJO+T+x5Hy9NC4H+yj9soiWDajpVnHC/BF4g9qMXYgYKq8n
	h1LACOAF7csY6qNUKldIHRAXE6MUCLdJXZTF/3PE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721322307;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=519ZK0/h74dR0u9TK2yfIkh8Av6md+NxuNiGFtDHU/k=;
	b=WL/MnVrxEEQUxkDvyKHpbWqMixTfriKnQnUPaMsZ2nO/xkNI5c9Ztg4aiNX/l7r2
	NR3D/69w/V5Bep/1XYr1UnF86CY/GxZiRdJrdH0saA9h6G5wNbsS7KxuARcy/Kd0gBO
	w9cgpoBoKTf0MWIojYa9Nisuhen/sCDORwHXBF3s=
From: patchtest@automation.yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][PATCH v7 2/2] openssh: upgrade 9.7p1 -> 9.8p1
In-Reply-To: <20240718165448.1164-2-jose.quaresma@foundries.io>
References: <20240718165448.1164-2-jose.quaresma@foundries.io>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <01010190c6cdfd5a-a8ebf2b2-c025-4f7a-a569-3b424eff051a-000000@us-west-2.amazonses.com>
Date: Thu, 18 Jul 2024 17:05:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.18-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 17:05:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202232

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/v7-2-2-openssh-upgrade-9.7p1---9.8p1.patch

FAIL: test CVE tag format: Missing or incorrectly formatted CVE tag in patch file. Correct or include the CVE tag in the patch with format: "CVE: CVE-YYYY-XXXX" (test_patch.TestPatch.test_cve_tag_format)

PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
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
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
SKIP: pretest src uri left files: Patch cannot be merged (test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
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

