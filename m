Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web12.19812.1617384610200178812
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Apr 2021 10:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aXMtZMSK;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id f12so4139493qtq.4
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Apr 2021 10:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ymFo9mJCudW/HW1ffYHigFUaoEnnaLVsYejsloXK+vQ=;
        b=aXMtZMSKb8FRqzsh5H0oqiXbegCSI9j8fBfwj+txoSh0c7TXTN6QbdnbYby56/Dy9r
         KDkAgyhhZgDBr1OjGQfbkQUONyd/VZLDfWfoCHjIt0MjTtYO9ZZ7Fuh5Chpwh9c/tbM1
         XnBxv9gqVvOU1QID5HvDPhhRrilbGktuiGJfQHkpD+FJoIwe7doMK8Hyo9IYtK3OYEOJ
         SD0Ualpx/1bh5r+8rf6jx9jJ81d32gXTPUl+J1o7o+qu3csM8dvUrXo4SXnPqAJ3p0Lh
         ala8MBHBUXRlxMgajSFTxxfMDQq+56TmisiCWoq1RLlnj6YiM/fRD2+uNj9b0nShsTqs
         DbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ymFo9mJCudW/HW1ffYHigFUaoEnnaLVsYejsloXK+vQ=;
        b=JQD9VmmyqHH6tbpWVf+7OxlTXrhVOt85xbc2JjHDhiuKR0ILQZAtibf0OLS3rBWz0o
         ggPK5qUm7qv2ZUkSH32sPbR4aziQF+UMIvXIGyhw5uyCH6zxmpDH9LThzsv7L3Lhu5Le
         cHWHouoyBiHCCCiQwtGWeNT8pLeHvOhx9EpDHdXJLD3PkHqL+wXcxBrXeyirooi0OYER
         edQ5+6G9b/UVhyTmM9CeDgSRqc9Tnae9SPX9Zlc8Z131+ZpthVC90ZI9zR1elRJA7Yku
         jDebueMzEmQN1v0EQH5nccT6XZNk45p2drGYuGY/pzgxxbzU2uShfH+2zw7ZvvPT2VcN
         E/0w==
X-Gm-Message-State: AOAM530VmNlz0XsmGl9PcpbIACdkxx3I6Dt5zRbF1CFj2HRPn15WKJEs
	6eezUd0q4g+Q96eu+0ARJiuYmEncYxSNcacIol4=
X-Google-Smtp-Source: ABdhPJw0YbN4wejRts6fXrmyHfmK5wmw1Sf2Zgh9UJEMnWyCR2lSjpuk9XKfhEatY8kakPp6tMrq3OO0fQo7HS/J9ck=
X-Received: by 2002:ac8:6e85:: with SMTP id c5mr12032944qtv.299.1617384609260;
 Fri, 02 Apr 2021 10:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210331225051.3823769-1-raj.khem@gmail.com> <20210401101908.qsyswliokyze37tm@jama>
 <CAMKF1srP43Xoew=7=R7XDJsDX5-dHp6z0UXPbPJ6-GSogDdxmg@mail.gmail.com> <CA+chaQd7XR9rY9Yz3dJrtJC2Lg2DjJYugGXQdkGEqjjqaQUKSw@mail.gmail.com>
In-Reply-To: <CA+chaQd7XR9rY9Yz3dJrtJC2Lg2DjJYugGXQdkGEqjjqaQUKSw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 2 Apr 2021 10:29:43 -0700
Message-ID: <CAMKF1srEkJwqGU2ydh8DREiTmtC0+VLRUziMKRJftVN+75-1qA@mail.gmail.com>
Subject: Re: [PATCH] mesa-gl: Use swrast gallium driver
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Ross Burton <ross@burtonini.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

yeah we need to start using nouveau dri driver perhaps instead of swrast

