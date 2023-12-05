Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC7FC4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 02:47:06 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.90510.1701744417107223960
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 18:46:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OgKI4ec3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=W7zDgMz4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018c37df1592-bbc7a244-95d4-4dc1-8a85-efdfd13cd182-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701744416; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date;
	bh=U/J6rSJ7HFvX2JkicVKrrDZkl6dirUe0t0KJ3Cw+eZg=;
	b=OgKI4ec3Y9gS2MrEF/+rjCJN8EMJ9srUar4YG9LwDmCyrOp6B28Aijj+lz/rrr5J
	ysoi3umbp54QcM3ulfbu1uDY6GjEa8cCR7IspVrTY5UBbV0P4tJvbD+/6NQe9znXJvU
	UV8UlBFdDgxNtcUdmJFWpUQnKoNolxXBvDg7IxmA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701744416;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=U/J6rSJ7HFvX2JkicVKrrDZkl6dirUe0t0KJ3Cw+eZg=;
	b=W7zDgMz4Zfqrv8fruUZo/lv92J3v3J6BI3LjZMQjqxdbbvLmUNS/96WBR0g8R9bV
	GvCY2UOiSKq5ppaYc57ZdDJ1ADS/rJ4i5HmqvvnMMunLOm7k7Y27LIqfbAhC7BVv2/k
	jL3CPJNznBkjt17VxVHVwAxsME/jh7glHKdw6/fg=
From: patchtest@automation.yoctoproject.org
To: chee.yang.lee@intel.com
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [dunfell][PATCH 1/2] epiphany: fix CVE-2022-29536
In-Reply-To: 20231205021552.2248854-1-chee.yang.lee@intel.com
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018c37df1592-bbc7a244-95d4-4dc1-8a85-efdfd13cd182-000000@us-west-2.amazonses.com>
Date: Tue, 5 Dec 2023 02:46:56 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.05-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 02:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191775

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/dunfell-1-2-epiphany-fix-CVE-2022-29536.patch

FAIL: test CVE tag format: Missing or incorrectly formatted CVE tag in patch file. Correct or include the CVE tag in the patch with format: "CVE: CVE-YYYY-XXXX" (test_patch.TestPatch.test_cve_tag_format)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_status_presence_format)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
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

