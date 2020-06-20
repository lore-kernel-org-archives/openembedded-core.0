Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com [209.85.217.67])
 by mx.groups.io with SMTP id smtpd.web11.13613.1592669477105651537
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2020 09:11:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YcLX4KcQ;
 spf=pass (domain: gmail.com, ip: 209.85.217.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f67.google.com with SMTP id r11so7302701vsj.5
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2020 09:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZUMb1kolY+uTUJnKtNhrR99NJLW3D4YbEhR5XVc0FZ4=;
        b=YcLX4KcQp7ReaPwBcAw03kpHMepmueW1eJi0jH1AWwwdXL60MgSfY/o51LqWvroaMW
         3Gs+2gj/XiTC6K58De3e3cN7zxzUpGA+cY8gUEZ0FAG8muDL0nVC/Bj/VegJfAJxkS+3
         yRduDRS0fHi0S8V41J+HQbDOV9Q+1dEBkXH19Iw+XRnBzLRovN0Ss7nedNIODpj73Whc
         S2yRx7rQZqUakAtRVHejctVFv2PUJM2IRAmNizCcdxTuNmWVm4dSEsHZf3jFIj5WvKFc
         tw+FuBH1ztY/BVEG2OVLD7JqEeOD526cjWuOVZxALpQCC57qx+8K6fT95vE0Z+3poCRR
         0lYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZUMb1kolY+uTUJnKtNhrR99NJLW3D4YbEhR5XVc0FZ4=;
        b=F7cd+cK5bL2m7KIawG7ztbodGIbBL4N6Z3i6geXRXXnXMwWHnz1JNMFNfe9Jhv80bz
         snjm4OITVpupqIBGxuUNBJEm8OR+UadP3irb8Xug9R5dypeA3K9nwF9mRrnc1knnC2Fh
         NARURhMF6u76LBaz24NLmBYe1d0lSJhe/OffJ4ByQTxB97tvz5FlUpCkBTCSHq7hShn0
         gf7GyfC50VZHxIJsCWfpBLSZ1JiEhS2HHWKxSb0INnoMiTB1llrv8rOJR71kp58ohhvD
         jmKRuc3OMz7c0SbbQu6PwBBksLRV2TvHciFiRTt9Y3r0OUhTy7woVpDvA6v1F5MCj869
         HQ0g==
X-Gm-Message-State: AOAM533vwiipGy2G4jLiV6YemIDT1772jy3OKatRnr4VZa+N337dfr1v
	vUpGH9O3sYK+YYWX1uyVUUKK3muMYTvLTTdygnk=
X-Google-Smtp-Source: ABdhPJyH4bWnn7XGF16Yqs7yZ2Oo3wndWa6kflBQ4OFESwZT4/ZmZe+8oE0hPtN0gdp2FKVRKzuF3maWQVYt/KBaBbo=
X-Received: by 2002:a67:db0b:: with SMTP id z11mr10897569vsj.25.1592669476223;
 Sat, 20 Jun 2020 09:11:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200617101552.23867-1-alex.kanavin@gmail.com>
 <c141fa7dcd3f4cbf8dd75d8590eb71ce@XBOX03.axis.com> <CANNYZj_z2tOZivRx4bmC_FsVRTu9jnBeo021qKXJPVq9rrK_9g@mail.gmail.com>
 <2bc56eb8b72e4aeb8da13c2dc2cfc4b2@XBOX03.axis.com>
In-Reply-To: <2bc56eb8b72e4aeb8da13c2dc2cfc4b2@XBOX03.axis.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 20 Jun 2020 18:11:04 +0200
Message-ID: <CANNYZj_CUmsOSYjODYwmOtq53OUEqNJmO3dd4u+k5L+JGzzGog@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] apr-util: make gdbm optional
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000060020305a8864272"

--00000000000060020305a8864272
Content-Type: text/plain; charset="UTF-8"

This would still need to be tested with a specific image(s) from oe-core,
otherwise it is prone to bit rot. And it would not include tweaks from
meta-oe (e.g. lua) or anywhere else.

We already test no-gpl3-ness for core-image-minimal and
core-image-full-cmdline (to match the meta-gpl2 tests), and neither needs
PACKAGECONFIG tweaks:

http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/lib/oeqa/selftest/cases/incompatible_lic.py#n118

The same test could be extended for maybe core-image-sato and
core-image-weston. Whether those images will produce a nice list of tweaks,
or are good as they are, I can't tell. apr-util for example is not included
into any of them.

Alex

