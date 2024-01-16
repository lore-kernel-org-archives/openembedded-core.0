Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE39C4706C
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 09:28:43 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.9382.1705397317747749126
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 01:28:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Znm44QQW;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C576E60003;
	Tue, 16 Jan 2024 09:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705397315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VZILA1KXHsLiSWv+s4rml0QfBFKnodc8w16UaDhyHW8=;
	b=Znm44QQWsHLYDcszT6wt73xcvvwYC2uIgqR9stV3lyLo1Thb4aTF9jv4rMz/u3qUwFdj0N
	D7WpYKhc/UsMSrAdywGrmh1SkmVaL/FFJ6JFFLTG7JUPJ8zkwQfTUNbb6IqOUgGuzl2U8w
	gBbOtyiA/z4xepB/+7i/FUPws2dP2JIuXHxrel32P7lUSw44c2zhD2w2PihN/bPbdOzZZ0
	IQLmsxIH7OSurQjQ2QugKhLGjvgf4Pc7XZFQDVT6wl3tlolh5oFR0thdRmIKLbUDNFo7vH
	48FlDzWomuzuhhh1MHxHn0/e7FYi+961boF9LFIsVSyvEacjZ1aMduvxLU5lxg==
Date: Tue, 16 Jan 2024 10:28:34 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>,
	patchtest@automation.yoctoproject.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] Patchtest results for [PATCH v2 7/9]
 oeqa/selftest/recipetool: Move create_go test to a proper class
Message-ID: <20240116092834f19a1e78@mail.local>
References: <0101018d1172d8bd-cd6ef52d-0c3b-4f2e-9b9a-a06b4234da50-000000@us-west-2.amazonses.com>
 <553ec677-73d2-4595-a113-304f269918a5@gmail.com>
 <CANNYZj_T7xfJy51UaB9UVaB_S-ZM=UHNy-7Aqu2akAyd+P4syw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj_T7xfJy51UaB9UVaB_S-ZM=UHNy-7Aqu2akAyd+P4syw@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 09:28:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193846

On 16/01/2024 10:08:50+0100, Alexander Kanavin wrote:
> No.

Why not?

> 
> Alex
> 
> On Tue, 16 Jan 2024 at 09:53, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
> >
> > Is that a strict requirement now even for trivial patches?
> >
> > Slava
> >
> > On 16.01.2024 09:45, patchtest@automation.yoctoproject.org wrote:
> > > Thank you for your submission. Patchtest identified one
> > > or more issues with the patch. Please see the log below for
> > > more information:
> > >
> > > ---
> > > Testing patch /home/patchtest/share/mboxes/v2-7-9-oeqa-selftest-recipetool-Move-create_go-test-to-a-proper-class.patch
> > >
> > > FAIL: test commit message presence: Please include a commit message on your patch explaining the change (test_mbox.TestMbox.test_commit_message_presence)
> > >
> > > PASS: pretest pylint (test_python_pylint.PyLint.pretest_pylint)
> > > PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
> > > PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> > > PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
> > > PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> > > PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> > > PASS: test pylint (test_python_pylint.PyLint.test_pylint)
> > > PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> > > PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> > >
> > > SKIP: pretest src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.pretest_src_uri_left_files)
> > > SKIP: test CVE check ignore: No modified recipes, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
> > > SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
> > > SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
> > > SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
> > > SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
> > > SKIP: test lic files chksum modified not mentioned: No modified recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
> > > SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
> > > SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
> > > SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
> > > SKIP: test src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.test_src_uri_left_files)
> > > SKIP: test summary presence: No added recipes, skipping test (test_metadata.TestMetadata.test_summary_presence)
> > > SKIP: test target mailing list: Series merged, no reason to check other mailing lists (test_mbox.TestMbox.test_target_mailing_list)
> > >
> > > ---
> > >
> > > Please address the issues identified and
> > > submit a new revision of the patch, or alternatively, reply to this
> > > email with an explanation of why the patch should be accepted. If you
> > > believe these results are due to an error in patchtest, please submit a
> > > bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
> > > under 'Yocto Project Subprojects'). For more information on specific
> > > failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
> > > you!
> >
> >
> >
> > 
> >

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193845): https://lists.openembedded.org/g/openembedded-core/message/193845
> Mute This Topic: https://lists.openembedded.org/mt/103758512/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

