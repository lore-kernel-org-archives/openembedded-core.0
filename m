Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F29BC4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 17:16:50 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.100618.1701105404600572627
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 09:16:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dIf9qdo3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ktrjEHRQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018c11c88677-207d9839-da52-454e-826a-a38c92b4640d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701105403; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date;
	bh=x9MIlds1ejlZLGjT+Q/ZYrQcgPucA65Ov92LTVtjPX4=;
	b=dIf9qdo3E/ll/o07mbPaAJVWodrz1T5IlLf9m0EYDrpAL6tVjuVTIOLSed8DNKOi
	UUgwEGQ1gbkZP+gt6hLoidHqX9Q5MZmEjpnZu9O3oSzk7Q7QGEvSTXrNZ9kCXeOufHU
	BEFErlvcpCWMgHnQc7I5Wfw9Nop3Lp9vyvDfxbAQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701105403;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=x9MIlds1ejlZLGjT+Q/ZYrQcgPucA65Ov92LTVtjPX4=;
	b=ktrjEHRQ++5Xq5Fdko1HbD3u8Q/iQC5QoM7zoPhM8iVl8PBXEKVCNn6BeHT/8HtP
	YDwdodeHaFUDxki58BVgaZfbIL188Y2oJ4xyOngYCO+NN9qGG78BkcKd5B5+VnfwV1m
	2tg0B0L10pmzwB2BgfbAVrOSJqa3XU/RfPYBbBoU=
From: patchtest@automation.yoctoproject.org
To: Ashish Sharma <asharma@mvista.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][dunfell][PATCH] mdadm: Backport fix CVE-2023-28938
In-Reply-To: 20231127170223.28941-1-asharma@mvista.com
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018c11c88677-207d9839-da52-454e-826a-a38c92b4640d-000000@us-west-2.amazonses.com>
Date: Mon, 27 Nov 2023 17:16:43 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.27-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 17:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191311

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/dunfell-mdadm-Backport-fix-CVE-2023-28938.patch

FAIL: test commit message presence: Please include a commit message on your patch explaining the change (test_mbox.TestMbox.test_commit_message_presence)

PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_status_presence_format)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)

SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
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

