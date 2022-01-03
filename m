Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2C50C433FE
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 19:09:50 +0000 (UTC)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com
 [209.85.221.170])
 by mx.groups.io with SMTP id smtpd.web12.32995.1641236989694068276
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 11:09:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RoIr/xAM;
 spf=pass (domain: gmail.com, ip: 209.85.221.170,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f170.google.com with SMTP id b77so19373091vka.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 11:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lC+US7hxPlZIUw80qlFD97kVW16kkqyxYS7380SKWLY=;
        b=RoIr/xAMEOjuER8x4qn+TfTK4xw6W4ohTrF7popxAvgxrkh3o04lvwcoSqAGyOL7yB
         f4EFi/zOwB3lJB0gIUpxk54Z/GRMsWGyaZcsdrR3WykO24Xcpk1IBTiN2jmPEcxRD3bO
         nhTEnpHG1JMCwBbLGJMukmQF/rdus3H6PC3sETIHiLyJNYjaD0eCMHNXjGKUZFnwA3Pp
         ePNNUK7cxmET8yzTOIZGKxERrRuR1gV5VbRRDinNQTCRSQxLGThsIu2tYbyX8SVgq+Rb
         NFyfmQiWl+jwDQmif0FqrG5m3Y/tLYD3+H1QHPRQlpSbt/OYqCCxuP35HrsfYdlMSmxL
         80bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lC+US7hxPlZIUw80qlFD97kVW16kkqyxYS7380SKWLY=;
        b=z6ltfdNPzHjKAGdT9h4zYbNXX9YUCAcFJ3CiDKo14XYg+gkcxuNXJz9HDMISbAq0XH
         VrOMWe6Cfwztm3LJbNMyyq4SvEA65Zghs3cmoicg34S2SHCq/FN6mvzS/4kMVBmqWden
         p61YkATBHhH4iP9icLzFF2QM7t937bU9vEdPRtoVfzvLAPof/63ZciW7K+TQDXUrrSjQ
         Hrcj9Pt1e2XQcvMWjX0vfo/D+Cm5gN8CYVTBSgq7BmP57sPSOb39mKPjl/7bjA7FeDZ1
         d0OIqnwNnhnTjmoLgcVXdIj6Uy2RBU8Z4aG7BuwoYqE5w/AYsLjwU21JSl0HPWZ5H1Q8
         PKtA==
X-Gm-Message-State: AOAM5339cDywSUqSnTxnYKHJ3zGZsQpiWYhPpib9R027K0dm6AqNr/yy
	YWTn7+p5K89Br82pXl5GZesCVP5oaqOPE3FHlYf/sddN
X-Google-Smtp-Source: 
 ABdhPJwln3iBETKTZuH7NuQTa6agxa6hnlFdS75c7UmOGdBV53LTTpU3XM89b8WjLE/Y2b14UneOdqDaCO58KjsrCWs=
X-Received: by 2002:a1f:1e8a:: with SMTP id
 e132mr14798995vke.20.1641236988852;
 Mon, 03 Jan 2022 11:09:48 -0800 (PST)
MIME-Version: 1.0
References: <20220103161854.301148-1-otavio@ossystems.com.br>
 <20220103161854.301148-11-otavio@ossystems.com.br>
In-Reply-To: <20220103161854.301148-11-otavio@ossystems.com.br>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Jan 2022 20:09:37 +0100
Message-ID: 
 <CANNYZj-p+nJv1bVoEf9wps8iJbAPykON1ShNgQGyG+aUJ+o_iA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 11/24] meson: upgrade 0.60.2 -> 0.60.3
To: Otavio Salvador <otavio.salvador@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Content-Type: multipart/alternative; boundary="000000000000b67e8605d4b24376"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 19:09:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160146

--000000000000b67e8605d4b24376
Content-Type: text/plain; charset="UTF-8"

nativesdk-meson recipe too please.

Alex

On Mon, 3 Jan 2022 at 17:19, Otavio Salvador <otavio.salvador@gmail.com>
wrote:

> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/recipes-devtools/meson/meson.inc                           | 2 +-
>  .../recipes-devtools/meson/{meson_0.60.2.bb => meson_0.60.3.bb} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/meson/{meson_0.60.2.bb => meson_0.60.3.bb}
> (100%)
>
> diff --git a/meta/recipes-devtools/meson/meson.inc
> b/meta/recipes-devtools/meson/meson.inc
> index 7fbb246b87..042cf130e4 100644
> --- a/meta/recipes-devtools/meson/meson.inc
> +++ b/meta/recipes-devtools/meson/meson.inc
> @@ -15,7 +15,7 @@ SRC_URI = "
> https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
>             file://0002-Support-building-allarch-recipes-again.patch \
>             file://0001-is_debianlike-always-return-False.patch \
>             "
> -SRC_URI[sha256sum] =
> "64e6968565bf1b8152f4f9d6ca8154efb9e14caa9aabf7b22e71e6c5d053e921"
> +SRC_URI[sha256sum] =
> "87ca5fa9358a01864529392bd64e027158eb94afca7c7766b1866ef27eccb98e"
>
>  UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
>  UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
> diff --git a/meta/recipes-devtools/meson/meson_0.60.2.bb
> b/meta/recipes-devtools/meson/meson_0.60.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/meson/meson_0.60.2.bb
> rename to meta/recipes-devtools/meson/meson_0.60.3.bb
> --
> 2.34.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160128):
> https://lists.openembedded.org/g/openembedded-core/message/160128
> Mute This Topic: https://lists.openembedded.org/mt/88115428/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000b67e8605d4b24376
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>nativesdk-meson recipe too please.</div><div><br></di=
v><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, 3 Jan 2022 at 17:19, Otavio Salvador &lt;<a hr=
ef=3D"mailto:otavio.salvador@gmail.com">otavio.salvador@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off=
-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.br" target=
=3D"_blank">otavio@ossystems.com.br</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/meson/meson.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br=
>
=C2=A0.../recipes-devtools/meson/{<a href=3D"http://meson_0.60.2.bb" rel=3D=
"noreferrer" target=3D"_blank">meson_0.60.2.bb</a> =3D&gt; <a href=3D"http:=
//meson_0.60.3.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.60.3.bb</a>=
} | 0<br>
=C2=A02 files changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-devtools/meson/{<a href=3D"http://meson_0.60.2.bb=
" rel=3D"noreferrer" target=3D"_blank">meson_0.60.2.bb</a> =3D&gt; <a href=
=3D"http://meson_0.60.3.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.60=
.3.bb</a>} (100%)<br>
<br>
diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/=
meson/meson.inc<br>
index 7fbb246b87..042cf130e4 100644<br>
--- a/meta/recipes-devtools/meson/meson.inc<br>
+++ b/meta/recipes-devtools/meson/meson.inc<br>
@@ -15,7 +15,7 @@ SRC_URI =3D &quot;<a href=3D"https://github.com/mesonbuil=
d/meson/releases/download/$%7BPV%7D/meson-$%7BP" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/mesonbuild/meson/releases/download/${PV}/mes=
on-${P</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-Support-building-alla=
rch-recipes-again.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-is_debianlike-always-=
return-False.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;64e6968565bf1b8152f4f9d6ca8154efb9e14caa9aabf=
7b22e71e6c5d053e921&quot;<br>
+SRC_URI[sha256sum] =3D &quot;87ca5fa9358a01864529392bd64e027158eb94afca7c7=
766b1866ef27eccb98e&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/mesonbuild=
/meson/releases" rel=3D"noreferrer" target=3D"_blank">https://github.com/me=
sonbuild/meson/releases</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;meson-(?P&lt;pver&gt;\d+(\.\d+)+)\.tar=
&quot;<br>
diff --git a/meta/recipes-devtools/meson/<a href=3D"http://meson_0.60.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">meson_0.60.2.bb</a> b/meta/recipes-de=
vtools/meson/<a href=3D"http://meson_0.60.3.bb" rel=3D"noreferrer" target=
=3D"_blank">meson_0.60.3.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/meson/<a href=3D"http://meson_0.60.2.bb" =
rel=3D"noreferrer" target=3D"_blank">meson_0.60.2.bb</a><br>
rename to meta/recipes-devtools/meson/<a href=3D"http://meson_0.60.3.bb" re=
l=3D"noreferrer" target=3D"_blank">meson_0.60.3.bb</a><br>
-- <br>
2.34.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#160128): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/160128" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/160128</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88115428/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88115428/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000b67e8605d4b24376--

