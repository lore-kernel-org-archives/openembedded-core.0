Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id C79D876248;
	Wed, 29 Jul 2015 15:01:41 +0000 (UTC)
Received: by wibud3 with SMTP id ud3so30354866wib.0;
	Wed, 29 Jul 2015 08:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MsEP/r+i3WS9GeQK0+W4RJ5YdCDyQN9PY5ujttTYtJ4=;
	b=DwW4PIvW6my39cwb5gV9vvh5fjtSS6mhmtttOC9qMMJBho0vEEpwgwOFfO2xRjV7IJ
	5wyj1ZWmv68i5o4zb7Kzdbj1kbQipArh58vAKhP6fEbigDp7/1ibkyQGCsjSyM5JeKm2
	5L0FxSAcSo2cKQb8iRUY18g7q9bqmUH25V2ZXH7m69Ri/TKMOrbtdNUSnWvPBeGQYiQl
	iDm3GJeGWBSd/bUbzeOA3ijTly8ZnCz+vbqQyFenbLXbysxMzD25rftg75fMSvWzDzAm
	7cTxc74LMF4cVlw7K2hprvnYzm1pr2TSbml0Z49voPBHOH8Lri/eMabgzZvOVv+pDGY6
	rMHw==
X-Received: by 10.180.77.193 with SMTP id u1mr6824869wiw.50.1438182101655;
	Wed, 29 Jul 2015 08:01:41 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ul1sm38982736wjc.30.2015.07.29.08.01.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jul 2015 08:01:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 29 Jul 2015 17:01:50 +0200
To: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Message-ID: <20150729150150.GD12478@jama>
References: <20150720094146.26948504C1@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150720094146.26948504C1@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Ross Burton : gamin: remove
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
X-List-Received-Date: Wed, 29 Jul 2015 15:01:44 -0000
X-Groupsio-MsgNum: 68600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cHMo6Wbp1wrKhbfi"
Content-Disposition: inline

