Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Q02Ia-000626-C7
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 02:46:48 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 Mar 2011 18:45:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,197,1299484800"; d="scan'208";a="613952564"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by orsmga002.jf.intel.com with ESMTP; 16 Mar 2011 18:44:45 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx603.amr.corp.intel.com ([10.22.226.49]) with mapi;
	Wed, 16 Mar 2011 18:44:45 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Gary Thomas <gary@mlbassoc.com>
Date: Wed, 16 Mar 2011 18:44:43 -0700
Thread-Topic: [poky] [PATCH 0/2] GPLv2 versions of m4 & bison
Thread-Index: AcvkPuhY8h/Yr/QDSCGgHfss4bBtkAABetdg
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE943205638A@orsmsx504.amr.corp.intel.com>
References: <cover.1300309327.git.nitin.a.kamble@intel.com>
	<4D815D7F.3070304@mlbassoc.com>
In-Reply-To: <4D815D7F.3070304@mlbassoc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: "poky@yoctoproject.org" <poky@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 0/2] GPLv2 versions of m4 & bison
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
X-List-Received-Date: Thu, 17 Mar 2011 01:46:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Gary Thomas [mailto:gary@mlbassoc.com]
> Sent: Wednesday, March 16, 2011 6:02 PM
> To: Kamble, Nitin A
> Cc: poky@yoctoproject.org; openembedded-core@lists.openembedded.org
> Subject: Re: [poky] [PATCH 0/2] GPLv2 versions of m4 & bison
>=20
> On 03/16/2011 03:03 PM, Nitin A Kamble wrote:
> > From: Nitin A Kamble<nitin.a.kamble@intel.com>
> >
> > These commits adds GPLv2 versions of m4&  bison recipes.
> >
> > Pull URL: git://git.pokylinux.org/poky-contrib.git
> >    Branch: nitin/misc
> >    Browse: http://git.pokylinux.org/cgit.cgi/poky-
> contrib/log/?h=3Dnitin/misc
> >
> > Thanks,
> >      Nitin A Kamble<nitin.a.kamble@intel.com>
> > ---
> >
> >
> > Nitin A Kamble (2):
> >    bison: bring back GPLv2 version 2.3 of bison recipe
> >    m4: bring back GPLv2 version 1.4.9 of m4 recipe
> >
> >   .../bison/bison/bison-2.3_m4.patch                 |  590
> ++++++++++++++++++++
> >   meta/recipes-devtools/bison/bison_2.3.bb           |   35 ++
> >   meta/recipes-devtools/m4/m4-native_1.4.9.bb        |   12 +
> >   .../m4/m4/fix_for_circular_dependency.patch        |   75 +++
> >   meta/recipes-devtools/m4/m4_1.4.9.bb               |   18 +
> >   5 files changed, 730 insertions(+), 0 deletions(-)
> >   create mode 100644 meta/recipes-devtools/bison/bison/bison-
> 2.3_m4.patch
> >   create mode 100644 meta/recipes-devtools/bison/bison_2.3.bb
> >   create mode 100644 meta/recipes-devtools/m4/m4-native_1.4.9.bb
> >   create mode 100644 meta/recipes-
> devtools/m4/m4/fix_for_circular_dependency.patch
> >   create mode 100644 meta/recipes-devtools/m4/m4_1.4.9.bb
> >
>=20
> Was this purely for licensing reasons?  (just asking since there was no
> discussion on this list)

Yes, it was for licensing reasons.
Thanks,
Nitin

>=20
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------


