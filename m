Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14CFFC433EF
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 20:34:46 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by mx.groups.io with SMTP id smtpd.web12.12199.1641587684630434564
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 12:34:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SnUcDBPi;
 spf=pass (domain: gmail.com, ip: 209.85.222.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f53.google.com with SMTP id v12so12308944uar.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 12:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h38NIyIJcXKRFhnFFQF5HKdfK/k01G60yvdUXw7y/oY=;
        b=SnUcDBPi2xhWKP4deSpBju58UbK2bUSL+YUnloBmXu+XFwm5A6jV0r8HqqeYfonEOJ
         plXT6PwesWZZCPB1qTAv3CVrzQk+MRl56RECRD2Fxpkq4zI6DJsJVa1kjtkobYi7GD7K
         r3fLsf8f2CgN2+j7WVYLEK8c/TrjBoEgd+e5ysUZzk6HaxQTze+qs/wLL7al52/5yxvb
         Na0l5xaW5jb+1qSZuIHbS0j0mGICmA9IX1DreTNnGWHlhB7bw20hFkrWPoO/UseRZJIH
         fLeWZ9/TGH2L87EK5/yyuWCqx8wsWYQ+vXx1TauLh+6vD0ofXTH+nMfrItCsECdKRjt8
         RAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h38NIyIJcXKRFhnFFQF5HKdfK/k01G60yvdUXw7y/oY=;
        b=1RKWIJvZPN/c/cYs03pVRmIIBwETWGCK53lz3dlDVD/DkwTvSe0rPSiOuX2TP9KoN0
         hSg3O4ZKQq4zZad4LR6MdO8NxtdTzKoUp2QOBEVjy3YzFuCtN5KvCCWG4j3mZ9LA3T1O
         Mj8KzrGXhM82MVsMKyzB76IkahhAXnAvIGDj94emOQWCgHLRgpC22vZskLRdz75TtS/P
         AHBD+YrSO43RFURHwSxrUJ5iCDHOT8MO0hkNNqBuRliIR48UrTsO4PeAkGbcNkPnqH/K
         Ycw5/3m7yg18KTBmSvxhHfVgz6htpdrpLbIrYZSCvOiArlcBKnWteXn1f28zOJCxLJ3U
         sEAg==
X-Gm-Message-State: AOAM531u3xXHgkzgqJxtFs3IpruxDg/WUyeSPHPoki1rPXgDPomdP8RA
	OOpnuRSvghbyi7gxshvc2KJ6YpFvcxjmxBAGbkg=
X-Google-Smtp-Source: 
 ABdhPJxPsYf1238YyWvQ2BTmujmlTjCX/b0RVJTzMFOO98bRb4V+lfRlJm7fxE2xQd9lhz3mUFlzdL3EHTBtrYGYxuo=
X-Received: by 2002:ab0:59ea:: with SMTP id k39mr3519099uad.71.1641587683820;
 Fri, 07 Jan 2022 12:34:43 -0800 (PST)
MIME-Version: 1.0
References: <20220107192255.3128781-1-raj.khem@gmail.com>
In-Reply-To: <20220107192255.3128781-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 7 Jan 2022 21:34:31 +0100
Message-ID: 
 <CANNYZj9OOwkzDKbrDbav0iQPzC4uKiQ5HTP4W4joLMh=oXfrPg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] libsdl2: Fix build when libunwind is not
 used
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	=?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000c30a3505d503eaca"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jan 2022 20:34:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160266

--000000000000c30a3505d503eaca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks :)

Alex

On Fri, 7 Jan 2022 at 20:23, Khem Raj <raj.khem@gmail.com> wrote:

