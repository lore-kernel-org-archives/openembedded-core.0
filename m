Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5ADDC3DA64
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 23:28:08 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.9153.1721777286079234138
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 16:28:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=neVSo8so;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D562140003;
	Tue, 23 Jul 2024 23:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721777284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=38K+ZZRoktTmxiNLJrUBTpz6/hwV9sy2XwfpvNpBNA0=;
	b=neVSo8soeMDpUv/Pl/lnKBdJx2OJvqMrRVm6L9DZjjqPwizc6aCQaY11IeHjwCQ/iQ4E1I
	dFuogaG6xh31pIDQRAY34e/zSC273GFg3y+HWtQYF6sGPvMS4znKK7LwQDgvx/95js83b8
	ktn1itUHP4fwfcAEBRoC5yRfueHImxGVhYKyXFs0Jv8sEASnAT3BVry6gkLyrkk0+AswmU
	x1vh7H+rztHQWpB+aTxjS9Jlph7lSSMFWElZAklsbCN1fjV7k1t9kz+wl3eLPsNU6eQSVQ
	Fq0ERBICBL9oUlz/is8903g+RsV/RvNSVFn3QFlQCFK0nwdL+WcgzPJ/7T6xsg==
Date: Wed, 24 Jul 2024 01:28:03 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: patchtest@automation.yoctoproject.org,
	openembedded-core@lists.openembedded.org
Subject: Re: Patchtest results for [OE-core][PATCH v2 1/5] cve-check:
 annotate CVEs during analysis
Message-ID: <2024072323280372fb9082@mail.local>
References: <20240723115315.207013-1-marta.rybczynska@syslinbit.com>
 <01010190df81d582-311d068f-ddf1-407e-b094-e21c54daa85f-000000@us-west-2.amazonses.com>
 <CAApg2=St6hdjiyQuZvdR7FFEgL0DSoYFRkkPjEBoT9jA43MZ9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAApg2=St6hdjiyQuZvdR7FFEgL0DSoYFRkkPjEBoT9jA43MZ9Q@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 23:28:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202421

On 23/07/2024 17:41:40+0200, Marta Rybczynska wrote:
> This seems to be a false positive. Possibly the path 2/5 has an issue. I'm
> looking into the source code of patchtest to verify.

It is not, 2/5 is missing your SoB

> 
> Regards,
> Marta
> 
> On Tue, Jul 23, 2024 at 2:12 PM <patchtest@automation.yoctoproject.org>
> wrote:
> 
> > Thank you for your submission. Patchtest identified one
> > or more issues with the patch. Please see the log below for
> > more information:
> >
> > ---
> > Testing patch
> > /home/patchtest/share/mboxes/v2-1-5-cve-check-annotate-CVEs-during-analysis.patch
> >
> > FAIL: test Signed-off-by presence: Mbox is missing Signed-off-by. Add it
> > manually or with "git commit --amend -s"
> > (test_mbox.TestMbox.test_signed_off_by_presence)
> >
> > PASS: pretest pylint (test_python_pylint.PyLint.pretest_pylint)
> > PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> > PASS: test commit message presence
> > (test_mbox.TestMbox.test_commit_message_presence)
> > PASS: test max line length
> > (test_metadata.TestMetadata.test_max_line_length)
> > PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> > PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> > PASS: test pylint (test_python_pylint.PyLint.test_pylint)
> > PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> > PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> >
> > SKIP: pretest src uri left files: No modified recipes, skipping pretest
> > (test_metadata.TestMetadata.pretest_src_uri_left_files)
> > SKIP: test CVE check ignore: No modified recipes or older target branch,
> > skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
> > SKIP: test CVE tag format: No new CVE patches introduced
> > (test_patch.TestPatch.test_cve_tag_format)
> > SKIP: test Signed-off-by presence: No new CVE patches introduced
> > (test_patch.TestPatch.test_signed_off_by_presence)
> > SKIP: test Upstream-Status presence: No new CVE patches introduced
> > (test_patch.TestPatch.test_upstream_status_presence_format)
> > SKIP: test bugzilla entry format: No bug ID found
> > (test_mbox.TestMbox.test_bugzilla_entry_format)
> > SKIP: test lic files chksum modified not mentioned: No modified recipes,
> > skipping test
> > (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
> > SKIP: test lic files chksum presence: No added recipes, skipping test
> > (test_metadata.TestMetadata.test_lic_files_chksum_presence)
> > SKIP: test license presence: No added recipes, skipping test
> > (test_metadata.TestMetadata.test_license_presence)
> > SKIP: test series merge on head: Merge test is disabled for now
> > (test_mbox.TestMbox.test_series_merge_on_head)
> > SKIP: test src uri left files: No modified recipes, skipping pretest
> > (test_metadata.TestMetadata.test_src_uri_left_files)
> > SKIP: test summary presence: No added recipes, skipping test
> > (test_metadata.TestMetadata.test_summary_presence)
> > SKIP: test target mailing list: Series merged, no reason to check other
> > mailing lists (test_mbox.TestMbox.test_target_mailing_list)
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

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202408): https://lists.openembedded.org/g/openembedded-core/message/202408
> Mute This Topic: https://lists.openembedded.org/mt/107503127/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

