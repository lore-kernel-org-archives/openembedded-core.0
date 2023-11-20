Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D1E2C54E76
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 21:35:55 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.13889.1700516153156827593
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 13:35:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=erZVYTpO;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=PQQJf/6H;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018beea94440-6f886e68-f0e5-48f4-bb1a-65c883f53034-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700516152; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date;
	bh=encaB1ipmtLOiMqw2VNMdgxmtae0B/y4m/DB8IGvlgU=;
	b=erZVYTpO4QNcevICgSgxCXegFEs/EDGqFksq2C/c3rCxIlV3y2023Mt/XVFiQc/v
	XTqN6nrjsDM8GREKddclOtF8IxdsSN2VlgIg4oZLi5NdxQbq9NGgZyPbwnOgazDS5Uw
	JP/e3iiCTd3rJjrLlidfbrUIarGMiMUmmL2FWr3Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700516152;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=encaB1ipmtLOiMqw2VNMdgxmtae0B/y4m/DB8IGvlgU=;
	b=PQQJf/6H9/jmHzkxWpkLJStt8iiZ7PdbP8dSzx5zGi1J8jY2JLReAkNPK3tKMKWn
	VUuC89Rg4iT01r/o4kaEHs+ra6pus+4eY2KV1k4P+6YMO5AgVyYUsHmQnpZOvu1dm+5
	sIUkD+KNtcVoPu4b8wVhS7xrqY5PWsgFnKFRXHI8=
From: patchtest@automation.yoctoproject.org
To: Stefan Ghinea <stefan.ghinea@windriver.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core] [hardknott] [PATCH 1/2] libtirpc: add support for
 configuring and building with --enable-gssapi
In-Reply-To: 20231120212436.27604-1-stefan.ghinea@windriver.com
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018beea94440-6f886e68-f0e5-48f4-bb1a-65c883f53034-000000@us-west-2.amazonses.com>
Date: Mon, 20 Nov 2023 21:35:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.20-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 21:35:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190934

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/hardknott-1-2-libtirpc-add-support-for-configuring-and-building-with---enable-gssapi.patch

FAIL: test shortlog length: Edit shortlog so that it is 90 characters or less (currently 95 characters) (test_mbox.TestMbox.test_shortlog_length)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)

SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
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

