Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F251C4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 11:58:07 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.20336.1705665481109088767
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 03:58:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y1V+bl9t;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40e80046246so4058045e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 03:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705665479; x=1706270279; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OJJWeMTMLbZyAgqYwHovAy31lfVovkh5b7aYttlCfoQ=;
        b=Y1V+bl9t3XeLTQ5WxOzs2GQoAPhmBxcM2Sd+hQa8krUcgGNyAzraoPrhO+/xdWR/v4
         UPKU/lL+OcMQxUxgHU3fhVed0fZPfzEyg0hLbLZGb94Ta4Ue2QpoqX64C66/Gpwm8khb
         KMPWud5mdtvl0hgsOtl/R/Hb5LmcZvN6c5V8YQrSqUJ42j/nFzE+IlxWYFlpgDPl99f3
         n+iOUZqMotJ2Mt4H7G3a7pzHgd6V4p2x27GPvLyEHHcUo4ZZb6EIktfKzqCx/tFaC4qb
         IlOpBE1z/gppYMFgl2t1VMlL9/ftTkvD6ZngC6v/7M4PI/2A/RF6GRgAshET8lRRvKiV
         tUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705665479; x=1706270279;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OJJWeMTMLbZyAgqYwHovAy31lfVovkh5b7aYttlCfoQ=;
        b=Ycmar9lhpKOVvaiu1g5bD7n6a1p0uQQeO78AgWJ51SBkzN8XpqDaESgvGVWvBr9sUy
         F8mU1GWsWL4isWAllJpZov8G3yDgqqN3BJLpum9AjFySDmbQLkkoZqxF88YATtvKF6Ro
         Xfn7DsMjI1ITONsfz+BlzZ4FDBU1Jb1auKGC0a/gUPUTE6w5SRl4jGsqD/P6w5Jdkd4x
         VdhJ+7e/z0Y2zZgV2ZPTyDZcXXw50zNibPQovEkMESy6nPiDmcVP3mO0QobKzWYpcRkU
         0pgXZdB4nXlIMWSmT+ZLM7f2A7T0ciaUFBAbpQe+34BD2Wg59SV5Em+3ZtkuScMesv2B
         Litw==
X-Gm-Message-State: AOJu0Ywg9NoKVeiBRbhZnpK2LD6/dfqT5QGi3sFrboeLID9/NIPxEm1W
	sqJHH0vufvosSIfGuIsW30dMXGjlen80jvPz2Nt9ZNPi683z+jAcJMo8tvkquVf6kvQhwV9ljR9
	/HLZy1bKJfUS7dPwo+90odTE2taw=
X-Google-Smtp-Source: AGHT+IEImyg0TkVLNL6YlQ3gEQ/sqszEke9rtE+8fiw0sSQD3jk548YA69J6vMI07FqaRiB3btve9MYUsQQuqM/FwpY=
X-Received: by 2002:a05:600c:2d91:b0:40d:785e:34a8 with SMTP id
 i17-20020a05600c2d9100b0040d785e34a8mr505653wmg.65.1705665479250; Fri, 19 Jan
 2024 03:57:59 -0800 (PST)
MIME-Version: 1.0
References: <20240119073509.934362-1-changqing.li@windriver.com>
In-Reply-To: <20240119073509.934362-1-changqing.li@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 19 Jan 2024 12:57:46 +0100
Message-ID: <CA+chaQdSeJ7jG4Q23RRxyOOS3g4NRieeGOkNJbmJiAs7NAWFfQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] tcmode-default.inc: use ?= to set PREFERRED_VERSION_llvm/llvm-native/nativesdk-llvm
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ff171c060f4b3045"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 11:58:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194035

--000000000000ff171c060f4b3045
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Do you need to override the  PREFERRED_VERSION_? instead of overriding
LLVMVERSION?

Aren't you trying to fix what was fixed in proposed change a while ago:
https://patchwork.yoctoproject.org/project/oe-core/patch/20230401163241.354=
257-1-Martin.Jansa@gmail.com/

On Fri, Jan 19, 2024 at 8:35=E2=80=AFAM Changqing Li <changqing.li@eng.wind=
river.com>
wrote:

