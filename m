Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web12.7638.1621937367787996062
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 03:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gwdLgsaI;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id f11so15761969vst.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 03:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v7IuHhaaOSDwyPlW/K/CygVN2mPnYv28GIYXpyQwGcM=;
        b=gwdLgsaI9/5M++dLFCAHjCLjEsKguphTtknMrm/kVUbaTSI8kvqyCVNRO+7+zRkloM
         CVnAIu4at0qJm8cWRX04iPLFEcq3prAA07309Fh6tWabXOW1IL/edjwcCZ6maPtbnBNp
         MJyTVP3Tt5JWXM30s3Oho4UixtW3d3hNcsW22BqwSuVFTcbdAtIcBi+Or/A9+vjVHPK+
         +3DGo2DTC+bNdoixlW4cJHY7FH3cXJyRheCfilnXj8w5HE0KAuYaI72Ws3CJdRlrmfLO
         I6kMbs6ydDDnBkCu5Mv01GCKiIaew/cG5TMjtq1ReqXsskTAP4NAL8kEEimFMyN3SWF4
         5FsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v7IuHhaaOSDwyPlW/K/CygVN2mPnYv28GIYXpyQwGcM=;
        b=gfZyxPqrHKkpMEWcfJF7qN5T8AvnPc4BqhWfTuCZMxuNzWmQM9YaY9lA8D83iEuDBe
         ZC8MXE5IWHXzbTLAjKswdumQFQCrEgW6u0D90G9aYUK4key7gRvbjIPtrecyYu96stdM
         fCCR4Z6GUuCR4FUbJ9PufZr7/SyLBake1NfQ777fSjb8XczuWhDlEz8pnfCuN9LPjPDn
         UHXb9Rc3Pqy0RV8W7sFwwHX6fVV7TZ5NPggHFMDBkiV9a/kcL/uSb6VGiOUemFfhBamy
         S+zlo8PJ2WoEKvzp8KyKNAJlcIzdVF3diL9GQYCNWgOM3oSfJbK09EHY5BpRGB5c5mmc
         DAGA==
X-Gm-Message-State: AOAM531fO9jvHdApsSG7cYVY7ujbSi1s3p+fPqVKndjNGqKHZbkNs3z5
	4kmSv58ZVv/yYpdMyr3AqaHuajtnD4+nyxLoX/E=
X-Google-Smtp-Source: ABdhPJzuCgPP5TZyLmQkNbMVHCEEQirWG97EEk1wqsovwYTI1nsmSVBnCozGvsiFnuiUTVXT1FlPQ/H520K72VM9Bwg=
X-Received: by 2002:a67:fa01:: with SMTP id i1mr5428138vsq.20.1621937367013;
 Tue, 25 May 2021 03:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210525093522.3860494-1-samuli.piippo@qt.io>
In-Reply-To: <20210525093522.3860494-1-samuli.piippo@qt.io>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 25 May 2021 12:09:15 +0200
Message-ID: <CANNYZj-KrA_91evc7Rt99f+ferDJWWqO8SCPzgSwv7gASe2J7A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libarchive: enable zstd support
To: Samuli Piippo <samuli.piippo@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009bda9905c324b899"

--0000000000009bda9905c324b899
Content-Type: text/plain; charset="UTF-8"

Same here: why do this?

Alex

On Tue, 25 May 2021 at 11:35, Samuli Piippo <samuli.piippo@gmail.com> wrote:

