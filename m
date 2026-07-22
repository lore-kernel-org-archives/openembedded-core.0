Return-Path: <patchtest@automation.yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E9BC44532
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 17:02:09 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5038.1784739721327477753
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 10:02:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=q596kfOt;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hqWyEcT7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019f8ac6ec81-605862d4-f017-4614-a309-868e4213c493-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784739720; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=F/quuyz4ZYQkVETZj7roPIJbFg3vDY6X80APM4cCn2s=;
	b=q596kfOtkpUxOpvVpIPA5Zzye2TK9bVvK3aFFjDuQu9ZeMmYv2wrDXLe4eGBU/il
	ixfqa6i8S7nLgbB+PeDK2C47H/zJgE6ovGuWZKOEcUDd2NfECH2Rv4imhnboqzEFTcr
	6cROEW17+9uDwSR6AOg6CSo3wlzIAO6TkbMRdo98=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784739720;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=F/quuyz4ZYQkVETZj7roPIJbFg3vDY6X80APM4cCn2s=;
	b=hqWyEcT7Z+uLkcaXgm161jKi+TV+mSfzg84V5FftYnZRqckdmN+lj3iD3fzEx+nB
	6slDeV93TBOGjsGT/qjuHsgU0EFF52qjL4RMjIZfE0A+cl2quAiQhWswTO4TCuxgTCW
	NWhNWU9X5cRnzpyyNSkJqXHnxJYWETerqF3gTT6I=
From: patchtest@automation.yoctoproject.org
To: bruce.ashfield@gmail.com
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH] linux-yocto/6.18: drm/virtio: fix deadlock in display_info_cb
 by removing hotplug from dequeue worker
In-Reply-To: <20260722165407.1415244-1-bruce.ashfield@gmail.com>
References: <20260722165407.1415244-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <0101019f8ac6ec81-605862d4-f017-4614-a309-868e4213c493-000000@us-west-2.amazonses.com>
Date: Wed, 22 Jul 2026 17:02:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.22-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 17:02:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241708

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/linux-yocto-6.18-drm-virtio-fix-deadlock-in-display_info_cb-by-removing-hotplug-from-dequeue-worker.patch

FAIL: test shortlog length: Edit shortlog so that it is 90 characters or less (currently 101 characters) (test_mbox.TestMbox.test_shortlog_length)

PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test lic files chksum modified not mentioned (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
SKIP: pretest src uri left files: Patch cannot be merged (test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test CVE tag format: No new source patches introduced (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new source patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new source patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
SKIP: test src uri left files: Patch cannot be merged (test_metadata.TestMetadata.test_src_uri_left_files)
SKIP: test summary presence: No added recipes, skipping test (test_metadata.TestMetadata.test_summary_presence)

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

