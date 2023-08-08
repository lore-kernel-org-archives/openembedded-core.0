Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D7E3C001B0
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 16:57:11 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.67301.1691513822419642848
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 09:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=rvbnbg+x;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4fe1489ced6so9762293e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 09:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691513820; x=1692118620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ci4yYXRc3FBXYBHMQyokchCxl/362gYsW6zH6Gs2hss=;
        b=rvbnbg+xRDaifJ+ZOhP5FJ5jUbfjUohVwb/UU0MvihVwq61FijpwwuCXYqbZvNt7Ym
         kaiBhSZ1Fd2k9Yq8tTWqvSrANynICcQzt+vMgJxVZKadMArimSenR1CcLsXaxtim9rtw
         lf+IxrhuI7Cw/V0UXk/KRTsOiffYX4qZKx+p5iiCYLhGjE5My6NOJNY5n/ou1T/QU8I9
         AzMVp6igZmaVI38P9tVzHr2DILMDc9VU78bUSit3aI4J6UhVyMpeJaPA+sOT1FM6fLm+
         HEuzi/nGs0eAgGQKzg8vqDVUpk9y++P33O/mhmTVkxIuy6Lukzife4kvnXh427Hour6P
         L9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691513820; x=1692118620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ci4yYXRc3FBXYBHMQyokchCxl/362gYsW6zH6Gs2hss=;
        b=YK1akiInQtq2naMUkZvaSF4Rn3OD95oCua3/TlOVTu5AV2Up2VyXOnVQvpd/w5LdYH
         fQcJZ1eTorebUXL+El7+d8f9JSKoyR2zGmoOVr7vcYiMOc1dXqNqCoLLkJsFYUPpZIhm
         KsbmzVYII0kvplqbXWGNdQuNLmWDZxIX4BhnUCNg7IZMZlK3sS4a6HOhzESVkDyGg/Ac
         T6bIV/481EfR9/JrTceqKxjqIbnxNElj8RzvZpkITJHCmzvbFU1WCiBK6q96c0OIzLfJ
         y1TdUb443k9pS8dbzR+OVe7RKceHEnSOX0JAV3xeqgxRVlzdQTSqBPsJhAfSdjAXMF5q
         cGaQ==
X-Gm-Message-State: AOJu0YzLRPiacz1it9RMhDOl0QUli/LxNDWpJQ4CL2et1hDqI1W6M3FG
	t0DjhkYvv+dVDLazvuApxXPqty5Bu5W0Je254ow=
X-Google-Smtp-Source: AGHT+IFslIpfbdGvaxwieYN8iOIOarHqvHEGiqlgDa8m3f8BM8ECWmdWoTOvquLHtrJP63mIj5w84Xu7oowXK8HgiFI=
X-Received: by 2002:a19:690b:0:b0:4fb:76a5:2325 with SMTP id
 e11-20020a19690b000000b004fb76a52325mr55129lfc.24.1691513820201; Tue, 08 Aug
 2023 09:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230808165009.3282120-1-raj.khem@gmail.com>
In-Reply-To: <20230808165009.3282120-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 8 Aug 2023 18:56:49 +0200
Message-ID: <CANNYZj-PgqjC2=-prno2foK6ekXGJZTabMJW_rYoB0fjxJkehw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gnu-efi: Fix build on musl
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000062c68906026c408f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 16:57:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185672

--00000000000062c68906026c408f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think this doesn=E2=80=99t have to be musl specific, werror by default is=
 a bad
idea in general and conditional patches are a pain to maintain. Also it
should be proposed upstream.

Alex

On Tue 8. Aug 2023 at 18.50, Khem Raj <raj.khem@gmail.com> wrote:

> Build with musl emits extra warnings about pointer incompatibility due
> to different type of wchar_t than glibc which turns to be error in the
> end, disable -Werror for musl.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-bsp/gnu-efi/gnu-efi/no-werror.patch | 17 +++++++++++++++++
>  meta/recipes-bsp/gnu-efi/gnu-efi_3.0.17.bb      |  1 +
>  2 files changed, 18 insertions(+)
>  create mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/no-werror.patch
>
> diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/no-werror.patch
> b/meta/recipes-bsp/gnu-efi/gnu-efi/no-werror.patch
> new file mode 100644
> index 00000000000..2d7ad740723
> --- /dev/null
> +++ b/meta/recipes-bsp/gnu-efi/gnu-efi/no-werror.patch
> @@ -0,0 +1,17 @@
> +Do not treat warnings as errors on musl
> +
> +There are additional warnings found with musl which may not be treated a=
s
> errors
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Upstream-Status: Inappropriate [musl specific]
> +--- a/Make.defaults
> ++++ b/Make.defaults
> +@@ -187,7 +187,7 @@ CFLAGS  +=3D $(ARCH3264) -g -O2 -Wall -Wex
> +            -funsigned-char -fshort-wchar -fno-strict-aliasing \
> +            -ffreestanding -fno-stack-protector
> + else
> +-CFLAGS  +=3D $(ARCH3264) -g -O2 -Wall -Wextra -Wno-pointer-sign -Werror=
 \
