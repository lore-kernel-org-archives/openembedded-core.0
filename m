Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.3495.1625560265167559718
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jul 2021 01:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QNEf7vbB;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id o5so32901936ejy.7
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jul 2021 01:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZzmfoFfe9sWmLKMHbd1rkN/mPTRI9pNDVX+15Qf1GX8=;
        b=QNEf7vbBzqHbPuZWfD0IK4zMh3/IsTOJ+M1IOhd/UbADz3UV2c69fs16M8aIUjiFBv
         Ds6dgPsUrg02EgvpsRrb7g8stC5k9uo47IJgogX4AUDRIEiGo0FCToMOwUnrAT1lb3ZG
         i5FRHVd7Jnk20Xt5IiOhyPcwNvFsJwlDy9BiJ4jCmBfq/fXY8HNGkSAjf0O3SkQwsrw7
         IHgAtXxmF6hVY39mjJXCl+yDk2oEXePE5J2ipt07YE6kAk/tS18+KVGKASghShcFQ7qU
         cqNCnXBZCv3eT7EqMY46AiQkLRLT7PDK9xCCJbVYv8euX/WWUct+7LIOSvvtPjJghdFv
         6IDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZzmfoFfe9sWmLKMHbd1rkN/mPTRI9pNDVX+15Qf1GX8=;
        b=IPy+WR3SWNnpGLKgMGXLcxhJwymb4KT5GjpOKCnNaVHl135QDE8XHzO7RcOqofu1tB
         IuccC5HuKAczjUmb17kXV4x7xAkkIKmjHW8bi4hHmwnu5HtFt6fi2gFDCB284KVn/ySJ
         sRj6SvDIbWdKy6xnAA6vTAxCongc4sC4cfguyLhNciF2SY6FhALqrG4wkHYm0O7u9Gnt
         SsAuigdtgKMJ1DXXPkFVa2nag722KS/wNvb0oW/7lCydu0PIEPqMwZKDPqxvsOgn38Vl
         A3fTCnhY1A5az4pBXf9mpRxW4Fysgdq4B6WXFQsCCDqz8rOwgVgA5mMP9SrApV1slxvP
         x6UA==
X-Gm-Message-State: AOAM530+e7aU809TNNzChXlzms+KheE8Vr9Tah84iaP2IVjd2oK89ghy
	gmI4ZOSKPeyS6Sctj6xx3CjeMceh80MbxL9L9j0=
X-Google-Smtp-Source: ABdhPJyv4Uctm4U/sUeFYuVFuO+EqA2ARaP58COOJrPLfc+dVDXglCh7+B6FnM2w7S86j99/A6IBIypKwHCmv/cxsmE=
X-Received: by 2002:a17:907:72cf:: with SMTP id du15mr17710629ejc.54.1625560263689;
 Tue, 06 Jul 2021 01:31:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1625511812.git.steve@sakoman.com> <e8d6eda3435226a11f8f31ac1767892c42593a73.1625511812.git.steve@sakoman.com>
In-Reply-To: <e8d6eda3435226a11f8f31ac1767892c42593a73.1625511812.git.steve@sakoman.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 6 Jul 2021 10:30:52 +0200
Message-ID: <CA+chaQeDf-ejU-XxZggWWTQnm-oFAC34mnZBgGZh_DOkwvNQ5A@mail.gmail.com>
Subject: Re: [OE-core][dunfell 13/19] pypi: set SRC_URI with _prepend, not with +=
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000140a8d05c6703ecf"

--000000000000140a8d05c6703ecf
Content-Type: text/plain; charset="UTF-8"

Is this one worth backporting? It breaks some recipes in other layers (e.g.
podman-compose in meta-virtualization
http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=92f976404b7f82c97996ffce94ca2d20be2dcbda)
and it's only fixing issue with devtool which imho isn't so important in
dunfell compared to master.

Regards,

On Tue, Jul 6, 2021 at 12:36 AM Steve Sakoman <steve@sakoman.com> wrote:

