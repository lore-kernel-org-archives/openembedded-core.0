Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B64C48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 04:45:54 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web10.4380.1707453945097142337
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 20:45:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dKjV1nbK;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-218eea4f1a7so262678fac.3
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 20:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707453944; x=1708058744; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KphWtw5M8/2L5pDoLW8Ld92aPtYKEzvdaQOBarri1ZA=;
        b=dKjV1nbKixqfas++vUS0jj9HjiZnd1UZTBJ1RrVDT/FZRbjoVEvvQwTZ3tazYr4dE1
         yfjcSbT24gqDrd4Ch/XJXToEINsmJIRJmFkOUa58F+pbips/GypmdJi5xkBG5rJMWuL2
         d/7ZTov8niAlfDWcuEoVy02LTmzhKA/2xZkzU0oy8GIBy4PsRRofs3vUNEI0YbwfZIzK
         EBEIuUv3xorI/XtSLfTdZDK64X3cZVJNSvx5UNYNBSv5/HdUopZOAXpReJIJwV2BpA8L
         IR1BBYoD0FpFizUg1azmIsEZpn07nqWvi0CkKy8URsG1zdz2sxbUiY8m9dnPv2af7yOJ
         Kxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707453944; x=1708058744;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KphWtw5M8/2L5pDoLW8Ld92aPtYKEzvdaQOBarri1ZA=;
        b=MNWXuJfa+haMOiMsjW7B1bmqT0IilwrkeMyPuE3pg3prBPTVexwLkGZV+ro6S0lxmL
         AcaXtOtuINQn41gmfUa35akS50JEHVz+5P4yjFxFvPM4Ln/WzSYy0o/WFeMolQUG+l2S
         wN7Ihqcps6ayfXS03JIPOO9h4URsGCJKT4qZNTX6ELkF3+maHg2Q/VHcDRPx9qyyM4OC
         pUT3KyQbOkUKCv/tYwO4xW7nd+evNeRebe4jxfS+9DbMxMuTyMsqU0bmRfaFbNZ/OwWB
         te/Z4Hsfg5J9qgeHXQFS1Jlbg2d/tCWnmlJwWukleKBuHpCUJqcROanWa9O57JYVDQC5
         /eSQ==
X-Gm-Message-State: AOJu0Yw5BnTcK2Lz6Mvol2kZCYYQb5wNe9X7RgHg2emkLhXAVARNiwY6
	lgsGN6EUeG1JxfVhdloYaxrsQI7u6mquyRW04a08XXBf9YI35uqJx2LxX3BqLUvIs1zLF8Lf2SE
	F0QYzFSfjAa0ZMRXVgeY5AmZMz38=
X-Google-Smtp-Source: AGHT+IHgrlJzxbzJ68eAVcerFw+TvC88UUAnp8q9F2Rt0J9ox2kK8wiU20QLQfub8vfVSGtiveHL0S1bRZf8jFLu6gM=
X-Received: by 2002:a05:6870:ac2c:b0:219:57d1:b6c8 with SMTP id
 kw44-20020a056870ac2c00b0021957d1b6c8mr521999oab.4.1707453944186; Thu, 08 Feb
 2024 20:45:44 -0800 (PST)
MIME-Version: 1.0
References: <20240208185641.2969396-1-alex@linutronix.de>
In-Reply-To: <20240208185641.2969396-1-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Feb 2024 20:45:33 -0800
Message-ID: <CAMKF1soOPZBoaks_LFCAoaMqdu+pY8v-arh58gmBUbndE4=cVg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] shadow: add a packageconfig for logind support
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d0757e0610eb9935"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 04:45:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195189

--000000000000d0757e0610eb9935
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 8, 2024 at 10:56=E2=80=AFAM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> This was causing host contamination in particular, where
> libsystemd was installed on the host.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-extended/shadow/shadow.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-extended/shadow/shadow.inc
> b/meta/recipes-extended/shadow/shadow.inc
> index b8e5e285c45..16b99a0b60e 100644
> --- a/meta/recipes-extended/shadow/shadow.inc
> +++ b/meta/recipes-extended/shadow/shadow.inc
> @@ -74,6 +74,7 @@ PACKAGECONFIG[acl] =3D "--with-acl,--without-acl,acl"
>  PACKAGECONFIG[audit] =3D "--with-audit,--without-audit,audit"
>  PACKAGECONFIG[selinux] =3D "--with-selinux,--without-selinux,libselinux
> libsemanage"
>  PACKAGECONFIG[libbsd] =3D "--with-libbsd,--without-libbsd,libbsd"
> +PACKAGECONFIG[logind] =3D "--enable-logind,--disable-logind,systemd"


In general it=E2=80=99s ok
I think there is elogind recipe somewhere which
Will be at disadvantage since someone might be able to use logind with
non-systemd system too

>
>
>  RDEPENDS:${PN} =3D "shadow-securetty \
>                    base-passwd \
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195172):
> https://lists.openembedded.org/g/openembedded-core/message/195172
> Mute This Topic: https://lists.openembedded.org/mt/104244839/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d0757e0610eb9935
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Feb 8, 2024 at 10:56=E2=80=AFAM Alexander Kanavin &=
lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bo=
rder-left-color:rgb(204,204,204)">This was causing host contamination in pa=
rticular, where<br>
libsystemd was installed on the host.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" =
target=3D"_blank">alex@linutronix.de</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/shadow/shadow.inc | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extende=
d/shadow/shadow.inc<br>
index b8e5e285c45..16b99a0b60e 100644<br>
--- a/meta/recipes-extended/shadow/shadow.inc<br>
+++ b/meta/recipes-extended/shadow/shadow.inc<br>
@@ -74,6 +74,7 @@ PACKAGECONFIG[acl] =3D &quot;--with-acl,--without-acl,acl=
&quot;<br>
=C2=A0PACKAGECONFIG[audit] =3D &quot;--with-audit,--without-audit,audit&quo=
t;<br>
=C2=A0PACKAGECONFIG[selinux] =3D &quot;--with-selinux,--without-selinux,lib=
selinux libsemanage&quot;<br>
=C2=A0PACKAGECONFIG[libbsd] =3D &quot;--with-libbsd,--without-libbsd,libbsd=
&quot;<br>
+PACKAGECONFIG[logind] =3D &quot;--enable-logind,--disable-logind,systemd&q=
uot;</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">In general i=
t=E2=80=99s ok=C2=A0</div><div dir=3D"auto">I think there is elogind recipe=
 somewhere which</div><div dir=3D"auto">Will be at disadvantage since someo=
ne might be able to use logind with non-systemd system too=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-=
width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(20=
4,204,204)" dir=3D"auto"><br>
<br>
=C2=A0RDEPENDS:${PN} =3D &quot;shadow-securetty \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base-p=
asswd \<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#195172): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/195172" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/195172</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104244839/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/104244839/1997914</a><br>
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

--000000000000d0757e0610eb9935--

