Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.13843.1619103931965207351
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 08:05:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aC1i/Vni;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id s5so37805985qkj.5
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 08:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RFMPK//NyZsJdkkPFIBImQAcznl1TXTGUFhR93F9iN0=;
        b=aC1i/Vni+cetcoZVe7DQ9dn4onhq/wpPOzSZYyGcoIkKeHkfpHzWhjiWMk4sdTeVSd
         f0rJIWCSryo79vX/4tHCRyvXOlTYVGWnoBfOjiMJ43tj+6IcInS5fdaNPA48R2GvWuCW
         MckUlqBW8l83jOUl3ITo7+4uFjYukNKZNq6DNcjodtNdGZcLVhsawkLD8Llmxq1DZKNS
         Dwn0wn0D1Jj0xmuyDe/QHTXf2OcOC5AVJn78JipYQe1Yy3/VEkT0RqcJ0JTTK8GP6L1Z
         tOIK0iMA7BORC0M3/0QgKLt1kN4Vax/aS7hnvXmXUO6UXV7Q8VTwjJ2Z9qxd05fCSdCa
         sliw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RFMPK//NyZsJdkkPFIBImQAcznl1TXTGUFhR93F9iN0=;
        b=n0J7dMRzIZvJfCkBkidvol14JPqYVhm47k+8pgDoxvbR0UGcsNpCmUbo3UcnYGZ02N
         C0KAYEW1zoJE6wtSoge6ElTO9XXK3ZUAqT1uXfIA0wuYz3kEzkMavNIpmqIwGwyottuI
         8QZY2HA8CiL0JmowWAp/epaDx61xPWRZDN6/q0qW8NhSwBq/0Tks98iDXvYj/OmxNbjb
         gXsBu0pHsJxZz57rWm0fRZAC6b6LZw8JsFxT7yUEa00RF+ZTJQli+80JKSzXH7Ih6OqL
         PEHWpFPkbZml792QWwMTlaxFT4D6uwx7SWzuA7Q+H11OeksJKR1molIlmfPO//8vDJBL
         Ekhw==
X-Gm-Message-State: AOAM532GC5pUl9/ziswj6qhUZLlN8IG1PeMFogI9ro/s8MX0tLQPILNa
	MULkhXii2PkbrIaI9RbUdL5T7sst4PyKkhg0BXo=
X-Google-Smtp-Source: ABdhPJwVo2kD+GBfpWiDNLU5nq6KbdpbQasTHucWpdqWqn1wxp6Mrv+BfH1TwkTN3DOjrxruxXE87/Dtjw6A0zxyZQY=
X-Received: by 2002:a37:9607:: with SMTP id y7mr4153705qkd.25.1619103930984;
 Thu, 22 Apr 2021 08:05:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210422144152.29206-1-mikko.rapeli@bmw.de>
In-Reply-To: <20210422144152.29206-1-mikko.rapeli@bmw.de>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 22 Apr 2021 08:05:20 -0700
Message-ID: <CAMKF1sq8YwMNdL7f-COjZLDxzNL=8CPrZmX-1WwDqYZc=aASOQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] lz4: use CFLAGS from bitbake
To: Mikko Rapeli <mikko.rapeli@bmw.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a92f3c05c091029a"

--000000000000a92f3c05c091029a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 22, 2021 at 7:42 AM Mikko Rapeli <mikko.rapeli@bmw.de> wrote:

> Currently lz4 uses it's own defaults which include O3 optimization.
> Switch from O3 to bitbake default O2 reduces binary package size
> from 467056 to 331888 bytes. Enables also building with Os if needed.


These could impact runtime performance have you
Checked what the rough impact is ?
Secondly we will be using non default set which could result in errors les=
s
seen by others over time I have realized it=E2=80=99s also good to open a =
dialog
upstream and get the reasoning behind not letting distro defaults apply
some packages do have valid reasons


