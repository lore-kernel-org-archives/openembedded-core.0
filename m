Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.4039.1613706304831307403
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 19:45:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C2igpmPi;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id k8so1610755qvm.6
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Feb 2021 19:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LwMjTzgE8Nw7oWqh5exwz2IOawnHFYNGNrNuaYfw50c=;
        b=C2igpmPiR+ebZqHjr7D+2MP9EDutxyvq1NhSeXs+hNvmj0WXEnt6Ub2DHCyhaKXMdk
         Ljw8+sF6tpE6ePEjqCOMqRf9tjPueymVcd0VxiDzxEXQu/pGjj3CUbIynub3e5SITOn2
         862w74ckXIJC2IVu22zyS2Ds/DCCx0VEGCv8T9PRuwCJWReCSR/fTV/SEpG/jdg1uA8p
         rjOjsW9iXbDr9J6oRp39P5JRdDIJTEdJvBAUlA9gQe3+DUKTGp+yAg4Sx8dqm74svc/P
         20CaVve3S9/bbTfy9n4K9twwpBAlaLca200aNQliDArnqvKnNGbL12ayMDu0Fk/v2HD9
         QZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LwMjTzgE8Nw7oWqh5exwz2IOawnHFYNGNrNuaYfw50c=;
        b=JkuzC2jvw+GiAaeFJsnySfv0fvQAnPMks6bv8ux64we1GkCRWZ/cZZrTsV7Sknczam
         dWo6aiDaDlcds4mmsphSd/QfzxKcxswKyZSFDYxU24xly7g9wOx39USIIRG+ZhVICvMx
         gp5fWrYl7XZfv4U01KjohCcoeBZngxZvCW5Tgh1qT9YfBF45YNBUiUr4zUvvWedEFL/Z
         Eilw4o6BFmsxcbk2cVfFxFk+JLBAOxJc8B+yW6V9BfwfJ4hvPS4MWNVUCzXgrcAc/IcC
         BaGXFErG+ekb/3XkydxGB/xKo4YDJcjAmUeTbOlIN1rdd54M54EDvYDLBGJSkPX0iC08
         4LUQ==
X-Gm-Message-State: AOAM530bnOUvROFQ4DJJwJ15ncDo04zoaVznmnMHL5NxVk41pFMJ+c0Q
	1jP7aMIcjJTVaNhfuBSJZgrZGNqjDzygsmPJeIA=
X-Google-Smtp-Source: ABdhPJzMDUIyB0MmuF1gs6kNN6bHctKG2rpCqwhXQRad2mykU7rebwBjqp8auVVpJdiSCJJGaklSF1xn3yRuIA7T+qU=
X-Received: by 2002:a0c:ed4f:: with SMTP id v15mr4813759qvq.55.1613706303842;
 Thu, 18 Feb 2021 19:45:03 -0800 (PST)
MIME-Version: 1.0
References: <1613698607-114826-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <CAMKF1sou9Ju88OdEk4SKug_172NtnxAbkg-T5evqZbh-Am2sJA@mail.gmail.com> <259b58fcfd1548dab3564e230454ebbd@G08CNEXMBPEKD06.g08.fujitsu.local>
In-Reply-To: <259b58fcfd1548dab3564e230454ebbd@G08CNEXMBPEKD06.g08.fujitsu.local>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 18 Feb 2021 19:44:53 -0800
Message-ID: <CAMKF1sqPs8bPyyMZaV8JrtPnyB3rf091822qVWstU9YmmxDpDQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] wordsize.h: This file should be the same under arm and aarch64, othersise the following error happens:
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000032d8a05bba847f3"

--000000000000032d8a05bba847f3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We need some way to adjust it or check it automatically since it will be
not be the last time when the copyright year willl be upgraded

On Thu, Feb 18, 2021 at 7:34 PM Zheng, Ruoqin <zhengrq.fnst@cn.fujitsu.com=
>
wrote:

