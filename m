Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.97834.1597870149227344193
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2020 13:49:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sidebranch-com.20150623.gappssmtp.com header.s=20150623 header.b=H1wJxW6u;
 spf=softfail (domain: sidebranch.com, ip: 209.85.222.194, mailfrom: leon@sidebranch.com)
Received: by mail-qk1-f194.google.com with SMTP id x69so22929979qkb.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2020 13:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Us/NA1TYapk4gtq9EyOfLmWjjEI7R65Zw+50/CEIQno=;
        b=H1wJxW6u2B9ym/Hcb9cGMlliMUExbz8lVd/ykRXywhREt0hEw4zUQNGvjFrEUzFDnG
         Ki3B+UzL+Kx0kyOMgwmEo0818Yy3D3raQNjWo3z51ymemqS9Cen/75h/BEag2nd9DEQ7
         1v80R1rgQzKYX0iaCIcnRBZJSYwrO1BCZqIZvQP6m//gzc5zAO9tOtY2Bhpi90YgitR8
         hw3IsS79DpuibkH1VhhQv4T/xUuFW/EFLb5dj5tzF2dj6EJ1xsFsEAPRg58BPd3bAG9l
         lCAxq7d5yHJ96w6CxVorYpEpVbO8kFjQ2ARUuc0dEbRkiwcclZjMj5gkDLEyv5wo8khC
         fJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Us/NA1TYapk4gtq9EyOfLmWjjEI7R65Zw+50/CEIQno=;
        b=A6CG/NE/KW82mKWR7Rz1D0gT0ubF9QU8ZLbii/goRgyLMFvU3sAR0P3v+kPKHmDU2J
         gyo3Maf7x11bV8ZsBUOcslWFAJZcUjhKR+lMw7LvFrIjH5wI0JtVqG9SyKIQvad7CflB
         QlOZXPqiK3ojFFXTs1zl7Bj+sR+dSs+kP204Bet9IoAkQtd0bX4CHhPR6VjtRNB57PZT
         7saQjmM1MonKKVtu4pDLkc5veoS3UnwKn7F8s5ygCDaUrm0HqAPIZLAJHAiA/RVGXcbc
         sZO9sNgVfaAXGdg6bMnkO+N46lOxGxGSeG4OwdLpsgMxDazO9nDMJN/BwfLYiM9/0gBF
         jZwQ==
X-Gm-Message-State: AOAM530uDH+nI5E5CCPyKA0yDK7W/rveD3S2sFNTm2gSsHx6ddiGvzhW
	hEqN9tGV6/6tBGrsumDFbXfPMssib0Z8ZmoUlwSiSg==
X-Google-Smtp-Source: ABdhPJy0IyKu9GCebEOoMEPHoh7Jc5T9appddmSvypsHWEroIAzgfSdYzLEwxy0DcqnxbTR2inco5lAQ7tnZ7eueqe4=
X-Received: by 2002:a05:620a:1243:: with SMTP id a3mr22773564qkl.423.1597870148225;
 Wed, 19 Aug 2020 13:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <1597438000-20251-1-git-send-email-leon@sidebranch.com>
 <CANNYZj9i+s2ORHFtJDZDHJUQ2pfFHAbJdK+vp3cFSp5ZHNuitg@mail.gmail.com> <20200815075529.GC31467@localhost>
In-Reply-To: <20200815075529.GC31467@localhost>
From: "Leon Woestenberg" <leon@sidebranch.com>
Date: Wed, 19 Aug 2020 22:48:59 +0200
Message-ID: <CAMjhiJh_QwJLavAEcEkDsrBgaT4AJUz+f-Qzy80PJ_NOAEUKyw@mail.gmail.com>
Subject: Re: [OE-core] [dunfell] [PATCH] cmake-native: Use cmake-provided zstd library; supported host distro zstd may be too old.
To: Adrian Bunk <bunk@stusta.de>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000955e2405ad41227f"

--000000000000955e2405ad41227f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Adrian, all,

On Sat, Aug 15, 2020 at 9:55 AM Adrian Bunk <bunk@stusta.de> wrote:

> On Fri, Aug 14, 2020 at 11:44:17PM +0200, Alexander Kanavin wrote:
> > This needs to go to master first probably?
>
> Better for master might be moving zstd from meta-openembedded,
> and then DEPENDS on zstd-native?
>
> IMHO moving target zstd to OE-core is already overdue,
> so this would not be solely for cmake.
>
>
Good point, makes better sense then my proposed fix for cmake-native only.

More breakage of master against Ubuntu 16.04 (still supported by Yocto)
that supports Adrian's suggestion:


