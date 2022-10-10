Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D856C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 19:40:17 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com
 [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web10.2265.1665430810575754683
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 12:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bxWiI8Og;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id
 h1-20020a4aa741000000b004756c611188so8646490oom.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 12:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W0hav7LjMjYeQin0Fm1hNnv1JGoq8ykfLxPjVhIWSpc=;
        b=bxWiI8OgUit/cR4yt2nEL+OSuj7k0NUkI910nEEZZFoPk/oiXQYsnIPCfrHLaYlX+O
         QBB5Ju7RP02KBXuqBoTE8I0bfva8k5ViCh+Rw3zHg4FOgRpBC5+Tt17DS+uGereIWurM
         GF6vROE5YOCTYsyUwNNwmuUAtgiWRwePtv0B+1W2fV8Lzv/SeP8esvHwi/Re+7H6W5io
         +ndDgBDlYneYsiuA/WCkxvMK2iav6/oxfZr6dV11+urkX6aNmaj6LgW7m1PMMf6fE0UL
         e48p7PrckZk/ByEPVWOUEZ81zVSclCpwEOlVzxzMiAKXdb7DjGzghDRn6EeEi0LQUx+l
         HtbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W0hav7LjMjYeQin0Fm1hNnv1JGoq8ykfLxPjVhIWSpc=;
        b=Sx3t6rGWwMSQhSIXnXct3zYA1J17ju8Jg8jK+NruIq2KvxAqxoIFEsOL3CAAhZud/r
         BSuFPkj6r46jDrDmLRH+B7HB08nCDhZ4Bv0UwLYgaGF6i/f4ls9Qc+iJQ9xzIESjZad8
         y7acYD6BP1Vf/JUgGNS+umsfiensQE2+7drE7l1sxVShfjEk85B3JcsMoK4DgZzrL4j0
         4OHXHe/5mSOalGl04/N4HyLGf6RvXEPMExraMj9+j0oivil/yQraf4JO8plKNSxPx2i0
         xQCIFeSaIcAGuuTl4tpxMfoQFTVCVPjYChIYEfF6WkGkTRP2O+DpMufNsd127sEUoO4g
         gl5g==
X-Gm-Message-State: ACrzQf35D9E95AXTbl9N9JHtvCqkACcbySt2opmCOdcC0aS054sK8ZL5
	fUD1199pXFeZYtWcxZ+A9Et7+8lj4dzoHVnYbsw=
X-Google-Smtp-Source: 
 AMsMyM6Q1XVqIt99OMuXyEi0r2x2rTVAfeZ4GRUp1uTNTGPJZ9T6WYwH6urHXnYFF5rz4qpIrum/nWQI4uV2+ABMY1M=
X-Received: by 2002:a9d:6b85:0:b0:660:bb8c:3ab9 with SMTP id
 b5-20020a9d6b85000000b00660bb8c3ab9mr8629617otq.55.1665430809637; Mon, 10 Oct
 2022 12:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <20221010192655.3930156-1-jpuhlman@mvista.com>
In-Reply-To: <20221010192655.3930156-1-jpuhlman@mvista.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Oct 2022 12:39:43 -0700
Message-ID: 
 <CAMKF1sqgAyRiZiYd2Y+fbQrArgLVZnT8HGx3J0sddOE=O7TamA@mail.gmail.com>
Subject: Re: [OE-core] [master|langdale|kirkstone][PATCH] qemu-native: Add
 PACKAGECONFIG option for jack
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 19:40:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171581

On Mon, Oct 10, 2022 at 12:27 PM Jeremy Puhlman <jpuhlman@mvista.com> wrote:
>
> Source: MontaVista Software, LLC
> MR: 122826
> Type: Defect Fix
> Disposition:  Needs submitting to poky

Above seems out of context, since you are submitting it upstream here.

> ChangeID: ecf4ddeb82db6fbb5c6c803e5e80c333587b9c9c
> Description:
>
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
> View/Reply Online (#171580): https://lists.openembedded.org/g/openembedded-core/message/171580
> Mute This Topic: https://lists.openembedded.org/mt/94244017/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

