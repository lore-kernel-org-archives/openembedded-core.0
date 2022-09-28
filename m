Return-Path: <liambeguin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 040FBC07E9D
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 02:47:06 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.3502.1664333216733183151
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 19:46:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=elXHGVS9;
 spf=pass (domain: gmail.com, ip: 209.85.222.173,
 mailfrom: liambeguin@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id i3so7187095qkl.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 19:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=VPdV86aFCeaIztpHxWd6vZnOBYL8VBeklYsqm9GvmGY=;
        b=elXHGVS95RGqo5HUYYHtESjNSpeMmFajlHFUXtUCKAe6gMBdPQulU0/SodjOZmvtod
         fM27gIOkUGMY6zrtMnIY73pKE6J4TMnG8mQeKtTmV8anDhZP3mLCsrsm0Zaln4qUyyLU
         cUE4TbSmPYJRn7IN0ESXmJ71VR0VctXXNWvIDB6Ql0f81JoJikj8EQdDDeufCSAOLDVg
         dQB3bPjolq8kdEkgsYwwB2BlwRu3PownC8pyA6yDfhOIKoSL093n+1BIG37HnCnoNUtq
         rpB7Yz4t/GcvZot4gdzLD1agRxX1otrIAJy9IkFv3Nu5FVM5Az/858vj2jmOWagUVM6D
         ehMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=VPdV86aFCeaIztpHxWd6vZnOBYL8VBeklYsqm9GvmGY=;
        b=8FqMugm4Hh/b/LQYEQV0tStHzIGv5QIKCAok5cKV68PQtqlH0kDXlk4NCw9FlhOzi/
         fnd7iQ2uL5v/E8UgwR7zTa42231WVOfEHlVyEwm3ROjvm2JRDxyI9EbC9IS3P6JXY22Y
         K4Zq/X3gvZxcQSqgesyMM2S+KHRDXEBuIhKfMzJh9vJKT5uFOOjCNTm/uvznRwkt9ZqR
         PfL45HV2hfR5Crv5IZbnuhZO9F2EK9XJvA29+Fdm1XZUw9hhjhHWC/BDnkBC9z4cDAf3
         WlP8V4fswa6U2mhh0hf/ws101ojzF1bjv6GkXftbQX4GyfCIaArARiHI4aV2KuB42lkY
         GlRg==
X-Gm-Message-State: ACrzQf1GmLcWXxuC26MNYCoTETbetOZ17Ys1jNdKkXp9P+YyU5D6AGJu
	TWfuAFAdpqfH6tfYlcDDb7MpOEbi3IU=
X-Google-Smtp-Source: 
 AMsMyM5KWk/gj/wMDEHUmqEibXeiTawKsgdchPEzBVtefNB16j8dch2QaBNQAas+YXnQEa18e+SQNw==
X-Received: by 2002:a37:e115:0:b0:6cf:55d:6ac6 with SMTP id
 c21-20020a37e115000000b006cf055d6ac6mr20007871qkm.251.1664333215668;
        Tue, 27 Sep 2022 19:46:55 -0700 (PDT)
Received: from shaak (modemcable055.92-163-184.mc.videotron.ca.
 [184.163.92.55])
        by smtp.gmail.com with ESMTPSA id
 p1-20020a05622a00c100b0035d0655b079sm2098085qtw.30.2022.09.27.19.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 19:46:54 -0700 (PDT)
Date: Tue, 27 Sep 2022 22:46:53 -0400
From: Liam Beguin <liambeguin@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v1] meson: make wrapper options sub-command
 specific
Message-ID: <YzO1ndNgnvb8Yhjx@shaak>
References: <20220917220735.4192854-1-liambeguin@gmail.com>
 <YyotMcK5lcRp5/3X@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyotMcK5lcRp5/3X@mail.local>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Sep 2022 02:47:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171136

Hi Alexandre,

On Tue, Sep 20, 2022 at 11:14:25PM +0200, Alexandre Belloni wrote:
> Hello,
> 
> On 17/09/2022 18:07:35-0400, Liam Beguin wrote:
> > The meson-wrapper adds setup options to facilitate cross-compilation.
> > The current options are exclusive to the setup sub-command and might
> > cause issues with other sub-commands.
> > 
> > Update the wrapper to make options sub-command specific.
> > 
> 
> This caused many failures on the autobuilders:

Apologies for this! Thanks for pointing out the logs, I was able to run
the tests locally and will send v2 shortly.

Cheers,
Liam

> buildepoxy.EpoxyTest.test_epoxy: ERROR (0.43s)
> 
> oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '. /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/core-image-sato/1.0-r0/testimage-sdk/environment-setup-cortexa8hf-neon-poky-linux-gnueabi > /dev/null; meson -Degl=no -Dglx=no -Dx11=false /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/core-image-sato/1.0-r0/testimage-sdk/epoxybmd9dxec/build /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/core-image-sato/1.0-r0/testimage-sdk/epoxybmd9dxec/libepoxy-1.5.3;' returned non-zero exit status 1
> Standard Output: sed: -e expression #1, char 10: unknown option to `s'
> ERROR: Neither directory contains a build file meson.build.
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5918/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/5879/steps/12/logs/stdio
> and others
> 
> 
> > Signed-off-by: Liam Beguin <liambeguin@gmail.com>
> > ---
> >  .../meson/meson/meson-wrapper                 | 22 ++++++++++++++++---
> >  1 file changed, 19 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper b/meta/recipes-devtools/meson/meson/meson-wrapper
> > index c62007f5077e..fae9e167a325 100755
> > --- a/meta/recipes-devtools/meson/meson/meson-wrapper
> > +++ b/meta/recipes-devtools/meson/meson/meson-wrapper
> > @@ -13,7 +13,23 @@ fi
> >  # config is already in meson.cross.
> >  unset CC CXX CPP LD AR NM STRIP
> >  
> > +for arg in "${@}"; do
> > +    case ${arg} in
> > +    -*) continue ;;
> > +    *) SUBCMD=${arg}; break ;;
> > +    esac
> > +done
> > +
> > +case ${SUBCMD} in
> > +setup)
> > +    MESON_SUB_OPTS=" \
> > +        --cross-file="${OECORE_NATIVE_SYSROOT}/usr/share/meson/${TARGET_PREFIX}meson.cross" \
> > +        --native-file="${OECORE_NATIVE_SYSROOT}/usr/share/meson/meson.native" \
> > +        "
> > +    ;;
> > +esac
> > +
> >  exec "$OECORE_NATIVE_SYSROOT/usr/bin/meson.real" \
> > -     --cross-file "${OECORE_NATIVE_SYSROOT}/usr/share/meson/${TARGET_PREFIX}meson.cross" \
> > -     --native-file "${OECORE_NATIVE_SYSROOT}/usr/share/meson/meson.native" \
> > -     "$@"
> > +    ${SUBCMD} \
> > +    ${MESON_SUB_OPTS} \
> > +    $(echo $@ | sed s/${SUBCMD}//)
> > 
> > base-commit: 09c1cac053c2892e3af3250cc6229e8da78e7a50
> > -- 
> > 2.37.1.223.g6a475b71f8c4
> > 
> 
> > 
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#170842): https://lists.openembedded.org/g/openembedded-core/message/170842
> > Mute This Topic: https://lists.openembedded.org/mt/93751917/3617179
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

