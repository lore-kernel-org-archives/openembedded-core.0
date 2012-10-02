Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TJ4dq-00058N-Nw
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 17:44:14 +0200
Received: by wibhj13 with SMTP id hj13so863877wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Oct 2012 08:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AamEmknCeqoCK/wANMbz6oddZi6MNyjIcWDA6WGdCGY=;
	b=bYLgV8eJ2pi+5P24HJCTnluGxr3IQ9Yqn0kOnZ6KQ1aQMmhnVPtgVMW778pb0+hQUK
	DeIdB5tbaT93iPtvhkPwpNRolSVmjzNjpHZlrPdgVqJaUw6KY1rFjV7mHBxt6Mi9rLVZ
	RUMgN4HPYcqaTrqZ+sJY3tFAIaB5PV+51zM/Csh3PeEJkfo2RS1eecoYgG2bU9K1pfOs
	H1ggTptarpYzJCf0WTBaZtF7fHI/yauf8de0AeCOyKtMw8rpi1Nq9JosXuSdHJ74qlgO
	LlMV0c/TkGzt4Wsd64zk5mcfgMjmGNaeANHSTdixQYe46HdMarfAyv/rg9WHjCitAoLA
	m/yQ==
Received: by 10.180.108.45 with SMTP id hh13mr22705453wib.15.1349191876068;
	Tue, 02 Oct 2012 08:31:16 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k20sm22065119wiv.11.2012.10.02.08.31.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 02 Oct 2012 08:31:14 -0700 (PDT)
Date: Tue, 2 Oct 2012 17:31:13 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Andrei Dinu <andrei.adrianx.dinu@intel.com>
Message-ID: <20121002153113.GH3454@jama.jama.net>
References: <1349191571-26375-1-git-send-email-andrei.adrianx.dinu@intel.com>
MIME-Version: 1.0
In-Reply-To: <1349191571-26375-1-git-send-email-andrei.adrianx.dinu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gypsy: moved to meta-oe/recipes-connectivty
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
X-List-Received-Date: Tue, 02 Oct 2012 15:44:14 -0000
X-Groupsio-MsgNum: 30242
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="54u2kuW9sGWg/X+X"
Content-Disposition: inline

--54u2kuW9sGWg/X+X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 02, 2012 at 06:26:11PM +0300, Andrei Dinu wrote:
> Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>

This should be sent to openembedded-devel ML with meta-oe prefix like
meta-oe README says.

Cheers,

