Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1UIypG-0001Z8-K0; Fri, 22 Mar 2013 11:03:55 +0100
Received: by mail-pb0-f41.google.com with SMTP id um15so2970982pbc.14
	for <multiple recipients>; Fri, 22 Mar 2013 02:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=TkDWJdGj6m50UROhUTL9jwFLyU8OGrEYVT9/qKG1W2U=;
	b=c6UOCnzq5LWfUhdbWtGxLnE6uhn52vIM4IqRX/RApe/1Nxu0U/GxdP2IFk+SqYnZmO
	IyJt1hz42Gvtl0QJ8t7OVvoDiRNtG5AHPf80murviHJOQi4IpwiV91btz0TF9Qqc2lCo
	JanwmFfscAWBpsk5/qbxaz1uYCsvq+VykHjEWYPQsFecqlrBH64Trpo/NNL/xd0JLZDB
	uilvhNXJo+qZuLRDO63dBfBT2phQx98SpkDMe//cON9/gPv0cP2RiQJ6eobuGD+FP5JL
	pGqBkrVRQolUCr6OKNgRNOH2yZ6xMV2gqRgwUl3NmNZhjPYoPdzs/wm/lz1Ofw1Ucdhv
	4UWA==
X-Received: by 10.66.81.2 with SMTP id v2mr2122230pax.204.1363945620176;
	Fri, 22 Mar 2013 02:47:00 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id wm3sm1831304pbc.4.2013.03.22.02.46.57
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 02:46:59 -0700 (PDT)
Date: Fri, 22 Mar 2013 10:46:57 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Cristian Iorga <cristian.iorga@intel.com>
Message-ID: <20130322094657.GR3219@jama>
References: <20130307111408.E14C2503A2@opal>
	<20130307131301.GJ32228@jama.dyndns-home.com>
MIME-Version: 1.0
In-Reply-To: <20130307131301.GJ32228@jama.dyndns-home.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Cristian Iorga : connman: upgrade to 1.12
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Mar 2013 10:03:56 -0000
X-Groupsio-MsgNum: 36896
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Uw+RRa3pmtkgiNaD"
Content-Disposition: inline

--Uw+RRa3pmtkgiNaD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 07, 2013 at 02:13:01PM +0100, Martin Jansa wrote:
> On Thu, Mar 07, 2013 at 11:14:08AM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: bd94ab11bbb6501013ed27ecb22685664816986c
> > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcomm=
it;h=3Dbd94ab11bbb6501013ed27ecb22685664816986c
> >=20
> > Author: Cristian Iorga <cristian.iorga@intel.com>
> > Date:   Mon Mar  4 19:17:49 2013 +0200
> >=20
> > connman: upgrade to 1.12
> >=20
> > - 0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch no lon=
ger needed;
> > fix included in package source code
> >=20
> > Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> >=20
> > ---
> >=20
> >  meta/recipes-connectivity/connman/connman.inc      |    2 +-
> >  ...If-there-is-no-d_type-support-use-fstatat.patch |   55 ------------=
--------
> >  .../connman/{connman_1.10.bb =3D> connman_1.12.bb}   |    5 +-
> >  3 files changed, 3 insertions(+), 59 deletions(-)
> >=20
> > diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recip=
es-connectivity/connman/connman.inc
> > index db4d26c..04b21f7 100644
> > --- a/meta/recipes-connectivity/connman/connman.inc
> > +++ b/meta/recipes-connectivity/connman/connman.inc
> > @@ -20,7 +20,7 @@ DEPENDS  =3D "dbus glib-2.0 ppp iptables gnutls \
> >              ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
> >              "
> > =20
> > -INC_PR =3D "r18"
> > +INC_PR =3D "r0"
>=20
> If this .inc file is reused by some other connman versions (e.g. .bb in
> other layers) this will make PR going backwards for them.
>=20
> It's OK to reset PR when changing PV, but please don't reset INC_PR too.

ping

