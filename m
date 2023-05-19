Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26EBDC77B73
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 00:03:05 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.7854.1684454577653150021
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 May 2023 17:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=hEukzB7I;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-ba94605bcd5so4587276.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 May 2023 17:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684454577; x=1687046577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xI66z/AnU9ZQFx/c53ahTb1kqcGndRNPoJMGre3AW0A=;
        b=hEukzB7IWWSBmBQ/42hBmF5ndWTcoZz/hJcEXs07SeQ68gqrXnsmG1n4R91mvotbAs
         ZLRe+Na6MJAIGdKoF7dRGC18zNzzzPvACwP+Jmg7gF4+vAT78H2PTtwuVvk74O25apkB
         4abF+Piz5SXirBHQZE86DYkr/QbBwQ8AKHDFIJH573XlTaVN+hotmdHzA3AAA+hRxBG/
         AYxr+gggcbyE8W+jzcjLk8WFcWLdAf4zUwwt9giPBCgBLhrHpLxo3pUVXnJbhN5GXALc
         YgakKRAfRbTcVSOUiT8yfh+BXcr9GoLQQB7Wgm0/qr8kQQA4E1Nn5WZ5W3kgaRYGxlLg
         yjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684454577; x=1687046577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xI66z/AnU9ZQFx/c53ahTb1kqcGndRNPoJMGre3AW0A=;
        b=LBC4TDFCZjvKSvhBwjNfLnvBaoABDz857VkRXKlOJ/mcnUuJ45wM7PQu1jfqNNliyM
         StUaw5aoZhAOiUARvRhBC0nh5s58iCEpa3dXn++kml0SqB9QYVtZ0REBkBH2vdgMYusN
         3gqXrg52enkBLp8PNiNO1LZ1VnHA0C3vum9ZIYzk+2Vso8X4fvKWHPWe/+ESDAM9NCyd
         orWz+HOCUMmYhIsHLe9z7DGUWZg8vxcOqN9y1Lm+hV/4STyuVxg2JlKt5dZAA9Naunau
         SN4czh6AwAk/jmUSIzmnWLp8vC3gGn/T7y+jy/pxeD+z1AD6t8VeUEZ2XzVdRny61fEM
         bOPQ==
X-Gm-Message-State: AC+VfDxBHBHxcgyBOPbpl/VQMCMvMF+6TbN0uTMZ+STcDy93HXPTIqC1
	aKDwWnyXTlqjxiABMwnoPNVW/Jc2YaKmEKhP5mM=
X-Google-Smtp-Source: ACHHUZ6INIAi/UiKoQi+gh5xuACdKVVBHQjMcNqk3cA1JNsguGgsoTR6FmDNnZon1JQKf1Ta5XzjUeU3nn88imAJoew=
X-Received: by 2002:a25:c2:0:b0:ba8:7158:f0ac with SMTP id 185-20020a2500c2000000b00ba87158f0acmr744633yba.57.1684454575210;
 Thu, 18 May 2023 17:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230518160821.3661890-1-ross.burton@arm.com> <20230518160821.3661890-2-ross.burton@arm.com>
In-Reply-To: <20230518160821.3661890-2-ross.burton@arm.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 18 May 2023 17:02:44 -0700
Message-ID: <CANx9H-DNwo-dpqONxqNqnwzAhRL6Fon+=a5ke5SVC7wb7pm+uA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] python3-async: remove recipe
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Content-Type: multipart/alternative; boundary="000000000000988bc305fc00a44d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 00:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181528

--000000000000988bc305fc00a44d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you, Ross. Nice to see some cruft get jettisoned.

On Thu, May 18, 2023 at 9:08=E2=80=AFAM Ross Burton <ross.burton@arm.com> w=
rote:

> From: Ross Burton <ross.burton@arm.com>
>
> This is part of the same project as GitPython, but hasn't been used by
> gitdb (the sole user) since 2014.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
>
Acknowledged-by: Tim Orling <tim.orling@konsulko.com>

