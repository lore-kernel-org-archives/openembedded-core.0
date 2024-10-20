Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1360D3C92F
	for <webhook@archiver.kernel.org>; Sun, 20 Oct 2024 06:31:18 +0000 (UTC)
Received: from h1.cmg2.smtp.forpsi.com (h1.cmg2.smtp.forpsi.com [81.2.195.188])
 by mx.groups.io with SMTP id smtpd.web10.20372.1729405876929322584
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Oct 2024 23:31:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=eu0qiULV;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=eu0qiULV;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 81.2.195.188, mailfrom: andrej.v@skyrain.eu)
Received: from [192.168.10.90] ([62.197.243.174])
	by cmgsmtp with ESMTPSA
	id 2PT8tUjGnTNCy2PT8tGhkI; Sun, 20 Oct 2024 08:31:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1729405874; bh=4ZX/DBvQWzMo6al7vWXh3rGE3hNpYQcKYX0whQokcGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=eu0qiULVtD0Vf3kkeKFoUExaaJc+prxzqcNnNeBuLDlnX3Tet+R2dSRR0ZxYjY/dn
	 QIBuyS8Tla20K++c/B2lRXxEyBdqA4WAujpRJ9dWMCNpkcWTAloK/irorec/G5u6bu
	 K3c6k9GQdDj53ixaF88kAj1GChKwtl1JOt2RqwYk7avYL6KqOU7fChe5yhdUJGhRTW
	 1Dmz8r8rjMZi0oLJnGD6N5rFveNetbNUaKxxguNd9bCy0TuF1NHbfglX+6r5HRe9Td
	 2iuZx844KCx+tzvcn16eAz4+CRQwZXAWj7kqpYchZ9njlRhGFYLVisycWbCMPyGeRm
	 5Zlisqhvh4PTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1729405874; bh=4ZX/DBvQWzMo6al7vWXh3rGE3hNpYQcKYX0whQokcGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=eu0qiULVtD0Vf3kkeKFoUExaaJc+prxzqcNnNeBuLDlnX3Tet+R2dSRR0ZxYjY/dn
	 QIBuyS8Tla20K++c/B2lRXxEyBdqA4WAujpRJ9dWMCNpkcWTAloK/irorec/G5u6bu
	 K3c6k9GQdDj53ixaF88kAj1GChKwtl1JOt2RqwYk7avYL6KqOU7fChe5yhdUJGhRTW
	 1Dmz8r8rjMZi0oLJnGD6N5rFveNetbNUaKxxguNd9bCy0TuF1NHbfglX+6r5HRe9Td
	 2iuZx844KCx+tzvcn16eAz4+CRQwZXAWj7kqpYchZ9njlRhGFYLVisycWbCMPyGeRm
	 5Zlisqhvh4PTw==
Message-ID: <e8450426-3c52-4a94-a21d-3fea5c56604c@skyrain.eu>
Date: Sun, 20 Oct 2024 08:31:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Patchtest results for [OE-core][PATCH v3] busybox: 1.36.1 ->
 1.37.0
To: patchtest@automation.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
References: <20241019160221.47501-1-andrej.v@skyrain.eu>
 <01010192a593370a-4cc220e6-f982-4a19-86d0-9cfc88584fc2-000000@us-west-2.amazonses.com>
Content-Language: en-US
From: Andrej Valek <andrej.v@skyrain.eu>
In-Reply-To: <01010192a593370a-4cc220e6-f982-4a19-86d0-9cfc88584fc2-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOp8O7DJ5s3RsV8L7juCF/jq1HWjBH/X/7uM/w0O0neLUnnTNij8C+qHE4sbmNpSlfWk0m3Jel04VzZ2bfjFtUGDiyqO+DFf+Zv+whH2rP4Mz5s3icRG
 z//4f6JdsS8ocgnJMqkRevjZPSawh6Lz/TWLFQR3DkpbQ7g4dEJi+hjbPGtI36oUCi1FYA3qeApjHQKjZ/wOVAexz5KGKwP62GnT0hbNITM2pbZu9XIPqfr9
 /LsEZzlmeOwKPU9tYxknRuA3+N7vZTPWWGYqIUZAckA=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Oct 2024 06:31:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206088

This is an false-positive error, while I've renamed the file and removed :).


On 19.10.2024 18:19, patchtest@automation.yoctoproject.org wrote:
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/v3-busybox-1.36.1---1.37.0.patch
>
> FAIL: test src uri left files: Patches not removed from tree. Remove them and amend the submitted mbox (test_metadata.TestMetadata.test_src_uri_left_files)
>
> PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
> PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
> PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
> PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_status_presence_format)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test lic files chksum modified not mentioned (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
> PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)
>
> SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
> SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
> SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
> SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
> SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
> SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
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


