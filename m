Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id C797061864;
	Thu, 12 Sep 2013 17:12:50 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id b45so43894eek.15
	for <multiple recipients>; Thu, 12 Sep 2013 10:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9pvplL7HBiCT4Uz+Gb0uXF6oGT4w02Z1AVbFSRuXk+I=;
	b=VZvHCkQ+6FiewuIdWOBYHG9qXXgZIL4YWfmDW3iSP8iMDLuT+Rsu7zk2QHd6o4mYJH
	kKAqCUFk33sb3u8CEjARdWAT4gdkFcc588tybol+OB3SPbAFO+kQAJkcsBCPHYDwuP/7
	jLOqWPyyT6HxpIDUl/1CnO1WBtqp7k5qnyGwegPMwVpPQsrdfyt6nKeg0N/ytkvWNW1o
	56uTsnmWPlrnXhwqorI8EDcFgvc3PCpwurp9VL9XZZSY+q3mij13++wI6MjNGb0fRRXC
	0tOGbw0/nzNqTKljp83jWhJahy/Ua1o9zOJJFTXiMJ7ET9yta9YDZrCWcpl8PvjCI4sb
	2dBg==
X-Received: by 10.14.109.66 with SMTP id r42mr11459742eeg.43.1379005971973;
	Thu, 12 Sep 2013 10:12:51 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id a1sm7543340eem.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 12 Sep 2013 10:12:51 -0700 (PDT)
Date: Thu, 12 Sep 2013 19:14:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Marko Lindqvist <cazfi74@gmail.com>
Message-ID: <20130912171418.GB11500@jama>
References: <20130820142105.423E0503D1@opal>
 <20130823215953.GF3544@jama>
MIME-Version: 1.0
In-Reply-To: <20130823215953.GF3544@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Marko Lindqvist : gtk+: update to upstream version 2.24.20
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
X-List-Received-Date: Thu, 12 Sep 2013 17:12:52 -0000
X-Groupsio-MsgNum: 44892
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6PtN/jU//tuarfdA"
Content-Disposition: inline

