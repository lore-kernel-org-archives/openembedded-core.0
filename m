Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 79E416B015
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 16:36:07 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 Jul 2013 09:36:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1045,1363158000"; d="scan'208";a="363795217"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2013 09:36:51 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.52]) by
	IRSMSX101.ger.corp.intel.com ([169.254.1.204]) with mapi id
	14.03.0123.003; Thu, 11 Jul 2013 10:57:36 +0100
From: "Ciobanu, Emilia Maria Silvia" <emilia.maria.silvia.ciobanu@intel.com>
To: Saul Wold <sgw@linux.intel.com>, Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [OE-core] [PATCH 2/3] docbook-sgml-dtd-4.1-native.bb: Add real
	PV inside the recipe
Thread-Index: AQHOfX4q4lcvSqd6UEKaC7K7Uowkf5ld9TCAgAAv94CAARnYoA==
Date: Thu, 11 Jul 2013 09:57:35 +0000
Message-ID: <985E5BBDA0968D48ABDF343456A521B3022C98F5@IRSMSX105.ger.corp.intel.com>
References: <cover.1373468672.git.emilia.maria.silvia.ciobanu@intel.com>
	<6c15f39c5d3d9c6d7d8788d1c76758078b446fbd.1373468672.git.emilia.maria.silvia.ciobanu@intel.com>
	<20130710151637.GD3288@jama> <51DDA311.10908@linux.intel.com>
In-Reply-To: <51DDA311.10908@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] docbook-sgml-dtd-4.1-native.bb: Add real PV inside the recipe
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
X-List-Received-Date: Thu, 11 Jul 2013 16:36:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Saul,
> -----Original Message-----
> From: Saul Wold [mailto:sgw@linux.intel.com]
> Sent: Wednesday, July 10, 2013 9:08 PM
> To: Martin Jansa
> Cc: Ciobanu, Emilia Maria Silvia; openembedded-
> core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 2/3] docbook-sgml-dtd-4.1-native.bb: Add
> real PV inside the recipe
>=20
> On 07/10/2013 08:16 AM, Martin Jansa wrote:
> > On Wed, Jul 10, 2013 at 06:07:08PM +0300, Emilia Ciobanu wrote:
> >> Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
> >> ---
> >>   .../docbook-sgml-dtd-4.1-native.bb                 |    1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git
> >> a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-
> native.
> >> bb
> >> b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-
> native.
> >> bb
> >> index 88c9396..1f338fd 100644
> >> ---
> >> a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-
> native.
> >> bb
> >> +++ b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-
> nat
> >> +++ ive.bb
> >> @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE-
> OASIS;md5=3Dc608985dd5f7f215e669e7639a0b1d2e"
> >>   DTD_VERSION =3D "4.1"
> >>
> >>   PR =3D "${INC_PR}.0"
> >> +PV =3D "41"
> >
> > Why not 4.1?
> >
> It seems that the older version (3.1 and 4.1) have their tarballs named w=
ith 31
> and 41.
>=20
> Ema, can you use the regex to handle this correctly?
>=20
> Sau!
>=20
>=20
>=20
> >>
> >>   # Note: the upstream sources are not distributed with a license file=
.
> >>   # LICENSE-OASIS is included as a "patch" to workaround this. When
> >> --
> >> 1.7.9.5
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >

