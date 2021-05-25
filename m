Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web11.7630.1621937270877789567
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 03:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZKyw/XjR;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id j12so10712022vsq.9
        for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 03:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p94CXzzYyyQsEOBfAZ/uQDyCi9xV94vkTLbvxNPnTGI=;
        b=ZKyw/XjRWGRK72DwitEt3Ba5hMPZtwM6uZheZngI9mTu8NDMz54bOAnPiY8otDo2/2
         ExnYsjghyW0FNNzrExZ5hFYlAxjQGoc0ACgBdF9/VuNCrPp9qHio7Svu4IzEZReDfcv1
         b9f6oD8Uk+i6froTNzVsdfPjyLOLuQuyTYMWdC+b0x/hooAw//a5sxsb8oiLTSOLMi39
         vq8Fr5Evb0d4PxAwnvdT/hg3VhxPvWoupBw0wBk2XX4V7qQgOUZFpMUY5tF/lWMAilz5
         TNWB0LnTQmh4hY8QQrbQVCc2OS7QWgC8Gn2mZD3sSfHUo5mcZZYeGssxjUhg1PvFjIpm
         JBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p94CXzzYyyQsEOBfAZ/uQDyCi9xV94vkTLbvxNPnTGI=;
        b=jzqGTAaODHGwGG71mLp/1XBaXpgDlNj/04casyXehJsfOkV+evFLme8pG68Cw5UnSH
         s/oMWnTHWY1ml7Foscrj406yABl+5rm2SfeMyTzBrfwL/2RS9M9369uJ5xb/uMwVOw5Y
         mTmTcSd8/dt9Vnu3+GMHUVYh7J8ELvfWcyk1n/Y1vBE7wY7rFNokvKJvX57SGnDPNJIn
         Z5ofKNgIapFkEYNyx5NRZrd05g3j9TK9j9PMhlFJbK2n0sESR9xSCKL6fImlt/+IJkiw
         7YgATKP4etUC18XV+Mq9Z0W+SDZjZxfcVehu91QyqhXTAA37LPJ1j0hz6zzPi/uL5HHs
         Rfyg==
X-Gm-Message-State: AOAM531dhIr2Ekrh9sXOGVpeTAq9OfrKxUqi6dBKONYEC4VbGT3nr6SE
	g5BPuN8lC0W1h1QyUMsTUw/AMj3Gmx9rOET+Yn4=
X-Google-Smtp-Source: ABdhPJwRkiE9ae1EohagswjZCqfZoRi4THuqnMN0r9XOcBuAY19jjf8oT1TjJv8Mq4HcvMW2Aog792xGkEKLKR3LYKM=
X-Received: by 2002:a67:d715:: with SMTP id p21mr24229751vsj.31.1621937270014;
 Tue, 25 May 2021 03:07:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210525100447.3918978-1-samuli.piippo@qt.io>
In-Reply-To: <20210525100447.3918978-1-samuli.piippo@qt.io>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 25 May 2021 12:07:38 +0200
Message-ID: <CANNYZj-=JMz_=HtogubX3E7FDGbtRk6BxTVShFgNNoRKrCMK9g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cmake-native: enabled zstd support
To: Samuli Piippo <samuli.piippo@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d3c4c705c324b2fd"

--000000000000d3c4c705c324b2fd
Content-Type: text/plain; charset="UTF-8"

You need to explain the benefit in doing so, I think? :)

Alex

On Tue, 25 May 2021 at 12:05, Samuli Piippo <samuli.piippo@gmail.com> wrote:

> Now that zstd is in oe-core, enable support for it in native CMake.
>
> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> ---
>  meta/recipes-devtools/cmake/cmake-native_3.20.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/cmake/cmake-native_3.20.1.bb
> b/meta/recipes-devtools/cmake/cmake-native_3.20.1.bb
> index d91e42ef9a..335097d387 100644
> --- a/meta/recipes-devtools/cmake/cmake-native_3.20.1.bb
> +++ b/meta/recipes-devtools/cmake/cmake-native_3.20.1.bb
> @@ -1,7 +1,7 @@
>  require cmake.inc
>  inherit native
>
> -DEPENDS += "bzip2-replacement-native xz-native zlib-native curl-native
> ncurses-native"
> +DEPENDS += "bzip2-replacement-native xz-native zlib-native curl-native
> ncurses-native zstd-native"
>
>  SRC_URI += "file://OEToolchainConfig.cmake \
>              file://environment.d-cmake.sh \
> --
> 2.25.1
>
>
> 
>
>

--000000000000d3c4c705c324b2fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>You need to explain the benefit in doing so, I think?=
 :)</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 25 May 2021 at 12:05, Sa=
muli Piippo &lt;<a href=3D"mailto:samuli.piippo@gmail.com">samuli.piippo@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Now that zstd is in oe-core, enable support for it in native CMake.<=
br>
<br>
Signed-off-by: Samuli Piippo &lt;<a href=3D"mailto:samuli.piippo@qt.io" ta=
rget=3D"_blank">samuli.piippo@qt.io</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.20.1.bb=
" rel=3D"noreferrer" target=3D"_blank">cmake-native_3.20.1.bb</a> | 2 +-<br=
>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.=
20.1.bb" rel=3D"noreferrer" target=3D"_blank">cmake-native_3.20.1.bb</a> b/=
meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.20.1.bb" rel=
=3D"noreferrer" target=3D"_blank">cmake-native_3.20.1.bb</a><br>
index d91e42ef9a..335097d387 100644<br>
--- a/meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.20.1.bb=
" rel=3D"noreferrer" target=3D"_blank">cmake-native_3.20.1.bb</a><br>
+++ b/meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.20.1.bb=
" rel=3D"noreferrer" target=3D"_blank">cmake-native_3.20.1.bb</a><br>
@@ -1,7 +1,7 @@<br>
=C2=A0require cmake.inc<br>
=C2=A0inherit native<br>
<br>
-DEPENDS +=3D &quot;bzip2-replacement-native xz-native zlib-native curl-na=
tive ncurses-native&quot;<br>
+DEPENDS +=3D &quot;bzip2-replacement-native xz-native zlib-native curl-na=
tive ncurses-native zstd-native&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://OEToolchainConfig.cmake \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://<a href=3D"http://e=
nvironment.d-cmake.sh" rel=3D"noreferrer" target=3D"_blank">environment.d-c=
make.sh</a> \<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000d3c4c705c324b2fd--