>=20
> >  TIST =3D "--enable-tist"
> >  TIST_powerpc =3D ""
> > diff --git a/meta/recipes-connectivity/connman/connman/0002-storage.c-I=
f-there-is-no-d_type-support-use-fstatat.patch b/meta/recipes-connectivity/=
connman/connman/0002-storage.c-If-there-is-no-d_type-support-use-fstatat.pa=
tch
> > deleted file mode 100644
> > index 7315545..0000000
> > --- a/meta/recipes-connectivity/connman/connman/0002-storage.c-If-there=
-is-no-d_type-support-use-fstatat.patch
> > +++ /dev/null
> > @@ -1,55 +0,0 @@
> > -From 7007ef32a959ac4717c19339a24fd90a68638a19 Mon Sep 17 00:00:00 2001
> > -From: Andrei Gherzan <andrei@gherzan.ro>
> > -Date: Tue, 17 Jul 2012 16:07:17 +0300
> > -Subject: [PATCH V3 2/2] storage.c: If there is no d_type support use
> > - fstatat()
> > -
> > -This is useful for filesystems where d_type is always DT_UNKNOWN.
> > -In this case use fstatat() function.
> > -
> > -Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> > -Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> > -Upstream-Status: Submitted
> > -=20
> > ----
> > - src/storage.c |   19 +++++++++++++++++++
> > - 1 file changed, 19 insertions(+)
> > -
> > -Index: git/src/storage.c
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- git.orig/src/storage.c
> > -+++ git/src/storage.c
> > -@@ -193,7 +193,6 @@ gchar **connman_storage_get_services()
> > -=20
> > - 		switch (d->d_type) {
> > - 		case DT_DIR:
> > --		case DT_UNKNOWN:
> > - 			/*
> > - 			 * If the settings file is not found, then
> > - 			 * assume this directory is not a services dir.
> > -@@ -203,6 +202,25 @@ gchar **connman_storage_get_services()
> > - 			ret =3D stat(str, &buf);
> > - 			g_free(str);
> > - 			if (ret < 0)
> > -+				continue;
> > -+
> > -+			g_string_append_printf(result, "%s/", d->d_name);
> > -+			break;
> > -+		case DT_UNKNOWN:
> > -+			/*
> > -+			 * If there is no d_type support use fstatat()
> > -+			 * to check if directory
> > -+			 */
> > -+			ret =3D fstatat(dirfd(dir), d->d_name, &buf, 0);
> > -+			if (ret < 0)
> > -+				continue;
> > -+			if (!(buf.st_mode & S_IFDIR))
> > -+				continue;
> > -+			str =3D g_strdup_printf("%s/%s/settings", STORAGEDIR,
> > -+							d->d_name);
> > -+			ret =3D stat(str, &buf);
> > -+			g_free(str);
> > -+			if (ret < 0)
> > - 				continue;
> > -=20
> > - 			g_string_append_printf(result, "%s/", d->d_name);
> > diff --git a/meta/recipes-connectivity/connman/connman_1.10.bb b/meta/r=
ecipes-connectivity/connman/connman_1.12.bb
> > similarity index 74%
> > rename from meta/recipes-connectivity/connman/connman_1.10.bb
> > rename to meta/recipes-connectivity/connman/connman_1.12.bb
> > index 7dca1b4..5ba4032 100644
> > --- a/meta/recipes-connectivity/connman/connman_1.10.bb
> > +++ b/meta/recipes-connectivity/connman/connman_1.12.bb
> > @@ -1,12 +1,11 @@
> >  require connman.inc
> > =20
> > -# 1.10 tag
> > -SRCREV =3D "3bda76eb442c9395db1dba17352c3e78376671cc"
> > +# 1.12 tag
> > +SRCREV =3D "8397cbbc0a79d39cf3b1880f4fd3f3405b6bc6ad"
> >  SRC_URI  =3D "git://git.kernel.org/pub/scm/network/connman/connman.git=
 \
> >              file://0001-plugin.h-Change-visibility-to-default-for-debu=
g-symb.patch \
> >              file://add_xuser_dbus_permission.patch \
> >              file://connman \
> > -            file://0002-storage.c-If-there-is-no-d_type-support-use-fs=
tatat.patch \
> >              file://inet-fix-ip-cleanup-functions.patch \
> >              file://add-in.h-for-ipv6.patch"
> >  S =3D "${WORKDIR}/git"
> >=20
> >=20
> > _______________________________________________
> > Openembedded-commits mailing list
> > Openembedded-commits@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Uw+RRa3pmtkgiNaD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFMKJEACgkQN1Ujt2V2gBwi4wCfY6lRGP6TdOsz0k5Xx9nDyltc
9ZMAnRMNE/tx1U9wtYar1bFfvL7+FIUA
=fcdh
-----END PGP SIGNATURE-----

--Uw+RRa3pmtkgiNaD--
