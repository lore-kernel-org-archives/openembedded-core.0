Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B16AEC6FA99
	for <webhook@archiver.kernel.org>; Sun, 12 Mar 2023 16:59:52 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web10.675.1678640385453937004
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Mar 2023 09:59:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KQRGYUnC;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id p13-20020a9d744d000000b0069438f0db7eso5578852otk.3
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 09:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678640384;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ECdPyf/gBYreeewMlsZBUZnBejQdzX7+hV+8EzVI66Y=;
        b=KQRGYUnCFOCUUGI+NFaCIyjz8qsjfcr+eVMsrYlXsPedD7qmFv3UvtHYc8xrICR11H
         At5wbTHDLhfCU3R0oNyW5zVWWrpwTafs5FRNpVyGS0jLaVOYEDbAb7mr7iLBTHf3v5oK
         43UiCpPNVXSoj5qnuUc8hLGRfOb9erXCvYuR/5AgZC2d/+6pOQSKFvTpWSda7te/QM1r
         GN6uu1v0PllHyErHCJczvK/C/Z92mwDoVUlpcEH5cPDalk+qcIxN14DQWbAQYoIf1yR0
         q9kbee2T/npb9v+IPX1UqubsKZv59IEgLXns40BP/UYvf0F+3QQXbXj243o5Bi2mpKt5
         vuKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678640384;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ECdPyf/gBYreeewMlsZBUZnBejQdzX7+hV+8EzVI66Y=;
        b=oMLwAQ+UF/mA+DiRW5g5DmO3jabwhrrZC2BZTuPpimnwkJViiMZVq1krYDkI0Yowiz
         7E2sCq/FYoZ88A4wsjhWsXAl7sjRbwgs4aI+x8kVRbFkQlAPSptZzW/bUCu2iP0fjeWr
         rdVoFxjRQbX0LiwgP9oyc3u6CIwA780yySjm6AyOVlE6ZxZK4TKUqqhYXuMvv9jJljBu
         stK7Oli2AwDXLPSUM83ySw1RYLEhkKjc46ch2tgFZdDlIkrRFML4xnRN6iEB75iFJcXu
         AnNfA5g88FpVNGKq+qfVl1hZwcQY5+KvobpKczT0ViAMlGLKJh4kxZO4dx9oRXXxHjkS
         +BmA==
X-Gm-Message-State: AO0yUKU967Nii3phcAFb9a2FgCoouoAlMRjnqMxZCPW+xZIzDm1QtgnA
	sgrVeF5+Mopkr5ibfqi68n/5trmyGGaUw3qhzCc=
X-Google-Smtp-Source: AK7set9H4GDYtgnNyVLv17y5Z6fA33nPF4soex+TPb9V/ZFMr+nIxabkxHGev446E0po/BxfVwENz57jGdBVw7HFHTg=
X-Received: by 2002:a9d:7215:0:b0:688:cf80:420e with SMTP id
 u21-20020a9d7215000000b00688cf80420emr10217252otj.2.1678640384495; Sun, 12
 Mar 2023 09:59:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230312072422.2626859-1-raj.khem@gmail.com> <CANNYZj8fy7m1_fzZKyVCoKTd2-c8dnas-0NYkif89JXf7fPOnw@mail.gmail.com>
In-Reply-To: <CANNYZj8fy7m1_fzZKyVCoKTd2-c8dnas-0NYkif89JXf7fPOnw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Mar 2023 09:59:33 -0700
Message-ID: <CAMKF1srA2ks+mvbBM3tWk=6zfcHFHYXnix2SNpCYnXp0rSDwVQ@mail.gmail.com>
Subject: Re: [PATCH] systemd: Fix musl fix patch
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d2d76d05f6b6eb12"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 16:59:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178400

--000000000000d2d76d05f6b6eb12
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 11, 2023 at 11:30 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> How can the issue be triggered? I did test this on musl, and so did
> the autobuilder.


My setup is clang/musl on imx8
Which is similar to qemuarm64
And build works for systemd but
Fails for systemd-boot recipe


>
> Alex
>
> On Sun, 12 Mar 2023 at 08:24, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Current patch with fail when stdint.h is in include path before this
> > typedef which can also happen with re-includes. Therefore shunt that
> > by defining __DEFINED_wchar_t which helps musl builds of systemd-boot
> > recipe
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  ...rc-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git
> a/meta/recipes-core/systemd/systemd/0004-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch
> b/meta/recipes-core/systemd/systemd/0004-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch
> > index 927f914848..43173ac32d 100644
> > ---
> a/meta/recipes-core/systemd/systemd/0004-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch
> > +++
> b/meta/recipes-core/systemd/systemd/0004-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch
> > @@ -21,17 +21,16 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de
> >
> >   src/boot/efi/efi-string.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > -diff --git a/src/boot/efi/efi-string.c b/src/boot/efi/efi-string.c
> > -index 22923d60f6..22a8d1ef71 100644
> >  --- a/src/boot/efi/efi-string.c
> >  +++ b/src/boot/efi/efi-string.c
> > -@@ -2,7 +2,12 @@
> > +@@ -2,7 +2,13 @@
> >
> >   #include <stdbool.h>
> >   #include <stdint.h>
> >  +
> >  +#if SD_BOOT
> >  +typedef __WCHAR_TYPE__ wchar_t;
> > ++#define __DEFINED_wchar_t
> >  +#else
> >   #include <wchar.h>
> >  +#endif
> > --
> > 2.39.2
> >
>

--000000000000d2d76d05f6b6eb12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Mar 11, 2023 at 11:30 PM Alexander Kanavin &lt;<a h=
ref=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">How can the issue be triggered? I =
did test this on musl, and so did<br>
the autobuilder.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">=
My setup is clang/musl on imx8</div><div dir=3D"auto">Which is similar to q=
emuarm64</div><div dir=3D"auto">And build works for systemd but</div><div d=
ir=3D"auto">Fails for systemd-boot recipe</div><div dir=3D"auto"><br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex" dir=3D"auto"><br>
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

--000000000000d2d76d05f6b6eb12--

