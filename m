Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69854C4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 05:42:20 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web12.4679.1666158133908149448
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Oct 2022 22:42:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A84aq5pY;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id j4so26385904lfk.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 22:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RkYjJ8xF025P7d3akBkxPulwltCW9mWSxrdaz3uhxoo=;
        b=A84aq5pYdKewfKXoX5DLnqmsE2ILcW8QVZiDjEf+sgtyJz07OvyKX/no03kVj3molQ
         jdwO8Tb8y9Q1VfDfqwGB06xExG6Qg/Ys82tOCQirTtN+aMpJljy1oRO1R2hOsemmOQXQ
         oehLsM/N2+qGXwauv4KD81FSR9TPi13vAINZhCGo9x5kLmHeSwZdTWQa1F0OouzuVzqY
         wGAN8g9b5yvVArKU1Dac1JrIZidKlTFPdw4F5Zj5OR4RG8JLxFEovcMdtU/pBtr8s+du
         UMHziMSQyuFaVsn3pQKs+eqi54BawpFSALhRWx8TB1ES8Fzw9Y6iNJ4M5PPNu0bHwO8t
         G72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RkYjJ8xF025P7d3akBkxPulwltCW9mWSxrdaz3uhxoo=;
        b=gyFEg6kyNCiRoB+fWtPS+SeXJ5571tb2iup6gmJpVHT83u9UEpFHMohoKYAi70BXGH
         x6KTxIyut0snW5e9RBpHkc7N85y6FkvlFRlkywqUBTu3XXOHxvuejLNaLePgVhkWV1Yc
         vO+7qVzY1GMueBn4S/Tbb5ZrsxQsrn7J+luNDMwCEBAm66xw3yWI+Mcd27/DmK76AJGw
         tjvUQ/JsehX5xBEtQpwjv75X9GcGg2gRkMj+t6Dl4vzAIiHQVjWjKe6eEwUr7I8xw7b7
         z915hFQW7fOEBkhiF7tybUTO84yuW2LQ+hn99N6cDGJ8YKa2gYHnaZiEe8Gq0FOnBacg
         J0fA==
X-Gm-Message-State: ACrzQf1bhSEB/BwkFGrnUB3Czc72DMULPQhTojWNCMmwkzTkjc+lG4jb
	/kMKEXD1KBusPqY1gxkCmyiSb7oZ62IF7D4Tjv0=
X-Google-Smtp-Source: AMsMyM4ZuLhpojDmQGa/2XJtCdY4LUMlr15eD33gyZjuJF3BOPt8UtnaqkrUkElWde1anZjZCBz6LJA1wwul9L4ziB0=
X-Received: by 2002:a05:6512:2399:b0:4a2:94d6:da27 with SMTP id
 c25-20020a056512239900b004a294d6da27mr2275890lfv.131.1666158131375; Tue, 18
 Oct 2022 22:42:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221018230820.2385167-1-raj.khem@gmail.com>
In-Reply-To: <20221018230820.2385167-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Oct 2022 07:42:00 +0200
Message-ID: <CANNYZj-r7G4y3ma8NkrgmKm-vgoXjvMEWYAUh=bOE0z80DrxkA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] mesa: Add native patch via a variable
To: Khem Raj <raj.khem@gmail.com>
Cc: Kai Kang <kai.kang@windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008f73ea05eb5cab73"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 05:42:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171954

--0000000000008f73ea05eb5cab73
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can you show examples where this is needed? Custom variable does not seem a
good idea. I also worry that it=E2=80=99ll break automated updates (it=E2=
=80=99s bad enough
with mesa-gl, this might make it worse).

Alex

On Wed 19. Oct 2022 at 1.08, Khem Raj <raj.khem@gmail.com> wrote:

> This helps override the SRC_URI in entirety if needed by
> and overriding recipe
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Kai Kang <kai.kang@windriver.com>
> ---
> v2: Weakly define NATIVE_PATCHES
>
>  meta/recipes-graphics/mesa/mesa.inc | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> index c94e439363..04d78a6aa5 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -19,10 +19,11 @@ SRC_URI =3D "
> https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h
> \
>
> file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
>             file://0001-util-format-Check-for-NEON-before-using-it.patch =
\
> +           ${NATIVE_PATCHES} \
>             "
> -
> +NATIVE_PATCHES ?=3D ""
>  # required by mesa-native on Ubuntu 18.04 with gcc 7.5 when DEBUG_BUILD
> enabled
> -SRC_URI:append:class-native =3D "
> file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch"
> +NATIVE_PATCHES:class-native =3D
> "file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch"
>
>  SRC_URI[sha256sum] =3D
> "b1f9c8fd08f2cae3adf83355bef4d2398e8025f44947332880f2d0066bdafa8c"
>
> --
> 2.38.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171948):
> https://lists.openembedded.org/g/openembedded-core/message/171948
> Mute This Topic: https://lists.openembedded.org/mt/94420106/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000008f73ea05eb5cab73
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Can you show examples where this is needed? Custom v=
ariable does not seem a good idea. I also worry that it=E2=80=99ll break au=
tomated updates (it=E2=80=99s bad enough with mesa-gl, this might make it w=
orse).</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div></div><=
div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Wed 19. Oct 2022 at 1.08, Khem Raj &lt;<a href=3D"mailto:raj.khem@gma=
il.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-w=
idth:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204=
,204,204)" dir=3D"auto">This helps override the SRC_URI in entirety if need=
ed by<br>
and overriding recipe<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" target=3D"_blank=
">kai.kang@windriver.com</a>&gt;<br>
---<br>
v2: Weakly define NATIVE_PATCHES<br>
<br>
=C2=A0meta/recipes-graphics/mesa/mesa.inc | 5 +++--<br>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc<br>
index c94e439363..04d78a6aa5 100644<br>
--- a/meta/recipes-graphics/mesa/mesa.inc<br>
+++ b/meta/recipes-graphics/mesa/mesa.inc<br>
@@ -19,10 +19,11 @@ SRC_URI =3D &quot;<a href=3D"https://mesa.freedesktop.o=
rg/archive/mesa-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">http=
s://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-meson-misdetects-64bi=
t-atomics-on-mips-clang.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-futex.h-Define-__NR_f=
utex-if-it-does-not-exist.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-util-format-Check-for=
-NEON-before-using-it.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${NATIVE_PATCHES} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-<br>
+NATIVE_PATCHES ?=3D &quot;&quot;<br>
=C2=A0# required by mesa-native on Ubuntu 18.04 with gcc 7.5 when DEBUG_BUI=
LD enabled<br>
-SRC_URI:append:class-native =3D &quot; file://0001-nir-nir_opt_move-fix-AL=
WAYS_INLINE-compiler-error.patch&quot;<br>
+NATIVE_PATCHES:class-native =3D &quot;file://0001-nir-nir_opt_move-fix-ALW=
AYS_INLINE-compiler-error.patch&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;b1f9c8fd08f2cae3adf83355bef4d2398e8025f4=
4947332880f2d0066bdafa8c&quot;<br>
<br>
-- <br>
2.38.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#171948): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/171948" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/171948</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94420106/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94420106/1686489</a><br>
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
</div>

--0000000000008f73ea05eb5cab73--

