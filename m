Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D7E7C433F5
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 18:53:21 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web12.80949.1638298400620437159
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 10:53:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A3u03BEH;
 spf=pass (domain: gmail.com, ip: 209.85.222.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f45.google.com with SMTP id y5so43525106ual.7
        for <Openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 10:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VylwGR0TxmA0Q+pfbB7F8ylqvbeYS3ZtEJ0BVGTyOrM=;
        b=A3u03BEHVTlZkcN4wokOphXsL1wN1ur0/74fReFRmyk2Q7fRgmZ2z5wtc7eELq5eFJ
         r8O3m8HJr9KxB6g3mqIU8fj7eo342gB8R8MWAfabWWEPEfaIQHNLiprr4bBRJXBIx8aX
         AqVxD+iTKrU3MJfAACbBeTachafbhTkGCmSBNBR1FGFCFU/gnLknrYML9/YHf0PyzHH+
         eJX6bjylTDXO261v/97znYSNJXp7E1N9kH10QcpR0sWyQnpEVVOlfzRS82uiJX/x4U12
         HTgXGnnECXpAKy/b7NiJKNWspJMciDQVEb84lMetZC/RoXg62F6FZA+XkEdic8aosY7G
         3ktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VylwGR0TxmA0Q+pfbB7F8ylqvbeYS3ZtEJ0BVGTyOrM=;
        b=GXbLXeUZcKJvYQfmpK7DuG+4ApwwmqbBDHz/aWWauuj5g9DG7MWxxBkqQr7X0HzGO/
         dizEQbujmGjqNMDsLdblA0ui9gg5zqCdYwWxAPr8pQh/P9H5dcDXrdGc54A/3DZuQiPM
         Bza9N41vP2aaXB9V1dX1ZUuw2qGcXJbx8o9oSUltaS5ir9tVj5C75rZWHB4Wfp/Ty0i6
         5Rw+t/qQ0xEMS9tEk4MBVt0WbDHOzu6Zu4eBTGZz9l9sdPGxDH2WgNwQG1MRzG/ueE1+
         NG5zvx+YT/hOVPFp7GAIPznhmhdCPhPSXHFQqEePdUa64JMn/rpa2cVwnIXEa5nojaZT
         sp8Q==
X-Gm-Message-State: AOAM530XbVgMMbHOua8eXdH22ky1styx8E4+vyQx9PGWGt3fV0W5pjLK
	/ZICjHkCZ/btEA5CzU1hO8kaHpPDyVrZ880klA4=
X-Google-Smtp-Source: 
 ABdhPJxaya2g+wlYr9UuNHpVTPUjtMkUZavg59gM1NV9Redho4FEq4uv4xdwS62GuJ6UwkdF29Jut7NZc1mlabi3ywQ=
X-Received: by 2002:a05:6102:38d4:: with SMTP id
 k20mr1112040vst.42.1638298399715;
 Tue, 30 Nov 2021 10:53:19 -0800 (PST)
MIME-Version: 1.0
References: 
 <CABKMkPJoE74O2OnAe7WsLSu56Ww4ZfPfxksZ43-Np43otAhRWA@mail.gmail.com>
 <CANNYZj-DYfd_erYQYNzATL5K_rUMfDrrvzsWD2h0n_=_kXTBxA@mail.gmail.com>
 <CABKMkP+1pDhZqzGwz-6baUnhEhsOopGonP5d7njNJ0WxsfgLEA@mail.gmail.com>
In-Reply-To: 
 <CABKMkP+1pDhZqzGwz-6baUnhEhsOopGonP5d7njNJ0WxsfgLEA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 30 Nov 2021 19:53:08 +0100
Message-ID: 
 <CANNYZj8+jV09y-p1Fciw6xY_PHabj1DtEdG0ywxGpBOgHrUoyw@mail.gmail.com>
Subject: Re: [OE-core] [RFC] meson needs a pkg-config wrapper script
To: Joel Winarske <joel.winarske@gmail.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000026b41005d20612ef"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Nov 2021 18:53:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158987

--00000000000026b41005d20612ef
Content-Type: text/plain; charset="UTF-8"

I do not quite understand the use case. What is being done with the full
path to the header?

Alex

On Tue, 30 Nov 2021 at 19:26, Joel Winarske <joel.winarske@gmail.com> wrote:

> This pattern works to get the absolute path of the header:
>
> Yocto
>
>     EXTRA_OEMESON += "--prefix ${STAGING_DIR_TARGET}/usr"
>
> Meson
>
>     vulkan_dep = dependency('vulkan')
>     vulkan_hpp = join_paths([
>         vulkan_dep.get_pkgconfig_variable('includedir', define_variable:
> ['prefix', get_option('prefix')]),
>         'vulkan',
>         'vulkan.hpp'
>         ])
>
> Implementation in build/meson-log.txt
>
> Called
> `/b/github-ci/_work/meta-flutter/rpi4-drm-honister-latest/rpi4/tmp/work/cortexa72-poky-linux/vkmark/git-r0/recipe-sysroot-native/usr/bin/pkg-config
> --define-variable=prefix=/b/github-ci/_work/meta-flutter/rpi4-drm-honister-latest/rpi4/tmp/work/cortexa72-poky-linux/vkmark/git-r0/recipe-sysroot/usr
> --variable=includedir vulkan` -> 0
>
>
> One would expect the following meson to work if STAGING_DIR_TARGET were
> set, as that's how pkg-config works:
>
>     vulkan_dep = dependency('vulkan')
>     vulkan_hpp = join_paths([
>         vulkan_dep.get_pkgconfig_variable('includedir'),
>         'vulkan',
>         'vulkan.hpp'
>         ])
>
> This will always return /usr/include/vulkan/vulkan.hpp regardless of
> PKG_CONFIG_SYSROOT_DIR value.  With PKG_CONFIG_SYSROOT_DIR set, it should
> be /usr/include/vulkan/vulkan.hpp with prepend of PKG_CONFIG_SYSROOT_DIR
> value.
>
>
> Sandbox testing of pkg-config
>
>     $ export
> STAGING_DIR_TARGET=/b/github-ci/_work/meta-flutter/rpi4-drm-honister-latest/raspberrypi4-64/tmp/work/cortexa72-poky-linux/vkmark/git-r0/recipe-sysroot
>     $ PKG_CONFIG_SYSROOT_DIR=$STAGING_DIR_TARGET pkg-config
> --define-variable=prefix=/opt --variable=includedir vulkan
>
> /b/github-ci/_work/meta-flutter/rpi4-drm-honister-latest/raspberrypi4-64/tmp/work/cortexa72-poky-linux/vkmark/git-r0/recipe-sysroot/opt/include
>
>
> meson.cross
>
> Setting sys_root in the properties section of meson.cross (patching
> meson.bbclass) indirectly sets PKG_CONFIG_SYSROOT_DIR.  The setting of
> sys_root is present in nativesdk_meson*.bb, not meson*.bb.
>
> The issue for meson is that they are not passing the
> PKG_CONFIG_SYSROOT_DIR variable to the shell that launches pkg-config.
>
> My proposed work around (this email thread) would fix the behavior.  I
> believe the proper fix is for meson to address upstream.  Still waiting on
> a response from them: https://github.com/mesonbuild/meson/issues/9674
>
>
> Joel
>
> On Tue, Nov 30, 2021 at 9:49 AM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> On Tue, 30 Nov 2021 at 18:20, Joel Winarske <joel.winarske@gmail.com>
>> wrote:
>>
>>> Meson does not expose PKG_CONFIG_SYSROOT_DIR to the pkg-config process.
>>>
>>> Currently meson.cross as generated in meson.bbclass points directly to
>>> the pkg-config executable (no wrapper script).
>>>
>>> PKG_CONFIG_SYSROOT_DIR behaves like a simple string prepend to all
>>> package config variable queries.  So if you want to determine the absolute
>>> path of a variable in .pc you set PKG_CONFIG_SYSROOT_DIR and make your
>>> query.  Currently this is not possible with Yocto+Meson.
>>>
>>> I think a simple wrapper script would resolve this.  This is from
>>> https://autotools.io/pkgconfig/cross-compiling.html:
>>>
>>> #!/bin/sh
>>>
>>> SYSROOT=/build/root
>>>
>>> export PKG_CONFIG_PATH=
>>> export PKG_CONFIG_LIBDIR=${SYSROOT}/usr/lib/pkgconfig:${SYSROOT}/usr/share/pkgconfig
>>> export PKG_CONFIG_SYSROOT_DIR=${SYSROOT}
>>>
>>> exec pkg-config "$@"
>>>
>>>
>>> The wrapper script would be generated per recipe via meson.bbclass,
>>> meson.cross would then reference this wrapper instead of the pkg-config
>>> executable.
>>>
>>> Thoughts?
>>>
>>
>> I don't think this is correct. Meson's way of doing things is that you
>> are not supposed to get the include/library paths directly from pkg-config,
>> but rather use
>> https://mesonbuild.com/Reference-manual_functions.html#dependency and
>> meson will take care of any needed prefixes to the paths.
>>
>> For the custom variables defined in .pc that happen to contain paths,
>> PKG_CONFIG_SYSROOT_DIR has no effect at all, so you need to manually
>> prepend it anyway everywhere where they're used. pkg-config does not know
>> what variable is a path and what isn't.
>>
>> Alex
>>
>

--00000000000026b41005d20612ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I do not quite understand the use case. What is being=
 done with the full path to the header?</div><div><br></div><div>Alex<br></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Tue, 30 Nov 2021 at 19:26, Joel Winarske &lt;<a href=3D"mailto:joel.=
winarske@gmail.com">joel.winarske@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>This patte=
rn works to get the absolute path of the header:<br></div><div><br></div><d=
iv></div><div>Yocto</div><br>=C2=A0 =C2=A0 EXTRA_OEMESON +=3D &quot;--prefi=
x ${STAGING_DIR_TARGET}/usr&quot;<br><br><div></div><div>Meson</div><br>=C2=
=A0 =C2=A0 vulkan_dep =3D dependency(&#39;vulkan&#39;)<br>=C2=A0 =C2=A0 vul=
kan_hpp =3D join_paths([<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 vulkan_dep.get_pkgc=
onfig_variable(&#39;includedir&#39;, define_variable: [&#39;prefix&#39;, ge=
t_option(&#39;prefix&#39;)]),<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;vulkan&#3=
9;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;vulkan.hpp&#39;<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ])<br><br><div></div><div>Implementation in build/meson-log.t=
xt</div><br><div>Called `/b/github-ci/_work/meta-flutter/rpi4-drm-honister-=
latest/rpi4/tmp/work/cortexa72-poky-linux/vkmark/git-r0/recipe-sysroot-nati=
ve/usr/bin/pkg-config --define-variable=3Dprefix=3D/b/github-ci/_work/meta-=
flutter/rpi4-drm-honister-latest/rpi4/tmp/work/cortexa72-poky-linux/vkmark/=
git-r0/recipe-sysroot/usr --variable=3Dincludedir vulkan` -&gt; 0</div><div=
><br></div><div><br></div><div>One would expect the following meson to work=
 if STAGING_DIR_TARGET were set, as that&#39;s how pkg-config works:<br></d=
iv><div><br></div><div>=C2=A0 =C2=A0 vulkan_dep =3D dependency(&#39;vulkan&=
#39;)<br>=C2=A0 =C2=A0 vulkan_hpp =3D join_paths([<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 vulkan_dep.get_pkgconfig_variable(&#39;includedir&#39;),<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;vulkan&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;=
vulkan.hpp&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 ])</div><div><br></div><div>=
This will always return /usr/include/vulkan/vulkan.hpp regardless of PKG_CO=
NFIG_SYSROOT_DIR value.=C2=A0 With PKG_CONFIG_SYSROOT_DIR set, it should be=
 /usr/include/vulkan/vulkan.hpp with prepend of PKG_CONFIG_SYSROOT_DIR valu=
e.<br></div><div><br></div><div><br></div><div>Sandbox testing of pkg-confi=
g</div><div><br></div><div>=C2=A0=C2=A0=C2=A0 $ export STAGING_DIR_TARGET=
=3D/b/github-ci/_work/meta-flutter/rpi4-drm-honister-latest/raspberrypi4-64=
/tmp/work/cortexa72-poky-linux/vkmark/git-r0/recipe-sysroot<br>=C2=A0=C2=A0=
=C2=A0 $ PKG_CONFIG_SYSROOT_DIR=3D$STAGING_DIR_TARGET pkg-config --define-v=
ariable=3Dprefix=3D/opt --variable=3Dincludedir vulkan<br>/b/github-ci/_wor=
k/meta-flutter/rpi4-drm-honister-latest/raspberrypi4-64/tmp/work/cortexa72-=
poky-linux/vkmark/git-r0/recipe-sysroot/opt/include</div><div><br></div><di=
v><br></div><div>meson.cross</div><div><br></div><div>Setting sys_root in t=
he properties section of meson.cross (patching meson.bbclass) indirectly se=
ts PKG_CONFIG_SYSROOT_DIR.=C2=A0 The setting of sys_root is present in nati=
vesdk_meson*.bb, not meson*.bb.<br></div><div><br></div><div>The issue for =
meson is that they are not passing the PKG_CONFIG_SYSROOT_DIR variable to t=
he shell that launches pkg-config.<br></div><div></div><br><div>My proposed=
 work around (this email thread) would fix the behavior.=C2=A0 I believe th=
e proper fix is for meson to address upstream.=C2=A0 Still waiting on a res=
ponse from them: <a href=3D"https://github.com/mesonbuild/meson/issues/9674=
" target=3D"_blank">https://github.com/mesonbuild/meson/issues/9674</a></di=
v><div><br></div><div><br></div><div>Joel<br></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 30, 2021 at =
9:49 AM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" tar=
get=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 30 Nov 2021 at 18:20, J=
oel Winarske &lt;<a href=3D"mailto:joel.winarske@gmail.com" target=3D"_blan=
k">joel.winarske@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr"><div><div>Meson does not expose =
PKG_CONFIG_SYSROOT_DIR to the pkg-config process.</div></div><div><br></div=
><div>Currently meson.cross as generated in meson.bbclass points directly t=
o the pkg-config executable (no wrapper script).</div><div><br></div><div>P=
KG_CONFIG_SYSROOT_DIR behaves like a simple string prepend to all package c=
onfig variable queries.=C2=A0 So if you want to determine the absolute path=
 of a variable in .pc you set PKG_CONFIG_SYSROOT_DIR and make your query.=
=C2=A0 Currently this is not possible with Yocto+Meson.<br></div><div><br><=
/div>I think a simple wrapper script would resolve this.=C2=A0 This is from=
 <a href=3D"https://autotools.io/pkgconfig/cross-compiling.html" target=3D"=
_blank">https://autotools.io/pkgconfig/cross-compiling.html</a>:<br><div><p=
re>#!/bin/sh

SYSROOT=3D/build/root

export PKG_CONFIG_PATH=3D
export PKG_CONFIG_LIBDIR=3D${SYSROOT}/usr/lib/pkgconfig:${SYSROOT}/usr/shar=
e/pkgconfig
export PKG_CONFIG_SYSROOT_DIR=3D${SYSROOT}

exec pkg-config &quot;$@&quot;</pre></div><div><br></div><div>The wrapper s=
cript would be generated per recipe via meson.bbclass, meson.cross would th=
en reference this wrapper instead of the pkg-config executable.<br></div><d=
iv><br></div><div>Thoughts?<br></div></div></blockquote><div><br></div>I do=
n&#39;t think this is correct. Meson&#39;s way of doing things is that you =
are not supposed to get the include/library paths directly from pkg-config,=
 but rather use</div><div class=3D"gmail_quote"><a href=3D"https://mesonbui=
ld.com/Reference-manual_functions.html#dependency" target=3D"_blank">https:=
//mesonbuild.com/Reference-manual_functions.html#dependency</a> and meson w=
ill take care of any needed prefixes to the paths.</div><div class=3D"gmail=
_quote"><br></div><div class=3D"gmail_quote">For the custom variables defin=
ed in .pc that happen to contain paths, PKG_CONFIG_SYSROOT_DIR has no effec=
t at all, so you need to manually prepend it anyway everywhere where they&#=
39;re used. pkg-config does not know what variable is a path and what isn&#=
39;t.<br></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quo=
te">Alex<br></div></div>
</blockquote></div>
</blockquote></div>

--00000000000026b41005d20612ef--

