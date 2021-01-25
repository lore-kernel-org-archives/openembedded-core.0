Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.36968.1611583991458777928
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:13:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JIesL2yL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id 7so12699756wrz.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Nys5YTXlVVrkd05l/2X/LzPBtbxmwo69UuIsE8J0TnU=;
        b=JIesL2yLAq6AIeQnQZiqgtyHucg+dwOGPnHJ/bw9LRnC8rI+aPsaSatCRxG/vVypmh
         lxX7jSatHegs/1ox46OkAg3E04iFIDmFaUK/a0O+UvNtOBb0NrIYdyUeiji+cd0XjXLn
         ezD9QnnXHPRuXvFDK2NoCi4cbCzmzKAJqwMko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Nys5YTXlVVrkd05l/2X/LzPBtbxmwo69UuIsE8J0TnU=;
        b=H7XFVrF9YHUv013wKUwmq81ocW7tVGvEnTVUYDre4FhAvkoSS5fKmSp2qcwRQrx35u
         M0xM8/CloNBNuJBLBgssbaY0w0kVUHqbGtbqc5frZDiHo5YuR7/ZJO5A6Yu0nq4eMO0w
         tInuu8MeG18C+86XpqaN/9/ATvnruGdPSZSLMax6weNjKdNi2MrzX9eJPoow8MY6Pb7D
         CXalsFunwfTi4F4FTEvN/APZdiFNMHn9Is8njz4FYs7bIYp0YTKUYLcXump9SWMjf9pp
         Nd6sDw8cGfddz6L5tWacvFxur96ZU84QbSY7+Cpj89a4XtyVIiwVxvG/QztmiTt8JIGc
         4JqA==
X-Gm-Message-State: AOAM530Pk/XIEyJNzGRtn72ZarPchPaSoDuitQwpp9xtoaVHxKci/io9
	kfQq86J0X0cPVJuraLyQwx84Hg==
X-Google-Smtp-Source: ABdhPJxj0mEGyOyXLhuyo+D+pgccm0T1kMAmO0ZbokciYpiyYnNHaJq8Up/Gcmf9l/iPos2NgkqZIw==
X-Received: by 2002:adf:f60f:: with SMTP id t15mr1224157wrp.53.1611583989856;
        Mon, 25 Jan 2021 06:13:09 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:cbb3:266e:4b67:be20? ([2001:8b0:aba:5f3c:cbb3:266e:4b67:be20])
        by smtp.gmail.com with ESMTPSA id q2sm21108036wma.6.2021.01.25.06.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:13:09 -0800 (PST)
Message-ID: <7f9a02225a43da51e13814d479fbfd663620e401.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] libdrm: upgrade 2.4.103 -> 2.4.104
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Wang Mingyu <wangmy@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2021 14:13:08 +0000
In-Reply-To: <165D7DCBB82BF446.2229@lists.openembedded.org>
References: <1611541232-1991-1-git-send-email-wangmy@cn.fujitsu.com>
	 <1611541232-1991-2-git-send-email-wangmy@cn.fujitsu.com>
	 <165D7DCBB82BF446.2229@lists.openembedded.org>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-01-25 at 13:49 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Mon, 2021-01-25 at 10:20 +0800, Wang Mingyu wrote:
> > Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> > ---
> >  .../drm/{libdrm_2.4.103.bb => libdrm_2.4.104.bb}              | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/recipes-graphics/drm/{libdrm_2.4.103.bb => libdrm_2.4.104.bb} (95%)
> > 
> > diff --git a/meta/recipes-graphics/drm/libdrm_2.4.103.bb b/meta/recipes-graphics/drm/libdrm_2.4.104.bb
> > similarity index 95%
> > rename from meta/recipes-graphics/drm/libdrm_2.4.103.bb
> > rename to meta/recipes-graphics/drm/libdrm_2.4.104.bb
> > index 1028d618ae..e7007e1330 100644
> > --- a/meta/recipes-graphics/drm/libdrm_2.4.103.bb
> > +++ b/meta/recipes-graphics/drm/libdrm_2.4.104.bb
> > @@ -12,7 +12,7 @@ DEPENDS = "libpthread-stubs"
> >  
> > 
> > 
> > 
> >  SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz"
> >  
> > 
> > 
> > 
> > -SRC_URI[sha256sum] = "3fe0affdba6460166a7323290c18cf68e9b59edcb520722826cb244e9cb50222"
> > +SRC_URI[sha256sum] = "d66ad8b5c2441015ac1333e40137bb803c3bde3612ff040286fcc12158ea1bcb"
> >  
> > 
> > 
> > 
> >  inherit meson pkgconfig manpages
> >  
> > 
> > 
> > 
> > @@ -34,7 +34,7 @@ PACKAGECONFIG[valgrind] = "-Dvalgrind=true,-Dvalgrind=false,valgrind"
> >  PACKAGECONFIG[install-test-programs] = "-Dinstall-test-programs=true,-Dinstall-test-programs=false"
> >  PACKAGECONFIG[cairo-tests] = "-Dcairo-tests=true,-Dcairo-tests=false"
> >  PACKAGECONFIG[udev] = "-Dudev=true,-Dudev=false,udev"
> > -PACKAGECONFIG[manpages] = "-Dman-pages=true,-Dman-pages=false,libxslt-native xmlto-native"
> > +PACKAGECONFIG[manpages] = "-Dman-pages=true,-Dman-pages=false,libxslt-native xmlto-native python3-docutils-native"
> >  
> > 
> > 
> > 
> >  ALLOW_EMPTY_${PN}-drivers = "1"
> >  PACKAGES =+ "${PN}-tests ${PN}-drivers ${PN}-radeon ${PN}-nouveau ${PN}-omap \
> 
> Still fails I'm afraid:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/1291

I see this likely needs the first patch which Alex has commented on, if
we can get that as backport we can likely fix this, thanks. If there
are patch dependencies, please mention them in commit messages.

Cheers,

Richard

