Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 575D4EED625
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 17:01:24 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.53114.1726160476177269451
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Sep 2024 10:01:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K/zvTXN/;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: quaresma.jose@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4584a719ff5so8473891cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 10:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726160475; x=1726765275; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7wQ9R1eA0HJ+uWUCtIupfIzSYa2GNUmtLr+R8FpjogM=;
        b=K/zvTXN/5+NIRaSctQ/IWQCjHbmuAmBPigAeCwnFCDZqqJX+az562LXNL3tPf6x14s
         ansvKYcBHkxC9Z8k6jiIfUv2apNX5HbfJPXSnarWgzjG+C5aCTv4NbAQ2wNj389nGaaV
         JVhCzKwKTJEB1jyvS44kGuxBQcnM97j4rKaFpl3Dq7So9zYfUEUhgiC+oyyssDf1Jw6B
         h7EzcO+jDX8uLGQvrkvjDf/DjfhK2PSGV4OSNOMA54A4DpTj1k6NjqufGWbyGv/M+4yn
         Gi0Qoyd8Mpvq/SbdY2jT9v62i4nZAs7hB+uts3591EXeBYbyjTjQs0Q/a9hUL8CY4JOb
         XidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726160475; x=1726765275;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7wQ9R1eA0HJ+uWUCtIupfIzSYa2GNUmtLr+R8FpjogM=;
        b=XKphHZ0vi3XeQmZGuoaSiUGlB3mtbcZCowJiU//1gdDnk3YDl9Lfgwe5YXNlJ10EjG
         lzZ8JW2vL8az/H7mWDGcugApDNIGPSorPPweiEecSFIc06/pmm5HxL8E2SJ7DKydYddP
         NNVKrNbz4XGjYVXv/hlvtFCYCM3P1EFPpV+fZyCkJKNOBlI8bj9IZldwPsa3uaG128EN
         ec09hCz/qi26AeAoU9dTN61Md40yAg6QFy0hEA+5W6Q31ZwXFwPXt27cke/kkg1dUIzw
         h6xVx9Hh2jENJ0nX/kSb1tEvwWcs5O1fSn8SXw2d2IQEqw3NioeKuYT33wqLNVXb9vgW
         I/oA==
X-Gm-Message-State: AOJu0Yzz+it55CMX3kWSFkf1v/qj/zfmYYcI22AktyYbkfWBhPIvvMYW
	5a+PsZ1EU9N9wNg/Myf9dVzRZZV4nslTKx5d8casYutaf8mWDowSslP7Fsyb21RU3W960CCRjeX
	IIa6ie83sPEd7ZuIZ3+czTuFi7ftb+92X
X-Google-Smtp-Source: AGHT+IGPnDNMeclcilwoMqMTNdT7LPP00v+vzjQ0bNN8Tn9d8/pWmijC3G7qRzJ7nqvdFJvnKYVRjkyyRZoHAU5yb28=
X-Received: by 2002:a05:6102:3a0f:b0:49c:603:c786 with SMTP id
 ada2fe7eead31-49d414b1761mr3550935137.17.1726160463389; Thu, 12 Sep 2024
 10:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240912142953.1580877-1-christli@axis.com>
In-Reply-To: <20240912142953.1580877-1-christli@axis.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 12 Sep 2024 18:00:50 +0100
Message-ID: <CANPvuR=_+MNMoB6-5-0NyR+U0VS5p4A3VdXokv1Evw04=e7-+A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] go-mod.bbclass: Set GO_MOD_CACHE_DIR
To: christian.lindeberg@axis.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003ef6040621ef0da5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 17:01:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204451

--0000000000003ef6040621ef0da5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

Christian Lindeberg via lists.openembedded.org <christian.lindeberg=3D
axis.com@lists.openembedded.org> escreveu (quinta, 12/09/2024 =C3=A0(s) 15:=
30):

> From: Christian Lindeberg <christian.lindeberg@axis.com>
>
> Set the GO_MOD_CACHE_DIR variable and move the location of the module
> cache to enable the use of the go module fetchers for module
> dependencies.
> Also, clean out the module cache before unpacking.
>
> Signed-off-by: Christian Lindeberg <christian.lindeberg@axis.com>
> ---
>  meta/classes-recipe/go-mod.bbclass | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes-recipe/go-mod.bbclass
> b/meta/classes-recipe/go-mod.bbclass
> index ca3a690d05..71a6712c47 100644
> --- a/meta/classes-recipe/go-mod.bbclass
> +++ b/meta/classes-recipe/go-mod.bbclass
> @@ -22,9 +22,9 @@ GOBUILDFLAGS:append =3D " -modcacherw"
>
>  inherit go
>
> +GO_MOD_CACHE_DIR ?=3D "${@os.path.join(os.path.basename(d.getVar('S')),
> 'pkg/mod')}"
> +export GOMODCACHE =3D "${@os.path.join(os.path.dirname(d.getVar('S')),
> d.getVar('GO_MOD_CACHE_DIR'))}"
>

