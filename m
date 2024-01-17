Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F470C47422
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 03:37:27 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.1141.1705462637331577704
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 19:37:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bjpso4Ir;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50ea8fbf261so12632673e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 19:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705462635; x=1706067435; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=45SfcwsoZwhP824H1r0SP9iSW11YcFUdfQEK/8RDohE=;
        b=bjpso4Irk5SaW0jmn9JLjWTxYJuEvNR3w9UHHGmIyT7uJyqZ5ko1tUm67JmuPfQ6kw
         uREzt+hZv96GEpQp0UsChVWnsisHFcgGQGzxLnqzxNO9a/U2sVSvjPrCokzi6eQjISGC
         Wk4W+qs9zd3l3zrG1ecmZU3gkAYPrQ6qzdBFFkRLuHXgT+YLVGlxREaMYC3WTA0iu7ov
         A2EgpV6nCemu1r5JJYeWr6lCjBsSAvVDHT4Qk+JkECSwqXUwJy1VV2gLHJMSItXkRga4
         WdWdZjMGa3TIwz7mXPoasBpY3UQu1o3YUrbhJSr0HMtYA0n/PYxsX063XH1O98x5aaz7
         6jpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705462635; x=1706067435;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=45SfcwsoZwhP824H1r0SP9iSW11YcFUdfQEK/8RDohE=;
        b=qfV5JWX0ICo5QAsNX9gjkFFnQP1s385YEZPEjrcOCxQxW129/6VLnHfZuvTMFvdhIR
         Vd0ln0aGtTtcjyWa8M17Ley684go7CVvXfkqfFqyCHWX12teB0OV2CX3T/kFna0DQgYe
         VA2Yed0J5g9vYzTioPDAj1sSJP4Z319Nk3i/uqSYWM3YVaJvo8UttHNIZdpDCIB52UAl
         5ONiwd7JNFOY6YeR8aqRLEDWoG+hwUSWjdfts73XzUyu/TeeyhhaAmYFhepMxk/8USYO
         WZRRcrf9Pr5Sa3Jf7tX8op0gItV7JpiSKL8BHdNHCctzvwEPILFq9HB12Q1/sRzgsBTH
         3/Pw==
X-Gm-Message-State: AOJu0YzFsbyMvBcS3Zr48sNoCe8HVWVQScFKNexF2gG0JPnzTtln048M
	huWCzUhVzvQyT36r+TEiYe/e0kRpXqMwEFWX9IY=
X-Google-Smtp-Source: AGHT+IEyYISqNlNn8n187JETjRe8PuZlPhNjkTXdkwj2CyqPjsHoT6vomz9WyZmpOo6IW8pYzoHvenjy84vm93o5Et4=
X-Received: by 2002:a05:6512:318f:b0:50e:42d7:21fa with SMTP id
 i15-20020a056512318f00b0050e42d721famr4359445lfe.107.1705462635216; Tue, 16
 Jan 2024 19:37:15 -0800 (PST)
MIME-Version: 1.0
References: <20240116204558.7726-1-simone.p.weiss@posteo.com>
In-Reply-To: <20240116204558.7726-1-simone.p.weiss@posteo.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 Jan 2024 04:37:04 +0100
Message-ID: <CANNYZj8SgneHR-6yT4XG5=_W4sY5V_jjsTEO8eN8SMNiAS6+TA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] tune-core2: Update qemu cpu to supported model
To: =?UTF-8?B?U2ltb25lIFdlacOf?= <simone.p.weiss@posteo.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008cc103060f1bf6d9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 03:37:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193886

--0000000000008cc103060f1bf6d9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please provide a link to the documentation in the commit message, and not
just the claim.

Alex

On Tue 16. Jan 2024 at 21.46, Simone Wei=C3=9F <simone.p.weiss@posteo.com> =
wrote:

