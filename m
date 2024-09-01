Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C58C54FC6
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 12:52:21 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.15551.1725195133688004217
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Sep 2024 05:52:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=GczZ6khO;
 spf=pass (domain: mvista.com, ip: 209.85.208.180, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f3e071eb64so45154341fa.1
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 05:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1725195131; x=1725799931; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5lQAYbi4sMg8yem0keOFzoSkCiJeuli4jnDSluUwAJQ=;
        b=GczZ6khOGfHZX6rDekQQjrl2kHzYG07Blxl7TlH8PxipMJcOhHqOPtP8TgAcPkQO8L
         tBUtOwZbOy4wk0ut1HfznwGub4PEhMk8GopGWFFE60ea4LylOVuwNJGKLBtOSBPeARGh
         LV+pkjV41IjJ7+J8xmf9PpmXva9ltgGj07xjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725195131; x=1725799931;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5lQAYbi4sMg8yem0keOFzoSkCiJeuli4jnDSluUwAJQ=;
        b=NdiRgKiImcVWUfKTlAELPWyyZUNcF1l7hnvoMCgXP3Ta2/LFrtiUHlh9ONY7ElDMp5
         xjP6WxisOEV5kxVBAhxX4gsVLuUe0Nw+XmardHNyIxiAhiIOhmsXmxn9QTeftn4xrII9
         H3Uw4pk9NsGJ9F6wS/AkQ2lI5Wz/LWRnwOa5JYSPFNyIg/D20IG39P1vEvcAc4qgnIl4
         bgK37TvpLdvh5W7k1EtZW9/T6fM9ufqVKp6mTtFwLeuFtjJzSREuQOcly2ErB6vZTNOG
         Lq5ECMqBiOWnDvgrL69HF+fz5huUJDDr796DmhvEf2+0GOP+mTjQ/x6EPYgCXEEqD/Ig
         coyw==
X-Gm-Message-State: AOJu0Yy9uQnlrLEgCNXsvDLHBbYr2Mi9uGyaCIPoTskcG8LC+KCG4d70
	sO1Ax783+PiRFgnxZdY8CSwPdWoTCZD+r5vFxeLUvNmU4PW0nen/5vGIGzRdU7e4weJLOALH2ID
	PToZ4bwmvLY9LIa9duKW6XiRIasRjMHm89BKnYESqZszqBp/048V8Gw==
X-Google-Smtp-Source: AGHT+IEgAC6DPO197m/SCMNBOnrO0nwMYlFGrUpC+LE30nwqS3qAnfcZjfpKX90MlRpf87te+C7/sdggWc3tU/XrsXM=
X-Received: by 2002:a2e:4e09:0:b0:2ef:2555:e52d with SMTP id
 38308e7fff4ca-2f6108ae923mr77157081fa.45.1725195130915; Sun, 01 Sep 2024
 05:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240830104218.1610412-1-vanusuri@mvista.com>
In-Reply-To: <20240830104218.1610412-1-vanusuri@mvista.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Sun, 1 Sep 2024 18:21:59 +0530
Message-ID: <CANQUz1-Spp0rJ2oYkt4VjF-O+v_SK_=fxVd85E4y0gsQs5kKuQ@mail.gmail.com>
Subject: Re: [OE-core][master][PATCH] apr: upgrade 1.7.4 -> 1.7.5
To: openembedded-core@lists.openembedded.org, 
	Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="000000000000f26ac606210e4a6c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 12:52:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204047

--000000000000f26ac606210e4a6c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

Could you please merge this patch also to scathgap branch along with below
commit

https://git.openembedded.org/openembedded-core/commit/?id=3Dc041932f14cf552=
b0446732ce0cca6537f3286ab

Thanks & Regards,
Vijay

On Fri, Aug 30, 2024 at 4:12=E2=80=AFPM <vanusuri@mvista.com> wrote:

> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Refreshed patch
> 0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch
>
> Includes security fix
> CVE-2023-49582
>
> changelog:
> https://downloads.apache.org/apr/CHANGES-APR-1.7
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  ...1-configure-Remove-runtime-test-for-mmap-that-can-map-.patch | 2 +-
>  meta/recipes-support/apr/{apr_1.7.4.bb =3D> apr_1.7.5.bb}         | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/apr/{apr_1.7.4.bb =3D> apr_1.7.5.bb} (98%)
>
> diff --git
> a/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mma=
p-that-can-map-.patch
> b/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mma=
p-that-can-map-.patch
> index a78b16284f..3480deaa4d 100644
> ---
> a/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mma=
p-that-can-map-.patch
> +++
> b/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mma=
p-that-can-map-.patch
> @@ -34,7 +34,7 @@ index 3663220..dce9789 100644
>  -#ifdef HAVE_SYS_MMAN_H
>  -#include <sys/mman.h>
>  -#endif
> --    int main()
> +-    int main(int argc, const char *argv[])
>  -    {
>  -        int fd;
>  -        void *m;
> diff --git a/meta/recipes-support/apr/apr_1.7.4.bb
> b/meta/recipes-support/apr/apr_1.7.5.bb
> similarity index 98%
> rename from meta/recipes-support/apr/apr_1.7.4.bb
> rename to meta/recipes-support/apr/apr_1.7.5.bb
> index 4df741c766..78796476e2 100644
> --- a/meta/recipes-support/apr/apr_1.7.4.bb
> +++ b/meta/recipes-support/apr/apr_1.7.5.bb
> @@ -25,7 +25,7 @@ SRC_URI =3D "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 =
\
>             file://0001-dso-Check-for-NULL-handle-in-apr_dso_sym.patch \
>             "
>
> -SRC_URI[sha256sum] =3D
> "fc648de983f3a2a6c9e78dea1f180639bd2fad6c06d556d4367a701fe5c35577"
> +SRC_URI[sha256sum] =3D
> "cd0f5d52b9ab1704c72160c5ee3ed5d3d4ca2df4a7f8ab564e3cb352b67232f2"
>
>  inherit autotools-brokensep lib_package binconfig multilib_header ptest
> multilib_script
>
> --
> 2.25.1
>
>

--000000000000f26ac606210e4a6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi Steve,<br><br></div>Could you please merge th=
is patch also to scathgap branch along with below commit<br><br><a href=3D"=
https://git.openembedded.org/openembedded-core/commit/?id=3Dc041932f14cf552=
b0446732ce0cca6537f3286ab">https://git.openembedded.org/openembedded-core/c=
ommit/?id=3Dc041932f14cf552b0446732ce0cca6537f3286ab</a><br><br></div><div>=
Thanks &amp; Regards,</div><div>Vijay<br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 30, 2024 at 4:12=
=E2=80=AFPM &lt;<a href=3D"mailto:vanusuri@mvista.com">vanusuri@mvista.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">F=
rom: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=3D"_bl=
ank">vanusuri@mvista.com</a>&gt;<br>
<br>
Refreshed patch 0001-configure-Remove-runtime-test-for-mmap-that-can-map-.p=
atch<br>
<br>
Includes security fix<br>
CVE-2023-49582<br>
<br>
changelog:<br>
<a href=3D"https://downloads.apache.org/apr/CHANGES-APR-1.7" rel=3D"norefer=
rer" target=3D"_blank">https://downloads.apache.org/apr/CHANGES-APR-1.7</a>=
<br>
<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0...1-configure-Remove-runtime-test-for-mmap-that-can-map-.patch | 2 +=
-<br>
=C2=A0meta/recipes-support/apr/{<a href=3D"http://apr_1.7.4.bb" rel=3D"nore=
ferrer" target=3D"_blank">apr_1.7.4.bb</a> =3D&gt; <a href=3D"http://apr_1.=
7.5.bb" rel=3D"noreferrer" target=3D"_blank">apr_1.7.5.bb</a>}=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-support/apr/{<a href=3D"http://apr_1.7.4.bb" rel=
=3D"noreferrer" target=3D"_blank">apr_1.7.4.bb</a> =3D&gt; <a href=3D"http:=
//apr_1.7.5.bb" rel=3D"noreferrer" target=3D"_blank">apr_1.7.5.bb</a>} (98%=
)<br>
<br>
diff --git a/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-tes=
t-for-mmap-that-can-map-.patch b/meta/recipes-support/apr/apr/0001-configur=
e-Remove-runtime-test-for-mmap-that-can-map-.patch<br>
index a78b16284f..3480deaa4d 100644<br>
--- a/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-m=
map-that-can-map-.patch<br>
+++ b/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-m=
map-that-can-map-.patch<br>
@@ -34,7 +34,7 @@ index 3663220..dce9789 100644<br>
=C2=A0-#ifdef HAVE_SYS_MMAN_H<br>
=C2=A0-#include &lt;sys/mman.h&gt;<br>
=C2=A0-#endif<br>
--=C2=A0 =C2=A0 int main()<br>
+-=C2=A0 =C2=A0 int main(int argc, const char *argv[])<br>
=C2=A0-=C2=A0 =C2=A0 {<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int fd;<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 void *m;<br>
diff --git a/meta/recipes-support/apr/<a href=3D"http://apr_1.7.4.bb" rel=
=3D"noreferrer" target=3D"_blank">apr_1.7.4.bb</a> b/meta/recipes-support/a=
pr/<a href=3D"http://apr_1.7.5.bb" rel=3D"noreferrer" target=3D"_blank">apr=
_1.7.5.bb</a><br>
similarity index 98%<br>
rename from meta/recipes-support/apr/<a href=3D"http://apr_1.7.4.bb" rel=3D=
"noreferrer" target=3D"_blank">apr_1.7.4.bb</a><br>
rename to meta/recipes-support/apr/<a href=3D"http://apr_1.7.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">apr_1.7.5.bb</a><br>
index 4df741c766..78796476e2 100644<br>
--- a/meta/recipes-support/apr/<a href=3D"http://apr_1.7.4.bb" rel=3D"noref=
errer" target=3D"_blank">apr_1.7.4.bb</a><br>
+++ b/meta/recipes-support/apr/<a href=3D"http://apr_1.7.5.bb" rel=3D"noref=
errer" target=3D"_blank">apr_1.7.5.bb</a><br>
@@ -25,7 +25,7 @@ SRC_URI =3D &quot;${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.b=
z2 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-dso-Check-for-NULL-ha=
ndle-in-apr_dso_sym.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;fc648de983f3a2a6c9e78dea1f180639bd2fad6c06d55=
6d4367a701fe5c35577&quot;<br>
+SRC_URI[sha256sum] =3D &quot;cd0f5d52b9ab1704c72160c5ee3ed5d3d4ca2df4a7f8a=
b564e3cb352b67232f2&quot;<br>
<br>
=C2=A0inherit autotools-brokensep lib_package binconfig multilib_header pte=
st multilib_script<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--000000000000f26ac606210e4a6c--

