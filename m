Return-Path: <prvs=031a76740=Mikko.Rapeli@bmw.de>
Received: from esa2.bmw.c3s2.iphmx.com (esa2.bmw.c3s2.iphmx.com
	[68.232.133.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3782C7D44A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 10:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1557917990; x=1589453990;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=DX1bINOFDaU3GhO7vDjR3QKsK5yr1NpRfckL85ZT3bo=;
	b=qOAdJpMn5yH+L1KsKhccbugJoc6umvy6F82fVLW/doEU+ibC554NJt+r
	4JSHKnbdf47nks4vkmu0fYkAn+v6b6rMln0mk1GV7oXZ8TX6z15ahd7Fs
	ezaFA69SrSLKu63C2Wy9hV9PQVRxy5Bs6UojPeAxvrcPY7SfQUWwJETt5 w=;
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
	esa2.bmw.c3s2.iphmx.com with ESMTP/TLS; 15 May 2019 12:59:48 +0200
Received: from esabb3.muc ([160.50.100.30])  by esagw4.muc with ESMTP/TLS;
	15 May 2019 12:59:47 +0200
Received: from smucm10l.bmwgroup.net (HELO smucm10l.europe.bmw.corp)
	([160.48.96.48])
	by esabb3.muc with ESMTP/TLS; 15 May 2019 12:59:47 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10l.europe.bmw.corp
	(160.48.96.48) with Microsoft SMTP Server (TLS;
	Wed, 15 May 2019 12:59:46 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.004;
	Wed, 15 May 2019 12:59:47 +0200
From: <Mikko.Rapeli@bmw.de>
To: <martin.jansa@gmail.com>
Thread-Topic: [OE-core] [PATCH] elfutils: remove Elfutils-Exception and
	include GPLv2 for shared libraries
Thread-Index: AQHU8H/bzc19XskuBk2DCq6mfbh1xqZsFmcAgAABrwA=
Date: Wed, 15 May 2019 10:59:46 +0000
Message-ID: <20190515105946.GD3459@hiutale>
References: <1554998483-26536-1-git-send-email-mikko.rapeli@bmw.de>
	<CA+chaQdCSbEj1PnfEkCPvMV8VAgsmFTWJHyyBwP-rwLvjAxzhA@mail.gmail.com>
In-Reply-To: <CA+chaQdCSbEj1PnfEkCPvMV8VAgsmFTWJHyyBwP-rwLvjAxzhA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.46]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] elfutils: remove Elfutils-Exception and include GPLv2 for shared libraries
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
X-List-Received-Date: Wed, 15 May 2019 10:59:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DA89B9F4BD2C06488205D0AE85E47039@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, May 15, 2019 at 12:53:44PM +0200, Martin Jansa wrote:
> Can we restore meta/files/common-licenses/Elfutils-Exception in oe-core t=
o
> be used by meta-gplv2 version:
>=20
> recipes-devtools/elfutils/elfutils_0.148.bb:LICENSE =3D "(GPL-2+ &
> Elfutils-Exception)"
> causing:
> do_rootfs: The license listed Elfutils-Exception was not in the licenses
> collected for recipe elfutils
>=20
> or should I send patch for meta-gplv2 to restore it there together with
> another LICENSE_PATH +=3D "${LAYERDIR}/licenses"?

I would do the latter and add the license to meta-gplv2.

-Mikko

