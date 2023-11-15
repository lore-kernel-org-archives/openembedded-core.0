Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8128C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 04:02:06 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.5779.1700020917694572765
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 20:01:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WjRiSEQO;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DtDL1ScU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018bd1249189-87a94009-c958-4c2b-8cd0-5f8eda1f1aa6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700020916; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date;
	bh=b2zJtTytlJ7R1f/Zxh7IvVQ7cHddRERQ4AYsdClMp1A=;
	b=WjRiSEQO3syzcMd6NhkUnH66vKjXCV0nckbPdEIhK//z789rYF+5wHrmOtB/dFmr
	8drhXGFmHFyR2hvkVOO+4ds58J6RM+ffSWzhvnYzkBFqmVzXp8Tj/u/+4dDwUrqgaMZ
	P0eUU+AurnwtJvl9JCaWg4J2rcI8TMnTwdwjg240=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700020916;
	h=From:To:CC:Subject:In-Reply-To:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=b2zJtTytlJ7R1f/Zxh7IvVQ7cHddRERQ4AYsdClMp1A=;
	b=DtDL1ScUCE1IRzXDoJ2TMYX3GisyhHW/3GVQYrMnvPiE9BYzArrQW5Rv2qDYGWa4
	RHpeISY7V6VybTbZhrxnpwMhbAOZkyE4ArSfyCm8yydIhFnuk/noFpJZQ7XZXrSHchd
	uSLbhSoOsDMUnqV2RVLYdsSjZPGBr1IedZvWSkCc=
From: patchtest@automation.yoctoproject.org
To: vanusuri@mvista.com
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][dunfell][PATCH] libx11: backport Debian patches to fix
 CVE-2023-43785 CVE-43786 and CVE-2023-43787
In-Reply-To: 20231115034807.168344-1-vanusuri@mvista.com
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101018bd1249189-87a94009-c958-4c2b-8cd0-5f8eda1f1aa6-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 04:01:56 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 04:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190551

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/dunfell-libx11-backport-Debian-patches-to-fix-CVE-2023-43785-CVE-43786-and-CVE-2023-43787.patch

FAIL: test shortlog length: Edit shortlog so that it is 90 characters or less (currently 99 characters) (test_mbox.TestMbox.test_shortlog_length)

PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_status_presence_format)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)

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

