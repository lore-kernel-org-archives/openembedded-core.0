Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.5807.1614218474195555018
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 18:01:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hAIsGah1;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id f17so4332932qkl.5
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Feb 2021 18:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Q/bgEh1Daz5rLM2XEkZ/PdgeQQF3MeUTWTXQGVvGtI=;
        b=hAIsGah1U7LI+ZVhFcqS2FlKDsDS9GNB4yae7N7EL2YjagiwJrznHy7LKTAEzf+fTC
         5kUEHb/e3EKMQx3Brdnnn5k6WmN8Z4E3wgauY+Zhm+YVDCX4+zuuJtgTZ6rHSPvlDylo
         jsn/Yz83xLmc4ELLiMqdqkFZ7JbO8VP2013ANnY8APAV2dcdlSIcxLz+dxZIXGwr4p8s
         8V56qGK26WWUqoJ1ClO+9zy1LteW0KzFlTk5bmDaDVYKBT9+piYh68pgB7g4VSkG6494
         jNS3loNLyeVm7Fjy+2ocAUcszXCXFHnNTHCnxcPIwDhUSmxirRcZBl1inR5h0Zz2dxLc
         g5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Q/bgEh1Daz5rLM2XEkZ/PdgeQQF3MeUTWTXQGVvGtI=;
        b=jBL9ZxMrClky723p0bFufwBtmg+Q2r6RGDsqIBWDBA3IfM+DJAso4fDALkCiPtrzI0
         nr7060wf4bbW3G/TRZizrVe26pucbgaGHZ/6hVzVuf0/eozjsVoRQmHEhrAhG5v5zeJt
         p2LTthNemf6TEJIALHR4JzgpTaQvT/ta/Rc7Ei4Ky1XWJfYreaIRwJD5WccURBCqcC//
         vJEqGETxkqSawHhCmtvYIhMMSpUPe7lhpGJTdSMblVqW/v3Q8Qj67ZckuEnyHPUfNRlQ
         Dc8nsBg4w7IrBlI/7zX5uSonrLD1dYNZiMiXwTDt0Pn4a474iVl4IcT4a/t0scHPgzG7
         xUzg==
X-Gm-Message-State: AOAM533Qwn00M9+K3kU4RjRkFV8ryMrAeOO8kqeZLQuUToMkeq8ZBxWG
	Qv8U9mmoWJ3NzWwYllc1PHTIZJRtjH8pIDJNryw=
X-Google-Smtp-Source: ABdhPJx5QY2H+qGrgYAcsEjaagwKZmDaSEYiSrW+k2pTsqcLzbmGgmShY93Df+r0+YHyJ+yFuXtC0vXBk79R81RYEPo=
X-Received: by 2002:a37:e13:: with SMTP id 19mr822785qko.119.1614218473063;
 Wed, 24 Feb 2021 18:01:13 -0800 (PST)
MIME-Version: 1.0
References: <20210225003630.17878-1-dorindabassey@gmail.com>
In-Reply-To: <20210225003630.17878-1-dorindabassey@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 24 Feb 2021 18:01:02 -0800
Message-ID: <CAMKF1sqF7Z8Re07K9xRsV1obGQ8na6J6N9b_EekhFNf8xh_UYw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gdb-common.inc: add PACKAGECONFIG for debuginfod
To: Dorinda <dorindabassey@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ad49ec05bc1f8659"

--000000000000ad49ec05bc1f8659
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 24, 2021 at 4:36 PM Dorinda <dorindabassey@gmail.com> wrote:

> Added PACKAGECONFIG for debuginfod
>

Lgtm


> Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
> ---
>  meta/recipes-devtools/gdb/gdb-common.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/gdb/gdb-common.inc
> b/meta/recipes-devtools/gdb/gdb-common.inc
> index bfb8013d67..ccc911592c 100644
> --- a/meta/recipes-devtools/gdb/gdb-common.inc
> +++ b/meta/recipes-devtools/gdb/gdb-common.inc
> @@ -36,6 +36,7 @@ PACKAGECONFIG[babeltrace] =
> "--with-babeltrace,--without-babeltrace,babeltrace"
>  # ncurses is already a hard DEPENDS, but would be added here if it weren't
>  PACKAGECONFIG[tui] = "--enable-tui,--disable-tui"
>  PACKAGECONFIG[xz] = "--with-lzma,--without-lzma,xz"
> +PACKAGECONFIG[debuginfod] = "--with-debuginfod, --without-debuginfod,
> elfutils"
>
>  GDBPROPREFIX = "--program-prefix=''"
>
> --
> 2.17.1
>
>
> 
>
>

--000000000000ad49ec05bc1f8659
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Feb 24, 2021 at 4:36 PM Dorinda &lt;<a href=3D"mai=
lto:dorindabassey@gmail.com">dorindabassey@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">Added PACKAGECONFIG for debuginfod<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Lgtm=C2=A0</div=
><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Signed-off-by: Dorinda Bassey &lt;<a href=3D"mailto:dorindabassey@gmail.co=
m" target=3D"_blank">dorindabassey@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/gdb/gdb-common.inc | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devto=
ols/gdb/gdb-common.inc<br>
index bfb8013d67..ccc911592c 100644<br>
--- a/meta/recipes-devtools/gdb/gdb-common.inc<br>
+++ b/meta/recipes-devtools/gdb/gdb-common.inc<br>
@@ -36,6 +36,7 @@ PACKAGECONFIG[babeltrace] =3D &quot;--with-babeltrace,--=
without-babeltrace,babeltrace&quot;<br>
=C2=A0# ncurses is already a hard DEPENDS, but would be added here if it w=
eren&#39;t<br>
=C2=A0PACKAGECONFIG[tui] =3D &quot;--enable-tui,--disable-tui&quot;<br>
=C2=A0PACKAGECONFIG[xz] =3D &quot;--with-lzma,--without-lzma,xz&quot;<br>
+PACKAGECONFIG[debuginfod] =3D &quot;--with-debuginfod, --without-debuginf=
od, elfutils&quot;<br>
<br>
=C2=A0GDBPROPREFIX =3D &quot;--program-prefix=3D&#39;&#39;&quot;<br>
<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000ad49ec05bc1f8659--