> ++CFLAGS  +=3D $(ARCH3264) -g -O2 -Wall -Wextra -Wno-pointer-sign \
> +            -funsigned-char -fshort-wchar -fno-strict-aliasing \
> +          -ffreestanding -fno-stack-protector -fno-stack-check \
> +            -fno-stack-check \
> diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.17.bb
> b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.17.bb
> index d37d638e097..819d376f9d9 100644
> --- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.17.bb
> +++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.17.bb
> @@ -18,6 +18,7 @@ SRC_URI =3D
> "${SOURCEFORGE_MIRROR}/${BPN}/files/${BP}.tar.bz2 \
>             file://0001-riscv64-adjust-type-definitions.patch \
>             file://0001-riscv64-ignore-unknown-relocs.patch \
>             "
> +SRC_URI:append:libc-musl =3D " file://no-werror.patch"
>
>  SRC_URI[sha256sum] =3D
> "7807e903349343a7a142ebb934703a2872235e89688cf586c032b0a1087bcaf4"
>
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185671):
> https://lists.openembedded.org/g/openembedded-core/message/185671
> Mute This Topic: https://lists.openembedded.org/mt/100626020/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000062c68906026c408f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I think this doesn=E2=80=99t have to be musl specific, we=
rror by default is a bad idea in general and conditional patches are a pain=
 to maintain. Also it should be proposed upstream.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Alex=C2=A0</div><div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Tue 8. Aug 2023 at 18.50, Khem=
 Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bord=
er-left-color:rgb(204,204,204)">Build with musl emits extra warnings about =
pointer incompatibility due<br>
to different type of wchar_t than glibc which turns to be error in the<br>
end, disable -Werror for musl.<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-bsp/gnu-efi/gnu-efi/no-werror.patch | 17 ++++++++++++++++=
+<br>
=C2=A0meta/recipes-bsp/gnu-efi/<a href=3D"http://gnu-efi_3.0.17.bb" rel=3D"=
noreferrer" target=3D"_blank">gnu-efi_3.0.17.bb</a>=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
=C2=A02 files changed, 18 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/no-werror.patch<b=
r>
<br>
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/no-werror.patch b/meta/recipe=
s-bsp/gnu-efi/gnu-efi/no-werror.patch<br>
new file mode 100644<br>
index 00000000000..2d7ad740723<br>
--- /dev/null<br>
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi/no-werror.patch<br>
@@ -0,0 +1,17 @@<br>
+Do not treat warnings as errors on musl<br>
+<br>
+There are additional warnings found with musl which may not be treated as =
errors<br>
+<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+Upstream-Status: Inappropriate [musl specific]<br>
+--- a/Make.defaults<br>
++++ b/Make.defaults<br>
+@@ -187,7 +187,7 @@ CFLAGS=C2=A0 +=3D $(ARCH3264) -g -O2 -Wall -Wex<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -funsigned-char -fshort-wchar -f=
no-strict-aliasing \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -ffreestanding -fno-stack-protec=
tor<br>
+ else<br>
+-CFLAGS=C2=A0 +=3D $(ARCH3264) -g -O2 -Wall -Wextra -Wno-pointer-sign -Wer=
ror \<br>
++CFLAGS=C2=A0 +=3D $(ARCH3264) -g -O2 -Wall -Wextra -Wno-pointer-sign \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -funsigned-char -fshort-wchar -f=
no-strict-aliasing \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -ffreestanding -fno-stack-protector -fn=
o-stack-check \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -fno-stack-check \<br>
diff --git a/meta/recipes-bsp/gnu-efi/<a href=3D"http://gnu-efi_3.0.17.bb" =
rel=3D"noreferrer" target=3D"_blank">gnu-efi_3.0.17.bb</a> b/meta/recipes-b=
sp/gnu-efi/<a href=3D"http://gnu-efi_3.0.17.bb" rel=3D"noreferrer" target=
=3D"_blank">gnu-efi_3.0.17.bb</a><br>
index d37d638e097..819d376f9d9 100644<br>
--- a/meta/recipes-bsp/gnu-efi/<a href=3D"http://gnu-efi_3.0.17.bb" rel=3D"=
noreferrer" target=3D"_blank">gnu-efi_3.0.17.bb</a><br>
+++ b/meta/recipes-bsp/gnu-efi/<a href=3D"http://gnu-efi_3.0.17.bb" rel=3D"=
noreferrer" target=3D"_blank">gnu-efi_3.0.17.bb</a><br>
@@ -18,6 +18,7 @@ SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/${BPN}/files/${BP=
}.tar.bz2 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-riscv64-adjust-type-d=
efinitions.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-riscv64-ignore-unknow=
n-relocs.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+SRC_URI:append:libc-musl =3D &quot; file://no-werror.patch&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;7807e903349343a7a142ebb934703a2872235e89=
688cf586c032b0a1087bcaf4&quot;<br>
<br>
-- <br>
2.41.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#185671): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/185671" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/185671</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100626020/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100626020/1686489</a><br>
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

--00000000000062c68906026c408f--

