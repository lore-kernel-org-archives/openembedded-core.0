Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC29FC433EF
	for <webhook@archiver.kernel.org>; Fri,  8 Jul 2022 15:23:59 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.402.1657293836302180395
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 08:23:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Z8qob2yV;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.50,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f50.google.com with SMTP id k30so19145961edk.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 08:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qne8/+PkkKxh6APR9f1awSDH31jaHAFLyF04Bj8Ghuc=;
        b=Z8qob2yVKTuUwHcDkvuMv96sUpACVFe9mqMC7xf1shGg965zsQb1v7RwXGT7/5SXEI
         u5X4wggBaMG3t+qJoE2cHWlVFYOSxkS77fXM5HXd+MeLYOeGHlYJIIpABgg0CMRxvZUH
         HfyMAjEyUehixC/Blh0ccsa3EA2Xo/DHTWQFjB2zZOD/1VxOVVifI973xWOnDCuy16oT
         ygcngTIaWUacxIm2algnkiImHicE898yY6XU1RSCNC9yB/BHy1gXGR60vqq2nS2vxiIA
         psdHR2yM2CbHLlHoRd/I0rmGO+Oe3iOf6Y9AC7JyrH0y03RS2ueAawcoGCvdIswgOIFD
         gKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qne8/+PkkKxh6APR9f1awSDH31jaHAFLyF04Bj8Ghuc=;
        b=PuXqixkvx0noYvGqxdTG11F19AsFwzyLeCim/qRwURM6mLJ+LHdjKxRpw+OLN0ja+g
         ywUaKyh//+sbSKHemzhIWQjqQaQS9RliO7UDhyINAAgD4A200P1DS8Vjk8sCDz6sB1C6
         PdPDq2sfzGizx0yPc64H4FzVSK5YkSfCBGuSwL+d4shOcg4IeI2bA06ggS+gQQrTJWqy
         bdiWbYrFkFJ+NoFKV7JFQw3kKSKzRKXffdv6rLiq+Yf7mWM+Y9DW4Jcchtx75q2Kgw+F
         TFDysrBEyI4tbrlwFNwBKhZtJydWbBNCiofoCtyLTFnlrc+cE8IlGBxCpxrs02BVJXTh
         KGPA==
X-Gm-Message-State: AJIora9hJiylS8ly8NeigvC0GiuMOpU5/RBd6OeZbT53nhnJNojZg3Rk
	CxJPAxGjCHpN8zu5nZJ3yU8/FxRevjwMgCB44BjSMA==
X-Google-Smtp-Source: 
 AGRyM1sAJ5ykToi4NmVBdRtCt67Ti8D/u+PBohWfGAfIIZbHjmCXDsOPNX5OBLgxBjQz93dEw2o8is2pv4yeDvnV4P8=
X-Received: by 2002:a05:6402:5508:b0:43a:896e:8edd with SMTP id
 fi8-20020a056402550800b0043a896e8eddmr5436339edb.203.1657293834579; Fri, 08
 Jul 2022 08:23:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657231055.git.steve@sakoman.com>
 <16FFAB0682951267.1041@lists.openembedded.org>
In-Reply-To: <16FFAB0682951267.1041@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 8 Jul 2022 05:23:42 -1000
Message-ID: 
 <CAOSpxdamkz3R2BMKwyNOnZAfcYVAyLONphRaF8ADy5qopwvpPw@mail.gmail.com>
Subject: Re: [OE-core][dunfell 14/14] qemu: add PACKAGECONFIG for capstone
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Jul 2022 15:23:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167826

On Thu, Jul 7, 2022 at 12:00 PM Steve Sakoman via
lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
wrote:
>
> Autobuilder workers were non-deterministically enabling capstone.
>
> Add PACKAGECONFIG for capstone with default off.
>
> Qemu versions in master and kirkstone have removed the capstone
> submodule and configure options so this patch is not appropriate
> for these branches.

Actually I'm seeing a similar issue on kirkstone now :-(

I'm testing a similar patch for master/kirkstone and will send it to
the list afterwards.

Steve

> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 25c2cdef3a..4135619fc6 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -254,6 +254,7 @@ PACKAGECONFIG[xkbcommon] = "--enable-xkbcommon,--disable-xkbcommon,libxkbcommon"
>  PACKAGECONFIG[libudev] = "--enable-libudev,--disable-libudev,eudev"
>  PACKAGECONFIG[libxml2] = "--enable-libxml2,--disable-libxml2,libxml2"
>  PACKAGECONFIG[seccomp] = "--enable-seccomp,--disable-seccomp,libseccomp"
> +PACKAGECONFIG[capstone] = "--enable-capstone,--disable-capstone"
>
>  INSANE_SKIP_${PN} = "arch"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167812): https://lists.openembedded.org/g/openembedded-core/message/167812
> Mute This Topic: https://lists.openembedded.org/mt/92239648/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

