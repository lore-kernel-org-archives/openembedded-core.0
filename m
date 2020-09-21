Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web12.53706.1600726927286292606
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 15:22:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CCFdTAYW;
 spf=pass (domain: gmail.com, ip: 209.85.166.67, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f67.google.com with SMTP id r9so17374925ioa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2020 15:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vAYxoHonkzsLA+4fQ/Ney8MBT6ARlx3eoGkuwLALlgQ=;
        b=CCFdTAYWLh5Vqjpi4skKJpwYGbz4eTDg1kzqJMYDOYK6tgnUvwQfBCzGswdLbvyoLH
         CGQu5fOuhbvm1bfL74K4E9fbkbtZYremA9VI21I2/z2C7oSSsmZx9qRLjuTFSJO8oLrP
         QlPX4xNVRgOaNzM9eEIbITuYDwz4DTfFkqwMf0PqY3o3RDZe71I5Kxvkj0x/Y+x/x81z
         UTCOOiDRgmW2O+PPOLJbXRyga7emab1rQaVNpWxdKXMjmOF85vSUhcDGPGUJ1so1GrNi
         R/M998v3f2lcxA5+xnbqAsxDTIZBYIBNoWR5QvJ3pau6ypyIjDgL0kyw3cq3VHhjOQ/s
         fwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vAYxoHonkzsLA+4fQ/Ney8MBT6ARlx3eoGkuwLALlgQ=;
        b=NzFb52mmqigVhEW/gLObtZZ/cdj/IMMl4RRMMhEEtvZFGj2Y2dHDf7Q4S8PTMxp8z5
         HHQLJibO2iWFwnmsK28Lluc/3hgxBvMkNNeOXpp5r1SddaVsx8zCXIw2dmxfuRHAu/n8
         rPU+skorPScB7wchNe91T4RKArkkmA+D5gFTdpXWxnkKVcaghKagDlHz6m+CdhwPe+z+
         yGcvuDtXOstkJWVcBFTAadvjKcoYNM1eiif9juzlT13NAcGeSo2JODxvjgQra7CicoBH
         yZUWmsKgDTjYpZmCyLqiGguxEsOfV6doK32U4UVMBxeODtgupzm/E2t282nGOFgqQipi
         9Miw==
X-Gm-Message-State: AOAM533x4G3KC+4qYjtMjbem67QKWzuL7O5wXCwA6Jv42JWZqjTSz/CZ
	UOzMT3D6iBhDYXaMdSLLYDf34B3m6UdMXNiYToM=
X-Google-Smtp-Source: ABdhPJwkAzM0rQWbiNC9CQ0ivnjVxLzKuJb6b88LHINv1beLMIsVfVEhA5RnzdGAzyj26Um4073MRLiPSPHG9g+EtWk=
X-Received: by 2002:a02:c8c8:: with SMTP id q8mr1775747jao.46.1600726926609;
 Mon, 21 Sep 2020 15:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200921121204.2443466-1-richard.purdie@linuxfoundation.org> <20200921121204.2443466-4-richard.purdie@linuxfoundation.org>
In-Reply-To: <20200921121204.2443466-4-richard.purdie@linuxfoundation.org>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Mon, 21 Sep 2020 15:21:55 -0700
Message-ID: <CANx9H-C3EGcCGO_f_zR4C0Y0DjcnSxeicFW6dz7njWuEwNdOXQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] buildtools-tarball: Add python3-jinja2
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d7d00805afda4776"

--000000000000d7d00805afda4776
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 21, 2020 at 5:12 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> This is used by various pieces of the result handling code, particularly
> the
> performance testing and we're seeing autobuilder failures that are
> easiest resolved using this.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
Acked-by: Tim Orling <ticotimo@gmail.com>
Signed-off-by: Tim Orling <ticotimo@gmail.com>

> ---
>  meta/recipes-core/meta/buildtools-tarball.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb
> b/meta/recipes-core/meta/buildtools-tarball.bb
> index 75b71f55327..ef56f76fa71 100644
> --- a/meta/recipes-core/meta/buildtools-tarball.bb
> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
> @@ -11,6 +11,7 @@ TOOLCHAIN_HOST_TASK ?= "\
>      nativesdk-python3-modules \
>      nativesdk-python3-misc \
>      nativesdk-python3-git \
> +    nativesdk-python3-jinja2 \
>      nativesdk-python3-testtools \
>      nativesdk-python3-subunit \
>      nativesdk-ncurses-terminfo-base \
> --
> 2.25.1
>
>
> 
>
>

--000000000000d7d00805afda4776
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 21, 202=
0 at 5:12 AM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfound=
ation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-=
width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);paddin=
g-left:1ex">This is used by various pieces of the result handling code, par=
ticularly the<br>
performance testing and we&#39;re seeing autobuilder failures that are<br>
easiest resolved using this.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<=
br></blockquote><div style=3D"color:rgb(0,0,0)">Acked-by: Tim Orling &lt;<a=
 href=3D"mailto:ticotimo@gmail.com">ticotimo@gmail.com</a>&gt;</div><div><s=
pan style=3D"color:rgb(0,0,0)">Signed-off-by: Tim Orling &lt;<a href=3D"mai=
lto:ticotimo@gmail.com">ticotimo@gmail.com</a>&gt;=C2=A0</span>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);p=
adding-left:1ex">
---<br>
=C2=A0meta/recipes-core/meta/<a href=3D"http://buildtools-tarball.bb" rel=
=3D"noreferrer" target=3D"_blank">buildtools-tarball.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-core/meta/<a href=3D"http://buildtools-tarball.b=
b" rel=3D"noreferrer" target=3D"_blank">buildtools-tarball.bb</a> b/meta/re=
cipes-core/meta/<a href=3D"http://buildtools-tarball.bb" rel=3D"noreferrer"=
 target=3D"_blank">buildtools-tarball.bb</a><br>
index 75b71f55327..ef56f76fa71 100644<br>
--- a/meta/recipes-core/meta/<a href=3D"http://buildtools-tarball.bb" rel=
=3D"noreferrer" target=3D"_blank">buildtools-tarball.bb</a><br>
+++ b/meta/recipes-core/meta/<a href=3D"http://buildtools-tarball.bb" rel=
=3D"noreferrer" target=3D"_blank">buildtools-tarball.bb</a><br>
@@ -11,6 +11,7 @@ TOOLCHAIN_HOST_TASK ?=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0nativesdk-python3-modules \<br>
=C2=A0 =C2=A0 =C2=A0nativesdk-python3-misc \<br>
=C2=A0 =C2=A0 =C2=A0nativesdk-python3-git \<br>
+=C2=A0 =C2=A0 nativesdk-python3-jinja2 \<br>
=C2=A0 =C2=A0 =C2=A0nativesdk-python3-testtools \<br>
=C2=A0 =C2=A0 =C2=A0nativesdk-python3-subunit \<br>
=C2=A0 =C2=A0 =C2=A0nativesdk-ncurses-terminfo-base \<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div></div>

--000000000000d7d00805afda4776--
