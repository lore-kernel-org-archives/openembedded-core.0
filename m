Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2AABC47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 08:53:43 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.8803.1705395217101811943
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 00:53:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l368p+Me;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40e76626170so19926085e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 00:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705395215; x=1706000015; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uxPxGojZoTtimOb0XQSEmOv9lzQ6LHmOs36ttJRK9SM=;
        b=l368p+Me+6BXj2Q1gRPNAlte76xz+R8Q5nk1Fi7QWQ5f9uqKOhtfyukE16eUqG0Vt6
         IFd/yDoF58LS6yOcuR6jPF+C8Rzf3yWi/QQ31Gwr7RCguEFfOi4RTBzvz4COUIL6kzBC
         Tv/N5mfiGk65UAtCte0KwFdQGcsCueCWLmDm9+hULdUlycFC21vLrZIPvqY2WXg5n8Jz
         UE7hLBF8DovOxIje/40moVOt2na534UHTlGr1yUQJosdgVa6tAUU4aEzhc9n/1gw/VJH
         4L5K81tz4W6yM1jWIslqjiblBTYqesXAJSnu+TwFYCBRcmCFkbmhs0e4leZH26mGIA/n
         FPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705395215; x=1706000015;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uxPxGojZoTtimOb0XQSEmOv9lzQ6LHmOs36ttJRK9SM=;
        b=ec7PoEzOeZG1BnDJBi97gkm9FgBI06GriysLxn49vPkhPZOFturb7g8tHOoBq4aVFh
         D0YQcMSS00KpDQ8vO4WOttlCBpJW7q5X/gEy/4+gGfi/D8L/KZw2/6kn4tIuYVBpAit5
         QG9Yy7Hxe/s1GUkW8zmf+ilzc8WaonZeNwYj1SjnEjVD7b0Sj4DWiJPHrk3r37M2hglx
         2rGWP4DbzsxwiVORFaP+eflkyKE1mOQ4wNsozfCU8oY3KjfjqSQR+IB7iSvGgP/JIRFW
         VU14ITSirZuJiPtQy/W/A5CD3Gb+FoZg4IAEG1FFk9RqksRO+h/sVOaG9+jMJs8oMoAH
         I0Pg==
X-Gm-Message-State: AOJu0Yyb9i5fKkLkUlt5LeM76zxZ9eV/8RaN8XXCsJPd2QypatF6mwkT
	wHGIVab6ttkjGnPCbcyo+kpLeNANCQS0tV4j
X-Google-Smtp-Source: AGHT+IGjWOGUsP/w6ipNPyf6c6MU59XY4z/CrbtVwpV/xr1W2WKvXi26g1bXi9yW/FKALgkpKULC3w==
X-Received: by 2002:a05:600c:21d6:b0:40e:556d:6664 with SMTP id x22-20020a05600c21d600b0040e556d6664mr3412695wmj.64.1705395215247;
        Tue, 16 Jan 2024 00:53:35 -0800 (PST)
Received: from [10.139.3.237] ([154.47.27.145])
        by smtp.gmail.com with ESMTPSA id m35-20020a05600c3b2300b0040e541ddcb1sm18660078wms.33.2024.01.16.00.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 00:53:34 -0800 (PST)
Message-ID: <553ec677-73d2-4595-a113-304f269918a5@gmail.com>
Date: Tue, 16 Jan 2024 09:53:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Patchtest results for [PATCH v2 7/9] oeqa/selftest/recipetool:
 Move create_go test to a proper class
Content-Language: en-US
To: patchtest@automation.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
References: <0101018d1172d8bd-cd6ef52d-0c3b-4f2e-9b9a-a06b4234da50-000000@us-west-2.amazonses.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <0101018d1172d8bd-cd6ef52d-0c3b-4f2e-9b9a-a06b4234da50-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 08:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193841

Is that a strict requirement now even for trivial patches?

Slava

On 16.01.2024 09:45, patchtest@automation.yoctoproject.org wrote:
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/v2-7-9-oeqa-selftest-recipetool-Move-create_go-test-to-a-proper-class.patch
>
> FAIL: test commit message presence: Please include a commit message on your patch explaining the change (test_mbox.TestMbox.test_commit_message_presence)
>
> PASS: pretest pylint (test_python_pylint.PyLint.pretest_pylint)
> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test pylint (test_python_pylint.PyLint.test_pylint)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
>
> SKIP: pretest src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.pretest_src_uri_left_files)
> SKIP: test CVE check ignore: No modified recipes, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
> SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
> SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
> SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
> SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
> SKIP: test lic files chksum modified not mentioned: No modified recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
> SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
> SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
> SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
> SKIP: test src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.test_src_uri_left_files)
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



