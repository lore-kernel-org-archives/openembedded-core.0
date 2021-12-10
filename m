Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F92C4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 15:58:50 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web09.8948.1639151929122893348
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 07:58:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RUE7EvJk;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id p3so8333100qvj.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 07:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HACUKNj0LL/l11RxdBsn7YrkF0zkhPoC5scBoV2MNHU=;
        b=RUE7EvJkng6MWeiVcCu1TYJ3Yl+vrGkCicSjWN54GOc5MP7dBPV5nClP3hVS52ScV8
         J5dkg5fsax844pF1Mty3OHICBq8zd3goZWbxg3hiWid5BW/jFY7SFbUgYzrxVtwbnXhA
         Cj17zl7cbFy4CyD0qqGQhnO+jwaKiBKN+Mb/QnNa/sEIlHchuM35/04ZOrTdhxUOcFU0
         nTnHNxOODVfj4YpgzesbFyafc95IDsna+CjtmyPQpZUq1SajPygKajjIKxilXI9+3agh
         f+7VbffkPl4MYzcLc+CCLbeF6tDGb2XV3ZZfBdLmXr4v0YrP5CD0TCm9kgMWDVbxpoUz
         atog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HACUKNj0LL/l11RxdBsn7YrkF0zkhPoC5scBoV2MNHU=;
        b=00pxyZAnOebsCS94kB2tFqfMs/Lj9SL3CrVF7dgKBbA76+DdzT9FedaxLuu7MGS/Ld
         e0pEz0HZwXBIwuqUIr9o8nPGPXIipLhvMdOziuKhBlf03f2XGi8oyRZ/Q4mt+ijecKR2
         h2DHOGHYzByaAzNO748vhHoaJpg4gbX3Li5kr9Vwu4CeYZlvhdSIiimhgJFpywno7/pl
         YhUyr4efkXltTPPw4movPbIKvUmS5It4LkYDVN0k9yOMwD8Aau8ORXN6F0ole1+xzl2r
         s5IaOdJiZMmH6vkV+akwEI062stKXG6owIMW33sc/KuSqjSeE5JMaLExKekZxTP9hkfv
         XeqA==
X-Gm-Message-State: AOAM530Gkxtvo6Pa62UOrOTi1bIeLFj6/StHYKDrbiayzl5fBajzAMrm
	m52GJ2Zv836ri9zNxc94Zc8H+Lxswa5evbNa0UNSRfEbUoc=
X-Google-Smtp-Source: 
 ABdhPJz7QB8GhhPcZWoa0/ID5OncWixXleJ2WeoNygkp4JjxzONGAUlbXKkMF0ZK7t0M6lVe0ihGNA7YLhMp9to700E=
X-Received: by 2002:a05:6214:c28:: with SMTP id
 a8mr27316791qvd.24.1639151928202;
 Fri, 10 Dec 2021 07:58:48 -0800 (PST)
MIME-Version: 1.0
References: <20211210142242.2698587-1-ross.burton@arm.com>
 <20211210142242.2698587-8-ross.burton@arm.com>
In-Reply-To: <20211210142242.2698587-8-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 10 Dec 2021 07:58:37 -0800
Message-ID: 
 <CAMKF1sohc1y9WtchDDFtt9YrAX77VADc-1H8x2_5mN-BFrFb-w@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 08/10] qemu: remove obsolete support for
 renamed libtool
To: Ross Burton <ross@burtonini.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000069db3805d2cccc33"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 15:58:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159552

--00000000000069db3805d2cccc33
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 10, 2021 at 6:22 AM Ross Burton <ross@burtonini.com> wrote:

> libtool is now longer renamed to ${host}-libtool, so


Typo now should be no

remove the changes
> to support this.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc
> b/meta/recipes-devtools/qemu/qemu.inc
> index ea7dfaecef8..fe35f94acf7 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -98,8 +98,6 @@ EXTRA_OECONF = " \
>      ${PACKAGECONFIG_CONFARGS} \
>      "
>
> -export LIBTOOL="${HOST_SYS}-libtool"
> -
>  B = "${WORKDIR}/build"
>
>  #EXTRA_OECONF:append = " --python=${HOSTTOOLS_DIR}/python3"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159535):
> https://lists.openembedded.org/g/openembedded-core/message/159535
> Mute This Topic: https://lists.openembedded.org/mt/87636636/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000069db3805d2cccc33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Dec 10, 2021 at 6:22 AM Ross Burton &lt;<a href=3D"=
mailto:ross@burtonini.com">ross@burtonini.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">libtool is now longer renamed to ${host}-libtool,=
 so </blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Typo now sho=
uld be no=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex" dir=3D"auto">remove the changes<br>
to support this.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/qemu/qemu.inc | 2 --<br>
=C2=A01 file changed, 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc<br>
index ea7dfaecef8..fe35f94acf7 100644<br>
--- a/meta/recipes-devtools/qemu/qemu.inc<br>
+++ b/meta/recipes-devtools/qemu/qemu.inc<br>
@@ -98,8 +98,6 @@ EXTRA_OECONF =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${PACKAGECONFIG_CONFARGS} \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-export LIBTOOL=3D&quot;${HOST_SYS}-libtool&quot;<br>
-<br>
=C2=A0B =3D &quot;${WORKDIR}/build&quot;<br>
<br>
=C2=A0#EXTRA_OECONF:append =3D &quot; --python=3D${HOSTTOOLS_DIR}/python3&q=
uot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159535): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159535" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/159535</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87636636/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87636636/1997914</a><br>
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

--00000000000069db3805d2cccc33--

