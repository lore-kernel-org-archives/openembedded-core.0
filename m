Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C4EBC7EE29
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 15:13:59 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.9257.1686303487705583276
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 02:38:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@snap.com header.s=google header.b=GFSMwltc;
 spf=pass (domain: snapchat.com, ip: 209.85.218.45, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-97458c97333so262005266b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 02:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1686303486; x=1688895486;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YveUp9Bts/Nk+xwRKRxZhClXal31GtEpbTI4hQvpQL0=;
        b=GFSMwltcLGyklskbyPzxV9Bvdl3VT+SACeUZoCghmnk4wdU6gbMW+vIYcR92HM1Fog
         kFzC7P3D1yJ/jV7zLo087P9y7xvXTD4DbI9xUN0KYNdsKR+OgBI4RuQU/9u2Zd+4FcQN
         yhgO5Fc++U5yHXVr0GV900B3dZaoL/5xxhpzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686303486; x=1688895486;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YveUp9Bts/Nk+xwRKRxZhClXal31GtEpbTI4hQvpQL0=;
        b=DErI0ceDk+/vdt7F6JZl7G5mZ72rLq/6S/AicmyrQKV7f/P5bIRRVdQwrC+HyOENL4
         U9rd3gwXzxWjdJjevGrHvBmmr7U0Sr8jGY9tLq/jjTIXqHWyal3WR7VHE7Fa69oeBSFn
         0TeHLz4Y/F1tkN+NHqbqlfWjzVXqBr7UImXcfOQnTP2Xmaq1HtXOm8Gmi7M9kqaXvHdy
         z9uqrWAm6U0rA92UL7coEIPA7id6JCkfDjShkRzxPd/3RJOo6wbzjs5Vss5FxH8PsPJL
         gsSmOfRhceOXvpdcvMfx1jjRf7mZQBr1ozM0Z8qHiF65T+MnAAXcuK6VkYAB5WnW3If7
         KqCA==
X-Gm-Message-State: AC+VfDx6iRFGOeVMxRffUtIr+rTwfzmkzn9W2v6Mh+OfLRSzhxp5+eHK
	qa5NiMYO+SYumnUajpPW3s57kL5vGIYNg+cNciimRk39wf770OhO
X-Google-Smtp-Source: ACHHUZ69r28Wm/DCgRSmMHuSKr3X/hmSz5ei2fxu1KyxBxUlnT8NcJx2UijlWjA224mhzM6dilNjpuerGUI76BTX+9o=
X-Received: by 2002:a17:906:5d0b:b0:974:5c2f:65cc with SMTP id
 g11-20020a1709065d0b00b009745c2f65ccmr1315031ejt.67.1686303485400; Fri, 09
 Jun 2023 02:38:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230526115155.1953481-1-ecordonnier@snap.com>
In-Reply-To: <20230526115155.1953481-1-ecordonnier@snap.com>
From: "Etienne Cordonnier" <ecordonnier@snap.com>
Date: Fri, 9 Jun 2023 11:37:54 +0200
Message-ID: <CAHUKmYbZdJ3kws3ujidWy89pZSM_siGYBbcLzMJtWKbT_6A5dQ@mail.gmail.com>
Subject: Re: [PATCH] libxcrypt: fix hard-coded ".so" extension
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003b5e9b05fdaf2052"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 15:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182558

--0000000000003b5e9b05fdaf2052
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,
is everything OK with the patch? Is there anything blocking a merge?

On Fri, May 26, 2023 at 1:52=E2=80=AFPM <ecordonnier@snap.com> wrote:

> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> 2 issues:
> - the .so extension is hard-coded, and therefore the libxcryt package
> compiled with
>   meta-darwin is empty, because the dylib files are not contained in
> FILES_${PN}
> - nothing actually produces a file libcrypt-*.so (the symlink file is
> libcrypt.so, without dash), thus
>   defining FILES:${PN} manually to contain libcrypt-*.so has no effect.
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  meta/recipes-core/libxcrypt/libxcrypt.inc | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc
> b/meta/recipes-core/libxcrypt/libxcrypt.inc
> index 61b0381076..454a55d73d 100644
> --- a/meta/recipes-core/libxcrypt/libxcrypt.inc
> +++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
> @@ -17,12 +17,6 @@ SRC_URI +=3D "file://fix_cflags_handling.patch"
>
>  PROVIDES =3D "virtual/crypt"
>
> -FILES:${PN} =3D "${libdir}/libcrypt*.so.* \
> -               ${libdir}/libcrypt-*.so \
> -               ${libdir}/libowcrypt*.so.* \
> -               ${libdir}/libowcrypt-*.so \
> -"
> -
>  S =3D "${WORKDIR}/git"
>
>  BUILD_CPPFLAGS =3D "-I${STAGING_INCDIR_NATIVE}"
> --
> 2.36.1.vfs.0.0
>
>

--0000000000003b5e9b05fdaf2052
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br>is everything OK with the patch? Is there anythi=
ng blocking a merge?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Fri, May 26, 2023 at 1:52=E2=80=AFPM &lt;<a href=3D"=
mailto:ecordonnier@snap.com">ecordonnier@snap.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">From: Etienne Cordonnier &=
lt;<a href=3D"mailto:ecordonnier@snap.com" target=3D"_blank">ecordonnier@sn=
ap.com</a>&gt;<br>
<br>
2 issues:<br>
- the .so extension is hard-coded, and therefore the libxcryt package compi=
led with<br>
=C2=A0 meta-darwin is empty, because the dylib files are not contained in F=
ILES_${PN}<br>
- nothing actually produces a file libcrypt-*.so (the symlink file is libcr=
ypt.so, without dash), thus<br>
=C2=A0 defining FILES:${PN} manually to contain libcrypt-*.so has no effect=
.<br>
<br>
Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.co=
m" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/libxcrypt/libxcrypt.inc | 6 ------<br>
=C2=A01 file changed, 6 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/=
libxcrypt/libxcrypt.inc<br>
index 61b0381076..454a55d73d 100644<br>
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc<br>
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc<br>
@@ -17,12 +17,6 @@ SRC_URI +=3D &quot;file://fix_cflags_handling.patch&quot=
;<br>
<br>
=C2=A0PROVIDES =3D &quot;virtual/crypt&quot;<br>
<br>
-FILES:${PN} =3D &quot;${libdir}/libcrypt*.so.* \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/libcrypt-=
*.so \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/libowcryp=
t*.so.* \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/libowcryp=
t-*.so \<br>
-&quot;<br>
-<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0BUILD_CPPFLAGS =3D &quot;-I${STAGING_INCDIR_NATIVE}&quot;<br>
-- <br>
2.36.1.vfs.0.0<br>
<br>
</blockquote></div>

--0000000000003b5e9b05fdaf2052--

