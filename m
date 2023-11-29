Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEADFC46CA3
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 11:48:42 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.30932.1701258513899154610
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 03:48:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dphvRC8u;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=VC/XwTq+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018c1ae8c57f-66b42eb3-c955-448e-a782-1197d39c9ac5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701258511; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date;
	bh=bRvq5v6Opw3of/YzDU/hbb6BQ0ObSOZTjKzj2ifYvXo=;
	b=dphvRC8uTCs+5Fxqa9zWA9JhQZ6iiAnsIG8Vz6o6fz5/PTkLzt1eRsacKU//B2yX
	sT3n8z6dyOhx25Eaa1fiHVm+X0vtrOeSMWTVpeEnLJDYb3LOmebSLbfVszaPHp4KsOU
	epvCurm1WEJ2CEv9/ttVixPewiFcoE5l7dgWQe8A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701258511;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=bRvq5v6Opw3of/YzDU/hbb6BQ0ObSOZTjKzj2ifYvXo=;
	b=VC/XwTq+m2lNmYr5zVuV5gmytRspg6RhzUvkgesKZOjBf1xy0JEtQhigo5fyb6Ir
	Wru7O8fVnYIpNbA++r8ko4UZHwcO2N8Vj9IX+XyZVk5avl7Hao1bgTT+6UQKPhzGKoT
	0hVJuzox3nP89tSPgqpvCSEHtc60qL5uv4J02WPQ=
From: patchtest@automation.yoctoproject.org
To: aszh07 <mail2szahir@gmail.com>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][dunfell][PATCH] cmake: Unset
 CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES variable definition from toolchain
 file
In-Reply-To: 20231129113206.4582-1-mail2szahir@gmail.com
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018c1ae8c57f-66b42eb3-c955-448e-a782-1197d39c9ac5-000000@us-west-2.amazonses.com>
Date: Wed, 29 Nov 2023 11:48:31 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.29-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 11:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191443

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/dunfell-cmake-Unset-CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES-variable-definition-from-toolchain-file.patch

FAIL: test shortlog length: Edit shortlog so that it is 90 characters or less (currently 108 characters) (test_mbox.TestMbox.test_shortlog_length)

PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test bugzilla entry format (test_mbox.TestMbox.test_bugzilla_entry_format)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)

SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
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

