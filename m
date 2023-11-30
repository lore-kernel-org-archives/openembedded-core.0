Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1946C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 07:47:01 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.67427.1701330418892573532
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 23:46:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=W8u45pce;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=EHQkx3PL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018c1f31f8fc-a15e8ed0-53b8-430d-b6c2-c7f14960652b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701330418; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date;
	bh=a/EWj2pwBUT51qiXYK/jnKHWxFb2u0YkQodIiPcAsjo=;
	b=W8u45pceFuXCs5ugrSQWNDtEVi7/hHcabhih5UKKh6GuhE5g1Bu65RYjhZ23xhNp
	0HAFJTIRR62kPeBBD7kX4lCVSZux60YN20Q4YMZ/kJJsA7Gan9Qd4nbynGAdG2vDDee
	9g1Ysj37aKQlwxjx8jM1rNGa47F9u36yJoj4ljnc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701330418;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=a/EWj2pwBUT51qiXYK/jnKHWxFb2u0YkQodIiPcAsjo=;
	b=EHQkx3PLvumoTLvb5Y0TJFl89m3A9/NO9xYLrJKDZ7Fb1fQgaGSWkD6B02glzn6d
	otfpLCdqtDQZmJxZPPcq8uXP9R3uwd/7Po6bdkLlrUGX4Zrv9wopNE1GS3m09042BUl
	k3hfGoquAQ9lNKMGXmu2CedN5yu2krExacW9/5gg=
From: patchtest@automation.yoctoproject.org
To: Vivek Kumbhar <vkumbhar@mvista.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][dunfell][PATCH] libsndfile: fix CVE-2022-33065 Signed
 integer overflow in src/mat4.c
In-Reply-To: 20231130073101.280790-1-vkumbhar@mvista.com
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018c1f31f8fc-a15e8ed0-53b8-430d-b6c2-c7f14960652b-000000@us-west-2.amazonses.com>
Date: Thu, 30 Nov 2023 07:46:57 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.30-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 07:47:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191478

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/dunfell-libsndfile-fix-CVE-2022-33065-Signed-integer-overflow-in-src-mat4.c.patch

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