> clang provides libunwind.h and cmake adds a check to
> find libunwind when this header is detected, which was
> not the case with automake. The check however is expecting
> specific unwinder implementation which provides libunwind-generic
> solib, this is not a standard library that all implementations
> will provide, therefore make this check optional.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
> v2: Udate patch status to submitted
>
>  .../libsdl2/optional-libunwind-generic.patch   | 18 ++++++++++++++++++
>  .../recipes-graphics/libsdl2/libsdl2_2.0.18.bb |  1 +
>  2 files changed, 19 insertions(+)
>  create mode 100644
> meta/recipes-graphics/libsdl2/libsdl2/optional-libunwind-generic.patch
>
> diff --git
> a/meta/recipes-graphics/libsdl2/libsdl2/optional-libunwind-generic.patch
> b/meta/recipes-graphics/libsdl2/libsdl2/optional-libunwind-generic.patch
> new file mode 100644
> index 00000000000..757b99a5f68
> --- /dev/null
> +++
> b/meta/recipes-graphics/libsdl2/libsdl2/optional-libunwind-generic.patch
> @@ -0,0 +1,18 @@
> +Do not error when libunwind-generic is not found, Not all
> +implementations of libunwind will provide this library therefore
> +do not make it hard error if its not found.
> +
> +Upstream-Status: Submitted [https://github.com/libsdl-org/SDL/pull/5194]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -1358,7 +1358,7 @@ elseif(UNIX AND NOT APPLE AND NOT ANDROI
> +       if(HAVE_LIBUNWIND_H)
> +         # We've already found the header, so REQUIRE the lib to be
> present
> +         pkg_search_module(UNWIND REQUIRED libunwind)
> +-        pkg_search_module(UNWIND_GENERIC REQUIRED libunwind-generic)
> ++        pkg_search_module(UNWIND_GENERIC libunwind-generic)
> +         list(APPEND EXTRA_LIBS ${UNWIND_LIBRARIES}
> ${UNWIND_GENERIC_LIBRARIES})
> +       endif()
> +     endif()
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
> b/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
> index 893386343a7..1559d5e9425 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
> @@ -18,6 +18,7 @@ PROVIDES =3D "virtual/libsdl2"
>
>  SRC_URI =3D "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
>             file://0001-Fix-build-against-wayland-1.20.patch \
> +           file://optional-libunwind-generic.patch \
>  "
>
>  S =3D "${WORKDIR}/SDL2-${PV}"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160265):
> https://lists.openembedded.org/g/openembedded-core/message/160265
> Mute This Topic: https://lists.openembedded.org/mt/88269209/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c30a3505d503eaca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks :)</div><div><br></div><div>Alex<br></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On F=
ri, 7 Jan 2022 at 20:23, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
>raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">clang provides libunwind.h and cmake adds a check to<br>
find libunwind when this header is detected, which was<br>
not the case with automake. The check however is expecting<br>
specific unwinder implementation which provides libunwind-generic<br>
solib, this is not a standard library that all implementations<br>
will provide, therefore make this check optional.<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@gmail.com" targ=
et=3D"_blank">schnitzeltony@gmail.com</a>&gt;<br>
---<br>
v2: Udate patch status to submitted<br>
<br>
=C2=A0.../libsdl2/optional-libunwind-generic.patch=C2=A0 =C2=A0| 18 +++++++=
+++++++++++<br>
=C2=A0.../recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.18.bb" rel=
=3D"noreferrer" target=3D"_blank">libsdl2_2.0.18.bb</a> |=C2=A0 1 +<br>
=C2=A02 files changed, 19 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/optional-lib=
unwind-generic.patch<br>
<br>
diff --git a/meta/recipes-graphics/libsdl2/libsdl2/optional-libunwind-gener=
ic.patch b/meta/recipes-graphics/libsdl2/libsdl2/optional-libunwind-generic=
.patch<br>
new file mode 100644<br>
index 00000000000..757b99a5f68<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/libsdl2/libsdl2/optional-libunwind-generic.patc=
h<br>
@@ -0,0 +1,18 @@<br>
+Do not error when libunwind-generic is not found, Not all<br>
+implementations of libunwind will provide this library therefore<br>
+do not make it hard error if its not found.<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/libsdl-org/SDL/p=
ull/5194" rel=3D"noreferrer" target=3D"_blank">https://github.com/libsdl-or=
g/SDL/pull/5194</a>]<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+<br>
+--- a/CMakeLists.txt<br>
++++ b/CMakeLists.txt<br>
+@@ -1358,7 +1358,7 @@ elseif(UNIX AND NOT APPLE AND NOT ANDROI<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if(HAVE_LIBUNWIND_H)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# We&#39;ve already found the header, so=
 REQUIRE the lib to be present<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkg_search_module(UNWIND REQUIRED libunw=
ind)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg_search_module(UNWIND_GENERIC REQUIRED lib=
unwind-generic)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg_search_module(UNWIND_GENERIC libunwind-ge=
neric)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list(APPEND EXTRA_LIBS ${UNWIND_LIBRARIE=
S} ${UNWIND_GENERIC_LIBRARIES})<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0endif()<br>
+=C2=A0 =C2=A0 =C2=A0endif()<br>
diff --git a/meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.18=
.bb" rel=3D"noreferrer" target=3D"_blank">libsdl2_2.0.18.bb</a> b/meta/reci=
pes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.18.bb" rel=3D"noreferrer=
" target=3D"_blank">libsdl2_2.0.18.bb</a><br>
index 893386343a7..1559d5e9425 100644<br>
--- a/meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.18.bb" re=
l=3D"noreferrer" target=3D"_blank">libsdl2_2.0.18.bb</a><br>
+++ b/meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.18.bb" re=
l=3D"noreferrer" target=3D"_blank">libsdl2_2.0.18.bb</a><br>
@@ -18,6 +18,7 @@ PROVIDES =3D &quot;virtual/libsdl2&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://www.libsdl.org/release/SDL2-$%7BP=
V%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://www.libsdl.org/rel=
ease/SDL2-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-build-against-way=
land-1.20.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://optional-libunwind-generic=
.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/SDL2-${PV}&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#160265): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/160265" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/160265</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88269209/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88269209/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000c30a3505d503eaca--

