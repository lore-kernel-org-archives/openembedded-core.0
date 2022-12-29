Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91570C4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 15:14:22 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.207158.1672326854963765747
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 07:14:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K8xQF5G9;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id p36so27856132lfa.12
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 07:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SvhXd3kyZkfcul6PArNpJIRNqA3DcKtUrAzonHkElfg=;
        b=K8xQF5G9UiGZ6DLwe+nUnfLOSdSadJT0nbV6fMHbZo8hwshzWP7NmZpCQ35P8SuOp/
         08ggpCsWl0g4FqsUbiFfqK6RD8h3z/9oS+0NISyIzPrHHf0GG3Laf0j4f/Y6XlbPgdC0
         Fjz4phGl0rT5riOhRqmsMCzeTXcwIeCMs3+XXtkxj/thjLVxeOofVo+zi/48Eai2z0Np
         kB64zymgmbQNCynlqDF5PYUloiiSReMD0U+LQW+WsPXwQE1tsnlF6E7gSoNbSPcqMdj7
         /nXwxVDlQpaSjhidAeCLt08f2VIYxrvZ238zAHS0S6j3cjPSY2SoOPJxVaYTCjE95SeH
         Ei4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SvhXd3kyZkfcul6PArNpJIRNqA3DcKtUrAzonHkElfg=;
        b=2wcJHD1aT3xQC/31FKSWQaPbSBaIU6VZAxAXBFpVuhmv0G4Xar++db0y4qaAXFon33
         e96wShFNKv9M1y/oqpyqvgz2aDNo7kOpbdhwilHUiuhkrAR452D4ttlM0qkRwVyI6yGJ
         vYo8o2yS7crkhViqvzJgnN22HfNTqwJAuR+EIXTJgWg8isZ+rn6fbNAzfCXfqoy0T/1c
         lvEHr5LzmgzbWb2JwQAq4yrq/pG4AssZ+b3fKjHUpAOGeevBsOE3utiClguJ69L1yfKA
         cL4lN06NMAX62IhAbjLTJesyfepVNqu8DKmV8I0mhvVvO5xbtolAeX+wSm2VDB0V5Dz6
         Qc/A==
X-Gm-Message-State: AFqh2kq/SY98TeGbjANJfAUPsxUtFvrNYFsb5sC16dt+eGNj7yMfHCNR
	7JYnrC6UqKoUd6xHxtjbv8dVtpdvYeo0SJoSIII=
X-Google-Smtp-Source: AMrXdXsBApGg0wyXHPomjYJQcOEmU7uc863XQ2AeSgpFthfOkwKaZ6VhkERK5cDWWEMEpZNfAuW6Mw89maXDloHsqFg=
X-Received: by 2002:ac2:5c5a:0:b0:4cb:154d:2178 with SMTP id
 s26-20020ac25c5a000000b004cb154d2178mr321978lfp.367.1672326852989; Thu, 29
 Dec 2022 07:14:12 -0800 (PST)
MIME-Version: 1.0
References: <20221229151110.224320-1-f_l_k@t-online.de>
In-Reply-To: <20221229151110.224320-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 29 Dec 2022 16:14:02 +0100
Message-ID: <CANNYZj-gY4N=95D39TcAy0OWoi+rOkb2pN1beZy_UOiY3BYRaA@mail.gmail.com>
Subject: Re: [oe-core][PATCH] gtk-icon-cache.bbclass: replace += by :append
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000005568105f0f8f0d3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 15:14:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175102

--00000000000005568105f0f8f0d3
Content-Type: text/plain; charset="UTF-8"

But what is the actual issue? Did depends end up malformed, and how?

Alex

On Thu 29. Dec 2022 at 16.11, Markus Volk <f_l_k@t-online.de> wrote:

