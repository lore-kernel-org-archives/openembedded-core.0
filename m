Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web08.6753.1613239882157846145
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Feb 2021 10:11:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VmKjZbzx;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id n28so2101390qtv.12
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Feb 2021 10:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R/4a0gdt5Gdwyzpe7XngZu9TQF8N5EvqZT3gLP5qSCE=;
        b=VmKjZbzxodKaIyysAmFgNVLnvubX7W/g7jOa+h/fOezzlpwoSfShWzp4Pztn6JhRt5
         BSLKioKepy/bH2HOw/7sLbfruZbD3Kl6mUV3qI+HljRa3xSR28KsrPtOXEHyYbOdwGUp
         FPVBfyN8IWT55rSKQL/aLicZrppjJw34wETJtJBodOww4jXayTPaBzqK5CYvk63DKvSm
         43p6nP00kGNyRqIsx5AwCsTt1X7WrM7PSL17Fe3WCd99Z6qf+ydTloXjpq47thI+XNeQ
         KjWdmOZ6kQl7xImREZjtYd/31h2nB7W436y50jdp87PR36tiiKhm8+aCqFtUPa8JJfOG
         X3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R/4a0gdt5Gdwyzpe7XngZu9TQF8N5EvqZT3gLP5qSCE=;
        b=s9zNO5eGKT5o6Jhu8QAyZOexfZg/InxGT9bEUy9i4wQVgV45qZVohE4h9f0e7PtLG7
         22t0N5dcvhoed2VUzcuuyQXmujub7UBfHEUHpLABaTcULkv4y393P9BkrDMeyG3mha2m
         f+RERjM3qGcCMuIzb3CaOhEjfHxmnv1q7Qh1YYIKepYZLlV8DriWzzrFvKXTNjhn5Owg
         IhnqYLAQH5NhYlaX2tWonWHrI5IFNaAP497Q3ItQEn7FOP0G1c6grgxzIYFrIesyLO3b
         z8R8fuTfiN4TKb2lSJcJt3ZUrCQMzyLodjWq51jNR8BgbTH2Bdl+Jmb1QFmwVlAmvwe1
         zPLQ==
X-Gm-Message-State: AOAM5333UPKEp5MqR7HxizVT0PcYXFhOKfs2arzSFrdfViD7SLsUkO1H
	gQAGsoxtQd9Z6hgRNAHpde9zzQUJEKf0EMAC/Qg=
X-Google-Smtp-Source: ABdhPJybg/AcNN+osNaG9D4s9bxp0TcYhOa35XDJlxStqgRxmaFQjInpfknYQCihH+8EbB3gOVpnUI/Il7JgoCdeD0M=
X-Received: by 2002:a05:622a:44d:: with SMTP id o13mr7826043qtx.378.1613239881241;
 Sat, 13 Feb 2021 10:11:21 -0800 (PST)
MIME-Version: 1.0
References: <20210213100218.1928273-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20210213100218.1928273-1-richard.purdie@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 13 Feb 2021 10:11:10 -0800
Message-ID: <CAMKF1sotNxLONy45ga0iKHpo9bFAkOHX2Xk3KA=s3W7oFZcnwg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] nativesdk-buildtools-perl-dummy: Add new autoconf dependencies
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000f17ee05bb3baeee"

--0000000000000f17ee05bb3baeee
Content-Type: text/plain; charset="UTF-8"

May be we should add a comment to keep this list in sync with autoconf
recipe and vice versa

On Sat, Feb 13, 2021 at 2:02 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> When used in SDKs we need to provide the perl modules used by autoconf.
> Add new ones needed by recent changes.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
> b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
> index cce086caf2a..beca73104e0 100644
> --- a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
> +++ b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
> @@ -17,10 +17,13 @@ DUMMYPROVIDES_PACKAGES = "\
>      nativesdk-perl-module-file-path \
>      nativesdk-perl-module-file-spec \
>      nativesdk-perl-module-file-stat \
> +    nativesdk-perl-module-file-temp \
>      nativesdk-perl-module-getopt-long \
>      nativesdk-perl-module-io-file \
> +    nativesdk-perl-module-list-util \
>      nativesdk-perl-module-overloading \
>      nativesdk-perl-module-posix \
> +    nativesdk-perl-module-scalar-util
>      nativesdk-perl-module-strict \
>      nativesdk-perl-module-text-parsewords \
>      nativesdk-perl-module-thread-queue \
> --
> 2.27.0
>
>
> 
>
>

--0000000000000f17ee05bb3baeee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">May be we should add a comment to keep this list in sync =
with autoconf recipe and vice versa=C2=A0</div><div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 13, 2021 at 2:02 =
AM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">When used in SDKs we need to provide the perl modules used =
by autoconf.<br>
Add new ones needed by recent changes.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<=
br>
---<br>
=C2=A0meta/recipes-core/meta/<a href=3D"http://nativesdk-buildtools-perl-d=
ummy.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-buildtools-perl-dum=
my.bb</a> | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/recipes-core/meta/<a href=3D"http://nativesdk-buildtools=
-perl-dummy.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-buildtools-p=
erl-dummy.bb</a> b/meta/recipes-core/meta/<a href=3D"http://nativesdk-build=
tools-perl-dummy.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-buildto=
ols-perl-dummy.bb</a><br>
index cce086caf2a..beca73104e0 100644<br>
--- a/meta/recipes-core/meta/<a href=3D"http://nativesdk-buildtools-perl-d=
ummy.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-buildtools-perl-dum=
my.bb</a><br>
+++ b/meta/recipes-core/meta/<a href=3D"http://nativesdk-buildtools-perl-d=
ummy.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-buildtools-perl-dum=
my.bb</a><br>
@@ -17,10 +17,13 @@ DUMMYPROVIDES_PACKAGES =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0nativesdk-perl-module-file-path \<br>
=C2=A0 =C2=A0 =C2=A0nativesdk-perl-module-file-spec \<br>
=C2=A0 =C2=A0 =C2=A0nativesdk-perl-module-file-stat \<br>
+=C2=A0 =C2=A0 nativesdk-perl-module-file-temp \<br>
=C2=A0 =C2=A0 =C2=A0nativesdk-perl-module-getopt-long \<br>
=C2=A0 =C2=A0 =C2=A0nativesdk-perl-module-io-file \<br>
+=C2=A0 =C2=A0 nativesdk-perl-module-list-util \<br>
=C2=A0 =C2=A0 =C2=A0nativesdk-perl-module-overloading \<br>
=C2=A0 =C2=A0 =C2=A0nativesdk-perl-module-posix \<br>
+=C2=A0 =C2=A0 nativesdk-perl-module-scalar-util<br>
=C2=A0 =C2=A0 =C2=A0nativesdk-perl-module-strict \<br>
=C2=A0 =C2=A0 =C2=A0nativesdk-perl-module-text-parsewords \<br>
=C2=A0 =C2=A0 =C2=A0nativesdk-perl-module-thread-queue \<br>
-- <br>
2.27.0<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000000f17ee05bb3baeee--
