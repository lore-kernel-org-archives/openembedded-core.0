Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB56C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 10:35:17 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web08.8625.1647513315760019900
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 03:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jQZqFKSa;
 spf=pass (domain: gmail.com, ip: 209.85.167.53,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id p6so1051116lfh.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 03:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O2WW2763NTQepIAPHBTIQF5NJtgbAQ+EeVF/vVnzSyk=;
        b=jQZqFKSa78LnWNb8H+dAbFmhxCGCBEJbttQvm48jvmOnxZrK7jdZ4s7yHWxTIrOCT1
         rI1LCJafgMsW3+iSUydu/TftcJyDUL36a5sgyS8DDo6Lh3O/HCpPPOKXqAMxEnZVWtaQ
         z2i2ZZA+JhAX3UmHKBQpz5PH33FviVxzObkukaxbisl9bahKhTmNc9vplKOdnYopPzr1
         +3IJyfZ1CuWgXDwe5YXvuolGSXGBT8yTLsbxgLMi3ZE+yvs8rnLCNFYWG/9yZnRP1hiJ
         jZ/ZvybcK9KrO5RClJv7jKfFDJt7AHXJvxypcsifWBCNpve0PnkuO2Wv6hRCRlQgNeet
         Oeig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O2WW2763NTQepIAPHBTIQF5NJtgbAQ+EeVF/vVnzSyk=;
        b=tNJwjTsrT3cVQQ5frvslHkF6wUGYHWGJ5LPdP761r+vLXmv0RUwyDzMkzqmjJYgH42
         Y4FNZGL3aDGa4Nbjh1UHS10bYppvB+qV63SVNSPaoZI9wUKI2OJuICVu7h9HrpMzoMQM
         IyuitHo2X9y4U44OsTQBq/6Dd7c3txcMXpH05JqxrMa/2yqkqZl0cBXBwDiFAb8MVvEj
         oo1M2WC146aR089zYwMVnORbNDuVvGELUsgkzUR4UC6ijH9zVwbdvwNTffE6ZmAR8UvW
         ZQ64lX6GI1su1Xrdz0c6WoSARk5S3ZldfOnCCDphtR2cxU0J8BCqZkQfJstoRzQeDsLR
         5obg==
X-Gm-Message-State: AOAM530YiWUK59Inf6BEB4Rq7zGuaD/m/ShZwKU3JuKTYs5w6i9g0egc
	74YfpMl/uh5lRPl78qeuzT4tNqN+ciP8xaDGaKQ=
X-Google-Smtp-Source: 
 ABdhPJwUOyQvSyAFbZ/hvkOUczcxGstvY8VD1aqq36wZe5PJYueoCbbzG4wbCVJo4xqRriBcKdl3Y9KiXpmNUgmJznA=
X-Received: by 2002:a05:6512:ad3:b0:448:fe04:be5 with SMTP id
 n19-20020a0565120ad300b00448fe040be5mr2429268lfu.94.1647513313750; Thu, 17
 Mar 2022 03:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220317102915.2467957-1-zboszor@pr.hu>
In-Reply-To: <20220317102915.2467957-1-zboszor@pr.hu>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 17 Mar 2022 10:35:02 +0000
Message-ID: 
 <CANPvuRmsP2CaLsQ+akPA+J9yLgzq_5GOnzgtcYaSX9gVVj0pKg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: Fix libopencl-mesa-dev packaging
To: zboszor@pr.hu
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	=?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d4334805da67957d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 10:35:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163383

--000000000000d4334805da67957d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zolt=C3=A1n,

This patch seems to be a fixup for the previous

https://lists.openembedded.org/g/openembedded-core/message/163331

I think a v2 is more appropriate

Jose

Zoltan Boszormenyi via lists.openembedded.org <zboszor=3D
pr.hu@lists.openembedded.org> escreveu no dia quinta, 17/03/2022 =C3=A0(s) =
10:29:

> From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> index c6e85520f8..e8c07a4563 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -307,6 +307,7 @@ FILES:libglapi-dev =3D "${libdir}/libglapi.*"
>  FILES:libgles1-mesa-dev =3D "${libdir}/libGLESv1*.* ${includedir}/GLES
> ${libdir}/pkgconfig/glesv1*.pc"
>  FILES:libgles2-mesa-dev =3D "${libdir}/libGLESv2.* ${includedir}/GLES2
> ${libdir}/pkgconfig/glesv2.pc"
>  FILES:libgles3-mesa-dev =3D "${includedir}/GLES3"
> +FILES:libopencl-mesa-dev =3D "${libdir}/libMesaOpenCL.so"
>  FILES:libosmesa-dev =3D "${libdir}/libOSMesa.* ${includedir}/GL/osmesa.h
> ${libdir}/pkgconfig/osmesa.pc"
>  FILES:libxatracker-dev =3D "${libdir}/libxatracker.so ${libdir}/
> libxatracker.la \
>                            ${includedir}/xa_tracker.h
> ${includedir}/xa_composite.h ${includedir}/xa_context.h \
> --
> 2.35.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163382):
> https://lists.openembedded.org/g/openembedded-core/message/163382
> Mute This Topic: https://lists.openembedded.org/mt/89842284/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000d4334805da67957d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0<span style=3D"color:rgb(0,0,0)">Zolt=C3=A1n</span=
>,<br><br>This patch seems to be a fixup for the previous<div><br></div><di=
v><a href=3D"https://lists.openembedded.org/g/openembedded-core/message/163=
331">https://lists.openembedded.org/g/openembedded-core/message/163331</a><=
br></div><div><br></div><div>I think a v2 is more appropriate</div><div><br=
></div><div>Jose</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">Zoltan Boszormenyi via <a href=3D"http://lists.openem=
bedded.org">lists.openembedded.org</a> &lt;zboszor=3D<a href=3D"mailto:pr.h=
u@lists.openembedded.org">pr.hu@lists.openembedded.org</a>&gt; escreveu no =
dia quinta, 17/03/2022 =C3=A0(s) 10:29:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi &lt;<a=
 href=3D"mailto:zboszor@gmail.com" target=3D"_blank">zboszor@gmail.com</a>&=
