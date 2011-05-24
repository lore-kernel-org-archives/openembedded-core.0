Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QOiOd-0002Gd-Id
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 05:35:03 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 May 2011 20:32:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,259,1304319600"; 
   d="scan'208";a="3704548"
Received: from orsmsx602.amr.corp.intel.com ([10.22.226.211])
	by orsmga001.jf.intel.com with ESMTP; 23 May 2011 20:32:01 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.226.128) by
	orsmsx602.amr.corp.intel.com (10.22.226.211) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 23 May 2011 20:32:01 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx606.amr.corp.intel.com ([10.22.226.128]) with mapi;
	Mon, 23 May 2011 20:32:00 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: "Wold, Saul" <saul.wold@intel.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Date: Mon, 23 May 2011 20:31:59 -0700
Thread-Topic: [OE-core] [UPGRADES 1/5] git: upgrade from 1.7.4.3 to 1.7.5.1
Thread-Index: AcwZwvi6SemM+8RsSFabdw5THh1S7AAAA++w
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94D8C1CA03@orsmsx504.amr.corp.intel.com>
References: <cover.1306198151.git.nitin.a.kamble@intel.com>
	<c58247a71045c56297c2312e91eff6f17f3c2d7d.1306198151.git.nitin.a.kamble@intel.com>
	<4DDB265A.7000306@intel.com>
In-Reply-To: <4DDB265A.7000306@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [UPGRADES 1/5] git: upgrade from 1.7.4.3 to 1.7.5.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 May 2011 03:35:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> >
> No comments about what's different that allowed you to remove the patch
>=20
> Sau!

Ohh, I missed that. The patch/es were removed because the code was upstream=
 already.

Thanks,
Nitin

>=20
> > Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
> > ---
> >   meta/recipes-devtools/git/files/autotools.patch    |   16 ---------
> -------
> >   meta/recipes-devtools/git/git.inc                  |    3 +--
> >   .../git/{git_1.7.4.3.bb =3D>  git_1.7.5.1.bb}         |    6 +++---
> >   3 files changed, 4 insertions(+), 21 deletions(-)
> >   delete mode 100644 meta/recipes-devtools/git/files/autotools.patch
> >   rename meta/recipes-devtools/git/{git_1.7.4.3.bb =3D>
> git_1.7.5.1.bb} (56%)
> >
> > diff --git a/meta/recipes-devtools/git/files/autotools.patch
> b/meta/recipes-devtools/git/files/autotools.patch
> > deleted file mode 100644
> > index cb21193..0000000
> > --- a/meta/recipes-devtools/git/files/autotools.patch
> > +++ /dev/null
> > @@ -1,16 +0,0 @@
> > -Upstream-Status:Inappropriate [configuration]
> > -
> > -Index: git-1.7.2.1/configure.ac
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- git-1.7.2.1.orig/configure.ac	2010-07-28 18:03:43.000000000
> +0100
> > -+++ git-1.7.2.1/configure.ac	2010-08-13 14:54:29.181971250 +0100
> > -@@ -697,7 +697,8 @@
> > - 		else if (strcmp(buf, "12345"))
> > - 		  return 2;]])],
> > - 	[ac_cv_c_c99_format=3Dyes],
> > --	[ac_cv_c_c99_format=3Dno])
> > -+	[ac_cv_c_c99_format=3Dno],
> > -+	[ac_cv_c_c99_format=3Dyes])
> > - ])
> > - if test $ac_cv_c_c99_format =3D no; then
> > - 	NO_C99_FORMAT=3DYesPlease
> > diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-
> devtools/git/git.inc
> > index 49292fa..c884f9c 100644
> > --- a/meta/recipes-devtools/git/git.inc
> > +++ b/meta/recipes-devtools/git/git.inc
> > @@ -3,8 +3,7 @@ SECTION =3D "console/utils"
> >   LICENSE =3D "GPLv2"
> >   DEPENDS =3D "perl-native openssl curl zlib expat"
> >
> > -SRC_URI =3D "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.bz2 \
> > -           file://autotools.patch;patch=3D1"
> > +SRC_URI =3D "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.bz2 "
> >   S =3D "${WORKDIR}/git-${PV}"
> >
> >   LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D7c0d7ef03a7eb04ce795b0f60e68e7e1"
> > diff --git a/meta/recipes-devtools/git/git_1.7.4.3.bb b/meta/recipes-
> devtools/git/git_1.7.5.1.bb
> > similarity index 56%
> > rename from meta/recipes-devtools/git/git_1.7.4.3.bb
> > rename to meta/recipes-devtools/git/git_1.7.5.1.bb
> > index 45ef61b..bfdbf62 100644
> > --- a/meta/recipes-devtools/git/git_1.7.4.3.bb
> > +++ b/meta/recipes-devtools/git/git_1.7.5.1.bb
> > @@ -1,10 +1,10 @@
> >   require git.inc
> >
> > -PR =3D "r2"
> > +PR =3D "r0"
> >
> >   EXTRA_OECONF +=3D "ac_cv_snprintf_returns_bogus=3Dno
> ac_cv_c_c99_format=3Dyes \
> >
> ac_cv_fread_reads_directories=3D${ac_cv_fread_reads_directories=3Dyes} \
> >                    "
> >
> > -SRC_URI[md5sum] =3D "da6c8f4967393342a4397b955db72cb1"
> > -SRC_URI[sha256sum] =3D
> "44b3ebc87d83b34468718fb6fa424420877e1f66c190389d693d090662a3556d"
> > +SRC_URI[md5sum] =3D "a49291116e3b0564e069ae989e4db6fb"
> > +SRC_URI[sha256sum] =3D
> "a1d4a1c59300e68fbc493a2cbe9257048d4d6f4363924bf34f38c413a825f80c"



