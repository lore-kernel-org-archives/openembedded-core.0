Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com [209.85.222.67])
 by mx.groups.io with SMTP id smtpd.web10.6833.1586161707947338956
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 01:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dYzH6BWz;
 spf=pass (domain: gmail.com, ip: 209.85.222.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f67.google.com with SMTP id y17so5140509uap.13
        for <Openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2020 01:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hx1Ytp1nGr/6FTCvJD0C70dTCQnYBKrYnYXq/4y7FOc=;
        b=dYzH6BWzqPaelLU7EIR12s3IK4+lR1uCPORb5FlW+uXyfsxqf9QJaq8CdvdLmwTj9p
         8RfZSI2ECPyxw+eX7IfrmXB7gMxJNjjlVtZ3rq/zXkM6C2nPd2pL6XfSLKZv2SY5OX0y
         hvUl4JZ5+qMOsj40MMdQX6i4v+A0a5hs/rz6Ddn+Imn4YktU9vIBLzWwFrwYSoeeCZPZ
         0KQZzx8RatllYhNc3Oml06ykCYXhNudAkldxKAnYZjzNS6kBpHcJ/7MylIJw/wU3Ccfy
         VmDu6cmzA25CPutHh5A/gPkPx5hky+EimB6cFGd2rdEB8whCnp+6hYe3AQoKrdG3ifxj
         /mbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hx1Ytp1nGr/6FTCvJD0C70dTCQnYBKrYnYXq/4y7FOc=;
        b=c/H118HSigEs738MjmAnKDT4zphy5xjPASCV3rmBDQv3PSiEVhczJxmn/DcUH1nJx7
         mCaXZ9gDe1CmkynAfncLebTNoMRlw4z5pIpwcSMJXwgIgAzq3jYfm3ELwSn1bCKo6fJM
         W/7EgqRJUh2V6LIARG7sO9JWvaIlCDCMaUGdk9ql0sAUzoNmIaQfIeNaDX9CkL41VlXK
         f8eZuIsguyBOn6KZdxHVsl4wnkxIIriZu6ZgMtPj+rpkYzmTOse6obFCKsr/FckC8JiL
         ulA/OCF4Zy+bTrmVCHiT9Bf57JwRqHl/ZXkuwpY8SoVFwdYj8bpZqnEYjtC6CN2jQQhF
         xomQ==
X-Gm-Message-State: AGi0PubV66rBanxNZcuVFDrOwGTHppiFxQqx13rujcOioALYyO/zyAy/
	W6zIpmvSX/rRfS4iJG5w4/M8zbrSXJMRbYLrMqY=
X-Google-Smtp-Source: APiQypIMaJIJ39kjsy/qHhvc+75qymk0c4ndEPo1k/aw9oAn05TOxSp6yWuX+KVECOGBKXmum39gyX/Tl2mf+vuZT4M=
X-Received: by 2002:a9f:31c5:: with SMTP id w5mr14272281uad.89.1586161706983;
 Mon, 06 Apr 2020 01:28:26 -0700 (PDT)
MIME-Version: 1.0
References: <CANUMPcVyxL9c3x0z9cv6EYads+LGeYL4ccwFbnnvyA_gkx9MXg@mail.gmail.com>
In-Reply-To: <CANUMPcVyxL9c3x0z9cv6EYads+LGeYL4ccwFbnnvyA_gkx9MXg@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 6 Apr 2020 10:28:16 +0200
Message-ID: <CANNYZj8uEXS9GwmZj4rONX_FodL1J8Wj0VKcL6v77pco8rEAEA@mail.gmail.com>
Subject: Re: [OE-core] librsvg-2.46.4 recipe build failure.
To: Vinay Kumar <vinay.m.engg@gmail.com>
Cc: Openembedded-core@lists.openembedded.org, rwmacleod@gmail.com, 
	umesh.kalappa0@gmail.com
Content-Type: multipart/alternative; boundary="00000000000019e42c05a29b0d6f"

--00000000000019e42c05a29b0d6f
Content-Type: text/plain; charset="UTF-8"

The upstream tree still uses auto tools for the build, so the issue you are
seeing is probably caused by something else?

Ale

On Mon 6. Apr 2020 at 9.00, Vinay Kumar <vinay.m.engg@gmail.com> wrote:

> Hi,
>
> Regarding, https://github.com/meta-rust/meta-rust/issues/264
>
> As per my analysis the
> "openembedded-core/meta/classes/autotools.bbclass" inherited through
> "openembedded-core/meta/classes/gnomebase.bbclass" from  seems to be
> overriding the "meta-rust/classes/cargo.bbclass" from meta-rust.
>
> $cat openembedded-core/meta/classes/gnomebase.bbclass
>
> GNOMEBASEBUILDCLASS ??= "autotools"
> inherit ${GNOMEBASEBUILDCLASS}  pkgconfig
>
> The "librsvg" configure  and compile  scripts in "temp" directory
> contains "autotools_do_compile" with "inherit cargo", it should be
> "cargo_do_compile".
>
> Reference:
> "bitbake rust-hello-world" builds without any error ( with "inherit
> cargo").
>
> Is there any way to disable "autotools" for "gnomebase.bbclass"
> through "librsvg-2.46.4.bb"  ?
>
> Regards,
> Vinay
> 
>

--00000000000019e42c05a29b0d6f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">The upstream tree still uses auto tools for the buil=
d, so the issue you are seeing is probably caused by something else?</div><=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Ale=C2=A0</div><div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon 6. =
Apr 2020 at 9.00, Vinay Kumar &lt;<a href=3D"mailto:vinay.m.engg@gmail.com"=
>vinay.m.engg@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">Hi,<br>
<br>
Regarding, <a href=3D"https://github.com/meta-rust/meta-rust/issues/264" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/meta-rust/meta-rust/=
issues/264</a><br>
<br>
As per my analysis the<br>
&quot;openembedded-core/meta/classes/autotools.bbclass&quot; inherited thr=
ough<br>
&quot;openembedded-core/meta/classes/gnomebase.bbclass&quot; from=C2=A0 se=
ems to be<br>
overriding the &quot;meta-rust/classes/cargo.bbclass&quot; from meta-rust.=
<br>
<br>
$cat openembedded-core/meta/classes/gnomebase.bbclass<br>
<br>
GNOMEBASEBUILDCLASS ??=3D &quot;autotools&quot;<br>
inherit ${GNOMEBASEBUILDCLASS}=C2=A0 pkgconfig<br>
<br>
The &quot;librsvg&quot; configure=C2=A0 and compile=C2=A0 scripts in &quot=
;temp&quot; directory<br>
contains &quot;autotools_do_compile&quot; with &quot;inherit cargo&quot;, =
it should be<br>
&quot;cargo_do_compile&quot;.<br>
<br>
Reference:<br>
&quot;bitbake rust-hello-world&quot; builds without any error ( with &quot=
;inherit cargo&quot;).<br>
<br>
Is there any way to disable &quot;autotools&quot; for &quot;gnomebase.bbcl=
ass&quot;<br>
through &quot;<a href=3D"http://librsvg-2.46.4.bb" rel=3D"noreferrer" targ=
et=3D"_blank">librsvg-2.46.4.bb</a>&quot;=C2=A0 ?<br>
<br>
Regards,<br>
Vinay<br>
<br>
</blockquote></div></div>

--00000000000019e42c05a29b0d6f--
