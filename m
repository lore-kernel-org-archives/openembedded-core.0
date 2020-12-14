Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.29853.1607917048829126298
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 19:37:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b9dMzLpi;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id f14so10993436qto.12
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Dec 2020 19:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yK+WRSrSLc8rBgNwUfNXiJms4EhEvgOWOhdCmGxdgt8=;
        b=b9dMzLpieQg/TZzBFaSMo58r570+sXQrNL87w4Y8J7G4lANDsnibdfabSkUesnedMG
         lCZxqBvjxyhOIRZnVcR5mUd0Pp1Drq8M+KaVe1dtCKWkgVXUrSMsV8UbTigJSAzbYUJ4
         2LN4bElonGns5ZeqSDbJIG9l5Kx3Rbu+ygQCnzjQxugz2FIuCaicFkZz7nRAfc/oiOLu
         eWAa9i/dot3zsh6yOIpUN3fZJvehVOFC6zUZH3FUO2vD09YfL/Iynu/xNFpomCOY2td+
         29N7r84PhrfiGIEAdDSLUaoETvwmQQACgkGW7ofGQdEM/blSYpUGlIs7Q5ycnt8Ysecq
         C0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yK+WRSrSLc8rBgNwUfNXiJms4EhEvgOWOhdCmGxdgt8=;
        b=OYTJ1OMW8OQKFnywe78XzuemkzuIBFsTCSWCz41bo5LwsMLP4sxpMg6kVc9xE01W/1
         qZtnXepfFoB0U+f8BgYq4+fVApDheadBYxcXD3xacqvksNihtc/GwxWjbeijPSwI9JvY
         +z1BPe/og8t9wxq/ET7GJ7UyPiN1AWP7RUNKrGzvBJhwZ0+Tg1AfO9OrGp8l4OdsVu0G
         VljhPl0sisHqSsD1HKUYKysEue1PilO/rPiAmqCToqHZsitGYTWMbGZ60t7USa5Wx/rf
         DVoV3FCjs6+oWCRw3CTUVG66KvgpGmxEYw9/aXi78HWfuKX2vnwnGx2t4MCbk2xDkWOM
         E7jw==
X-Gm-Message-State: AOAM531rPYHvyOAxI+BEJ5tZ2YpdGnul518QidWcsq+LwF2ZthpJvo1X
	aV5gai8WGVgT8Wnb5OoVnc2k+a1uQo8PhVmIs5w=
X-Google-Smtp-Source: ABdhPJwzOBsiigBJlSBdmLTYM5HyFMsJeRt5w1N9SNHpkntl2K9Gy/6653H76ChU0oUAnruX3UCFr/r7/Z9S13Hy+qI=
X-Received: by 2002:aed:2ec6:: with SMTP id k64mr29334469qtd.194.1607917047966;
 Sun, 13 Dec 2020 19:37:27 -0800 (PST)
MIME-Version: 1.0
References: <1607910781-88071-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
In-Reply-To: <1607910781-88071-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 13 Dec 2020 19:37:17 -0800
Message-ID: <CAMKF1srDtbk33zDDD0MNBKotqtauLRtHMbkCirq5-8LfYKkpxg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][gatesgarth] go: 1.15.2 -> 1.15.6
To: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000078f0f305b6645c99"

--00000000000078f0f305b6645c99
Content-Type: text/plain; charset="UTF-8"

Can you first update it on master and then do needed backport ?

On Sun, Dec 13, 2020 at 5:53 PM Jamaluddin, Khairul Rohaizzat <
khairul.rohaizzat.jamaluddin@intel.com> wrote:

> From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com
> >
>
> update minor version to 1.15.6
>
> go-1.15.3 includes fixes to cgo, the compiler, runtime, the go command,
> and the bytes, plugin, and testing packages.
> go-1.15.4 includes fixes to cgo, the compiler, linker, runtime, and the
> compress/flate, net/http, reflect, and time packages.
> go-1.15.5 includes security fixes to the go command and the math/big
> package.
> go-1.15.6 includes fixes to the compiler, linker, runtime, the go command,
> and the io package.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2020-28362
> https://nvd.nist.gov/vuln/detail/CVE-2020-28366
> https://nvd.nist.gov/vuln/detail/CVE-2020-28367
> https://golang.org/doc/devel/release.html#go1.15.minor
>
> Updates includes fix for:
> CVE-2020-28362
> CVE-2020-28366
> CVE-2020-28367
>
> Signed-off-by: Khairul Rohaizzat Jamaluddin <
> khairul.rohaizzat.jamaluddin@intel.com>
> ---
>  meta/recipes-devtools/go/go-1.15.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/go/go-1.15.inc
> b/meta/recipes-devtools/go/go-1.15.inc
> index 97d748b..c5e3fe0 100644
> --- a/meta/recipes-devtools/go/go-1.15.inc
> +++ b/meta/recipes-devtools/go/go-1.15.inc
> @@ -1,7 +1,7 @@
>  require go-common.inc
>
>  GO_BASEVERSION = "1.15"
> -GO_MINOR = ".2"
> +GO_MINOR = ".6"
>  PV .= "${GO_MINOR}"
>  FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
>
> @@ -17,4 +17,4 @@ SRC_URI += "\
>      file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
>      file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
>  "
> -SRC_URI[main.sha256sum] =
> "28bf9d0bcde251011caae230a4a05d917b172ea203f2a62f2c2f9533589d4b4d"
> +SRC_URI[main.sha256sum] =
> "890bba73c5e2b19ffb1180e385ea225059eb008eb91b694875dd86ea48675817"
> --
> 2.7.4
>
>
> 
>
>

