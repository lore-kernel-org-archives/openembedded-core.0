Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3364C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 23:03:56 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web08.4122.1648076635616333674
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 16:03:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WxT15wYM;
 spf=pass (domain: gmail.com, ip: 209.85.222.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id 85so2314405qkm.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 16:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GQlxQ+eVtLTDnmMpI9VpzgOcqs0RlEr3xNxVTGMoGS8=;
        b=WxT15wYM6dqY1z0fb5uvEVxhuZ6OMTEWG21h8ZGG+jTRwEIbOiTmAzhIKjw82tAU98
         FZjYPTPGBzkRiQpQnsY+nprwRcR3utIs2CJoQl+Vt0ZkCB10AaMG7pqXAFqDK4YMz/qQ
         w27XxLKyLDY8BDpL+Ag7l4MxQYf8gSQPuO+Ja4zA0+YkFDCk8iHrLm9M3O8lYySzriRJ
         zClzjdKw5IHxDKylrYODMx8Ck4KsNmkx8hkWLI+RnAXF9yfn+3yRcQV1oDN73sairUt1
         UscNzpHB1pkYz/ICYr/UxDlAgk5OIm13k6NYPE/0aXO7lMndM1gDhpKDLpfiU8jlVYNY
         gj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GQlxQ+eVtLTDnmMpI9VpzgOcqs0RlEr3xNxVTGMoGS8=;
        b=0XRYJrIKEh3ZVfhEpVzg8D2ZVYqNHXxsCreOsdENFNXanXDFUi5OrNxvEhScOxYSUT
         faDa/GBFcWmiX1LHwweD/cTcbQ/IlTgbeMtvsBrBaiDfEUNApCa0C25C/M8qsEMKLgUX
         eoWNqt/bMDsr65tQIerv12o+dpOzDUMI1ecVCDeVDghPwGvbDgG8UqrH2rEd6Cnl1Q3e
         uUTKyHu5TZlUkggD8oe1ry1txRmtcOcs9Xx7U9ynUcF9FYIa52oemdKQKW0lSeUhxkz4
         B3O5JWJcfh6U7lJVFo+dakorJt8GpMpgVXfzHmmpmt/EN9JH4woJiI4bXta0z42v7THO
         /sDw==
X-Gm-Message-State: AOAM5334YCTZoFU1ZWpT3O1Fq260bwegjCVW4UKFP7gH4sQ3Wmiu/mc2
	WyDYLhHPkV29WQk3fOCbY2ne9dA5G0E7zkzeMEy+CPPo238=
X-Google-Smtp-Source: 
 ABdhPJwaRjh7Fw6lYB7orXojJOHee0V4ruo14OIlhLrLp1ywNTr5cEStrTti33PgiwUz/J3zqvdTft1Hp9a5Y+aczSM=
X-Received: by 2002:a05:620a:29ce:b0:67e:d7be:3491 with SMTP id
 s14-20020a05620a29ce00b0067ed7be3491mr1539728qkp.463.1648076634418; Wed, 23
 Mar 2022 16:03:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220323164228.1412729-1-raj.khem@gmail.com>
 <YjullZwSDaEI8yeN@piout.net>
In-Reply-To: <YjullZwSDaEI8yeN@piout.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Mar 2022 16:03:28 -0700
Message-ID: 
 <CAMKF1srbDpMUo35CZUc-m15zrJLwoJwQ2oueOU3vVL55f+STcA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] qemu: Depend on virtual/egl
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Mar 2022 23:03:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163597

Likely, I think the dependency should be epoxy instead of virtual/egl
Can you try it out on the builder quickly.

On Wed, Mar 23, 2022 at 3:56 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hi Khem,
>
> I sent that to the autobuilders and I think this is the cause of these:
>
> https://autobuilder.yoctoproject.org/typhoon/#builders/120/builds/954/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#builders/75/builds/4930/steps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#builders/15/builds/5220/steps/11/logs/stdio
>
> On 23/03/2022 09:42:28-0700, Khem Raj wrote:
> > - This abstracts on GL/GLES implementations
> > - Rename packageconfig to epoxy to match what code it doing underneath
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: Rename packageconfig to epoxy as it matches code
> >
> >  meta/recipes-devtools/qemu/qemu.inc      | 6 +++---
> >  meta/recipes-devtools/qemu/qemu_6.2.0.bb | 4 ++--
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> > index 78aea71cc05..a0d65a9354e 100644
> > --- a/meta/recipes-devtools/qemu/qemu.inc
> > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > @@ -142,8 +142,8 @@ do_install:append() {
> >  # END of qemu-mips workaround
> >
> >  # Disable kvm/virgl/mesa on targets that do not support it
> > -PACKAGECONFIG:remove:darwin = "kvm virglrenderer glx gtk+"
> > -PACKAGECONFIG:remove:mingw32 = "kvm virglrenderer glx gtk+"
> > +PACKAGECONFIG:remove:darwin = "kvm virglrenderer epoxy gtk+"
> > +PACKAGECONFIG:remove:mingw32 = "kvm virglrenderer epoxy gtk+"
> >
> >  PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,libsdl2"
> >  PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr --enable-cap-ng,--disable-virtfs,libcap-ng attr,"
> > @@ -165,7 +165,7 @@ PACKAGECONFIG[nettle] = "--enable-nettle,--disable-nettle,nettle"
> >  PACKAGECONFIG[libusb] = "--enable-libusb,--disable-libusb,libusb1"
> >  PACKAGECONFIG[fdt] = "--enable-fdt,--disable-fdt,dtc"
> >  PACKAGECONFIG[alsa] = "--audio-drv-list=default,,alsa-lib"
> > -PACKAGECONFIG[glx] = "--enable-opengl,--disable-opengl,virtual/libgl"
> > +PACKAGECONFIG[epoxy] = "--enable-opengl,--disable-opengl,virtual/egl"
> >  PACKAGECONFIG[lzo] = "--enable-lzo,--disable-lzo,lzo"
> >  PACKAGECONFIG[numa] = "--enable-numa,--disable-numa,numactl"
> >  PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls"
> > diff --git a/meta/recipes-devtools/qemu/qemu_6.2.0.bb b/meta/recipes-devtools/qemu/qemu_6.2.0.bb
> > index c7eef0a9d5e..92857adf9c3 100644
> > --- a/meta/recipes-devtools/qemu/qemu_6.2.0.bb
> > +++ b/meta/recipes-devtools/qemu/qemu_6.2.0.bb
> > @@ -17,9 +17,9 @@ EXTRA_OECONF:append:class-nativesdk = " --target-list=${@get_qemu_target_list(d)
> >  PACKAGECONFIG ??= " \
> >      fdt sdl kvm pie \
> >      ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
> > -    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '', d)} \
> > +    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer epoxy', '', d)} \
> >      ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)} \
> >  "
> >  PACKAGECONFIG:class-nativesdk ??= "fdt sdl kvm pie \
> > -    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '', d)} \
> > +    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer epoxy', '', d)} \
> >  "
> > --
> > 2.35.1
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#163590): https://lists.openembedded.org/g/openembedded-core/message/163590
> > Mute This Topic: https://lists.openembedded.org/mt/89980121/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