--cHMo6Wbp1wrKhbfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2015 at 09:41:46AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: d29595925b699827fbd3279ee5368e32e0a380f3
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Dd29595925b699827fbd3279ee5368e32e0a380f3
>=20
> Author: Ross Burton <ross.burton@intel.com>
> Date:   Thu Jul 16 23:24:06 2015 +0100
>=20
> gamin: remove
>=20
> Gamin hasn't been required for many years now, maintenance upstream stopp=
ed in
> 2008 and the addition of inotify to the kernel made it redundant.
>=20
> Remove the recipe from oe-core, and references to it in pacakgegroup-core=
-lsb
> (LSB doesn't require gamin) and packagegroup-self-hosted.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Someone interested in fixing tracer recipe?

NOTE: Resolving any missing task queue dependencies
ERROR: Nothing PROVIDES 'gamin' (but /home/jenkins/oe/world/shr-core/meta-o=
penembedded/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb DEPENDS on=
 or otherwise requires it)

>=20
> ---
>=20
>  .../packagegroups/packagegroup-self-hosted.bb      |  1 -
>  .../gamin-0.1.10/obsolete_automake_macros.patch    | 23 ---------
>  .../gamin/gamin/no-abstract-sockets.patch          | 56 ----------------=
----
>  meta/recipes-extended/gamin/gamin/noconst.patch    | 59 ----------------=
------
>  meta/recipes-extended/gamin/gamin_0.1.10.bb        | 36 -------------
>  .../packagegroups/packagegroup-core-lsb.bb         |  1 -
>  6 files changed, 176 deletions(-)
>=20
> diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb =
b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> index 531f729..7d5a41a 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> @@ -118,7 +118,6 @@ RDEPENDS_packagegroup-self-hosted-extended =3D "\
>      diffutils \
>      elfutils \
>      expat \
> -    gamin \
>      gawk \
>      gdbm \
>      gettext \
> diff --git a/meta/recipes-extended/gamin/gamin-0.1.10/obsolete_automake_m=
acros.patch b/meta/recipes-extended/gamin/gamin-0.1.10/obsolete_automake_ma=
cros.patch
> deleted file mode 100644
> index c4300ca..0000000
> --- a/meta/recipes-extended/gamin/gamin-0.1.10/obsolete_automake_macros.p=
atch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=
=3D693449]
> -
> -Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> -diff -Nurd gamin-0.1.10/configure.in gamin-0.1.10/configure.in
> ---- gamin-0.1.10/configure.in	2008-11-24 17:23:06.000000000 +0200
> -+++ gamin-0.1.10/configure.in	2013-02-08 23:11:59.656279992 +0200
> -@@ -1,7 +1,7 @@
> - dnl Process this file with autoconf to produce a configure script.
> - AC_PREREQ(2.52)
> - AC_INIT(libgamin)
> --AM_CONFIG_HEADER(config.h)
> -+AC_CONFIG_HEADERS(config.h)
> - AC_CANONICAL_SYSTEM
> -
> - # get any external flags setting before we start playing with the CFLAG=
S variable
> -@@ -31,7 +31,6 @@
> -
> - AC_USE_SYSTEM_EXTENSIONS
> - AC_PROG_CC
> --AM_PROG_CC_STDC
> - AC_HEADER_STDC
> - AC_PROG_INSTALL
> - AC_PROG_MAKE_SET
> diff --git a/meta/recipes-extended/gamin/gamin/no-abstract-sockets.patch =
b/meta/recipes-extended/gamin/gamin/no-abstract-sockets.patch
> deleted file mode 100644
> index cddf2dc..0000000
> --- a/meta/recipes-extended/gamin/gamin/no-abstract-sockets.patch
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> ---- /tmp/configure.in	2007-04-30 13:08:49.000000000 +0200
> -+++ gamin-0.1.8/configure.in	2007-04-30 13:10:53.285251000 +0200
> -@@ -354,51 +354,6 @@
> -     AC_DEFINE(HAVE_CMSGCRED,1,[Have cmsgcred structure])
> - fi
> -=20
> --#### Abstract sockets
> --
> --AC_MSG_CHECKING(abstract socket namespace)
> --AC_LANG_PUSH(C)
> --AC_RUN_IFELSE([AC_LANG_PROGRAM(
> --[[
> --#include <sys/types.h>
> --#include <stdlib.h>
> --#include <string.h>
> --#include <stdio.h>
> --#include <sys/socket.h>
> --#include <sys/un.h>
> --#include <errno.h>
> --]],
> --[[
> --  int listen_fd;
> --  struct sockaddr_un addr;
> -- =20
> --  listen_fd =3D socket (PF_UNIX, SOCK_STREAM, 0);
> -- =20
> --  if (listen_fd < 0)
> --    {
> --      fprintf (stderr, "socket() failed: %s\n", strerror (errno));
> --      exit (1);
> --    }
> --
> --  memset (&addr, '\0', sizeof (addr));
> --  addr.sun_family =3D AF_UNIX;
> --  strcpy (addr.sun_path, "X/tmp/dbus-fake-socket-path-used-in-configure=
-test");
> --  addr.sun_path[0] =3D '\0'; /* this is what makes it abstract */
> -- =20
> --  if (bind (listen_fd, (struct sockaddr*) &addr, SUN_LEN (&addr)) < 0)
> --    {
> --       fprintf (stderr, "Abstract socket namespace bind() failed: %s\n"=
,=20
> --                strerror (errno));
> --       exit (1);
> --    }
> --  else=20
> --    exit (0);
> --]])],
> --              [have_abstract_sockets=3Dyes],
> --              [have_abstract_sockets=3Dno])
> --AC_LANG_POP(C)
> --AC_MSG_RESULT($have_abstract_sockets)
> --
> - if test x$enable_abstract_sockets =3D xyes; then
> -     if test x$have_abstract_sockets =3D xno; then
> - 	AC_MSG_ERROR([Abstract sockets explicitly required, and support not de=
tected.])
> diff --git a/meta/recipes-extended/gamin/gamin/noconst.patch b/meta/recip=
es-extended/gamin/gamin/noconst.patch
> deleted file mode 100644
> index 7b2998c..0000000
> --- a/meta/recipes-extended/gamin/gamin/noconst.patch
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -G_CONST_RETURN is deprecated in glib 2.30 so remove to to avoid
> -build failures.
> -
> -RP 2011/10/12
> -
> -Upstream-Status: Pending
> -
> -Index: gamin-0.1.10/server/gam_node.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gamin-0.1.10.orig/server/gam_node.c	2011-10-12 15:25:45.217178314 +0=
100
> -+++ gamin-0.1.10/server/gam_node.c	2011-10-12 15:26:17.807178293 +0100
> -@@ -122,7 +122,7 @@
> -  * it has finished with the string.  If it must keep it longer, it
> -  * should makes its own copy.  The returned string must not be freed.
> -  */
> --G_CONST_RETURN char *
> -+const char *
> - gam_node_get_path(GamNode * node)
> - {
> -     g_assert(node);
> -Index: gamin-0.1.10/server/gam_node.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gamin-0.1.10.orig/server/gam_node.h	2011-10-12 15:25:46.857178269 +0=
100
> -+++ gamin-0.1.10/server/gam_node.h	2011-10-12 15:26:28.637178297 +0100
> -@@ -58,7 +58,7 @@
> - void                  gam_node_set_is_dir          (GamNode         *no=
de,
> - 						   gboolean        is_dir);
> - =09
> --G_CONST_RETURN char  *gam_node_get_path            (GamNode         *no=
de);
> -+const char  *gam_node_get_path            (GamNode         *node);
> -=20
> - GList                *gam_node_get_subscriptions   (GamNode         *no=
de);
> -=20
> -Index: gamin-0.1.10/server/gam_subscription.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gamin-0.1.10.orig/server/gam_subscription.c	2011-10-12 15:25:40.4971=
77525 +0100
> -+++ gamin-0.1.10/server/gam_subscription.c	2011-10-12 15:26:39.867178304=
 +0100
> -@@ -141,7 +141,7 @@
> -  * @param sub the GamSubscription
> -  * @returns The path being monitored.  It should not be freed.
> -  */
> --G_CONST_RETURN char *
> -+const char *
> - gam_subscription_get_path(GamSubscription * sub)
> - {
> -     if (sub =3D=3D NULL)
> -Index: gamin-0.1.10/server/gam_subscription.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gamin-0.1.10.orig/server/gam_subscription.h	2011-10-12 15:25:28.5071=
78266 +0100
> -+++ gamin-0.1.10/server/gam_subscription.h	2011-10-12 15:25:58.817178285=
 +0100
> -@@ -21,7 +21,7 @@
> -=20
> - int                  gam_subscription_get_reqno    (GamSubscription *su=
b);
> -=20
> --G_CONST_RETURN char *gam_subscription_get_path     (GamSubscription *su=
b);
> -+const char *gam_subscription_get_path     (GamSubscription *sub);
> -=20
> - GamListener         *gam_subscription_get_listener (GamSubscription *su=
b);
> -=20
> diff --git a/meta/recipes-extended/gamin/gamin_0.1.10.bb b/meta/recipes-e=
xtended/gamin/gamin_0.1.10.bb
> deleted file mode 100644
> index 375d265..0000000
> --- a/meta/recipes-extended/gamin/gamin_0.1.10.bb
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -SUMMARY =3D "Gamin the File Alteration Monitor"
> -DESCRIPTION =3D "Gamin is a file and directory monitoring system defined=
 to \
> -be a subset of the FAM (File Alteration Monitor) system."
> -HOMEPAGE =3D "http://people.gnome.org/~veillard/gamin/"
> -
> -LICENSE =3D "LGPLv2+"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D412a9be54757a155d0b997b52b519=
f62"
> -
> -DEPENDS =3D "glib-2.0"
> -PROVIDES =3D "fam"
> -PR =3D "r5"
> -
> -SRC_URI =3D "http://www.gnome.org/~veillard/gamin/sources/gamin-${PV}.ta=
r.gz \
> -           file://no-abstract-sockets.patch \
> -           file://noconst.patch \
> -           file://obsolete_automake_macros.patch \
> -"
> -
> -SRC_URI[md5sum] =3D "b4ec549e57da470c04edd5ec2876a028"
> -SRC_URI[sha256sum] =3D "28085f0ae8be10eab582ff186af4fb0be92cc6c62b5cc19c=
d09b295c7c2899a1"
> -
> -inherit autotools pkgconfig
> -
> -EXTRA_OECONF =3D "--without-python"
> -
> -PACKAGES +=3D "lib${BPN} lib${BPN}-dev"
> -FILES_${PN} =3D "${libexecdir}"
> -FILES_${PN}-dbg +=3D "${libexecdir}/.debug"
> -FILES_lib${BPN} =3D "${libdir}/lib*.so.*"
> -FILES_lib${BPN}-dev =3D "${includedir} ${libdir}/pkgconfig ${libdir}/lib=
*.la \
> -                      ${libdir}/lib*.a ${libdir}/lib*.so"
> -
> -RDEPENDS_lib${BPN} =3D "${PN}"
> -
> -LEAD_SONAME =3D "libgamin-1.so"
> -
> diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb=
 b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> index 3cb2305..ce82385 100644
> --- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> +++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> @@ -55,7 +55,6 @@ RDEPENDS_packagegroup-core-lsb =3D "\
>  RDEPENDS_packagegroup-core-sys-extended =3D "\
>      curl \
>      dhcp-client \
> -    gamin \
>      hdparm \
>      lighttpd \
>      libaio \
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cHMo6Wbp1wrKhbfi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlW46t4ACgkQN1Ujt2V2gBxXlQCggFrS6DMjC9OFMUc04CnFvKr7
jOkAn3ulal2B//3C4v8JZJE5gD6HgDJi
=9MY3
-----END PGP SIGNATURE-----

--cHMo6Wbp1wrKhbfi--
