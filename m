Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15EA1C433EF
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 17:49:34 +0000 (UTC)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by mx.groups.io with SMTP id smtpd.web09.80341.1638294573003032170
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 09:49:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kYL/ZUNy;
 spf=pass (domain: gmail.com, ip: 209.85.221.178,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f178.google.com with SMTP id q21so14147468vkn.2
        for <Openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 09:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rLFG3yE/9wjXerxCkIecAXQDsDn2Q/MFOtFX4iGapY0=;
        b=kYL/ZUNyHiEeT8uAUOT0Q0PjIbSa8wqQSLar6NqwXQXYKq9HRIuZwuo3zcrPyUfkJ3
         iToMAUsod+rVSOr64eS9SwgwKKEw9usdmUgUdSvdiagLgEk4b6y4migmKeffGfx3hWM/
         xq1UwjdVkBGhVSyZuAdv2QiwKfppccMKbfme4j9kYK92hDVCuUJai89zC2zyM+iOfmgB
         BuH0TGx7AYy3k9ENR0mxyUYeVbWKMaUcmeXM5acgcn3GXFsjmBtNk/0C724Bu/qLUIEk
         qHVF6H5k9q7MM6+PjnWzJZsGrVqWWHZYVDvsX5kESmHFXLVnwj6VpWFzQslfC2MnLKb6
         5gSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rLFG3yE/9wjXerxCkIecAXQDsDn2Q/MFOtFX4iGapY0=;
        b=5y25lqmPWYn+kS40Hx2s6+6nSOQ0RCUDmLShqQsT+BkrRDMCJXobhxa/Kfj21v8FnP
         iK2t7dtSsSWKJj2bx1wCr4W1Yv4barX9+skqsCUWWASriuHJfJOwenH5JXf8tNgJiElH
         89HuLWp+7dJzO/LwfNsrIuvw6w1JUTRVN2qcepw2Du4o+rNOcVANIMRWKVwonBSoR/4a
         Atsa9juTEVZ0NRL3bZ8Ej0V6//V7jfVVT7gH6+l+sqwBzY2xp+WFbQv4ZJlZPrM74m6n
         KbsT6+D4FuF1NImM2j4dfFkzWA7Ok+xefbNr786RVGGmeZnbbD352ft+jnKyt/wTBJxB
         7slQ==
X-Gm-Message-State: AOAM5309VdqM7TfqUk57hw3VHM8AFrbP+6t2DeRtZMIrfkGrI+y2nYea
	P6FHCxf6xpslNnJ0OI8+hsWbVlp22lJUcQFNxqI=
X-Google-Smtp-Source: 
 ABdhPJyCQnwErr41pyaAy2CTmqcVVjSOhb9kP8mMpb6HmvvAEbuUMfhFNL7YR25crKmSUIBXJTkwkxBAAowsjMc40B8=
X-Received: by 2002:a05:6122:2005:: with SMTP id
 l5mr460386vkd.4.1638294572081;
 Tue, 30 Nov 2021 09:49:32 -0800 (PST)
MIME-Version: 1.0
References: 
 <CABKMkPJoE74O2OnAe7WsLSu56Ww4ZfPfxksZ43-Np43otAhRWA@mail.gmail.com>
In-Reply-To: 
 <CABKMkPJoE74O2OnAe7WsLSu56Ww4ZfPfxksZ43-Np43otAhRWA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 30 Nov 2021 18:49:20 +0100
Message-ID: 
 <CANNYZj-DYfd_erYQYNzATL5K_rUMfDrrvzsWD2h0n_=_kXTBxA@mail.gmail.com>
Subject: Re: [OE-core] [RFC] meson needs a pkg-config wrapper script
To: Joel Winarske <joel.winarske@gmail.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000001a70b05d2052e4f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Nov 2021 17:49:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158985

--00000000000001a70b05d2052e4f
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Nov 2021 at 18:20, Joel Winarske <joel.winarske@gmail.com> wrote:

> Meson does not expose PKG_CONFIG_SYSROOT_DIR to the pkg-config process.
>
> Currently meson.cross as generated in meson.bbclass points directly to the
> pkg-config executable (no wrapper script).
>
> PKG_CONFIG_SYSROOT_DIR behaves like a simple string prepend to all package
> config variable queries.  So if you want to determine the absolute path of
> a variable in .pc you set PKG_CONFIG_SYSROOT_DIR and make your query.
> Currently this is not possible with Yocto+Meson.
>
> I think a simple wrapper script would resolve this.  This is from
> https://autotools.io/pkgconfig/cross-compiling.html:
>
> #!/bin/sh
>
> SYSROOT=/build/root
>
> export PKG_CONFIG_PATH=
> export PKG_CONFIG_LIBDIR=${SYSROOT}/usr/lib/pkgconfig:${SYSROOT}/usr/share/pkgconfig
> export PKG_CONFIG_SYSROOT_DIR=${SYSROOT}
>
> exec pkg-config "$@"
>
>
> The wrapper script would be generated per recipe via meson.bbclass,
> meson.cross would then reference this wrapper instead of the pkg-config
> executable.
>
> Thoughts?
>

I don't think this is correct. Meson's way of doing things is that you are
not supposed to get the include/library paths directly from pkg-config, but
rather use
https://mesonbuild.com/Reference-manual_functions.html#dependency and meson
will take care of any needed prefixes to the paths.

For the custom variables defined in .pc that happen to contain paths,
PKG_CONFIG_SYSROOT_DIR has no effect at all, so you need to manually
prepend it anyway everywhere where they're used. pkg-config does not know
what variable is a path and what isn't.

Alex

--00000000000001a70b05d2052e4f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 30 Nov 2021 at 18:20, Joel Winarske &lt;<a href=3D"mailto:jo=
el.winarske@gmail.com">joel.winarske@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><div>Me=
son does not expose PKG_CONFIG_SYSROOT_DIR to the pkg-config process.</div>=
</div><div><br></div><div>Currently meson.cross as generated in meson.bbcla=
ss points directly to the pkg-config executable (no wrapper script).</div><=
div><br></div><div>PKG_CONFIG_SYSROOT_DIR behaves like a simple string prep=
end to all package config variable queries.=C2=A0 So if you want to determi=
ne the absolute path of a variable in .pc you set PKG_CONFIG_SYSROOT_DIR an=
d make your query.=C2=A0 Currently this is not possible with Yocto+Meson.<b=
r></div><div><br></div>I think a simple wrapper script would resolve this.=
=C2=A0 This is from <a href=3D"https://autotools.io/pkgconfig/cross-compili=
ng.html" target=3D"_blank">https://autotools.io/pkgconfig/cross-compiling.h=
tml</a>:<br><div><pre>#!/bin/sh

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
ld.com/Reference-manual_functions.html#dependency">https://mesonbuild.com/R=
eference-manual_functions.html#dependency</a> and meson will take care of a=
ny needed prefixes to the paths.</div><div class=3D"gmail_quote"><br></div>=
<div class=3D"gmail_quote">For the custom variables defined in .pc that hap=
pen to contain paths, PKG_CONFIG_SYSROOT_DIR has no effect at all, so you n=
eed to manually prepend it anyway everywhere where they&#39;re used. pkg-co=
nfig does not know what variable is a path and what isn&#39;t.<br></div><di=
v class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Alex<br></div>=
</div>

--00000000000001a70b05d2052e4f--

