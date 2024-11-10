Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC206E6781A
	for <webhook@archiver.kernel.org>; Sun, 10 Nov 2024 14:41:03 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.37009.1731249656011424940
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Nov 2024 06:40:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AqNGg+4j;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539f72c913aso6408634e87.1
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Nov 2024 06:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731249654; x=1731854454; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WFy6RAMmAXJDN1/4xgF0DQ1HETCfVms6JGwWqXZ8T+Q=;
        b=AqNGg+4jguEH6p2spSJWjlZ1iPuiFTPc3xp9+/9+5Rnu1t9uT/o9zW3B/M727wsjFW
         l1OlbJTILsyVf9mit3fjJcwRNsvOW+n+A4edDLl3MJhYK+FmUhc+dtaH4ikZGGXI7iRR
         p+zcsujFXAMzVX3soJzQatQI8p6jyVcn0dkU+WrG58Gv+vVrZKBlso4iHukMkfTfdfCC
         VcJ2xg4kkRR311ZNF7SKC1+fl3Rt+8418wDKmSYhe/Uzptg7gJJ9Kfmta2ZeXtmuwSjI
         UfbPRg8q/4DQWhKu67bntM2+XsbnEQU854Hz6D7N7CVsTQkrY/bLgvSv2rFZg2F9pO2c
         FJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731249654; x=1731854454;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WFy6RAMmAXJDN1/4xgF0DQ1HETCfVms6JGwWqXZ8T+Q=;
        b=WrRWMCzKAnNnDOQUdflv1xB+q9Ukb1D/li6ikAZ7sw1k2vIlFNdMFMcyZOVnuETNKz
         +kDZje1UMHaeQ2Gj41EcTdWMNLiqdRJFgSptHTzbIV4BavTgjZIEecO7Jto96QKjYnMY
         Nukae+SdoDPPQ0uFfUOW9rc8VPbC83vXQTNqPeaTpANlXY1P2ir1F2NWgU9UPsnP0KmP
         4sw7fLyEI5OuyOSXvI6QVX2U5RfWhdjCK6OzcPyeK7Osxea4VzEGh5uIbhKdu36nbmNz
         tSbdGhVTYM5YLmTjwGk9mHO3k9YMOfLdXgUeGC8RlJWjPyn7zbRUiJlGILBwmX0sLHRZ
         IDbQ==
X-Gm-Message-State: AOJu0YzSI2I7e0tWj7lyjPSjZgimuNErcBMGNJXsImRS0/sADc8inzBN
	PR1h0SNWutp9NaVNEylYybQtAsZS87+mHfnGxp/vAmnbKzN/faoRpiKh9yhv44zVhef9b2DQ0+x
	xeiUxaec3xZTnW8j0/KU9ZiJYXD4=
X-Google-Smtp-Source: AGHT+IE9fq6LyWu5frt1Aq720DVbd8aSF4LnTNZeyF5/NO1z2w6A4iCKSiQ1zQnnivH3sb8ZgVjcd5urrF9HeimkhzY=
X-Received: by 2002:a05:6512:1046:b0:539:e5e9:2159 with SMTP id
 2adb3069b0e04-53d862cd2b3mr4667079e87.31.1731249653484; Sun, 10 Nov 2024
 06:40:53 -0800 (PST)
MIME-Version: 1.0
References: <20241110132848.2135721-1-f_l_k@t-online.de>
In-Reply-To: <20241110132848.2135721-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 10 Nov 2024 15:40:42 +0100
Message-ID: <CANNYZj8XUkrp6Fc5kB=4S_q7AKiYkN+zZ4Tqd9ZEQK-4JGC5xg@mail.gmail.com>
Subject: Re: [RFC][oe-core][PATCH] systemd: dont allow autoselect for meson
To: f_l_k@t-online.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009d139306268ff83f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Nov 2024 14:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206922

--0000000000009d139306268ff83f
Content-Type: text/plain; charset="UTF-8"

It would help to explain what the option does precisely.

Alex

On Sun 10. Nov 2024 at 14.26, Markus Volk via lists.openembedded.org <f_l_k=
t-online.de@lists.openembedded.org> wrote:

> This might help avoid reproducibility issues
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-core/systemd/systemd_256.7.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/systemd/systemd_256.7.bb
> b/meta/recipes-core/systemd/systemd_256.7.bb
> index bf829c4931..159a0e25b8 100644
> --- a/meta/recipes-core/systemd/systemd_256.7.bb
> +++ b/meta/recipes-core/systemd/systemd_256.7.bb
> @@ -258,6 +258,7 @@ EXTRA_OEMESON += "-Dnobody-user=nobody \
>                    -Dsystem-gid-max=999 \
>                    -Dcreate-log-dirs=false \
>                    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf',
> '-Ddefault-mdns=no -Ddefault-llmnr=no', '', d)} \
> +                  --auto-features=disabled \
>                    "
>
>  # Hardcode target binary paths to avoid using paths from sysroot or worse
> --
> 2.47.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206919):
> https://lists.openembedded.org/g/openembedded-core/message/206919
> Mute This Topic: https://lists.openembedded.org/mt/109496557/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000009d139306268ff83f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">It would help to explain what the option does precisely.=
=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun 1=
0. Nov 2024 at 14.26, Markus Volk via <a href=3D"http://lists.openembedded.=
org">lists.openembedded.org</a> &lt;f_l_k=3D<a href=3D"mailto:t-online.de@l=
ists.openembedded.org">t-online.de@lists.openembedded.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-=
color:rgb(204,204,204)">This might help avoid reproducibility issues<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_256.7.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_256.7.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_256.7.bb" =
rel=3D"noreferrer" target=3D"_blank">systemd_256.7.bb</a> b/meta/recipes-co=
re/systemd/<a href=3D"http://systemd_256.7.bb" rel=3D"noreferrer" target=3D=
"_blank">systemd_256.7.bb</a><br>
index bf829c4931..159a0e25b8 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_256.7.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_256.7.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_256.7.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_256.7.bb</a><br>
@@ -258,6 +258,7 @@ EXTRA_OEMESON +=3D &quot;-Dnobody-user=3Dnobody \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dsyst=
em-gid-max=3D999 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dcrea=
te-log-dirs=3Dfalse \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.=
utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;zeroconf&#39;, &#39;-Ddefaul=
t-mdns=3Dno -Ddefault-llmnr=3Dno&#39;, &#39;&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --auto-feat=
ures=3Ddisabled \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
<br>
<br>
=C2=A0# Hardcode target binary paths to avoid using paths from sysroot or w=
orse<br>
-- <br>
2.47.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#206919): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/206919" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/206919</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109496557/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/109496557/1686489</a><br>
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

--0000000000009d139306268ff83f--