--00000000000078f0f305b6645c99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Can you first update it on master and then do needed back=
port ?=C2=A0</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Sun, Dec 13, 2020 at 5:53 PM Jamaluddin, Khairul Rohaiz=
zat &lt;<a href=3D"mailto:khairul.rohaizzat.jamaluddin@intel.com">khairul.r=
ohaizzat.jamaluddin@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border=
-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">From=
: Khairul Rohaizzat Jamaluddin &lt;<a href=3D"mailto:khairul.rohaizzat.jama=
luddin@intel.com" target=3D"_blank">khairul.rohaizzat.jamaluddin@intel.com<=
/a>&gt;<br>
<br>
update minor version to 1.15.6<br>
<br>
go-1.15.3 includes fixes to cgo, the compiler, runtime, the go command, an=
d the bytes, plugin, and testing packages.<br>
go-1.15.4 includes fixes to cgo, the compiler, linker, runtime, and the co=
mpress/flate, net/http, reflect, and time packages.<br>
go-1.15.5 includes security fixes to the go command and the math/big packa=
ge.<br>
go-1.15.6 includes fixes to the compiler, linker, runtime, the go command,=
 and the io package.<br>
<br>
References:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2020-28362" rel=3D"norefer=
rer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2020-28362</a><=
br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2020-28366" rel=3D"norefer=
rer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2020-28366</a><=
br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2020-28367" rel=3D"norefer=
rer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2020-28367</a><=
br>
<a href=3D"https://golang.org/doc/devel/release.html#go1.15.minor" rel=3D"=
noreferrer" target=3D"_blank">https://golang.org/doc/devel/release.html#go1=
.15.minor</a><br>
<br>
Updates includes fix for:<br>
CVE-2020-28362<br>
CVE-2020-28366<br>
CVE-2020-28367<br>
<br>
Signed-off-by: Khairul Rohaizzat Jamaluddin &lt;<a href=3D"mailto:khairul.=
rohaizzat.jamaluddin@intel.com" target=3D"_blank">khairul.rohaizzat.jamalud=
din@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/go/go-1.15.inc | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/go/go-1.15.inc b/meta/recipes-devtools/=
go/go-1.15.inc<br>
index 97d748b..c5e3fe0 100644<br>
--- a/meta/recipes-devtools/go/go-1.15.inc<br>
+++ b/meta/recipes-devtools/go/go-1.15.inc<br>
@@ -1,7 +1,7 @@<br>
=C2=A0require go-common.inc<br>
<br>
=C2=A0GO_BASEVERSION =3D &quot;1.15&quot;<br>
-GO_MINOR =3D &quot;.2&quot;<br>
+GO_MINOR =3D &quot;.6&quot;<br>
=C2=A0PV .=3D &quot;${GO_MINOR}&quot;<br>
=C2=A0FILESEXTRAPATHS_prepend :=3D &quot;${FILE_DIRNAME}/go-${GO_BASEVERSI=
ON}:&quot;<br>
<br>
@@ -17,4 +17,4 @@ SRC_URI +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://0007-cmd-go-make-GOROOT-precious-by-default.pat=
ch \<br>
=C2=A0 =C2=A0 =C2=A0file://0008-use-GOBUILDMODE-to-set-buildmode.patch \<b=
r>
=C2=A0&quot;<br>
-SRC_URI[main.sha256sum] =3D &quot;28bf9d0bcde251011caae230a4a05d917b172ea=
203f2a62f2c2f9533589d4b4d&quot;<br>
+SRC_URI[main.sha256sum] =3D &quot;890bba73c5e2b19ffb1180e385ea225059eb008=
eb91b694875dd86ea48675817&quot;<br>
-- <br>
2.7.4<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--00000000000078f0f305b6645c99--
