Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D42FA3741
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 19:19:39 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web08.44.1667243965261858364
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 12:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lxaIh1r6;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id r12so20780041lfp.1
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 12:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BS6gvm0cLXXdu0cHFRK4B3QWAzJAtNV121zQxg73PvI=;
        b=lxaIh1r6yqOEM10wYFAx0VP3R4IepDAFPY1JpXR28GNGvjUoJPolU0HPXmEV6bRGHM
         mUpuvYFD7hfmf5ePi/qQLoYKLdwGtw+fw52jrKoHLsL+L/zFtq8b4cIBM9xQZyhL3Z58
         hIjnaRIUAKtBoaKDZvu/U6mziHrT9au8/U/ZG9IhRT2gxqdrwjgy13d+W2srxu3xAGNB
         KPuODYSXC8Vm6Vi2OUveCLnYP7rmmkvmTt9ZlSfLmBTBTZcPD2cQwWop1ML4JcjllAqZ
         +myucvfI9PtcjQEEHjioNvVGx0KtNbHo9CIdC57IXL3x8ERN/A8uvxo0FZ2feTO1dmtX
         bReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BS6gvm0cLXXdu0cHFRK4B3QWAzJAtNV121zQxg73PvI=;
        b=IYORwCcnOzJu9gglxzsWrcKdrsn9mdWN19bZrQhfjvPxvjIOG3LPU67CjPneBZvbcf
         5Wcotclf4sXVkchDUpq3cny1tVLxnAoqWMwMIlEnXaPq4+05DnbubgoiXxyS4fpvHOQl
         q7o6YYfWJ02OPizFHvvgeoy6XoO6GWIuu3pvbheQ/cEKaZpbf81bJLGmfgitRgGwsmxk
         vqtr88J6vuusmM/kfShECV/V/RnhkxWEyEn2gBFOd4cHAmovyQ3spiBG5XrTgyIHXOcG
         dWVG9kxjFH6VJT1FiDgv+y7mhdUmDDd3rg7KD/925ywLPJfA3epwUupKXAYc7dldux0k
         7z/A==
X-Gm-Message-State: ACrzQf2OAmhKyvxEYKAODbznlgolAam4Xr8t9Ao14s4xYGRvRekBQ7EY
	p0OcKvuqrCGpSqSewodZzx0Lebr6dinvtKvgqd4=
X-Google-Smtp-Source: AMsMyM5ki7IggNGWbJDBZ3Xd3x5HhLDC63n0yJgpTSfDjw8kQwqhvfv0tlhBEGvx4KoG3SC6z9xLTXXhBuFxMUUjVT4=
X-Received: by 2002:a05:6512:36c3:b0:4a4:7627:c57 with SMTP id
 e3-20020a05651236c300b004a476270c57mr6278749lfs.398.1667243963271; Mon, 31
 Oct 2022 12:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <20221031163015.19021-1-marex@denx.de>
In-Reply-To: <20221031163015.19021-1-marex@denx.de>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 31 Oct 2022 19:18:45 +0000
Message-ID: <CANPvuRnxR-wLqt4iONT7wjbEpKMOHC97KqAu=cxqX5t04gAZvw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bluez5: Point hciattach bcm43xx firmware search
 path to /lib/firmware
To: Marek Vasut <marex@denx.de>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000002f4f3905ec597ca8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 19:19:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172333

--0000000000002f4f3905ec597ca8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

Marek Vasut <marex@denx.de> escreveu no dia segunda, 31/10/2022 =C3=A0(s) 1=
6:30:

> Currently the hciattach bcm43xx firmware loader looks up the firmware
> blob in /etc/firmware . Change this to /lib/firmware instead, so that
> the path is consistent with Linux kernel which also looks up firmware
> for the WiFi part in /lib/firmware .
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexander Kanavin <alex@linutronix.de>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc
> b/meta/recipes-connectivity/bluez5/bluez5.inc
> index f07e318897..fe10be7324 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -68,6 +68,8 @@ EXTRA_OECONF =3D "\
>    --without-zsh-completion-dir \
>  "
>
> +CFLAGS:append =3D " -DFIRMWARE_DIR=3D\\"/lib/firmware\\""
>

Escape chars can be tricky when parsing and as the path
doesn't have any space we can have " -DFIRMWARE_DIR=3D/lib/firmware"
or not?

Another options to avoid escape chars can be
CFLAGS:append =3D ' -DFIRMWARE_DIR=3D"/lib/firmware"'

Jose


> +
>  # bluez5 builds a large number of useful utilities but does not
>  # install them.  Specify which ones we want put into ${PN}-noinst-tools.
>  NOINST_TOOLS_READLINE ??=3D ""
> --
> 2.35.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172331):
> https://lists.openembedded.org/g/openembedded-core/message/172331
> Mute This Topic: https://lists.openembedded.org/mt/94689423/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000002f4f3905ec597ca8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Marek,</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">Marek Vasut &lt;<a href=3D"mailto:marex@denx=
.de">marex@denx.de</a>&gt; escreveu no dia segunda, 31/10/2022 =C3=A0(s) 16=
:30:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Currently t=
he hciattach bcm43xx firmware loader looks up the firmware<br>
blob in /etc/firmware . Change this to /lib/firmware instead, so that<br>
the path is consistent with Linux kernel which also looks up firmware<br>
for the WiFi part in /lib/firmware .<br>
<br>
Signed-off-by: Marek Vasut &lt;<a href=3D"mailto:marex@denx.de" target=3D"_=
blank">marex@denx.de</a>&gt;<br>
---<br>
Cc: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" target=3D"_=
blank">alex@linutronix.de</a>&gt;<br>
Cc: Alexandre Belloni &lt;<a href=3D"mailto:alexandre.belloni@bootlin.com" =
target=3D"_blank">alexandre.belloni@bootlin.com</a>&gt;<br>
Cc: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org=
" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
---<br>
=C2=A0meta/recipes-connectivity/bluez5/bluez5.inc | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-con=
nectivity/bluez5/bluez5.inc<br>
index f07e318897..fe10be7324 100644<br>
--- a/meta/recipes-connectivity/bluez5/bluez5.inc<br>
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc<br>
@@ -68,6 +68,8 @@ EXTRA_OECONF =3D &quot;\<br>
=C2=A0 =C2=A0--without-zsh-completion-dir \<br>
=C2=A0&quot;<br>
<br>
+CFLAGS:append =3D &quot; -DFIRMWARE_DIR=3D\\&quot;/lib/firmware\\&quot;&qu=
ot;<br></blockquote><div><br>Escape chars can be tricky when parsing and as=
 the path</div><div>doesn&#39;t=C2=A0have any space we can have &quot; -DFI=
RMWARE_DIR=3D/lib/firmware&quot;</div><div>or not?<br><br>Another options t=
o avoid escape chars can be<br>CFLAGS:append =3D &#39; -DFIRMWARE_DIR=3D&qu=
ot;/lib/firmware&quot;&#39;<br><br>Jose<br>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
+<br>
=C2=A0# bluez5 builds a large number of useful utilities but does not<br>
=C2=A0# install them.=C2=A0 Specify which ones we want put into ${PN}-noins=
t-tools.<br>
=C2=A0NOINST_TOOLS_READLINE ??=3D &quot;&quot;<br>
-- <br>
2.35.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#172331): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/172331" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/172331</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94689423/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94689423/5052612</a><br>
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
 Quaresma</div></div></div></div>

--0000000000002f4f3905ec597ca8--

