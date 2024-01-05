Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F9CCC3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 14:17:16 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.24347.1704464235710396465
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jan 2024 06:17:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NxJf2IF6;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=PD3LKzUU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018cd9fc3909-e1b7175c-de56-4eb6-ad70-22775f3ab9fa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704464234; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date;
	bh=Ki0QilCOP6JOxesKKb/69oZMSbuTtsIJw8MnwfGABIY=;
	b=NxJf2IF6aDQ1fk4KLBqgyV8o1bugOmFh7PDXEId9twhRmhubmYUjCQ499PbYtnO4
	h8GeRhiT86m8YE5VLYRnYykvwkGLV8AqFFD9qEjIc+LGfZQFnreJzY53/Z0g6/M+S8W
	uwGE2fBhECNbvpRaoYwpTdbeFjpScuqEioP4nY1k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704464234;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=Ki0QilCOP6JOxesKKb/69oZMSbuTtsIJw8MnwfGABIY=;
	b=PD3LKzUUl/2h8oiUw7OJdIqh8HGiXlfG/rapxsdxATbzhT0KD6wXUHixs5br4fsb
	VjISNY94FdYG+QnFkYOBAjY7YgWkzNWv4lUAIzdTcz8yqE/qNPzwrju+/TxZoh5kPZz
	FLQjT8SxfNLMazhZPVbTH3ZIgx+nJS0YF3uewuTc=
From: patchtest@automation.yoctoproject.org
To: Steve Sakoman <steve@sakoman.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][dunfell 4/5] cve-update-nvd2-native: increase the delay
 between subsequent request failures
In-Reply-To: 9e03b7a9879fd16e32f4eccb78b438f6fa9db74d.1704463208.git.steve@sakoman.com
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018cd9fc3909-e1b7175c-de56-4eb6-ad70-22775f3ab9fa-000000@us-west-2.amazonses.com>
Date: Fri, 5 Jan 2024 14:17:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.05-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 14:17:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193367

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/dunfell-4-5-cve-update-nvd2-native-increase-the-delay-between-subsequent-request-failures.patch

FAIL: test shortlog length: Edit shortlog so that it is 90 characters or less (currently 92 characters) (test_mbox.TestMbox.test_shortlog_length)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

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