> Now that zstd is in oe-core, add PACKAGECONFIG for it and enabled
> it by default in libarchive.
>
> zstd support is expected by CMake, which in nativesdk depends on
> libarchive (https://gitlab.kitware.com/cmake/cmake/-/issues/21552)
> ---
>  meta/recipes-extended/libarchive/libarchive_3.5.1.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/libarchive/libarchive_3.5.1.bb
> b/meta/recipes-extended/libarchive/libarchive_3.5.1.bb
> index c9e30f468f..ebecee1f3e 100644
> --- a/meta/recipes-extended/libarchive/libarchive_3.5.1.bb
> +++ b/meta/recipes-extended/libarchive/libarchive_3.5.1.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=d499814247adaee08d88080841cb5665"
>
>  DEPENDS = "e2fsprogs-native"
>
> -PACKAGECONFIG ?= "zlib bz2 xz lzo"
> +PACKAGECONFIG ?= "zlib bz2 xz lzo zstd"
>
>  PACKAGECONFIG_append_class-target = "\
>         ${@bb.utils.filter('DISTRO_FEATURES', 'acl xattr', d)} \
> @@ -28,6 +28,7 @@ PACKAGECONFIG[lzo] = "--with-lzo2,--without-lzo2,lzo,"
>  PACKAGECONFIG[nettle] = "--with-nettle,--without-nettle,nettle,"
>  PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4,"
>  PACKAGECONFIG[mbedtls] = "--with-mbedtls,--without-mbedtls,mbedtls,"
> +PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd,"
>
>  EXTRA_OECONF += "--enable-largefile"
>
> --
> 2.25.1
>
>
> 
>
>

--0000000000009bda9905c324b899
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Same here: why do this?</div><div><br></div><div>Alex=
<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Tue, 25 May 2021 at 11:35, Samuli Piippo &lt;<a href=3D"mailto=
:samuli.piippo@gmail.com">samuli.piippo@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Now that zstd is in oe-cor=
e, add PACKAGECONFIG for it and enabled<br>
it by default in libarchive.<br>
<br>
zstd support is expected by CMake, which in nativesdk depends on<br>
libarchive (<a href=3D"https://gitlab.kitware.com/cmake/cmake/-/issues/215=
52" rel=3D"noreferrer" target=3D"_blank">https://gitlab.kitware.com/cmake/c=
make/-/issues/21552</a>)<br>
---<br>
=C2=A0meta/recipes-extended/libarchive/<a href=3D"http://libarchive_3.5.1.=
bb" rel=3D"noreferrer" target=3D"_blank">libarchive_3.5.1.bb</a> | 3 ++-<br=
>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-extended/libarchive/<a href=3D"http://libarchive=
_3.5.1.bb" rel=3D"noreferrer" target=3D"_blank">libarchive_3.5.1.bb</a> b/m=
eta/recipes-extended/libarchive/<a href=3D"http://libarchive_3.5.1.bb" rel=
=3D"noreferrer" target=3D"_blank">libarchive_3.5.1.bb</a><br>
index c9e30f468f..ebecee1f3e 100644<br>
--- a/meta/recipes-extended/libarchive/<a href=3D"http://libarchive_3.5.1.=
bb" rel=3D"noreferrer" target=3D"_blank">libarchive_3.5.1.bb</a><br>
+++ b/meta/recipes-extended/libarchive/<a href=3D"http://libarchive_3.5.1.=
bb" rel=3D"noreferrer" target=3D"_blank">libarchive_3.5.1.bb</a><br>
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd499814247=
adaee08d88080841cb5665&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;e2fsprogs-native&quot;<br>
<br>
-PACKAGECONFIG ?=3D &quot;zlib bz2 xz lzo&quot;<br>
+PACKAGECONFIG ?=3D &quot;zlib bz2 xz lzo zstd&quot;<br>
<br>
=C2=A0PACKAGECONFIG_append_class-target =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, =
&#39;acl xattr&#39;, d)} \<br>
@@ -28,6 +28,7 @@ PACKAGECONFIG[lzo] =3D &quot;--with-lzo2,--without-lzo2,=
lzo,&quot;<br>
=C2=A0PACKAGECONFIG[nettle] =3D &quot;--with-nettle,--without-nettle,nettl=
e,&quot;<br>
=C2=A0PACKAGECONFIG[lz4] =3D &quot;--with-lz4,--without-lz4,lz4,&quot;<br>
=C2=A0PACKAGECONFIG[mbedtls] =3D &quot;--with-mbedtls,--without-mbedtls,mb=
edtls,&quot;<br>
+PACKAGECONFIG[zstd] =3D &quot;--with-zstd,--without-zstd,zstd,&quot;<br>
<br>
=C2=A0EXTRA_OECONF +=3D &quot;--enable-largefile&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000009bda9905c324b899--
