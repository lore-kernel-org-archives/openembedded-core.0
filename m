Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B46C27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 09:34:02 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web10.16852.1718789642016484543
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 02:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=efMDlalA;
 spf=pass (domain: gmail.com, ip: 209.85.222.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-80b86cd886fso1798487241.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 02:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718789641; x=1719394441; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oPFUf8f0bJWcubzlnGGdoMuObcvHGbTZ1LyigR9XvIc=;
        b=efMDlalALzAA1lQqG6bIZo2SLH1LL1eaNaG7tB5JnaKqvWsXUHP6t9ffJGXV1MqtgM
         YnX7MmW9Yc1mKYreMw7NBg5rFMMgDQy1g9Ix0TPyACUm28iZkix8zxtxVXFpMLx39v8W
         nPGfKLoINIl/vH3m2mUUB+8cbh65AIosxuMYqKroCeVdH/MaO/jFkDQDImJ024AwqTQg
         0DRk6PzJOCJW4c7TZyeU2uka+/8rkuIvJ9TkP1BQNZ0b0XgQcy6iJA4WEnPvUvoTNswP
         5kZdSSuWWbech3lJMLkpeykr4fUQ3WMTMIV4sqXtGN/J5GemDRzIH4Kogtj7MQtY95f0
         UNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718789641; x=1719394441;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oPFUf8f0bJWcubzlnGGdoMuObcvHGbTZ1LyigR9XvIc=;
        b=EWlZ+CoVc3osBqAZ4qYokDi9au58kQpcyjyMFshzeCYidHhGdybQy+1BY6iBsOLzUj
         8Let98GabefTLU8c6ctDjJ3JxMG5KBDB15/HnRm3VhIvCUrzrcCke0UlfF7INqb8xEiZ
         RLHDjPBcN/82p6MC2nhhUNXZHk9BuVl2BJpK5XRetlgA/VfxzCjMy7cT/9a//ZkIZafz
         xmFeWVbOeFGu1d48SYeVFFt1wCxcLsJllfSng8Q/S2zA/0gdrbO7ctfo4lJLiQuW3yid
         +BC2QYDRy+TXxf4phHJlbn6MyhqoMR07CMk6bFNQ3+r/IoCCe0HMw4XmMxHBbdyYx2fS
         IdMA==
X-Gm-Message-State: AOJu0YznZOq2hacg2eTUyfVOakZ13ejtbEFKFBD8gxEZLgYoDvaCczMa
	6qWRvQDqud/aXB/1zUQ4fxQaxzIZTuXbFw3d5DZfJjydjy/f74JTArmhkfpOI2Mu2N8t9IyxQsp
	0leYsjcZD2o9rAusL3uc8o1TSpbk=
X-Google-Smtp-Source: AGHT+IEvh2ef9Za9Z5r1q/5g+pI4KtA2dTWP7qKIU0RND69+cNsv2fXZ+QGOpKTT3PmiKJjiT5pduudImfHSMKyQWik=
X-Received: by 2002:a05:6102:507:b0:48c:37f5:fe7b with SMTP id
 ada2fe7eead31-48f1303bb8amr2186166137.5.1718789640632; Wed, 19 Jun 2024
 02:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240619085957.2787700-1-alex.kanavin@gmail.com> <20240619085957.2787700-10-alex.kanavin@gmail.com>
In-Reply-To: <20240619085957.2787700-10-alex.kanavin@gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 19 Jun 2024 10:33:49 +0100
Message-ID: <CANPvuRkyyjavWQn2gynunhJpXxAG42+DmKNZ6+eTyumCoUCQog@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/15] glslang: mark 0001-generate-glslang-pkg-config.patch
 as Inappropriate
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000f94675061b3ae5c1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 09:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200903

--000000000000f94675061b3ae5c1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex

Alexander Kanavin via lists.openembedded.org <alex.kanavin=3D
gmail.com@lists.openembedded.org> escreveu (quarta, 19/06/2024 =C3=A0(s) 10=
:00):

> From: Alexander Kanavin <alex@linutronix.de>
>
> Issue is already being independently fixed upstream.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../glslang/glslang/0001-generate-glslang-pkg-config.patch      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git
> a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.=
patch
> b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.=
patch
> index e6bb6ec8e3c..5001d631443 100644
> ---
> a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.=
patch
> +++
> b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.=
patch
> @@ -5,7 +5,7 @@ Subject: [PATCH] generate glslang pkg-config
>
>  Based on
> https://src.fedoraproject.org/rpms/glslang/blob/main/f/0001-pkg-config-co=
mpatibility.patch
>
> -Upstream-Status: Pending
> +Upstream-Status: Inappropriate [independently developed patch submitted
> at https://github.com/KhronosGroup/glslang/pull/3371]
>

Maybe we can switch to the upstream submission. It is mostly the same with
the exception of the -lHLSL -lSPVRemapper we have in yocto.

Jose


>
>  Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
>  ---
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200896):
> https://lists.openembedded.org/g/openembedded-core/message/200896
> Mute This Topic: https://lists.openembedded.org/mt/106757095/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000f94675061b3ae5c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Alex</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Alexander Kanavin via <a href=3D"http://lists=
.openembedded.org">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D=
"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org<=
/a>&gt; escreveu (quarta, 19/06/2024 =C3=A0(s) 10:00):<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">From: Alexander Kanavin &lt;<a href=
=3D"mailto:alex@linutronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;=
<br>
<br>
Issue is already being independently fixed upstream.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" =
target=3D"_blank">alex@linutronix.de</a>&gt;<br>
---<br>
=C2=A0.../glslang/glslang/0001-generate-glslang-pkg-config.patch=C2=A0 =C2=
=A0 =C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pk=
g-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslan=
g-pkg-config.patch<br>
index e6bb6ec8e3c..5001d631443 100644<br>
--- a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-confi=
g.patch<br>
+++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-confi=
g.patch<br>
@@ -5,7 +5,7 @@ Subject: [PATCH] generate glslang pkg-config<br>
<br>
=C2=A0Based on <a href=3D"https://src.fedoraproject.org/rpms/glslang/blob/m=
ain/f/0001-pkg-config-compatibility.patch" rel=3D"noreferrer" target=3D"_bl=
ank">https://src.fedoraproject.org/rpms/glslang/blob/main/f/0001-pkg-config=
-compatibility.patch</a><br>
<br>
-Upstream-Status: Pending<br>
+Upstream-Status: Inappropriate [independently developed patch submitted at=
 <a href=3D"https://github.com/KhronosGroup/glslang/pull/3371" rel=3D"noref=
errer" target=3D"_blank">https://github.com/KhronosGroup/glslang/pull/3371<=
/a>]<br></blockquote><div><br></div><div>Maybe we can switch to the upstrea=
m submission. It is mostly the same with the exception of the=C2=A0-lHLSL -=
lSPVRemapper we have in yocto.</div><div><br></div><div>Jose</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmai=
l.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
=C2=A0---<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#200896): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/200896" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/200896</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106757095/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/106757095/5052612</a><br>
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

--000000000000f94675061b3ae5c1--

