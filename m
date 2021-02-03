Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web12.2392.1612384186926903524
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 12:29:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VtW17pPT;
 spf=pass (domain: gmail.com, ip: 209.85.222.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id 20so174897uat.12
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Feb 2021 12:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FCO4OoT3QFW++5XFORxnRvH9bPoJd3dJusGRP4VCy9g=;
        b=VtW17pPTS2Xyxwh+3xBeav8S2U/0U5wwIAOmvz92p54bV1+h1yvljawdfg8Xj17g/E
         SNFmFTGnP3Z+spKLoiA811Mf3TLubbz5KkdVysR9StYLGLpOs0Y3MHPqfVJjIYQaqLhE
         7lKwUnAVWGyFCgtKb4+kmgsxHbW71tI0BdcnZgH2VC0uFeU0cYn6ogFCRTFUfJ+ZPws7
         jUcwR4Uf5OEw2B944cWR4LR1e+1iQI5ng54x0sh6GZpI56G4J6Uqq4nv8AvPRUuaE9LF
         gedZ+TCpuMVKJlMXwFUe0ZRmBbusJPX3fRH3F1LHQF+PoP6nJSPyNNuQh+Ncl6ZyQLY0
         NSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FCO4OoT3QFW++5XFORxnRvH9bPoJd3dJusGRP4VCy9g=;
        b=KQtK3i6ZM7McHL5ZdBmiVq0x2Blf321h4tWlJZswexI/YnB7Qoq5NVVwgAUESasJZX
         il5Q0YY6vvCdMs0Scuet8wLfRxlB3NqdBHsyNH223LMwcs2eBeRsezCgl07Hm2QsHpl5
         JTGAIiJCaiJS2BtMMwaP1Xvay1YxgSmCZ8c34+/2ZqEkwKzNsvSD0l5meoO0Q+e8R5b2
         AcVSrE9k4JqqqrVCv2+pAtTKuhxzj8MamWuGOM0bULI/Q2qqRseCaJzHvHfMKHrH4n4m
         pNhzFxRPJwt8iTyV4h9KnOy2h6YG6tLWi/C5W+tVuuPcWXKcXGQ4B3Ykkri5yUkWgRKP
         Pawg==
X-Gm-Message-State: AOAM5321NyCP7zeM55nHUY47n8DVrE1o9nm1raxAHeBKeLJFcvWmNXay
	/ZugN9J0ynkIRK43aflXVW125bHFwAdL2sauhY4=
X-Google-Smtp-Source: ABdhPJxZMC9PT+qjIomqa8qX30PZUsJbcHbzrSveQziHaSuKof8/YiYn+Y4oGXWIPVRaouWxhTR6SuU6PAvwt382+jA=
X-Received: by 2002:ab0:2448:: with SMTP id g8mr3140161uan.89.1612384185949;
 Wed, 03 Feb 2021 12:29:45 -0800 (PST)
MIME-Version: 1.0
References: <20210201102300.3789714-1-yann@blade-group.com>
 <CAEE5dN2tyho8jGnSb4bSE1P7h=_ejELEPd_ULeE4V6KSdk81hA@mail.gmail.com>
 <CA+4=imbeMSfAijugTxx-_px3jDxqOZp-sA7i-j4XqFM4y5gmJA@mail.gmail.com>
 <16604BBA745DB2D9.18741@lists.openembedded.org> <1660549372F1DC15.22837@lists.openembedded.org>
In-Reply-To: <1660549372F1DC15.22837@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 3 Feb 2021 21:29:34 +0100
Message-ID: <CANNYZj92WRXHtrERBsQ3sLVdQvkLFLVy16tsihOaNDnQAzMENw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libsdl2: upgrade to 2.0.14
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Yann Dirson <yann.dirson@blade-group.com>, Mark Jonas <toertel@gmail.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>, =?UTF-8?Q?Romain_Roff=C3=A9?= <romain.roffe@blade-group.com>
Content-Type: multipart/alternative; boundary="000000000000a5210f05ba747215"

--000000000000a5210f05ba747215
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I digged a bit: I think libsdl 1.x might still have it, but libsdl 2.x
definitely does not.


Alex


On Wed, 3 Feb 2021 at 20:47, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:

> It looks like tslib support was not in 2.0.12 version either, and probab=
ly
> was ripped out long time ago:
> http://hg.libsdl.org/SDL/rev/a708852dbd5c
>
> Alex
>
> On Wed, 3 Feb 2021 at 18:05, Alexander Kanavin via lists.openembedded.or=
g
> <alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
>
>> Certainly not in oe-core please. This looks like a problem you need to
>> take upstream, and until then do any downgrades via private layer.
>>
>> Alex
>>
>> On Wed, 3 Feb 2021 at 14:54, Yann Dirson <yann.dirson@blade-group.com>
>> wrote:
>>
>>> Le lun. 1 f=C3=A9vr. 2021 =C3=A0 20:11, Mark Jonas <toertel@gmail.com>=
 a =C3=A9crit :
>>>
>>>> Hi,
>>>>
>>>> tslib support is often relevant for embedded projects with simple
>>>> (resistive) touch screens. Would it make sense to keep the 2.0.12
>>>> recipe and offer both in parallel?
>>>>
>>>
>>>  What do others think ?
>>>
>>> We could use a libsdl2.inc with the common stuff, of just keep the
>>> current 2.0.12
>>> version as is.  Maybe even move the 2.0.12 recipe to meta-oe, where
>>> tslib seems
>>> to live nowadays, although that could make the recipe harder to find f=
or
>>> those who
>>> need it.
>>>
>>> I'd suggest if that support is still needed, to approach libsdl upstre=
am
>>> with a patch
>>> restoring the tslib support ?  Maybe we could even carry such a patch =
in
>>> yocto until
>>> upstream does something ?  That could be better than just carying an o=
ld
>>> version.
>>>
>>>
>>>> Cheers,
>>>> Mark
>>>>
>>>> On Mon, Feb 1, 2021 at 11:23 AM Yann Dirson <
>>>> yann.dirson@blade-group.com> wrote:
>>>> >
>>>> > From: Yann Dirson <yann@blade-group.com>
>>>> >
>>>> > This version does not support tslib any more, as can be seen by the
>>>> > failed AUH run.
>>>> >
>>>> > Originally-by: Romain Roff=C3=A9 <romain.roffe@blade-group.com>
>>>> > Signed-off-by: Yann Dirson <yann@blade-group.com>
>>>> > ---
>>>> >  .../libsdl2/directfb-renderfillrect-fix.patch | 33 -------------
>>>> >  ...ectfb-spurious-curly-brace-missing-e.patch | 49
>>>> -------------------
>>>> >  .../{libsdl2_2.0.12.bb =3D> libsdl2_2.0.14.bb}  |  6 +--
>>>> >  3 files changed, 1 insertion(+), 87 deletions(-)
>>>> >  delete mode 100644
>>>> meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fix.pat=
ch
>>>> >  delete mode 100644
>>>> meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-curly-brace-m=
issing-e.patch
>>>> >  rename meta/recipes-graphics/libsdl2/{libsdl2_2.0.12.bb =3D>
>>>> libsdl2_2.0.14.bb} (91%)
>>>> >
>>>> > diff --git
>>>> a/meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fix.p=
atch
>>>> b/meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fix.p=
atch
>>>> > deleted file mode 100644
>>>> > index 83d4f4b1ec..0000000000
>>>> > ---
>>>> a/meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fix.p=
atch
>>>> > +++ /dev/null
>>>> > @@ -1,33 +0,0 @@
>>>> > -# HG changeset patch
>>>> > -# User Sam Lantinga <slouken@libsdl.org>
>>>> > -# Date 1590793369 25200
>>>> > -# Node ID a90089f75990e8b07a1dcf931c5f8a580ae343bf
>>>> > -# Parent  a9b4bd264f3cbedc4f3287b3ec6b32311370ba85
>>>> > -Fixed bug 5146 - SDL_RenderFillRect doesn't work in DirectFB
>>>> > -
>>>> > -Lacky
>>>> > -
>>>> > -It looks like refactoring of SDL2 internal API has broken
>>>> SDL_RenderFillRect for DirectFB. In new version function SDL_RenderFi=
llRect
>>>> returns 0, but rectangle is not visible.
>>>> > -
>>>> > -Replacing "count" with "len" in the argument list for SDL_memcpy i=
n
>>>> DirectFB_QueueFillRects fixes problem.
>>>> > -
>>>> > ---
>>>> > -
>>>> > -The patch was imported from the libsdl Mercurial repository
>>>> > -(https://hg.libsdl.org/SDL) as of changeset id a90089f75990.
>>>> > -
>>>> > -Upstream-Status: Backport
>>>> > -
>>>> > -Signed-off-by: Mark Jonas <toertel@gmail.com>
>>>> > -
>>>> > -diff -r a9b4bd264f3c -r a90089f75990
>>>> src/video/directfb/SDL_DirectFB_render.c
>>>> > ---- a/src/video/directfb/SDL_DirectFB_render.c Thu May 21 00:06:09
>>>> 2020 -0400
>>>> > -+++ b/src/video/directfb/SDL_DirectFB_render.c Fri May 29 16:02:49
>>>> 2020 -0700
>>>> > -@@ -626,7 +626,7 @@
>>>> > -     }
>>>> > -
>>>> > -     cmd->data.draw.count =3D count;
>>>> > --    SDL_memcpy(verts, rects, count);
>>>> > -+    SDL_memcpy(verts, rects, len);
>>>> > -     return 0;
>>>> > - }
>>>> > diff --git
>>>> a/meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-curly-brace=
-missing-e.patch
>>>> b/meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-curly-brace=
-missing-e.patch
>>>> > deleted file mode 100644
>>>> > index aa351a89ba..0000000000
>>>> > ---
>>>> a/meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-curly-brace=
-missing-e.patch
>>>> > +++ /dev/null
>>>> > @@ -1,49 +0,0 @@
>>>> > -# HG changeset patch
>>>> > -# User Fabrice Fontaine <fontaine.fabrice@gmail.com>
>>>> > -# Date 1585069551 25200
>>>> > -# Node ID 769f800952179633ec6c3e6bc1bc1d40e401750a
>>>> > -# Parent  63387e8920f58f608288f247824ec5f4c286691f
>>>> > -src/video/directfb/SDL_DirectFB_render.c: fix build
>>>> > -Build with directfb is broken due to a spurious '}' and a missing =
'E'
>>>> > -since version 2.0.12 and https://hg.libsdl.org/SDL/rev/2d5b5a5ccbf=
b:
>>>> > -
>>>> >
>>>> -/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/=
src/video/directfb/SDL_DirectFB_render.c:
>>>> In function 'SetBlendMode':
>>>> >
>>>> -/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/=
src/video/directfb/SDL_DirectFB_render.c:202:9:
>>>> error: case label not within a switch statement
>>>> > -  202 |         case SDL_BLENDMODE_MUL:
>>>> > -      |         ^~~~
>>>> > -
>>>> >
>>>> -/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/=
src/video/directfb/SDL_DirectFB_render.c:205:67:
>>>> error: 'DSBF_DSTCOLOR' undeclared (first use in this function); did y=
ou
>>>> mean 'DSBF_DESTCOLOR'?
>>>> > -  205 |
>>>>  SDL_DFB_CHECK(destsurf->SetSrcBlendFunction(destsurf, DSBF_DSTCOLOR)=
);
>>>> > -      |
>>>>      ^~~~~~~~~~~~~
>>>> > -
>>>> > -Fixes:
>>>> > - -
>>>> http://autobuild.buildroot.org/results/83ccefee68c2800c0544e6f40fa8bc=
8ee6b67b77
>>>> > -
>>>> > -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>>>> > -
>>>> > ---
>>>> > -
>>>> > -The patch was imported from the libsdl Mercurial repository
>>>> > -(https://hg.libsdl.org/SDL) as of changeset id 769f80095217.
>>>> > -
>>>> > -Upstream-Status: Backport
>>>> > -
>>>> > -Signed-off-by: Mark Jonas <toertel@gmail.com>
>>>> > -
>>>> > -
>>>> > -diff -r 63387e8920f5 -r 769f80095217
>>>> src/video/directfb/SDL_DirectFB_render.c
>>>> > ---- a/src/video/directfb/SDL_DirectFB_render.c Mon Mar 23 14:10:25
>>>> 2020 -0700
>>>> > -+++ b/src/video/directfb/SDL_DirectFB_render.c Tue Mar 24 10:05:51
>>>> 2020 -0700
>>>> > -@@ -198,11 +198,10 @@
>>>> > -             SDL_DFB_CHECK(destsurf->SetDstBlendFunction(destsurf,
>>>> DSBF_SRCCOLOR));
>>>> > -
>>>> > -             break;
>>>> > --        }
>>>> > -         case SDL_BLENDMODE_MUL:
>>>> > -             data->blitFlags =3D DSBLIT_BLEND_ALPHACHANNEL;
>>>> > -             data->drawFlags =3D DSDRAW_BLEND;
>>>> > --            SDL_DFB_CHECK(destsurf->SetSrcBlendFunction(destsurf,
>>>> DSBF_DSTCOLOR));
>>>> > -+            SDL_DFB_CHECK(destsurf->SetSrcBlendFunction(destsurf,
>>>> DSBF_DESTCOLOR));
>>>> > -             SDL_DFB_CHECK(destsurf->SetDstBlendFunction(destsurf,
>>>> DSBF_INVSRCALPHA));
>>>> > -
>>>> > -             break;
>>>> > diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
>>>> b/meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb
>>>> > similarity index 91%
>>>> > rename from meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
>>>> > rename to meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb
>>>> > index 5fa99821c4..872592fdae 100644
>>>> > --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
>>>> > +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb
>>>> > @@ -18,14 +18,11 @@ PROVIDES =3D "virtual/libsdl2"
>>>> >
>>>> >  SRC_URI =3D "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
>>>> >             file://more-gen-depends.patch \
>>>> > -           file://directfb-spurious-curly-brace-missing-e.patch \
>>>> > -           file://directfb-renderfillrect-fix.patch \
>>>> >  "
>>>> >
>>>> >  S =3D "${WORKDIR}/SDL2-${PV}"
>>>> >
>>>> > -SRC_URI[md5sum] =3D "783b6f2df8ff02b19bb5ce492b99c8ff"
>>>> > -SRC_URI[sha256sum] =3D
>>>> "349268f695c02efbc9b9148a70b85e58cefbbf704abd3e91be654db7f1e2c863"
>>>> > +SRC_URI[sha256sum] =3D
>>>> "d8215b571a581be1332d2106f8036fcb03d12a70bae01e20f424976d275432bc"
>>>> >
>>>> >  inherit autotools lib_package binconfig-disabled pkgconfig
>>>> >
>>>> > @@ -64,7 +61,6 @@ PACKAGECONFIG[jack]       =3D
>>>> "--enable-jack,--disable-jack,jack"
>>>> >  PACKAGECONFIG[kmsdrm]     =3D
>>>> "--enable-video-kmsdrm,--disable-video-kmsdrm,libdrm virtual/libgbm"
>>>> >  PACKAGECONFIG[opengl]     =3D
>>>> "--enable-video-opengl,--disable-video-opengl,virtual/libgl"
>>>> >  PACKAGECONFIG[pulseaudio] =3D
>>>> "--enable-pulseaudio,--disable-pulseaudio,pulseaudio"
>>>> > -PACKAGECONFIG[tslib]      =3D
>>>> "--enable-input-tslib,--disable-input-tslib,tslib"
>>>> >  PACKAGECONFIG[wayland]    =3D
>>>> "--enable-video-wayland,--disable-video-wayland,wayland-native waylan=
d
>>>> wayland-protocols libxkbcommon"
>>>> >  PACKAGECONFIG[x11]        =3D
>>>> "--enable-video-x11,--disable-video-x11,virtual/libx11 libxext libxra=
ndr
>>>> libxrender"
>>>> >
>>>> > --
>>>> > 2.29.2
>>>> >
>>>> >
>>>> >
>>>> >
>>>>
>>>
>>>
>>> --
>>> Yann Dirson <yann@blade-group.com>
>>> Blade / Shadow -- http://shadow.tech
>>>
>>>
>>>
>>>
>>>
>>
>>
>>
>=20
>
>

