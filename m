Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 931C2C6FA99
	for <webhook@archiver.kernel.org>; Sun, 12 Mar 2023 17:50:39 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.509.1678643428774427620
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Mar 2023 10:50:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=egHbxTF9;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id bi9so12954142lfb.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 10:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678643427;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+D8xERp7/ocgaBY67GnYHymre2zYtksCNCFfSo8AiB4=;
        b=egHbxTF95Ibx9G8ST7WQg/RVNnSd4hPGYTlQKfsPI9nry6obi/frpMF+kQcxJxsOw2
         sHfk4JOnXUd/327qeoqEHSGdK0IkjPV7ffELMssVk60EnSK6yUE6gHpkJkSJkhV8I+O9
         O9Y16+KUrA44H8lc5tBbYgxy9yWnOEL+1FOAcWDMGxYxzjaSMlS6xwIJ/tXj9md4lgeH
         TnwfwBJ5Q3zw92BWjSs5ySUXkURn0kBYXcQf7Ccj0SacCPKO9MkjDxLLvQg8LKdgygjz
         ml1zE2DsM1QwVszo+QbmdS15bmMYMtsBPNuP3Yj7bI8xqKOWWXRZ34BfZJKy4APiLWha
         N1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678643427;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+D8xERp7/ocgaBY67GnYHymre2zYtksCNCFfSo8AiB4=;
        b=Np+MYKJNhBwua8RoDoAkMf1gx9us6xCImNGu3qWLRAUt/aW8jOqGC5FvRM8eYUhMtK
         CdLQmJxOJvj0cKeKOg4SmT842dlld2KEzH1/yBAWLli2wXgwsi9HOhMXb9plTp3HGj2S
         dP/T+X5yzDB4F7BlsDl8wNrgWEwbCBC2dzLrvc8MZX6mtOAGB5fk59cgAnjOKTpkZ/Tr
         1ixZR16zJd/ztKtpt9Q20NItKZKMqwL90rX3exHuDQeGDE0gOqm706RkYO9f39bUIKoH
         zFB9+jxw/y3wjAFWv197ximA8ru+pAHjZ3MgoTSesgYBlyLwRXSr9SC3GmaLES3Mf+oG
         oHPg==
X-Gm-Message-State: AO0yUKXH7DqIb75wLz+Ph1ZMPh/ZT+ee8fhZeGZVgyvsMGKKDZJNLUtm
	gaSJbi25U2o16SSIwjYeV09tMEpC0kIiZ/fFYmE=
X-Google-Smtp-Source: AK7set8HiekYx5WlW3K3XxD0kdYG6+mN16P/peCVF/CcaE9ZiVeOkoQfYdArtRCHYtfEFb7931VrsB2zbGCE2mCoYdI=
X-Received: by 2002:ac2:560a:0:b0:4d5:ca32:6aed with SMTP id
 v10-20020ac2560a000000b004d5ca326aedmr9604912lfd.13.1678643426881; Sun, 12
 Mar 2023 10:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230312072422.2626859-1-raj.khem@gmail.com> <CANNYZj8fy7m1_fzZKyVCoKTd2-c8dnas-0NYkif89JXf7fPOnw@mail.gmail.com>
 <CAMKF1srA2ks+mvbBM3tWk=6zfcHFHYXnix2SNpCYnXp0rSDwVQ@mail.gmail.com>
In-Reply-To: <CAMKF1srA2ks+mvbBM3tWk=6zfcHFHYXnix2SNpCYnXp0rSDwVQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 12 Mar 2023 18:50:16 +0100
Message-ID: <CANNYZj-5h=u8yF0zzpSbwoJWSzVFEo5AHMeER1qeEin3kVtUUg@mail.gmail.com>
Subject: Re: [PATCH] systemd: Fix musl fix patch
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000029f2ec05f6b7a1af"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 17:50:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178401

--00000000000029f2ec05f6b7a1af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Right, but what is the specific trigger for the error you are seeing that
requires this additional definition, compared to passing musl tests with
gcc?

 I=E2=80=99d like to understand that because your change should not be nece=
ssary
and I=E2=80=99ve had a long argument with upstream even for the existing pa=
tch.

Alex

