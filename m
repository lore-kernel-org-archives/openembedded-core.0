Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web08.8267.1617285526635732574
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 06:58:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C9hjsTgK;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id by2so1003163qvb.11
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Apr 2021 06:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MOYVd13M351LaGR76hhfCgIgSDWAXZ85NGNjnYc2Po4=;
        b=C9hjsTgKHNfZhvF2XzI8oMUOxKiGcLjolR9tgG2AhOeZri27rCcbbZYmQC7x8n+rJp
         D6c9qrg4WzsiTNDYjx8ZjqrtqgeX+5hNdWiWL3ExWb/DfLmAGvoQJMznHTQ6Mt/lhLe9
         0wMIdL2wuqMAtzGJDQ3PYSKXUqgNZyi1W2KMfoRF7Q0UCuZ7TkVcGUVLCU5mM5SO8cVa
         8Go/Cqwe7g6bOdM9An8cgw39E7HJPf39rNVC326JOZQJsTeqC0ohMnxUJyV/gQVEwAG/
         z3gn02V3fD4lGCO4vHsQGUMNyooAn9NhORiA08dwSpxLumcJP2Q3FwUE3wksbrhEnYE1
         XifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MOYVd13M351LaGR76hhfCgIgSDWAXZ85NGNjnYc2Po4=;
        b=ZCFouGSxzlrD6iATCmFkhvJxXPmv6WHz2T+/Vukrrv2QxMiriQHKl2mI+nH+23kUUD
         qiW4iv3Fq5poFmbr0SVe4IuD+Ie2NzzMuo2hH0zTyaVPXJmVQpQ8Jq0+clhE1b+GxJ1I
         UufhdLryLL4HVyAK7zR557xBkJwkvkI0pyfFsvr6kl4zBXW0dsDgUmSPuU2a/XBJTVuC
         5N5Yf1gjlXA7MT5OG1heTdxRSff2e2pBfOC2Fu4dqtPdx+t+dhdfvN1PTennp7EuWWCo
         or0rr9jkGloYa/kgoJS2FmuXrytvm+kIA0kovsw7O8SYeIXDQP3wCeoHSXUU4BAzo7CY
         LD5g==
X-Gm-Message-State: AOAM531Dglumzvn7I5skuW8U8kpW97ZhXH8ILBf5bLmSDPS0+iv31yCn
	m0qU3Ap+2dnceQeIPzxZ1sYLeTtNKN1lH6+ZBIY=
X-Google-Smtp-Source: ABdhPJyuyUH3U9sqFzrhBYp9yyuIe1e7fpprtinjUl07Ei13Z7J5WNeFizgHrKW/i8VyYqB21EDnJtbYjwCop/ZuyKU=
X-Received: by 2002:a0c:b218:: with SMTP id x24mr8151320qvd.55.1617285525713;
 Thu, 01 Apr 2021 06:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210331225051.3823769-1-raj.khem@gmail.com> <20210401101908.qsyswliokyze37tm@jama>
In-Reply-To: <20210401101908.qsyswliokyze37tm@jama>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 1 Apr 2021 06:58:17 -0700
Message-ID: <CAMKF1srP43Xoew=7=R7XDJsDX5-dHp6z0UXPbPJ6-GSogDdxmg@mail.gmail.com>
Subject: Re: [PATCH] mesa-gl: Use swrast gallium driver
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 1, 2021 at 3:19 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Wed, Mar 31, 2021 at 03:50:51PM -0700, Khem Raj wrote:
> > Fixes
> > ../mesa-21.0.0/meson.build:21:0: ERROR: Options "swrast" are not in allowed choices: "auto, i915, i965, r100, r200, nouveau"
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb b/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
> > index e50782be1c..fc8b4f7504 100644
> > --- a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
> > +++ b/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
> > @@ -12,4 +12,4 @@ PACKAGECONFIG ??= "opengl dri ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x1
> >  PACKAGECONFIG_class-target = "opengl dri ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa', d)}"
> >
> >  # When NOT using X11, we need to make sure we have swrast available.
> > -DRIDRIVERS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', ',swrast', d)}"
> > +GALLIUMDRIVERS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', ',swrast', d)}"
>
> With:
> DISTRO_FEATURES_remove = "x11"
> PREFERRED_PROVIDER_virtual/libgl = "mesa-gl"
> PREFERRED_PROVIDER_virtual/mesa = "mesa-gl"
> in local.conf this is unfortunately still failing, now with:
>
> ../mesa-21.0.0/meson.build:519:4: ERROR: Problem encountered: building dri drivers require at least one windowing system
>
> whole log:
> http://errors.yoctoproject.org/Errors/Details/575265/
>
> adding nouveau to DRIDRIVERS like normal mesa doesn't help in this case,
> because I was building for qemux86-64 which already has bunch of
> DRIDRIVERS added by default (but adding at least one DRIDRIVER might be still
> needed for other architectures).
>

classic OSMesa is removed and swrast gallium drivers are needed for osmsa to run
could you also add below patch and try. ?


diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
b/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
index fc8b4f7504..47b14fb97f 100644
--- a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
@@ -8,8 +8,8 @@ S = "${WORKDIR}/mesa-${PV}"

# At least one DRI rendering engine is required to build mesa.
# When no X11 is available, use osmesa for the rendering engine.
-PACKAGECONFIG ??= "opengl dri ${@bb.utils.contains('DISTRO_FEATURES',
'x11', 'x11', 'osmesa', d)}"
-PACKAGECONFIG_class-target = "opengl dri
${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa', d)}"
+PACKAGECONFIG ??= "opengl dri ${@bb.utils.contains('DISTRO_FEATURES',
'x11', 'x11', 'osmesa gallium', d)}"
+PACKAGECONFIG_class-target = "opengl dri
${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa
gallium', d)}"

# When NOT using X11, we need to make sure we have swrast available.
GALLIUMDRIVERS_append = "${@bb.utils.contains('DISTRO_FEATURES',
'x11', '', ',swrast', d)}"


> # $DRIDRIVERS [4 operations]
> #   _append[x86_class-target] /OE/build/oe-core/openembedded-core/meta/recipes-graphics/mesa/mesa.inc:107
> #     ",r100,r200,nouveau,i965,i915"
> #   _append[x86-64_class-target] /OE/build/oe-core/openembedded-core/meta/recipes-graphics/mesa/mesa.inc:108
> #     ",r100,r200,nouveau,i965,i915"
> #   override[class-native]:set /OE/build/oe-core/openembedded-core/meta/recipes-graphics/mesa/mesa.inc:105
> #     "nouveau"
> #   override[class-nativesdk]:set /OE/build/oe-core/openembedded-core/meta/recipes-graphics/mesa/mesa.inc:106
> #     "nouveau"
> # pre-expansion value:
> #   ",r100,r200,nouveau,i965,i915"
> DRIDRIVERS=",r100,r200,nouveau,i965,i915"
>
> Reverting Alex's upgrade to 21.0.0 allows to build mesa-gl again and it should surely pass AB build :).
