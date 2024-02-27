Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12AFEC54798
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 10:13:40 +0000 (UTC)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web10.9276.1709028815831420268
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 02:13:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LU+aknCj;
 spf=pass (domain: gmail.com, ip: 209.85.222.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-7d5bbbe592dso2147306241.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 02:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709028815; x=1709633615; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JihBy2+bS+yNsxStITjq7eniCKS3F6S9XUzoCb3SXyA=;
        b=LU+aknCj70qo30w2PnVzEoq6J9MGYJWgmPika0EZMUmHgNde8hHwL2yW1CK+Mu2gZN
         C57fM9CpRFLm48Bxa5oA4nCA45byOklCUx2le9QC7V2v/428d7aMx2QdZeSyhKMSUHyK
         gOl6gw/knOhxAMU/OrQO397wVM/cRDgyxh9eiMOi5wwQou/aFMetZUQ4CER8QGJqOaF/
         y7bzZ+Lu8DsKp5iRQ/moRs5B7wmnHK11oAz6ywtZmOWoYCeMq7xr5TiEfQLWy6uyDZZn
         rHxr+kjjLZwIrSVWCa7u8ozlaqKDjaJx9r8VJAPwi4Cf13hf+z9IYo6BAEuOHZEgp21h
         st7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709028815; x=1709633615;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JihBy2+bS+yNsxStITjq7eniCKS3F6S9XUzoCb3SXyA=;
        b=jfJHJE5qARl3YpikoquNyPiy1uPD5fq52gTuBrGXj7t87uQB8F/y2PhQaALzKbJS7c
         UjWsCu1lWyo4lLEsrrgUtO1QpNELA2Pxyuq4wPVn71gE+vv4DX0ON7PILfV9/ivcY5Gs
         UdsVxd0H5TQlmt1XBkqg5P++sq6WLB/uPy/WeLLhsAJAYj1YUyZcR7JfSatdj7p41UhT
         JopX3vgq+rtER0g+Qi3WOBWn001RYd+VWRRpt/qH8TE6EKsndkGtB7800Dzfp8hHkVFM
         1ddCDOcYB63D65eV21pXxgHzRMG+2OJLM8btFrIF8I/NhLTuksSt1Vy+Wye42KThJrbW
         nm7Q==
X-Gm-Message-State: AOJu0YwZJnopKZ+/Wh3MwsT/Rn1h8fgqSPy/t2A2Ug1JumJi3NuPKJ4J
	QydNbAAIPofTwWs+YHJmIgFft0M+7rZO4NRLcjTU/xvebhWnmzWKq3TO4bs79yX0DLtvTTmw+aq
	VpOQCE/MwpHL43YNO4uZTH9TOxM0=
X-Google-Smtp-Source: AGHT+IGyVYqWmMZIjjkAo0boiF3HOJgvpF6hLHZMw85+RAWcu4mHgZDmpTcn4n9rZnXd80rz3rlcF2LPMNS25ukZb30=
X-Received: by 2002:a05:6102:9a3:b0:470:5ecb:137c with SMTP id
 f3-20020a05610209a300b004705ecb137cmr7926979vsb.32.1709028814369; Tue, 27 Feb
 2024 02:13:34 -0800 (PST)
MIME-Version: 1.0
References: <20240227100709.1154-1-jose.quaresma@foundries.io> <17B7B05748A57C25.14830@lists.openembedded.org>
In-Reply-To: <17B7B05748A57C25.14830@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 27 Feb 2024 10:13:23 +0000
Message-ID: <CANPvuRkPCgyBY43BH7S=azRCKum51NVk2ikQ4jwU9V6ezUQWGg@mail.gmail.com>
Subject: Re: [OE-core] [RFC OE-core][PATCH 3/3] goarch: disable dynamic
 linking globally
To: quaresma.jose@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000643dbf06125a47f9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 10:13:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196253

--000000000000643dbf06125a47f9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I would like to ask if this patchset could be exercised in the autobuilder?
I only got it working yesterday and today I'm going to do a more exhaustive
test.
This is still missing the update to 1.22, which I'll do later, but testing
this would be a good help.

Jose

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu (ter=C3=A7a, 27/02/2024 =C3=A0(s=
) 10:07):

> With go-1.21 dynamic linking cause a runtime panic:
>
> | root@qemux86-64:~# go-helloworld
> | panic: runtime error: index out of range [0] with length 0
> |
> | goroutine 1 [running]:
> | flag.init()
> |         /usr/lib/go/src/flag/flag.go:1199 +0xf9
>
> In my opinion, this would be a good trade-off so that we can update and
> leave the version 1.20 for the next LTS 5.0 since we are already quite
> behind on the version available upstream which already has the 1.22
> available.
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta/classes-recipe/goarch.bbclass | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/meta/classes-recipe/goarch.bbclass
> b/meta/classes-recipe/goarch.bbclass
> index 1ebe03864f..6899ec28e4 100644
> --- a/meta/classes-recipe/goarch.bbclass
> +++ b/meta/classes-recipe/goarch.bbclass
> @@ -38,13 +38,13 @@ BASE_GOARM:armv5 =3D '5'
>  # Go supports dynamic linking on a limited set of architectures.
>  # See the supportsDynlink function in
> go/src/cmd/compile/internal/gc/main.go
>  GO_DYNLINK =3D ""
> -GO_DYNLINK:arm ?=3D "1"
> -GO_DYNLINK:aarch64 ?=3D "1"
> -GO_DYNLINK:x86 ?=3D "1"
> -GO_DYNLINK:x86-64 ?=3D "1"
> -GO_DYNLINK:powerpc64 ?=3D "1"
> -GO_DYNLINK:powerpc64le ?=3D "1"
> -GO_DYNLINK:class-native ?=3D ""
> +GO_DYNLINK:arm =3D ""
> +GO_DYNLINK:aarch64 =3D ""
> +GO_DYNLINK:x86 =3D ""
> +GO_DYNLINK:x86-64 =3D ""
> +GO_DYNLINK:powerpc64 =3D ""
> +GO_DYNLINK:powerpc64le =3D ""
> +GO_DYNLINK:class-native =3D ""
>  GO_DYNLINK:class-nativesdk =3D ""
>
>  # define here because everybody inherits this class
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196251):
> https://lists.openembedded.org/g/openembedded-core/message/196251
> Mute This Topic: https://lists.openembedded.org/mt/104600087/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000643dbf06125a47f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br>I would like to ask if this patchset could be =
exercised in the autobuilder?<br>I only got it working yesterday and today =
I&#39;m going to do a more exhaustive test.<br>This is still missing the up=
date to 1.22, which I&#39;ll do later, but testing this would be a good hel=
p.<br></div><div><br>Jose</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">Jose Quaresma via <a href=3D"http://lists.op=
enembedded.org">lists.openembedded.org</a> &lt;quaresma.jose=3D<a href=3D"m=
ailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a=
>&gt; escreveu (ter=C3=A7a, 27/02/2024 =C3=A0(s) 10:07):<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">With go-1.21 dynamic linking cause=
 a runtime panic:<br>
