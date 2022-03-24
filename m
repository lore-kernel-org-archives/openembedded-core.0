Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E822C433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 13:36:28 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.10744.1648128987151798370
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 06:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h+7AMqi6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id b19so6644404wrh.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 06:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=8WcKRxsXNxe8d47EDCXqDRadj81AhRQ1l8WWGCN55fo=;
        b=h+7AMqi6geDlNhKwGg68z9xeTVqdlNZF5fgC38YSFcM6tRi3ZuosugXXM5GFObsLoR
         yqdNc75YLPIdLxIPDr2GFFinWIOvRwHt0ygtbyt2Ou3Ucirezvmg63QA+hD4YNv+xiOS
         DnM9zbo50h/myMC+OZYhG4sZ0mN057nZEpR5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=8WcKRxsXNxe8d47EDCXqDRadj81AhRQ1l8WWGCN55fo=;
        b=ppY6W90ku8dpmihBqUKp7Hx3sDk3l1URE70SdOsd3lVn7zZQjs/vAOhXK5LBvKo5Na
         KXA6NdHkjq/0wqt/W/9ifOH8ddHuOeIqoLiAHId8saCsj7NPxYooPftUULM549hrK/qj
         7Qya1++PiQeEs33X4hZXj5nppIDHw8k06lzlBjV8UZKNviev8svdSbAxPcZOz1n3WV5Y
         Mtjvhcjgt3bD/GwHpF9v++eb+Eo8HsYsxloJ0keGTHptDbOyag9DwnEkwHFgUH/ByTNt
         bnv0K9Ek0FlBvnIr0vtLLuaqRxdzx9XeIPizmtUs4+3PlexE3DDAWoRZFXGOuykBZaMJ
         xVEQ==
X-Gm-Message-State: AOAM533oKngdqCqROSMa8/uTW4SPCt+Ptsw7P3YWrgTzpnBydSg2ygp+
	hVkxRWdzUGyEk5THKPgXJeLzaQ==
X-Google-Smtp-Source: 
 ABdhPJx2kKMywqzkpbqU1Lbg/Y1nW4sTQyiJ4C5t0hGArIdP0Z/ADKIg8oKLV4odKkWL9bP1BN9ouQ==
X-Received: by 2002:a5d:584f:0:b0:204:171b:a4bc with SMTP id
 i15-20020a5d584f000000b00204171ba4bcmr4792178wrf.592.1648128985356;
        Thu, 24 Mar 2022 06:36:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:468a:3ed0:d59:9804?
 ([2001:8b0:aba:5f3c:468a:3ed0:d59:9804])
        by smtp.gmail.com with ESMTPSA id
 l19-20020a05600c4f1300b0038cb924c3d7sm2208098wmq.45.2022.03.24.06.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Mar 2022 06:36:24 -0700 (PDT)
Message-ID: 
 <24175bc7feb5273a8886630b9c72fe214081e927.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] qemu: Depend on libepoxy instead of
 virtual/libgl
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alexandre.belloni@bootlin.com, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 24 Mar 2022 13:36:16 +0000
In-Reply-To: <YjxxcJddO/Sjvw/s@piout.net>
References: <20220324021141.2159404-1-raj.khem@gmail.com>
	 <YjxxcJddO/Sjvw/s@piout.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Mar 2022 13:36:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163610

On Thu, 2022-03-24 at 14:26 +0100, Alexandre Belloni via lists.openembedded.org
wrote:
> Hi Khem,
> 
> On 23/03/2022 19:11:41-0700, Khem Raj wrote:
> > - This abstracts on GL/GLES implementations
> > - Rename packageconfig to epoxy to match what code it doing underneath
> 
> This is not working either and I guess we will need to go and fix all
> the layers using the glx packageconfig:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3413
> 
> > 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: Rename packageconfig to epoxy as it matches code
> > v3: Depend on libepoxy instead of virtual/egl
> > 
> >  meta/recipes-devtools/qemu/qemu.inc      | 6 +++---
> >  meta/recipes-devtools/qemu/qemu_6.2.0.bb | 4 ++--
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> > index 78aea71cc05..e9d2dae0405 100644
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
> > +PACKAGECONFIG[epoxy] = "--enable-opengl,--disable-opengl,libepoxy"
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

I think there is a reference missed here:

qemu-system-native_6.0.0.bb:    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '', d)} \

Cheers,

Richard





