Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B962C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 20:47:28 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.13701.1641934046956680889
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 12:47:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=PxxzCeqW;
 spf=pass (domain: burtonini.com, ip: 209.85.128.52,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f52.google.com with SMTP id
 d18-20020a05600c251200b0034974323cfaso2192399wma.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 12:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0Xp141HPdVBVOnj3teTBqq4L3DkH3FDyUjDFxsN1dlE=;
        b=PxxzCeqW9Wz+k77zWk6H25Ij318QHFD+YnCGaItAU3AT3HxkR8xe14ATrj9jqM71eq
         WteCxQpcrHaE1Pv9aKXakUb5zXUssIkc5ydGcMWpnvoskIJIpf5isqVgDuHGN6kA+wr4
         JuCnLdaCExtlVtkmLLq+6FeuC+Ww8u0WewNjMTibtq3kbvctfxVcEW1zOc41rgVF/Hwc
         b9JtlPlL+OOAZFvyvEYL9vau6Qguyc3enjWzrrJmVgV6w90IqLPQbzL+ycoke6LFW1GS
         KiVWMq9raO0qR5LU6NpWA9e/6Coopp9LVnRCmkNDEJqvorM0P+vcDdLLtgOB8CDcZ/Ia
         V5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0Xp141HPdVBVOnj3teTBqq4L3DkH3FDyUjDFxsN1dlE=;
        b=vMbqGhElBkAHjQb7+OM3PH/cRwxUxfbB70j7V9dK334QAV4qSP2ys+h1Z9Y2Z88ljY
         RexfL/iKdZix5NQkksSGOXtuOKeH2dj68YhngtNgmbQ5rwNj12HDT+cGHgENh1QbSl7c
         UG9gYAyXjk+0wKp7cNgh1lwEJleTCeglwsZz7cKE/NrU8K0K8sKMc6jo7it1lshAlNX0
         zxtZ04Szs4Yce9q75AL604h2V25XEdNHCTPSJNpKgxIjOlaEwHiSLOlI/A4sN1nJx8xx
         8rgJwA4NNLJLbgxhb9FM4N4fX/uemcdAi/xtfdmazAsPFelRLtDz42jvbOooD2tZXqEh
         qlXw==
X-Gm-Message-State: AOAM533stR7LLBBaI84yCOsGyQN/f7KjOXYFES46FPwVXyleU68uWxJT
	gnmHeUxZ6NcKUNQyjRiELczCwye8nc3Ctf8K9nfstw==
X-Google-Smtp-Source: 
 ABdhPJy/Vd0z2PtTQs7/cHrxi7QeeJKhHFOZc5OEMqQCSSDvADxEEfEyEcvJSTZP2NHYqvo9LZWdZqf6fBKwHQSy3hU=
X-Received: by 2002:a05:600c:3514:: with SMTP id
 h20mr3948713wmq.62.1641934045299;
 Tue, 11 Jan 2022 12:47:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1641923693.git.bruce.ashfield@gmail.com>
In-Reply-To: <cover.1641923693.git.bruce.ashfield@gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 11 Jan 2022 20:47:14 +0000
Message-ID: 
 <CAAnfSTu7b_zxHe4wfbrvxMguM_nqm7MdEZLgjfDDRp6RX=dmAw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/10] kernel: consolidated pull request
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 20:47:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160463

Does this include the defconfig patches I sent earlier today, or will
those need to wait for the next update?

Ross

On Tue, 11 Jan 2022 at 18:00, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Richard,
>
> Here's my next consolidated pull request. The -stable updates are
> routine, but I've included the default version bumps and dropping
> of 5.14 in this series.
>
> My AB run showed some ping/ssh failures on sato, but I haven't
> reproduced them locally. So I wanted to send the series to see if
> the issue is real or not.
>
> There are updates to 5.14 for configuration in here, followed by
> removal, but I wanted to make sure the SRCREVs for that version
> are fully up to date before the drop, so we can use it as a reference
> for older releases and any remaining users.
>
> We've already sorted out 5.16 in master, so I'll be moving -dev
> to 5.17 in the next couple of weeks, and we'll be ready for whichever
> kernel version fits the release timeframe.
>
> I'll send updates to poky/yocto-bsps separately.
>
> Cheers,
>
> Bruce
>
>
> The following changes since commit bd28d659b2ef6e887e4d9ff44fa7377fa802f28d:
>
>   systemd-boot: restore reproducibility (2022-01-11 10:53:44 +0000)
>
> are available in the Git repository at:
>
>   git://git.yoctoproject.org/poky-contrib zedd/kernel
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (10):
>   linux-yocto/5.10: update to v5.10.89
>   linux-yocto/5.15: update to v5.15.12
>   linux-yocto/5.14: fix arm 32bit -rt warnings
>   linux-yocto/5.15: fix arm 32bit -rt warnings
>   linux-yocto/5.10/cfg: add kcov feature fragment
>   linux-yocto/5.15/cfg: add kcov feature fragment
>   linux-yocto/5.15: update to v5.15.13
>   linux-yocto/5.10: update to v5.10.90
>   linux-yocto: drop 5.14 recipes
>   conf/machine: bump qemu preferred versions to 5.15
>
>  meta/conf/machine/include/x86/x86-base.inc    |  2 +-
>  meta/conf/machine/qemuarmv5.conf              |  2 +-
>  .../linux/linux-yocto-rt_5.10.bb              |  6 +-
>  .../linux/linux-yocto-rt_5.14.bb              | 45 ------------
>  .../linux/linux-yocto-rt_5.15.bb              |  6 +-
>  .../linux/linux-yocto-tiny_5.10.bb            |  8 +--
>  .../linux/linux-yocto-tiny_5.14.bb            | 32 ---------
>  .../linux/linux-yocto-tiny_5.15.bb            |  8 +--
>  meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++----
>  meta/recipes-kernel/linux/linux-yocto_5.14.bb | 68 -------------------
>  meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++----
>  11 files changed, 41 insertions(+), 186 deletions(-)
>  delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
>  delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
>  delete mode 100644 meta/recipes-kernel/linux/linux-yocto_5.14.bb
>
> --
> 2.19.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160424): https://lists.openembedded.org/g/openembedded-core/message/160424
> Mute This Topic: https://lists.openembedded.org/mt/88354888/1676615
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