On Sun 12. Mar 2023 at 17.59, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Sat, Mar 11, 2023 at 11:30 PM Alexander Kanavin <alex.kanavin@gmail.co=
m>
> wrote:
>
>> How can the issue be triggered? I did test this on musl, and so did
>> the autobuilder.
>
>
> My setup is clang/musl on imx8
> Which is similar to qemuarm64
> And build works for systemd but
> Fails for systemd-boot recipe
>
>
>>
>> Alex
>>
>> On Sun, 12 Mar 2023 at 08:24, Khem Raj <raj.khem@gmail.com> wrote:
>> >
>> > Current patch with fail when stdint.h is in include path before this
>> > typedef which can also happen with re-includes. Therefore shunt that
>> > by defining __DEFINED_wchar_t which helps musl builds of systemd-boot
>> > recipe
>> >
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > Cc: Alexander Kanavin <alex.kanavin@gmail.com>
>> > ---
>> >  ...rc-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch | 5 ++--=
-
>> >  1 file changed, 2 insertions(+), 3 deletions(-)
>> >
>> > diff --git
>> a/meta/recipes-core/systemd/systemd/0004-src-boot-efi-efi-string.c-defin=
e-wchar_t-from-__WCHA.patch
>> b/meta/recipes-core/systemd/systemd/0004-src-boot-efi-efi-string.c-defin=
e-wchar_t-from-__WCHA.patch
>> > index 927f914848..43173ac32d 100644
>> > ---
>> a/meta/recipes-core/systemd/systemd/0004-src-boot-efi-efi-string.c-defin=
e-wchar_t-from-__WCHA.patch
>> > +++
>> b/meta/recipes-core/systemd/systemd/0004-src-boot-efi-efi-string.c-defin=
e-wchar_t-from-__WCHA.patch
>> > @@ -21,17 +21,16 @@ Signed-off-by: Alexander Kanavin <
>> alex@linutronix.de>
>> >   src/boot/efi/efi-string.c | 5 +++++
>> >   1 file changed, 5 insertions(+)
>> >
>> > -diff --git a/src/boot/efi/efi-string.c b/src/boot/efi/efi-string.c
>> > -index 22923d60f6..22a8d1ef71 100644
>> >  --- a/src/boot/efi/efi-string.c
>> >  +++ b/src/boot/efi/efi-string.c
>> > -@@ -2,7 +2,12 @@
>> > +@@ -2,7 +2,13 @@
>> >
>> >   #include <stdbool.h>
>> >   #include <stdint.h>
>> >  +
>> >  +#if SD_BOOT
>> >  +typedef __WCHAR_TYPE__ wchar_t;
>> > ++#define __DEFINED_wchar_t
>> >  +#else
>> >   #include <wchar.h>
>> >  +#endif
>> > --
>> > 2.39.2
>> >
>>
>

--00000000000029f2ec05f6b7a1af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Right, but what is the specific trigger for the error you=
 are seeing that requires this additional definition, compared to passing m=
usl tests with gcc?</div><div dir=3D"auto"><br></div><div dir=3D"auto">=C2=
=A0I=E2=80=99d like to understand that because your change should not be ne=
cessary and I=E2=80=99ve had a long argument with upstream even for the exi=
sting patch.<br></div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</d=
iv><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Sun 12. Mar 2023 at 17.59, Khem Raj &lt;<a href=3D"mailto:raj.khem@gma=
il.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-le=
ft-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><div><b=
r></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sat, Mar 11, 2023 at 11:30 PM Alexander Kanavin &lt;<a href=3D"ma=
ilto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;=
border-left-color:rgb(204,204,204)">How can the issue be triggered? I did t=
est this on musl, and so did<br>
the autobuilder.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">=
My setup is clang/musl on imx8</div><div dir=3D"auto">Which is similar to q=
emuarm64</div><div dir=3D"auto">And build works for systemd but</div><div d=
ir=3D"auto">Fails for systemd-boot recipe</div></div></div><div><div class=
=3D"gmail_quote"><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-sty=
le:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto">=
<br>
<br>
Alex<br>
<br>
On Sun, 12 Mar 2023 at 08:24, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Current patch with fail when stdint.h is in include path before this<b=
r>
&gt; typedef which can also happen with re-includes. Therefore shunt that<b=
r>
&gt; by defining __DEFINED_wchar_t which helps musl builds of systemd-boot<=
br>
&gt; recipe<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; Cc: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...rc-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch | 5=
 ++---<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/systemd/systemd/0004-src-boot-efi-efi-s=
tring.c-define-wchar_t-from-__WCHA.patch b/meta/recipes-core/systemd/system=
d/0004-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch<br>
&gt; index 927f914848..43173ac32d 100644<br>
&gt; --- a/meta/recipes-core/systemd/systemd/0004-src-boot-efi-efi-string.c=
-define-wchar_t-from-__WCHA.patch<br>
&gt; +++ b/meta/recipes-core/systemd/systemd/0004-src-boot-efi-efi-string.c=
-define-wchar_t-from-__WCHA.patch<br>
&gt; @@ -21,17 +21,16 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"ma=
ilto:alex@linutronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt;=C2=A0 =C2=A0src/boot/efi/efi-string.c | 5 +++++<br>
&gt;=C2=A0 =C2=A01 file changed, 5 insertions(+)<br>
&gt;<br>
&gt; -diff --git a/src/boot/efi/efi-string.c b/src/boot/efi/efi-string.c<br=
>
&gt; -index 22923d60f6..22a8d1ef71 100644<br>
&gt;=C2=A0 --- a/src/boot/efi/efi-string.c<br>
&gt;=C2=A0 +++ b/src/boot/efi/efi-string.c<br>
&gt; -@@ -2,7 +2,12 @@<br>
&gt; +@@ -2,7 +2,13 @@<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#include &lt;stdbool.h&gt;<br>
&gt;=C2=A0 =C2=A0#include &lt;stdint.h&gt;<br>
&gt;=C2=A0 +<br>
&gt;=C2=A0 +#if SD_BOOT<br>
&gt;=C2=A0 +typedef __WCHAR_TYPE__ wchar_t;<br>
&gt; ++#define __DEFINED_wchar_t<br>
&gt;=C2=A0 +#else<br>
&gt;=C2=A0 =C2=A0#include &lt;wchar.h&gt;<br>
&gt;=C2=A0 +#endif<br>
&gt; --<br>
&gt; 2.39.2<br>
&gt;<br>
</blockquote></div></div>
</blockquote></div></div>

--00000000000029f2ec05f6b7a1af--

