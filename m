Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UIzy0-00049T-Q1
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 12:17:02 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Mar 2013 03:58:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,891,1355126400"; d="scan'208";a="283161965"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by orsmga001.jf.intel.com with ESMTP; 22 Mar 2013 04:00:04 -0700
Received: from irsmsx151.ger.corp.intel.com (163.33.192.59) by
	IRSMSX102.ger.corp.intel.com (163.33.3.155) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Fri, 22 Mar 2013 11:00:01 +0000
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.244]) by
	IRSMSX151.ger.corp.intel.com ([169.254.4.245]) with mapi id
	14.01.0355.002; Fri, 22 Mar 2013 11:00:00 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [oe-commits] Cristian Iorga : connman: upgrade to 1.12
Thread-Index: AQHOGzWcSfWPJbnJlESZ8NbfD4OJ0ZixjfeAgAAULcA=
Date: Fri, 22 Mar 2013 11:00:00 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB1621958C@IRSMSX102.ger.corp.intel.com>
References: <20130307111408.E14C2503A2@opal>
	<20130307131301.GJ32228@jama.dyndns-home.com>
	<20130322094657.GR3219@jama>
In-Reply-To: <20130322094657.GR3219@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
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
X-List-Received-Date: Fri, 22 Mar 2013 11:17:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Martin,
I will submit a patch on Monday.
Regards,
Cristian

-----Original Message-----
From: Martin Jansa [mailto:martin.jansa@gmail.com]=20
Sent: Friday, March 22, 2013 11:47 AM
To: openembedded-core@lists.openembedded.org; Iorga, Cristian
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Cristian Iorga : connman: upgrade to 1.12

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
> > - 0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch no=20
> > longer needed; fix included in package source code
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
> > diff --git a/meta/recipes-connectivity/connman/connman.inc=20
> > b/meta/recipes-connectivity/connman/connman.inc
> > index db4d26c..04b21f7 100644
> > --- a/meta/recipes-connectivity/connman/connman.inc
> > +++ b/meta/recipes-connectivity/connman/connman.inc
> > @@ -20,7 +20,7 @@ DEPENDS  =3D "dbus glib-2.0 ppp iptables gnutls \
> >              ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} =
\
> >              "
> > =20
> > -INC_PR =3D "r18"
> > +INC_PR =3D "r0"
>=20
> If this .inc file is reused by some other connman versions (e.g. .bb=20
> in other layers) this will make PR going backwards for them.
>=20
> It's OK to reset PR when changing PV, but please don't reset INC_PR too.

ping

>=20
> >  TIST =3D "--enable-tist"
> >  TIST_powerpc =3D ""
> > diff --git=20
> > a/meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-
> > is-no-d_type-support-use-fstatat.patch=20
> > b/meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-
> > is-no-d_type-support-use-fstatat.patch
> > deleted file mode 100644
> > index 7315545..0000000
> > ---=20
> > a/meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-
> > is-no-d_type-support-use-fstatat.patch
> > +++ /dev/null
> > @@ -1,55 +0,0 @@
> > -From 7007ef32a959ac4717c19339a24fd90a68638a19 Mon Sep 17 00:00:00=20
> > 2001
> > -From: Andrei Gherzan <andrei@gherzan.ro>
> > -Date: Tue, 17 Jul 2012 16:07:17 +0300
> > -Subject: [PATCH V3 2/2] storage.c: If there is no d_type support=20
> > use
> > - fstatat()
> > -
> > -This is useful for filesystems where d_type is always DT_UNKNOWN.
> > -In this case use fstatat() function.
> > -
> > -Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> > -Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> > -Upstream-Status: Submitted
> > -
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
> > diff --git a/meta/recipes-connectivity/connman/connman_1.10.bb=20
> > b/meta/recipes-connectivity/connman/connman_1.12.bb
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
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-com
> > mits
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


