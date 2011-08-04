Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qp6s4-0007Uw-FR
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 00:58:32 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Aug 2011 15:54:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,320,1309762800"; d="scan'208";a="35535436"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by orsmga001.jf.intel.com with ESMTP; 04 Aug 2011 15:54:07 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx603.amr.corp.intel.com ([10.22.226.49]) with mapi; Thu, 4 Aug 2011
	15:54:07 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 4 Aug 2011 15:54:07 -0700
Thread-Topic: [OE-core] [PATCH 07/10] siteinfo.bbclass: add entries for new
	x86_64 ABI targets
Thread-Index: AcxS+RdfGrO52BuGRKOSHlAZFcdRIAAADKUg
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94DE85F577@orsmsx504.amr.corp.intel.com>
References: <cover.1312469789.git.nitin.a.kamble@intel.com>
	<e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
	<e1221aaa052c50fad49df099d2c2979f3664e4ba.1312469790.git.nitin.a.kamble@intel.com>
	<CA+M6bXnei8wro6jEV9b2N0H5mKxpFQEaktSPG944Qua_XeXwkg@mail.gmail.com>
In-Reply-To: <CA+M6bXnei8wro6jEV9b2N0H5mKxpFQEaktSPG944Qua_XeXwkg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 07/10] siteinfo.bbclass: add entries for new x86_64 ABI targets
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
X-List-Received-Date: Thu, 04 Aug 2011 22:58:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Tom Rini
> Sent: Thursday, August 04, 2011 3:52 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 07/10] siteinfo.bbclass: add entries for
> new x86_64 ABI targets
>=20
> On Thu, Aug 4, 2011 at 8:01 AM,  <nitin.a.kamble@intel.com> wrote:
> > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >
> > Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> > ---
> > =A0meta/classes/siteinfo.bbclass | =A0 14 +++++++++++++-
> > =A01 files changed, 13 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta/classes/siteinfo.bbclass
> b/meta/classes/siteinfo.bbclass
> > index 9dacd58..daa7946 100644
> > --- a/meta/classes/siteinfo.bbclass
> > +++ b/meta/classes/siteinfo.bbclass
> > @@ -42,12 +42,15 @@ def siteinfo_data(d):
> > =A0 =A0 =A0 =A0 "sh4": "endian-little bit-32 sh-common",
> > =A0 =A0 =A0 =A0 "sparc": "endian-big bit-32",
> > =A0 =A0 =A0 =A0 "viac3": "endian-little bit-32 ix86-common",
> > - =A0 =A0 =A0 =A0"x86_64": "endian-little bit-64",
> > + =A0 =A0 =A0 =A0"x86_64": "endian-little", # bitinfo specified in targ=
etinfo
> > =A0 =A0 }
> > =A0 =A0 osinfo =3D {
> > =A0 =A0 =A0 =A0 "darwin": "common-darwin",
> > =A0 =A0 =A0 =A0 "darwin9": "common-darwin",
> > =A0 =A0 =A0 =A0 "linux": "common-linux common-glibc",
> > + =A0 =A0 =A0 =A0"linux-gnu32": "common-linux common-glibc",
> > + =A0 =A0 =A0 =A0"linux-gnux32": "common-linux common-glibc",
> > + =A0 =A0 =A0 =A0"linux-gnu64": "common-linux common-glibc",
> > =A0 =A0 =A0 =A0 "linux-gnueabi": "common-linux common-glibc",
> > =A0 =A0 =A0 =A0 "linux-gnuspe": "common-linux common-glibc",
> > =A0 =A0 =A0 =A0 "linux-uclibc": "common-linux common-uclibc",
> > @@ -68,6 +71,15 @@ def siteinfo_data(d):
> > =A0 =A0 =A0 =A0 "powerpc-linux-uclibcspe": "powerpc-linux powerpc32-lin=
ux
> powerpc-linux-uclibc",
> > =A0 =A0 =A0 =A0 "powerpc64-linux-gnuspe": "powerpc-linux powerpc64-linu=
x",
> > =A0 =A0 =A0 =A0 "powerpc64-linux": "powerpc-linux",
> > + =A0 =A0 =A0 =A0"x86_64-cygwin": "bit-64",
> > + =A0 =A0 =A0 =A0"x86_64-darvin": "bit-64",
> > + =A0 =A0 =A0 =A0"x86_64-darvin9": "bit-64",
>=20
> You still haven't fixed this typo. It's darWin not darVin.
Got it. Thanks for catching this again :)
Nitin

>=20
> --
> Tom
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