On Sat, 20 Jun 2020 at 16:03, Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> Hmm, ok. How about a common without_gpl3.inc file? It could serve as a
> place to gather/document these PACKAGECONFIGs and other setting that need
> to be enabled to build without GPL-3.0. That way you are not forced in the
> same way as a distro feature would be, but at the same time it is easy for
> anyone who wants to disable GPL-3.0 for their build to find all the setting
> they need to tweak.
>
>
>
> //Peter
>
>
>
> *From:* Alexander Kanavin <alex.kanavin@gmail.com>
> *Sent:* den 20 juni 2020 14:52
> *To:* Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> *Cc:* openembedded-core@lists.openembedded.org
> *Subject:* Re: [OE-core] [PATCH 1/2] apr-util: make gdbm optional
>
>
>
> In our environment gpl3 is not banned across the distro but rather banned
> only in the product image, with a targeted set of recipe tweaks aimed to
> allow that image to build. Non-product images are still permitted to
> contain gpl3 items. Since everyone has a different set of what goes into
> their product image, and what doesn't, and there are inevitably various 3rd
> party layers in the mix, I do not think a distro setting would make much
> sense.
>
>
>
> Alex
>
>
>
> On Sat, 20 Jun 2020 at 13:30, Peter Kjellerstedt <
> peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Alexander Kanavin
> > Sent: den 17 juni 2020 12:16
> > To: openembedded-core@lists.openembedded.org
> > Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> > Subject: [OE-core] [PATCH 1/2] apr-util: make gdbm optional
> >
> > This helps with gpl3-free builds.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/recipes-support/apr/apr-util_1.6.1.bb | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-support/apr/apr-util_1.6.1.bb
> b/meta/recipes-support/apr/apr-util_1.6.1.bb
> > index 3896c924f0..0dd8f025e8 100644
> > --- a/meta/recipes-support/apr/apr-util_1.6.1.bb
> > +++ b/meta/recipes-support/apr/apr-util_1.6.1.bb
> > @@ -1,7 +1,7 @@
> >  SUMMARY = "Apache Portable Runtime (APR) companion library"
> >  HOMEPAGE = "http://apr.apache.org/"
> >  SECTION = "libs"
> > -DEPENDS = "apr expat gdbm"
> > +DEPENDS = "apr expat"
> >
> >  BBCLASSEXTEND = "native nativesdk"
> >
> > @@ -23,7 +23,6 @@ EXTRA_OECONF =
> "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
> >               --without-odbc \
> >               --without-pgsql \
> >               --with-dbm=gdbm \
> > -             --with-gdbm=${STAGING_DIR_HOST}${prefix} \
> >               --without-sqlite2 \
> >               --with-expat=${STAGING_DIR_HOST}${prefix}"
> >
> > @@ -66,10 +65,11 @@ do_install_append_class-target() {
> >              -e 's,APU_BUILD_DIR=.*,APR_BUILD_DIR=,g'
> ${D}${bindir}/apu-1-config
> >  }
> >
> > -PACKAGECONFIG ??= "crypto"
> > +PACKAGECONFIG ??= "crypto gdbm"
>
> Since I assume this is not the only place where it is needed to disable a
> feature to achieve a GPL-3.0 free build, maybe we should introduce a
> distro
> feature to control them? E.g.:
>
> PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'allow-gpl3',
> 'gdbm', '', d)} \
>                    crypto
> <$%7b@bb.utils.contains('DISTRO_FEATURES',%20'allow-gpl3',%20'gdbm',%20'',%20d)%7d%20%5C%0b%C2%A0%20%C2%A0%20%C2%A0%20%C2%A0%20%C2%A0%20%C2%A0%20%C2%A0%20%C2%A0%20%C2%A0%20%C2%A0crypto>
> "
>
> This would make it a lot easier for anyone who wants to disable the use of
> GPL-3.0 code as they would not have to go searching through the recipes
> for
> these kind of features to disable.
>
> >  PACKAGECONFIG[ldap] = "--with-ldap,--without-ldap,openldap"
> >  PACKAGECONFIG[crypto] = "--with-openssl=${STAGING_DIR_HOST}${prefix}
> --with-crypto,--without-crypto,openssl"
> >  PACKAGECONFIG[sqlite3] =
> "--with-sqlite3=${STAGING_DIR_HOST}${prefix},--without-sqlite3,sqlite3"
> > +PACKAGECONFIG[gdbm] =
> "--with-gdbm=${STAGING_DIR_HOST}${prefix},--without-gdbm,gdbm"
> >
> >  #files ${libdir}/apr-util-1/*.so are not symlinks but loadable modules
> thus they are packaged in ${PN}
> >  FILES_${PN}     += "${libdir}/apr-util-1/apr*${SOLIBS}
> ${libdir}/apr-util-1/apr*${SOLIBSDEV}"
> > --
> > 2.27.0
>
> //Peter
>
>

