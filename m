Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id B769977700;
	Tue,  6 Sep 2016 21:42:19 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id a6so9508725wmc.2;
	Tue, 06 Sep 2016 14:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=4NvNP9VTJIrfmnIYQlxWCoMdbR7FdWOMCjpsrjcrHpk=;
	b=j+lYcg2rIN4mHdSXhIXRDpsh48ZN4C29nO174lrCau28A41EdBCEDaT2cS5o8iKTEV
	CcbsHP910jkf8Mm6gTWHVRut+iAesZHnGPvTpYq6eksPOCxy0MBzJfYGFrMujW4n45MU
	wEoAj/T8qChrfJ7wNw/UAf30nGg0TNDy1ADrrGVzbzRH2uwi6cKLojx/Tq7YZxH3M2uC
	WfcgB8f3K3vdjrpTm/3khcCZCXOUr8xQTj10A7ufeue04T9dqBhBA9ujVM/QDv+UEI4D
	QbMZSuOnzI71chw2k/NSrEY2iOV+21Na2eQQMRZAEtfsogksXBGl35jPCMiH1fac0lZT
	a+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=4NvNP9VTJIrfmnIYQlxWCoMdbR7FdWOMCjpsrjcrHpk=;
	b=FVZZtLiTTqmrxtRa50Nz6+XSZF08R5HnIxQK34iNdvrOkyqG3+GDQjdTqP2tgIetvd
	6S3pXTLL9M5OCtBJ9EZbGX/9LjvbqRI0Q4nYU8y3ys/GHbQnwx5jpjJP3UnB6WA2OeYY
	kQyRFyciZypEYqYtIk+Pr9bOfkpfdjLBLRBQOPdfb+VoNOV1kOQ+S8cT4aqRTIxYgHs/
	3DoeHsahyJllQOx3im0eOaBN/zezttk4oQyKQx2Cn0DGqbBFDvqdK6WU+6OYu0aLLO0D
	Xy0CONQ82VmM5MAQbt993Ke/etfLU6hqhNYY4UDZdoIj8YBNb8jO7UViB2AZ0kTkwvIM
	yPvw==
X-Gm-Message-State: AE9vXwPdFKhFZzxuIJ6Iv/Y+D2S5i0aJYejT69jQ/XiZTNRzVG8wUgJOxfX8OcFvIJZPgw==
X-Received: by 10.28.141.76 with SMTP id p73mr620136wmd.118.1473198140042;
	Tue, 06 Sep 2016 14:42:20 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	f187sm797770wmf.15.2016.09.06.14.42.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Sep 2016 14:42:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 6 Sep 2016 23:42:19 +0200
To: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20160906214219.GE2645@jama>
References: <20160903085940.31396.10148@opal.openembedded.org>
	<20160903085943.DA54D50414@opal.openembedded.org>
	<20160906213823.GD2645@jama>
MIME-Version: 1.0
In-Reply-To: <20160906213823.GD2645@jama>
User-Agent: Mutt/1.7.0 (2016-08-17)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 13/55: lighttpd: update to 1.4.41
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Sep 2016 21:42:22 -0000
X-Groupsio-MsgNum: 86821
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KlAEzMkarCnErv5Q"
Content-Disposition: inline

--KlAEzMkarCnErv5Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 06, 2016 at 11:38:23PM +0200, Martin Jansa wrote:
> On Sat, Sep 03, 2016 at 08:59:53AM +0000, git@git.openembedded.org wrote:
> > rpurdie pushed a commit to branch master
> > in repository openembedded-core.
> >=20
> > commit 45fac4161cb230bc03c6c08d21cc768e52700f02
> > Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> > AuthorDate: Mon Aug 29 17:30:17 2016 +0300
> >=20
> >     lighttpd: update to 1.4.41
> >    =20
> >     Rebase pkgconfig.patch
> >    =20
> >     Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> >     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> Am I the only one seeing:
>=20
> ERROR: lighttpd-1.4.41-r0 do_configure: QA Issue: lighttpd: configure was=
 passed unrecognised options: --without-memcache [unknown-configure-option]