|
../../../../../../../work-shared/gcc-10.2.0-r0/gcc-10.2.0/gcc/lto-compress.=
c:
In function =E2=80=98int lto_normalized_zstd_level()=E2=80=99:
|
../../../../../../../work-shared/gcc-10.2.0-r0/gcc-10.2.0/gcc/lto-compress.=
c:120:36:
error: =E2=80=98ZSTD_maxCLevel=E2=80=99 was not declared in this scope
|    else if (level > ZSTD_maxCLevel ())
|                                     ^
|
../../../../../../../work-shared/gcc-10.2.0-r0/gcc-10.2.0/gcc/lto-compress.=
c:
In function =E2=80=98void lto_uncompression_zstd(lto_compression_stream*)=
=E2=80=99:
|
../../../../../../../work-shared/gcc-10.2.0-r0/gcc-10.2.0/gcc/lto-compress.=
c:160:74:
error: =E2=80=98ZSTD_getFrameContentSize=E2=80=99 was not declared in this =
scope
|    unsigned long long const rsize =3D ZSTD_getFrameContentSize (cursor,
size);
|
^
|
../../../../../../../work-shared/gcc-10.2.0-r0/gcc-10.2.0/gcc/lto-compress.=
c:161:16:
error: =E2=80=98ZSTD_CONTENTSIZE_ERROR=E2=80=99 was not declared in this sc=
ope
|    if (rsize =3D=3D ZSTD_CONTENTSIZE_ERROR)
|                 ^
|
../../../../../../../work-shared/gcc-10.2.0-r0/gcc-10.2.0/gcc/lto-compress.=
c:163:21:
error: =E2=80=98ZSTD_CONTENTSIZE_UNKNOWN=E2=80=99 was not declared in this =
scope
|    else if (rsize =3D=3D ZSTD_CONTENTSIZE_UNKNOWN)
|                      ^
| Makefile:1118: recipe for target 'lto-compress.o' failed
| make[1]: *** [lto-compress.o] Error 1
| make[1]: *** Waiting for unfinished jobs....

Did not deep-dive into this, nor test with Adrian's suggestion yet.

Regards,

Leon.

--000000000000955e2405ad41227f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Adrian, all,</div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Aug 15, 2020 at 9:55 AM Adr=
ian Bunk &lt;<a href=3D"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, Aug 14=
, 2020 at 11:44:17PM +0200, Alexander Kanavin wrote:<br>
&gt; This needs to go to master first probably?<br>
<br>
Better for master might be moving zstd from meta-openembedded,<br>
and then DEPENDS on zstd-native?<br>
<br>
IMHO moving target zstd to OE-core is already overdue,<br>
so this would not be solely for cmake.<br><br></blockquote><div><br></div><=
div>Good point, makes better sense then my proposed fix for cmake-native on=
ly.</div><div><br></div><div>More breakage of master against Ubuntu 16.04 (=
still supported by Yocto) that supports Adrian&#39;s suggestion:</div><div>=
=C2=A0</div><br>| ../../../../../../../work-shared/gcc-10.2.0-r0/gcc-10.2.0=
/gcc/lto-compress.c: In function =E2=80=98int lto_normalized_zstd_level()=
=E2=80=99:<br>| ../../../../../../../work-shared/gcc-10.2.0-r0/gcc-10.2.0/g=
cc/lto-compress.c:120:36: error: =E2=80=98ZSTD_maxCLevel=E2=80=99 was not d=
eclared in this scope<br>| =C2=A0 =C2=A0else if (level &gt; ZSTD_maxCLevel =
())<br>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>| ../../..=
/../../../../work-shared/gcc-10.2.0-r0/gcc-10.2.0/gcc/lto-compress.c: In fu=
nction =E2=80=98void lto_uncompression_zstd(lto_compression_stream*)=E2=80=
=99:<br>| ../../../../../../../work-shared/gcc-10.2.0-r0/gcc-10.2.0/gcc/lto=
-compress.c:160:74: error: =E2=80=98ZSTD_getFrameContentSize=E2=80=99 was n=
ot declared in this scope<br>| =C2=A0 =C2=A0unsigned long long const rsize =
=3D ZSTD_getFrameContentSize (cursor, size);<br>| =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ^<br>| ../../../../../../../work-shared/gcc-10.2.0-r0/gcc-10.=
2.0/gcc/lto-compress.c:161:16: error: =E2=80=98ZSTD_CONTENTSIZE_ERROR=E2=80=
=99 was not declared in this scope<br>| =C2=A0 =C2=A0if (rsize =3D=3D ZSTD_=
CONTENTSIZE_ERROR)<br>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ^<br>| ../../../../../../../work-shared/gcc-10.2.0-r0/gcc-10.2.0/gcc=
/lto-compress.c:163:21: error: =E2=80=98ZSTD_CONTENTSIZE_UNKNOWN=E2=80=99 w=
as not declared in this scope<br>| =C2=A0 =C2=A0else if (rsize =3D=3D ZSTD_=
CONTENTSIZE_UNKNOWN)<br>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>| Makefile:1118: recipe for target &#39;lto=
-compress.o&#39; failed<br>| make[1]: *** [lto-compress.o] Error 1<br>| mak=
e[1]: *** Waiting for unfinished jobs....</div><div class=3D"gmail_quote"><=
br></div><div class=3D"gmail_quote">Did not deep-dive into this, nor test w=
ith Adrian&#39;s suggestion yet.</div><div class=3D"gmail_quote"><br></div>=
<div class=3D"gmail_quote">Regards,</div><div class=3D"gmail_quote"><br></d=
iv><div class=3D"gmail_quote">Leon.<br><div>=C2=A0</div></div></div>

--000000000000955e2405ad41227f--