--00000000000060020305a8864272
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This would still need to be tested with a specific im=
age(s) from oe-core, otherwise it is prone to bit rot. And it would not inc=
lude tweaks from meta-oe (e.g. lua) or anywhere else.</div><div><br></div><=
div>We already test no-gpl3-ness for core-image-minimal and core-image-full=
-cmdline (to match the meta-gpl2 tests), and neither needs PACKAGECONFIG tw=
eaks:</div><div><div><br></div><div><a href=3D"http://git.yoctoproject.org/=
cgit/cgit.cgi/poky/tree/meta/lib/oeqa/selftest/cases/incompatible_lic.py#n1=
18">http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/lib/oeqa/selft=
est/cases/incompatible_lic.py#n118</a></div><div><br></div></div><div>The s=
ame test could be extended for maybe core-image-sato and core-image-weston.=
 Whether those images will produce a nice list of tweaks, or are good as th=
ey are, I can&#39;t tell. apr-util for example is not included into any of =
them.<br></div><div></div><div><br></div><div>Alex<br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 20 Jun =
2020 at 16:03, Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@=
axis.com">peter.kjellerstedt@axis.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">





<div lang=3D"SV">
<div class=3D"gmail-m_-3496802296698203100WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
Hmm, ok. How about a common without_gpl3.inc file? It could serve as a plac=
e to gather/document these PACKAGECONFIGs and other setting that need to be=
 enabled to build
 without GPL-3.0. That way you are not forced in the same way as a distro f=
eature would be, but at the same time it is easy for anyone who wants to di=
sable GPL-3.0 for their build to find all the setting they need to tweak.<u=
></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
//Peter<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
<u></u>=C2=A0<u></u></span></p>
<div style=3D"border-color:currentcolor currentcolor currentcolor blue;bord=
er-style:none none none solid;border-width:medium medium medium 1.5pt;paddi=
ng:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-color:rgb(225,225,225) currentcolor currentcolor;borde=
r-style:solid none none;border-width:1pt medium medium;padding:3pt 0cm 0cm"=
>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;
<br>
<b>Sent:</b> den 20 juni 2020 14:52<br>
<b>To:</b> Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis=
.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
<b>Subject:</b> Re: [OE-core] [PATCH 1/2] apr-util: make gdbm optional<u></=
u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">In our environment gpl3 is not banned across the dis=
tro but rather banned only in the product image, with a targeted set of rec=
ipe tweaks aimed to allow that image to build. Non-product images are still=
 permitted to contain gpl3 items.
 Since everyone has a different set of what goes into their product image, =
and what doesn&#39;t, and there are inevitably various 3rd party layers in =
the mix, I do not think a distro setting would make much sense.<u></u><u></=
u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Alex<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Sat, 20 Jun 2020 at 13:30, Peter Kjellerstedt &lt=
;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.kje=
llerstedt@axis.com</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-color:currentcolor currentcolor currentcolor rg=
b(204,204,204);border-style:none none none solid;border-width:medium medium=
 medium 1pt;padding:0cm 0cm 0cm 6pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">&gt; -----Original Mess=
