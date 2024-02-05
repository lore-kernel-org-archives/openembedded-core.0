Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACCD5C4828D
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 19:15:19 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.2765.1707160512937911992
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 11:15:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=N4d1miRg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D92AFFF802;
	Mon,  5 Feb 2024 19:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707160511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=41kCl6V1Qpw3J+lvSVBMwxqAduaWmIf5YgHEi9u3FwU=;
	b=N4d1miRgoVOArCWe5kUf7/31Ilo2VpUd9veE0IULvqeuqrADji1jNcaz0ggbbY593DyeLd
	dGCpR36nm2qpgyYHO6hl0phq70cU8vGmwsgk/HQhf14WxZBGvI3Fj2M+awf5uJb6juPFCp
	7glkWbjagV/IHrFmK8BTWt39ebPdy9lqXS85RilR5W7lgl7plXkyfVbpcktUor57OLKmMD
	hkltPjubBqP5WKUMi7rb1cUubzsrbDoZ4wppcw5icnabBAtEeRCne2SNNoqMlWAVBAwaXv
	YhqFmwReCsgw1kIZhAn/NNFNROAHV1D5cqnO7WgDYVT+A4eCA0aW/6hIFajuyg==
Message-ID: <140ad239-678d-49eb-93e0-b06802c4c3dd@bootlin.com>
Date: Mon, 5 Feb 2024 20:15:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Patchtest results for [OE-Core][PATCH v3 1/2] testimage: move
 TESTIMAGE_FAILED_QA_ARTIFACTS default to core-image
To: Trevor Gamblin <tgamblin@baylibre.com>,
 Patchtest <patchtest@automation.yoctoproject.org>
Cc: openembedded-core@lists.openembedded.org
References: <0101018d79bfe020-06f2ce89-ea19-456b-92e7-66ee1c710fd1-000000@us-west-2.amazonses.com>
 <2831a2b2-53aa-4f1b-b3e1-6d2e318ebca4@baylibre.com>
Content-Language: en-US
From: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
In-Reply-To: <2831a2b2-53aa-4f1b-b3e1-6d2e318ebca4@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 19:15:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194966

Hello Trevor,

On 2/5/24 20:04, Trevor Gamblin wrote:
> 
> On 2024-02-05 09:50, Patchtest wrote:

[...]

>> SKIP: pretest pylint: No python related patches, skipping test
>> (test_python_pylint.PyLint.pretest_pylint)
>> SKIP: pretest src uri left files: No modified recipes, skipping pretest
>> (test_metadata.TestMetadata.pretest_src_uri_left_files)
>> SKIP: test CVE check ignore: No modified recipes, skipping test
>> (test_metadata.TestMetadata.test_cve_check_ignore)
>> SKIP: test CVE tag format: No new CVE patches introduced
>> (test_patch.TestPatch.test_cve_tag_format)
>> SKIP: test Signed-off-by presence: No new CVE patches introduced
>> (test_patch.TestPatch.test_signed_off_by_presence)
>> SKIP: test Upstream-Status presence: No new CVE patches introduced
>> (test_patch.TestPatch.test_upstream_status_presence_format)
>> SKIP: test bugzilla entry format: No bug ID found
>> (test_mbox.TestMbox.test_bugzilla_entry_format)
>> SKIP: test lic files chksum modified not mentioned: No modified recipes,
>> skipping test
>> (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
>> SKIP: test lic files chksum presence: No added recipes, skipping test
>> (test_metadata.TestMetadata.test_lic_files_chksum_presence)
>> SKIP: test license presence: No added recipes, skipping test
>> (test_metadata.TestMetadata.test_license_presence)
>> SKIP: test pylint: No python related patches, skipping test
>> (test_python_pylint.PyLint.test_pylint)
>> SKIP: test series merge on head: Merge test is disabled for now
>> (test_mbox.TestMbox.test_series_merge_on_head)
>> SKIP: test src uri left files: No modified recipes, skipping pretest
>> (test_metadata.TestMetadata.test_src_uri_left_files)
>> SKIP: test summary presence: No added recipes, skipping test
>> (test_metadata.TestMetadata.test_summary_presence)
>> SKIP: test target mailing list: Series merged, no reason to check other
>> mailing lists (test_mbox.TestMbox.test_target_mailing_list)
> This is odd. I think your patch is OK - patchtest looks for "FAIL" in the patch
> body, and must've gotten snagged on the subject line.

Yes, that is also my conclusion, and I have sent a small patch to address this:

https://lore.kernel.org/openembedded-core/20240205155730.115895-1-alexis.lothore@bootlin.com/T/#t

I realize that it would have been smart to Cc you on this patch, sorry for the miss.

-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