> On Thu, Apr 11, 2019 at 6:01 PM Mikko Rapeli <mikko.rapeli@bmw.de> wrote:
>=20
> > Elfutils-Exception no longer exists after upstream release 0.154
> > and commit:
> >
> > commit de2ed97f33139af5c7a0811e4ec66fc896a13cf2
> > Author: Mark Wielaard <mjw@redhat.com>
> > Date:   Tue Jun 5 17:15:16 2012 +0200
> >
> > NEWS file in the sources says this about switch from GPLv2 to
> > GPLv3 license:
> >
> >
> > https://sourceware.org/git/?p=3Delfutils.git;a=3Dblob;f=3DNEWS;h=3D5a06=
047f255e3c9a63828953759fd18a4ba9a3f3;hb=3DHEAD#l362
> >
> >  362 The license is now GPLv2/LGPLv3+ for the libraries and GPLv3+ for
> > stand-alone
> >  363 programs. There is now also a formal CONTRIBUTING document describ=
ing
> > how to
> >  364 submit patches.
> >
> > libasm, libdw and libelf are thus covered optionally by GPLv2 license.
> >
> > See also Debian copyright summary for elfutils:
> >
> > https://tracker.debian.org/media/packages/e/elfutils/copyright-0.176-1
> >
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> > ---
> >  meta/conf/licenses.conf                          |  2 +-
> >  meta/files/common-licenses/Elfutils-Exception    | 12 ------------
> >  meta/recipes-devtools/elfutils/elfutils_0.176.bb | 14 +++++++++++++-
> >  3 files changed, 14 insertions(+), 14 deletions(-)
> >  delete mode 100644 meta/files/common-licenses/Elfutils-Exception
> >
> > v1:
> > http://lists.openembedded.org/pipermail/openembedded-core/2019-April/28=
1124.html
> >
> > v2:
> > http://lists.openembedded.org/pipermail/openembedded-core/2019-April/28=
1127.html
> >  * removed Elfutils-Exception
> >
> > v3:
> > http://lists.openembedded.org/pipermail/openembedded-core/2019-April/28=
1137.html
> >  * rebase to latest master branch with elfutils 0.176
> >
> > v4:
> >  * fixed typo in comment; GPLv3+ -> LGPLv3+
> >  * update commit message Debian copyright URL to same 0.176 version
> >
> > diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
> > index 1058084..7b01c57 100644
> > --- a/meta/conf/licenses.conf
> > +++ b/meta/conf/licenses.conf
> > @@ -16,7 +16,7 @@ SRC_DISTRIBUTE_LICENSES +=3D "CC-BY-SA-1.0 CC-BY-SA-2=
.0
> > CC-BY-SA-2.5 CC-BY-SA-3.0
> >  SRC_DISTRIBUTE_LICENSES +=3D "CDDL-1.0 CECILL-1.0 CECILL-2.0 CECILL-B
> > CECILL-C"
> >  SRC_DISTRIBUTE_LICENSES +=3D "ClArtistic CPAL-1.0 CPL-1.0 CUA-OPL-1.0 =
DSSSL"
> >  SRC_DISTRIBUTE_LICENSES +=3D "ECL-1.0 ECL-2.0 eCos-2.0 EDL-1.0 EFL-1.0
> > EFL-2.0"
> > -SRC_DISTRIBUTE_LICENSES +=3D "Elfutils-Exception Entessa EPL-1.0 EPL-2=
.0
> > ErlPL-1.1"
> > +SRC_DISTRIBUTE_LICENSES +=3D "Entessa EPL-1.0 EPL-2.0 ErlPL-1.1"
> >  SRC_DISTRIBUTE_LICENSES +=3D "EUDatagrid EUPL-1.0 EUPL-1.1 Fair
> > Frameworx-1.0"
> >  SRC_DISTRIBUTE_LICENSES +=3D "FreeType GFDL-1.1 GFDL-1.2 GFDL-1.3 GPL-=
1.0"
> >  SRC_DISTRIBUTE_LICENSES +=3D "GPL-2.0 GPL-2.0-with-autoconf-exception"
> > diff --git a/meta/files/common-licenses/Elfutils-Exception
> > b/meta/files/common-licenses/Elfutils-Exception
> > deleted file mode 100644
> > index 627d769..0000000
> > --- a/meta/files/common-licenses/Elfutils-Exception
> > +++ /dev/null
> > @@ -1,12 +0,0 @@
> > -   This file describes the limits of the Exception under which you are
> > allowed
> > -   to distribute Non-GPL Code in linked combination with Red Hat elfut=
ils.
> > -   For the full text of the license, please see one of the header file=
s
> > -   included with the source distribution or the file COPYING found in =
the
> > -   top level directory of the source.
> > -
> > -   The Approved Interfaces are the functions declared in the files:
> > -
> > -   libelf.h
> > -   libdw.h
> > -   libdwfl.h
> > -
> > diff --git a/meta/recipes-devtools/elfutils/elfutils_0.176.bb
> > b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
> > index fd901c9..4602544 100644
> > --- a/meta/recipes-devtools/elfutils/elfutils_0.176.bb
> > +++ b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
> > @@ -1,7 +1,7 @@
> >  SUMMARY =3D "Utilities and libraries for handling compiled object file=
s"
> >  HOMEPAGE =3D "https://sourceware.org/elfutils"
> >  SECTION =3D "base"
> > -LICENSE =3D "(GPLv3 & Elfutils-Exception)"
> > +LICENSE =3D "GPLv2 & LGPLv3+ & GPLv3+"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47f=
ae504"
> >  DEPENDS =3D "libtool bzip2 zlib virtual/libintl"
> >  DEPENDS_append_libc-musl =3D " argp-standalone fts "
> > @@ -53,6 +53,18 @@ BBCLASSEXTEND =3D "native nativesdk"
> >
> >  # Package utilities separately
> >  PACKAGES =3D+ "${PN}-binutils libelf libasm libdw"
> > +
> > +# shared libraries are licensed GPLv2 or LGPLv3+, binaries GPLv3+
> > +# according to NEWS file:
> > +# "The license is now GPLv2/LGPLv3+ for the libraries and GPLv3+ for
> > stand-alone
> > +# programs. There is now also a formal CONTRIBUTING document describin=
g
> > how to
> > +# submit patches."
> > +LICENSE_${PN}-binutils =3D "GPLv3+"
> > +LICENSE_${PN} =3D "GPLv3+"
> > +LICENSE_libelf =3D "GPLv2 | LGPLv3+"
> > +LICENSE_libasm =3D "GPLv2 | LGPLv3+"
> > +LICENSE_libdw =3D "GPLv2 | LGPLv3+"
> > +
> >  FILES_${PN}-binutils =3D "\
> >      ${bindir}/eu-addr2line \
> >      ${bindir}/eu-ld \
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >=

