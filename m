Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9002C4706C
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 09:09:13 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.9077.1705396143329406199
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 01:09:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rov+HmYD;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50e835800adso10649598e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 01:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705396141; x=1706000941; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WGInzeWZLjuUT3WDrSNPP0ZgBrsWUmxdsYO99/iXHPQ=;
        b=Rov+HmYD8AS5Bmpsfnb10gFhvdgb6+RW5EJpT15sj6gH6TotPS36XZT5c6P20WBxOk
         HTULeRRHp3ep+3QUbHCzAjZgKkJkmlaYuWUCkBS4U4/M0RH7AETFPlH59D5nasIxA+Bg
         k+3Al15gLplNDb26l5aTu8T9s8XVm95uVAZpL1E3+hp0vE9Taeq6422eqw+ZEMOxDFYZ
         WFBty5rUH1jNn7A8OXkbpYT/ILynofoKAKM+DzsZ4ZJhtlyBvfUa2/zWxDb+HqKu2GDI
         GpGJaYuQmw2tlnSeNGI5CX/Ve6m79UhpRilXu/JsOuNIG71Bl13nMGLCrOd/bksUH9yE
         YKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705396141; x=1706000941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WGInzeWZLjuUT3WDrSNPP0ZgBrsWUmxdsYO99/iXHPQ=;
        b=OPAnzp3yDNG4mK/5JN0Iq2TIz5WNUK+9xPRxwELOJIAMxw0cF2KAq0QWNMURrdfWii
         O+QUbLZWHQ0uimeIbiMgKA1KpfaExcBTmwTaSczMj+CBTi8kBy3G9azzplFu9xjhsxgj
         el1W0y/ZD1kPYo+7f9F8dMz99KU/AIONlZTBLdoPjiXL248ot7tXqPOYSg/NNhXbLb3O
         vW3nKDGhXQap2UjPIo9t+XPKj0PtasEJ7410mJ/L96v4Oi5ocZqlHyTHLLQPxxC13kG/
         uunw4YwTL4jjEt/6QVdm4PoT5cJ9Qtf+7qx2nlai3FGIdFulQxCVqibTDweOz8H90Mco
         J1dg==
X-Gm-Message-State: AOJu0Yyk1JKDtmB0JZeBOmpFc22btoWTSXwL/C5JbYxjFymgympudb+E
	GMPi9bP7wWYjY+QClaCUbOcBSxjGXl5VzLSP4tU=
X-Google-Smtp-Source: AGHT+IGGRgdn0vhOOvywRYiyk9F+ph/SC9yfjlnG2lQAluckNunC0lJ534bony1ovA5Fb+18MhOuErEV0yBuIaM6Qnk=
X-Received: by 2002:ac2:4e49:0:b0:50e:a93a:fb7a with SMTP id
 f9-20020ac24e49000000b0050ea93afb7amr1828165lfr.184.1705396141313; Tue, 16
 Jan 2024 01:09:01 -0800 (PST)
MIME-Version: 1.0
References: <0101018d1172d8bd-cd6ef52d-0c3b-4f2e-9b9a-a06b4234da50-000000@us-west-2.amazonses.com>
 <553ec677-73d2-4595-a113-304f269918a5@gmail.com>
In-Reply-To: <553ec677-73d2-4595-a113-304f269918a5@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Jan 2024 10:08:50 +0100
Message-ID: <CANNYZj_T7xfJy51UaB9UVaB_S-ZM=UHNy-7Aqu2akAyd+P4syw@mail.gmail.com>
Subject: Re: [OE-core] Patchtest results for [PATCH v2 7/9]
 oeqa/selftest/recipetool: Move create_go test to a proper class
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: patchtest@automation.yoctoproject.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 09:09:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193845

No.

Alex

On Tue, 16 Jan 2024 at 09:53, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
>
> Is that a strict requirement now even for trivial patches?
>
> Slava
>
> On 16.01.2024 09:45, patchtest@automation.yoctoproject.org wrote:
> > Thank you for your submission. Patchtest identified one
> > or more issues with the patch. Please see the log below for
> > more information:
> >
> > ---
> > Testing patch /home/patchtest/share/mboxes/v2-7-9-oeqa-selftest-recipetool-Move-create_go-test-to-a-proper-class.patch
> >
> > FAIL: test commit message presence: Please include a commit message on your patch explaining the change (test_mbox.TestMbox.test_commit_message_presence)
> >
> > PASS: pretest pylint (test_python_pylint.PyLint.pretest_pylint)
> > PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
> > PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> > PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
> > PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> > PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> > PASS: test pylint (test_python_pylint.PyLint.test_pylint)
> > PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> > PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> >
> > SKIP: pretest src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.pretest_src_uri_left_files)
> > SKIP: test CVE check ignore: No modified recipes, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
> > SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
> > SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
> > SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
> > SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
> > SKIP: test lic files chksum modified not mentioned: No modified recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
> > SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
> > SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
> > SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
> > SKIP: test src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.test_src_uri_left_files)
> > SKIP: test summary presence: No added recipes, skipping test (test_metadata.TestMetadata.test_summary_presence)
> > SKIP: test target mailing list: Series merged, no reason to check other mailing lists (test_mbox.TestMbox.test_target_mailing_list)
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
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193841): https://lists.openembedded.org/g/openembedded-core/message/193841
> Mute This Topic: https://lists.openembedded.org/mt/103758512/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

