Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6722D206BA
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 20:41:59 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.33721.1729111317389576803
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Oct 2024 13:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=jh1L0JGn;
 spf=pass (domain: baylibre.com, ip: 209.85.160.178, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-46089a6849bso1582461cf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 13:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729111316; x=1729716116; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YUq80hO88nhTM4iJsO2WV28T9EmC/ueg1lB0uq1vp3Y=;
        b=jh1L0JGnZ1rCCuFOFPbYoVwJaI1UoAO0MmelA/kCo4mnNEtzlrrOkepWlpJWg0jhv7
         1ZGcVGUOU0Ki+tCcvJP+qGM+T2J++zEunraDY3djoKg6Om46ll7tVIDPjpYRziOhYhNg
         eQK75kIG8ZFYLjOFyjbg06fm6jlf7Yu5xvMgF4OO7Gt3wPxL/+E/CtOpDlE3Wz7O237+
         lh8Wwoo8eG3Sk3gSrubdZgcwlGDKImHEubHH1PeAMRvFU/IO4nsJgR6KwlIKDkeyc5Uq
         22vku0efsWGe4r7Y8ZNVAlBuWJtZzlaTpwI8zlXWUcjH+NDo/Iouy+bnvqLfpnSv+fH+
         8kTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729111316; x=1729716116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YUq80hO88nhTM4iJsO2WV28T9EmC/ueg1lB0uq1vp3Y=;
        b=xM5HA5KZJu28dEgaXcawYNA9WBnsrMGV5aKmGcm+iFa+0cPq6ntf/oxKjYDyXOpRML
         GSu7xilE1cGSo50TDGdDiL5TngadM8iW510/a069lllXIFKhtWMqFiveHzWFr5s+1rJ2
         kWHItKQGew8YRHPETgWvbOCSFwMoZ2Tllh0ctgbf5mD11mwYf7EG+EQ/1IXfrNyzJ3NU
         isA8KPudA3819xY48dVcc5h5dBY8GWM2CWX+zOt1/vvRT8fOONeGu01V3rNFaHr591dT
         IZyqjxiYUDVXt2R1RyhXuxxgpaCdfk1ERGkFZQI1eDqwKTuXKOeWCqlcdgwI9AM4abLj
         iJrg==
X-Gm-Message-State: AOJu0Yz+mN1Zx89Teo4WDvMGQwo9YVHhJiRTBlQAzzg5AJGWHeHnPD0E
	av/hIFTClFmvLDe+IiMlYzhdA+Ahgsx9AzkwrGSlLFg1iu8UTzudFTPcwzg3guI=
X-Google-Smtp-Source: AGHT+IEqB3cQpzsj4gxWb7P96tqQIvxKwngs8ioKPrilfio/552AHNhvhzGCCWttP2fR+R4p6IVuzA==
X-Received: by 2002:a05:6214:5c03:b0:6cb:e770:f505 with SMTP id 6a1803df08f44-6cbf012bc59mr55893026d6.50.1729111316307;
        Wed, 16 Oct 2024 13:41:56 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cc22959b04sm21555096d6.96.2024.10.16.13.41.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 13:41:56 -0700 (PDT)
Message-ID: <f71e16dc-95aa-4839-aace-db2fdaed0d37@baylibre.com>
Date: Wed, 16 Oct 2024 16:41:55 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Patchtest results for [PATCH 5/5] python3: update
 3.12.6 -> 3.13.0
To: patchtest@automation.yoctoproject.org,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20241016193606.3459951-5-alex.kanavin@gmail.com>
 <0101019296e6df50-cd055c80-c39a-4b12-a39a-bd4b43cad4c7-000000@us-west-2.amazonses.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <0101019296e6df50-cd055c80-c39a-4b12-a39a-bd4b43cad4c7-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 20:41:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205980


On 2024-10-16 15:56, Patchtest via lists.openembedded.org wrote:
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/5-5-python3-update-3.12.6---3.13.0.patch
>
> FAIL: test lic files chksum modified not mentioned: LIC_FILES_CHKSUM changed without "License-Update:" tag and description in commit message (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
Hmm, another false positive for this one. I'll need to investigate this 
one...
>
> PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
> PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
> PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
> PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_status_presence_format)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> PASS: test src uri left files (test_metadata.TestMetadata.test_src_uri_left_files)
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
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205977): https://lists.openembedded.org/g/openembedded-core/message/205977
> Mute This Topic: https://lists.openembedded.org/mt/109051186/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

