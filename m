Return-Path: <prvs=9974216f9=Mikko.Rapeli@bmw.de>
Received: from esa8.bmw.c3s2.iphmx.com (esa8.bmw.c3s2.iphmx.com
	[68.232.139.97])
	by mail.openembedded.org (Postfix) with ESMTP id 261E86D3B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 11:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1554980527; x=1586516527;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-id:content-transfer-encoding:mime-version;
	bh=YTCFrEFJvkFl54ix856oIgiAazi5MkyMxuXboLFl7ng=;
	b=HsSCXVExUyyLByDPA9xEAAy4cqHWDuz8qKkv1YqEUZncqbZCFagTeMCu
	RJl/4sKGI+f8IJyG7rPluEzN0lPnPN5OazwRbDKim5ydh7/R/8QlCJVuJ
	eS/Vakvz4/0bvJnJ6iISWrYAZRRYi3eLJwMtgLlujCoVeHWMTkA/PxEx2 E=;
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
	esa8.bmw.c3s2.iphmx.com with ESMTP/TLS; 11 Apr 2019 13:02:01 +0200
Received: from esabb3.muc ([160.50.100.30])  by esagw6.muc with ESMTP/TLS;
	11 Apr 2019 13:02:00 +0200
Received: from smucm10l.bmwgroup.net (HELO smucm10l.europe.bmw.corp)
	([160.48.96.48])
	by esabb3.muc with ESMTP/TLS; 11 Apr 2019 13:02:00 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10l.europe.bmw.corp
	(160.48.96.48) with Microsoft SMTP Server (TLS;
	Thu, 11 Apr 2019 13:02:00 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.003;
	Thu, 11 Apr 2019 13:02:00 +0200
From: <Mikko.Rapeli@bmw.de>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] elfutils: update LICENSE to include GPLv2 for
	shared libraries
Thread-Index: AQHU8EvHwq5Kg0KcjU+j6ELZHJRqhqY2o+YAgAAF9AA=
Date: Thu, 11 Apr 2019 11:02:00 +0000
Message-ID: <20190411110200.GG20077@hiutale>
References: <1554976120-21849-1-git-send-email-mikko.rapeli@bmw.de>
	<20190411104042.GE20077@hiutale>
In-Reply-To: <20190411104042.GE20077@hiutale>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.38]
MIME-Version: 1.0
Subject: Re: [PATCH] elfutils: update LICENSE to include GPLv2 for shared libraries
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
X-List-Received-Date: Thu, 11 Apr 2019 11:02:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7B3AB680A3C84A4FA36ACB09A8EEC9D2@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 10:40:43AM +0000, openembedded-core-bounces@lists.o=
penembedded.org wrote:
> On Thu, Apr 11, 2019 at 12:48:40PM +0300, Mikko Rapeli wrote:
> > NEWS file in the sources says this about switch from GPLv2 to
> > GPLv3 license:
> >=20
> > https://sourceware.org/git/?p=3Delfutils.git;a=3Dblob;f=3DNEWS;h=3D5a06=
047f255e3c9a63828953759fd18a4ba9a3f3;hb=3DHEAD#l362
> >=20
> >  362 The license is now GPLv2/LGPLv3+ for the libraries and GPLv3+ for =
stand-alone
> >  363 programs. There is now also a formal CONTRIBUTING document describ=
ing how to
> >  364 submit patches.
> >=20
> > libasm, libdw and libelf are thus covered optionally by GPLv2 license.
> >=20
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> > ---
> >  meta/recipes-devtools/elfutils/elfutils_0.175.bb | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/meta/recipes-devtools/elfutils/elfutils_0.175.bb b/meta/re=
cipes-devtools/elfutils/elfutils_0.175.bb
> > index b0b9ddc..6d1279a 100644
> > --- a/meta/recipes-devtools/elfutils/elfutils_0.175.bb
> > +++ b/meta/recipes-devtools/elfutils/elfutils_0.175.bb
> > @@ -1,7 +1,7 @@
> >  SUMMARY =3D "Utilities and libraries for handling compiled object file=
s"
> >  HOMEPAGE =3D "https://sourceware.org/elfutils"
> >  SECTION =3D "base"
> > -LICENSE =3D "(GPLv3 & Elfutils-Exception)"
> > +LICENSE =3D "(GPLv2 & LGPLv3+ & GPLv3+ & Elfutils-Exception)"
>=20
> Can anyone find the Elfutils-Exception in current 0.175 or sumo 0.170 sou=
rces?
>=20
> Debian is also listing libraries with GPLv2+ | LGPLv3+ and executables
> with GPLv3+ in
>=20
> https://tracker.debian.org/media/packages/e/elfutils/copyright-0.176-1
>=20
> Should I also drop the Elfutils-Exception?

I will send a new version which drops Elfutils-Exception since it no longer
exists after tag elfutils-0.154 and commit:

commit de2ed97f33139af5c7a0811e4ec66fc896a13cf2
Author: Mark Wielaard <mjw@redhat.com>
Date:   Tue Jun 5 17:15:16 2012 +0200

    Update name, license and contributor policy.
   =20
    * Change name from "Red Hat elfutils" to "elfutils".
    * Update license of standalone tools and test from GPLv2 to GPLv3+.
    * Change license of libraries from GPLv2+exception to GPLv2/LGPLv3+.
    * Add Developer Certificate of Origin based contributor policy.
   =20
    top-level:
   =20
    - COPYING: Upgraded from GPLv2 to GPLv3.
    - CONTRIBUTING, COPYING-GPLv2, COPYING-LGPLv3: New files.
    - NEWS: Added note about new contribution and license policy.
    - Makefile.am: Updated to GPLv3, added new files to EXTRA_DIST.
    - configure.ac: Update to GPLv3, changed AC_INIT name to 'elfutils'.
   =20
    backends, lib, libasm, libcpu, libdw, libdwfl, libebl, libelf:
   =20
    - All files updated to GPLv2/LGPLv3+. Except some very small files
      (<5 lines) which didn't have any headers at all before, the linker
      .maps files and the libcpu/defs files which only contain data and
      libelf/elf.h which comes from glibc and is under LGPLv2+.
   =20
    config:
   =20
    - elfutils.spec.in: Add new License: headers and new %doc files.
    - Update all license headers to GPLv2/LGPLv3+ for files used by libs.
   =20
    src, tests:
   =20
    - All files updated to GPLv3+. Except for the test bz2 data files, the
      linker maps and script files and some very small files (<5 lines)
      that don't have any headers.
   =20
    Signed-off-by: Richard Fontana <rfontana@redhat.com>
    Signed-off-by: Mark Wielaard <mjw@redhat.com>

-Mikko=

