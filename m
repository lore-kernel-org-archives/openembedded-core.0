Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B10A3CD4F52
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 12:47:00 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7531.1779108419290249840
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 05:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Xt8Wl0bq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=QBfL28iV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019e3b201387-c34e6c6c-3283-4002-ad09-2f8bd4105f13-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1779108418; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=gma8lBRJySIzov4F3Q4C63/K/aixx63e6ViZZZH+dnU=;
	b=Xt8Wl0bqo5saz8oCCkUX9dzhfxeO7LjQt+9a6ByFXhC/rt0T+XvnJP8gTlN8gERT
	fy0qVwPl++1lELS7OEIfchUEFpkFownSmJt3dVLzfJI/ZOLUSBlHtE/asdPYMyg7Ut5
	QoXzoYd+akE2/3SxlBTwichx6+56iC/mZ0crU1t8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1779108418;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=gma8lBRJySIzov4F3Q4C63/K/aixx63e6ViZZZH+dnU=;
	b=QBfL28iVvVhJe6O40OUIXyWBzG05ef9t7L+cJ6XtgprCXI5vnqnOXaXMDLuTQQ1M
	ZEypKDImdZ4CBlSsGvJKdyMlnHelqbdIoiKGo0n+e+P93JnDs2mkad54/yWNe49WRjF
	21ksRk+97l3MhE9qc2aGzXbwEUNFdnvggb8+pngM=
From: patchtest@automation.yoctoproject.org
To: Hemanth.KumarMD@windriver.com
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH v2 12/12] gcc: i386: fix ICE with -ffloat-store and SSE
 [PR125308]
In-Reply-To: <20260518110327.2347543-13-Hemanth.KumarMD@windriver.com>
References: <20260518110327.2347543-13-Hemanth.KumarMD@windriver.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019e3b201387-c34e6c6c-3283-4002-ad09-2f8bd4105f13-000000@us-west-2.amazonses.com>
Date: Mon, 18 May 2026 12:46:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.18-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 12:47:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237243

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/v2-12-12-gcc-i386-fix-ICE-with--ffloat-store-and-SSE-PR125308.patch

FAIL: test Signed-off-by presence: A patch file has been added without a Signed-off-by tag: '0026-gcc-i386-fix-ICE-with-ffloat-store-PR125308.patch' (test_patch.TestPatch.test_signed_off_by_presence)

PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_status_presence_format)
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

