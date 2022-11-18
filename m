Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC1BC4332F
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 14:51:01 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.13675.1668783051747579398
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 06:50:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=7nnjXaSy;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.41, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f41.google.com with SMTP id s12so7468696edd.5
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 06:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OcRO+hHCSbUss8HKAdDV0R0GqFoqMubue3rYKCppQXY=;
        b=7nnjXaSyEHCS/HclPE2YgcRHqs4d8JTVEaVOJxRAgHyYUKR2d+zREnVVcJjuAHJR5H
         vE1IVtDmCc2pToEupe+AYdNWwy4foexjXOKpOxJG4TyYuOp58OOPm0TbjZu77UnArffp
         pNOHhhZWo4VnjawVPESg3BsZEWQmDSltT+3yj46+Rzt21hBGcuQfAYRl4VCzkHK5xQ/b
         zavqujzjLupzCpbf/q1JEoSSN7ALM30LHKfl6il5eJg4i6JmQmkuZLqT1ZOimtCDmP1X
         DeN1Hkg9WJjXidvxaZsuaC0BOpFuy5zytxlx+pbTMc9JCVKgr7DeZGjz4I1w1YamVa/P
         Ic1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OcRO+hHCSbUss8HKAdDV0R0GqFoqMubue3rYKCppQXY=;
        b=3rhWF6bNvV8Gi5T9OjtyXBFHLbd1bNR2uKnwabVykWMvKTSgklEHzxoaVfF1mG1dft
         +vi5CVG2kpP/JglEB1qnIOeKDXD/42d2zr/NxBPDzo/PtjsC+0vvwFFte3FcZeXC+M0l
         xZPHY/OwdqHXfAGM3DBBfpdkhlbFwDJ8QgXdAuVxlOIwhPZ8wJ21QWAdrQhkF7p4aIac
         93yU3TMxhnisGHZALTlYFVTKImL2ANlqKj5XDNO4tzVjXvrkF6SdtkSo9RLuSGlcX+FR
         CF1xcaSxjZ2v2ZVrALsqSz7R60ysJlwkHOUrhGaRGIbympI5xJqxYz3fK/g2n+H5Cuj3
         +2bQ==
X-Gm-Message-State: ANoB5pm1Dyjjy8/OiRxkTmGrEJ8c6t67hrqUcrRBbAsEsTzExF4cv1X2
	31LI9DD33aIZxd4Z1pvRLHDHuXm+u/hBDd9LHR09Qw==
X-Google-Smtp-Source: AA0mqf5UgDx20mLY7MKFJwPUEX+R5lyamCBsFLOXh4FCbVYNK8mJ5lrZh4+yy+U7eFCeox2n05rCBQEFyyGdnfFd+50=
X-Received: by 2002:a05:6402:388e:b0:468:fb0d:2d8b with SMTP id
 fd14-20020a056402388e00b00468fb0d2d8bmr4592805edb.124.1668783049699; Fri, 18
 Nov 2022 06:50:49 -0800 (PST)
MIME-Version: 1.0
References: <20221118124017.5382-1-asharma@mvista.com>
In-Reply-To: <20221118124017.5382-1-asharma@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 18 Nov 2022 04:50:38 -1000
Message-ID: <CAOSpxdaivS1vyt1NX7VqF8NrJ3B9t5_iLjUp1EUfPWspLdCVOA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH V2] local.conf.sample: correct the
 location of public hashserv
To: Ashish Sharma <asharma@mvista.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex.kanavin@gmail.com>, Alexander Kanavin <alex@linutronix.de>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"Jeremy A . Puhlman" <jpuhlman@mvista.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 14:51:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173464

This commit is already in kirkstone:

https://git.yoctoproject.org/poky/commit/?h=kirkstone&id=24a3f7b3648185e33133f5d96b184a6cb6524f3d

Steve

On Fri, Nov 18, 2022 at 2:40 AM Ashish Sharma <asharma@mvista.com> wrote:
>
> From: Alexander Kanavin <alex.kanavin@gmail.com>
>
> Source: poky
> MR: 121051
> Type: Integration
> Disposition: Merged from poky
> ChangeID: 24a3f7b3648185e33133f5d96b184a6cb6524f3d
> Description:
>
> (From meta-yocto rev: b5cf7a6501d954ac76b18d7ef91376b5a046a522)
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit d1840499ff5b9551b3178cd2777ec9fe8666c96b)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> ---
>  meta-poky/conf/local.conf.sample | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-poky/conf/local.conf.sample b/meta-poky/conf/local.conf.sample
> index ae9c87f4b2..ef491d43bf 100644
> --- a/meta-poky/conf/local.conf.sample
> +++ b/meta-poky/conf/local.conf.sample
> @@ -229,7 +229,7 @@ BB_DISKMON_DIRS ??= "\
>  # which will depend on your network.
>  # Note: For this to work you also need hash-equivalence passthrough to the matching server
>  #
> -#BB_HASHSERVE_UPSTREAM = "typhoon.yocto.io:8687"
> +#BB_HASHSERVE_UPSTREAM = "hashserv.yocto.io:8687"
>  #SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
>
>  #
> --
> 2.17.1
>

