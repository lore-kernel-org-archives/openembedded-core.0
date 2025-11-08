Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DAC3CCFA18
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 12:41:27 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4519.1762605683270687939
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Nov 2025 04:41:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=HbjUdskD;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E5F234E415C3
	for <openembedded-core@lists.openembedded.org>; Sat,  8 Nov 2025 12:41:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9B9E160710;
	Sat,  8 Nov 2025 12:41:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5E1BF118511F0;
	Sat,  8 Nov 2025 13:41:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762605681; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=PxLU0negt5Y+k+9RvCmZCXUFbanW7TZohQd/yZw4yQk=;
	b=HbjUdskDlYLFY79vSonqBLkq/hYZ7YWArtW0qgAYAIfDAo+cvj3avY0iHmzrBexXMtw2JG
	cMYfNbzVRYQjr3sjN55EYEXBP28O3ggBbg66rngW4Mpu1OgRgBrs10CRp/B6sOylJZbn2c
	iabB1PCVrWkbZWH/si114f+H2LB5uXjG5XEOsnupkw1+Iiclzj4KdwiScZjD4z292IVauj
	ouM4xnwKSJd1bw2YqkYso/7iUVTxsxY93//Yle+xgCOBfUQdOtuHZH3eN1GyEm5gQFjtHv
	rPBy5ux6VuKjGK0zTaznsGBr7xxBNeb0tV9Qnp0XVAxlP7wIWHnQ3VNYRs2HOw==
Date: Sat, 8 Nov 2025 13:41:19 +0100
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: JPEWhacker@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Patchtest results for [scarthgap v4 01/17] backport: SPDX 3.0
 fixes and tasks from upstream version Walnascar
Message-ID: <ml7jbbmhrmkqwnmhpbyizzn6p75aymkrf73hdcyflqrvwb7x76@alk76iilhism>
References: <20251107131502.3857600-2-kamel.bouhara@bootlin.com>
 <0101019a5e8903ea-1215026a-9eda-490c-9f12-2d5e59e54b9d-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101019a5e8903ea-1215026a-9eda-490c-9f12-2d5e59e54b9d-000000@us-west-2.amazonses.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Nov 2025 12:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226079

On Fri, Nov 07, 2025 at 01:37:09PM +0000, patchtest@automation.yoctoproject.org wrote:
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>

Hi Joshua,

> ---
> Testing patch /home/patchtest/share/mboxes/scarthgap-v4-01-17-backport-SPDX-3.0-fixes-and-tasks-from-upstream-version-Walnascar.patch
>
> FAIL: test max line length: Patch line too long (current length 216, maximum is 200) (test_metadata.TestMetadata.test_max_line_length)
>

Do you think this minor formatting issue warrants sending a v5 series,
or can we proceed with v4 as-is since all functional and style checks passed?

> PASS: pretest pylint (test_python_pylint.PyLint.pretest_pylint)
> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test pylint (test_python_pylint.PyLint.test_pylint)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)
>
> SKIP: pretest src uri left files: Patch cannot be merged (test_metadata.TestMetadata.pretest_src_uri_left_files)
> SKIP: test CVE check ignore: No modified recipes or older target branch, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
> SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
> SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
> SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
> SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
> SKIP: test lic files chksum modified not mentioned: No modified recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
> SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
> SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
> SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
> SKIP: test src uri left files: Patch cannot be merged (test_metadata.TestMetadata.test_src_uri_left_files)
> SKIP: test summary presence: No added recipes, skipping test (test_metadata.TestMetadata.test_summary_presence)
>
> ---
>
> Please address the issues identified and
> submit a new revision of the patch, or alternatively, reply to this
> email with an explanation of why the patch should be accepted. If you
> believe these results are due to an error in patchtest, please submit a
> bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
> under 'Yocto Project Subprojects'). For more information on specific
> failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
> you!



--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