> Hi,
>
>
>
> The original patch named
> 0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch modified =
the
> copyright of arm from =E2=80=9C2016-2021=E2=80=9D to =E2=80=9C2016-2020=
=E2=80=9D.
>
> -----------------------------------------
>
> diff --git a/sysdeps/aarch64/bits/wordsize.h b/sysdeps/arm/bits/wordsize=
.h
>
> similarity index 80%
>
> copy from sysdeps/aarch64/bits/wordsize.h
>
> copy to sysdeps/arm/bits/wordsize.h
>
> index 91da566b74..34fcdef1f1 100644
>
> --- a/sysdeps/aarch64/bits/wordsize.h
>
> +++ b/sysdeps/arm/bits/wordsize.h
>
> @@ -1,6 +1,6 @@
>
> /* Determine the wordsize from the preprocessor defines.
>
>
>
> -   Copyright (C) 2016-2021 Free Software Foundation, Inc.
>
> +   Copyright (C) 2016-2020 Free Software Foundation, Inc.
>
> This file is part of the GNU C Library.
>
> -----------------------------------------
>
>
>
> In fact, the content of bits/wordsize.h of arm is the same as aarch64. A=
nd
> this difference of copyright causes an error when enable multilib, becau=
se
> this file is not the same of lib32-libc6-dev and libc6-dev.
>
> -----------------------------------------
>
> $ diff -Naur
> tmp/work/aarch64-ubinux-linux/glibc/2.33-r0/image/usr/include/bits/words=
ize.h
> tmp/work/armv7ahf-neon-ubinuxmllib32-linux-gnueabi/lib32-glibc/2.33-r0/i=
mage/usr/include/bits/wordsize.h
>
> ---
> tmp/work/aarch64-ubinux-linux/glibc/2.33-r0/image/usr/include/bits/words=
ize.h
> 2021-02-18 13:12:58.642576190 +0900
>
> +++
> tmp/work/armv7ahf-neon-ubinuxmllib32-linux-gnueabi/lib32-glibc/2.33-r0/i=
mage/usr/include/bits/wordsize.h
> 2021-02-19 12:16:11.129806703 +0900
>
> @@ -1,6 +1,6 @@
>
> /* Determine the wordsize from the preprocessor defines.
>
>
>
> -   Copyright (C) 2016-2021 Free Software Foundation, Inc.
>
> +   Copyright (C) 2016-2020 Free Software Foundation, Inc.
>
>     This file is part of the GNU C Library.
>
>
>
> The GNU C Library is free software; you can redistribute it and/or
>
> -----------------------------------------
>
>
>
> I don=E2=80=99t know why this patch modified copyright of arm. Shouldn=
=E2=80=99t copyright
> of this file of arm and aarch64 be the same?
>
> So, I modified copyright aim to make arm the same as aarch64. Or should =
I
> modified the copyright of aarch64 to =E2=80=9C2016-2020=E2=80=9D ?
>
>
>
> Best regards
>
> Zheng
>
>
>
>
>
>
>
> *From:* Khem Raj <raj.khem@gmail.com>
> *Sent:* Friday, February 19, 2021 10:37 AM
> *To:* Zheng, Ruoqin/=E9=83=91 =E8=8B=A5=E9=92=A6 <zhengrq.fnst@cn.fujits=
u.com>
> *Cc:* openembedded-core@lists.openembedded.org
> *Subject:* Re: [OE-core] [PATCH] wordsize.h: This file should be the sam=
e
> under arm and aarch64, othersise the following error happens:
>
>
>
> I don=E2=80=99t understand this change why are copyright years different=
 can you
> explain
>
>
>
> On Thu, Feb 18, 2021 at 5:37 PM zhengruoqin <zhengrq.fnst@cn.fujitsu.com=
>
> wrote:
>
> "file /usr/include/bits/wordsize.h conflicts between attempted installs =
of
> lib32-libc6-dev-2.33-r0.armv7ahf_neon and libc6-dev-2.33-r0.aarch64"
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  ...29-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git
> a/meta/recipes-core/glibc/glibc/0029-wordsize.h-Unify-the-header-between=
-arm-and-aarch64.patch
> b/meta/recipes-core/glibc/glibc/0029-wordsize.h-Unify-the-header-between=
-arm-and-aarch64.patch
> index 791029c4c0..11a77cdf93 100644
> ---
> a/meta/recipes-core/glibc/glibc/0029-wordsize.h-Unify-the-header-between=
-arm-and-aarch64.patch
> +++
> b/meta/recipes-core/glibc/glibc/0029-wordsize.h-Unify-the-header-between=
-arm-and-aarch64.patch
> @@ -50,7 +50,7 @@ index 91da566b74..34fcdef1f1 100644
>   /* Determine the wordsize from the preprocessor defines.
>
>  -   Copyright (C) 2016-2021 Free Software Foundation, Inc.
> -+   Copyright (C) 2016-2020 Free Software Foundation, Inc.
> ++   Copyright (C) 2016-2021 Free Software Foundation, Inc.
>      This file is part of the GNU C Library.
>
>      The GNU C Library is free software; you can redistribute it and/or
> --
> 2.25.1
>
>
>
>
>=20
>
>

--000000000000032d8a05bba847f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">We need some way to adjust it or check it automatically s=
ince it will be not be the last time when the copyright year willl be upgra=
ded=C2=A0</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Feb 18, 2021 at 7:34 PM Zheng, Ruoqin &lt;<a href=
=3D"mailto:zhengrq.fnst@cn.fujitsu.com">zhengrq.fnst@cn.fujitsu.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;b=
order-left-color:rgb(204,204,204)">





<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"m_-6808204005019111174WordSection1">
<p class=3D"MsoNormal">Hi, <u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">The original patch named 0029-wordsize.h-Unify-the-=
header-between-arm-and-aarch64.patch modified the copyright of arm from =E2=
=
=80=9C2016-2021=E2=80=9D to =E2=80=9C2016-2020=E2=80=9D.=C2=A0
<u></u><u></u></p>
<p class=3D"MsoNormal">-----------------------------------------<u></u><u>=
</u></p>
<p class=3D"MsoNormal">diff --git a/sysdeps/aarch64/bits/wordsize.h b/sysd=
eps/arm/bits/wordsize.h<u></u><u></u></p>
<p class=3D"MsoNormal">similarity index 80%<u></u><u></u></p>
<p class=3D"MsoNormal">copy from sysdeps/aarch64/bits/wordsize.h<u></u><u>=
</u></p>
<p class=3D"MsoNormal">copy to sysdeps/arm/bits/wordsize.h<u></u><u></u></=
p>
<p class=3D"MsoNormal">index 91da566b74..34fcdef1f1 100644<u></u><u></u></=
p>
<p class=3D"MsoNormal">--- a/sysdeps/aarch64/bits/wordsize.h<u></u><u></u>=
</p>
<p class=3D"MsoNormal">+++ b/sysdeps/arm/bits/wordsize.h<u></u><u></u></p>
<p class=3D"MsoNormal">@@ -1,6 +1,6 @@<u></u><u></u></p>
<p class=3D"MsoNormal">/* Determine the wordsize from the preprocessor def=
ines.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">-=C2=A0=C2=A0 Copyright (C) 2016-2021 Free Software=
 Foundation, Inc.<u></u><u></u></p>
<p class=3D"MsoNormal">+=C2=A0=C2=A0 Copyright (C) 2016-2020 Free Software=
 Foundation, Inc.<u></u><u></u></p>
<p class=3D"MsoNormal">This file is part of the GNU C Library.<u></u><u></=
u></p>
<p class=3D"MsoNormal">-----------------------------------------<u></u><u>=
</u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">In fact, the content of bits/wordsize.h of arm is t=
he same as aarch64. And this difference of copyright causes an error when e=
nable multilib, because this file is not the same of lib32-libc6-dev and li=
bc6-dev.<u></u><u></u></p>
<p class=3D"MsoNormal">-----------------------------------------<u></u><u>=
</u></p>
<p class=3D"MsoNormal">$ diff -Naur tmp/work/aarch64-ubinux-linux/glibc/2.=
33-r0/image/usr/include/bits/wordsize.h tmp/work/armv7ahf-neon-ubinuxmllib3=
2-linux-gnueabi/lib32-glibc/2.33-r0/image/usr/include/bits/wordsize.h<u></u=
><u></u></p>
<p class=3D"MsoNormal">--- tmp/work/aarch64-ubinux-linux/glibc/2.33-r0/ima=
ge/usr/include/bits/wordsize.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2021-02-=
18 13:12:58.642576190 +0900<u></u><u></u></p>
<p class=3D"MsoNormal">+++ tmp/work/armv7ahf-neon-ubinuxmllib32-linux-gnue=
abi/lib32-glibc/2.33-r0/image/usr/include/bits/wordsize.h=C2=A0=C2=A0=C2=A0=
 2021-02-19 12:16:11.129806703 +0900<u></u><u></u></p>
<p class=3D"MsoNormal">@@ -1,6 +1,6 @@<u></u><u></u></p>
<p class=3D"MsoNormal">/* Determine the wordsize from the preprocessor def=
ines.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">-=C2=A0=C2=A0 Copyright (C) 2016-2021 Free Software=
 Foundation, Inc.<u></u><u></u></p>
<p class=3D"MsoNormal">+=C2=A0=C2=A0 Copyright (C) 2016-2020 Free Software=
 Foundation, Inc.<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 This file is part of the GNU C L=
ibrary.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">The GNU C Library is free software; you can redistr=
ibute it and/or<u></u><u></u></p>
<p class=3D"MsoNormal">-----------------------------------------<u></u><u>=
</u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">I don=E2=80=99t know why this patch modified copyri=
ght of arm. Shouldn=E2=80=99t copyright of this file of arm and aarch64 be =
the same?
<u></u><u></u></p>
<p class=3D"MsoNormal">So, I modified copyright aim to make arm the same a=
s aarch64. Or should I modified the copyright of aarch64 to =E2=80=9C2016-2=
020=E2=80=9D ?<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Best regards</p></div></div><div lang=3D"EN-US" lin=
k=3D"blue" vlink=3D"purple"><div class=3D"m_-6808204005019111174WordSection=
1"><p class=3D"MsoNormal"><u></u><u></u></p>
<p class=3D"MsoNormal">Zheng<u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:=E7=AD=89=
=
=E7=BA=BF;color:rgb(31,73,125)"><u style=3D"font-family:=E7=AD=89=E7=BA=BF=
"></u>=C2=A0<u style=3D"font-family:=E7=AD=89=E7=BA=BF"></u></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify"><span style=3D"font-si=
ze:10.5pt;font-family:=E7=AD=89=E7=BA=BF;color:rgb(31,73,125)"><u style=3D"=
font-family:=E7=AD=89=E7=BA=BF"></u>=C2=A0<u style=3D"font-family:=E7=AD=89=
=
=E7=BA=BF"></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:=E7=AD=89=
=
=E7=BA=BF;color:rgb(31,73,125)"><u style=3D"font-family:=E7=AD=89=E7=BA=BF=
"></u>=C2=A0<u style=3D"font-family:=E7=AD=89=E7=BA=BF"></u></span></p>
<div style=3D"border-style:none none none solid;border-left-width:1.5pt;pa=
dding:0cm 0cm 0cm 4pt;border-left-color:blue">
<div>
<div style=3D"border-style:solid none none;border-top-width:1pt;padding:3p=
t 0cm 0cm;border-top-color:rgb(225,225,225)">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11pt;font-family:Calibr=
i,sans-serif">From:</span></b><span style=3D"font-size:11pt;font-family:Cal=
ibri,sans-serif"> Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=
=3D"_blank" style=3D"font-family:Calibri,sans-serif">raj.khem@gmail.com</a=
>&gt;
<br>
<b style=3D"font-family:Calibri,sans-serif">Sent:</b> Friday, February 19,=
 2021 10:37 AM<br>
<b style=3D"font-family:Calibri,sans-serif">To:</b> Zheng, Ruoqin/</span><=
span lang=3D"ZH-CN" style=3D"font-size:11pt;font-family:=E5=BE=AE=E8=BD=AF=
=E9=9B=85=E9=BB=91,sans-serif">=E9=83=91</span><span lang=3D"ZH-CN" style=
=3D"font-size:11pt;font-family:Calibri,sans-serif">
</span><span lang=3D"ZH-CN" style=3D"font-size:11pt;font-family:=E5=BE=AE=
=E8=BD=AF=E9=9B=85=E9=BB=91,sans-serif">=E8=8B=A5=E9=92=A6</span><span sty=
le=3D"font-size:11pt;font-family:Calibri,sans-serif"> &lt;<a href=3D"mailto=
:zhengrq.fnst@cn.fujitsu.com" target=3D"_blank" style=3D"font-family:Calibr=
i,sans-serif">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
<b style=3D"font-family:Calibri,sans-serif">Cc:</b> <a href=3D"mailto:open=
embedded-core@lists.openembedded.org" target=3D"_blank" style=3D"font-famil=
y:Calibri,sans-serif">openembedded-core@lists.openembedded.org</a><br>
<b style=3D"font-family:Calibri,sans-serif">Subject:</b> Re: [OE-core] [PA=
TCH] wordsize.h: This file should be the same under arm and aarch64, others=
ise the following error happens:<u style=3D"font-family:Calibri,sans-serif"=
></u><u style=3D"font-family:Calibri,sans-serif"></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">I don=E2=80=99t understand this change why are copy=
right years different can you explain=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Thu, Feb 18, 2021 at 5:37 PM zhengruoqin &lt;<a =
href=3D"mailto:zhengrq.fnst@cn.fujitsu.com" target=3D"_blank">zhengrq.fnst@=
cn.fujitsu.com</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-style:none none none solid;border-left-width:1=
pt;padding:0cm 0cm 0cm 6pt;margin-left:4.8pt;margin-right:0cm;border-left-c=
olor:rgb(204,204,204)">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">&quot;file /usr/includ=
e/bits/wordsize.h conflicts between attempted installs of lib32-libc6-dev-2=
.33-r0.armv7ahf_neon and libc6-dev-2.33-r0.aarch64&quot;<br>
<br>
Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.=
com" target=3D"_blank">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...29-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch | 2 =
+-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/glibc/glibc/0029-wordsize.h-Unify-the-heade=
r-between-arm-and-aarch64.patch b/meta/recipes-core/glibc/glibc/0029-wordsi=
ze.h-Unify-the-header-between-arm-and-aarch64.patch<br>
index 791029c4c0..11a77cdf93 100644<br>
--- a/meta/recipes-core/glibc/glibc/0029-wordsize.h-Unify-the-header-betwe=
en-arm-and-aarch64.patch<br>
+++ b/meta/recipes-core/glibc/glibc/0029-wordsize.h-Unify-the-header-betwe=
en-arm-and-aarch64.patch<br>
@@ -50,7 +50,7 @@ index 91da566b74..34fcdef1f1 100644<br>
=C2=A0 /* Determine the wordsize from the preprocessor defines.<br>
<br>
=C2=A0-=C2=A0 =C2=A0Copyright (C) 2016-2021 Free Software Foundation, Inc.=
<br>
-+=C2=A0 =C2=A0Copyright (C) 2016-2020 Free Software Foundation, Inc.<br>
++=C2=A0 =C2=A0Copyright (C) 2016-2021 Free Software Foundation, Inc.<br>
=C2=A0 =C2=A0 =C2=A0This file is part of the GNU C Library.<br>
<br>
=C2=A0 =C2=A0 =C2=A0The GNU C Library is free software; you can redistribu=
te it and/or<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
<u></u><u></u></p>
</blockquote>
</div>
</div>
</div>
</div>
</div>

</blockquote></div></div>

--000000000000032d8a05bba847f3--
