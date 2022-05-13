Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 958B4C433F5
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 02:16:06 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web08.3617.1652408159914934254
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 May 2022 19:16:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=vetjuTWM;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.182,
 mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-2fb965b34easo76572407b3.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 12 May 2022 19:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sFmXQrIxe2ddVHTtsLZ5B9Mndvy4HI1hqsmxXQz6XhA=;
        b=vetjuTWMI+zKlP+S59AM5K7HYM13HBPWerzpgLFgcSgW3B7lHyYdpKP9sy7IoV4W9L
         xLZMQChPosL1wSQ86owkzC3WLD67jP+UAg8FQ5DiviMASJouuhUyul6H0wGS6kKWd5nX
         2mvLpFpS4SaQcwI3uUQzD7UGT3Rw2hfDLbK2ESUqd9rLdcJlsBsKKdw+O0zqHCN3MqKg
         jy7jvXMw6bwYHjO/KawFXnhTU1+Wfb5q35bVv8FW7G4BzCNXl/i/Pype2Kp8CjdBeAud
         WIlQeoatET3wuQbM76U/+Ihuv0d8KdG1IHIVsRSH8MCtjp0GikkadG/IqVPNbdGmgjnn
         dk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sFmXQrIxe2ddVHTtsLZ5B9Mndvy4HI1hqsmxXQz6XhA=;
        b=xHieg9Nx51yGgkW8vh1v5jClijOYsyuvJPhuci6rOWTL/ICPwkNO6wWuAv178812o4
         GiCfV0++oKf2ymZLJqBRri7IX/3iswasejU6Fl6W43MMY+qXCj0eV3ecD9S2xgtTD9kn
         kSBGRtEoZ43fMXiGEuW8KEAG02VL4Z02gSgVULomVnnp+Nh5Cr1Wv/dTRNMrrAIX/qv9
         HswyZPh6EGxM/6YDaA/PnVxz9Q7M/O3NoxZ+A51V6PJyF4YnOlg+Rkyq/K433+dN7OSd
         333IjGXgMq0pgR74D49JgkN9RPoPqOfvIZz8aT8kGIgs65Gb3Hdk4rXEj09NS8OILX6V
         fxSg==
X-Gm-Message-State: AOAM532ihxGplrCHwEWok0tQC0PBzGgHY1LiFASySjAr9oZ/57WLReoT
	r0uZ6q6CEAex7k3JXK8ELGrJJbeHDnStWYE9yk6Yvg==
X-Google-Smtp-Source: 
 ABdhPJyyVus46Bz6MgS8MoxKGJHiDvnoAGd6TAMDP4tJICdzYjAEFpZGk/NrSZ46gYPBFEqhB/qP8UICoLV67wJJTLw=
X-Received: by 2002:a0d:ea09:0:b0:2f7:d71e:d561 with SMTP id
 t9-20020a0dea09000000b002f7d71ed561mr3191031ywe.318.1652408159058; Thu, 12
 May 2022 19:15:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220504140956.4373-1-jdmason@kudzu.us>
 <CADkTA4M8bqvWeo7ghPF_rJjVOFGHxdvpkqtveAntW055p490vw@mail.gmail.com>
In-Reply-To: 
 <CADkTA4M8bqvWeo7ghPF_rJjVOFGHxdvpkqtveAntW055p490vw@mail.gmail.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Thu, 12 May 2022 22:15:48 -0400
Message-ID: 
 <CAPoiz9w-MAekBhBiDE_0Pm7bv9DxNhKXHZh5rYD3mjLYw-RDzA@mail.gmail.com>
Subject: Re: [PATCH] qemuarmv5: use arm-versatile-926ejs KMACHINE
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 02:16:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165543

I think this needs to get pulled back to kirkstone, as I'm now seeing
ERROR: linux-yocto-5.15.36+gitAUTOINC+fcf48627ea_ebfb1822e9-r0
do_kernel_metadata: Could not locate BSP definition for
qemuarm/standard and no defconfig was provided

On Wed, May 4, 2022 at 10:24 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Wed, May 4, 2022 at 10:09 AM Jon Mason <jdmason@kudzu.us> wrote:
> >
> > Use the Arm Versatile 926 kernel configs to get this machine working
> > again.
> >
>
> Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> > Signed-off-by: Jon Mason <jdmason@kudzu.us>
> > ---
> >  meta/conf/machine/qemuarmv5.conf | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
> > index 2dad504c9932..abdae5f36182 100644
> > --- a/meta/conf/machine/qemuarmv5.conf
> > +++ b/meta/conf/machine/qemuarmv5.conf
> > @@ -15,7 +15,7 @@ QB_MACHINE = "-machine versatilepb"
> >  QB_KERNEL_CMDLINE_APPEND = "vmalloc=256"
> >  QB_GRAPHICS = "-device virtio-gpu-pci"
> >  QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
> > -PREFERRED_VERSION_linux-yocto ??= "5.15%"
> >  QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
> >
> > -KMACHINE:qemuarmv5 = "qemuarm"
> > +PREFERRED_VERSION_linux-yocto ??= "5.15%"
> > +KMACHINE:qemuarmv5 = "arm-versatile-926ejs"
> > --
> > 2.30.2
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

