Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E1FC4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 19:38:37 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.5675.1707421111514867386
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 11:38:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XxEE6ZO3;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51168572090so295929e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 11:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707421110; x=1708025910; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AyPFbhU+x9sR857/iTa8YJSZtC/rNGv6dUFy7IONdSA=;
        b=XxEE6ZO3E7yj1RvCwyAnTYOvMWzhGX5IYLjVENwEODsLmNbhtAkSi+S3/qEX9uJdFL
         YSH3ginaQGsl7/A+R1D4OY4Lib8hU2nWvmi7lfqpBR1lpi5emKDTMgFOOGn37GMoof6Z
         BfY7j4mUuOoviPpNDnp026ApYoz1eOGFVeijO/qRIxS94nmx01Wtyudwf883q7zex2Vl
         Qkxg2lN/lWl7UFCXxlUAVHy9Exo7mGki5Mdg/xVV2WLmM52G2C40VIRfCPvjfEOMYeMQ
         SyJZcmeWKjByPSPvcnhOs9kLGK1PT50HRsLluXfk1YEKLpfELxvGHRyQj4/+yZOlxker
         mqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707421110; x=1708025910;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AyPFbhU+x9sR857/iTa8YJSZtC/rNGv6dUFy7IONdSA=;
        b=jz7EqfjsG2u/HnP+8ZRarol6PboCiyO5BWsJClC+17/4boPSPnxeaZJ3f5rgesy/jp
         vViPsik7OG+Ce7OZuwRuLLMcLOle20evcx7ho5wCMYZxMyV1NGTcdazmNyRzU6iT7slU
         4ppS9uQVh/SIDBeN4/rwUiIRUtiLBH2dai5bC1oYvfaUrmZHgiRScFpsf6LXIR0vB8X3
         eFkgk7SGR5gW097juAeo3APC+Ohml2kpXNoKdTudh3SDijDTNJajI4sDY88uSn8o75Pe
         g5Svw5yVlEtP0EAkcsQmIxWG9BCXrSo02rTOBZL+Lmc/x6KGA73eXJjDmhdwaDJJSQAL
         YIpw==
X-Gm-Message-State: AOJu0YzuLSMywbvAw857EyEFjclS8PrhRxEYf8D44Cu67g35/93vDluw
	kbFOjVPJumAPFYho2ZQb4uoKug8c4ToGYfr0U0KdSSNOlsPl90hzE0ift1rvOFHdjsEf7+ynnJm
	eLb52PcM28qPPXgHzmGtG8pHBtSuXt0v4
X-Google-Smtp-Source: AGHT+IFzlrTrmEACB51SE6mJZZEAFj7zzOto4m9dzE0wLxJswCM5cHKYlwtmLMifiWL3ykdfWiBcENPzpskz3btJ2EA=
X-Received: by 2002:a05:651c:86:b0:2d0:ccc4:4f8e with SMTP id
 6-20020a05651c008600b002d0ccc44f8emr189944ljq.44.1707421109502; Thu, 08 Feb
 2024 11:38:29 -0800 (PST)
MIME-Version: 1.0
References: <20240208193136.2746829-1-uvv.mail@gmail.com>
In-Reply-To: <20240208193136.2746829-1-uvv.mail@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 8 Feb 2024 20:38:18 +0100
Message-ID: <CANNYZj-NgFwJYrTArP5roPsJiUxUY9mKQPTVYr26-pn4K31T-w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] shadow: Fix build failure on Ubuntu-20.04
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b6ca180610e3f445"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 19:38:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195176

--000000000000b6ca180610e3f445
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This isn=E2=80=99t correct as the option still checks for  systemd when ena=
bled and
disables itself if that is not found. My patch is better.

Alex

On Thu 8. Feb 2024 at 20.32, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:

