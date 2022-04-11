Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA8F1C636C9
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:00 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web08.29094.1649683843408016152
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 06:30:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YRc7nsqN;
 spf=pass (domain: gmail.com, ip: 209.85.167.54,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id bu29so26753805lfb.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 06:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=651wA4OzzFQpsFx/p5AWINe8Ng+9NEDA7h4S1wMpnwM=;
        b=YRc7nsqNgdRI0RBhY/iquSKBlIFiog9Yzp04orytSXcitEZPNWQwkxJsbZYKr/xrVo
         HqoxcimaGk8oiVN42P0g7yDK77AQxgl8ecwMIxs53XYBjStBtJojqzvrXPLApgNEeiV5
         FeSKYAyPCfk7Tb4PbHH9kgVUuh6bHNlsCC9kxxRo2JvMtvXNmFcvyv9L+v83XXdXRLv9
         wxHVcC2x0qpU+mF6JDZDKfhOdf6Gi8FA4DtEVzhlmWQ53dQBLhfPqCn9hPR1bILm/lW9
         jJagKkIZsESt0m740QtkM+l0hPJ9kOAikwcbUFM92alabEL/R5EtfGBWqgcPq6t+QtGC
         3G0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=651wA4OzzFQpsFx/p5AWINe8Ng+9NEDA7h4S1wMpnwM=;
        b=xTJyLtmHq4h/w1V4MBzLawhLH2bjaNdxvBuRTu+f5plYwaM/SC77E+dNJRXm0CVpsT
         uqPTz0yQ8Btf0C/ZmuAWBpRqHkE2FwnHAFs4BXtHk/08OS5wScdou7hNyHwatxdysgLE
         c1BMUEnS4S74JHIYKWKWVj/8tc9hktiKkRPccBcEdRoRmzaR8Tugu4+X9tQN4Jwh9Y5g
         4qnR17HDEaVh2F7SNMao070FaI3waytQjRxpsPZUzspbvB0RcS+MqkUYUrKoSDDmEJDF
         WebVrR/F7xtQcKWHC1oslcRJFcUDQ1c5z1ed2M0qOVd/I0qtw+hut9xEEnMfP8ZCZVu4
         6SmA==
X-Gm-Message-State: AOAM530ibK5lj17FMTXd4RRXoBb937krmnNnVPOqRog3ggnroZbsiZ3N
	AYDH0h5DfLk3HMyc1tXUENPDHFfh6bTvhwIfW2A=
X-Google-Smtp-Source: 
 ABdhPJyvzPBw2IYftrLIfhuvPEFshKEoUUjfj2GPcTpTiJiwSEy2GZMunrgBDaJkmc+V7JaCk2pZ9FFh6wjZpqL72YI=
X-Received: by 2002:a05:6512:1690:b0:448:2372:3e3e with SMTP id
 bu16-20020a056512169000b0044823723e3emr22406141lfb.324.1649683841165; Mon, 11
 Apr 2022 06:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220411123520.95107-1-lkml@jv-coder.de>
In-Reply-To: <20220411123520.95107-1-lkml@jv-coder.de>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 11 Apr 2022 14:30:29 +0100
Message-ID: 
 <CANPvuRnKqQaanAZMVWym8K+t3sBm_noNNoCH=kV37RWtb8ncqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] go: Always pass interpreter to linker
To: "J?rg Vehlow" <lkml@jv-coder.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>,
	Joerg Vehlow <joerg.vehlow@aox.de>
Content-Type: multipart/alternative; boundary="000000000000582cb905dc60f39d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164225

--000000000000582cb905dc60f39d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

J?rg Vehlow <lkml@jv-coder.de> escreveu no dia segunda, 11/04/2022 =C3=A0(s=
)
13:35:

> From: Joerg Vehlow <joerg.vehlow@aox.de>
>
> When gos internal linker is used, it uses hardcoded paths to the
> interpreter (dynamic linker). For x86_64 this hardcoded path is
> /lib64/ld-linux-x86-64.so.2, but yocto's default dynamic linker path
> is /lib64/ld-linux-x86-64.so.2.
>

Is this correct? The first path is the seme one of the second.

Jose