> ---
>  ...gypsy-m4-directory-missing-from-structure.patch |   23 ++++++++++++++=
++++++
>  .../recipes-connectivity/gypsy/files/fixups.patch  |   21 ++++++++++++++=
++++
>  meta-oe/recipes-connectivity/gypsy/gypsy.inc       |   15 +++++++++++++
>  meta-oe/recipes-connectivity/gypsy/gypsy_git.bb    |   19 ++++++++++++++=
++
>  4 files changed, 78 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/gypsy/files/0001-gypsy-m=
4-directory-missing-from-structure.patch
>  create mode 100644 meta-oe/recipes-connectivity/gypsy/files/fixups.patch
>  create mode 100644 meta-oe/recipes-connectivity/gypsy/gypsy.inc
>  create mode 100644 meta-oe/recipes-connectivity/gypsy/gypsy_git.bb
>=20
> diff --git a/meta-oe/recipes-connectivity/gypsy/files/0001-gypsy-m4-direc=
tory-missing-from-structure.patch b/meta-oe/recipes-connectivity/gypsy/file=
s/0001-gypsy-m4-directory-missing-from-structure.patch
> new file mode 100644
> index 0000000..5cb491b
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/gypsy/files/0001-gypsy-m4-directory-mi=
ssing-from-structure.patch
> @@ -0,0 +1,23 @@
> +From 472c465dad27f79e8340e99c9f68cdfa9d2b1809 Mon Sep 17 00:00:00 2001
> +From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> +Date: Tue, 2 Oct 2012 16:36:12 +0300
> +Subject: [PATCH] gypsy : m4 directory missing from structure
> +
> +gypsy won't compile without the m4/ directory, so i created it.
> +
> +Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> +---
> + m4/.gitignore |    1 +
> + 1 file changed, 1 insertion(+)
> + create mode 100644 m4/.gitignore
> +
> +diff --git a/m4/.gitignore b/m4/.gitignore
> +new file mode 100644
> +index 0000000..72e8ffc
> +--- /dev/null
> ++++ b/m4/.gitignore
> +@@ -0,0 +1 @@
> ++*
> +--=20
> +1.7.9.5
> +
> diff --git a/meta-oe/recipes-connectivity/gypsy/files/fixups.patch b/meta=
-oe/recipes-connectivity/gypsy/files/fixups.patch
> new file mode 100644
> index 0000000..de4d92e
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/gypsy/files/fixups.patch
> @@ -0,0 +1,21 @@
> +Upstream-Status: Inappropriate [configuration]
> +
> +---
> + docs/reference/Makefile.am |    2 ++
> + 1 file changed, 2 insertions(+)
> +
> +--- gypsy.orig/docs/reference/Makefile.am
> ++++ gypsy/docs/reference/Makefile.am
> +@@ -81,10 +81,12 @@ expand_content_files=3D
> + # e.g. GTKDOC_LIBS=3D$(top_builddir)/gtk/$(gtktargetlib)
> +=20
> + INCLUDES=3D-I$(top_srcdir) $(GYPSY_CFLAGS)
> + GTKDOC_LIBS=3D$(top_builddir)/gypsy/libgypsy.la $(GYPSY_LIBS)
> +=20
> ++EXTRA_DIST =3D
> ++CLEANFILES =3D
> + # This includes the standard gtk-doc make rules, copied by gtkdocize.
> + include $(top_srcdir)/gtk-doc.make
> +=20
> + # Other files to distribute
> + # e.g. EXTRA_DIST +=3D version.xml.in
> diff --git a/meta-oe/recipes-connectivity/gypsy/gypsy.inc b/meta-oe/recip=
es-connectivity/gypsy/gypsy.inc
> new file mode 100644
> index 0000000..0c1735e
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/gypsy/gypsy.inc
> @@ -0,0 +1,15 @@
> +SUMMARY =3D "GPS Multiplexing Daemon"
> +DESCRIPTION =3D "Gypsy is a GPS multiplexing daemon which allows \
> +multiple clients to access GPS data from multiple GPS sources \
> +concurrently.  Gypsy also hides the details of parsing NMEA from the \
> +client applications, passing the data as simple values for the clients \
> +to use."
> +LICENSE =3D "GPLv2.0 & LGPLv2.1"
> +SECTION =3D "x11"
> +DEPENDS =3D "glib-2.0 dbus bluez4 dbus-glib"
> +
> +inherit autotools pkgconfig gtk-doc
> +
> +EXTRA_OECONF +=3D "--with-distro=3Ddebian"
> +
> +FILES_${PN} +=3D "/usr/share/dbus-1/services/"
> diff --git a/meta-oe/recipes-connectivity/gypsy/gypsy_git.bb b/meta-oe/re=
cipes-connectivity/gypsy/gypsy_git.bb
> new file mode 100644
> index 0000000..15f6c9b
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/gypsy/gypsy_git.bb
> @@ -0,0 +1,19 @@
> +require gypsy.inc
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +SRCREV =3D "be8c9c382d2d1d37b51d29b0843045121ec90213"
> +PV =3D "0.8+git${SRCPV}"
> +PR =3D "r2"
> +
> +S =3D "${WORKDIR}/git"
> +
> +LICENSE =3D "GPLv2+ & LGPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe \
> +                    file://COPYING.lib;md5=3D7fbc338309ac38fefcd64b04bb9=
03e34 \
> +                    file://src/main.c;beginline=3D1;endline=3D25;md5=3D3=
fe64e27e61b289b77383a54a982cbdd \
> +                    file://gypsy/gypsy-time.h;beginline=3D1;endline=3D24=
;md5=3D06432ea19a7b6607428d04d9dadc37fd"
> +
> +SRC_URI =3D "git://anongit.freedesktop.org/gypsy;protocol=3Dgit \
> +           file://fixups.patch \
> +           file://0001-gypsy-m4-directory-missing-from-structure.patch"
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--54u2kuW9sGWg/X+X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBrCMEACgkQN1Ujt2V2gBwCmACgunz79PYnJsrqN9K1FIik40Pd
gcYAn34HsbvK/6wxSAC3VYH3UBLuLO+6
=Sx7T
-----END PGP SIGNATURE-----

--54u2kuW9sGWg/X+X--