> While updating gnome-control-center I encountered an issue where
> gtk-update-icon-cache could not be found and do_configure failed:
>
> | Program glib-compile-schemas found: YES (glib-compile-schemas)
> | Program gtk4-update-icon-cache found: NO
> | Program gtk-update-icon-cache found: NO
> |
> | ../gnome-control-center-43.2/meson.build:298:6: ERROR: Program
> 'gtk-update-icon-cache' not found or not executable
>
> This can be fixed by using DEPENDS:append instead of DEPENDS +=
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/classes-recipe/gtk-icon-cache.bbclass | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes-recipe/gtk-icon-cache.bbclass
> b/meta/classes-recipe/gtk-icon-cache.bbclass
> index 9ecb49916c..2096dcfcbb 100644
> --- a/meta/classes-recipe/gtk-icon-cache.bbclass
> +++ b/meta/classes-recipe/gtk-icon-cache.bbclass
> @@ -16,10 +16,11 @@ GTKIC_CMD = "${@ 'gtk4-update-icon-cache' if
> d.getVar('GTKIC_VERSION') == '4' el
>  inherit features_check
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
> -DEPENDS +=" ${@ '' if d.getVar('BPN') == 'hicolor-icon-theme' else
> 'hicolor-icon-theme' } \
> -            ${@ '' if d.getVar('BPN') == 'gdk-pixbuf' else 'gdk-pixbuf' }
> \
> -            ${@ '' if d.getVar('BPN') == d.getVar('GTKPN') else
> d.getVar('GTKPN') } \
> -            ${GTKPN}-native \
> +DEPENDS:append = " \
> +       ${@ '' if d.getVar('BPN') == 'hicolor-icon-theme' else
> 'hicolor-icon-theme' } \
> +       ${@ '' if d.getVar('BPN') == 'gdk-pixbuf' else 'gdk-pixbuf' } \
> +       ${@ '' if d.getVar('BPN') == d.getVar('GTKPN') else
> d.getVar('GTKPN') } \
> +       ${GTKPN}-native \
>  "
>
>  PACKAGE_WRITE_DEPS += "${GTKPN}-native gdk-pixbuf-native"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175101):
> https://lists.openembedded.org/g/openembedded-core/message/175101
> Mute This Topic: https://lists.openembedded.org/mt/95937867/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000005568105f0f8f0d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">But what is the actual issue? Did depends end up malforme=
d, and how?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Thu 29. Dec 2022 at 16.11, Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online=
.de">f_l_k@t-online.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-s=
tyle:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">While updat=
ing gnome-control-center I encountered an issue where<br>
gtk-update-icon-cache could not be found and do_configure failed:<br>
<br>
| Program glib-compile-schemas found: YES (glib-compile-schemas)<br>
| Program gtk4-update-icon-cache found: NO<br>
| Program gtk-update-icon-cache found: NO<br>
|<br>
| ../gnome-control-center-43.2/meson.build:298:6: ERROR: Program &#39;gtk-u=
pdate-icon-cache&#39; not found or not executable<br>
<br>
This can be fixed by using DEPENDS:append instead of DEPENDS +=3D<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/gtk-icon-cache.bbclass | 9 +++++----<br>
=C2=A01 file changed, 5 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/gtk-icon-cache.bbclass b/meta/classes-reci=
pe/gtk-icon-cache.bbclass<br>
index 9ecb49916c..2096dcfcbb 100644<br>
--- a/meta/classes-recipe/gtk-icon-cache.bbclass<br>
+++ b/meta/classes-recipe/gtk-icon-cache.bbclass<br>
@@ -16,10 +16,11 @@ GTKIC_CMD =3D &quot;${@ &#39;gtk4-update-icon-cache&#39=
; if d.getVar(&#39;GTKIC_VERSION&#39;) =3D=3D &#39;4&#39; el<br>
=C2=A0inherit features_check<br>
=C2=A0ANY_OF_DISTRO_FEATURES =3D &quot;${GTK3DISTROFEATURES}&quot;<br>
<br>
-DEPENDS +=3D&quot; ${@ &#39;&#39; if d.getVar(&#39;BPN&#39;) =3D=3D &#39;h=
icolor-icon-theme&#39; else &#39;hicolor-icon-theme&#39; } \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@ &#39;&#39; if d.getVar(&#39;=
BPN&#39;) =3D=3D &#39;gdk-pixbuf&#39; else &#39;gdk-pixbuf&#39; } \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@ &#39;&#39; if d.getVar(&#39;=
BPN&#39;) =3D=3D d.getVar(&#39;GTKPN&#39;) else d.getVar(&#39;GTKPN&#39;) }=
 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${GTKPN}-native \<br>
+DEPENDS:append =3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${@ &#39;&#39; if d.getVar(&#39;BPN&#39;) =3D=
=3D &#39;hicolor-icon-theme&#39; else &#39;hicolor-icon-theme&#39; } \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${@ &#39;&#39; if d.getVar(&#39;BPN&#39;) =3D=
=3D &#39;gdk-pixbuf&#39; else &#39;gdk-pixbuf&#39; } \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${@ &#39;&#39; if d.getVar(&#39;BPN&#39;) =3D=
=3D d.getVar(&#39;GTKPN&#39;) else d.getVar(&#39;GTKPN&#39;) } \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${GTKPN}-native \<br>
=C2=A0&quot;<br>
<br>
=C2=A0PACKAGE_WRITE_DEPS +=3D &quot;${GTKPN}-native gdk-pixbuf-native&quot;=
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#175101): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/175101" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/175101</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95937867/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/95937867/1686489</a><br>
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

--00000000000005568105f0f8f0d3--

