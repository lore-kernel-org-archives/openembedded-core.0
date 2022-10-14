Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2750AC4332F
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 07:59:57 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.4733.1665734395268254884
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Oct 2022 00:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VgS4OLAE;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id h8so5066958lja.11
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Oct 2022 00:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKNajYbkJzcyyjcg0F61oJmT7lvJtRa//rCI7tJ/faA=;
        b=VgS4OLAENrsb3KJUPo5RS1OtXTnqlcKgcDn4UVXST8cYgwUn4Wegf/eTTRYuhhrQ9n
         BNzA3WvupqzEB8vC0aW03PVYhnPG/65SKt/1gUAab2RQCAL6EdF6rA3TD1WWWH63zxcQ
         V8e43lw2aWqDNddlFX/1K1t8qRAMg4xvyhKFxV1ZlfAxTQiLlwV2HMbaIViOLrUQ2e8X
         S6d5+1DuY7J/jLR+MEHKkNM6hU6lNTe5oQ/l2bHVGC3FkrrEZomcIdGV+vEY+p6hkvp5
         xMD1BT++gMHL/Cpue2eLncCCo+9vPHpwzONYzXUl+WDaVcCpiPJn3iAOVrRxzrSuqafG
         ooYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZKNajYbkJzcyyjcg0F61oJmT7lvJtRa//rCI7tJ/faA=;
        b=af8uq+e0UbjKTKfztTp//TdWdQF845laaNkcSN45U7Ma+Ks+5UeBvJ99Gs9Kt/3SD1
         dBGNES01hWpPj8VgnAYfKhLk8uHLh1kqkV9tlNm8BWxtaODI27mVJqnMyINLMXgAnywi
         BzLKrdKnbhYd6b3JLqkt9Zoza8OwbDe6MSvdkE3sI/JbZzWAIZXRZ0AxLAjLwbdw+bXO
         qGsBkoQi9Re17u/dKLsMIH0j5Kb0BVYoQR/bE6Div7a90JQpiqDIxYVxEKQo4tBvg+gz
         W4jguCyCO3YDx6uT9mxuZJxF0DyGgQzkC971NJ0UmlG0wIGV6o8Y6SvBjh7g/nkqtJt6
         y3wQ==
X-Gm-Message-State: ACrzQf3wQyzl4m9EYVuFtbZ7G5oQO/hWrzMdGFMeYxITvEIjPFC5KZEj
	PGs1pDM2Lo8qIlZpi92FEIVYwBDpGlnk5lejjYc=
X-Google-Smtp-Source: AMsMyM5KA8bcOxsBOeHFh3EjKhtV8jeIL4OTbED9Bvfw8besLrcvQ31Ux49jIookvKMmojVN/m8naFlbwDTVYwrpIac=
X-Received: by 2002:a2e:2e18:0:b0:26f:c0cd:99b1 with SMTP id
 u24-20020a2e2e18000000b0026fc0cd99b1mr1373032lju.286.1665734393236; Fri, 14
 Oct 2022 00:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <20221014065247.1825762-1-adrian.freihofer@siemens.com>
In-Reply-To: <20221014065247.1825762-1-adrian.freihofer@siemens.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 14 Oct 2022 08:59:35 +0100
Message-ID: <CANPvuR=UZv6E6rwrBH3J=gv3TLDB==UArMMg5uTGemXT_Cob6g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] buildconf: compare abspath
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: multipart/alternative; boundary="000000000000cc933205eafa020b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Oct 2022 07:59:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171728

--000000000000cc933205eafa020b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Adrian,

Adrian Freihofer <adrian.freihofer@gmail.com> escreveu no dia sexta,
14/10/2022 =C3=A0(s) 07:53:

> We have something like ${TOPDIR}/../../poky/meta in the bblayers.conf
> file. This does not work without normalizing the path for comparison.
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  meta/lib/bblayers/buildconf.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/bblayers/buildconf.py
> b/meta/lib/bblayers/buildconf.py
> index e07fc534e1..ccab332adf 100644
> --- a/meta/lib/bblayers/buildconf.py
> +++ b/meta/lib/bblayers/buildconf.py
> @@ -64,7 +64,7 @@ TEMPLATECONF=3D{} . {}/oe-init-build-env build-try-{}""=
"
>          oecore =3D None
>
>          for l in layers:
> -            if l[0] =3D=3D os.path.abspath(args.layerpath):
> +            if os.path.abspath(l[0]) =3D=3D os.path.abspath(args.layerpa=
th):
>                  targetlayer =3D l[0]
>

Maybe can be better to have the abspath of layerpath in targetlayer

layerpath =3D os.path.abspath(args.layerpath)
if os.path.abspath(l[0]) =3D=3D layerpath:
    targetlayer =3D layerpath

Jose

             if l[1] =3D=3D 'meta':
>                  oecore =3D os.path.dirname(l[0])
> --
> 2.37.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171725):
> https://lists.openembedded.org/g/openembedded-core/message/171725
> Mute This Topic: https://lists.openembedded.org/mt/94321973/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000cc933205eafa020b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Adrian,</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">Adrian Freihofer &lt;<a href=3D"mailto:adri=
an.freihofer@gmail.com">adrian.freihofer@gmail.com</a>&gt; escreveu no dia =
sexta, 14/10/2022 =C3=A0(s) 07:53:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">We have something like ${TOPDIR}/../../poky/meta in the =
bblayers.conf<br>
file. This does not work without normalizing the path for comparison.<br>
<br>
Signed-off-by: Adrian Freihofer &lt;<a href=3D"mailto:adrian.freihofer@siem=
ens.com" target=3D"_blank">adrian.freihofer@siemens.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/bblayers/buildconf.py | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/lib/bblayers/buildconf.py b/meta/lib/bblayers/buildconf.p=
y<br>
index e07fc534e1..ccab332adf 100644<br>
--- a/meta/lib/bblayers/buildconf.py<br>
+++ b/meta/lib/bblayers/buildconf.py<br>
@@ -64,7 +64,7 @@ TEMPLATECONF=3D{} . {}/oe-init-build-env build-try-{}&quo=
t;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oecore =3D None<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for l in layers:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if l[0] =3D=3D os.path.abspath(a=
rgs.layerpath):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.abspath(l[0]) =3D=3D =
os.path.abspath(args.layerpath):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0targetlayer =
=3D l[0]<br></blockquote><div><br></div><div>Maybe can be better to have th=
e abspath of layerpath in targetlayer</div><div><br>layerpath=C2=A0=3D os.p=
ath.abspath(args.layerpath)</div><div>if os.path.abspath(l[0]) =3D=3D layer=
path:<br>=C2=A0 =C2=A0 targetlayer=C2=A0=3D=C2=A0layerpath<br></div><div><b=
r>Jose<br><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if l[1] =3D=3D &#39;meta&#3=
9;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oecore =3D os=
.path.dirname(l[0])<br>
-- <br>
2.37.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#171725): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/171725" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/171725</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94321973/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94321973/5052612</a><br>
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

--000000000000cc933205eafa020b--

