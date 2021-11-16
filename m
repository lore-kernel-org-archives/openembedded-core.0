Return-Path: <daniel@qtec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C16C433F5
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 18:47:46 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web12.256.1637088464421472757
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 10:47:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=cdYYMGch;
 spf=pass (domain: qtec.com, ip: 209.85.167.52, mailfrom: daniel@qtec.com)
Received: by mail-lf1-f52.google.com with SMTP id f18so25173lfv.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 10:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fGGJ8CnwsytIHYaWpSVg//9zJwQjUosejLuTCCbLBKM=;
        b=cdYYMGchOCRL+YUiznSpi+gmuSb2J+0pWmSLtMp2mqP6e786gZ48VLS4tP99acNYwK
         nHIN8St6ht5ogCvQNbgpm0mUngdKrBSz0hvxSAz4yUv3wKdObeRbgazcQiCdYWUZTnZo
         QY7NCNWO1I5DRi9H1o1Sw6jaBspsKS5tOhTf24WSg0sRjHwm3Jr7Bs2sLKhXdxTC7wu2
         bH6hFGg6YkP5+Td3Z2FLywRXTrvpLkG74HuRBEkFhOtrV9U8ekIHvXy7Q2PMRW3fRzUx
         3t98YeTNJfqicencTZVO8IPw8+ihP/f0+sWIU9bXT+kARO0jjaOZsFG+UwOyRxa6DOjo
         g8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fGGJ8CnwsytIHYaWpSVg//9zJwQjUosejLuTCCbLBKM=;
        b=D5qYoNGBTjhf/wHmaL3qOZAepjXOXBmQNsIAkEl35ieR6nXLP/6JjIE8MD5sF2JIcD
         3Ln3n0SCWBT8W774zgGgxAwJjNu11Phh+euc8dacfKS6TyQlVxliB6lvi/5uHCBARMAS
         Ia2nsSKUNhkdiVsV9qQ879MJxT66rllDgwaDfnNu6WhmAkvTvKeIXNWiUVKbWfU83Pe4
         L5w+2A296ScOo5/vAiBpHao5Bb1R/DuqsdvDeUaYZTnfFQl/0sYhM6Qa6oCrAIQ5lNvI
         0EPxQe1LcpDaPgxLcx5lrbluT8EtAAaDlUkgJVwUO49YHIKgaVjCpcw8xJk3ezgmKe8J
         etng==
X-Gm-Message-State: AOAM531pFXmhu47Tdf/zxbXcGMKW15wjHjQxs7PsUsBDctoeTC81F+da
	v2tpecUu89OfZG1B0mRgbaCQ3W6fDHUgG3yYI4CBRg==
X-Google-Smtp-Source: 
 ABdhPJwZPeFjtSkFy5Bxm4s+ZyYgPHKGyxjFihyZJJLnMataVNHy/jCtIu6ezCe9CzCzXG9u2ucBFaoe+qEiUh/qbiU=
X-Received: by 2002:a19:c3d5:: with SMTP id
 t204mr8746769lff.303.1637088462049;
 Tue, 16 Nov 2021 10:47:42 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAH1Ww+SPR6j1_SV-=Ev+XOgHsUismWxGXHPx6_RHwP-W3AJ9Bw@mail.gmail.com>
 <8CE95620-93AA-4B0C-B20E-3A5E3ECC0E06@gmail.com>
In-Reply-To: <8CE95620-93AA-4B0C-B20E-3A5E3ECC0E06@gmail.com>
From: Daniel Gomez <daniel@qtec.com>
Date: Tue, 16 Nov 2021 19:47:30 +0100
Message-ID: 
 <CAH1Ww+R6_C3Cq755HhOdPAM72SBxUdxJjm7PTd=CsWSxOoPaVg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] android-tools: Add flag to enable adbd service
 (#147)
To: Devendra Tewari <devendra.tewari@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 18:47:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158371

On Tue, 16 Nov 2021 at 19:17, Devendra Tewari <devendra.tewari@gmail.com> w=
rote:
>
> Hi Daniel,
>
> Em 16 de nov. de 2021, =C3=A0(s) 11:49, Daniel Gomez <daniel@qtec.com> es=
creveu:
>
> =EF=BB=BFHi Devendra and Khem,
>
> I'd like to ask about the 'recent' commit you integrated in the
> android-tools recipe a few months ago:
> http://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-devt=
ools/android-tools/android-tools_5.1.1.r37.bb?id=3D4271cc28279b79140fc6bbde=
32c9110aec8d1d86
>
> Basically, you are adding a postprocess rootfs command to the $PN-adbd
> package to include the '/var/usb-debugging-enabled' file in your
> rootfs image or not using the 'ROOTFS_POSTPROCESS_COMMAND_${PN}-adbd
> +=3D' line.
> I wonder if this is a new feature or perhaps an error, as I'm trying
> to implement it in dunfell and it does not work as expected. Should
> this work also in dunfell? Are the rootfs postprocess commands
>
> executed inside the recipe?
>
>
> I verified it at the time (on master pre hardknott) with rpi-sdimg image =
type (from meta-raspberrypi) set in IMAGE_FSTYPES. Later, I tried to get it=
 to work with wic / bmap image fs type but haven=E2=80=99t been able to.
Thanks for the confirmation. I'm using wic+dunfell and it didn't work.
I'll try to replicate it with the honister release to see if it works
there.
>
> Well, what I'm trying to do is to include a configuration file for the
> dropbear recipe based on the IMAGE_BASENAME so I can include different
> files depending on the image at recipe level. It works fine if I move
> everything to the image recipe:
>
> meta-qtec-distro/recipes-core/dropbear $ cat dropbear_%.bbappend
> dropbear () {
>    touch ${IMAGE_ROOTFS}${sysconfdir}/file1
> }
>
> dropbear2 () {
>    touch ${IMAGE_ROOTFS}${sysconfdir}/file2
> }
>
> PACKAGES =3D+ "${PN}-conf"
>
> ROOTFS_POSTPROCESS_COMMAND_${PN}-conf +=3D
> "${@bb.utils.contains("IMAGE_BASENAME", "poky-qtec-image-netboot",
> "dropbear;", "dropbear2;", d)}"
>
> Any ideas?
>
>
> Official documentation is not clear where all  ROOTFS_POSTPROCESS_COMMAND=
 can be used, but using it in image recipes works reliably for me.
Thanks again. I'll do some more testing then.
>
> Thanks in advance!
>
> Daniel
>
>
> Regards,
> Devendra

