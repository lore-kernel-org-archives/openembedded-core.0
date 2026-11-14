Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4020.1794688319267702708
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2026 12:31:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=Y5KqMBpp;
 spf=pass (domain: snapchat.com, ip: 209.85.221.48, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so2061185f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 12:31:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794688317; cv=none;
        d=google.com; s=arc-20260327;
        b=VqhiLGrme+QYqFxvFAanEeVbR42FySo5UaKZJ1d4kA6zcR4yP5thQbaDMSQHZaREHH
         nFGH0HUOUn3D9zekN1XBsIZAovBaajPr2of9Rx4R7uc9VvCjaPDgLNuhlZEU8Vwf0jWx
         d5eDiaaBFwXIHNhvoi2M7bBdhWhzoMz2DUE6FnTfxAFjV9s0MlPlDfkmNApAcaC8XRhK
         w3Qh9T2NMroKcZyqREud3+MDLddlo0hfWQzDmq1GDt4Mp4+EiGm7HyltCeZ63ItM20d4
         nGLN69w/T+/Ms1b13vuUZderKeguZYjCPLos1HrVTnLVSIfK3a8YooAhCMEXX0bjmgun
         9kbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KL7FBUgtqlCXjxszKIa99mds8hcJNi9wM0ZDBkqv+DU=;
        fh=H56AyHnw6BBSjL3M2DQDQ3rn0dO60oflU7760UsY52E=;
        b=hVHNtrDJMk8NJglgN7bRuzGlVXtlBFYm1dwOVtpJQvI+GPi8i6vZT15x3ditug0rRS
         iI0rH/g2RGSULzvD1xJvLUbxJMpRseiI56V6iwthxB3IyA05UQxunnl7ZFPdqvWz2JuY
         7kWJUt34WX44ORLTypUiTsnB3O5QMwWdrRLlvML9tyOtbagfotQwiSkpRV/T/q90aKri
         xAW19P48MOgLzjnIOP1+/LoKrPWMZdn0tGJu+SfdBDaRzacSt7iwL9gHEQ/T8Se6Bkqn
         lu0Cb29icDF98adsjUPUVetXsfit2v7ho0TzkFjCfPsY2ZlFRITzD9LI+/585kJb4O8b
         C7rw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1794688317; x=1795293117; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KL7FBUgtqlCXjxszKIa99mds8hcJNi9wM0ZDBkqv+DU=;
        b=Y5KqMBppfBoWDefQMRZ0dl/Nf56eis8utO00StvUfc7i5H6vu55ZuomEa9nf4iI+/w
         wSWPh6Jod38BReVnoB4DVhRerhdOjNIKMIXN2DUiXpcUztDkS410abtEwiqCeWDYdYQU
         ozZgkh8+sP2cq2m+ai0OM7dWcrD95ft2QZtfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794688317; x=1795293117;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KL7FBUgtqlCXjxszKIa99mds8hcJNi9wM0ZDBkqv+DU=;
        b=AllYz8TwPPGD1lISPkfNJUWcNnI6KrNImXNAJixHxLLVIttBlStOXqKBc6EMe9m3dM
         hH99R9HXCK8cmgggpbynrjg1sXzH3NBW7dnpxnRyhBv25FmicCFEcDWYpbG8gkz6oLx6
         e0ZvRUXZb+8aXESPzFK1XX3hHW0DA4ZTIEkh+i8nFfab2nW1wHtWeTkAa+/+d2PhNzab
         c0SLMXqKH90RiiD9BF5x35/a+L3aDAR95oG/5CUIm7cllstIFDScc8Nicm7ob7Qm9Efx
         m+VFQc6wjc3ajAdQ7KtN5YlxO010DoN3YEfMx7H89SouTUFPmXBa5Ej4wNvTrZj04t55
         3Unw==
X-Gm-Message-State: APuU4Z+kduGLkkLauDiz9J85sruukPeukJZ/srJl9TEB5x3avRMdmw4o
	tIaSTfRUbt8dtRe70U3g02xDHbAMKV671H6T92KkIQmYMQ+434epz13w93pAFT+EHzArMmZ/HIW
	JfWAlh6vuy8bvlKmQfdiHqbic045qZtAC+RSLC760LQ==
X-Gm-Gg: AYBFou0lI5wHFwi6AIs5T3i6htEnrbPVNSbu2wz3f13kHM2o4pfA2mZbfGadgjN5f/M
	93in3cU+my7TgmdPwK+XzVpD8iG73/CvDQ4Fj3xqetU7lK0Jv3kdJQER56K1Hb+kxijAR0eiLsl
	q4eSCLR+V8pppi54VSlekrJun0bg26yha/0lN3SpgPNf/JbjV6os9F8lOOhv8p4OOkvCOHmONKR
	VbzdWpzGKkn3L4eGyIAmE6kU4LldHX7OYRs4nqBgK6g/eedVTP/3zsR5WYNVnVxgV/zH5o3qi4i
	UcTqZeMrM4RpZALQrtIdHPI+3D5A3X1AgV9n3ghjdpFYJqhFhP4cb1O8hAjmkORFjMIxXIsbHVp
	h6m81TswocddGfU9tabXGjHCfvgHJC/iGqFNwAYkcc1ZghXd3mT1dlJWmxdK4QyDfQSME
X-Received: by 2002:adf:e190:0:b0:493:8847:841b with SMTP id
 ffacd0b85a97d-49c70b059e9mr13285699f8f.19.1794688317251; Sat, 14 Nov 2026
 12:31:57 -0800 (PST)
MIME-Version: 1.0
References: <20261114185527.6-1-bbnpreetsingh@gmail.com>
In-Reply-To: <20261114185527.6-1-bbnpreetsingh@gmail.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Sat, 14 Nov 2026 21:31:44 +0100
X-Gm-Features: AclHuK813gy36j-6ZsrALMMF2X_YL41NvXdmrhDh6vwlAwr8DpME4mEMxBNKVcU
Message-ID: <CAHUKmYb=jHKjAhikuC31BXYrM12oSrhb0=4Fa4TmFx_qBFs8Rw@mail.gmail.com>
Subject: Re: [PATCH] kernel.bbclass: keep the sources when do_symlink_kernsrc reruns
To: Babanpreet Singh <bbnpreetsingh@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Julien Stephan <jstephan@baylibre.com>
Content-Type: multipart/alternative; boundary="000000000000a2211c0660426f34"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 20:32:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250212

--000000000000a2211c0660426f34
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Babanpreet,

are you aware of
https://lists.openembedded.org/g/openembedded-core/topic/103308574?msg=3D19=
2851#msg192851
? It has some useful context about what I had tried a while ago.

=C3=89tienne

On Sat, Nov 14, 2026 at 7:55=E2=80=AFPM Babanpreet Singh <bbnpreetsingh@gma=
il.com>
wrote:

> With S outside STAGING_KERNEL_DIR, a second do_symlink_kernsrc without
> do_unpack deletes the sources and leaves STAGING_KERNEL_DIR as a link
> to itself:
>
>   do_kernel_checkout: [Errno 17] File exists: '.../linux-yocto-7.2.13+git=
'
>
> S is already a symlink to STAGING_KERNEL_DIR by then. Skip the move
> when the two resolve to the same directory.
>
> [YOCTO #15325]
>
> Suggested-by: Julien Stephan <jstephan@baylibre.com>
> Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
> ---
>  meta/classes-recipe/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> index 46da867a63..44223a4712 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -196,7 +196,7 @@ do_clean[cleandirs] +=3D " ${S} ${STAGING_KERNEL_DIR}
> ${B} ${STAGING_KERNEL_BUILDD
>  python do_symlink_kernsrc () {
>      s =3D d.getVar("S")
>      kernsrc =3D d.getVar("STAGING_KERNEL_DIR")
> -    if s !=3D kernsrc:
> +    if os.path.realpath(s) !=3D os.path.realpath(kernsrc):
>          bb.utils.mkdirhier(kernsrc)
>          bb.utils.remove(kernsrc, recurse=3DTrue)
>          if s[-1] =3D=3D '/':
> --
> 2.43.0
>
>

--000000000000a2211c0660426f34
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Babanpreet,<br><br><div>are you aware of <a href=
=3D"https://lists.openembedded.org/g/openembedded-core/topic/103308574?msg=
=3D192851#msg192851">https://lists.openembedded.org/g/openembedded-core/top=
ic/103308574?msg=3D192851#msg192851</a> ? It has some useful context about =
what I had tried a while ago.<br><br>=C3=89tienne</div></div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Sat, Nov 14, 2026 at 7:55=E2=80=AFPM Babanpreet Singh &lt;<a href=3D"m=
ailto:bbnpreetsingh@gmail.com">bbnpreetsingh@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">With S outside STAGIN=
G_KERNEL_DIR, a second do_symlink_kernsrc without<br>
do_unpack deletes the sources and leaves STAGING_KERNEL_DIR as a link<br>
to itself:<br>
<br>
=C2=A0 do_kernel_checkout: [Errno 17] File exists: &#39;.../linux-yocto-7.2=
.13+git&#39;<br>
<br>
S is already a symlink to STAGING_KERNEL_DIR by then. Skip the move<br>
when the two resolve to the same directory.<br>
<br>
[YOCTO #15325]<br>
<br>
Suggested-by: Julien Stephan &lt;<a href=3D"mailto:jstephan@baylibre.com" t=
arget=3D"_blank">jstephan@baylibre.com</a>&gt;<br>
Signed-off-by: Babanpreet Singh &lt;<a href=3D"mailto:bbnpreetsingh@gmail.c=
om" target=3D"_blank">bbnpreetsingh@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass<br>
index 46da867a63..44223a4712 100644<br>
--- a/meta/classes-recipe/kernel.bbclass<br>
+++ b/meta/classes-recipe/kernel.bbclass<br>
@@ -196,7 +196,7 @@ do_clean[cleandirs] +=3D &quot; ${S} ${STAGING_KERNEL_D=
IR} ${B} ${STAGING_KERNEL_BUILDD<br>
=C2=A0python do_symlink_kernsrc () {<br>
=C2=A0 =C2=A0 =C2=A0s =3D d.getVar(&quot;S&quot;)<br>
=C2=A0 =C2=A0 =C2=A0kernsrc =3D d.getVar(&quot;STAGING_KERNEL_DIR&quot;)<br=
>
-=C2=A0 =C2=A0 if s !=3D kernsrc:<br>
+=C2=A0 =C2=A0 if os.path.realpath(s) !=3D os.path.realpath(kernsrc):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.mkdirhier(kernsrc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.remove(kernsrc, recurse=3DTrue)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if s[-1] =3D=3D &#39;/&#39;:<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div>

--000000000000a2211c0660426f34--
