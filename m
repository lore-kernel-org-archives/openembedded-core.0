Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63BCC48BF5
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:20:54 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.688.1708129248060205649
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:20:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=S3EVTRfy;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D8588240004;
	Sat, 17 Feb 2024 00:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708129246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3GqKtASmyF0KgaWcnjtWCLHf1QxWeUgT7fsPpMdtfKI=;
	b=S3EVTRfyUUpMl76ISMAFWA6L9WkH5ZA0OQVN/ODacF4wPsQ0U6sXAVHsysMhjxP1AkWPHX
	WECVu8oko9QYvLy/YrV5M7jo6+gLhlWeszBCIwj1mMOLwA+bU35v33FWQOF80Z0dZL7nPd
	tUVmzfEvSQ+B44IuHSyyPSfxqaLY2/F+TshXaj8IWgIP3Qr1+RcfM7We7Eaed8Wv3i6llE
	zoChDQkpSt0z9ovqOR6ZnHyGKOq6fKO/1wcTWDUBRDSrGDx8rdZIdr5k02jvgQfOPWwE1N
	YFoKDaZjzr1Un/DI+KpIK6h7jNKS5CZLTAJ6chOs/VH8JRU39YMKjnIkcd975A==
Date: Sat, 17 Feb 2024 01:20:45 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Patchtest <patchtest@automation.yoctoproject.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] Patchtest results for [PATCH 2/5]
 meta/lib/bblayers/buildconf.py: add support for configuration summaries
Message-ID: <2024021700204545550301@mail.local>
References: <20240216115222.3545462-2-alex@linutronix.de>
 <0101018db234cd8f-ecc9d987-2098-4b79-904c-1224c0737462-000000@us-west-2.amazonses.com>
 <0b77dcfb-392c-4c7f-82ee-1d95eac727e0@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b77dcfb-392c-4c7f-82ee-1d95eac727e0@baylibre.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Feb 2024 00:20:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195810

On 16/02/2024 09:26:18-0500, Trevor Gamblin wrote:
> 
> On 2024-02-16 08:57, Patchtest wrote:
> > Thank you for your submission. Patchtest identified one
> > or more issues with the patch. Please see the log below for
> > more information:
> Alright, so it's still not working properly. Short of changing the subject
> line, I'm not sure what else can be done on our end, unless there's a
> problem with the mailer itself - but that should show up in the headers if
> that's the case.

It is threaded properly for me.

> > 
> > ---
> > Testing patch /home/patchtest/share/mboxes/2-5-meta-lib-bblayers-buildconf.py-add-support-for-configuration-summaries.patch
> > 
> > FAIL: test commit message presence: Please include a commit message on your patch explaining the change (test_mbox.TestMbox.test_commit_message_presence)
> > 
> > PASS: pretest pylint (test_python_pylint.PyLint.pretest_pylint)
> > PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
> > PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> > PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
> > PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> > PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> > PASS: test pylint (test_python_pylint.PyLint.test_pylint)
> > PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> > PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> > 
> > SKIP: pretest src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.pretest_src_uri_left_files)
> > SKIP: test CVE check ignore: No modified recipes, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
> > SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
> > SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
> > SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
> > SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
> > SKIP: test lic files chksum modified not mentioned: No modified recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
> > SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
> > SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
> > SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
> > SKIP: test src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.test_src_uri_left_files)
> > SKIP: test summary presence: No added recipes, skipping test (test_metadata.TestMetadata.test_summary_presence)
> > SKIP: test target mailing list: Series merged, no reason to check other mailing lists (test_mbox.TestMbox.test_target_mailing_list)
> > 
> > ---
> > 
> > Please address the issues identified and
> > submit a new revision of the patch, or alternatively, reply to this
> > email with an explanation of why the patch should be accepted. If you
> > believe these results are due to an error in patchtest, please submit a
> > bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
> > under 'Yocto Project Subprojects'). For more information on specific
> > failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
> > you!
> > 
> > 
> > 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195774): https://lists.openembedded.org/g/openembedded-core/message/195774
> Mute This Topic: https://lists.openembedded.org/mt/104392578/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

