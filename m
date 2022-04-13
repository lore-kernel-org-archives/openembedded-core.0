Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF87C3527A
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:52 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web12.928.1649869011451835856
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 09:56:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YM3hDt1S;
 spf=pass (domain: gmail.com, ip: 209.85.167.45,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id x33so4690085lfu.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 09:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JC52X3mLYt7MrvkLZ3DCN5p74Z7UCKoSluKZeGE193g=;
        b=YM3hDt1Slycw78FvZvcisjP1XoLyXoEHo1xz97nsqHXDf+sElbmdALBOGeKglsVkxN
         pvLmmbKWEQuLEJWplS08QektIY0lw9wYKvVDN6XMc7EDA4K1U4j4G8SIXPkHKC144kxj
         oVC6vaXZZtIJ6TCJDQhr3fI5zG/3LL/8V/KlJt08BSChwk3l0sIUraRPFaJmX0QojOcC
         MYQytKgTo0uLK692BZDyR353QhCotSjMDTf5SDs0hXomy7AugGIm5Q0ob9eXAVRB+yNA
         dxaWLfRCyMj4lGqLemAR5e5Mn1rHQ8QZ1Ik25b9/M7iNPjBg6/Ad6KqGTogzOLUnKx5w
         jTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JC52X3mLYt7MrvkLZ3DCN5p74Z7UCKoSluKZeGE193g=;
        b=hpabKFYng1WoB0tmjs+FVbdIk23Zr5b7kgYotdo+SIqYFCt6V2MISEO3SjjqKsSTWE
         BgOTAozWT4JaJwOqt0cNsyXtgYvAJ2+8B735jLw2J6DBiQxMwlWcLZOxYKjyu+ahvRdj
         67HFuVwx0+6SBmdGaaD2NSyzVMNoV9uJCPfnOkFpkrfaBDmoSZYZBTJ/fAL9BYPApjOI
         A25oAsVVYh///+kFVlHZJb0ngcI+NBFPI5cZIt1INM8fft1FBBAyXcDdTBXFITPQqC5J
         NBGL561NJ2PqPbuJ1A4e7Jn/+feomfa5MdvSE6DlGQuKaL9EQWJIarHH4bOjWP19wU9y
         0/ZA==
X-Gm-Message-State: AOAM532cjgxF1ZBw+uEZKg+uA/YjTaZOyXdBMX5D+o//toIIxO2DN4Kv
	ZsynJ+pmel47bETOVHuIgMBPBUlT8G9csWJXusw=
X-Google-Smtp-Source: 
 ABdhPJzQn9xci7E/A6Rl6LYjv1YmEY8BwIWKE4oX4GpUdtilPxX8csZNsjWHqUaWZP/AQbVCmpFSO0Lhc+lUNhgT6D4=
X-Received: by 2002:a05:6512:1153:b0:44a:3b47:4f88 with SMTP id
 m19-20020a056512115300b0044a3b474f88mr28552783lfg.447.1649869009459; Wed, 13
 Apr 2022 09:56:49 -0700 (PDT)
MIME-Version: 1.0
References: 
 <HE1PR0902MB1801D263944083BC60D94282A8EC9@HE1PR0902MB1801.eurprd09.prod.outlook.com>
In-Reply-To: 
 <HE1PR0902MB1801D263944083BC60D94282A8EC9@HE1PR0902MB1801.eurprd09.prod.outlook.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 13 Apr 2022 17:56:38 +0100
Message-ID: 
 <CANPvuRkSufucyWjP7a4dmUmxaFMuq2KNoX3uFnzjxeax3Pm5ww@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] git: correct license
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003c217705dc8c10ec"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164343

--0000000000003c217705dc8c10ec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

Konrad Weihmann <kweihmann@outlook.com> escreveu no dia quarta, 13/04/2022
=C3=A0(s) 17:34:

> by default git pulls in several code fragments not being licensed
> under just GPL-2.0-only.
> In fact obstack and poll are taken from glib, being licensed
> under GPL-2.0-or-later - as this includes GPL-2.0-only, use this instead
>
> Furthermore
> reftable being BSD-3-Clause
> sha1dc and inet_ntop being MIT
> netmalloc being Bosst-1.0 aka BSL-1.0
> regex being LGPL-2.1-or-later
>
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>  meta/recipes-devtools/git/git_2.35.1.bb | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/git/git_2.35.1.bb
> b/meta/recipes-devtools/git/git_2.35.1.bb
> index 47c2211864..f8756b6dec 100644
> --- a/meta/recipes-devtools/git/git_2.35.1.bb
> +++ b/meta/recipes-devtools/git/git_2.35.1.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "Distributed version control system"
>  HOMEPAGE =3D "http://git-scm.com"
>  DESCRIPTION =3D "Git is a free and open source distributed version contr=
ol
> system designed to handle everything from small to very large projects wi=
th
> speed and efficiency."
>  SECTION =3D "console/utils"
> -LICENSE =3D "GPL-2.0-only"
> +LICENSE =3D "GPL-2.0-or-later & BSD-3-Clause & MIT & BSL-1.0 &
> LGPL-2.1-or-later"
>  DEPENDS =3D "openssl zlib"
>
>  PROVIDES:append:class-native =3D " git-replacement-native"
> @@ -14,7 +14,16 @@ SRC_URI =3D
> "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=3Dtarball \
>
>  S =3D "${WORKDIR}/git-${PV}"
>
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7c0d7ef03a7eb04ce795b0f60e68e=
7e1"
> +LIC_FILES_CHKSUM =3D "\
> +       file://COPYING;md5=3D7c0d7ef03a7eb04ce795b0f60e68e7e1 \
> +       file://reftable/LICENSE;md5=3D1a6424cafc4c9c88c689848e165af33b \
> +       file://sha1dc/LICENSE.txt;md5=3D9bbe4c990a9e98ea4b98ef5d3bcb8a7a =
\
> +
>  file://compat/nedmalloc/License.txt;md5=3De4224ccaecb14d942c71d31bef20d7=
8c \
> +
>  file://compat/inet_ntop.c;md5=3D76593c6f74e8ced5b24520175688d59b;endline=
=3D16 \
> +
>  file://compat/obstack.h;md5=3D08ad25fee5428cd879ceef451ce3a22e;endline=
=3D18 \
> +
>  file://compat/poll/poll.h;md5=3D9fc00170a53b8e3e52157c91ac688dd1;endline=
=3D19 \
> +
>  file://compat/regex/regex.h;md5=3D30cc8af0e6f0f8a25acec6d8783bb763;begin=
line=3D4;endline=3D22
> \
> +"
>

