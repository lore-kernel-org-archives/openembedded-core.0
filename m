Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1C9C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 15:00:38 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web10.11754.1651158028926023892
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 08:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pRAcF2HN;
 spf=pass (domain: gmail.com, ip: 209.85.219.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id g28so9478476ybj.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 08:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4plBKDXB9kou3JR/FUCLTQzl2/m6xL1wsJ5tbg3pVBo=;
        b=pRAcF2HNPgDoxzHQb4k0+3lATWG8lN9SnGCHAwu+1vxMLw9KxvE8kgC/SiDO6VBQdC
         bh9xXdTirkUdxFarGWkDSy6K5t708vrCWhcQLeHeKrUXxm9W+7HTFIT0ncmIEDJgblN8
         bMVH7800QT10zqpb5cvij7y790SH+1xC/N4GHRN/b62e3zEJTSZUrwhuSrguKvF/3ARm
         JcZq9IBaf1lYNnLPlt1UUpFDIANU6yB9p7gTraIqSpFeFNhGUVSTMs4CxlD1oE/xwoED
         ccXvDes7046GoqbnHD9NaPJ/RbXhZI+kXLxaefSLwnJ5ESc/doPNVyXwAlZCaJfaHErg
         14uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4plBKDXB9kou3JR/FUCLTQzl2/m6xL1wsJ5tbg3pVBo=;
        b=BjXvU/OTEaTKJ+8dT2lwF9aI4ZpDTbb0pjGvogxmTyqBkQ1c+1EqMoh6Q+efbAdBSi
         TIb2tU6JqnCf5uv09fAv1AtDDEOcqTPy3rXker+FTLuKtP2F+zmMsGmRFisStBYn9p6h
         hhe6rrOMd+chf8PD8LFrIrdpMlX4/eJVFuXIBvzKvqkelnTpfI8whtEZu2uPcTpe6Zfq
         9TpNi3gByyhQBIMtS509zzn8nVRh77/jWCG6K48OQpzt/Z+jcEa1AteeDpWGX/CJcRMJ
         w4Y9Ku+VKl00OrE+8yplyrNWwd9dRmLqR+P03JVRltwYK8HMbrY0leFyQm+VH3gXbKah
         6MmA==
X-Gm-Message-State: AOAM5323HMmYCEhia8qjviuUMT0It4mKKJ1bkXyCFy1/SetJNyeC2jdE
	298BegiAtuAUA/izB/hn/zG/rhoG+or7YwypFqg=
X-Google-Smtp-Source: 
 ABdhPJyQQyfuj1hi6q1+lysHYFwX5C8f7MKJnm+6tuoVevyYzCwBD5BQ0wf7m+rbPBfu6gMbGWoUKfl+gcaJQA45+4w=
X-Received: by 2002:a25:34ca:0:b0:645:716c:8cd1 with SMTP id
 b193-20020a2534ca000000b00645716c8cd1mr32666891yba.83.1651158028025; Thu, 28
 Apr 2022 08:00:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220428062647.2717638-1-raj.khem@gmail.com>
 <b2ffb05a-5792-4630-8a85-5d4d64c7aa53@www.fastmail.com>
In-Reply-To: <b2ffb05a-5792-4630-8a85-5d4d64c7aa53@www.fastmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Apr 2022 08:00:01 -0700
Message-ID: 
 <CAMKF1soLq0weUiGi+u--tgAk+ivxSCqo9Nvd5-cH5jpJeDvpJg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kmod: Enable xz support by default
To: Andrei Gherzan <andrei@gherzan.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>,
	Steve Sakoman <steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 15:00:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164968

On Thu, Apr 28, 2022 at 4:27 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>
> On Thu, 28 Apr 2022, at 07:26, Khem Raj wrote:
> > RPi kernel has started building compressed kernel modules by default
> > starting 5.15, currenrly therefore meta-raspberrypi kernels are unable
> > to load kernel modules since kmod and kmod-native do not entertain xz
> > compressed modules. There is a fix proposed in meta-raspberrypi [1]
> > but the fix is needed for native and nativesdk recipes as well, perhaps
> > its best to enable it here for best out of box experience with
> > meta-raspberrypi
> >
> > [1] https://github.com/agherzan/meta-raspberrypi/pull/1056
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> I don't see any reason not to do this and it does help with the BSPs usin=
g this compression requirement. So here is my +1. Would it be reasonable to=
 propose to have it in kirkstone too? Otherwise, @khem, I'd need to drop co=
mpression or downgrade the kernel in kirkstone rpi (or make some yocto inco=
mpatible changes - which I'd rather not).
>

Its already in staging for master [1] so hope to land it in master
soon. kirkstone is something from Steve to cherry-pick CCing Steve
here

[1] https://git.yoctoproject.org/poky-contrib/log/?h=3Dlucaceresoli/master-=
next

