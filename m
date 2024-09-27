Return-Path: <preid@electromag.com.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 058BECEBF68
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 01:47:21 +0000 (UTC)
Received: from anchovy2.45ru.net.au (anchovy2.45ru.net.au [203.30.46.146])
 by mx.groups.io with SMTP id smtpd.web11.59997.1727401637343891125
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Sep 2024 18:47:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: electromag.com.au, ip: 203.30.46.146, mailfrom: preid@electromag.com.au)
Received: (qmail 23844 invoked by uid 5089); 27 Sep 2024 01:47:15 -0000
Received: by simscan 1.2.0 ppid: 23701, pid: 23703, t: 0.6171s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950 spam: 3.1.4
Received: from unknown (HELO ?10.1.1.111?) (preid@electromag.com.au@203.221.104.202)
  by anchovy3.45ru.net.au with ESMTPA; 27 Sep 2024 01:47:13 -0000
Message-ID: <e21b0aa4-d7dc-467e-950c-95297cb7ffe6@electromag.com.au>
Date: Fri, 27 Sep 2024 09:47:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SPAM] Patchtest results for scarthgap: kernel build failure
To: patchtest@automation.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
References: <918f936e-68b2-449d-9521-3507c25f0a8b@electromag.com.au>
 <01010192310e86e5-dead12fa-f954-445e-b2b1-dadf7efdb3b4-000000@us-west-2.amazonses.com>
Content-Language: en-AU
From: Phil Reid <preid@electromag.com.au>
In-Reply-To: <01010192310e86e5-dead12fa-f954-445e-b2b1-dadf7efdb3b4-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 01:47:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205003

patchtest has inadvertently detected the email question as a patch.
Email did contain a diff, but it was part of the query into the problem being encountered.


On 27/09/2024 09:18, patchtest@automation.yoctoproject.org wrote:
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
> 
> ---
> Testing patch /home/patchtest/share/mboxes/scarthgap-kernel-build-failure.patch
> 
> FAIL: test Signed-off-by presence: Mbox is missing Signed-off-by. Add it manually or with "git commit --amend -s" (test_mbox.TestMbox.test_signed_off_by_presence)
> 
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)
> 
> SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
> SKIP: pretest src uri left files: Patch cannot be merged (test_metadata.TestMetadata.pretest_src_uri_left_files)
> SKIP: test CVE check ignore: No modified recipes or older target branch, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
> SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
> SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
> SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
> SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
> SKIP: test lic files chksum modified not mentioned: No modified recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
> SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
> SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
> SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
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
> 
> 

-- 
Regards
Phil Reid
  
ElectroMagnetic Imaging Technology Pty Ltd
Development of Geophysical Instrumentation & Software
www.electromag.com.au
  
23 Junction Parade, Midland WA 6056, AUSTRALIA
Ph: +61 8 9250 8100
Fax: +61 8 9250 7100

Email: preid@electromag.com.au