--6PtN/jU//tuarfdA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2013 at 11:59:53PM +0200, Martin Jansa wrote:
> On Tue, Aug 20, 2013 at 02:21:05PM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: 176e5c5bfdeb2529cc40e35870ac49d75439dfeb
> > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcomm=
it;h=3D176e5c5bfdeb2529cc40e35870ac49d75439dfeb
> >=20
> > Author: Marko Lindqvist <cazfi74@gmail.com>
> > Date:   Fri Aug 16 11:07:50 2013 +0300
> >=20
> > gtk+: update to upstream version 2.24.20
> >=20
> > Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
>=20
> I'm not sure if it's caused by this change, but last world build is now
> failing with:
>=20
> | Making all in demos
> | make[2]: Entering directory `/home/jenkins/oe/shr-core-branches/shr-cor=
e/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gtk+/2.24.20-r0/gtk+-2.24.20/dem=
os'
> | /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-=
linux/usr/bin/gdk-pixbuf-csource --raw --build-list		\
> | 	        apple_red  ./apple-red.png	\
> |                 gnome_foot ./gnome-foot.png	\
> |         > test-inline-pixbufs.h				\
> | 	|| (rm -f test-inline-pixbufs.h && false)
> | failed to load "./apple-red.png": Couldn't recognize the image file for=
mat for file './apple-red.png'
> | make[2]: *** [test-inline-pixbufs.h] Error 1
> | make[2]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core=
/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gtk+/2.24.20-r0/gtk+-2.24.20/demo=
s'
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core=
/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gtk+/2.24.20-r0/gtk+-2.24.20'
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at /home/jenkin=
s/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gt=
k+/2.24.20-r0/temp/log.do_compile.26655)
> NOTE: recipe gtk+-2.24.20-r0: task do_compile: Failed
> ERROR: Task 17909 (/home/jenkins/oe/shr-core-branches/shr-core/openembedd=
ed-core/meta/recipes-gnome/gtk+/gtk+_2.24.20.bb, do_compile) failed with ex=
it code '1'
>=20
> IIRC we had these issues with demos before..

I just hit the same issue again.

> > ---
> >=20
> >  ...utton-do-not-prelight-in-touchscreen-mode.patch |    0
> >  ...Duplicate-the-exec-string-returned-by-gtk.patch |    0
> >  .../cellrenderer-cairo.patch                       |    0
> >  .../configure-nm.patch                             |    0
> >  .../configurefix.patch                             |    0
> >  .../{gtk+-2.24.18 =3D> gtk+-2.24.20}/doc-fixes.patch |    0
> >  .../entry-cairo.patch                              |    0
> >  .../hardcoded_libtool.patch                        |    0
> >  .../{gtk+-2.24.18 =3D> gtk+-2.24.20}/no-demos.patch  |    0
> >  .../run-iconcache.patch                            |    0
> >  .../toggle-font.diff                               |    0
> >  .../{gtk+-2.24.18 =3D> gtk+-2.24.20}/xsettings.patch |    0
> >  .../gtk+/{gtk+_2.24.18.bb =3D> gtk+_2.24.20.bb}      |    8 +++-----
> >  13 files changed, 3 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.18/0001-GtkButton-do-not=
-prelight-in-touchscreen-mode.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.20/=
0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch
> > similarity index 100%
> > rename from meta/recipes-gnome/gtk+/gtk+-2.24.18/0001-GtkButton-do-not-=
prelight-in-touchscreen-mode.patch
> > rename to meta/recipes-gnome/gtk+/gtk+-2.24.20/0001-GtkButton-do-not-pr=
elight-in-touchscreen-mode.patch
> > diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.18/0001-bgo-584832-Dupli=
cate-the-exec-string-returned-by-gtk.patch b/meta/recipes-gnome/gtk+/gtk+-2=
=2E24.20/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch
> > similarity index 100%
> > rename from meta/recipes-gnome/gtk+/gtk+-2.24.18/0001-bgo-584832-Duplic=
ate-the-exec-string-returned-by-gtk.patch
> > rename to meta/recipes-gnome/gtk+/gtk+-2.24.20/0001-bgo-584832-Duplicat=
e-the-exec-string-returned-by-gtk.patch
> > diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.18/cellrenderer-cairo.pa=
tch b/meta/recipes-gnome/gtk+/gtk+-2.24.20/cellrenderer-cairo.patch
> > similarity index 100%
> > rename from meta/recipes-gnome/gtk+/gtk+-2.24.18/cellrenderer-cairo.pat=
ch
> > rename to meta/recipes-gnome/gtk+/gtk+-2.24.20/cellrenderer-cairo.patch
> > diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.18/configure-nm.patch b/=
meta/recipes-gnome/gtk+/gtk+-2.24.20/configure-nm.patch
> > similarity index 100%
> > rename from meta/recipes-gnome/gtk+/gtk+-2.24.18/configure-nm.patch
> > rename to meta/recipes-gnome/gtk+/gtk+-2.24.20/configure-nm.patch
> > diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.18/configurefix.patch b/=
meta/recipes-gnome/gtk+/gtk+-2.24.20/configurefix.patch
> > similarity index 100%
> > rename from meta/recipes-gnome/gtk+/gtk+-2.24.18/configurefix.patch
> > rename to meta/recipes-gnome/gtk+/gtk+-2.24.20/configurefix.patch
> > diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.18/doc-fixes.patch b/met=
a/recipes-gnome/gtk+/gtk+-2.24.20/doc-fixes.patch
> > similarity index 100%
> > rename from meta/recipes-gnome/gtk+/gtk+-2.24.18/doc-fixes.patch
> > rename to meta/recipes-gnome/gtk+/gtk+-2.24.20/doc-fixes.patch
> > diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.18/entry-cairo.patch b/m=
eta/recipes-gnome/gtk+/gtk+-2.24.20/entry-cairo.patch
> > similarity index 100%
> > rename from meta/recipes-gnome/gtk+/gtk+-2.24.18/entry-cairo.patch
> > rename to meta/recipes-gnome/gtk+/gtk+-2.24.20/entry-cairo.patch
> > diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.18/hardcoded_libtool.pat=
ch b/meta/recipes-gnome/gtk+/gtk+-2.24.20/hardcoded_libtool.patch
> > similarity index 100%
> > rename from meta/recipes-gnome/gtk+/gtk+-2.24.18/hardcoded_libtool.patch
> > rename to meta/recipes-gnome/gtk+/gtk+-2.24.20/hardcoded_libtool.patch
> > diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.18/no-demos.patch b/meta=
/recipes-gnome/gtk+/gtk+-2.24.20/no-demos.patch
> > similarity index 100%
> > rename from meta/recipes-gnome/gtk+/gtk+-2.24.18/no-demos.patch
> > rename to meta/recipes-gnome/gtk+/gtk+-2.24.20/no-demos.patch
> > diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.18/run-iconcache.patch b=
/meta/recipes-gnome/gtk+/gtk+-2.24.20/run-iconcache.patch
> > similarity index 100%
> > rename from meta/recipes-gnome/gtk+/gtk+-2.24.18/run-iconcache.patch
> > rename to meta/recipes-gnome/gtk+/gtk+-2.24.20/run-iconcache.patch
> > diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.18/toggle-font.diff b/me=
ta/recipes-gnome/gtk+/gtk+-2.24.20/toggle-font.diff
> > similarity index 100%
> > rename from meta/recipes-gnome/gtk+/gtk+-2.24.18/toggle-font.diff
> > rename to meta/recipes-gnome/gtk+/gtk+-2.24.20/toggle-font.diff
> > diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.18/xsettings.patch b/met=
a/recipes-gnome/gtk+/gtk+-2.24.20/xsettings.patch
> > similarity index 100%
> > rename from meta/recipes-gnome/gtk+/gtk+-2.24.18/xsettings.patch
> > rename to meta/recipes-gnome/gtk+/gtk+-2.24.20/xsettings.patch
> > diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.18.bb b/meta/recipes-gno=
me/gtk+/gtk+_2.24.20.bb
> > similarity index 90%
> > rename from meta/recipes-gnome/gtk+/gtk+_2.24.18.bb
> > rename to meta/recipes-gnome/gtk+/gtk+_2.24.20.bb
> > index bfcdd64..baa5c9a 100644
> > --- a/meta/recipes-gnome/gtk+/gtk+_2.24.18.bb
> > +++ b/meta/recipes-gnome/gtk+/gtk+_2.24.20.bb
> > @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3bf50002aefd=
002f49e7bb854063f7e7 \
> >                      file://gtk/gtk.h;endline=3D27;md5=3Dc59e0b4490dd13=
5a5726ebf851f9b17f \
> >                      file://gdk/gdk.h;endline=3D27;md5=3D07db285ec208fb=
3e0bf7d861b0614202 \
> >                      file://tests/testgtk.c;endline=3D27;md5=3D262db5db=
5f776f9863e56df31423e24c"
> > -SRC_URI =3D "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.ta=
r.xz \
> > +SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-${P=
V}.tar.xz \
> >             file://xsettings.patch \
> >             file://run-iconcache.patch \
> >             file://configure-nm.patch \
> > @@ -28,10 +28,8 @@ SRC_URI =3D "http://download.gnome.org/sources/gtk+/=
2.24/gtk+-${PV}.tar.xz \
> >  #        file://combo-arrow-size.patch;striplevel=3D0
> >  #            file://configurefix.patch
> > =20
> > -PR =3D "r0"
> > -
> > -SRC_URI[md5sum] =3D "4309379acdcd8abfb72ea89bce3e7746"
> > -SRC_URI[sha256sum] =3D "6c963101272ff53bb5b01d21bfb86cebba5f0a68f31c5e=
10523c63f07e762385"
> > +SRC_URI[md5sum] =3D "9d7833331d7accd80668e29d7f567ce5"
> > +SRC_URI[sha256sum] =3D "cc66bcbf9239a7d9861175c681ba95894b55c70dc0b37a=
ad8345c46ecfda0da3"
> > =20
> >  EXTRA_OECONF =3D "--without-libtiff --without-libjasper --enable-xkb -=
-disable-glibtest --disable-cups --disable-xinerama"
> > =20
> >=20
> > _______________________________________________
> > Openembedded-commits mailing list
> > Openembedded-commits@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6PtN/jU//tuarfdA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIx9moACgkQN1Ujt2V2gBxbGwCgm5qU/6OshdMrxpQ1+MoXKHKJ
3FQAniD+QOnpIs945ST9pHe7xrxdmfXG
=yzpn
-----END PGP SIGNATURE-----

--6PtN/jU//tuarfdA--
