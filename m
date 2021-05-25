Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web09.1449.1621965379899046543
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 10:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VMq/P776;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id o192so16476959vsd.7
        for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 10:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=No89LmAgP2lkbC2pKNpOPwT4DrhA/Tz+ZpEKDX5napk=;
        b=VMq/P776O43w2lCXYKMNLXwJhXS+Is6JK3BnnfX43ZJs8fzEAxBdRa9LroQTEgM/6L
         gsXDS6TysfOsZL5/AhY5RXpTnE5JOiNfP0gPGA+HEYDScfccVvbiPeSc1LQ+p9tAe76Q
         vTcz25ONYh/iM0rUvj/l6w7XySWmhl/v5t5O4KZCJq+/izjIpPetfH1LvZc9XnVHKknF
         7gxt4Vg1lrctqCmo7sOgPfx/LkkQZRrRVKwSFKN7BovbGaTA8Np6nj885JvCQVs8ZYd+
         b2AhhHl8/CoYt2ybKsqV2el+ZbOdeEow0ayXymf2UMr6EuW6PnOQsxT/5tB4lDeBFT6X
         ryBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=No89LmAgP2lkbC2pKNpOPwT4DrhA/Tz+ZpEKDX5napk=;
        b=VaeQet9n0F4mtJIO9OAvUmjIvHcvRPGXpiYJ8EnnNlJ+g7BlCrpAfPRX/xt4cOLf1n
         LbEDv4K4M3N9D3CSQM+BzodyYxUaIij9Av6Y4yi5iZ+2MeAtwvAsSAM2A03MyzVVHr9f
         xtPXNzl2GMXSJV6P7wuLjBDeOU3lZfLw30NxvKR2TTNVz87krH0nEJn9QoJmGF4pBKzD
         +GzUK09RBZwjjbdK6RI8vO2803GC4nJGaKeJWugYCaiwEM/S2Vc7nRjeBbIiN5AHzZIQ
         I9jKSgHcAtIaahBXO+Meuknq/7rgwXze2+OeDKiRwJZbdUjOMO3KFzOvOa+SHKjtaKbq
         9wRw==
X-Gm-Message-State: AOAM530T2IR5T7T+rak9C3GlrLQ/zoEp8fyh21+smc9jMLEu+mNvSBzQ
	xTLlRS41kXrl9gptOX5zqL8EiJp+RFZSlYKfzXYU9ETkHeo=
X-Google-Smtp-Source: ABdhPJyWENbKKTE+9UbSvizHFxeXQLkN3o8uTRJ2pt+DPoxDUOk90n+mz+qY0rDA+xz7dhqel8sRQzsgQ49YWIYe5T8=
X-Received: by 2002:a67:d715:: with SMTP id p21mr26636495vsj.31.1621965379089;
 Tue, 25 May 2021 10:56:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210525151709.522795-1-christophe.priouzeau@foss.st.com>
In-Reply-To: <20210525151709.522795-1-christophe.priouzeau@foss.st.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 25 May 2021 19:56:07 +0200
Message-ID: <CANNYZj_uvYkm5Ld_dyD_xMKO-CACy-c-oiSowZUM8qNHsav2fQ@mail.gmail.com>
Subject: Re: [OE-core] [hardknott][PATCH 1/2] glib-2.0: use python3targetconfig
To: cpriouzeau <christophe.priouzeau@foss.st.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004239f305c32b3e6b"

--0000000000004239f305c32b3e6b
Content-Type: text/plain; charset="UTF-8"

Same here: this needs to go to master first, and better explained, as we
are not seeing those issues.

Alex

On Tue, 25 May 2021 at 17:17, cpriouzeau <christophe.priouzeau@foss.st.com>
wrote:

> Meson request to have a valid python, meson-log indicate that
> issue come from:
> ModuleNotFoundError: No module named '_sysconfigdata'
>
> Signed-off-by: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
> ---
>  meta/recipes-core/glib-2.0/glib.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/glib-2.0/glib.inc
> b/meta/recipes-core/glib-2.0/glib.inc
> index 71777bc459..1b513654d8 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -29,6 +29,7 @@ PACKAGES += "${PN}-codegen ${PN}-utils"
>  LEAD_SONAME = "libglib-2.0.*"
>
>  inherit meson gettext gtk-doc pkgconfig ptest-gnome
> upstream-version-is-even bash-completion gio-module-cache manpages
> +inherit python3targetconfig
>
>  DEPENDS_append_class-target = "${@' gtk-doc' if
> d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
>
> --
> 2.25.1
>
>
> 
>
>

--0000000000004239f305c32b3e6b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Same here: this needs to go to master first, and bett=
er explained, as we are not seeing those issues.</div><div><br></div><div>A=
lex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Tue, 25 May 2021 at 17:17, cpriouzeau &lt;<a href=3D"mailto=
:christophe.priouzeau@foss.st.com">christophe.priouzeau@foss.st.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Meson re=
quest to have a valid python, meson-log indicate that<br>
issue come from:<br>
ModuleNotFoundError: No module named &#39;_sysconfigdata&#39;<br>
<br>
Signed-off-by: Christophe Priouzeau &lt;<a href=3D"mailto:christophe.priou=
zeau@foss.st.com" target=3D"_blank">christophe.priouzeau@foss.st.com</a>&gt=
;<br>
---<br>
=C2=A0meta/recipes-core/glib-2.0/glib.inc | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-=
2.0/glib.inc<br>
index 71777bc459..1b513654d8 100644<br>
--- a/meta/recipes-core/glib-2.0/glib.inc<br>
+++ b/meta/recipes-core/glib-2.0/glib.inc<br>
@@ -29,6 +29,7 @@ PACKAGES +=3D &quot;${PN}-codegen ${PN}-utils&quot;<br>
=C2=A0LEAD_SONAME =3D &quot;libglib-2.0.*&quot;<br>
<br>
=C2=A0inherit meson gettext gtk-doc pkgconfig ptest-gnome upstream-version=
-is-even bash-completion gio-module-cache manpages<br>
+inherit python3targetconfig<br>
<br>
=C2=A0DEPENDS_append_class-target =3D &quot;${@&#39; gtk-doc&#39; if d.get=
Var(&#39;GTKDOC_ENABLED&#39;) =3D=3D &#39;True&#39; else &#39;&#39;}&quot;<=
br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000004239f305c32b3e6b--
