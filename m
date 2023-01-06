Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3352C3DA7A
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 10:31:49 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.10753.1673001103520936784
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 02:31:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Crg4wVUj;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id j17so1415236lfr.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 02:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IvcGkHxe3uEVIFpU6mr1vNWMx6LJEpJuL2u5JQ1+IIk=;
        b=Crg4wVUjRs0cjLxglCiposJnTheTY6WzJFi55nD2PdKLUzD9LKjh+af52D8b2f0u/W
         nzN0GGzS8HCvqYV/Xj6mPlZD4hr2EZQPd7UgoPqfrWDO1ouAUQcEB3UUfSVlWC/kbHNZ
         MpXy3426C9j04rTY4P5KOds7a5CPL4APjEqXNgYSoQ4klOxe/ukpiYpfZojTkvv5uc4B
         +rNyGoLzoSjbhaUWAJJxwgHpEIJIx75ESoQhFPAa6IDSLTlETRg2UWTpbs4Bz8vwDPm+
         +CyBcaxC0AsToZy5HkC9WRFjUsWHOlkhbGB9eDOfJ7IAmYKNblreSFT2sgy8xh9HCHg8
         3Xvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvcGkHxe3uEVIFpU6mr1vNWMx6LJEpJuL2u5JQ1+IIk=;
        b=j9RPG+ZaROsdw92dpZrOJ6e89taB1uasYUKSyPXQnfa6IHV5T7pVaeDLpLjrCSb2zM
         jKu+uB2ispX9gljV+HOqOn38kUeJf68c/B86qXvx3XIHxvlxRIZQI5aFIrI8hbcz3YMi
         r2t+rN7XK41HJ/Lp1uBMsmss6EBNOOELGKSqdkXw/pHTH9GvhJgSnNaAbZkK0db9bwDP
         e5LgZhsx9Rb7iBM7fvrK2lVT0AU/BFL7yi3wFOMFV7Pu+Y2WNtA9aveVrMTuXqFTFYZ7
         6c0H+poZ0PDC5NJz1V9iAW+0COJ5tpB3XUzZX9B3+vIuSeIlmk/tjvlQCQf9kqYXqwhB
         Km+w==
X-Gm-Message-State: AFqh2koJAOllZlxuHXQaPvXAf0YSgIqBYInEpJUyq+QR9Lk1x+kDbp39
	l2pHlTJJkDlLTKRy2mfAYKm+8MrPHASBICZIWdI=
X-Google-Smtp-Source: AMrXdXsHGRDNhZlmqS0GyCPny/eWhwicCFLwWZpRzcV28dtS5hcpRp12gTCZseNSdXil0pRPf9tP3aJ6oYRoyZ0CSCI=
X-Received: by 2002:a05:6512:36da:b0:4cc:6db2:19b6 with SMTP id
 e26-20020a05651236da00b004cc6db219b6mr50949lfs.367.1673001101287; Fri, 06 Jan
 2023 02:31:41 -0800 (PST)
MIME-Version: 1.0
References: <20230106100806.838732-1-mingli.yu@eng.windriver.com>
In-Reply-To: <20230106100806.838732-1-mingli.yu@eng.windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 6 Jan 2023 11:31:30 +0100
Message-ID: <CANNYZj_cxDBBbe3mz3R5qiiqeSaiQp-Q6Sj_druYWbXcxeFDVQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libportal: add opengl to REQUIRED_DISTRO_FEATURES
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000059e83305f195ec9b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 10:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175570

--00000000000059e83305f195ec9b
Content-Type: text/plain; charset="UTF-8"

Please stop. What problem does adding this solve?

Alex

On Fri 6. Jan 2023 at 11.08, Yu, Mingli <mingli.yu@eng.windriver.com> wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
>
> libportal depends on gtk4 which needs opengl DISTRO_FEATURES, so
> add opengl DISTRO_FEATURES requirement for libportal too.
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-gnome/libportal/libportal_0.6.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-gnome/libportal/libportal_0.6.bb
> b/meta/recipes-gnome/libportal/libportal_0.6.bb
> index ca58ef4138..cb3c5631d9 100644
> --- a/meta/recipes-gnome/libportal/libportal_0.6.bb
> +++ b/meta/recipes-gnome/libportal/libportal_0.6.bb
> @@ -14,6 +14,7 @@ inherit meson gi-docgen gobject-introspection vala
> features_check pkgconfig
>  GIDOCGEN_MESON_OPTION = 'docs'
>
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> +REQUIRED_DISTRO_FEATURES = "opengl"
>
>  DEPENDS += "glib-2.0 glib-2.0-native gtk+3 gtk4"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175568):
> https://lists.openembedded.org/g/openembedded-core/message/175568
> Mute This Topic: https://lists.openembedded.org/mt/96090762/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000059e83305f195ec9b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Please stop. What problem does adding this solve?</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri 6. Jan 2023 a=
t 11.08, Yu, Mingli &lt;<a href=3D"mailto:mingli.yu@eng.windriver.com">ming=
li.yu@eng.windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-=
style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">From: Ming=
li Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" target=3D"_blank">ming=
li.yu@windriver.com</a>&gt;<br>
<br>
libportal depends on gtk4 which needs opengl DISTRO_FEATURES, so<br>
add opengl DISTRO_FEATURES requirement for libportal too.<br>
<br>
Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" tar=
get=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-gnome/libportal/<a href=3D"http://libportal_0.6.bb" rel=
=3D"noreferrer" target=3D"_blank">libportal_0.6.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-gnome/libportal/<a href=3D"http://libportal_0.6.b=
b" rel=3D"noreferrer" target=3D"_blank">libportal_0.6.bb</a> b/meta/recipes=
-gnome/libportal/<a href=3D"http://libportal_0.6.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libportal_0.6.bb</a><br>
index ca58ef4138..cb3c5631d9 100644<br>
--- a/meta/recipes-gnome/libportal/<a href=3D"http://libportal_0.6.bb" rel=
=3D"noreferrer" target=3D"_blank">libportal_0.6.bb</a><br>
+++ b/meta/recipes-gnome/libportal/<a href=3D"http://libportal_0.6.bb" rel=
=3D"noreferrer" target=3D"_blank">libportal_0.6.bb</a><br>
@@ -14,6 +14,7 @@ inherit meson gi-docgen gobject-introspection vala featur=
es_check pkgconfig<br>
=C2=A0GIDOCGEN_MESON_OPTION =3D &#39;docs&#39;<br>
<br>
=C2=A0ANY_OF_DISTRO_FEATURES =3D &quot;${GTK3DISTROFEATURES}&quot;<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;glib-2.0 glib-2.0-native gtk+3 gtk4&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#175568): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/175568" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/175568</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96090762/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/96090762/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000059e83305f195ec9b--