> ERROR: lighttpd-1.4.41-r0 do_configure: Fatal QA errors found, failing ta=
sk.
> ERROR: lighttpd-1.4.41-r0 do_configure: Function failed: do_qa_configure
>=20
> ?

Maybe I'm the only one who cares about QA issues, but it was definitely
changed in upstream to --without-memcached, see:

https://redmine.lighttpd.net/projects/lighttpd/repository/revisions/f3b577d=
dee36b9555331dfbcddb6a200df2ba438

> > ---
> >  ...fig-for-pcre-dependency-instead-of-config.patch | 37 ++++++++++++++=
++++++++
> >  .../lighttpd/lighttpd/pkgconfig.patch              | 33 --------------=
-----
> >  .../{lighttpd_1.4.39.bb =3D> lighttpd_1.4.41.bb}     |  6 ++--
> >  3 files changed, 40 insertions(+), 36 deletions(-)
> >=20
> > diff --git a/meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-confi=
g-for-pcre-dependency-instead-of-config.patch b/meta/recipes-extended/light=
tpd/lighttpd/0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch
> > new file mode 100644
> > index 0000000..b8c7f37
> > --- /dev/null
> > +++ b/meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-p=
cre-dependency-instead-of-config.patch
> > @@ -0,0 +1,37 @@
> > +From e7a8c925b9316a72bdc8f32789ffe56fda5c4788 Mon Sep 17 00:00:00 2001
> > +From: Alexander Kanavin <alex.kanavin@gmail.com>
> > +Date: Fri, 26 Aug 2016 18:20:32 +0300
> > +Subject: [PATCH] Use pkg-config for pcre dependency instead of -config=
 script.
