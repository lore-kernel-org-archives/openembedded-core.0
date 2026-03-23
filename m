Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A97DF483F7
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 20:15:58 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4370.1774296953882603037
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 13:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=b8WbuCNl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=JARcpTMk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019d1c56f0fa-0be553c0-bb88-4fcb-b66a-46adb8904fe6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1774296953; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=LhIsQkZI71yjel7McR0sP8ZiOrTyQHuENWfe9dou+CU=;
	b=b8WbuCNl9u7YRPXFatlbB8Xaa+qINzRtD9b9dFs76jMIaDGz5po3AP73XSxHwgi6
	YjZHvK6jkuXwtzdNqGM6X7BvJMxecSGBrzaRbxUVE9s4gcsD5NB0s1gVx9stlT/dV3C
	BxIBV6aDCTOGEuAfDuje8pIW58IpU9vsthqdIpOw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1774296953;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=LhIsQkZI71yjel7McR0sP8ZiOrTyQHuENWfe9dou+CU=;
	b=JARcpTMk880jeeytCDHijA9GH6Fw4cWC+nHmIp7PFklDta5+OgiytSz5zW9+jnJK
	SzqX9wgfZHuL9U7KBI0/z05IMG9O5CHDnr3tRUdvuHAkXc8qVqk9qAVNBTrutSSI7VW
	M5rx7sbGRmXqLZkNW0gSIaNJgpQ3NkSF3PF0jObs=
From: patchtest@automation.yoctoproject.org
To: Peter Marko <peter.marko@siemens.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [meta-oe][PATCH v2 3/3] jsoncpp: upgrade 1.9.6 -> 1.9.7
In-Reply-To: <20260323200715.11652-3-peter.marko@siemens.com>
References: <20260323200715.11652-3-peter.marko@siemens.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019d1c56f0fa-0be553c0-bb88-4fcb-b66a-46adb8904fe6-000000@us-west-2.amazonses.com>
Date: Mon, 23 Mar 2026 20:15:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.23-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 20:15:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233761

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/meta-oe-v2-3-3-jsoncpp-upgrade-1.9.6---1.9.7.patch

FAIL: test commit message user tags: Mbox includes one or more GitHub-style username tags. Ensure that any "@" symbols are stripped out of usernames (test_mbox.TestMbox.test_commit_message_user_tags)
FAIL: test target mailing list: Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists (test_mbox.TestMbox.test_target_mailing_list)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)

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