> ---
>  meta/recipes-devtools/python/python-async.inc      | 14 --------------
>  .../recipes-devtools/python/python3-async_0.6.2.bb |  2 --
>  2 files changed, 16 deletions(-)
>  delete mode 100644 meta/recipes-devtools/python/python-async.inc
>  delete mode 100644 meta/recipes-devtools/python/python3-async_0.6.2.bb
>
> diff --git a/meta/recipes-devtools/python/python-async.inc
> b/meta/recipes-devtools/python/python-async.inc
> deleted file mode 100644
> index fde864601c6..00000000000
> --- a/meta/recipes-devtools/python/python-async.inc
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -SUMMARY =3D "Python framework to process interdependent tasks in a pool =
of
> workers"
> -HOMEPAGE =3D "http://github.com/gitpython-developers/async"
> -SECTION =3D "devel/python"
> -LICENSE =3D "BSD-3-Clause"
> -LIC_FILES_CHKSUM =3D
> "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3D88df8e78b9edfd7449538621=
79f2d14e"
> -
> -inherit pypi
> -
> -SRC_URI[md5sum] =3D "9b06b5997de2154f3bc0273f80bcef6b"
> -SRC_URI[sha256sum] =3D
> "ac6894d876e45878faae493b0cf61d0e28ec417334448ac0a6ea2229d8343051"
> -
> -RDEPENDS:${PN} +=3D "${PYTHON_PN}-threading"
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta/recipes-devtools/python/python3-async_0.6.2.bb
> b/meta/recipes-devtools/python/python3-async_0.6.2.bb
> deleted file mode 100644
> index 0da5fdecdc8..00000000000
> --- a/meta/recipes-devtools/python/python3-async_0.6.2.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -inherit setuptools3
> -require python-async.inc
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181526):
> https://lists.openembedded.org/g/openembedded-core/message/181526
> Mute This Topic: https://lists.openembedded.org/mt/98994591/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000988bc305fc00a44d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thank you, Ross. Nice to see some cruft get jettisone=
d.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Thu, May 18, 2023 at 9:08=E2=80=AFAM Ross Burton &lt;<a href=3D"mailto=
:ross.burton@arm.com">ross.burton@arm.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">From: Ross Burton &lt;<a href=3D"m=
ailto:ross.burton@arm.com" target=3D"_blank">ross.burton@arm.com</a>&gt;<br=
>
<br>
This is part of the same project as GitPython, but hasn&#39;t been used by<=
br>
gitdb (the sole user) since 2014.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br></blockquote><div>Acknowledged-=
by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com">tim.orling@ko=
nsulko.com</a>&gt;=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
---<br>
=C2=A0meta/recipes-devtools/python/python-async.inc=C2=A0 =C2=A0 =C2=A0 | 1=
4 --------------<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-async_0.6.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-async_0.6.2.bb</a> |=C2=A0 2 =
--<br>
=C2=A02 files changed, 16 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python-async.inc<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/<a href=3D"http://pyt=
hon3-async_0.6.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-async_0.6=
.2.bb</a><br>
<br>
diff --git a/meta/recipes-devtools/python/python-async.inc b/meta/recipes-d=
evtools/python/python-async.inc<br>
deleted file mode 100644<br>
index fde864601c6..00000000000<br>
--- a/meta/recipes-devtools/python/python-async.inc<br>
+++ /dev/null<br>
@@ -1,14 +0,0 @@<br>
-SUMMARY =3D &quot;Python framework to process interdependent tasks in a po=
ol of workers&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"http://github.com/gitpython-developers/async=
" rel=3D"noreferrer" target=3D"_blank">http://github.com/gitpython-develope=
rs/async</a>&quot;<br>
-SECTION =3D &quot;devel/python&quot;<br>
-LICENSE =3D &quot;BSD-3-Clause&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;beginline=3D8;endline=3D8;md5=
=3D88df8e78b9edfd744953862179f2d14e&quot;<br>
-<br>
-inherit pypi<br>
-<br>
-SRC_URI[md5sum] =3D &quot;9b06b5997de2154f3bc0273f80bcef6b&quot;<br>
-SRC_URI[sha256sum] =3D &quot;ac6894d876e45878faae493b0cf61d0e28ec417334448=
ac0a6ea2229d8343051&quot;<br>
-<br>
-RDEPENDS:${PN} +=3D &quot;${PYTHON_PN}-threading&quot;<br>
-<br>
-BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-async_0=
.6.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-async_0.6.2.bb</a> b/=
meta/recipes-devtools/python/<a href=3D"http://python3-async_0.6.2.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-async_0.6.2.bb</a><br>
deleted file mode 100644<br>
index 0da5fdecdc8..00000000000<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-async_0.6.2.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-async_0.6.2.bb</a><br>
+++ /dev/null<br>
@@ -1,2 +0,0 @@<br>
-inherit setuptools3<br>
-require python-async.inc<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#181526): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/181526" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/181526</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98994591/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
98994591/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000988bc305fc00a44d--

