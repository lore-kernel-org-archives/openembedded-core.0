Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.web12.1463.1621965351323430824
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 10:55:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hS0AQocS;
 spf=pass (domain: gmail.com, ip: 209.85.222.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id n61so11078930uan.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 10:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kzaFxrGHj4IXKkhHUHkFny9+iHMlI+fbEvtniYC+m7E=;
        b=hS0AQocSgLdkQF2LBFYiQZmiKarCVkxiOE/2PHci23fFuYab1N/IzPO/1L+puBkTK5
         iezdT8dX2ZzC3C2n/hheIRi+/VTdC2CipWhIS+Mr347WbNH840ci164V5DJYiLfEFTJs
         5kbfpINXTS+xTlRJiCfTy00qomdXYj+aFRPJBUAVL5wzXu82IaK5/O0uRuADM8oheg0d
         3Fx1mLDh09ArQOrfJphEjSbfjW6+nFyKTarENxzTUryTTJAk6wZdSnI25Gy/uZ5qOZSC
         LbAGObUk40w2LaQPd5TswSM68jHyBshynOu0MyXExSxGL7EBd1FbtFVlX+ep1Rr2WzSg
         qV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kzaFxrGHj4IXKkhHUHkFny9+iHMlI+fbEvtniYC+m7E=;
        b=WZhXiGFSP4+ccFW7ssVXoJlF/9zCu/4pf9u7zg0M/jCcsxOGzMT4XNAzTBWo2Mi+RV
         Dn09FdZTrGlPJK5ZVCayasOb/JFh0bCGdl2yr/QTZCh/n9xL72oFOlsjQT8Wl+KJo5+x
         PFgjHkjMXoqCfSDx9wptqH2xPT3KlVK2+lF8kivi/4AguBWZ8hh9PSkQjhic3i9/zBKb
         fT9G8T0psPvNIajPO8sfonZwq7lEeLqv1zMAmUWm/84AGDVmTffsyC+dIXv1lilvokNc
         S6+Eo+ps3JpJOh5squu1WkawzDYbAtTuvExm21AFXpRq2EAMVAPh+H61ol/e9hW7dM+S
         oNXg==
X-Gm-Message-State: AOAM531wrOjj/TJd44uvA1/zOkbgOKGW6yV2/rWTo/o35UMGdOMi46kN
	zCwvlaGfdzJFygjaoJOg3vaoc42WZq2j0W/mLsjbS7Cs
X-Google-Smtp-Source: ABdhPJxS3txCBcxC4R2O6n7wnchou9eXlGwolrFF/GSOIjEhDcV14iOwg+GC7Va446D/y1lCQUqU/pDwWpePeFx/i6c=
X-Received: by 2002:ab0:35ed:: with SMTP id w13mr28573125uau.22.1621965350404;
 Tue, 25 May 2021 10:55:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210525151709.522795-1-christophe.priouzeau@foss.st.com> <20210525151709.522795-2-christophe.priouzeau@foss.st.com>
In-Reply-To: <20210525151709.522795-2-christophe.priouzeau@foss.st.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 25 May 2021 19:55:39 +0200
Message-ID: <CANNYZj9PnhZDcz7cuHDR3PjZ=JbimkYhTEQHN2Hm8r0qSHZj0w@mail.gmail.com>
Subject: Re: [OE-core] [hardknott][PATCH 2/2] mesa: use python3targetconfig
To: cpriouzeau <christophe.priouzeau@foss.st.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008c863005c32b3ce0"

--0000000000008c863005c32b3ce0
Content-Type: text/plain; charset="UTF-8"

This needs to go to master first, and better explained, as we are not
seeing those issues.

Alex

On Tue, 25 May 2021 at 17:17, cpriouzeau <christophe.priouzeau@foss.st.com>
wrote:

> Meson request to have a valid python, meson-log indicate that
> issue come from:
> ModuleNotFoundError: No module named '_sysconfigdata'
>
> Signed-off-by: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> index a85f94c75e..de39dc34e4 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -43,7 +43,7 @@ PROVIDES = " \
>      virtual/mesa \
>      "
>
> -inherit meson pkgconfig python3native gettext features_check
> +inherit meson pkgconfig python3native gettext features_check
> python3targetconfig
>
>  BBCLASSEXTEND = "native nativesdk"
>
> --
> 2.25.1
>
>
> 
>
>

--0000000000008c863005c32b3ce0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This needs to go to master first, and better explaine=
d, as we are not seeing those issues.</div><div><br></div><div>Alex<br></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Tue, 25 May 2021 at 17:17, cpriouzeau &lt;<a href=3D"mailto:christophe=
.priouzeau@foss.st.com">christophe.priouzeau@foss.st.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Meson request to ha=
ve a valid python, meson-log indicate that<br>
issue come from:<br>
ModuleNotFoundError: No module named &#39;_sysconfigdata&#39;<br>
<br>
Signed-off-by: Christophe Priouzeau &lt;<a href=3D"mailto:christophe.priou=
zeau@foss.st.com" target=3D"_blank">christophe.priouzeau@foss.st.com</a>&gt=
;<br>
---<br>
=C2=A0meta/recipes-graphics/mesa/mesa.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/m=
esa/mesa.inc<br>
index a85f94c75e..de39dc34e4 100644<br>
--- a/meta/recipes-graphics/mesa/mesa.inc<br>
+++ b/meta/recipes-graphics/mesa/mesa.inc<br>
@@ -43,7 +43,7 @@ PROVIDES =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0virtual/mesa \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-inherit meson pkgconfig python3native gettext features_check<br>
+inherit meson pkgconfig python3native gettext features_check python3targe=
tconfig<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000008c863005c32b3ce0--