On Fri, Apr 2, 2021 at 3:15 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Unfortunately it still fails the same for qemux86* with this change.
>
> Enabling wayland PACKAGECONFIG doesn't help as well.
>
> Building for qemuarm with empty DRIDRIVERS does pass the do_configure wit=
h:
> EXTRA_OEMESON=3D"     -Dshared-glapi=3Denabled     -Dgallium-opencl=3Ddis=
abled     -Dglx-read-only-text=3Dtrue     -Dplatforms=3D'wayland'   -Ddri-d=
rivers=3D  -Ddri3=3Ddisabled  -Degl=3Ddisabled  -Delf-tls=3Dfalse -Dgallium=
-drivers=3Dswrast,swrast  -Dllvm=3Ddisabled -Dgbm=3Ddisabled  -D
> gles1=3Ddisabled -Dgles2=3Ddisabled -Dopengl=3Dtrue -Dosmesa=3Dtrue -Dlib=
unwind=3Ddisabled -Dgallium-va=3Ddisabled -Dgallium-vdpau=3Ddisabled  -Dvul=
kan-drivers=3D'' -Dglx=3Ddisabled  -Dgallium-xa=3Ddisabled -Dgallium-xvmc=
=3Ddisabled"
>
> which is a bit surprising as mesa-gl_21.0.0.bb comment says:
> # When NOT using X11, we need to make sure we have at least one driver en=
abled
> and now the only build which isn't broken by the 21 upgrade is the one wi=
thout any driver.
>
> and x86 and x86-64 always enable some DRIDRIVERS in mesa.inc:
> DRIDRIVERS_class-native =3D "nouveau"
> DRIDRIVERS_class-nativesdk =3D "nouveau"
> DRIDRIVERS_append_x86_class-target =3D ",r100,r200,nouveau,i965,i915"
> DRIDRIVERS_append_x86-64_class-target =3D ",r100,r200,nouveau,i965,i915"
>
> Maybe this upgrade to development version 21.0.0 should be reverted and 2=
1.0.1 should be merged after this meta-gl breakage is resolved somehow?
>
> On Thu, Apr 1, 2021 at 3:58 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Thu, Apr 1, 2021 at 3:19 AM Martin Jansa <martin.jansa@gmail.com> wro=
te:
>> >
>> > On Wed, Mar 31, 2021 at 03:50:51PM -0700, Khem Raj wrote:
>> > > Fixes
>> > > ../mesa-21.0.0/meson.build:21:0: ERROR: Options "swrast" are not in =
allowed choices: "auto, i915, i965, r100, r200, nouveau"
>> > >
>> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > > Cc: Martin Jansa <Martin.Jansa@gmail.com>
>> > > ---
>> > >  meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb | 2 +-
>> > >  1 file changed, 1 insertion(+), 1 deletion(-)
>> > >
>> > > diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb b/meta/rec=
ipes-graphics/mesa/mesa-gl_21.0.0.bb
>> > > index e50782be1c..fc8b4f7504 100644
>> > > --- a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
>> > > +++ b/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
>> > > @@ -12,4 +12,4 @@ PACKAGECONFIG ??=3D "opengl dri ${@bb.utils.contai=
ns('DISTRO_FEATURES', 'x11', 'x1
>> > >  PACKAGECONFIG_class-target =3D "opengl dri ${@bb.utils.contains('DI=
STRO_FEATURES', 'x11', 'x11', 'osmesa', d)}"
>> > >
>> > >  # When NOT using X11, we need to make sure we have swrast available=
.
>> > > -DRIDRIVERS_append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11=
', '', ',swrast', d)}"
>> > > +GALLIUMDRIVERS_append =3D "${@bb.utils.contains('DISTRO_FEATURES', =
'x11', '', ',swrast', d)}"
>> >
>> > With:
>> > DISTRO_FEATURES_remove =3D "x11"
>> > PREFERRED_PROVIDER_virtual/libgl =3D "mesa-gl"
>> > PREFERRED_PROVIDER_virtual/mesa =3D "mesa-gl"
>> > in local.conf this is unfortunately still failing, now with:
>> >
>> > ../mesa-21.0.0/meson.build:519:4: ERROR: Problem encountered: building=
 dri drivers require at least one windowing system
>> >
>> > whole log:
>> > http://errors.yoctoproject.org/Errors/Details/575265/
>> >
>> > adding nouveau to DRIDRIVERS like normal mesa doesn't help in this cas=
e,
>> > because I was building for qemux86-64 which already has bunch of
>> > DRIDRIVERS added by default (but adding at least one DRIDRIVER might b=
e still
>> > needed for other architectures).
>> >
>>
>> classic OSMesa is removed and swrast gallium drivers are needed for osms=
a to run
>> could you also add below patch and try. ?
>>
>>
>> diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
>> b/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
>> index fc8b4f7504..47b14fb97f 100644
>> --- a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
>> +++ b/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
>> @@ -8,8 +8,8 @@ S =3D "${WORKDIR}/mesa-${PV}"
>>
>> # At least one DRI rendering engine is required to build mesa.
>> # When no X11 is available, use osmesa for the rendering engine.
>> -PACKAGECONFIG ??=3D "opengl dri ${@bb.utils.contains('DISTRO_FEATURES',
>> 'x11', 'x11', 'osmesa', d)}"
>> -PACKAGECONFIG_class-target =3D "opengl dri
>> ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa', d)}"
>> +PACKAGECONFIG ??=3D "opengl dri ${@bb.utils.contains('DISTRO_FEATURES',
>> 'x11', 'x11', 'osmesa gallium', d)}"
>> +PACKAGECONFIG_class-target =3D "opengl dri
>> ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa
>> gallium', d)}"
>>
>> # When NOT using X11, we need to make sure we have swrast available.
>> GALLIUMDRIVERS_append =3D "${@bb.utils.contains('DISTRO_FEATURES',
>> 'x11', '', ',swrast', d)}"
>>
>>
>> > # $DRIDRIVERS [4 operations]
>> > #   _append[x86_class-target] /OE/build/oe-core/openembedded-core/meta=
/recipes-graphics/mesa/mesa.inc:107
>> > #     ",r100,r200,nouveau,i965,i915"
>> > #   _append[x86-64_class-target] /OE/build/oe-core/openembedded-core/m=
eta/recipes-graphics/mesa/mesa.inc:108
>> > #     ",r100,r200,nouveau,i965,i915"
>> > #   override[class-native]:set /OE/build/oe-core/openembedded-core/met=
a/recipes-graphics/mesa/mesa.inc:105
>> > #     "nouveau"
>> > #   override[class-nativesdk]:set /OE/build/oe-core/openembedded-core/=
meta/recipes-graphics/mesa/mesa.inc:106
>> > #     "nouveau"
>> > # pre-expansion value:
>> > #   ",r100,r200,nouveau,i965,i915"
>> > DRIDRIVERS=3D",r100,r200,nouveau,i965,i915"
>> >
>> > Reverting Alex's upgrade to 21.0.0 allows to build mesa-gl again and i=
t should surely pass AB build :).