> Most of the time, the internal linker is not used and binutils linker
> sets the correct path, but sometimes the internal linker is used and
> the resulting binary will not work on x86_64.
>
> To ensure the path is always correct, pass  it to the linker.
>
> Signed-off-by: Joerg Vehlow <joerg.vehlow@aox.de>
> ---
>  meta/classes/go.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
> index 9c4c92bffd..df8d4db26d 100644
> --- a/meta/classes/go.bbclass
> +++ b/meta/classes/go.bbclass
> @@ -1,4 +1,5 @@
>  inherit goarch
> +inherit linuxloader
>
>  GO_PARALLEL_BUILD ?=3D "${@oe.utils.parallel_make_argument(d, '-p %d')}"
>
> @@ -44,7 +45,7 @@ GO_LINKMODE ?=3D ""
>  GO_LINKMODE:class-nativesdk =3D "--linkmode=3Dexternal"
>  GO_LINKMODE:class-native =3D "--linkmode=3Dexternal"
>  GO_EXTRA_LDFLAGS ?=3D ""
> -GO_LDFLAGS ?=3D '-ldflags=3D"${GO_RPATH} ${GO_LINKMODE} ${GO_EXTRA_LDFLA=
GS}
> -extldflags '${GO_EXTLDFLAGS}'"'
> +GO_LDFLAGS ?=3D '-ldflags=3D"${GO_RPATH} ${GO_LINKMODE} -I
> ${@get_linuxloader(d)} ${GO_EXTRA_LDFLAGS} -extldflags '${GO_EXTLDFLAGS}'=
"'
>  export GOBUILDFLAGS ?=3D "-v ${GO_LDFLAGS} -trimpath"
>  export GOPATH_OMIT_IN_ACTIONID ?=3D "1"
>  export GOPTESTBUILDFLAGS ?=3D "${GOBUILDFLAGS} -c"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164219):
> https://lists.openembedded.org/g/openembedded-core/message/164219
> Mute This Topic: https://lists.openembedded.org/mt/90393660/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000582cb905dc60f39d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">J?rg Vehlow &lt;<a href=3D"mailto:lkm=
l@jv-coder.de">lkml@jv-coder.de</a>&gt; escreveu no dia segunda, 11/04/2022=
 =C3=A0(s) 13:35:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">From: Joerg Vehlow &lt;<a href=3D"mailto:joerg.vehlow@aox.de" target=3D"_=
blank">joerg.vehlow@aox.de</a>&gt;<br>
<br>
When gos internal linker is used, it uses hardcoded paths to the<br>
interpreter (dynamic linker). For x86_64 this hardcoded path is<br>
/lib64/ld-linux-x86-64.so.2, but yocto&#39;s default dynamic linker path<br=
>
is /lib64/ld-linux-x86-64.so.2.<br></blockquote><div><br></div><div><span s=
tyle=3D"color:rgb(0,0,0)">Is this correct? The first path is the seme one o=
f the second.</span></div><div><span style=3D"color:rgb(0,0,0)"><br></span>=
</div><div><span style=3D"color:rgb(0,0,0)">Jose</span></div><div>=C2=A0<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
Most of the time, the internal linker is not used and binutils linker<br>
sets the correct path, but sometimes the internal linker is used and<br>
the resulting binary will not work on x86_64.<br>
<br>
To ensure the path is always correct, pass=C2=A0 it to the linker.<br>
<br>
Signed-off-by: Joerg Vehlow &lt;<a href=3D"mailto:joerg.vehlow@aox.de" targ=
et=3D"_blank">joerg.vehlow@aox.de</a>&gt;<br>
---<br>
=C2=A0meta/classes/go.bbclass | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass<br>
index 9c4c92bffd..df8d4db26d 100644<br>
--- a/meta/classes/go.bbclass<br>
+++ b/meta/classes/go.bbclass<br>
@@ -1,4 +1,5 @@<br>
=C2=A0inherit goarch<br>
+inherit linuxloader<br>
<br>
=C2=A0GO_PARALLEL_BUILD ?=3D &quot;${@oe.utils.parallel_make_argument(d, &#=
39;-p %d&#39;)}&quot;<br>
<br>
@@ -44,7 +45,7 @@ GO_LINKMODE ?=3D &quot;&quot;<br>
=C2=A0GO_LINKMODE:class-nativesdk =3D &quot;--linkmode=3Dexternal&quot;<br>
=C2=A0GO_LINKMODE:class-native =3D &quot;--linkmode=3Dexternal&quot;<br>
=C2=A0GO_EXTRA_LDFLAGS ?=3D &quot;&quot;<br>
-GO_LDFLAGS ?=3D &#39;-ldflags=3D&quot;${GO_RPATH} ${GO_LINKMODE} ${GO_EXTR=
A_LDFLAGS} -extldflags &#39;${GO_EXTLDFLAGS}&#39;&quot;&#39;<br>
+GO_LDFLAGS ?=3D &#39;-ldflags=3D&quot;${GO_RPATH} ${GO_LINKMODE} -I ${@get=
_linuxloader(d)} ${GO_EXTRA_LDFLAGS} -extldflags &#39;${GO_EXTLDFLAGS}&#39;=
&quot;&#39;<br>
=C2=A0export GOBUILDFLAGS ?=3D &quot;-v ${GO_LDFLAGS} -trimpath&quot;<br>
=C2=A0export GOPATH_OMIT_IN_ACTIONID ?=3D &quot;1&quot;<br>
=C2=A0export GOPTESTBUILDFLAGS ?=3D &quot;${GOBUILDFLAGS} -c&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#164219): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/164219" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/164219</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90393660/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/90393660/5052612</a><br>
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

--000000000000582cb905dc60f39d--

