Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3111CC4829A
	for <webhook@archiver.kernel.org>; Sun, 11 Feb 2024 22:11:21 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.47213.1707689472308283775
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Feb 2024 14:11:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sex/8nZ7;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5114cd44f6aso3531838e87.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Feb 2024 14:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707689470; x=1708294270; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XRLMOPXQloJsgMNYtFP6izElp+M62tu8ezZBMrkmuIs=;
        b=Sex/8nZ7rX59mNkT+UVG8enqVb7SyInCSwYV9u9IiCyrefRQ6krJJ7dHOHvYzemIzC
         NI5FeMiLO+naKrQng9wEXy44cF1lEkcOJFKTTBjmP+gfcqXvH6O2z3S1Nf/jSs/nBwAf
         X4SVIa6mX8j1O4e9luIEGxVlyA2bwCf2p5jldMWlztF4T2BjnnkqaJw3/ZxMMCDLQ16R
         VZxdI5LAddFs+JsdfbLEeW2EbQEwJ4mJKQS2qKZm5KQO1lawYr/ooNCuw+aKpwFKRqUV
         Jv4t1m8LL/mQwWQ/9wXneKiuPFmEfF6sU6RQCTyH4DznaCbfYPuZz/MzZmmsA7hTq3gw
         yAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707689470; x=1708294270;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XRLMOPXQloJsgMNYtFP6izElp+M62tu8ezZBMrkmuIs=;
        b=nni4CYKlStJ96c4/7UFSKicas2BssAqB50VH3hcwDZUHORQxMwqU9eOV3IUugmmdRR
         c/DfgEWzAiuVoeWkjAGOP4Ti+S39kb0WVdaykOB+50JLnahsYOYBAinpudWBOX/fT87d
         sN1bCGThyjQ85IoP1w/k8FlE0Tk4ohpE8ounDZad/13l+GuYCn22OMc/3Jb4FptFFecD
         RSsWN8do70BPHeXFpzTA8Pam1qF1xgZarl6oSwRu+yuuqGyp5WX4JfqiehIeFPDaIMee
         VdOaOU9Pcv+4IiNoIbVr7tOa85C36yXfN3hCdv2gyTD0nbBiRHZBueHJXU6CkiQSKytO
         BZag==
X-Gm-Message-State: AOJu0Yw1Jh99f1aMW8S2yy+2Bu/kFPUBJn+0xUqOCSOnaenybDMQkkHl
	1f5L3iZohovHt8rwnF0lIlZp5e2p9BEu4W5qQyKQ5PNCdGJKCbs1e0Lx3ObMp9a+g6FKp/0mIts
	R6joa/wNci5ItEIy+f6x92Uimeqg=
X-Google-Smtp-Source: AGHT+IFjZtl1x5H5mPCUgmOiq1SKeNtQHC/6CdYy/W+MkH7WwUB3Dr5hVw/asxaHLp33b1YoYK/0f+3TV7OJQgQ4SpE=
X-Received: by 2002:a05:6512:3d20:b0:511:66fb:9f95 with SMTP id
 d32-20020a0565123d2000b0051166fb9f95mr3812481lfv.3.1707689470287; Sun, 11 Feb
 2024 14:11:10 -0800 (PST)
MIME-Version: 1.0
References: <20240211162523.387646-1-raj.khem@gmail.com>
In-Reply-To: <20240211162523.387646-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 11 Feb 2024 23:10:59 +0100
Message-ID: <CA+chaQeonXZkM+NETnw2-8MNUL+rUa5dvYA96Y8LgOGDtjjCYw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] tcmode-default: Do not define LLVMVERSION
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <ross.burton@arm.com>
Content-Type: multipart/alternative; boundary="000000000000436296061122703b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Feb 2024 22:11:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195297

--000000000000436296061122703b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There are some recipes in meta-intel which would need to be adjusted and
llvm version check in meta-browser, but I agree this is better than current
situation.

Acked-by: Martin Jansa <martin.jansa@gmail.com>

