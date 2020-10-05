Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com [209.85.222.68])
 by mx.groups.io with SMTP id smtpd.web10.31275.1601890673852865277
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2020 02:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=e1y/4MYG;
 spf=pass (domain: gmail.com, ip: 209.85.222.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f68.google.com with SMTP id z19so2299984uap.2
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2020 02:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rHLdSI141RC30LqKU5mH6krhS8FtFFTqCRJIP+vxPA8=;
        b=e1y/4MYG6dmYjifZ046+RZWdB9GnfPSG5gnyb1kucfsaNbdlX2e7hoCi/IL3vAVVKA
         zygXBi37wFjgqEYOcmt9DqxRZxeWTnuYaxvmRLLpZ6J3BwyC2OJQBAN474nIUyRVwU4J
         oZ3xDsGLZJ5Ua1mEhyYM4RHvlha9OkBBKbVQVuMbe6M7lkpOCLseq7fqI2vgfoYGoUgv
         ru09a+hErZ/29gHlzJpOWJCsRzremYe/+luz4g4A6uWPQLwS5c9FNcbjwckbVGEOpfkz
         aecuoZNn3cQ8kgU+tMu1GOH1ERaUGQbkTK2tBr5XEKQPip3AkqdbX9nBMIEozn/E0LvF
         JQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rHLdSI141RC30LqKU5mH6krhS8FtFFTqCRJIP+vxPA8=;
        b=Y14c5CVRSoTim+Tv9mLeOG4ikdJrC8MZ0iRNtMyuj4G69bR4lIOIY/IySMXC4ZfpBz
         cV1sKjmR478Tcr+eYgURJVTPU1pjnwvJLqc+sUX1+e4MGr3+a/8BOzlFxh3GHkE2QCJn
         qS75IaWexaGykVFBUoPtkpMZh5S1X8g+KqDYVa+qGt6fbHnZrp8nG7qgZ87ik9iMhy0z
         4xrUDBtPX3bvBMjdi/Z0H4XUT/jRKZF08hZNGZUjFTyPJ4PFdXJI4IKZU6bXmz210MJD
         TKY9IFjq2qQeJtz1M40W/6EWcMS/08jRSgmoluJOFtAmcifmv1cBt46HqjbazbIEbHLF
         lJGA==
X-Gm-Message-State: AOAM5327FtukXXDa9TwB2gCrIt2FGbiajGi9glIJ5B6JX/a5iu/A2aZW
	FuXwV2GvmGs70rHTUSdhy5SVoBPtI7EE9+cJAAM=
X-Google-Smtp-Source: ABdhPJwhxbbRXGOfnH0KjqMQXeMwuWyJ1/pJj3bA62B9H8ziyVOIw3VMWmxcMnknochvJaoekLKpMOROidJPcr8Jahs=
X-Received: by 2002:ab0:59a2:: with SMTP id g31mr498852uad.89.1601890673068;
 Mon, 05 Oct 2020 02:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201005083506.30022-1-siew.hoon.lim@intel.com>
In-Reply-To: <20201005083506.30022-1-siew.hoon.lim@intel.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 5 Oct 2020 11:37:40 +0200
Message-ID: <CANNYZj9LXy1eWkfXyg9K4Rs=np4ZeA3cPPz6AefdcZ2ijBLbxg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Alliance for Open Media: new library
To: Lim Siew Hoon <siew.hoon.lim@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000898ebf05b0e93cdc"

--000000000000898ebf05b0e93cdc
Content-Type: text/plain; charset="UTF-8"

This should go to openembedded-devel list.

Alex

On Mon, 5 Oct 2020 at 10:39, Lim Siew Hoon <siew.hoon.lim@intel.com> wrote:

> Signed-off-by: Yong, Jonathan <jonathan.yong@intel.com>
> Signed-off-by: Lim Siew Hoon <siew.hoon.lim@intel.com>
> ---
>  meta-oe/recipes-multimedia/aom/aom_2.0.0.bb | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-oe/recipes-multimedia/aom/aom_2.0.0.bb
>
> diff --git a/meta-oe/recipes-multimedia/aom/aom_2.0.0.bb
> b/meta-oe/recipes-multimedia/aom/aom_2.0.0.bb
> new file mode 100644
> index 000000000..4b388d57f
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/aom/aom_2.0.0.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "Alliance for Open Media - AV1 Codec Library"
> +DESCRIPTION = "Alliance for Open Media AV1 codec library"
> +
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=6ea91368c1bbdf877159435572b931f5"
> +
> +SRC_URI = "git://aomedia.googlesource.com/aom;protocol=https"
> +
> +SRCREV = "d1d1226af626a61f7ca664b270dd473b92228984"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS_append = " yasm-native"
> +
> +inherit pkgconfig cmake perlnative python3native
> +EXTRA_OECMAKE_append = " -DBUILD_SHARED_LIBS=1"
> --
> 2.17.1
>
>
> 
>
>

--000000000000898ebf05b0e93cdc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This should go to openembedded-devel list.</div><div>=
<br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, 5 Oct 2020 at 10:39, Lim Siew Hoon &=
lt;<a href=3D"mailto:siew.hoon.lim@intel.com">siew.hoon.lim@intel.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed=
-off-by: Yong, Jonathan &lt;<a href=3D"mailto:jonathan.yong@intel.com" targ=
et=3D"_blank">jonathan.yong@intel.com</a>&gt;<br>
Signed-off-by: Lim Siew Hoon &lt;<a href=3D"mailto:siew.hoon.lim@intel.com=
" target=3D"_blank">siew.hoon.lim@intel.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-multimedia/aom/<a href=3D"http://aom_2.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">aom_2.0.0.bb</a> | 16 ++++++++++++++++<b=
r>
=C2=A01 file changed, 16 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-multimedia/aom/<a href=3D"http://=
aom_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">aom_2.0.0.bb</a><br>
<br>
diff --git a/meta-oe/recipes-multimedia/aom/<a href=3D"http://aom_2.0.0.bb=
" rel=3D"noreferrer" target=3D"_blank">aom_2.0.0.bb</a> b/meta-oe/recipes-m=
ultimedia/aom/<a href=3D"http://aom_2.0.0.bb" rel=3D"noreferrer" target=3D"=
_blank">aom_2.0.0.bb</a><br>
new file mode 100644<br>
index 000000000..4b388d57f<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-multimedia/aom/<a href=3D"http://aom_2.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">aom_2.0.0.bb</a><br>
@@ -0,0 +1,16 @@<br>
+SUMMARY =3D &quot;Alliance for Open Media - AV1 Codec Library&quot;<br>
+DESCRIPTION =3D &quot;Alliance for Open Media AV1 codec library&quot;<br>
+<br>
+LICENSE =3D &quot;BSD-2-Clause&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D6ea91368c1bbdf87715943557=
2b931f5&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://aomedia.googlesource.com/aom;pr=
otocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">aomedia.googlesource.c=
om/aom;protocol=3Dhttps</a>&quot;<br>
+<br>
+SRCREV =3D &quot;d1d1226af626a61f7ca664b270dd473b92228984&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+DEPENDS_append =3D &quot; yasm-native&quot;<br>
+<br>
+inherit pkgconfig cmake perlnative python3native<br>
+EXTRA_OECMAKE_append =3D &quot; -DBUILD_SHARED_LIBS=3D1&quot;<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000898ebf05b0e93cdc--
