Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web10.6899.1610443876843442337
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jan 2021 01:31:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SUVUKs7i;
 spf=pass (domain: gmail.com, ip: 209.85.222.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id t15so605701ual.6
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Jan 2021 01:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7uNrM/lFTRv8V+vKfjJy2I460jIGCkYGE/2XcGH90c0=;
        b=SUVUKs7igzKV4rFeJA9p+6TnSiftw/xGNSP2PDJ92p3MHxF37wNdCylqThZITkKan1
         O5bQaZeilgSIVgJdkQawB783ilmtVWuEalgvfuRxgYohnhKF7TBNIpHlDIxJm8GBMaW8
         DqXa8aBI2ki4ycYxneIoxNByZBeyc0AJUvcihdaLRUAwZUIk4Il1y76TWNugEpiJfIbv
         bA7E3KJg1Fn7ASWWX1pFOlbOsqxlwnra9cIHlaeKSN1LubNz/cD8JktsU+NY7o4WS25F
         Ds3lHxIle4NsIb1h3WqhkAGwWK3L8B57AcTNB6/HfJnP+Ny2xq0MK/fKhw4/sRGZIZeJ
         KFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7uNrM/lFTRv8V+vKfjJy2I460jIGCkYGE/2XcGH90c0=;
        b=HwUeyoVjcTwCqZDDqg9BMJ2FksX28P/FPcSPotMXBuQx1X2EdW/uwkJ8eXlu1r+KDl
         15YKD0Dl37KlzWjUvJJUrmkuNvrb6Z17WjzWlbBSQ/bnyEO0RuLs0jloVFZukZLYewLg
         6HkfzJEjKz37NpIq96FRDyYMA/JPGxyeZxp8OilETuk1HNdaSaqzhywDQGreyGrgmQ7U
         dV1qsMQYfcRWJfCsx3iQyqnsV8ChBubwJluk3aXHe53PAQ3b72I5gga3iMRCM1nNLImN
         PjU//DvdlqHuPCkW7WOZbxPXmPRE/vU/GGN1H9m10+1aLkm62twmuftsCqddiTDOJlme
         StDQ==
X-Gm-Message-State: AOAM532bgzShGUfhCUD4lpc9InFa+QG8DOW1gPZ63yyuVRmPEQX3uolr
	ejtt+Uaia7AbsOaA9baBvWbt3aSPwEPBT7IAXyM=
X-Google-Smtp-Source: ABdhPJz5u0krQi9lZ26SCvcdv9BbbdtMo1cMEB2pKBt4sdX5F4CfKsY0+orNcjgbFaEczItm9sVReKgbdFzAesVeNtI=
X-Received: by 2002:ab0:113:: with SMTP id 19mr2656841uak.71.1610443875939;
 Tue, 12 Jan 2021 01:31:15 -0800 (PST)
MIME-Version: 1.0
References: <1610413372-17701-1-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1610413372-17701-1-git-send-email-wangmy@cn.fujitsu.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 12 Jan 2021 10:31:04 +0100
Message-ID: <CANNYZj-SJ7VQaZQknqwc1M7gJ5LbLX=_tgc-SRpGaEhafnS47w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] socat: upgrade 1.7.3.4 ->1.7.4.0
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000027f8ac05b8b0afb4"

--00000000000027f8ac05b8b0afb4
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Jan 2021 at 02:03, Wang Mingyu <wangmy@cn.fujitsu.com> wrote:

>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> -
> file://README;beginline=257;endline=287;md5=338c05eadd013872abb1d6e198e10a3f"
> +
> file://README;beginline=257;endline=287;md5=82520b052f322ac2b5b3dfdc7c7eea86"
>

This change needs to be explained. Say something like:

License-Update: copyright years updated

or similar in the commit message.

'devtool upgrade' will put the diff of the license snippet to the updated
recipe by the way, which you can then edit out and summarize in the commit.

Alex

Alex

--00000000000027f8ac05b8b0afb4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 12 Jan 2021 at 02:03, Wang Mingyu &lt;<a href=3D"mailto:wang=
my@cn.fujitsu.com">wangmy@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">=C2=A0LIC_FILES_CHKSUM =3D &quot;fi=
le://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://README;beginline=3D257;endline=3D287;md5=3D338c05eadd013872abb1d6e198e10=
a3f&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://README;beginline=3D257;endline=3D287;md5=3D82520b052f322ac2b5b3dfdc7c7ee=
a86&quot;<br></blockquote><div><br></div><div>This change needs to be expla=
ined. Say something like:</div><div><br></div><div>License-Update: copyrigh=
t years updated<br></div><div><br></div><div>or similar in the commit messa=
ge.</div><div><br></div><div>&#39;devtool upgrade&#39; will put the diff of=
 the license snippet to the updated recipe by the way, which you can then e=
dit out and summarize in the commit.</div><div><br></div><div>Alex<br></div=
><div><br></div><div>Alex<br></div></div></div>

--00000000000027f8ac05b8b0afb4--
