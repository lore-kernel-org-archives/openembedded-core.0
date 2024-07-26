Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9ABFC3DA7F
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 11:40:08 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.59521.1721994007504129688
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 04:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G5rc9upi;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42793fc0a6dso14452175e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 04:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721994005; x=1722598805; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y3bPONiQ0SIrTnFo122fcFDw/TnuuBNjYitJXQfUGbE=;
        b=G5rc9upiojlApD/RIdjAh+a9N+OzB6ihRUfuf50cQdWkN1CC9jMXE4UdfXKncNCo4A
         Y9JyFnT3gbJeo3TitXuWDrwOVI84cqTlyksBmW+ItwcjE9xc+pZfxFEzZYbo1V1ANVG9
         Cwb/j0uwsgXmIzk5u6LvhIRt+TZTZjxQpsf3z8I9HCYUZN5/5s0Jyf2DVF0Ja6zyjrC0
         CLSFS4FILLyvJvPan+unaApOfD+BVLpLYtZfo+R7EhvvBggSeEGnD3oWMNWPtCJdYOLh
         aHMg3kPQayHwit8+dqbT719nYgytvyjMcOWZHqrsRPVJWIs4y4zEUzmzo6rE2LJybhjg
         hDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721994005; x=1722598805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3bPONiQ0SIrTnFo122fcFDw/TnuuBNjYitJXQfUGbE=;
        b=a3NodWelxMbCZhEd6z88HPWDpnh1qxdd76jnC1plakmsy/25ytibI8MvTX1Og+jWD9
         n63ql4ZcnBr1K/vI71CFjcPk8+dd3PiiJnUu/iiX7io+SOhPvtf8MxH+u9oga/iAmCXk
         O8+xe+aloCMpWpdqme3pH3/gum6GAFrGH4Ua8jqNQeqAbHA1uehAdAmcxMGBpLhuCQTX
         nKnFWkh0bUNr7IwaovsG1DTd4wirGGm/BNYRVkgMnyt2kyHDHqXfaBXVmfAShO+nvagI
         dM7ZeNhJQg7sjyQHzNvzmfLlUBCLFFuTfW/3WUcbkME74Rs9dSPJFB5oW00mYxXCduQ8
         D86Q==
X-Gm-Message-State: AOJu0YwXSWAQuyAQSlDKOmlnlxhSn4FUKnL2v27kgWhGDJo2Z+hAsMXE
	4M4TnuP15N/IAYtPdae9qpx8UbJqbedTAm+FxFA5R2oRik0bSWxHmUkFxA==
X-Google-Smtp-Source: AGHT+IEiLHgDej/R0B4sUqeScHZncMns2HpCVZEfzo7K8+NJf59KbbCnkCUkm13+I1HN8QkzUPeAcw==
X-Received: by 2002:a05:600c:474a:b0:426:6960:34b2 with SMTP id 5b1f17b1804b1-4280579e00bmr36699185e9.33.1721994004925;
        Fri, 26 Jul 2024 04:40:04 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4280573f447sm77455485e9.16.2024.07.26.04.40.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jul 2024 04:40:04 -0700 (PDT)
Message-ID: <f48adef0-f8e0-4c02-a738-09fc74b2e739@gmail.com>
Date: Fri, 26 Jul 2024 13:40:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Patchtest results for [PATCH] rpcbind: Fix boot time start
 failure
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
References: <20240726112431.698884-1-zboszor@gmail.com>
 <01010190eed1a9f9-359372c0-aa36-4b02-8ab6-6e1188435e1a-000000@us-west-2.amazonses.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <01010190eed1a9f9-359372c0-aa36-4b02-8ab6-6e1188435e1a-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 11:40:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202527

2024. 07. 26. 13:33 keltezéssel, patchtest@automation.yoctoproject.org írta:
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/rpcbind-Fix-boot-time-start-failure.patch
>
> FAIL: test Upstream-Status presence: Upstream-Status is in incorrect format (test_patch.TestPatch.test_upstream_status_presence_format)

How is it in incorrect format? I used the documented format from
https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-statusThis 
is supposed to be a correct format according to the documentation, right? |

Inactive-Upstream [lastrelease: YYYY-MM-DD]
|
> PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
> PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
> PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
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
> SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
> SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
> SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
> SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
> SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
> SKIP: test summary presence: No added recipes, skipping test (test_metadata.TestMetadata.test_summary_presence)
> SKIP: test target mailing list: Series merged, no reason to check other mailing lists (test_mbox.TestMbox.test_target_mailing_list)
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