--000000000000a5210f05ba747215
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I digged a bit: I think libsdl 1.x might still have i=
t, but libsdl 2.x definitely does not.</div><div><br></div><div><br></div><=
div>Alex<br></div><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Wed, 3 Feb 2021 at 20:47, Alexander Kanavin via <a=
 href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;alex=
.kanavin=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@li=
sts.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div dir=3D"ltr"><div>It looks like tslib support was n=
ot in 2.0.12 version either, and probably was ripped out long time ago:</di=
v><div><a href=3D"http://hg.libsdl.org/SDL/rev/a708852dbd5c" target=3D"_bla=
nk">http://hg.libsdl.org/SDL/rev/a708852dbd5c</a></div><div><br></div><div>=
Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, 3 Feb 2021 at 18:05, Alexander Kanavin via <a href=
=
=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembedded.or=
g</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.openembedded.org=
" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>C=
ertainly not in oe-core please. This looks like a problem you need to take =
upstream, and until then do any downgrades via private layer.</div><div><br=
></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Wed, 3 Feb 2021 at 14:54, Yann Dirson &lt;<a h=
ref=3D"mailto:yann.dirson@blade-group.com" target=3D"_blank">yann.dirson@bl=
ade-group.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Le=C2=A0lun. 1 f=C3=A9vr. 2021 =C3=A0=C2=A020:11, Mark =
Jonas &lt;<a href=3D"mailto:toertel@gmail.com" target=3D"_blank">toertel@gm=
ail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Hi,<br>
<br>
tslib support is often relevant for embedded projects with simple<br>
(resistive) touch screens. Would it make sense to keep the 2.0.12<br>
recipe and offer both in parallel?<br></blockquote><div><br></div><div>=C2=
=
=A0What do others think ?</div><div><br></div><div>We could use a libsdl2.=
inc with the common stuff, of just keep the current 2.0.12</div><div>versio=
n as is.=C2=A0 Maybe even move the 2.0.12 recipe to meta-oe, where tslib se=
ems</div><div>to live nowadays, although that could make the recipe harder =
to find for those who</div><div>need it.</div><div><br></div><div>I&#39;d s=
uggest if that support is still needed, to approach libsdl upstream with a =
patch</div><div>restoring the tslib support ?=C2=A0 Maybe we could even car=
ry such a patch in yocto until</div><div>upstream does something ?=C2=A0 Th=
at could be better than just carying an old version.<br></div><div><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
Mark<br>
<br>
On Mon, Feb 1, 2021 at 11:23 AM Yann Dirson &lt;<a href=3D"mailto:yann.dir=
son@blade-group.com" target=3D"_blank">yann.dirson@blade-group.com</a>&gt; =
wrote:<br>
&gt;<br>
&gt; From: Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com" target=
=3D"_blank">yann@blade-group.com</a>&gt;<br>
&gt;<br>
&gt; This version does not support tslib any more, as can be seen by the<b=
r>
&gt; failed AUH run.<br>
&gt;<br>
&gt; Originally-by: Romain Roff=C3=A9 &lt;<a href=3D"mailto:romain.roffe@b=
lade-group.com" target=3D"_blank">romain.roffe@blade-group.com</a>&gt;<br>
&gt; Signed-off-by: Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com=
" target=3D"_blank">yann@blade-group.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../libsdl2/directfb-renderfillrect-fix.patch | 33 ------------=
-<br>
&gt;=C2=A0 ...ectfb-spurious-curly-brace-missing-e.patch | 49 ------------=
-------<br>
&gt;=C2=A0 .../{<a href=3D"http://libsdl2_2.0.12.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">libsdl2_2.0.12.bb</a> =3D&gt; <a href=3D"http://libsdl2_2.0=
.14.bb" rel=3D"noreferrer" target=3D"_blank">libsdl2_2.0.14.bb</a>}=C2=A0 |=
=
=C2=A0 6 +--<br>
&gt;=C2=A0 3 files changed, 1 insertion(+), 87 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/direct=
fb-renderfillrect-fix.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/direct=
fb-spurious-curly-brace-missing-e.patch<br>
&gt;=C2=A0 rename meta/recipes-graphics/libsdl2/{<a href=3D"http://libsdl2=
_2.0.12.bb" rel=3D"noreferrer" target=3D"_blank">libsdl2_2.0.12.bb</a> =3D&=
gt; <a href=3D"http://libsdl2_2.0.14.bb" rel=3D"noreferrer" target=3D"_blan=
k">libsdl2_2.0.14.bb</a>} (91%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfil=
lrect-fix.patch b/meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfill=
rect-fix.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 83d4f4b1ec..0000000000<br>
&gt; --- a/meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-f=
ix.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,33 +0,0 @@<br>
&gt; -# HG changeset patch<br>
&gt; -# User Sam Lantinga &lt;<a href=3D"mailto:slouken@libsdl.org" target=
=
=3D"_blank">slouken@libsdl.org</a>&gt;<br>
&gt; -# Date 1590793369 25200<br>
&gt; -# Node ID a90089f75990e8b07a1dcf931c5f8a580ae343bf<br>
&gt; -# Parent=C2=A0 a9b4bd264f3cbedc4f3287b3ec6b32311370ba85<br>
&gt; -Fixed bug 5146 - SDL_RenderFillRect doesn&#39;t work in DirectFB<br>
&gt; -<br>
&gt; -Lacky<br>
&gt; -<br>
&gt; -It looks like refactoring of SDL2 internal API has broken SDL_Render=
FillRect for DirectFB. In new version function SDL_RenderFillRect returns 0=
, but rectangle is not visible.<br>
&gt; -<br>
&gt; -Replacing &quot;count&quot; with &quot;len&quot; in the argument lis=
t for SDL_memcpy in DirectFB_QueueFillRects fixes problem.<br>
&gt; -<br>
&gt; ---<br>
&gt; -<br>
&gt; -The patch was imported from the libsdl Mercurial repository<br>
&gt; -(<a href=3D"https://hg.libsdl.org/SDL" rel=3D"noreferrer" target=3D"=
_blank">https://hg.libsdl.org/SDL</a>) as of changeset id a90089f75990.<br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -<br>
&gt; -Signed-off-by: Mark Jonas &lt;<a href=3D"mailto:toertel@gmail.com" t=
arget=3D"_blank">toertel@gmail.com</a>&gt;<br>
&gt; -<br>
&gt; -diff -r a9b4bd264f3c -r a90089f75990 src/video/directfb/SDL_DirectFB=
_render.c<br>
&gt; ---- a/src/video/directfb/SDL_DirectFB_render.c Thu May 21 00:06:09 2=
020 -0400<br>
&gt; -+++ b/src/video/directfb/SDL_DirectFB_render.c Fri May 29 16:02:49 2=
020 -0700<br>
&gt; -@@ -626,7 +626,7 @@<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0cmd-&gt;data.draw.count =3D count;<br>
&gt; --=C2=A0 =C2=A0 SDL_memcpy(verts, rects, count);<br>
&gt; -+=C2=A0 =C2=A0 SDL_memcpy(verts, rects, len);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; - }<br>
&gt; diff --git a/meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-=
curly-brace-missing-e.patch b/meta/recipes-graphics/libsdl2/libsdl2/directf=
b-spurious-curly-brace-missing-e.patch<br>
&gt; deleted file mode 100644<br>
&gt; index aa351a89ba..0000000000<br>
&gt; --- a/meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-curly-b=
race-missing-e.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,49 +0,0 @@<br>
&gt; -# HG changeset patch<br>
&gt; -# User Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail=
.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
&gt; -# Date 1585069551 25200<br>
&gt; -# Node ID 769f800952179633ec6c3e6bc1bc1d40e401750a<br>
&gt; -# Parent=C2=A0 63387e8920f58f608288f247824ec5f4c286691f<br>
&gt; -src/video/directfb/SDL_DirectFB_render.c: fix build<br>
&gt; -Build with directfb is broken due to a spurious &#39;}&#39; and a mi=
ssing &#39;E&#39;<br>
&gt; -since version 2.0.12 and <a href=3D"https://hg.libsdl.org/SDL/rev/2d=
5b5a5ccbfb" rel=3D"noreferrer" target=3D"_blank">https://hg.libsdl.org/SDL/=
rev/2d5b5a5ccbfb</a>:<br>
&gt; -<br>
&gt; -/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/=
src/video/directfb/SDL_DirectFB_render.c: In function &#39;SetBlendMode&#39=
;:<br>
&gt; -/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/=
src/video/directfb/SDL_DirectFB_render.c:202:9: error: case label not withi=
n a switch statement<br>
&gt; -=C2=A0 202 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case SDL_BLENDMODE_MUL=
:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~<br>
&gt; -<br>
&gt; -/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/=
src/video/directfb/SDL_DirectFB_render.c:205:67: error: &#39;DSBF_DSTCOLOR&=
#39; undeclared (first use in this function); did you mean &#39;DSBF_DESTCO=
LOR&#39;?<br>
&gt; -=C2=A0 205 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SDL_DFB_=
CHECK(destsurf-&gt;SetSrcBlendFunction(destsurf, DSBF_DSTCOLOR));<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~<br>
&gt; -<br>
&gt; -Fixes:<br>
&gt; - - <a href=3D"http://autobuild.buildroot.org/results/83ccefee68c2800=
c0544e6f40fa8bc8ee6b67b77" rel=3D"noreferrer" target=3D"_blank">http://auto=
build.buildroot.org/results/83ccefee68c2800c0544e6f40fa8bc8ee6b67b77</a><br=
>
&gt; -<br>
&gt; -Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabri=
ce@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
&gt; -<br>
&gt; ---<br>
&gt; -<br>
&gt; -The patch was imported from the libsdl Mercurial repository<br>
&gt; -(<a href=3D"https://hg.libsdl.org/SDL" rel=3D"noreferrer" target=3D"=
_blank">https://hg.libsdl.org/SDL</a>) as of changeset id 769f80095217.<br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -<br>
&gt; -Signed-off-by: Mark Jonas &lt;<a href=3D"mailto:toertel@gmail.com" t=
arget=3D"_blank">toertel@gmail.com</a>&gt;<br>
&gt; -<br>
&gt; -<br>
&gt; -diff -r 63387e8920f5 -r 769f80095217 src/video/directfb/SDL_DirectFB=
_render.c<br>
&gt; ---- a/src/video/directfb/SDL_DirectFB_render.c Mon Mar 23 14:10:25 2=
020 -0700<br>
&gt; -+++ b/src/video/directfb/SDL_DirectFB_render.c Tue Mar 24 10:05:51 2=
020 -0700<br>
&gt; -@@ -198,11 +198,10 @@<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SDL_DFB_CHECK(destsu=
rf-&gt;SetDstBlendFunction(destsurf, DSBF_SRCCOLOR));<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case SDL_BLENDMODE_MUL:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;blitFlags =
=3D DSBLIT_BLEND_ALPHACHANNEL;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;drawFlags =
=3D DSDRAW_BLEND;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SDL_DFB_CHECK(destsurf-&g=
t;SetSrcBlendFunction(destsurf, DSBF_DSTCOLOR));<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SDL_DFB_CHECK(destsurf-&g=
t;SetSrcBlendFunction(destsurf, DSBF_DESTCOLOR));<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SDL_DFB_CHECK(destsu=
rf-&gt;SetDstBlendFunction(destsurf, DSBF_INVSRCALPHA));<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; diff --git a/meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_=
2.0.12.bb" rel=3D"noreferrer" target=3D"_blank">libsdl2_2.0.12.bb</a> b/met=
a/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.14.bb" rel=3D"nore=
ferrer" target=3D"_blank">libsdl2_2.0.14.bb</a><br>
&gt; similarity index 91%<br>
&gt; rename from meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2=
.0.12.bb" rel=3D"noreferrer" target=3D"_blank">libsdl2_2.0.12.bb</a><br>
&gt; rename to meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0=
.14.bb" rel=3D"noreferrer" target=3D"_blank">libsdl2_2.0.14.bb</a><br>
&gt; index 5fa99821c4..872592fdae 100644<br>
&gt; --- a/meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.12.=
bb" rel=3D"noreferrer" target=3D"_blank">libsdl2_2.0.12.bb</a><br>
&gt; +++ b/meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.14.=
bb" rel=3D"noreferrer" target=3D"_blank">libsdl2_2.0.14.bb</a><br>
&gt; @@ -18,14 +18,11 @@ PROVIDES =3D &quot;virtual/libsdl2&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"http://www.libsdl.org/release/SDL2=
-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://www.libsdl.o=
rg/release/SDL2-${PV}.tar.gz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://more-gen-depend=
s.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://directfb-spurious-cu=
rly-brace-missing-e.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://directfb-renderfillr=
ect-fix.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/SDL2-${PV}&quot;<br>
&gt;<br>
&gt; -SRC_URI[md5sum] =3D &quot;783b6f2df8ff02b19bb5ce492b99c8ff&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;349268f695c02efbc9b9148a70b85e58cefbbf7=
04abd3e91be654db7f1e2c863&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;d8215b571a581be1332d2106f8036fcb03d12a7=
0bae01e20f424976d275432bc&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit autotools lib_package binconfig-disabled pkgconfig<br>
&gt;<br>
&gt; @@ -64,7 +61,6 @@ PACKAGECONFIG[jack]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &=
quot;--enable-jack,--disable-jack,jack&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[kmsdrm]=C2=A0 =C2=A0 =C2=A0=3D &quot;--enable-vid=
eo-kmsdrm,--disable-video-kmsdrm,libdrm virtual/libgbm&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[opengl]=C2=A0 =C2=A0 =C2=A0=3D &quot;--enable-vid=
eo-opengl,--disable-video-opengl,virtual/libgl&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[pulseaudio] =3D &quot;--enable-pulseaudio,--disab=
le-pulseaudio,pulseaudio&quot;<br>
&gt; -PACKAGECONFIG[tslib]=C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable-input-ts=
lib,--disable-input-tslib,tslib&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[wayland]=C2=A0 =C2=A0 =3D &quot;--enable-video-wa=
yland,--disable-video-wayland,wayland-native wayland wayland-protocols libx=
kbcommon&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[x11]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;--enabl=
e-video-x11,--disable-video-x11,virtual/libx11 libxext libxrandr libxrender=
&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.29.2<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Yann Dirs=
on &lt;<a href=3D"mailto:yann@blade-group.com" target=3D"_blank">yann@blade=
-group.com</a>&gt;<br>Blade / Shadow -- <a href=3D"http://shadow.tech" targ=
et=3D"_blank">http://shadow.tech</a><br><br></div></div>
<br>
<br>
<br>
</blockquote></div>
<br>
<br>
<br>
</blockquote></div>
<br>
<br>
<br>
</blockquote></div>

--000000000000a5210f05ba747215--