> > +
> > +RP 2014/5/22
> > +Upstream-Status: Pending
> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +---
> > + configure.ac | 11 ++++++-----
> > + 1 file changed, 6 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index 1d172a1..a9236da 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -380,11 +380,12 @@ if test "$WITH_PCRE" !=3D "no"; then
> > + 			PCRE_LIB=3D"-L$WITH_PCRE/lib -lpcre"
> > + 			CPPFLAGS=3D"$CPPFLAGS -I$WITH_PCRE/include"
> > + 		else
> > +-			AC_PATH_PROG(PCRECONFIG, pcre-config)
> > +-			if test x"$PCRECONFIG" !=3D x; then
> > +-				PCRE_LIB=3D`$PCRECONFIG --libs`
> > +-				CPPFLAGS=3D"$CPPFLAGS `$PCRECONFIG --cflags`"
> > +-			fi
> > ++			PKG_CHECK_MODULES(PCREPKG, [libpcre], [
> > ++				PCRE_LIB=3D${PCREPKG_LIBS}
> > ++				CPPFLAGS=3D"$CPPFLAGS ${PCREPKG_CFLAGS}"
> > ++			], [
> > ++				AC_MSG_ERROR([pcre pkgconfig not found, install the pcre-devel pa=
ckage or build with --without-pcre])
> > ++			])
> > + 		fi
> > +=20
> > +   if test x"$PCRE_LIB" !=3D x; then
> > +--=20
> > +2.9.3
> > +
> > diff --git a/meta/recipes-extended/lighttpd/lighttpd/pkgconfig.patch b/=
meta/recipes-extended/lighttpd/lighttpd/pkgconfig.patch
> > deleted file mode 100644
> > index e395f92..0000000
> > --- a/meta/recipes-extended/lighttpd/lighttpd/pkgconfig.patch
> > +++ /dev/null
> > @@ -1,33 +0,0 @@
> > -Use pkg-config for pcre dependency instead of -config script.
> > -
> > -Upstream-Status: Pending
> > -
> > -RP 2014/5/22
> > -
> > -
> > -Index: lighttpd-1.4.35/configure.ac
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- lighttpd-1.4.35.orig/configure.ac	2014-03-06 14:08:00.000000000 +0=
000
> > -+++ lighttpd-1.4.35/configure.ac	2014-05-13 16:58:30.758471169 +0000
> > -@@ -309,16 +309,14 @@
> > - AC_MSG_RESULT([$WITH_PCRE])
> > -=20
> > - if test "$WITH_PCRE" !=3D "no"; then
> > --  AC_PATH_PROG(PCRECONFIG, pcre-config)
> > --
> > --  if test x"$PCRECONFIG" !=3D x; then
> > --    PCRE_LIB=3D`$PCRECONFIG --libs`
> > --    CPPFLAGS=3D"$CPPFLAGS `$PCRECONFIG --cflags`"
> > -+  PKG_CHECK_MODULES(PCREPKG, [libpcre], [
> > -+    PCRE_LIB=3D${PCREPKG_LIBS}
> > -+    CPPFLAGS=3D"$CPPFLAGS ${PCREPKG_CFLAGS}"
> > -     AC_DEFINE([HAVE_LIBPCRE], [1], [libpcre])
> > -     AC_DEFINE([HAVE_PCRE_H], [1], [pcre.h])
> > --  else
> > -+  ], [
> > -      AC_MSG_ERROR([pcre-config not found, install the pcre-devel pack=
age or build with --without-pcre])
> > --  fi
> > -+  ])
> > - fi
> > -=20
> > - AC_SUBST(PCRE_LIB)
> > diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.39.bb b/meta/r=
ecipes-extended/lighttpd/lighttpd_1.4.41.bb
> > similarity index 91%
> > rename from meta/recipes-extended/lighttpd/lighttpd_1.4.39.bb
> > rename to meta/recipes-extended/lighttpd/lighttpd_1.4.41.bb
> > index 378accb..a74d3a1 100644
> > --- a/meta/recipes-extended/lighttpd/lighttpd_1.4.39.bb
> > +++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.41.bb
> > @@ -20,11 +20,11 @@ SRC_URI =3D "http://download.lighttpd.net/lighttpd/=
releases-1.4.x/lighttpd-${PV}.t
> >          file://lighttpd.conf \
> >          file://lighttpd \
> >          file://lighttpd.service \
> > -        file://pkgconfig.patch \
> > +        file://0001-Use-pkg-config-for-pcre-dependency-instead-of-conf=
ig.patch \
> >          "
> > =20
> > -SRC_URI[md5sum] =3D "63c7563be1c7a7a9819a51f07f1af8b2"
> > -SRC_URI[sha256sum] =3D "7eb9a1853c3d6dd5851682b0733a729ba4158d6bdff809=
74d5ef5f1f6887365b"
> > +SRC_URI[md5sum] =3D "1df2e4dbc965cfe6f99f008ac3db4d8d"
> > +SRC_URI[sha256sum] =3D "4bcc383ef6d6dc7b284f68882d71a178e2986c83c4e85e=
eb3c8f3b882e346b6c"
> > =20
> >  PACKAGECONFIG ??=3D "openssl"
> >  PACKAGECONFIG[openssl] =3D "--with-openssl, --without-openssl, openssl"
> >=20
> > --=20
> > To stop receiving notification emails like this one, please contact
> > the administrator of this repository.
> > --=20
> > _______________________________________________
> > Openembedded-commits mailing list
> > Openembedded-commits@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KlAEzMkarCnErv5Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfPODkACgkQN1Ujt2V2gBwUywCeP3XUMgSq1cuwNMkF1P2qf1ao
EawAn0WgOEC7+ExpQfNAPR0t9CkxsHD/
=dGNd
-----END PGP SIGNATURE-----

--KlAEzMkarCnErv5Q--