age-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">
openembedded-core@lists.openembedded.org</a> &lt;openembedded-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Alexander Kanavin<br>
&gt; Sent: den 17 juni 2020 12:16<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Cc: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; Subject: [OE-core] [PATCH 1/2] apr-util: make gdbm optional<br>
&gt; <br>
&gt; This helps with gpl3-free builds.<br>
&gt; <br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-support/apr/<a href=3D"http://apr-util_1.6.1.bb" ta=
rget=3D"_blank">apr-util_1.6.1.bb</a> | 6 +++---<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-support/apr/<a href=3D"http://apr-util_1.6.1=
.bb" target=3D"_blank">apr-util_1.6.1.bb</a> b/meta/recipes-support/apr/<a =
href=3D"http://apr-util_1.6.1.bb" target=3D"_blank">apr-util_1.6.1.bb</a><b=
r>
&gt; index 3896c924f0..0dd8f025e8 100644<br>
&gt; --- a/meta/recipes-support/apr/<a href=3D"http://apr-util_1.6.1.bb" ta=
rget=3D"_blank">apr-util_1.6.1.bb</a><br>
&gt; +++ b/meta/recipes-support/apr/<a href=3D"http://apr-util_1.6.1.bb" ta=
rget=3D"_blank">apr-util_1.6.1.bb</a><br>
&gt; @@ -1,7 +1,7 @@<br>
&gt;=C2=A0 SUMMARY =3D &quot;Apache Portable Runtime (APR) companion librar=
y&quot;<br>
&gt;=C2=A0 HOMEPAGE =3D &quot;<a href=3D"http://apr.apache.org/" target=3D"=
_blank">http://apr.apache.org/</a>&quot;<br>
&gt;=C2=A0 SECTION =3D &quot;libs&quot;<br>
&gt; -DEPENDS =3D &quot;apr expat gdbm&quot;<br>
&gt; +DEPENDS =3D &quot;apr expat&quot;<br>
&gt; <br>
&gt;=C2=A0 BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; <br>
&gt; @@ -23,7 +23,6 @@ EXTRA_OECONF =3D &quot;--with-apr=3D${STAGING_BINDIR=
_CROSS}/apr-1-config \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--without-odbc \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--without-pgsql =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-dbm=3Dgdb=
m \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-gdbm=3D${STAGI=
NG_DIR_HOST}${prefix} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--without-sqlite=
2 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-expat=3D$=
{STAGING_DIR_HOST}${prefix}&quot;<br>
&gt; <br>
&gt; @@ -66,10 +65,11 @@ do_install_append_class-target() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s,APU_BUILD_DI=
R=3D.*,APR_BUILD_DIR=3D,g&#39; ${D}${bindir}/apu-1-config<br>
&gt;=C2=A0 }<br>
&gt; <br>
&gt; -PACKAGECONFIG ??=3D &quot;crypto&quot;<br>
&gt; +PACKAGECONFIG ??=3D &quot;crypto gdbm&quot;<br>
<br>
Since I assume this is not the only place where it is needed to disable a <=
br>
feature to achieve a GPL-3.0 free build, maybe we should introduce a distro=
 <br>
feature to control them? E.g.:<br>
<br>
PACKAGECONFIG ??=3D &quot;<a href=3D"mailto:$%7b@bb.utils.contains(&#39;DIS=
TRO_FEATURES&#39;,%20&#39;allow-gpl3&#39;,%20&#39;gdbm&#39;,%20&#39;&#39;,%=
20d)%7d%20%5C%0b%C2%A0%20%C2%A0%20%C2%A0%20%C2%A0%20%C2%A0%20%C2%A0%20%C2%A=
0%20%C2%A0%20%C2%A0%20%C2%A0crypto" target=3D"_blank">${@bb.utils.contains(=
&#39;DISTRO_FEATURES&#39;, &#39;allow-gpl3&#39;, &#39;gdbm&#39;, &#39;&#39;=
, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crypto=
</a>&quot;<br>
<br>
This would make it a lot easier for anyone who wants to disable the use of =
<br>
GPL-3.0 code as they would not have to go searching through the recipes for=
 <br>
these kind of features to disable.<br>
<br>
&gt;=C2=A0 PACKAGECONFIG[ldap] =3D &quot;--with-ldap,--without-ldap,openlda=
p&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[crypto] =3D &quot;--with-openssl=3D${STAGING_DIR_H=
OST}${prefix} --with-crypto,--without-crypto,openssl&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[sqlite3] =3D &quot;--with-sqlite3=3D${STAGING_DIR_=
HOST}${prefix},--without-sqlite3,sqlite3&quot;<br>
&gt; +PACKAGECONFIG[gdbm] =3D &quot;--with-gdbm=3D${STAGING_DIR_HOST}${pref=
ix},--without-gdbm,gdbm&quot;<br>
&gt; <br>
&gt;=C2=A0 #files ${libdir}/apr-util-1/*.so are not symlinks but loadable m=
odules thus they are packaged in ${PN}<br>
&gt;=C2=A0 FILES_${PN}=C2=A0 =C2=A0 =C2=A0+=3D &quot;${libdir}/apr-util-1/a=
pr*${SOLIBS} ${libdir}/apr-util-1/apr*${SOLIBSDEV}&quot;<br>
&gt; --<br>
&gt; 2.27.0<br>
<br>
//Peter<u></u><u></u></p>
</blockquote>
</div>
</div>
</div>
</div>

</blockquote></div>

--00000000000060020305a8864272--
