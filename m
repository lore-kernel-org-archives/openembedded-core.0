Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9DC7C004D4
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 08:47:32 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.11073.1674031644371324134
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 00:47:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PZptbb1M;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: aehs29@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id p133so12760874oig.8
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 00:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E1F0y6PvC7EWT2cZHuplHlup8U5+VVzH5vJ0P4iFiNc=;
        b=PZptbb1M3A1qKwmroCk2OLE9z4pLvpfsQz37R+ptr0vkwmmd17FXrZtYAsIqEuj4rt
         vY9VKJxr2QJT5SS/xQlw3gJ0Tya/pv3H5ypE6o4z4DH/3wBaZgw1MBEnKeNWfpXd9EFf
         +47VSxHO0QY2GYH7+zC2I+ADFWAqq9oMtG46a3rVqNI5Iu0Ji4ZhFIOTVor3793puHw5
         jhMbVST7knmWZGfMh1kM5zibOUJL6RlaAC/QzvRfLnl0goOxck71wW9j4wBxWrOyRvFs
         9uW0nmvD106ohvwqO1hfLCHG2FqVVgxEhJUXINfNFRfPZIKIeaFSmqOHcjoyvXoeGuyO
         78rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E1F0y6PvC7EWT2cZHuplHlup8U5+VVzH5vJ0P4iFiNc=;
        b=kSoXiM7TMG1QaGLBSWT5NJ+rwnJwSaavYqZoKExiVxZgfFgF4ivvbPm5CNwck4/IRv
         RavT9hEPuH0qc0ItU0WBx2gcNgiraeJFidUnnBj5KG0t5TQIOGxY4Cy07JUdIhUey71z
         SjSqWAVFMGqRg1uHkDDxec8ppR4YlHPLDtYG+nCx7ZfDQicIqY3lIw+hrsXGawSnwLlA
         gQyaDRpT486qDiMVHymMIHw01XHbTmmx9wLoxIcU5vqnptiFAcEQbi1WLsiMFvUamXvi
         rKCs0LJQ7aU13OqE1FC/uwA2F4H1vr98MC4eSAUMxqGgEWQbejLJeu/idN4zoa169QSA
         XGZQ==
X-Gm-Message-State: AFqh2kq8DXe9Yqcx+v0n6wHsdwv3vnNzJKvKYbnAUwv1QDu3z9q7JkW2
	JsHMHt3/UUuAAP9WbuqIMBGfFjDf9IrkFHrtYnc=
X-Google-Smtp-Source: AMrXdXu7t/Sa/XoPHGd3fKojdXpD4oHkZuVHwJbnwddCDp7uGOR+FkDc5aiTE33U6ns2BDWh7esspCDcixUyVWUzZ9s=
X-Received: by 2002:aca:1e07:0:b0:36a:d79d:6b44 with SMTP id
 m7-20020aca1e07000000b0036ad79d6b44mr241614oic.265.1674031643398; Wed, 18 Jan
 2023 00:47:23 -0800 (PST)
MIME-Version: 1.0
References: <20230115184358.2276696-1-raj.khem@gmail.com> <20230115184358.2276696-3-raj.khem@gmail.com>
In-Reply-To: <20230115184358.2276696-3-raj.khem@gmail.com>
From: Alejandro Hernandez <aehs29@gmail.com>
Date: Wed, 18 Jan 2023 01:47:12 -0700
Message-ID: <CAHMutraaE2nSJWgVxFLDQXsCpyCmX941CYvdbtvUgL0fm7X6MQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] binutils: Delete gdb and supporting sources
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000072987905f285dd95"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 08:47:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176079

--00000000000072987905f285dd95
Content-Type: text/plain; charset="UTF-8"

Hey Khem,

