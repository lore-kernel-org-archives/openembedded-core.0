Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com [209.85.217.67])
 by mx.groups.io with SMTP id smtpd.web11.36699.1602494900844864880
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 02:28:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jAdO6AZT;
 spf=pass (domain: gmail.com, ip: 209.85.217.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f67.google.com with SMTP id v23so6197989vsp.6
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2020 02:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/1nnKmZpeZWJKCrw5ZNewb3x3zXcJg+EA6pK2hfh5Zg=;
        b=jAdO6AZT9eoFpdV2nruKYpeSkxHD2my7kH1HKkdPYoNjgDxFPa8qeeDLM8V+8i6RBp
         MDln6uORPR/zwaMH8tttiRpbhRsdovqrFyO9djfkGIB8NigZV1KlsGuRdQruRa7ZRk1h
         wBfFZ2OFs/WFDev6OwmQKVidShLZTupZAiu5YttUMFsQdZokETsBNiolGHZUmQ+lKtGv
         34CWsT6zUd/ZP+6yrES4cXs1k/DqKl4okIZe7VcifzUJkrfyUD3+ltTXjf8ev8SGb77p
         ZUrWrZzARN4SrXNgSRdhcC7wGGhT9RUuRMQLLbuIMJIxJ9sGinkijf8JD5reha8a+Kmo
         vSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/1nnKmZpeZWJKCrw5ZNewb3x3zXcJg+EA6pK2hfh5Zg=;
        b=UwCnbJgHN3pxg0MrMBGWZys00Jbq5WIs0y9+QrDLKd/wCxTvTmb3X9dEeZADN7flS3
         KH6Jctj0CgnBwXBsFRKUlcp05gLzO77dnTcMlfI45yh4f8SHvh7DtSRd3NU33V+9spfP
         jO+Dp8+Po3A+ELrlm0/5Ctyl0FPqefEPmqLAzW+sTJ9lQoVnn+/lXLH0XmUcrvU6rfB6
         eMn506UljQNBe00ieVvVf0gquKc2faeiAQ3z+y0owFKvxrtHRCeCjenX7kVjKcu3iyj8
         8ow+631+xlzFDsAqgKEU2IEG8dZeqbVepx44oFnlqJnwJBnTx8TqMqmQims9S+I3oBKo
         tLvg==
X-Gm-Message-State: AOAM533V1LotXHzcx0PdMrJ87lyhnSQZGM6XAt2qRm8plwuFlhoE3OEZ
	Kr9gzhu2gjdgWa5A1g6oD1BDhxrUqi0OefPvpKU=
X-Google-Smtp-Source: ABdhPJw1n7Qzj9m2xFHnQ4Mfpsmj2alBd+w04muonJH8XE6NXt55GK+mDpFJVOzihVh0v+xtcyVYCPrg8wccXtc7b+c=
X-Received: by 2002:a67:f981:: with SMTP id b1mr3550439vsq.31.1602494899957;
 Mon, 12 Oct 2020 02:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <20201011234937.1041597-1-alistair@alistair23.me>
In-Reply-To: <20201011234937.1041597-1-alistair@alistair23.me>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 12 Oct 2020 11:28:08 +0200
Message-ID: <CANNYZj82hb4PyrQYd_SWQVkbEvitomqBmkiOpecvM4o=rTyQ7w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] wayland: Set idle-time to zero
To: Alistair <alistair@alistair23.me>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Alistair Francis <alistair23@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000004434d705b175eb78"

--0000000000004434d705b175eb78
Content-Type: text/plain; charset="UTF-8"

Why?

Alex

On Mon, 12 Oct 2020 at 01:49, Alistair <alistair@alistair23.me> wrote:

> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  meta/recipes-graphics/wayland/weston-init/weston.ini | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-graphics/wayland/weston-init/weston.ini
> b/meta/recipes-graphics/wayland/weston-init/weston.ini
> index b48726d59c..d1532236af 100644
> --- a/meta/recipes-graphics/wayland/weston-init/weston.ini
> +++ b/meta/recipes-graphics/wayland/weston-init/weston.ini
> @@ -5,6 +5,7 @@
>  #shell=desktop-shell.so
>  #gbm-format=xrgb2101010
>  require-input=false
> +idle-time=0
>
>  #[shell]
>  #background-image=/usr/share/backgrounds/gnome/Aqua.jpg
> --
> 2.28.0
>
>
> 
>
>

--0000000000004434d705b175eb78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Why?</div><div><br></div><div>Alex<br></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 1=
2 Oct 2020 at 01:49, Alistair &lt;<a href=3D"mailto:alistair@alistair23.me"=
>alistair@alistair23.me</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Signed-off-by: Alistair Francis &lt;<a href=3D"mailt=
o:alistair@alistair23.me" target=3D"_blank">alistair@alistair23.me</a>&gt;<=
br>
---<br>
=C2=A0meta/recipes-graphics/wayland/weston-init/weston.ini | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-graphics/wayland/weston-init/weston.ini b/meta/r=
ecipes-graphics/wayland/weston-init/weston.ini<br>
index b48726d59c..d1532236af 100644<br>
--- a/meta/recipes-graphics/wayland/weston-init/weston.ini<br>
+++ b/meta/recipes-graphics/wayland/weston-init/weston.ini<br>
@@ -5,6 +5,7 @@<br>
=C2=A0#shell=3Ddesktop-shell.so<br>
=C2=A0#gbm-format=3Dxrgb2101010<br>
=C2=A0require-input=3Dfalse<br>
+idle-time=3D0<br>
<br>
=C2=A0#[shell]<br>
=C2=A0#background-image=3D/usr/share/backgrounds/gnome/Aqua.jpg<br>
-- <br>
2.28.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000004434d705b175eb78--