Using the default [1] bitbake S =3D "${WORKDIR}/${BP}" config, I think this
will be equal to:

GO_MOD_CACHE_DIR ?=3D "${BP}/pkg/mod"
export GOMODCACHE =3D "${WORKDIR}/${BP}/pkg/mod"

in the end this can be written as:

export GOMODCACHE ?=3D "${S}/pkg/mod"

Is it correct or am I seeing something wrong?

[1]
https://github.com/openembedded/openembedded-core/blob/40d2fbece1c2f6ecf62b=
ffa44ad37850e90268cb/meta/conf/bitbake.conf#L405C6-L405C16

Jose

+do_unpack[cleandirs] +=3D "${GOMODCACHE}"
> +
>  GO_WORKDIR ?=3D "${GO_IMPORT}"
>  do_compile[dirs] +=3D "${B}/src/${GO_WORKDIR}"
> -
> -export GOMODCACHE =3D "${B}/.mod"
> -
> -do_compile[cleandirs] +=3D "${B}/.mod"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204444):
> https://lists.openembedded.org/g/openembedded-core/message/204444
> Mute This Topic: https://lists.openembedded.org/mt/108413937/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000003ef6040621ef0da5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Christian,</div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">Christian Lindeberg via <a href=3D"http:=
//lists.openembedded.org">lists.openembedded.org</a> &lt;christian.lindeber=
g=3D<a href=3D"mailto:axis.com@lists.openembedded.org">axis.com@lists.opene=
mbedded.org</a>&gt; escreveu (quinta, 12/09/2024 =C3=A0(s) 15:30):<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">From: Christian Lindeber=
g &lt;<a href=3D"mailto:christian.lindeberg@axis.com" target=3D"_blank">chr=
istian.lindeberg@axis.com</a>&gt;<br>
<br>
Set the GO_MOD_CACHE_DIR variable and move the location of the module<br>
cache to enable the use of the go module fetchers for module<br>
dependencies.<br>
Also, clean out the module cache before unpacking.<br>
<br>
Signed-off-by: Christian Lindeberg &lt;<a href=3D"mailto:christian.lindeber=
g@axis.com" target=3D"_blank">christian.lindeberg@axis.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/go-mod.bbclass | 8 ++++----<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/go-mod.bbclass b/meta/classes-recipe/go-mo=
d.bbclass<br>
index ca3a690d05..71a6712c47 100644<br>
--- a/meta/classes-recipe/go-mod.bbclass<br>
+++ b/meta/classes-recipe/go-mod.bbclass<br>
@@ -22,9 +22,9 @@ GOBUILDFLAGS:append =3D &quot; -modcacherw&quot;<br>
<br>
=C2=A0inherit go<br>
<br>
+GO_MOD_CACHE_DIR ?=3D &quot;${@os.path.join(os.path.basename(d.getVar(&#39=
;S&#39;)), &#39;pkg/mod&#39;)}&quot;<br>
+export GOMODCACHE =3D &quot;${@os.path.join(os.path.dirname(d.getVar(&#39;=
S&#39;)), d.getVar(&#39;GO_MOD_CACHE_DIR&#39;))}&quot;<br></blockquote><div=
><br></div><div>Using the default [1] bitbake=C2=A0S =3D &quot;${WORKDIR}/$=
{BP}&quot; config, I think this will be equal=C2=A0to:</div><div><br></div>=
<div>GO_MOD_CACHE_DIR ?=3D &quot;${BP}/pkg/mod&quot;</div><div>export GOMOD=
CACHE =3D &quot;${WORKDIR}/${BP}/pkg/mod&quot;</div><div><br></div><div>in =
the end this can be written as:</div><div><br>export GOMODCACHE=C2=A0?=3D &=
quot;${S}/pkg/mod&quot;</div><div><div><br>Is it correct or am I seeing som=
ething wrong?<br><br></div></div><div>[1] <a href=3D"https://github.com/ope=
nembedded/openembedded-core/blob/40d2fbece1c2f6ecf62bffa44ad37850e90268cb/m=
eta/conf/bitbake.conf#L405C6-L405C16">https://github.com/openembedded/opene=
mbedded-core/blob/40d2fbece1c2f6ecf62bffa44ad37850e90268cb/meta/conf/bitbak=
e.conf#L405C6-L405C16</a><br></div><div><br></div><div>Jose</div><div><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
+do_unpack[cleandirs] +=3D &quot;${GOMODCACHE}&quot;<br>
+<br>
=C2=A0GO_WORKDIR ?=3D &quot;${GO_IMPORT}&quot;<br>
=C2=A0do_compile[dirs] +=3D &quot;${B}/src/${GO_WORKDIR}&quot;<br>
-<br>
-export GOMODCACHE =3D &quot;${B}/.mod&quot;<br>
-<br>
-do_compile[cleandirs] +=3D &quot;${B}/.mod&quot;<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#204444): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/204444" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/204444</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/108413937/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/108413937/5052612</a><br>
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
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--0000000000003ef6040621ef0da5--