On Sun, Feb 11, 2024 at 5:25=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> There is a single version of llvm in core these days, furthermore the
> version is no longer asked for by recipes such as mesa, which would use
> llvm-config tool according to version of llvm found.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Ross Burton <ross.burton@arm.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc
> b/meta/conf/distro/include/tcmode-default.inc
> index e0319394f02..192a4e0bb2b 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -24,7 +24,6 @@ GLIBCVERSION ?=3D "2.39%"
>  LINUXLIBCVERSION ?=3D "6.6%"
>  QEMUVERSION ?=3D "8.2%"
>  GOVERSION ?=3D "1.20%"
> -LLVMVERSION ?=3D "17.%"
>  RUSTVERSION ?=3D "1.74%"
>
>  PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
> @@ -77,10 +76,6 @@ PREFERRED_VERSION_go-runtime ?=3D "${GOVERSION}"
>  PREFERRED_VERSION_nativesdk-go ?=3D "${GOVERSION}"
>  PREFERRED_VERSION_nativesdk-go-runtime ?=3D "${GOVERSION}"
>
> -PREFERRED_VERSION_llvm =3D "${LLVMVERSION}"
> -PREFERRED_VERSION_llvm-native =3D "${LLVMVERSION}"
> -PREFERRED_VERSION_nativesdk-llvm =3D "${LLVMVERSION}"
> -
>  # Rust toolchain preferred versions:
>
>  PREFERRED_VERSION_cargo ?=3D "${RUSTVERSION}"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195295):
> https://lists.openembedded.org/g/openembedded-core/message/195295
> Mute This Topic: https://lists.openembedded.org/mt/104296141/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000436296061122703b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There are some recipes in meta-intel which would need to b=
e adjusted and llvm version check in meta-browser, but I agree this is bett=
er than current situation.<div><br></div><div>Acked-by: Martin Jansa &lt;<a=
 href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt;</div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Sun, Feb 11, 2024 at 5:25=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj=
.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">There is a single version of llvm in cor=
e these days, furthermore the<br>
version is no longer asked for by recipes such as mesa, which would use<br>
llvm-config tool according to version of llvm found.<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_blank=
">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/tcmode-default.inc | 5 -----<br>
=C2=A01 file changed, 5 deletions(-)<br>
<br>
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro=
/include/tcmode-default.inc<br>
index e0319394f02..192a4e0bb2b 100644<br>
--- a/meta/conf/distro/include/tcmode-default.inc<br>
+++ b/meta/conf/distro/include/tcmode-default.inc<br>
@@ -24,7 +24,6 @@ GLIBCVERSION ?=3D &quot;2.39%&quot;<br>
=C2=A0LINUXLIBCVERSION ?=3D &quot;6.6%&quot;<br>
=C2=A0QEMUVERSION ?=3D &quot;8.2%&quot;<br>
=C2=A0GOVERSION ?=3D &quot;1.20%&quot;<br>
-LLVMVERSION ?=3D &quot;17.%&quot;<br>
=C2=A0RUSTVERSION ?=3D &quot;1.74%&quot;<br>
<br>
=C2=A0PREFERRED_VERSION_gcc ?=3D &quot;${GCCVERSION}&quot;<br>
@@ -77,10 +76,6 @@ PREFERRED_VERSION_go-runtime ?=3D &quot;${GOVERSION}&quo=
t;<br>
=C2=A0PREFERRED_VERSION_nativesdk-go ?=3D &quot;${GOVERSION}&quot;<br>
=C2=A0PREFERRED_VERSION_nativesdk-go-runtime ?=3D &quot;${GOVERSION}&quot;<=
br>
<br>
-PREFERRED_VERSION_llvm =3D &quot;${LLVMVERSION}&quot;<br>
-PREFERRED_VERSION_llvm-native =3D &quot;${LLVMVERSION}&quot;<br>
-PREFERRED_VERSION_nativesdk-llvm =3D &quot;${LLVMVERSION}&quot;<br>
-<br>
=C2=A0# Rust toolchain preferred versions:<br>
<br>
=C2=A0PREFERRED_VERSION_cargo ?=3D &quot;${RUSTVERSION}&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#195295): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/195295" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/195295</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104296141/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/104296141/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" ta=
rget=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000436296061122703b--

