Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E44E67A9D
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:17:27 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15090.1772533040030092757
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 02:17:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=j6OKeUlU;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Z9Ly+jGM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019cb333c01f-7290d357-898e-4f13-b5d5-54916640ba2c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1772533039; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=1+oSUVVANZoi0k7W7B9sidVld0RH2sxr/2c5A6bRh9E=;
	b=j6OKeUlUeqgUgmCioaF21tHliKwqDIyNpOoxYOUJpFB1hHANrO+DfpkenGaaGAzA
	dFBm9v//YTQpbj0+P/UQvZXBX7kUGOoKaggBV2/accglGRv8lTHuwqe1rgnIRu6kKiH
	2vUbj4Wc+/XHyVzEpyeEgTT1FO9mefOfi6rFvMds=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1772533039;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=1+oSUVVANZoi0k7W7B9sidVld0RH2sxr/2c5A6bRh9E=;
	b=Z9Ly+jGMUgFcfiNnBla8hSDPWaJ9rhXEC8By3blKAE/QPerAWS/MoUvNoOX4WxEf
	I73egY/NuL8vGBe2QOHkPzZR9bLdusaqVkdQHrMO7dxlEGpa4tZe7eyFS9wkUvgHnwC
	xJvIZg+ve/rubQNqJnTF6U7UzI+zzF+ochILEfKQ=
From: patchtest@automation.yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core] [PATCH 22/23] vulkan-samples: upgrade to latest revision
In-Reply-To: <20260303100929.1624-22-wangmy@fujitsu.com>
References: <20260303100929.1624-22-wangmy@fujitsu.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019cb333c01f-7290d357-898e-4f13-b5d5-54916640ba2c-000000@us-west-2.amazonses.com>
Date: Tue, 3 Mar 2026 10:17:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.03-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 10:17:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232300

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/22-23-vulkan-samples-upgrade-to-latest-revision.patch

FAIL: test Signed-off-by presence: Mbox is missing Signed-off-by. Add it manually or with "git commit --amend -s" (test_mbox.TestMbox.test_signed_off_by_presence)
FAIL: test non-AUH upgrade: Invalid author auh@yoctoproject.org. Resend the series with a valid patch author (test_mbox.TestMbox.test_non_auh_upgrade)

PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
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

