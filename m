Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A15ACC433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 14:58:29 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.546.1636642708484839048
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 06:58:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IcGDiG09;
 spf=pass (domain: gmail.com, ip: 209.85.160.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id p19so5473916qtw.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 06:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4V0PVoGGQvAYBbnqbyldxvlPaCAUS2mOwg+O4ThQOTE=;
        b=IcGDiG09fAIwOGtj8D2PLskVXB7lw5fAGxj9t7dxFlyQz1Gbm2NnfMpUMWhBOaI69b
         1ec8wS2paYpIh5kNFUo2y92PsVQWXliVng9R+drLWG8j457JfUGMYaFVZMEbwyUTvaHf
         jpANDmsiQJof6Pj6cqzzA/M71w9mvlAUfqkafJBHibXeabFnv4qK9DQU78BYb7a94sC3
         y3qdRStWPFtBrFWHu6iXZBJ5/D8JUfdy5VJ5K7wOqjFf8h0IDVW0mqvaK0EaNBKB6ksE
         ENVDHkXiVsJAWFHODNW26bpITcOtVRue7qyXXhx09t3az+Hx97g776hB6ikq5stojdUh
         Mkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4V0PVoGGQvAYBbnqbyldxvlPaCAUS2mOwg+O4ThQOTE=;
        b=sdjGedvao1Cg++g6kmrq0t1dAPPdQtqIZH9jBN3N2tiHQQD7zYJ7IED6Zhl6toaVEX
         5KGpOUY5DSwPgwsZhiDCl+ky0ifSnE9++emNzdsbx+63+keqzTiw/9zN9bpi+PJXxFVu
         f/rpEWZ4sMo2tEQlwhfult3kZ8lgfVKAiUEsd5B8coHtf21TASxfKkY8pJIaVfX/qdmG
         pv8oeg74nWHYPzPINiqR9rmoFAaXeIDZf0cv1HmkcXwnFc1hhr+NH1pDeL9arrrrYyS8
         EOIf+JcgquyPD+GkBbN3ZdGasTWq5IV8IeYWQOOAHiM2zo45I0ULssEBLrmtUrzEldtz
         83nQ==
X-Gm-Message-State: AOAM532QcD1ZYJF/D75kj0c88XfptOhJ5PEx0/eg1qVm0g1EZMM4mHjk
	W3UU/3O1nfm2hglDR9Kf/xSqfRhhhquAINHhJsc=
X-Google-Smtp-Source: 
 ABdhPJwExEy7EGkrX6+r64OYDWcA1EDHRCPHl7R/DvUig0tRqx41OU6oefNs55v1bhlXXrILZWWlO7xNVaRB/rCmJ64=
X-Received: by 2002:a05:622a:114:: with SMTP id
 u20mr8100928qtw.116.1636642707536;
 Thu, 11 Nov 2021 06:58:27 -0800 (PST)
MIME-Version: 1.0
References: <20211111100531.3822580-1-alex@linutronix.de>
In-Reply-To: <20211111100531.3822580-1-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Nov 2021 06:58:16 -0800
Message-ID: 
 <CAMKF1sq33pUGxV75AWgB20maqXeaJ-zbGykWFQSoLL+2HCVgzg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] xserver-xorg: add missing libtirpc dependency
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>,
 openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003501fc05d08493a3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 14:58:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158185

--0000000000003501fc05d08493a3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 11, 2021 at 2:05 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> This wasn't a problem in poky, but was exposed with a nodistro build.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> index 4a7048aced..71c934ef38 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> @@ -28,7 +28,7 @@ inherit meson pkgconfig
>  inherit features_check
>  REQUIRED_DISTRO_FEATURES =3D "x11"
>
> -LIB_DEPS =3D "pixman libxfont2 xtrans libxau libxext libxdmcp libdrm
> libxkbfile libpciaccess libxcvt"
> +LIB_DEPS =3D "pixman libxfont2 xtrans libxau libxext libxdmcp libdrm
> libxkbfile libpciaccess libxcvt libtirpc"


Interesting. Do we know what the difference is?
Perhaps a distro feature gap ? We should try to get poky close to no distro
as it=E2=80=99s reference distro
Less work in maintaining nodistro would be beneficial

>
>  DEPENDS =3D "xorgproto ${LIB_DEPS} font-util"
>
>  # Split out some modules and extensions from the main package
> --
> 2.20.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158153):
> https://lists.openembedded.org/g/openembedded-core/message/158153
> Mute This Topic: https://lists.openembedded.org/mt/86978200/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000003501fc05d08493a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Nov 11, 2021 at 2:05 AM Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">This wasn&#39;t a problem in poky, =
but was exposed with a nodistro build.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" =
target=3D"_blank">alex@linutronix.de</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/rec=
ipes-graphics/xorg-xserver/xserver-xorg.inc<br>
index 4a7048aced..71c934ef38 100644<br>
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc<br>
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc<br>
@@ -28,7 +28,7 @@ inherit meson pkgconfig<br>
=C2=A0inherit features_check<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;x11&quot;<br>
<br>
-LIB_DEPS =3D &quot;pixman libxfont2 xtrans libxau libxext libxdmcp libdrm =
libxkbfile libpciaccess libxcvt&quot;<br>
+LIB_DEPS =3D &quot;pixman libxfont2 xtrans libxau libxext libxdmcp libdrm =
libxkbfile libpciaccess libxcvt libtirpc&quot;</blockquote><div dir=3D"auto=
"><br></div><div dir=3D"auto">Interesting. Do we know what the difference i=
s?</div><div dir=3D"auto">Perhaps a distro feature gap ? We should try to g=
et poky close to no distro as it=E2=80=99s reference distro</div><div dir=
=3D"auto">Less work in maintaining nodistro would be beneficial=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex" dir=3D"auto"><br>
=C2=A0DEPENDS =3D &quot;xorgproto ${LIB_DEPS} font-util&quot;<br>
<br>
=C2=A0# Split out some modules and extensions from the main package<br>
-- <br>
2.20.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#158153): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/158153" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/158153</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86978200/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86978200/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000003501fc05d08493a3--

