Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82018C44500
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 21:15:54 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22717.1769030151287487601
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jan 2026 13:15:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=kW/NsGNC;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=A/9iY/uF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019be269e97e-44c47417-d41b-40f9-905b-a40ebb6a6f95-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769030150; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=ymw8BJm7TYDRYotW/KZVhtxRCixLTtwK4bUajMh/tUw=;
	b=kW/NsGNCaw+DVhrDFz3S3JUfztNW4Xjam/h2imGzdSge6kmnm6QJ9KytBdFaivac
	YbNwsZqVgyTpdlSg8O6Snvl7Fx4MxxJ/wcgROSFTSPWVAebjCfv5bd8zSf9vJsRmtub
	0SA2SB/OBCBrsfrmNrjq2fV1G2OqRcVD1P7IfMFQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769030150;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=ymw8BJm7TYDRYotW/KZVhtxRCixLTtwK4bUajMh/tUw=;
	b=A/9iY/uFMYwpGGiEW/pTTCQbm0E+l/4J9T5wehEL61JY6DQ6JV+bv8QiZV8R5ze5
	yZm0BZcPelHg6lvOKGUgiswhbcgLfeI2BBy/oHITLwITvs92e7PUEQcf+3s6uBaiZQw
	My05RBroTNnhTsc3xESNylol6rWyTWkAIloa20tE=
From: patchtest@automation.yoctoproject.org
To: tim.orling@konsulko.com
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH 3/3] oeqa/runtime: Update tests for maturin
In-Reply-To: 
 <73bea91160931edef54adf84a40f79c60e1ef9a6.1769028980.git.tim.orling@konsulko.com>
References: 
 <73bea91160931edef54adf84a40f79c60e1ef9a6.1769028980.git.tim.orling@konsulko.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019be269e97e-44c47417-d41b-40f9-905b-a40ebb6a6f95-000000@us-west-2.amazonses.com>
Date: Wed, 21 Jan 2026 21:15:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.21-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 21:15:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229826

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/3-3-oeqa-runtime-Update-tests-for-maturin.patch

FAIL: test mbox format: Series has malformed diff lines. Create the series again using git-format-patch and ensure it applies using git am (test_mbox.TestMbox.test_mbox_format)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: Python-unidiff parse error (test_python_pylint.PyLint.pretest_pylint)
SKIP: test CVE tag format: Parse error Hunk is shorter than expected (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: Parse error Hunk is shorter than expected (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: Parse error Hunk is shorter than expected (test_patch.TestPatch.test_upstream_status_presence_format)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test pylint: Python-unidiff parse error (test_python_pylint.PyLint.test_pylint)
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)

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