> From: Alexander Kanavin <alex.kanavin@gmail.com>
>
> This did not cause problems in builds, but broke some devtool
> workflows such as version upgrades or checking the latest version
> from upstream. Tarballs should come first, not the patches.
>
> (From OE-Core rev: 5cee50c25197102658e0689f635b2d567a375471)
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> (cherry picked from commit 8f17b8bce85efb0e9a7e15d0b98a5cf7b6bd9750)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/classes/pypi.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
> index 87b4c85fc0..384a209874 100644
> --- a/meta/classes/pypi.bbclass
> +++ b/meta/classes/pypi.bbclass
> @@ -19,7 +19,7 @@ PYPI_SRC_URI ?= "${@pypi_src_uri(d)}"
>
>  HOMEPAGE ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
>  SECTION = "devel/python"
> -SRC_URI += "${PYPI_SRC_URI}"
> +SRC_URI_prepend = "${PYPI_SRC_URI} "
>  S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
>
>  UPSTREAM_CHECK_URI ?= "https://pypi.org/project/${PYPI_PACKAGE}/"
> --
> 2.25.1
>
>
> 
>
>

--000000000000140a8d05c6703ecf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is this one worth backporting? It breaks some recipes in o=
ther layers (e.g. podman-compose in meta-virtualization=C2=A0<a href=3D"htt=
p://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=3D92f=
976404b7f82c97996ffce94ca2d20be2dcbda">http://git.yoctoproject.org/cgit/cgi=
t.cgi/meta-virtualization/commit/?id=3D92f976404b7f82c97996ffce94ca2d20be2d=
cbda</a>) and it&#39;s only fixing issue with devtool which imho isn&#39;t =
so important in dunfell compared to master.<div><br></div><div>Regards,</di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Tue, Jul 6, 2021 at 12:36 AM Steve Sakoman &lt;<a href=3D"mailto:steve=
@sakoman.com">steve@sakoman.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">From: Alexander Kanavin &lt;<a href=3D"ma=
ilto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&g=
t;<br>
<br>
This did not cause problems in builds, but broke some devtool<br>
workflows such as version upgrades or checking the latest version<br>
from upstream. Tarballs should come first, not the patches.<br>
<br>
(From OE-Core rev: 5cee50c25197102658e0689f635b2d567a375471)<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
Signed-off-by: Alexandre Belloni &lt;<a href=3D"mailto:alexandre.belloni@b=
ootlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>&gt;<br>
(cherry picked from commit 8f17b8bce85efb0e9a7e15d0b98a5cf7b6bd9750)<br>
Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" targ=
et=3D"_blank">steve@sakoman.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/pypi.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass<br>
index 87b4c85fc0..384a209874 100644<br>
--- a/meta/classes/pypi.bbclass<br>
+++ b/meta/classes/pypi.bbclass<br>
@@ -19,7 +19,7 @@ PYPI_SRC_URI ?=3D &quot;${@pypi_src_uri(d)}&quot;<br>
<br>
=C2=A0HOMEPAGE ?=3D &quot;<a href=3D"https://pypi.python.org/pypi/$%7BPYPI=
_PACKAGE%7D/" rel=3D"noreferrer" target=3D"_blank">https://pypi.python.org/=
pypi/${PYPI_PACKAGE}/</a>&quot;<br>
=C2=A0SECTION =3D &quot;devel/python&quot;<br>
-SRC_URI +=3D &quot;${PYPI_SRC_URI}&quot;<br>
+SRC_URI_prepend =3D &quot;${PYPI_SRC_URI} &quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/${PYPI_PACKAGE}-${PV}&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI ?=3D &quot;<a href=3D"https://pypi.org/project/$%=
7BPYPI_PACKAGE%7D/" rel=3D"noreferrer" target=3D"_blank">https://pypi.org/p=
roject/${PYPI_PACKAGE}/</a>&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000140a8d05c6703ecf--