<br>
| root@qemux86-64:~# go-helloworld<br>
| panic: runtime error: index out of range [0] with length 0<br>
|<br>
| goroutine 1 [running]:<br>
| flag.init()<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/lib/go/src/flag/flag.go:1199 +0xf9<=
br>
<br>
In my opinion, this would be a good trade-off so that we can update and<br>
leave the version 1.20 for the next LTS 5.0 since we are already quite<br>
behind on the version available upstream which already has the 1.22 availab=
le.<br>
<br>
Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries.=
io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/goarch.bbclass | 14 +++++++-------<br>
=C2=A01 file changed, 7 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/goarch.bbclass b/meta/classes-recipe/goarc=
h.bbclass<br>
index 1ebe03864f..6899ec28e4 100644<br>
--- a/meta/classes-recipe/goarch.bbclass<br>
+++ b/meta/classes-recipe/goarch.bbclass<br>
@@ -38,13 +38,13 @@ BASE_GOARM:armv5 =3D &#39;5&#39;<br>
=C2=A0# Go supports dynamic linking on a limited set of architectures.<br>
=C2=A0# See the supportsDynlink function in go/src/cmd/compile/internal/gc/=
main.go<br>
=C2=A0GO_DYNLINK =3D &quot;&quot;<br>
-GO_DYNLINK:arm ?=3D &quot;1&quot;<br>
-GO_DYNLINK:aarch64 ?=3D &quot;1&quot;<br>
-GO_DYNLINK:x86 ?=3D &quot;1&quot;<br>
-GO_DYNLINK:x86-64 ?=3D &quot;1&quot;<br>
-GO_DYNLINK:powerpc64 ?=3D &quot;1&quot;<br>
-GO_DYNLINK:powerpc64le ?=3D &quot;1&quot;<br>
-GO_DYNLINK:class-native ?=3D &quot;&quot;<br>
+GO_DYNLINK:arm =3D &quot;&quot;<br>
+GO_DYNLINK:aarch64 =3D &quot;&quot;<br>
+GO_DYNLINK:x86 =3D &quot;&quot;<br>
+GO_DYNLINK:x86-64 =3D &quot;&quot;<br>
+GO_DYNLINK:powerpc64 =3D &quot;&quot;<br>
+GO_DYNLINK:powerpc64le =3D &quot;&quot;<br>
+GO_DYNLINK:class-native =3D &quot;&quot;<br>
=C2=A0GO_DYNLINK:class-nativesdk =3D &quot;&quot;<br>
<br>
=C2=A0# define here because everybody inherits this class<br>
-- <br>
2.44.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#196251): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/196251" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/196251</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104600087/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/104600087/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div>

--000000000000643dbf06125a47f9--

