Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF0BC4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 08:37:45 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.13475.1707381464449757609
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 00:37:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PAgrVhXO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A88D060003;
	Thu,  8 Feb 2024 08:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707381462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eLl2Xh48JuRwAEX3T0V71ZV7jKeOyaR3aLNwoxKa/U4=;
	b=PAgrVhXO6qTIRiAG0hRqwg0BOEpwG6Rysv8t5jv385Zt0pXTqB5ox+ZHbAhbBi1FO8CWDn
	rkfluionE4v8TrQRTW+sdmmzM1ytu6WrbUSpOHSj8wCMaiegttaLdtCfuxlJLdgBc1IAAx
	9DKpmmfXXbeMuG1GmhdZAl2Nx0UttYP253/GuXOg3QkOAArOC7D7XrrDWLnnEL9Xkpt3yz
	MpnVMcKQ29/i3gNWRzKJxTTWLQTDD+cQmNuOgKNdHlhMWD8bdi0QAIGSJiSDNhy29HHdeW
	ImWOC8OqZJ7g8/9GyjfKh1QKeUkQV6ycOZ2392GV0Atz4rC9uXICkz8Syr0GQg==
Message-ID: <6265a583-dea3-42ad-a6b8-e8c74b7d7996@bootlin.com>
Date: Thu, 8 Feb 2024 09:37:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: openembedded-core@lists.openembedded.org,
 patchtest@automation.yoctoproject.org
Subject: Re: Patchtest results for [PATCH v2 2/4] alsa-tools: upgrade 1.2.5 ->
 1.2.11
Content-Language: en-US
To: Trevor Gamblin <tgamblin@baylibre.com>
References: <0101018d85abc8d5-251e6c1f-0089-46e1-a2b1-568d03dd8f87-000000@us-west-2.amazonses.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <0101018d85abc8d5-251e6c1f-0089-46e1-a2b1-568d03dd8f87-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 08:37:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195113

Greetings,

On 2/7/24 at 23:24, patchtest@automation.yoctoproject.org wrote:
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/v2-2-4-alsa-tools-upgrade-1.2.5---1.2.11.patch
>
> FAIL: test Signed-off-by presence: Mbox is missing Signed-off-by. Add it manually or with "git commit --amend -s" (test_mbox.TestMbox.test_signed_off_by_presence)
>
> PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
> PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test lic files chksum modified not mentioned (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
> PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> PASS: test src uri left files (test_metadata.TestMetadata.test_src_uri_left_files)
>
> SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
> SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
> SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
> SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
> SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
> SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
> SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
> SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
> SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
> SKIP: test summary presence: No added recipes, skipping test (test_metadata.TestMetadata.test_summary_presence)
> SKIP: test target mailing list: Series merged, no reason to check other mailing lists (test_mbox.TestMbox.test_target_mailing_list)


Oops, that's what happens when you're rushing to send patches before you 
go to sleep :)
However, in good faith, I did run patchtest on my patches, in particular 
this one:

Testing patch v2-0002-alsa-tools-upgrade-1.2.5-1.2.11.patch
Loading cache: 100% | | ETA:  --:--:--
Loaded 0 entries from dependency cache.
Parsing recipes: 100% 
|#############################################################################################################################################################################| 
Time: 0:00:13
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1849 targets, 
47 skipped, 0 masked, 0 errors.
SKIP: pretest src uri left files: Patch cannot be merged 
(test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: pretest pylint: No python related patches, skipping test 
(test_python_pylint.PyLint.pretest_pylint)
----------------------------------------------------------------------
Ran 2 tests in 14.104s

OK
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
SKIP: test bugzilla entry format: No bug ID found 
(test_mbox.TestMbox.test_bugzilla_entry_format)
PASS: test commit message presence 
(test_mbox.TestMbox.test_commit_message_presence)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
SKIP: test series merge on head: Merge test is disabled for now 
(test_mbox.TestMbox.test_series_merge_on_head)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
FAIL: test Signed-off-by presence: Mbox is missing Signed-off-by. Add it 
manually or with "git commit --amend -s" 
(test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)
Loading cache: 100% 
|###############################################################################################################################################################################| 
Time: 0:00:00
Loaded 1849 entries from dependency cache.
PASS: test CVE check ignore 
(test_metadata.TestMetadata.test_cve_check_ignore)
PASS: test lic files chksum modified not mentioned 
(test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
SKIP: test lic files chksum presence: No added recipes, skipping test 
(test_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test 
(test_metadata.TestMetadata.test_license_presence)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
SKIP: test src uri left files: Patch cannot be merged 
(test_metadata.TestMetadata.test_src_uri_left_files)
SKIP: test summary presence: No added recipes, skipping test 
(test_metadata.TestMetadata.test_summary_presence)
SKIP: test CVE tag format: No new CVE patches introduced 
(test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new CVE patches introduced 
(test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new CVE patches introduced 
(test_patch.TestPatch.test_upstream_status_presence_format)
SKIP: test pylint: No python related patches, skipping test 
(test_python_pylint.PyLint.test_pylint)
----------------------------------------------------------------------
Ran 21 tests in 1.099s

OK

I just saw the "OK" result, and overlooked the "FAIL" line above.
I'll file a bug :)
Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


