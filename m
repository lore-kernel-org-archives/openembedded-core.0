Return-Path: <narpat.falna@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB6BDC021B8
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 17:53:48 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.15313.1740506024663950794
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 09:53:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dDQYEsY2;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: narpat.falna@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-220ca204d04so99098945ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 09:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740506024; x=1741110824; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=duYIEuLZPjPDfrZtkyAbS29XYmqycn8ufOciqCdi4VE=;
        b=dDQYEsY2gzs7ZKU9rfP3W0NuWMI/fDhhB35Jxkk0ka1qc9bNy6Nafm++5+rG6a24FO
         87MHT7XKetHXw7SWmTI5FEYHVZ+tgqcN7GWUj3QrKuIO1eYNZvgdP9/j1gY4mE1X3/95
         GPULg7/HH8l6dRY75LEJFUppUtr4MbWYI4yM7eVZGDWRCX1p8S+SQmnEEsDgYpLVB+e2
         yPUjhNVg+pnhHZfTEYK5hfX95GMaOrJwt9zoJ+YJhKtGZ4H5hYKHynjcBAZuuN4L6CFN
         n3MH2OQUHQlqrouTh8f5TuJsrJkJm//ONYN7FMFkxcnQ6ALbNHxLN+8IGv4nDaYdhqFZ
         O2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740506024; x=1741110824;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=duYIEuLZPjPDfrZtkyAbS29XYmqycn8ufOciqCdi4VE=;
        b=SVhejXxqLzuOlPgwq4rYKorqbjGALb05oUYnKUiPnZavWc34gWlieKPxbzrpPSxGH7
         Fj+ZTXZ5RCbES/HqGyb5bXpBZKwZhzLD4Nr7Iy6fOEXaZo+FUJ2nahxydirTQ19EWJ8Z
         kw/L8Bfk/rw2oVPKkOVXL/sWEr+k0ARyyCBMSgtro7rg6hOPLUlelRjl9CeTssFRXHAo
         Fw8w1Ic2/j8PgaIRc8YkeF4XOnG3h0YQ9igrQjiImJ4K//FmeQO8sSGk6RGDooKc4RHD
         vODivyml0MwdCGi+1Tb57DJFzE8elKL52QTEd+Dn8I+X+mG6u+mtsSZ/J3uYI/vwp4mP
         8nwA==
X-Forwarded-Encrypted: i=1; AJvYcCVt1v+fSOnGwTgfp/fJuWFR0SicAl01fAfx3WLSQ1cn8NjL/v+nn95Ruw2fJGm3IOr7CF2L1C/ZZzdVhKkEH2F/Yg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw9llZYjdLOU9Y+aJLpRoR/BM4D9LrE8+tY9i0IYa/0qyb0qYpz
	l2/Q9qvPLcuoPiL78EPbTlGJpEZ7agWFsqGxINDdJJTta2gTEBzw
X-Gm-Gg: ASbGnct/f3bWM8HTE+614s+YhFfWH+rkvESXpAFD7Uydzw6dYQBQ4RIuZXmQDB9vtv4
	xep3LAqPiYSrCgk4wh1Ytbsy5zdDzNsMnYTG3ZWIkemqi02gXCbQPKDE5f6bTlcjRDzp8j7tLmG
	e1TcR074wgzSaafBEa8aXuoFcmdsqlv8juiWpZ5KSjXSbAbznmZg9rxR9iqkOOCQ/MmR7gTzPzL
	66wWwkfuXqvptOQX0f9R4lntkCGaj8zdFZXK+h6BpDLUxoHJs2TDdYso2CauaKy259q5bV/eiy9
	XhY0rWSkx5uUDuvajeKAW8f7SWb1h+62jArO6Yw6jUxJRUjQXUbfpV1gCZnQ2XDI4WcvA8nz9SI
	=
X-Google-Smtp-Source: AGHT+IFWaY4Gp9u320YEIrWJoCQKZMvua0t+PzbwTrRSRnqSJmxEl0ej6z/GW0wsLfTFYDgj11EYbQ==
X-Received: by 2002:a17:902:f60b:b0:221:263:230 with SMTP id d9443c01a7336-22320208581mr5151345ad.32.1740506023806;
        Tue, 25 Feb 2025 09:53:43 -0800 (PST)
Received: from ?IPV6:2409:40f2:158:4e7c:98c6:99ef:540:c9b1? ([2409:40f2:158:4e7c:98c6:99ef:540:c9b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a01fcc5sm17172145ad.75.2025.02.25.09.53.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 09:53:43 -0800 (PST)
Message-ID: <63d70b8c-c0d4-40a3-b21b-b8f26bd6afb7@gmail.com>
Date: Tue, 25 Feb 2025 23:23:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Patchtest results for [PATCH v2][OE-core][kirkstone] systemd:
 upgrade 250.5 -> 250.14
To: patchtest@automation.yoctoproject.org,
 openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tvgamblin@gmail.com>, Steve Sakoman <steve@sakoman.com>,
 Randy MacLeod <randy.macleod@windriver.com>
References: <20250225151443.1549639-1-narpat.falna@gmail.com>
 <010101953dbbe921-8c3da1cd-cc93-4c23-8afd-b494a9e95ef1-000000@us-west-2.amazonses.com>
Content-Language: en-US
From: Narpat Mali <narpat.falna@gmail.com>
In-Reply-To: <010101953dbbe921-8c3da1cd-cc93-4c23-8afd-b494a9e95ef1-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 17:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211918

On 2/25/25 21:01, patchtest@automation.yoctoproject.org wrote:
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/v2-kirkstone-systemd-upgrade-250.5---250.14.patch
>
> FAIL: test CVE tag format: Missing or incorrectly formatted CVE tag in patch file. Correct or include the CVE tag in the patch with format: "CVE: CVE-YYYY-XXXX" (test_patch.TestPatch.test_cve_tag_format)
>
> PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
> PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
> PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_status_presence_format)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
> PASS: test lic files chksum modified not mentioned (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
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

This looks like a false positive for a CVE tag due to the new patch.

Can anyone please have a look into it?

../Narpat


