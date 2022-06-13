Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2334C43334
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 15:59:37 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web12.7747.1655135976320086903
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 08:59:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=YT5iMV1A;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.49,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f49.google.com with SMTP id w27so7783778edl.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 08:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QtVVthRQv1GrV1xGxNNvKiSM5Cb6pqyvH0rL4dsw5L4=;
        b=YT5iMV1ALVQoDloCylzuBU0/du8yE89BLBsdzi0gxqBsPgxOzgEFT9l6e06TDi9uxQ
         bn+X+dqNfDC2rwuqwc7Ygrni7iTpU/rJUjRVqxrT2y6cxLlyjG1cKgHsAjz2bjMxLx0x
         2Q0+1/JVGKsjxrea4Sls8DdsebKVDhrWNDRFs1vsA001sQHZnAkir3nmQ28xggBQTaaS
         eMb2IIdQIZM149uFbuMi9tZ56D+r7GBnQ0iUDJFzPHS1zOBgIZNtLumfDSH9yEnjeOiw
         Kon8ANjr1o1pCsV4bacmwEQPfggbTnQUj4ZBORuYwsycF22qSXUl/Z/yZwh3yEN3bLZU
         YUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QtVVthRQv1GrV1xGxNNvKiSM5Cb6pqyvH0rL4dsw5L4=;
        b=gJfpcnd7tHF/KijdnS725JDMytPL/w6sHKlI2ScKHq3THLYMyP29t8hCCgOUa3i4Yi
         ca9yO3XzzEGvCg5I6blfU2x25wBHfEF13N7n6wYEMraMVA9CeKxA5ze+7ixbPADtUGUg
         /dRyDdOZfKtIttNoAdTkTYQyQ9CPf4I4e9FUqUg4hTHJN8/4Vzvjs4B4YOauxQG5ZYfd
         MPazKQyHCZbhb0+F6j5dSDRWg9YImhjSQIqAebwm28TRI4CmeCHUcFRX7QvPxsyQCXle
         bt5vQXi5vlHqe8tx/BBnuKN17Fzt85M5IT3NK+u7nAUqZ8ypP4oun03eW+HHFBHwiKEq
         Q2gw==
X-Gm-Message-State: AOAM5305x75LYpMF2IN+vAGcRUAkHV3h/u+OwdxtNrrse6+vejR9dfdM
	cOaBdx93hrkaqtpA2/gbEtHThYIEH5SNMAI7xeDhjw==
X-Google-Smtp-Source: 
 ABdhPJwyagDsvuvRbamTIMypOz7cviOu8vEZKY2leYUOGCwFUKI0cqtlVfEanpTW1Qlp3R9lpmh23bhL0zGYwfYr79s=
X-Received: by 2002:a05:6402:60d:b0:42f:ac38:af75 with SMTP id
 n13-20020a056402060d00b0042fac38af75mr420420edv.203.1655135974706; Mon, 13
 Jun 2022 08:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220612120224.4629B96054A@nuc.router0800d9.com>
 <AD877D76-9887-4236-80AC-F3F0BD6E4540@arm.com>
 <16F837E9E22C509D.5246@lists.openembedded.org>
In-Reply-To: <16F837E9E22C509D.5246@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 13 Jun 2022 05:59:23 -1000
Message-ID: 
 <CAOSpxdaZ=HsmohVRz8X=+=uu+hLo6hRHutFuoHqTzRVy-UeUfw@mail.gmail.com>
Subject: Re: [OE-core] [yocto-security] OE-core CVE metrics for master on Sun
 12 Jun 2022 02:00:01 AM HST
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
 <yocto-security@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 15:59:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166868

On Mon, Jun 13, 2022 at 5:32 AM Steve Sakoman via
lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
wrote:
>
> On Mon, Jun 13, 2022 at 5:01 AM Ross Burton <Ross.Burton@arm.com> wrote:
> >
> >
> > > CVE-2022-26691 (CVSS3: 6.7 MEDIUM): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26691 *
> >
> > This is fixed in 2.4.2 which is already in master.
> >
> > The stable branches can cherry-pick https://github.com/OpenPrinting/cups/commit/de4f8c196106033e4c372dce3e91b9d42b0b9444.
>
> I'm working on that for dunfell and kirkstone today.

I've put together a patch for dunfell which will be in the next patchset.

However kirkstone and master are both at version 2.4.2, so something
must be wrong in the database entry for this to be flagged for both
:-(

Steve

