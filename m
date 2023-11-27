Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F8AC4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 10:21:58 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.91678.1701080515381745466
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 02:21:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CbV9MTVs;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2c876e44157so49156421fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 02:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701080513; x=1701685313; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pdLtdlAxwlfuzRgMg9yvM6i/A8fWoAcNVdSvgcYvwTU=;
        b=CbV9MTVsGDBS+Z6Yu3svDEK+nDxaEYbotlPjYVSlnmELXoaCLCuT8hi3YgwRT6FYtr
         nVRICeQAEpe91w+4wtN7xWu+Wbf72FzbcItFNPKdOMB0TwsUVRxYlRjf7wLYO+a2DKSI
         yf4amLbAvdnIITglMgZ1ACr44lKNUYHVNkyR1Mp6Gg4Qf33Ps0c7x1AcoLr/4DKJ+znw
         VgEh4WeowZ8Ft/qLiHe6r44XbdOqPTU8tEp9JYQG1boZN339WHiOW1HSu2rF/ClcLGfe
         LUTdYUcmAVe/6idVrDi9hT2FkzhGo/Vg7nAnEJR/qW4qklVXj7c8ggiqtwAwaGr0ypU4
         woVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701080513; x=1701685313;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pdLtdlAxwlfuzRgMg9yvM6i/A8fWoAcNVdSvgcYvwTU=;
        b=X3Pvoht6Dha9vLGkkXu/wGQVtVwhVTK2tbVwIFRk50lgIfg8utK71kqPZ1SdkL1BnQ
         wqOAgR/e6A9N0GkHt1oBsnOCudtBgoO+PnJTzH58VjqaEgO4bppBhhxJg9UC/xlRS8w1
         QgrDUqzdQw/KBbpX3GIOMpO29sLDOx1dHYt2s2DSQoyXeFqU4pxz0PDZG4tOh4dMOal6
         Kjwz1XdImdec9+BVKfgCo/WmhgR+oslFmuEp1dVwSJXgVJww2caA3qr8iTY+9ZInD+u+
         DoeqGA8pU/XIXvkWK60J82pge7tZ+ITx5ECQ822tUpY943DkRYzN4whwH+cXmQaiDVdy
         Q7uA==
X-Gm-Message-State: AOJu0YwXCqXvZQMQ/QDKRW3FvtDc7sil4pO9TOwsrG5FievpYJ9cosp1
	ikHXqFhfArNqlCcWIA3kGMdx9rAplqxxQk807ys/20IVX6I=
X-Google-Smtp-Source: AGHT+IFeEGJUekFmdMD9yPNy7w5rY0GVVsrEVbsvRUtlK1EYHgYfZp0KtaCQYmqv0iJ0NerucFuG9AEmVoBkQumzlu4=
X-Received: by 2002:a2e:9d8c:0:b0:2c8:744e:dced with SMTP id
 c12-20020a2e9d8c000000b002c8744edcedmr7052145ljj.35.1701080512973; Mon, 27
 Nov 2023 02:21:52 -0800 (PST)
MIME-Version: 1.0
References: <0101018c104b4641-881711a3-37e2-4c84-8227-1d728515a3d7-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018c104b4641-881711a3-37e2-4c84-8227-1d728515a3d7-000000@us-west-2.amazonses.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 27 Nov 2023 11:21:41 +0100
Message-ID: <CANNYZj9M9_JZdTsLP3N23N1LXKM2ZP5LdT15jpCoiGpgLiEpwA@mail.gmail.com>
Subject: Re: Patchtest results for [oe-core][PATCH] add PREFERRED_PROVIDER
 variables for llvm
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 10:21:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191288

Better shortlog:

default-providers.inc: add PREFERRED_PROVIDER variables for llvm

Alex

On Mon, 27 Nov 2023 at 11:20, Patchtest
<patchtest@automation.yoctoproject.org> wrote:
>
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/add-PREFERRED_PROVIDER-variables-for-llvm.patch
>
> FAIL: test shortlog format: Commit shortlog (first line of commit message) should follow the format "<target>: <summary>" (test_mbox.TestMbox.test_shortlog_format)
>
> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
>
> SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
> SKIP: pretest src uri left files: No modified recipes, skipping pretest (test_metadata.TestMetadata.pretest_src_uri_left_files)
> SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
> SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
> SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
> SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
> SKIP: test lic files chksum modified not mentioned: No modified recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
> SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
> SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
> SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
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
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191287): https://lists.openembedded.org/g/openembedded-core/message/191287
> Mute This Topic: https://lists.openembedded.org/mt/102826394/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