On Sun, 15 Jan 2023 at 11:44, Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/binutils/binutils.inc | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/meta/recipes-devtools/binutils/binutils.inc
> b/meta/recipes-devtools/binutils/binutils.inc
> index 98acf0a222..2b38aeb62d 100644
> --- a/meta/recipes-devtools/binutils/binutils.inc
> +++ b/meta/recipes-devtools/binutils/binutils.inc
> @@ -140,6 +140,16 @@ export CC_FOR_BUILD = "LD_LIBRARY_PATH= ${BUILD_CC}"
>
>  MULTIARCH := "${@bb.utils.contains("DISTRO_FEATURES", "multiarch", "yes",
> "no", d)}"
>  do_configure[vardeps] += "MULTIARCH"
> +
> +addtask do_prepare_sources after do_patch before do_configure
> +
> +# Remove gdb and supporting source directories, they are detected by
> +# configure otherwise and demands additional gdb deps e.g. gmp, mpc, mpfr
> +do_prepare_sources () {
> +       rm -rf ${S}/gdb ${S}/gdbserver ${S}/gdbsupport ${S}/gnulib \
> +       ${S}/libbacktrace ${S}/libdecnumber ${S}/readline ${S}/sim
> +}
> +
>

This seems to have been fixed upstream, I wonder if its better to backport
that patch to 2.40 so it aligns properly with the --disable-gdb flag we are
passing:
https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=5fb0e308577143ceb313fde5538dc9ecb038f29f

Cheers,

Alejandro

>  do_configure () {
>         (cd ${S} && gnu-configize)
>
> --
> 2.39.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175949):
> https://lists.openembedded.org/g/openembedded-core/message/175949
> Mute This Topic: https://lists.openembedded.org/mt/96291245/3619605
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alejandro@enedino.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000072987905f285dd95
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:arial,sans-serif;font-size:small">Hey Khem,</div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 15 Jan 20=
23 at 11:44, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" ta=
rget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/binutils/binutils.inc | 10 ++++++++++<br>
=C2=A01 file changed, 10 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-dev=
tools/binutils/binutils.inc<br>
index 98acf0a222..2b38aeb62d 100644<br>
--- a/meta/recipes-devtools/binutils/binutils.inc<br>
+++ b/meta/recipes-devtools/binutils/binutils.inc<br>
@@ -140,6 +140,16 @@ export CC_FOR_BUILD =3D &quot;LD_LIBRARY_PATH=3D ${BUI=
LD_CC}&quot;<br>
<br>
=C2=A0MULTIARCH :=3D &quot;${@bb.utils.contains(&quot;DISTRO_FEATURES&quot;=
, &quot;multiarch&quot;, &quot;yes&quot;, &quot;no&quot;, d)}&quot;<br>
=C2=A0do_configure[vardeps] +=3D &quot;MULTIARCH&quot;<br>
+<br>
+addtask do_prepare_sources after do_patch before do_configure<br>
+<br>
+# Remove gdb and supporting source directories, they are detected by<br>
+# configure otherwise and demands additional gdb deps e.g. gmp, mpc, mpfr<=
br>
+do_prepare_sources () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${S}/gdb ${S}/gdbserver ${S}/gdbsupport =
${S}/gnulib \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${S}/libbacktrace ${S}/libdecnumber ${S}/readli=
ne ${S}/sim<br>
+}<br>
+<br></blockquote><div>=C2=A0</div><div><div class=3D"gmail_default" style=
=3D"font-family:arial,sans-serif;font-size:small">This seems to have been f=
ixed upstream, I wonder if its better to backport that patch to 2.40 so it =
aligns properly with the --disable-gdb flag we are passing:<br><a href=3D"h=
ttps://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D5fb0e308=
577143ceb313fde5538dc9ecb038f29f">https://sourceware.org/git/?p=3Dbinutils-=
gdb.git;a=3Dcommitdiff;h=3D5fb0e308577143ceb313fde5538dc9ecb038f29f</a></di=
v><br></div><div class=3D"gmail_default" style=3D"font-family:arial,sans-se=
rif;font-size:small">Cheers,</div><div class=3D"gmail_default" style=3D"fon=
t-family:arial,sans-serif;font-size:small"><br></div><div class=3D"gmail_de=
fault" style=3D"font-family:arial,sans-serif;font-size:small">Alejandro</di=
v><div class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-s=
ize:small"></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0do_configure () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (cd ${S} &amp;&amp; gnu-configize)<br>
<br>
-- <br>
2.39.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#175949): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/175949" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/175949</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96291245/3619=
605" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/96291245/3619605</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alejandro@enedino.org" tar=
get=3D"_blank">alejandro@enedino.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000072987905f285dd95--

