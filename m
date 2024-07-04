Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67326C30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 10:36:45 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.7304.1720089398347763571
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 03:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jdSotYca;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ee817dac89so15527961fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 03:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720089396; x=1720694196; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WO/1yT7srqiqndFIZGm1Sgxq1mh1q162kDm83coO+gI=;
        b=jdSotYcaYi1EAwdAbE/jBJw18xrQmLctcDV47wxlvqOmAnE8sAjIRhnGi/Txp4XI52
         xLi1mVvbu2qzVmi5guPhNVlPvV+nrUtyWyYM48r1BRnNjTYAWHet4iJgb8NZuWjCZM8o
         nz3436r5uBeRILZrdWeSfn9kgveaA+ImfIn8fBqWyjGhRB0YqgaqpMRYcC/n0SS8la34
         XNNydH6ArCTwsnvmiYKD905v3Ib1+dD4w28W62CHD87rvPah4tHsIUmrVSG83PU+mwek
         OESpWXyT01mJZ84Ajv78EJtvOXPE75JW2LsdyxE4SxeL4BkjbAualpjjSnSA1U8micql
         NofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720089396; x=1720694196;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WO/1yT7srqiqndFIZGm1Sgxq1mh1q162kDm83coO+gI=;
        b=DiQw1wAoGi2o1ulPt5wNuEqz1uxTwKGSYvWSsRu5Ba/g6BAss1YP/1MlOwxkv2y7t/
         VaXZwVu+FXF91vc8WHncCNQ8SHMn8gRK5h7fLRDUroBUwEE+nHWG9oWK8YGku0Jhwwjk
         vCWddiM7w8Tr+jXpJh3i6pPiV0goxq7nmYPjVtPHZPkb5zUQo9gOVw4cOKwb37SsAzVm
         ma9riYB752YsoVNfibO3YUclVi6tvJpAWIpUlGuitzHesNQnbQryj20LNiuC16wS3Ew8
         AN1XzlbJpaL15IS58rhMMsQXos5SCrvkuQBVuuw6cFfftz5K9/6vTaZHyFgQaySwJDcO
         jCRw==
X-Gm-Message-State: AOJu0YydrMj/P46noVZrdPhPChXmqvNlbrzCb0eBVSbKVib64wfOn8qZ
	OOvbqYjDVUNCpKZKlZgInqLZYLzePgIXYusWhwETmiDogWBqnW6iCG/ASBiJTzZEx62NKUUpd5m
	WpsPrf+PfLQfIV4u3penq+gQ0fvA=
X-Google-Smtp-Source: AGHT+IGSQcoUy/MO5J3hs0At1zLRYDA2OqsZpxlJGb8kYy+aytEM6Ug1ajEyq/gWmY5nWsBSNcl2TvJBexkquD/LKPA=
X-Received: by 2002:a2e:80c5:0:b0:2ee:7739:60ca with SMTP id
 38308e7fff4ca-2ee8f2bcd27mr3878941fa.11.1720089396007; Thu, 04 Jul 2024
 03:36:36 -0700 (PDT)
MIME-Version: 1.0
References: <31491.1720072149300569224@lists.openembedded.org> <Groupsio.2.31491.1720072149300569224@lists.openembedded.org>
In-Reply-To: <Groupsio.2.31491.1720072149300569224@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 4 Jul 2024 12:36:23 +0200
Message-ID: <CANNYZj-+UPqoEUeisyX6fuj1M_wTrf5w_-BXi8KFcHFdgtkSFg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 9/9] rust: Upgrade 1.77.2->1.78.0
To: Yash.Shinde@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 10:36:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201530

It's arm/arm64/x86/x86-64/mips/mips64/ppc.

Given that rust upstream has all mips support in tier 3 (no promises),
and ppc support in tier 2 without host tools (only building standard
libraries for the target is tested), I don't think we should be
fighting against that:
https://doc.rust-lang.org/rustc/platform-support.html

Those targets already have reduced testing via arch-qemu-lite here:
https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json

and I think we need toolchain-lite as well where rust would be skipped.

Alex

On Thu, 4 Jul 2024 at 07:59, Yash Shinde via lists.openembedded.org
<Yash.Shinde=windriver.com@lists.openembedded.org> wrote:
>
> [Edited Message Follows]
>
> https://valkyrie.yoctoproject.org/#/builders/49/builds/55/steps/12/logs/stdio
>
> The above failure is for rust v1.77.2 is on ppc target.
>
> I thought we skipped mips and ppc targets for rust oe-selftests, didn't we?
>
> I tested for the targets mentioned in, https://lists.openembedded.org/g/openembedded-core/message/201295
>
> Please let me know which targets are tested for rust oe-selftests in AB?
>
>
>
> Regards,
>
> Yash
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201503): https://lists.openembedded.org/g/openembedded-core/message/201503
> Mute This Topic: https://lists.openembedded.org/mt/106974835/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

