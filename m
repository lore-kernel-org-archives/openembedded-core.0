Return-Path: <joel.winarske@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B92C433F5
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 18:26:02 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web09.80875.1638296761428532438
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 10:26:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KtcyAsj6;
 spf=pass (domain: gmail.com, ip: 209.85.222.52,
 mailfrom: joel.winarske@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id w23so43368688uao.5
        for <Openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 10:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1fdYzN1u9YGyO5aeWk3sdX/1zkoKuSBbFreuPgjedfY=;
        b=KtcyAsj6norOFHsWCwQtlVWKYm/+IPNhTvQAC3ZO4TEy1KXSCCqaaOE6hdmGPHamJm
         i0ZBMM20CVm88xbRGeahAyhb1rDJl6U4i1vtobxx+D+JoLYxcN2Y1mw8AfDUrf5KObgh
         b5+lxhJ3/smnUmr9lWzooKsijxrhDErwP7WWmL/hNQHq2gTNl3zw+9BMYik3qzjXGAGy
         ovQJaDjVj/m0nLT/GPVBH7ETJivUUo4e3b0Pk7F6Pj9dBeBCrZI7gvTVBnq9u7MR15WC
         T3mvVXYdfgYxM2v9//l1umUTOic6FdlFRH3FnyRX1zTetRE09cdIwL+Wmy+v4g1/h8Q6
         hy+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1fdYzN1u9YGyO5aeWk3sdX/1zkoKuSBbFreuPgjedfY=;
        b=mXgrKadThQO3cUrj7cV+yoyyput0TyfGI0TbrhW1rcl9hBDxLrNLlhCxGqkOlwppNM
         aymk5sagGDvJh3/W1ylUXI7XCeFyM5wL5IcsPlidBfti5wELHOqXp9RSjELDBsDWvtK9
         dXuM0rbW7tKh4iRp/OY2rucllOktHWH0m5093FE5owRnmqHdT3i+UdAYrvIgcCaVlkeA
         8bqOTVmCCiX/FS42yLwqPdRvdDvfGNl5sqaDyGj5yU4YGH37dMxdWEwvgYB26eKsB4M0
         DtiizSPKuRt0POHsZuZnorI2dGwhfmEOx+2uxKGmO2jlBZeRzeIoXrvz8tL8hNSaRBig
         xtPg==
X-Gm-Message-State: AOAM5316Z2/xKibCxe63XdNKOM4R1EqK0wmaRBM2IR1cp+LRd4GJ1G+y
	yX86Kj0V6N2uukiAbrgkhn2pi7xV4lnLUUeLu3Q=
X-Google-Smtp-Source: 
 ABdhPJwQEKfvsaRdtNVzEkbPLfhqB9OD3vNbpHvKL8ZHl5jpJ77RwsK0Wq1yDwqewC1YHCMNP9xQg8rsusd8DpRTc8E=
X-Received: by 2002:a05:6102:c4e:: with SMTP id
 y14mr1349857vss.61.1638296760430;
 Tue, 30 Nov 2021 10:26:00 -0800 (PST)
MIME-Version: 1.0
References: 
 <CABKMkPJoE74O2OnAe7WsLSu56Ww4ZfPfxksZ43-Np43otAhRWA@mail.gmail.com>
 <CANNYZj-DYfd_erYQYNzATL5K_rUMfDrrvzsWD2h0n_=_kXTBxA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-DYfd_erYQYNzATL5K_rUMfDrrvzsWD2h0n_=_kXTBxA@mail.gmail.com>
From: Joel Winarske <joel.winarske@gmail.com>
Date: Tue, 30 Nov 2021 10:25:49 -0800
Message-ID: 
 <CABKMkP+1pDhZqzGwz-6baUnhEhsOopGonP5d7njNJ0WxsfgLEA@mail.gmail.com>
Subject: Re: [OE-core] [RFC] meson needs a pkg-config wrapper script
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007134e105d205b01c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Nov 2021 18:26:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158986

--0000000000007134e105d205b01c
Content-Type: text/plain; charset="UTF-8"

This pattern works to get the absolute path of the header:

Yocto

    EXTRA_OEMESON += "--prefix ${STAGING_DIR_TARGET}/usr"

Meson

    vulkan_dep = dependency('vulkan')
    vulkan_hpp = join_paths([
        vulkan_dep.get_pkgconfig_variable('includedir', define_variable:
['prefix', get_option('prefix')]),
        'vulkan',
        'vulkan.hpp'
        ])

Implementation in build/meson-log.txt

Called
`/b/github-ci/_work/meta-flutter/rpi4-drm-honister-latest/rpi4/tmp/work/cortexa72-poky-linux/vkmark/git-r0/recipe-sysroot-native/usr/bin/pkg-config
--define-variable=prefix=/b/github-ci/_work/meta-flutter/rpi4-drm-honister-latest/rpi4/tmp/work/cortexa72-poky-linux/vkmark/git-r0/recipe-sysroot/usr
--variable=includedir vulkan` -> 0


One would expect the following meson to work if STAGING_DIR_TARGET were
set, as that's how pkg-config works:

    vulkan_dep = dependency('vulkan')
    vulkan_hpp = join_paths([
        vulkan_dep.get_pkgconfig_variable('includedir'),
        'vulkan',
        'vulkan.hpp'
        ])

This will always return /usr/include/vulkan/vulkan.hpp regardless of
PKG_CONFIG_SYSROOT_DIR value.  With PKG_CONFIG_SYSROOT_DIR set, it should
be /usr/include/vulkan/vulkan.hpp with prepend of PKG_CONFIG_SYSROOT_DIR
value.


Sandbox testing of pkg-config

    $ export
STAGING_DIR_TARGET=/b/github-ci/_work/meta-flutter/rpi4-drm-honister-latest/raspberrypi4-64/tmp/work/cortexa72-poky-linux/vkmark/git-r0/recipe-sysroot
    $ PKG_CONFIG_SYSROOT_DIR=$STAGING_DIR_TARGET pkg-config
--define-variable=prefix=/opt --variable=includedir vulkan
/b/github-ci/_work/meta-flutter/rpi4-drm-honister-latest/raspberrypi4-64/tmp/work/cortexa72-poky-linux/vkmark/git-r0/recipe-sysroot/opt/include


meson.cross

Setting sys_root in the properties section of meson.cross (patching
meson.bbclass) indirectly sets PKG_CONFIG_SYSROOT_DIR.  The setting of
sys_root is present in nativesdk_meson*.bb, not meson*.bb.

The issue for meson is that they are not passing the PKG_CONFIG_SYSROOT_DIR
variable to the shell that launches pkg-config.

My proposed work around (this email thread) would fix the behavior.  I
believe the proper fix is for meson to address upstream.  Still waiting on
a response from them: https://github.com/mesonbuild/meson/issues/9674


Joel

On Tue, Nov 30, 2021 at 9:49 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Tue, 30 Nov 2021 at 18:20, Joel Winarske <joel.winarske@gmail.com>
> wrote:
>
>> Meson does not expose PKG_CONFIG_SYSROOT_DIR to the pkg-config process.
>>
>> Currently meson.cross as generated in meson.bbclass points directly to
>> the pkg-config executable (no wrapper script).
>>
>> PKG_CONFIG_SYSROOT_DIR behaves like a simple string prepend to all
>> package config variable queries.  So if you want to determine the absolute
>> path of a variable in .pc you set PKG_CONFIG_SYSROOT_DIR and make your
>> query.  Currently this is not possible with Yocto+Meson.
>>
>> I think a simple wrapper script would resolve this.  This is from
>> https://autotools.io/pkgconfig/cross-compiling.html:
>>
>> #!/bin/sh
>>
>> SYSROOT=/build/root
>>
>> export PKG_CONFIG_PATH=
>> export PKG_CONFIG_LIBDIR=${SYSROOT}/usr/lib/pkgconfig:${SYSROOT}/usr/share/pkgconfig
>> export PKG_CONFIG_SYSROOT_DIR=${SYSROOT}
>>
>> exec pkg-config "$@"
>>
>>
>> The wrapper script would be generated per recipe via meson.bbclass,
>> meson.cross would then reference this wrapper instead of the pkg-config
>> executable.
>>
>> Thoughts?
>>
>
> I don't think this is correct. Meson's way of doing things is that you are
> not supposed to get the include/library paths directly from pkg-config, but
> rather use
> https://mesonbuild.com/Reference-manual_functions.html#dependency and
> meson will take care of any needed prefixes to the paths.
>
> For the custom variables defined in .pc that happen to contain paths,
> PKG_CONFIG_SYSROOT_DIR has no effect at all, so you need to manually
> prepend it anyway everywhere where they're used. pkg-config does not know
> what variable is a path and what isn't.
>
> Alex
>

--0000000000007134e105d205b01c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This pattern works to get the absolute path of the he=
ader:<br></div><div><br></div><div></div><div>Yocto</div><br>=C2=A0 =C2=A0 =
EXTRA_OEMESON +=3D &quot;--prefix ${STAGING_DIR_TARGET}/usr&quot;<br><br><d=
iv></div><div>Meson</div><br>=C2=A0 =C2=A0 vulkan_dep =3D dependency(&#39;v=
ulkan&#39;)<br>=C2=A0 =C2=A0 vulkan_hpp =3D join_paths([<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 vulkan_dep.get_pkgconfig_variable(&#39;includedir&#39;, defin=
e_variable: [&#39;prefix&#39;, get_option(&#39;prefix&#39;)]),<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;vulkan&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;=
vulkan.hpp&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br><br><div></div><div>Im=
plementation in build/meson-log.txt</div><br><div>Called `/b/github-ci/_wor=
k/meta-flutter/rpi4-drm-honister-latest/rpi4/tmp/work/cortexa72-poky-linux/=
vkmark/git-r0/recipe-sysroot-native/usr/bin/pkg-config --define-variable=3D=
prefix=3D/b/github-ci/_work/meta-flutter/rpi4-drm-honister-latest/rpi4/tmp/=
work/cortexa72-poky-linux/vkmark/git-r0/recipe-sysroot/usr --variable=3Dinc=
ludedir vulkan` -&gt; 0</div><div><br></div><div><br></div><div>One would e=
xpect the following meson to work if STAGING_DIR_TARGET were set, as that&#=
39;s how pkg-config works:<br></div><div><br></div><div>=C2=A0 =C2=A0 vulka=
n_dep =3D dependency(&#39;vulkan&#39;)<br>=C2=A0 =C2=A0 vulkan_hpp =3D join=
_paths([<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 vulkan_dep.get_pkgconfig_variable(&=
#39;includedir&#39;),<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;vulkan&#39;,<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;vulkan.hpp&#39;<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ])</div><div><br></div><div>This will always return /usr/include/vul=
kan/vulkan.hpp regardless of PKG_CONFIG_SYSROOT_DIR value.=C2=A0 With PKG_C=
ONFIG_SYSROOT_DIR set, it should be /usr/include/vulkan/vulkan.hpp with pre=
pend of PKG_CONFIG_SYSROOT_DIR value.<br></div><div><br></div><div><br></di=
v><div>Sandbox testing of pkg-config</div><div><br></div><div>=C2=A0=C2=A0=
=C2=A0 $ export STAGING_DIR_TARGET=3D/b/github-ci/_work/meta-flutter/rpi4-d=
rm-honister-latest/raspberrypi4-64/tmp/work/cortexa72-poky-linux/vkmark/git=
-r0/recipe-sysroot<br>=C2=A0=C2=A0=C2=A0 $ PKG_CONFIG_SYSROOT_DIR=3D$STAGIN=
G_DIR_TARGET pkg-config --define-variable=3Dprefix=3D/opt --variable=3Dincl=
udedir vulkan<br>/b/github-ci/_work/meta-flutter/rpi4-drm-honister-latest/r=
aspberrypi4-64/tmp/work/cortexa72-poky-linux/vkmark/git-r0/recipe-sysroot/o=
pt/include</div><div><br></div><div><br></div><div>meson.cross</div><div><b=
r></div><div>Setting sys_root in the properties section of meson.cross (pat=
ching meson.bbclass) indirectly sets PKG_CONFIG_SYSROOT_DIR.=C2=A0 The sett=
ing of sys_root is present in nativesdk_meson*.bb, not meson*.bb.<br></div>=
<div><br></div><div>The issue for meson is that they are not passing the PK=
G_CONFIG_SYSROOT_DIR variable to the shell that launches pkg-config.<br></d=
iv><div></div><br><div>My proposed work around (this email thread) would fi=
x the behavior.=C2=A0 I believe the proper fix is for meson to address upst=
ream.=C2=A0 Still waiting on a response from them: <a href=3D"https://githu=
b.com/mesonbuild/meson/issues/9674">https://github.com/mesonbuild/meson/iss=
ues/9674</a></div><div><br></div><div><br></div><div>Joel<br></div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, =
Nov 30, 2021 at 9:49 AM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavi=
n@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 30 Nov 2021 at 18:20, Joe=
l Winarske &lt;<a href=3D"mailto:joel.winarske@gmail.com" target=3D"_blank"=
>joel.winarske@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div><div>Meson does not expose PK=
G_CONFIG_SYSROOT_DIR to the pkg-config process.</div></div><div><br></div><=
div>Currently meson.cross as generated in meson.bbclass points directly to =
the pkg-config executable (no wrapper script).</div><div><br></div><div>PKG=
_CONFIG_SYSROOT_DIR behaves like a simple string prepend to all package con=
fig variable queries.=C2=A0 So if you want to determine the absolute path o=
f a variable in .pc you set PKG_CONFIG_SYSROOT_DIR and make your query.=C2=
=A0 Currently this is not possible with Yocto+Meson.<br></div><div><br></di=
v>I think a simple wrapper script would resolve this.=C2=A0 This is from <a=
 href=3D"https://autotools.io/pkgconfig/cross-compiling.html" target=3D"_bl=
ank">https://autotools.io/pkgconfig/cross-compiling.html</a>:<br><div><pre>=
#!/bin/sh

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

--0000000000007134e105d205b01c--

