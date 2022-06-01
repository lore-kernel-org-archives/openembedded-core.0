Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 704EAC433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 07:47:44 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.4898.1654069659265112974
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 00:47:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QxfNh1C6;
 spf=pass (domain: gmail.com, ip: 209.85.208.180,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id s13so1076170ljd.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 00:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r67qTRKTPicIoIP6gfwFG0cc+rwKVZl76Aj20zF5LUE=;
        b=QxfNh1C6hhFC3XlAJFbFQzQn/ENRRO8q81ZEO9410kaq5CKegjHOTb1SSxbfm519sF
         gGmpBjLwxsiz7wF06WzQIQBKDhQBVQBIxdCp9XGaQjGCIe7pzz3NXbbKzSA7cmmlbHFU
         U91tPkDgs17ngj5yTWdx6eCl7ywRSkjbV2/UOFZWqBs8Ml0ctaFrrqQFp+P+gQBnfURJ
         Oy/5HwihtpNkazfSVZO9yaXEbTezLfi/2l0l7bjCJKwJj8QcSoDLLOCs5dyWYRRv/v9m
         xwiwnopfklQxHNh+DcifxnmzabnL0twgjXuwxseNL9wmpiEYeDcSkS5iNK1XvGW/hQsi
         41pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r67qTRKTPicIoIP6gfwFG0cc+rwKVZl76Aj20zF5LUE=;
        b=tJJiJ6tgbpmMAMIFEDLx9oY0buc82r+2YRRZHKPRLLzEvSefo9AHE2g3SbtIBbkqBP
         4YBN7qe2OFVhwLS+hy4Eg4wwk82ZdEMxZr8Z8l1VE2uw1Gkx/lP4Ds4vvK4Ul6lVclA8
         l/ciADPhtShdTY5QUJSNTVkj3LS25jU2sEbcgZPFWK+5906edf0Qr76AGkmWosTgSPMV
         mTPYyfD38uuM+/Yd9jRUOuTNcsV5h80BsfkTimtu20psN71YS3U8cwHbPeq+qIsSt6l3
         T4j5QRdvEbFPzH9LDLfZQZHuKuqCV+4TQ8Q0A0MlbtOAFIugqgrEJFn8BE2n9yfekp9B
         LobQ==
X-Gm-Message-State: AOAM530LYjLq1ZsbxrcffnUBpkdgB9H6fOeJrC2F4IX3dsS67QrXUsD8
	71TTajjaS1vL/vYYrrWKux4lH/xSSk202JeKp4s=
X-Google-Smtp-Source: 
 ABdhPJyHXsto2fPsaLPgf0JbZJN5+vlYPYQq9zCfUACFOOnGkWVs/eZ9tsLH1fq6+7nX6vYdc3N0lXaFWb2c9n9kPYA=
X-Received: by 2002:a2e:a224:0:b0:255:5271:29d5 with SMTP id
 i4-20020a2ea224000000b00255527129d5mr6328533ljm.513.1654069657271; Wed, 01
 Jun 2022 00:47:37 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CANNYZj-r853z=4LHDusy0QrQi73AfwrMe_DoF2hwqjEsZpkFJA@mail.gmail.com>
 <16922.1654068902989081253@lists.openembedded.org>
In-Reply-To: <16922.1654068902989081253@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 1 Jun 2022 09:47:25 +0200
Message-ID: 
 <CANNYZj8nh8rtj3c2ZXiBi3m-P5rDSK9Y9fWB+XSkAgaFWgTXhQ@mail.gmail.com>
Subject: Re: [OE-core] [master][kirkstone][PATCH] ncurses: update to
 patchlevel 20220423
To: Davide Gardenal <davidegarde2000@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 07:47:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166360

That is debian-specific versioning, but upstream has its releases here:
https://ftp.gnu.org/pub/gnu/ncurses/

On top of that there are patches, each numbered with a date, but
they're not releases:
https://salsa.debian.org/debian/ncurses/-/commits/upstream/6.3+20220423

Alex

On Wed, 1 Jun 2022 at 09:35, Davide Gardenal <davidegarde2000@gmail.com> wrote:
>
> Are you sure that this is a development snapshot?
> I took this branch https://salsa.debian.org/debian/ncurses/-/tree/upstream/6.3+20220423
> Sorry I'm not that familiar with ncurses version naming scheme.
>
> Davide
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166359): https://lists.openembedded.org/g/openembedded-core/message/166359
> Mute This Topic: https://lists.openembedded.org/mt/91451965/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