I don't know if it is possible but if we can add a compat PACKAGECONFIG
will be great
so we can disable this part which simplifies a little the license.

Jose


>
>  CVE_PRODUCT =3D "git-scm:git"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164341):
> https://lists.openembedded.org/g/openembedded-core/message/164341
> Mute This Topic: https://lists.openembedded.org/mt/90444706/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000003c217705dc8c10ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi</div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">Konrad Weihmann &lt;<a href=3D"mailto:kweihmann@out=
look.com">kweihmann@outlook.com</a>&gt; escreveu no dia quarta, 13/04/2022 =
=C3=A0(s) 17:34:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>by default git pulls in several code fragments not being licensed<br>
under just GPL-2.0-only.<br>
In fact obstack and poll are taken from glib, being licensed<br>
under GPL-2.0-or-later - as this includes GPL-2.0-only, use this instead<br=
>
<br>
Furthermore<br>
reftable being BSD-3-Clause<br>
sha1dc and inet_ntop being MIT<br>
netmalloc being Bosst-1.0 aka BSL-1.0<br>
regex being LGPL-2.1-or-later<br>
<br>
Signed-off-by: Konrad Weihmann &lt;<a href=3D"mailto:kweihmann@outlook.com"=
 target=3D"_blank">kweihmann@outlook.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/git/<a href=3D"http://git_2.35.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">git_2.35.1.bb</a> | 13 +++++++++++--<br>
=C2=A01 file changed, 11 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/git/<a href=3D"http://git_2.35.1.bb" rel=
=3D"noreferrer" target=3D"_blank">git_2.35.1.bb</a> b/meta/recipes-devtools=
/git/<a href=3D"http://git_2.35.1.bb" rel=3D"noreferrer" target=3D"_blank">=
git_2.35.1.bb</a><br>
index 47c2211864..f8756b6dec 100644<br>
--- a/meta/recipes-devtools/git/<a href=3D"http://git_2.35.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">git_2.35.1.bb</a><br>
+++ b/meta/recipes-devtools/git/<a href=3D"http://git_2.35.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">git_2.35.1.bb</a><br>
@@ -2,7 +2,7 @@ SUMMARY =3D &quot;Distributed version control system&quot;<=
br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://git-scm.com" rel=3D"noreferrer" =
target=3D"_blank">http://git-scm.com</a>&quot;<br>
=C2=A0DESCRIPTION =3D &quot;Git is a free and open source distributed versi=
on control system designed to handle everything from small to very large pr=
ojects with speed and efficiency.&quot;<br>
=C2=A0SECTION =3D &quot;console/utils&quot;<br>
-LICENSE =3D &quot;GPL-2.0-only&quot;<br>
+LICENSE =3D &quot;GPL-2.0-or-later &amp; BSD-3-Clause &amp; MIT &amp; BSL-=
1.0 &amp; LGPL-2.1-or-later&quot;<br>
=C2=A0DEPENDS =3D &quot;openssl zlib&quot;<br>
<br>
=C2=A0PROVIDES:append:class-native =3D &quot; git-replacement-native&quot;<=
br>
@@ -14,7 +14,16 @@ SRC_URI =3D &quot;${KERNELORG_MIRROR}/software/scm/git/g=
it-${PV}.tar.gz;name=3Dtarball \<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git-${PV}&quot;<br>
<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D7c0d7ef03a7eb04ce795b0f60e=
68e7e1&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://COPYING;md5=3D7c0d7ef03a7eb04ce795b0f60e=
68e7e1 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://reftable/LICENSE;md5=3D1a6424cafc4c9c88c=
689848e165af33b \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://sha1dc/LICENSE.txt;md5=3D9bbe4c990a9e98e=
a4b98ef5d3bcb8a7a \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://compat/nedmalloc/License.txt;md5=3De4224=
ccaecb14d942c71d31bef20d78c \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://compat/inet_ntop.c;md5=3D76593c6f74e8ced=
5b24520175688d59b;endline=3D16 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://compat/obstack.h;md5=3D08ad25fee5428cd87=
9ceef451ce3a22e;endline=3D18 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://compat/poll/poll.h;md5=3D9fc00170a53b8e3=
e52157c91ac688dd1;endline=3D19 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://compat/regex/regex.h;md5=3D30cc8af0e6f0f=
8a25acec6d8783bb763;beginline=3D4;endline=3D22 \<br>
+&quot;<br></blockquote><div><br></div><div>I don&#39;t know if it is possi=
ble but if we can add a compat PACKAGECONFIG will be great<br>so we can dis=
able this part which simplifies a little the license.<br></div><div><br></d=
iv><div>Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
=C2=A0CVE_PRODUCT =3D &quot;git-scm:git&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#164341): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/164341" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/164341</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90444706/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/90444706/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000003c217705dc8c10ec--

