Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com [209.85.222.67])
 by mx.groups.io with SMTP id smtpd.web12.10180.1592657521661435950
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2020 05:52:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PNDEqobd;
 spf=pass (domain: gmail.com, ip: 209.85.222.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f67.google.com with SMTP id v25so4110958uau.4
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2020 05:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s9ouD4QIqHBdPjhhWkO6T/f1ITtSpsdlSgiBZS/p1cM=;
        b=PNDEqobdaxbPu3WUbbEMBvPZTS126vJHEbG8teETDpifA7ly3C8m9xj1YN5cOFCXPK
         S57ZVRdVnf10NfFYS29sq4XLm/BEjMI5nG3akemVi60SqOFiaJe1ONGeK3YX8W/isynL
         xMT0AA3YJpM02J/WeyvWZsbtfqNUbyKhT93kyWFIo8E531jqcyk9c8flvDJA820XOvp+
         Oeo+DXaVN1JQ5IHfqHhIDc4zqJBgqQlptahaRcYlRixzd5geomzizfbUQKchE9xsW8pX
         uXcdNi7BzOR2/FCXmq4gySlb6qDNtV+vprzZZa8LFQURe2s+yduJgsO/u20nfWD0guNb
         AKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s9ouD4QIqHBdPjhhWkO6T/f1ITtSpsdlSgiBZS/p1cM=;
        b=c5dI19sC7PJkSkXQUWjFA+paL1r6LidHf1CXYVAFnJSsKW9i4+PpZV9UhKdbCbMAPP
         LUF6cSz+U1dSua8Wbqu/Pj/+XWiXGWvJLGBEkOg+Uu4CJ23EqNnGbSrc0L9obrq8khnt
         kdY8IHD1Exj2xryWXNt+t62uUvlpXqAaqgZnes7kVN7Sxfa/oOP1HZWt+qtIiJ+fAF/w
         7eBWK7ufJ0xtQ4t9hCyHDYz9zgamPFppkJFrm1CBD9rf4TX0/aooK4EpBeORsEISHNC2
         qyXueyVc28hAokTnTM+zXvaWhkI9XKbP6CD3k6tXpk6I8qQZBTRJNuFIiSNTnoR7bGxm
         TNSg==
X-Gm-Message-State: AOAM531mi07sGwHcu+SXGxjbC7RQu0VFSIpRKk7gX8VeAGKXh8FLamwh
	AKeRgG1ScdulING8aD8Cly6XGpe6ojv981ACE+kX22KE
X-Google-Smtp-Source: ABdhPJzmiiNgqmaElSt5eRw4r/Nfv26eYRMOCG/UpZwp9pBH7KPj0guyHdvWRT0IPcpUfFvOxX1GlV50rXboqYCBph4=
X-Received: by 2002:ab0:3f0:: with SMTP id 103mr5550001uau.71.1592657520727;
 Sat, 20 Jun 2020 05:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200617101552.23867-1-alex.kanavin@gmail.com> <c141fa7dcd3f4cbf8dd75d8590eb71ce@XBOX03.axis.com>
In-Reply-To: <c141fa7dcd3f4cbf8dd75d8590eb71ce@XBOX03.axis.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 20 Jun 2020 14:51:48 +0200
Message-ID: <CANNYZj_z2tOZivRx4bmC_FsVRTu9jnBeo021qKXJPVq9rrK_9g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] apr-util: make gdbm optional
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c59d7a05a8837991"

--000000000000c59d7a05a8837991
Content-Type: text/plain; charset="UTF-8"

In our environment gpl3 is not banned across the distro but rather banned
only in the product image, with a targeted set of recipe tweaks aimed to
allow that image to build. Non-product images are still permitted to
contain gpl3 items. Since everyone has a different set of what goes into
their product image, and what doesn't, and there are inevitably various 3rd
party layers in the mix, I do not think a distro setting would make much
sense.

Alex

On Sat, 20 Jun 2020 at 13:30, Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

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
>                    crypto"
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

--000000000000c59d7a05a8837991
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>In our environment gpl3 is not banned across the dist=
ro but rather banned only in the product image, with a targeted set of reci=
pe tweaks aimed to allow that image to build. Non-product images are still =
permitted to contain gpl3 items. Since everyone has a different set of what=
 goes into their product image, and what doesn&#39;t, and there are inevita=
bly various 3rd party layers in the mix, I do not think a distro setting wo=
uld make much sense.</div><div><br></div><div>Alex<br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 20 Jun =
2020 at 13:30, Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@=
axis.com">peter.kjellerstedt@axis.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
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
&gt;=C2=A0 meta/recipes-support/apr/<a href=3D"http://apr-util_1.6.1.bb" re=
l=3D"noreferrer" target=3D"_blank">apr-util_1.6.1.bb</a> | 6 +++---<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-support/apr/<a href=3D"http://apr-util_1.6.1=
.bb" rel=3D"noreferrer" target=3D"_blank">apr-util_1.6.1.bb</a> b/meta/reci=
pes-support/apr/<a href=3D"http://apr-util_1.6.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">apr-util_1.6.1.bb</a><br>
&gt; index 3896c924f0..0dd8f025e8 100644<br>
&gt; --- a/meta/recipes-support/apr/<a href=3D"http://apr-util_1.6.1.bb" re=
l=3D"noreferrer" target=3D"_blank">apr-util_1.6.1.bb</a><br>
&gt; +++ b/meta/recipes-support/apr/<a href=3D"http://apr-util_1.6.1.bb" re=
l=3D"noreferrer" target=3D"_blank">apr-util_1.6.1.bb</a><br>
&gt; @@ -1,7 +1,7 @@<br>
&gt;=C2=A0 SUMMARY =3D &quot;Apache Portable Runtime (APR) companion librar=
y&quot;<br>
&gt;=C2=A0 HOMEPAGE =3D &quot;<a href=3D"http://apr.apache.org/" rel=3D"nor=
eferrer" target=3D"_blank">http://apr.apache.org/</a>&quot;<br>
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
PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &=
#39;allow-gpl3&#39;, &#39;gdbm&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crypto=
&quot;<br>
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
//Peter<br>
<br>
</blockquote></div>

--000000000000c59d7a05a8837991--
