Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web12.3479.1613702206203888346
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 18:36:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nULf2MOI;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id m144so4277305qke.10
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Feb 2021 18:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IyiuAP6UNWftgAfRp2mfPUPfXs0k51VSZWi1rIK7HFY=;
        b=nULf2MOIP5Zb+sTkYyF88R9KxZGj4zJMvfa3i1oOyfmLbTTWGsMeTAY9mAOwCov+jQ
         kQSSB9B2GW/yaeTJgKSegcSVJSOPT47rfX+Uhx2nKrho80JCkKWcmHlFSHDu5G45YHsC
         YYUjapgxQ09UjoGPRK+nCEhwPeuttuJ2rQ7FkPbkc52uHA4plxxSj7iK7714LcL5CJu7
         P457+rPSN73OA7WPT8qwnu0Z+nMFMhMq5EHu/KA8/BCX4isb3WL7cdh+qa+5bNnXccTz
         IXYZccAma59lZgF2IkZYrphbKPoivMPd3Rq82/ATQFvKcZWuni0mP5qwaBNSJXnCx1XW
         bNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IyiuAP6UNWftgAfRp2mfPUPfXs0k51VSZWi1rIK7HFY=;
        b=OzTtx9VdEjj4+vzPVoHZukrAazTtp7/C31VH0enMLxYCfSJetTERnCRXYQfHMR91wn
         LAxw58MhTv5mrqnziBmht2vPzNMD3uWrQvGYJtj8ssC25SHwSNUz0Py27ApTJ3qudKnL
         4xPRo7f3OZU6zCjqr1cQj2RCeaksxxRWnuT6e/FgfXSjT6qlD4t8wsiUCdSgrL2CeFcH
         6V9F8QMM6A6E8/0diJQidXT4Fp1e82K1z08XOdNS/BgRLlC/Bd6taWf4DkGSSWGqjGwl
         ByLntFtaKEorecaOBXKPyXSwsEvJX2F4qap+0e7jCBlsxoDdV38Qt+kru6QiKiFtg1/s
         6b4g==
X-Gm-Message-State: AOAM532WmBT4D7FyE0efEeRvliRUyif62l+Siuv3c+NYUg27X95Mv0pm
	e1jWDMdtAtzE/WJSnI+sRmF5rI2qWeBYJ3GN/B8=
X-Google-Smtp-Source: ABdhPJydPU3yOX5PW8PS4mVA/dxlH8UGm7micgx9nx/RxnIblwFv/t1hdzJughhqsS7mdLNx9xT3P/GxH6+n7tFO51w=
X-Received: by 2002:a37:66cd:: with SMTP id a196mr7424194qkc.381.1613702205173;
 Thu, 18 Feb 2021 18:36:45 -0800 (PST)
MIME-Version: 1.0
References: <1613698607-114826-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1613698607-114826-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 18 Feb 2021 18:36:34 -0800
Message-ID: <CAMKF1sou9Ju88OdEk4SKug_172NtnxAbkg-T5evqZbh-Am2sJA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] wordsize.h: This file should be the same under arm and aarch64, othersise the following error happens:
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b674f505bba75248"

--000000000000b674f505bba75248
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don=E2=80=99t understand this change why are copyright years different ca=
n you
explain

On Thu, Feb 18, 2021 at 5:37 PM zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

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

--000000000000b674f505bba75248
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I don=E2=80=99t understand this change why are copyright =
years different can you explain=C2=A0</div><div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 18, 2021 at 5:37 PM z=
hengruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.com">zhengrq.fnst@=
cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:sol=
id;padding-left:1ex;border-left-color:rgb(204,204,204)">&quot;file /usr/inc=
lude/bits/wordsize.h conflicts between attempted installs of lib32-libc6-de=
v-2.33-r0.armv7ahf_neon and libc6-dev-2.33-r0.aarch64&quot;<br>
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
<br>
<br>
</blockquote></div></div>

--000000000000b674f505bba75248--
