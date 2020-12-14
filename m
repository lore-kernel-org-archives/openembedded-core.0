Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web08.2194.1607975571563838302
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 11:52:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Uvc1JLe6;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id h6so9644091vsr.6
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 11:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mic8HSYw3oy2+AfGEkkceLGbmbUnfZTWjk9n0D3FVI4=;
        b=Uvc1JLe6essy+sKfKnN7bX6omMV2LzstwiNDcf05szUT5C72mnTLjo5ue7udZJH+3K
         d8x8Zaxm+v8NHFfAqUXkjWuXghBUUdRcLu1blXUOtziGrzlhMC/s4QtXK6P0G1A3UevY
         slBegUzeyA62Y9uJvSnZ5KSt5V5nidyNVVspg7jspozMJO4L+hvlNvZIm5BjRVsud6/+
         5UOgfWPFo+3+vvNNWJ07jwFJWFOMxxoJ+Y8uUmBB2oJp5VKeXyEP0qrSeQrS1FpUiQod
         SzfooNFjjoPVPp2jbM8gBIBPb8RGG0Q3n08Nhcy8TuKrLuHjJd7fLioLLttY5qSY7kbv
         TKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mic8HSYw3oy2+AfGEkkceLGbmbUnfZTWjk9n0D3FVI4=;
        b=By90ZV2UHq8OyDmgWacBFxeYZPVbFr3ztPWOc3KfZ2xMcN/HKVrj8zhmJRx78rYCfA
         ewE2e6Q7LQz4aR+5cSdr9Bf5of+070Hyi3RVuxN6afU/ZKBrfoqOK+vdBTPqT1ZU6a5k
         fIEjqTCaCp7Pukw2J4j6ydUUA+A5jtWAjHIAfR//2QeMvZgBkASshqnWnG7VEJItt0rw
         ErxW0D+5cih/Ci489nVQe+/lK5Vq/DdFh99zek+WdWLpnq3onIHr174ZGsdDCtFd08kl
         UdKStqT0yyYCinhvr6ZxGakw4Sg2J0mpOhc4FK+Y5ZKEQjc3eCTToyPEkZy38J7pQqqF
         wxVw==
X-Gm-Message-State: AOAM531aWs/KH4aFIpDnHhJpeA6glslkEV/gbN3sk8Y6PFxk+xmaFuG3
	LY67+r9KCWddq/a6tDD63pFzpjobIRLeTdSF9xI=
X-Google-Smtp-Source: ABdhPJynnvFp27BSS1zQT2/SZFR9qXhMrQdirWqCHC1/5ikHRBKHqxxPtQKeytZJfeN7kxA3x4ebNoBO4SWAHnUCBcE=
X-Received: by 2002:a67:c89e:: with SMTP id v30mr24856289vsk.54.1607975570761;
 Mon, 14 Dec 2020 11:52:50 -0800 (PST)
MIME-Version: 1.0
References: <20201207224400.1008323-1-alejandro.delcastillo@ni.com>
In-Reply-To: <20201207224400.1008323-1-alejandro.delcastillo@ni.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 14 Dec 2020 20:52:39 +0100
Message-ID: <CANNYZj9Yq6X3Px4AHJ_T40MoKoX0aMpETW6BnSTcz8oAyQOo=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] opkg: upgrade to version 0.4.4
To: Alejandro del Castillo <alejandro.delcastillo@ni.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b3ea6305b671fc73"

--000000000000b3ea6305b671fc73
Content-Type: text/plain; charset="UTF-8"

opkg ptests regress with this change:
https://autobuilder.yocto.io/pub/non-release/20201214-1/testresults/qemux86-64-ptest/opkg.log

Do not merge please, as this undoes my work to reach 100% pass rate in
ptests :)

Alex

On Mon, 7 Dec 2020 at 23:44, Alejandro del Castillo <
alejandro.delcastillo@ni.com> wrote:

> Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> ---
>  meta/recipes-devtools/opkg/{opkg_0.4.3.bb => opkg_0.4.4.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/opkg/{opkg_0.4.3.bb => opkg_0.4.4.bb} (95%)
>
> diff --git a/meta/recipes-devtools/opkg/opkg_0.4.3.bb
> b/meta/recipes-devtools/opkg/opkg_0.4.4.bb
> similarity index 95%
> rename from meta/recipes-devtools/opkg/opkg_0.4.3.bb
> rename to meta/recipes-devtools/opkg/opkg_0.4.4.bb
> index 46b7aa2523..0f29e1d41b 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.4.3.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.4.4.bb
> @@ -17,8 +17,8 @@ SRC_URI = "
> http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
>             file://run-ptest \
>  "
>
> -SRC_URI[md5sum] = "86ec5eee9362aca0990994a402e077e9"
> -SRC_URI[sha256sum] =
> "dda452854bc0cd1334f7ba18a66003d1c12a98600c894111b56919b1ea434718"
> +SRC_URI[md5sum] = "345900c1d4747d58455867f9fe88ca43"
> +SRC_URI[sha256sum] =
> "2217acc58b8eb31300631ebae75e222ebc700c9c1cf6408088705d19a472c839"
>
>  # This needs to be before ptest inherit, otherwise all ptest files end
> packaged
>  # in libopkg package if OPKGLIBDIR == libdir, because default
> --
> 2.28.0
>
>
> 
>
>

--000000000000b3ea6305b671fc73
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>opkg ptests regress with this change:</div><div><a hr=
ef=3D"https://autobuilder.yocto.io/pub/non-release/20201214-1/testresults/q=
emux86-64-ptest/opkg.log">https://autobuilder.yocto.io/pub/non-release/2020=
1214-1/testresults/qemux86-64-ptest/opkg.log</a></div><div><br></div><div>D=
o not merge please, as this undoes my work to reach 100% pass rate in ptest=
s :)</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 7 Dec 2020 at 23:44, Al=
ejandro del Castillo &lt;<a href=3D"mailto:alejandro.delcastillo@ni.com">al=
ejandro.delcastillo@ni.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Signed-off-by: Alejandro del Castillo &lt;<a href=
=
=3D"mailto:alejandro.delcastillo@ni.com" target=3D"_blank">alejandro.delca=
stillo@ni.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/opkg/{<a href=3D"http://opkg_0.4.3.bb" rel=3D"=
noreferrer" target=3D"_blank">opkg_0.4.3.bb</a> =3D&gt; <a href=3D"http://o=
pkg_0.4.4.bb" rel=3D"noreferrer" target=3D"_blank">opkg_0.4.4.bb</a>} | 4 +=
+--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/opkg/{<a href=3D"http://opkg_0.4.3.bb" =
rel=3D"noreferrer" target=3D"_blank">opkg_0.4.3.bb</a> =3D&gt; <a href=3D"h=
ttp://opkg_0.4.4.bb" rel=3D"noreferrer" target=3D"_blank">opkg_0.4.4.bb</a>=
} (95%)<br>
<br>
diff --git a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.4.3.bb" r=
el=3D"noreferrer" target=3D"_blank">opkg_0.4.3.bb</a> b/meta/recipes-devtoo=
ls/opkg/<a href=3D"http://opkg_0.4.4.bb" rel=3D"noreferrer" target=3D"_blan=
k">opkg_0.4.4.bb</a><br>
similarity index 95%<br>
rename from meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.4.3.bb" re=
l=3D"noreferrer" target=3D"_blank">opkg_0.4.3.bb</a><br>
rename to meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">opkg_0.4.4.bb</a><br>
index 46b7aa2523..0f29e1d41b 100644<br>
--- a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.4.3.bb" rel=3D"n=
oreferrer" target=3D"_blank">opkg_0.4.3.bb</a><br>
+++ b/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.4.4.bb" rel=3D"n=
oreferrer" target=3D"_blank">opkg_0.4.4.bb</a><br>
@@ -17,8 +17,8 @@ SRC_URI =3D &quot;<a href=3D"http://downloads.yoctoproje=
ct.org/releases/$%7BBPN%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer" =
target=3D"_blank">http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-=
${PV}.tar.gz</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;86ec5eee9362aca0990994a402e077e9&quot;<br>
-SRC_URI[sha256sum] =3D &quot;dda452854bc0cd1334f7ba18a66003d1c12a98600c89=
4111b56919b1ea434718&quot;<br>
+SRC_URI[md5sum] =3D &quot;345900c1d4747d58455867f9fe88ca43&quot;<br>
+SRC_URI[sha256sum] =3D &quot;2217acc58b8eb31300631ebae75e222ebc700c9c1cf6=
408088705d19a472c839&quot;<br>
<br>
=C2=A0# This needs to be before ptest inherit, otherwise all ptest files e=
nd packaged<br>
=C2=A0# in libopkg package if OPKGLIBDIR =3D=3D libdir, because default<br=
>
-- <br>
2.28.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000b3ea6305b671fc73--