>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> ---
>  meta/recipes-support/lz4/lz4_1.9.3.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/lz4/lz4_1.9.3.bb
> b/meta/recipes-support/lz4/lz4_1.9.3.bb
> index effc530b94..3905ef7dbc 100644
> --- a/meta/recipes-support/lz4/lz4_1.9.3.bb
> +++ b/meta/recipes-support/lz4/lz4_1.9.3.bb
> @@ -22,7 +22,7 @@ S =3D "${WORKDIR}/git"
>  # Fixed in r118, which is larger than the current version.
>  CVE_CHECK_WHITELIST +=3D "CVE-2014-4715"
>
> -EXTRA_OEMAKE =3D "PREFIX=3D${prefix} CC=3D'${CC}' DESTDIR=3D${D} LIBDIR=
=
=3D${libdir}
> INCLUDEDIR=3D${includedir} BUILD_STATIC=3Dno"
> +EXTRA_OEMAKE =3D "PREFIX=3D${prefix} CC=3D'${CC}' CFLAGS=3D'${CFLAGS}'
> DESTDIR=3D${D} LIBDIR=3D${libdir} INCLUDEDIR=3D${includedir} BUILD_STATI=
C=3Dno"
>
>  do_install() {
>         oe_runmake install
> --
> 2.20.1
>
>
>=20
>
>

--000000000000a92f3c05c091029a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Apr 22, 2021 at 7:42 AM Mikko Rapeli &lt;<a href=
=3D"mailto:mikko.rapeli@bmw.de">mikko.rapeli@bmw.de</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">Currently lz4 uses it&#39;s own defaults w=
hich include O3 optimization.<br>
Switch from O3 to bitbake default O2 reduces binary package size<br>
from 467056 to 331888 bytes. Enables also building with Os if needed.</blo=
ckquote><div dir=3D"auto"><br></div><div dir=3D"auto">These could impact ru=
ntime performance have you</div><div dir=3D"auto">Checked what the rough im=
pact is ?=C2=A0</div><div dir=3D"auto">Secondly we will be using non defaul=
t set which could result in errors less seen by others over time I have rea=
lized it=E2=80=99s also good to open a dialog upstream and get the reasonin=
g behind not letting distro defaults apply some packages do have valid reas=
ons=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" d=
ir=3D"auto"><br>
<br>
Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@bmw.de" tar=
get=3D"_blank">mikko.rapeli@bmw.de</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/lz4/<a href=3D"http://lz4_1.9.3.bb" rel=3D"nore=
ferrer" target=3D"_blank">lz4_1.9.3.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-support/lz4/<a href=3D"http://lz4_1.9.3.bb" rel=
=3D"noreferrer" target=3D"_blank">lz4_1.9.3.bb</a> b/meta/recipes-support/=
lz4/<a href=3D"http://lz4_1.9.3.bb" rel=3D"noreferrer" target=3D"_blank">lz=
4_1.9.3.bb</a><br>
index effc530b94..3905ef7dbc 100644<br>
--- a/meta/recipes-support/lz4/<a href=3D"http://lz4_1.9.3.bb" rel=3D"nore=
ferrer" target=3D"_blank">lz4_1.9.3.bb</a><br>
+++ b/meta/recipes-support/lz4/<a href=3D"http://lz4_1.9.3.bb" rel=3D"nore=
ferrer" target=3D"_blank">lz4_1.9.3.bb</a><br>
@@ -22,7 +22,7 @@ S =3D &quot;${WORKDIR}/git&quot;<br>
=C2=A0# Fixed in r118, which is larger than the current version.<br>
=C2=A0CVE_CHECK_WHITELIST +=3D &quot;CVE-2014-4715&quot;<br>
<br>
-EXTRA_OEMAKE =3D &quot;PREFIX=3D${prefix} CC=3D&#39;${CC}&#39; DESTDIR=3D=
${D} LIBDIR=3D${libdir} INCLUDEDIR=3D${includedir} BUILD_STATIC=3Dno&quot;<=
br>
+EXTRA_OEMAKE =3D &quot;PREFIX=3D${prefix} CC=3D&#39;${CC}&#39; CFLAGS=3D&=
#39;${CFLAGS}&#39; DESTDIR=3D${D} LIBDIR=3D${libdir} INCLUDEDIR=3D${include=
dir} BUILD_STATIC=3Dno&quot;<br>
<br>
=C2=A0do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake install<br>
-- <br>
2.20.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000a92f3c05c091029a--