> From: Changqing Li <changqing.li@windriver.com>
>
> use ?=3D to set following configs in order to allow user
> to override the default settings:
> PREFERRED_VERSION_llvm
> PREFERRED_VERSION_llvm-native
> PREFERRED_VERSION_nativesdk-llvm
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc
> b/meta/conf/distro/include/tcmode-default.inc
> index 3720a4c5b8..0de858d3af 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -77,9 +77,9 @@ PREFERRED_VERSION_go-runtime ?=3D "${GOVERSION}"
>  PREFERRED_VERSION_nativesdk-go ?=3D "${GOVERSION}"
>  PREFERRED_VERSION_nativesdk-go-runtime ?=3D "${GOVERSION}"
>
> -PREFERRED_VERSION_llvm =3D "${LLVMVERSION}"
> -PREFERRED_VERSION_llvm-native =3D "${LLVMVERSION}"
> -PREFERRED_VERSION_nativesdk-llvm =3D "${LLVMVERSION}"
> +PREFERRED_VERSION_llvm ?=3D "${LLVMVERSION}"
> +PREFERRED_VERSION_llvm-native ?=3D "${LLVMVERSION}"
> +PREFERRED_VERSION_nativesdk-llvm ?=3D "${LLVMVERSION}"
>
>  # Rust toolchain preferred versions:
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194017):
> https://lists.openembedded.org/g/openembedded-core/message/194017
> Mute This Topic: https://lists.openembedded.org/mt/103826050/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ff171c060f4b3045
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Do you need to override the=C2=A0 PREFERRED_VERSION_? inst=
ead of overriding LLVMVERSION?<div><br></div><div>Aren&#39;t you trying to =
fix what was fixed in proposed change a while ago:<br><div><a href=3D"https=
://patchwork.yoctoproject.org/project/oe-core/patch/20230401163241.354257-1=
-Martin.Jansa@gmail.com/">https://patchwork.yoctoproject.org/project/oe-cor=
e/patch/20230401163241.354257-1-Martin.Jansa@gmail.com/</a></div></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On F=
ri, Jan 19, 2024 at 8:35=E2=80=AFAM Changqing Li &lt;<a href=3D"mailto:chan=
gqing.li@eng.windriver.com">changqing.li@eng.windriver.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Changqing L=
i &lt;<a href=3D"mailto:changqing.li@windriver.com" target=3D"_blank">chang=
qing.li@windriver.com</a>&gt;<br>
<br>
use ?=3D to set following configs in order to allow user<br>
to override the default settings:<br>
PREFERRED_VERSION_llvm<br>
PREFERRED_VERSION_llvm-native<br>
PREFERRED_VERSION_nativesdk-llvm<br>
<br>
Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.co=
m" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/tcmode-default.inc | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro=
/include/tcmode-default.inc<br>
index 3720a4c5b8..0de858d3af 100644<br>
--- a/meta/conf/distro/include/tcmode-default.inc<br>
+++ b/meta/conf/distro/include/tcmode-default.inc<br>
@@ -77,9 +77,9 @@ PREFERRED_VERSION_go-runtime ?=3D &quot;${GOVERSION}&quot=
;<br>
=C2=A0PREFERRED_VERSION_nativesdk-go ?=3D &quot;${GOVERSION}&quot;<br>
=C2=A0PREFERRED_VERSION_nativesdk-go-runtime ?=3D &quot;${GOVERSION}&quot;<=
br>
<br>
-PREFERRED_VERSION_llvm =3D &quot;${LLVMVERSION}&quot;<br>
-PREFERRED_VERSION_llvm-native =3D &quot;${LLVMVERSION}&quot;<br>
-PREFERRED_VERSION_nativesdk-llvm =3D &quot;${LLVMVERSION}&quot;<br>
+PREFERRED_VERSION_llvm ?=3D &quot;${LLVMVERSION}&quot;<br>
+PREFERRED_VERSION_llvm-native ?=3D &quot;${LLVMVERSION}&quot;<br>
+PREFERRED_VERSION_nativesdk-llvm ?=3D &quot;${LLVMVERSION}&quot;<br>
<br>
=C2=A0# Rust toolchain preferred versions:<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#194017): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/194017" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/194017</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103826050/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103826050/3617156</a><br>
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

--000000000000ff171c060f4b3045--

