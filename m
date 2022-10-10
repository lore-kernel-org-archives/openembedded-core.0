Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5291C433FE
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 21:34:05 +0000 (UTC)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web08.226.1665437639773753571
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 14:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Bjojf26+;
 spf=pass (domain: gmail.com, ip: 209.85.217.46, mailfrom: sakoman@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id 128so6012702vsz.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 14:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AStKy13b5NPpsbV5LXnLpHFAblHVJKmJGYYdUi+eb+0=;
        b=Bjojf26+u4U5CQONnRmXM0+HB0JRiTGTEZ4pnbbnOqLP0rKT2+js6obtuI9RYZR1EQ
         iiwEIVnWoaM2so5nbOUXygJg0hjsmRpDFrIP7dFcxcoRvGXsSuF8GwtDnR9KZNWCQhgg
         pzw7c3SK2kmUQky59dH3rH2z8nuhC4Xi46ILtoLo2L3XE/DUKF+C43cbmBbIukACMWdV
         YBCkGyabHC+CfUaELQDt59uELKLRKS7HewVfIrD8ffwHxleJgSIHzZL5A5Pzeb0n5XGf
         kFhew1wCZ1AtlfDGqrQIASi3TpuqgLdKU+G66cq92mefiQ4Fa+0tvdA/VEkzd8r36zRp
         JTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AStKy13b5NPpsbV5LXnLpHFAblHVJKmJGYYdUi+eb+0=;
        b=iDM4bnmls9c5DOJfzp/ET2glf+LzKI0FHm6fomioNJPq6kQafKwVtxrUr3msV3VGOd
         u+6eIwsgTdjYnJGQUb4BhjEwRJLU/J0fsbB61fu67pHMB6GiXyTuqIR9QPEl9ZHnEuGb
         F30LrUZ2uLxfjFGzlTD5S2jjUGKWh6kosGIVZ8cj/4HH7xiKSXPIIO+O3MoFdUAlC5rT
         YpjYMtSo6y7DEyLyEiYHd20wW6fPhfDDXCx7T8QdFAliAPkfSDtMUkCdHpydFzuhwNMK
         Vpl4JlRKislJUTsDOprkHRgr0k9F+JInpIpOJmFDcwsKIWKIJNk8bEnSStCuZ7XNtytq
         fl2g==
X-Gm-Message-State: ACrzQf3b5nfrBqdj5z63s+MsB0eqbaRZzIfu3QsJkKSsbldLi6eLA1MX
	/9gT1U8+nRqKWUC7OqZrt66/7ODNfRTdw4ItIzK5fz4h
X-Google-Smtp-Source: 
 AMsMyM5AhH3D8jDRVeFgXjihX27y72FjKOE0wqxuWZaTP0/fLwJU/i+6Ce37J6Ehx4bsX///A2Yn6kWy8JXLQCNJJcU=
X-Received: by 2002:a05:6102:1488:b0:3a7:739c:2b24 with SMTP id
 d8-20020a056102148800b003a7739c2b24mr4188233vsv.50.1665437638636; Mon, 10 Oct
 2022 14:33:58 -0700 (PDT)
MIME-Version: 1.0
References: <20221010195512.3932101-1-jpuhlman@mvista.com>
In-Reply-To: <20221010195512.3932101-1-jpuhlman@mvista.com>
From: Steve Sakoman <sakoman@gmail.com>
Date: Mon, 10 Oct 2022 11:33:47 -1000
Message-ID: 
 <CAGDS+nmMtoWA4kd+eVYG+j8_EjeCqUYQOJWhiY+z_XzLNiv30g@mail.gmail.com>
Subject: Re: [OE-core] [master|langdale|kirkstone][PATCH V2] qemu-native: Add
 PACKAGECONFIG option for jack
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 21:34:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171584

On Mon, Oct 10, 2022 at 9:55 AM Jeremy Puhlman <jpuhlman@mvista.com> wrote:
>
> Source: MontaVista Software, LLC
> MR: 122826
> Type: Defect Fix
> Disposition: Submitted to openembedded-core
> ChangeID: ecf4ddeb82db6fbb5c6c803e5e80c333587b9c9c
> Description:

I'd suggest you remove the above 6 lines and just keep the description below.

Thanks!

Steve

> With libjack-devel or jack-audio-connection-kit-devel, qemu-native
> detects the library/header and tries to build with it. Since its
> missing from the sysroot, it fails to build.
>
>  -O2 -fPIE -D_REENTRANT -Wno-undef -MD -MQ libcommon.fa.p/audio_jackaudio.c.o
> -MF libcommon.fa.p/audio_jackaudio.c.o.d -o libcommon.fa.p/audio_jackaudio.c.o
> -c ../qemu-6.2.0/audio/jackaudio.c
> | ../qemu-6.2.0/audio/jackaudio.c:34:10: fatal error: jack/jack.h: No such file
> or directory
> |    34 | #include <jack/jack.h>
> |       |          ^~~~~~~~~~~~~
> | compilation terminated.
>
> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 612abd240a..711982ba8d 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -198,6 +198,7 @@ PACKAGECONFIG[rdma] = "--enable-rdma,--disable-rdma"
>  PACKAGECONFIG[vde] = "--enable-vde,--disable-vde"
>  PACKAGECONFIG[slirp] = "--enable-slirp=internal,--disable-slirp"
>  PACKAGECONFIG[brlapi] = "--enable-brlapi,--disable-brlapi"
> +PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack,"
>
>  INSANE_SKIP:${PN} = "arch"
>
> --
> 2.35.4
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171583): https://lists.openembedded.org/g/openembedded-core/message/171583
> Mute This Topic: https://lists.openembedded.org/mt/94244611/3617601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sakoman@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