> From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
>
> Fixes [YOCTO #12388]
>
> QEMUs documentation does recommend to not use n270 and core2duo as
> an argument to -cpu anymore. Update therefore the QEMU cpu option for
> the core2duo tune to Nehalam. Tested it locally with QEMU and KVM.
>
> Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> ---
>  meta/conf/machine/include/x86/tune-core2.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/machine/include/x86/tune-core2.inc
> b/meta/conf/machine/include/x86/tune-core2.inc
> index 97b7c1b188..082fd4efc3 100644
> --- a/meta/conf/machine/include/x86/tune-core2.inc
> +++ b/meta/conf/machine/include/x86/tune-core2.inc
> @@ -21,18 +21,18 @@ TUNE_FEATURES:tune-core2-32 =3D
> "${TUNE_FEATURES:tune-x86} core2"
>  BASE_LIB:tune-core2-32 =3D "lib"
>  TUNE_PKGARCH:tune-core2-32 =3D "core2-32"
>  PACKAGE_EXTRA_ARCHS:tune-core2-32 =3D "${PACKAGE_EXTRA_ARCHS:tune-i686}
> core2-32"
> -QEMU_EXTRAOPTIONS_core2-32 =3D " -cpu n270"
> +QEMU_EXTRAOPTIONS_core2-32 =3D " -cpu Nehalem,check=3Dfalse"
>
>  AVAILTUNES +=3D "core2-64"
>  TUNE_FEATURES:tune-core2-64 =3D "${TUNE_FEATURES:tune-x86-64} core2"
>  BASE_LIB:tune-core2-64 =3D "lib64"
>  TUNE_PKGARCH:tune-core2-64 =3D "core2-64"
>  PACKAGE_EXTRA_ARCHS:tune-core2-64 =3D "${PACKAGE_EXTRA_ARCHS:tune-x86-64=
}
> core2-64"
> -QEMU_EXTRAOPTIONS_core2-64 =3D " -cpu core2duo"
> +QEMU_EXTRAOPTIONS_core2-64 =3D " -cpu Nehalem,check=3Dfalse"
>
>  AVAILTUNES +=3D "core2-64-x32"
>  TUNE_FEATURES:tune-core2-64-x32 =3D "${TUNE_FEATURES:tune-x86-64-x32} co=
re2"
>  BASE_LIB:tune-core2-64-x32 =3D "libx32"
>  TUNE_PKGARCH:tune-core2-64-x32 =3D "core2-64-x32"
>  PACKAGE_EXTRA_ARCHS:tune-core2-64-x32 =3D
> "${PACKAGE_EXTRA_ARCHS:tune-x86-64-x32} core2-64-x32"
> -QEMU_EXTRAOPTIONS_core2-64-x32 =3D " -cpu core2duo"
> +QEMU_EXTRAOPTIONS_core2-64-x32 =3D " -cpu Nehalem,check=3Dfalse"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193874):
> https://lists.openembedded.org/g/openembedded-core/message/193874
> Mute This Topic: https://lists.openembedded.org/mt/103771791/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000008cc103060f1bf6d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Please provide a link to the documentation in the commit =
message, and not just the claim.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Tue 16. Jan 2024 at 21.46, Simone Wei=C3=9F &lt;<a hr=
ef=3D"mailto:simone.p.weiss@posteo.com">simone.p.weiss@posteo.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bord=
er-left-color:rgb(204,204,204)">From: Simone Wei=C3=9F &lt;<a href=3D"mailt=
o:simone.p.weiss@posteo.com" target=3D"_blank">simone.p.weiss@posteo.com</a=
>&gt;<br>
<br>
Fixes [YOCTO #12388]<br>
<br>
QEMUs documentation does recommend to not use n270 and core2duo as<br>
an argument to -cpu anymore. Update therefore the QEMU cpu option for<br>
the core2duo tune to Nehalam. Tested it locally with QEMU and KVM.<br>
<br>
Signed-off-by: Simone Wei=C3=9F &lt;<a href=3D"mailto:simone.p.weiss@posteo=
.com" target=3D"_blank">simone.p.weiss@posteo.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/machine/include/x86/tune-core2.inc | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/conf/machine/include/x86/tune-core2.inc b/meta/conf/machi=
ne/include/x86/tune-core2.inc<br>
index 97b7c1b188..082fd4efc3 100644<br>
--- a/meta/conf/machine/include/x86/tune-core2.inc<br>
+++ b/meta/conf/machine/include/x86/tune-core2.inc<br>
@@ -21,18 +21,18 @@ TUNE_FEATURES:tune-core2-32 =3D &quot;${TUNE_FEATURES:t=
une-x86} core2&quot;<br>
=C2=A0BASE_LIB:tune-core2-32 =3D &quot;lib&quot;<br>
=C2=A0TUNE_PKGARCH:tune-core2-32 =3D &quot;core2-32&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS:tune-core2-32 =3D &quot;${PACKAGE_EXTRA_ARCHS:tun=
e-i686} core2-32&quot;<br>
-QEMU_EXTRAOPTIONS_core2-32 =3D &quot; -cpu n270&quot;<br>
+QEMU_EXTRAOPTIONS_core2-32 =3D &quot; -cpu Nehalem,check=3Dfalse&quot;<br>
<br>
=C2=A0AVAILTUNES +=3D &quot;core2-64&quot;<br>
=C2=A0TUNE_FEATURES:tune-core2-64 =3D &quot;${TUNE_FEATURES:tune-x86-64} co=
re2&quot;<br>
=C2=A0BASE_LIB:tune-core2-64 =3D &quot;lib64&quot;<br>
=C2=A0TUNE_PKGARCH:tune-core2-64 =3D &quot;core2-64&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS:tune-core2-64 =3D &quot;${PACKAGE_EXTRA_ARCHS:tun=
e-x86-64} core2-64&quot;<br>
-QEMU_EXTRAOPTIONS_core2-64 =3D &quot; -cpu core2duo&quot;<br>
+QEMU_EXTRAOPTIONS_core2-64 =3D &quot; -cpu Nehalem,check=3Dfalse&quot;<br>
<br>
=C2=A0AVAILTUNES +=3D &quot;core2-64-x32&quot;<br>
=C2=A0TUNE_FEATURES:tune-core2-64-x32 =3D &quot;${TUNE_FEATURES:tune-x86-64=
-x32} core2&quot;<br>
=C2=A0BASE_LIB:tune-core2-64-x32 =3D &quot;libx32&quot;<br>
=C2=A0TUNE_PKGARCH:tune-core2-64-x32 =3D &quot;core2-64-x32&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS:tune-core2-64-x32 =3D &quot;${PACKAGE_EXTRA_ARCHS=
:tune-x86-64-x32} core2-64-x32&quot;<br>
-QEMU_EXTRAOPTIONS_core2-64-x32 =3D &quot; -cpu core2duo&quot;<br>
+QEMU_EXTRAOPTIONS_core2-64-x32 =3D &quot; -cpu Nehalem,check=3Dfalse&quot;=
<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#193874): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/193874" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/193874</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103771791/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103771791/1686489</a><br>
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

--0000000000008cc103060f1bf6d9--