> Don't use systemd features for native build, otherwise it failes with
> following error:
>
> ../../shadow-4.14.2/lib/logind.c: In function =E2=80=98active_sessions_co=
unt=E2=80=99:
> ../../shadow-4.14.2/lib/logind.c:38:55: error: parameter name omitted
>    38 | unsigned long active_sessions_count(const char *name, unsigned
> long unused)
>
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  meta/recipes-extended/shadow/shadow.inc | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/recipes-extended/shadow/shadow.inc
> b/meta/recipes-extended/shadow/shadow.inc
> index b8e5e285c4..5029ac4ca4 100644
> --- a/meta/recipes-extended/shadow/shadow.inc
> +++ b/meta/recipes-extended/shadow/shadow.inc
> @@ -43,6 +43,7 @@ EXTRA_OECONF +=3D "--without-libcrack \
>                   --with-group-name-max-length=3D24 \
>                   --enable-subordinate-ids=3Dyes \
>                   --without-sssd \
> +                 ${LOGINDOPT} \
>                   ${NSCDOPT}"
>
>  CFLAGS:append:libc-musl =3D " -DLIBBSD_OVERLAY"
> @@ -52,6 +53,11 @@ NSCDOPT:class-native =3D "--without-nscd"
>  NSCDOPT:class-nativesdk =3D "--without-nscd"
>  NSCDOPT:libc-glibc =3D "--with-nscd"
>
> +LOGINDOPT =3D ""
> +LOGINDOPT:class-native =3D "--disable-logind"
> +LOGINDOPT:class-nativesdk =3D "--disable-logind"
> +LOGINDOPT:libc-glibc =3D "--enable-logind"
> +
>  PAM_PLUGINS =3D "libpam-runtime \
>                 pam-plugin-faildelay \
>                 pam-plugin-securetty \
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195175):
> https://lists.openembedded.org/g/openembedded-core/message/195175
> Mute This Topic: https://lists.openembedded.org/mt/104245489/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b6ca180610e3f445
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This isn=E2=80=99t correct as the option still checks for=
 =C2=A0systemd when enabled and disables itself if that is not found. My pa=
tch is better.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div=
><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Thu 8. Feb 2024 at 20.32, Vyacheslav Yurkov &lt;<a href=3D"mailto:uvv.ma=
il@gmail.com">uvv.mail@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">=
Don&#39;t use systemd features for native build, otherwise it failes with<b=
r>
following error:<br>
<br>
../../shadow-4.14.2/lib/logind.c: In function =E2=80=98active_sessions_coun=
t=E2=80=99:<br>
../../shadow-4.14.2/lib/logind.c:38:55: error: parameter name omitted<br>
=C2=A0 =C2=A038 | unsigned long active_sessions_count(const char *name, uns=
igned long unused)<br>
<br>
Signed-off-by: Vyacheslav Yurkov &lt;<a href=3D"mailto:uvv.mail@gmail.com" =
target=3D"_blank">uvv.mail@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/shadow/shadow.inc | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
<br>
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extende=
d/shadow/shadow.inc<br>
index b8e5e285c4..5029ac4ca4 100644<br>
--- a/meta/recipes-extended/shadow/shadow.inc<br>
+++ b/meta/recipes-extended/shadow/shadow.inc<br>
@@ -43,6 +43,7 @@ EXTRA_OECONF +=3D &quot;--without-libcrack \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-group=
-name-max-length=3D24 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-sub=
ordinate-ids=3Dyes \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --without-ss=
sd \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${LOGINDOPT}=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${NSCDOPT}&q=
uot;<br>
<br>
=C2=A0CFLAGS:append:libc-musl =3D &quot; -DLIBBSD_OVERLAY&quot;<br>
@@ -52,6 +53,11 @@ NSCDOPT:class-native =3D &quot;--without-nscd&quot;<br>
=C2=A0NSCDOPT:class-nativesdk =3D &quot;--without-nscd&quot;<br>
=C2=A0NSCDOPT:libc-glibc =3D &quot;--with-nscd&quot;<br>
<br>
+LOGINDOPT =3D &quot;&quot;<br>
+LOGINDOPT:class-native =3D &quot;--disable-logind&quot;<br>
+LOGINDOPT:class-nativesdk =3D &quot;--disable-logind&quot;<br>
+LOGINDOPT:libc-glibc =3D &quot;--enable-logind&quot;<br>
+<br>
=C2=A0PAM_PLUGINS =3D &quot;libpam-runtime \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pam-plugin-faildela=
y \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pam-plugin-securett=
y \<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#195175): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/195175" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/195175</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104245489/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/104245489/1686489</a><br>
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

--000000000000b6ca180610e3f445--

