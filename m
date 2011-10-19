Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RGZ2D-0005fv-U5
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 18:30:31 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Oct 2011 09:24:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="64787618"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by orsmga002.jf.intel.com with ESMTP; 19 Oct 2011 09:24:37 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.226.128) by
	orsmsx603.amr.corp.intel.com (10.22.226.49) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 19 Oct 2011 09:24:37 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx606.amr.corp.intel.com ([10.22.226.128]) with mapi;
	Wed, 19 Oct 2011 09:24:37 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 19 Oct 2011 09:24:34 -0700
Thread-Topic: [OE-core] [CONSOLIDATED PULL 14/16] distro-tracking:	update
	data for some toolchain recipes
Thread-Index: AcyOdySGWCKqb+8MTDmBWx/QkM4WRQABEfXg
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94E2F42F6A@orsmsx504.amr.corp.intel.com>
References: <cover.1319012721.git.sgw@linux.intel.com>
	<436a9b443962036ff35a5ffd86d80ad44350d5f2.1319012721.git.sgw@linux.intel.com>
	<758B37BA-B417-4B39-BF1C-0CEC613F067D@dominion.thruhere.net>
	<9DA5872FEF993D41B7173F58FCF6BE94E2F42EE2@orsmsx504.amr.corp.intel.com>
	<E8FAD09F-4767-4ACB-9588-EFC57570F176@dominion.thruhere.net>
In-Reply-To: <E8FAD09F-4767-4ACB-9588-EFC57570F176@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 14/16] distro-tracking:	update	data for some toolchain recipes
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
X-List-Received-Date: Wed, 19 Oct 2011 16:30:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Koen Kooi
> Sent: Wednesday, October 19, 2011 8:52 AM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [CONSOLIDATED PULL 14/16] distro-tracking:
> update data for some toolchain recipes
>=20
>=20
> Op 19 okt. 2011, om 17:49 heeft Kamble, Nitin A het volgende
> geschreven:
>=20
> > Koen,
> >   Why do you ask ?
>=20
> Because I want the commit message to match to commit and now it
> doesn't.
>=20
It will be too many recipes to list on one line, shall I split the commit i=
nto multiple one for each recipe whose data is changed?

Nitin

