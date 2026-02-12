Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B92C8EE369C
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 15:45:55 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48418.1770911146689507645
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 07:45:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=3+KJ4uw8;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=V2PHiz7b;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019c52879f7e-42ab6631-1307-490f-9a13-cca8299baccd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1770911146; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=NTfM93eMs+EbPw6sbVTnOaJkQ+ukFnCjqieR7+OC7+k=;
	b=3+KJ4uw8G7Sdhl2Ugi/bLzTLm//Ls9g7S+PUQynYTPoUrr2d1UPv9tWj+O8f1gUe
	G4v0O68pCGWXX3O9Bh399afhiEprWWH/nwr0/PKenuqGdBSBSTZiJCkgWQtQ3+A0Ejf
	9shBHFgNOMBTjX5TbI7h3o9xvUXSdhcF3pMydqxg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1770911146;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=NTfM93eMs+EbPw6sbVTnOaJkQ+ukFnCjqieR7+OC7+k=;
	b=V2PHiz7bo5Cu5jPwccasfmQFkNbyNFND0Rwpz4UMyhaQ+cH1GOuFdye2PbxCdzSC
	//gFVvo9CxKsJeOgAeBJHJzInUu0Z8OpvwuN0mwxcEmunU1q1XUeZuwr3rBvUi9hEx6
	GswP49IGWqFtIVY7wc3aaUS3QpgSgWD5L+eOFOr4=
From: patchtest@automation.yoctoproject.org
To: =?utf-8?q?Alba_Herrer=C3=ADas?= <alba@thehoodiefirm.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for =?utf-8?q?=5BPATCH_v2=5D_build=5Fperf=3A_don=E2=80=99t_bake_commit_?=
	=?utf-8?q?annotations_into_html=2C_always_fetch_dynamically=2E?=
In-Reply-To: <20260212152023.30604-1-albaherreriasdev@gmail.com>
References: <20260212152023.30604-1-albaherreriasdev@gmail.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019c52879f7e-42ab6631-1307-490f-9a13-cca8299baccd-000000@us-west-2.amazonses.com>
Date: Thu, 12 Feb 2026 15:45:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.12-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 15:45:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231037

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/v2-build_perf-don-t-bake-commit-annotations-into-html-always-fetch-dynamically..patch

FAIL: test shortlog format: Commit shortlog (first line of commit message) should follow the format "<target>: <summary>" (test_mbox.TestMbox.test_shortlog_format)
FAIL: test shortlog length: Edit shortlog so that it is 90 characters or less (currently 134 characters) (test_mbox.TestMbox.test_shortlog_length)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
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