gt;<br>
<br>
Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi &lt;<a href=3D"mailto=
:zboszor@gmail.com" target=3D"_blank">zboszor@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/mesa/mesa.inc | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc<br>
index c6e85520f8..e8c07a4563 100644<br>
--- a/meta/recipes-graphics/mesa/mesa.inc<br>
+++ b/meta/recipes-graphics/mesa/mesa.inc<br>
@@ -307,6 +307,7 @@ FILES:libglapi-dev =3D &quot;${libdir}/libglapi.*&quot;=
<br>
=C2=A0FILES:libgles1-mesa-dev =3D &quot;${libdir}/libGLESv1*.* ${includedir=
}/GLES ${libdir}/pkgconfig/glesv1*.pc&quot;<br>
=C2=A0FILES:libgles2-mesa-dev =3D &quot;${libdir}/libGLESv2.* ${includedir}=
/GLES2 ${libdir}/pkgconfig/glesv2.pc&quot;<br>
=C2=A0FILES:libgles3-mesa-dev =3D &quot;${includedir}/GLES3&quot;<br>
+FILES:libopencl-mesa-dev =3D &quot;${libdir}/libMesaOpenCL.so&quot;<br>
=C2=A0FILES:libosmesa-dev =3D &quot;${libdir}/libOSMesa.* ${includedir}/GL/=
osmesa.h ${libdir}/pkgconfig/osmesa.pc&quot;<br>
=C2=A0FILES:libxatracker-dev =3D &quot;${libdir}/libxatracker.so ${libdir}/=
<a href=3D"http://libxatracker.la" rel=3D"noreferrer" target=3D"_blank">lib=
xatracker.la</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0${includedir}/xa_tracker.h ${includedir}/xa_composi=
te.h ${includedir}/xa_context.h \<br>
-- <br>
2.35.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#163382): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/163382" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/163382</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89842284/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/89842284/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div>

--000000000000d4334805da67957d--

