Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51912F3D60F
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 14:01:07 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29860.1774792863040548953
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 07:01:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=p6c0xDNa;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bcJ6vTVQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019d39e5e9f5-bd99c67e-2ab8-489c-a615-1fef825a28fc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1774792862; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=KVlyK4SQFZJF0XKY/G/ul7ECUvaSKR2hKDiSrk0jCDs=;
	b=p6c0xDNabxPAGvq+97Lv44HkLA8T/SbL0nMiG7Mb3RKoKYhrt581on5dIKv7IgDE
	K12IMzLRB2+qdNyfxNPWTKH1mRM3W5t+Sgv9m2cW7twrm+giFBXkGJrZ4CWgIJWDAlu
	fv53U/RQRswC2huWvHI9z5yS5hVS4o6XJ47hGNPE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1774792862;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=KVlyK4SQFZJF0XKY/G/ul7ECUvaSKR2hKDiSrk0jCDs=;
	b=bcJ6vTVQ3Q3xT6WKyPGGacBtv6d5L58quYGnJo755hKto8dVqlD/eQ2cXTPBKuZV
	WmYCugadAATXQCs3lUIg3TPOFubOIKsK0dkt5jIn+xshpx1Lm/yZ7d/i/C5PMXOAneq
	ObtOca4+4uRiZSQGuGBQEmylvGOLTldx0zpNpsNI=
From: patchtest@automation.yoctoproject.org
To: charles-antoine.couret@mind.be
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH] image: add check_image_max_size as post function to check
 file size against IMAGE_FILE_MAXSIZE
In-Reply-To: <20260329134716.3185469-7-charles-antoine.couret@mind.be>
References: <20260329134716.3185469-7-charles-antoine.couret@mind.be>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019d39e5e9f5-bd99c67e-2ab8-489c-a615-1fef825a28fc-000000@us-west-2.amazonses.com>
Date: Sun, 29 Mar 2026 14:01:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.29-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 14:01:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234151

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/image-add-check_image_max_size-as-post-function-to-check-file-size-against-IMAGE_FILE_MAXSIZE.patch

FAIL: test shortlog length: Edit shortlog so that it is 90 characters or less (currently 94 characters) (test_mbox.TestMbox.test_shortlog_length)

PASS: pretest pylint (test_python_pylint.PyLint.pretest_pylint)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test pylint (test_python_pylint.PyLint.test_pylint)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
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