> >
> > Nitin
> >
> >> -----Original Message-----
> >> From: openembedded-core-bounces@lists.openembedded.org
> >> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of
> >> Koen Kooi
> >> Sent: Wednesday, October 19, 2011 1:31 AM
> >> To: Patches and discussions about the oe-core layer
> >> Subject: Re: [OE-core] [CONSOLIDATED PULL 14/16] distro-tracking:
> >> update data for some toolchain recipes
> >>
> >> btrfs-tools is a toolchain recipe?!?!?!
> >>
> >>
> >>
> >> Op 19 okt. 2011, om 10:28 heeft Saul Wold het volgende geschreven:
> >>
> >>> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >>>
> >>> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> >>> ---
> >>> .../conf/distro/include/distro_tracking_fields.inc |   42
> >> ++++++++++++--------
> >>> 1 files changed, 25 insertions(+), 17 deletions(-)
> >>>
> >>> diff --git a/meta/conf/distro/include/distro_tracking_fields.inc
> >> b/meta/conf/distro/include/distro_tracking_fields.inc
> >>> index abc2cbf..e68bbe1 100644
> >>> --- a/meta/conf/distro/include/distro_tracking_fields.inc
> >>> +++ b/meta/conf/distro/include/distro_tracking_fields.inc
> >>> @@ -3005,11 +3005,19 @@ RECIPE_STATUS_pn-run-postinsts=3D"green" #
> all
> >> local code
> >>> RECIPE_LATEST_VERSION_pn-postinsts=3D"1.0"
> >>> RECIPE_MAINTAINER_pn-postinsts =3D "Nitin A Kamble
> >> <nitin.a.kamble@intel.com>"
> >>>
> >>> -RECIPE_STATUS_pn-nasm=3D"green"
> >>> +RECIPE_STATUS_pn-nasm=3D"green"
> >>> RECIPE_LATEST_VERSION_pn-nasm=3D"2.07"
> >>> -RECIPE_MANUAL_CHECK_DATE_pn-nasm =3D "Jul 06, 2011"
> >>> +RECIPE_MANUAL_CHECK_DATE_pn-nasm =3D "Oct 18, 2011"
> >>> +RECIPE_LAST_UPDATE_pn-nasm =3D "Jun 23, 2010"
> >>> RECIPE_MAINTAINER_pn-nasm =3D "Nitin A Kamble
> >> <nitin.a.kamble@intel.com>"
> >>>
> >>> +RECIPE_STATUS_pn-btrfs-tools=3D"green"
> >>> +RECIPE_LATEST_VERSION_pn-btrfs-tools=3D"git"
> >>> +RECIPE_MANUAL_CHECK_DATE_pn-btrfs-tools =3D "Oct 18, 2011"
> >>> +RECIPE_LAST_UPDATE_pn-btrfs-tools =3D "Jun 09, 2011"
> >>> +RECIPE_MAINTAINER_pn-btrfs-tools =3D "Nitin A Kamble
> >> <nitin.a.kamble@intel.com>"
> >>> +DISTRO_PN_ALIAS_pn-btrfs-tools =3D "Debian=3Dbtrfs-tools Fedora=3Dbt=
rfs-
> >> progs"
> >>> +
> >>> RECIPE_STATUS_pn-perl=3D"red" # upgrade needed
> >>> RECIPE_LATEST_VERSION_pn-perl=3D"5.12.1"
> >>> RECIPE_LAST_UPDATE_pn-perl =3D "May 27, 2007"
> >>> @@ -3020,9 +3028,9 @@ RECIPE_LATEST_VERSION_pn-
> >> prelink=3D"1.0+git0+0x909470ee441237563d6236c505cb2d02ddc
> >>> RECIPE_LAST_UPDATE_pn-perl =3D "Jul 23, 2010"
> >>> RECIPE_MAINTAINER_pn-prelink =3D "Mark Hatle
> >> <mark.hatle@windriver.com>"
> >>>
> >>> -RECIPE_STATUS_pn-python-dbus=3D"red"
> >>> -RECIPE_LATEST_VERSION_pn-python-dbus=3D"0.83.1"
> >>> -RECIPE_LAST_UPDATE_pn-python-dbus =3D "Jul 7, 2010"
> >>> +RECIPE_STATUS_pn-python-dbus=3D"green"
> >>> +RECIPE_LATEST_VERSION_pn-python-dbus=3D"0.84.0"
> >>> +RECIPE_LAST_UPDATE_pn-python-dbus =3D "Oct 18, 2011"
> >>> RECIPE_MAINTAINER_pn-python-dbus =3D "Nitin A Kamble
> >> <nitin.a.kamble@intel.com>"
> >>> DISTRO_PN_ALIAS_pn-python-dbus =3D "Ubuntu=3Dpython-dbus Debian=3Dpyt=
hon-
> >> dbus Mandriva=3Dpython-dbus"
> >>>
> >>> @@ -3062,7 +3070,8 @@ RECIPE_MAINTAINER_pn-python-pyrex =3D "Nitin A
> >> Kamble <nitin.a.kamble@intel.com>"
> >>> DISTRO_PN_ALIAS_pn-python-pyrex =3D "Mandriva=3Dpython-pyrex
> >> Ubuntu=3Dpython-pyrex"
> >>>
> >>> RECIPE_STATUS_pn-python-scons=3D"green"
> >>> -RECIPE_LATEST_VERSION_pn-python-scons=3D"2.0.1"
> >>> +RECIPE_LATEST_VERSION_pn-python-scons=3D"2.1.0"
> >>> +RECIPE_LAST_UPDATE_pn-python-scons =3D "Oct 18, 2011"
> >>> DISTRO_PN_ALIAS_pn-python-scons =3D "Fedora=3Dscons OpenSuSE=3Dscons
> >> Ubuntu=3Dscons Mandriva=3Dscons Debian=3Dscons"
> >>> RECIPE_LAST_UPDATE_pn-python-scons =3D "Nov 8, 2010"
> >>> RECIPE_MAINTAINER_pn-python-scons =3D "Nitin A Kamble
> >> <nitin.a.kamble@intel.com>"
> >>> @@ -3087,15 +3096,16 @@ RECIPE_LATEST_VERSION_pn-
> unifdef=3D"2.6.18+git"
> >>> RECIPE_MAINTAINER_pn-unifdef =3D "Nitin A Kamble
> >> <nitin.a.kamble@intel.com>"
> >>>
> >>> RECIPE_STATUS_pn-gnu-config=3D"green"
> >>> -RECIPE_LATEST_VERSION_pn-gnu-config=3D"0.0+git3155524"
> >>> +RECIPE_LATEST_VERSION_pn-gnu-config=3D"svn"
> >>> DISTRO_PN_ALIAS_pn-gnu-config =3D "OpenedHand"
> >>> RECIPE_LAST_UPDATE_pn-gnu-config =3D "Jun 21, 2010"
> >>> -RECIPE_MANUAL_CHECK_DATE_pn-gnu-config =3D "Jul 06, 2011"
> >>> +RECIPE_MANUAL_CHECK_DATE_pn-gnu-config =3D "Oct 18, 2011"
> >>> RECIPE_MAINTAINER_pn-gnu-config =3D "Nitin A Kamble
> >> <nitin.a.kamble@intel.com>"
> >>>
> >>> RECIPE_STATUS_pn-mpfr=3D"green"
> >>> -RECIPE_LATEST_VERSION_pn-mpfr=3D"3.0.0"
> >>> -RECIPE_MANUAL_CHECK_DATE_pn-mpfr =3D "Jul 06, 2011"
> >>> +RECIPE_LATEST_VERSION_pn-mpfr=3D"3.0.1"
> >>> +RECIPE_MANUAL_CHECK_DATE_pn-mpfr =3D "Oct 18, 2011"
> >>> +RECIPE_LAST_UPDATE_pn-mpfr =3D "Apr 07, 2011"
> >>> RECIPE_MAINTAINER_pn-mpfr =3D "Nitin A Kamble
> >> <nitin.a.kamble@intel.com>"
> >>>
> >>> RECIPE_STATUS_pn-gmp=3D"green"
> >>> @@ -3110,9 +3120,10 @@ RECIPE_MANUAL_CHECK_DATE_pn-libmpc =3D "Jan
> 25,
> >> 2011"
> >>> RECIPE_MAINTAINER_pn-libmpc =3D "Nitin A Kamble
> >> <nitin.a.kamble@intel.com>"
> >>> DISTRO_PN_ALIAS_pn-libmpc =3D "Fedora=3Dlibmpc OpenSuse=3Dlibmpc2"
> >>>
> >>> -RECIPE_STATUS_pn-byacc=3D"red"
> >>> +RECIPE_STATUS_pn-byacc=3D"green"
> >>> RECIPE_LATEST_VERSION_pn-byacc=3D"20101229"
> >>> -RECIPE_MANUAL_CHECK_DATE_pn-byacc =3D "Jul 06, 2011"
> >>> +RECIPE_MANUAL_CHECK_DATE_pn-byacc =3D "Oct 18, 2011"
> >>> +RECIPE_LAST_UPDATE_pn-byacc =3D "Oct 18, 2010"
> >>> RECIPE_MAINTAINER_pn-byacc =3D "Nitin A Kamble
> >> <nitin.a.kamble@intel.com>"
> >>>
> >>> RECIPE_STATUS_pn-libconvert-asn1-perl=3D"green"
> >>> @@ -3122,8 +3133,8 @@ RECIPE_LAST_UPDATE_pn-libconvert-asn1-perl =3D
> >> "Aug 13, 2010"
> >>> RECIPE_MAINTAINER_pn-libconvert-asn1-perl =3D "Nitin A Kamble
> >> <nitin.a.kamble@intel.com>"
> >>>
> >>> RECIPE_STATUS_pn-libxml-parser-perl=3D"green"
> >>> -RECIPE_LATEST_VERSION_pn-libxml-parser-perl=3D"2.36"
> >>> -RECIPE_LAST_UPDATE_pn-libxml-parser-perl =3D "Nov 18, 2009"
> >>> +RECIPE_LATEST_VERSION_pn-libxml-parser-perl=3D"2.41"
> >>> +RECIPE_LAST_UPDATE_pn-libxml-parser-perl =3D "Oct 18, 2011"
> >>> RECIPE_MAINTAINER_pn-libxml-parser-perl =3D "Nitin A Kamble
> >> <nitin.a.kamble@intel.com>"
> >>>
> >>> RECIPE_STATUS_pn-cmake-native=3D"green"
> >>> @@ -5922,9 +5933,6 @@ RECIPE_COMMENTS_pn-pseudo =3D "Yocto Project
> >> maintained"
> >>> RECIPE_MANUAL_CHECK_DATE_pn-pseudo =3D "Jun 06, 2011"
> >>> DISTRO_PN_ALIAS_pn-pseudo =3D "Windriver"
> >>>
> >>> -DISTRO_PN_ALIAS_pn-btrfs-tools =3D "Debian=3Dbtrfs-tools Fedora=3Dbt=
rfs-
> >> progs"
> >>> -RECIPE_MAINTAINER_pn-btrfs-tools =3D "Nitin A Kamble
> >> <nitin.a.kamble@intel.com>"
> >>> -
> >>> DISTRO_PN_ALIAS_pn-rt-tests =3D "Debian=3Drt-tests Ubuntu=3Drt-tests"
> >>> RECIPE_MAINTAINER_pn-rt-tests =3D "Darren Hart
> >> <dvhart@linux.intel.com>"
> >>>
> >>> --
> >>> 1.7.6.2
> >>>
> >>>
> >>> _______________________________________________
> >>> Openembedded-core mailing list
> >>> Openembedded-core@lists.openembedded.org
> >>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-
> core
> >>
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-
> core
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


