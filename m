Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CEACD5BAF
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 07:01:03 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11903.1779433256298730427
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2026 00:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=doYrj6G4;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ySbZmKat;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019e4e7cb26d-1030e544-3624-41c1-a459-1507e2d01eb8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1779433255; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=kD5HFiU89dL8dI/zzbwwT1UKoWI9VSfCxIeQ4NMPg7c=;
	b=doYrj6G4JWfrwDAoV5fZSnhiulZd269BMQ6HgIEoE7yaZ0Lcq8NrZV/eKlSb40BJ
	EYiP1uPLBVm7tOHsdXjt3JDf0OlSqjAT5IxLDd4aI8CIqH2w5XzRx00JxpZwIoT1/fU
	L4rdezZBa4jBQkuTNQbAdN9m/PfBwFGuOFKm4fBs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1779433255;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=kD5HFiU89dL8dI/zzbwwT1UKoWI9VSfCxIeQ4NMPg7c=;
	b=ySbZmKatoWBB4kOImhjwVNqyy6u6dzIPGjdyGqYP3pWJRZlZNcueHLuB7EONn5ql
	joDman5YlGKqTkcXSEy2owLz4S7URiOAgogPpYSmFDpccDjTr0XpynTCIxI4DdeqPBM
	Fg5bALLzszndMLtDmn3f9Iv0IfRfsgQUpj99/Cic=
From: patchtest@automation.yoctoproject.org
To: Bhabu Bindu <bindudaniel1996@gmail.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [poky][scarthgap][PATCH 1/2] libarchive: Fix CVE-2026-5121
In-Reply-To: <20260522065023.1084981-1-bhabu.bindu@kpit.com>
References: <20260522065023.1084981-1-bhabu.bindu@kpit.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019e4e7cb26d-1030e544-3624-41c1-a459-1507e2d01eb8-000000@us-west-2.amazonses.com>
Date: Fri, 22 May 2026 07:00:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.22-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 07:01:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237527

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/poky-scarthgap-1-2-libarchive-Fix-CVE-2026-5121.patch

FAIL: test Upstream-Status presence: Upstream-Status is present only after the patch scissors. It must be placed in the patch header before the scissors line. (test_patch.TestPatch.test_upstream_status_presence_format)

PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
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

