Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QmDaA-0004pI-2C
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 01:32:06 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Jul 2011 16:27:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,279,1309762800"; d="scan'208";a="32861421"
Received: from orsmsx602.amr.corp.intel.com ([10.22.226.211])
	by orsmga001.jf.intel.com with ESMTP; 27 Jul 2011 16:27:49 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx602.amr.corp.intel.com ([10.22.226.211]) with mapi;
	Wed, 27 Jul 2011 16:27:50 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jul 2011 16:27:47 -0700
Thread-Topic: [OE-core] [PATCH 2/4] siteinfo.bbclass: add entries for new
	x86_64 ABI targets
Thread-Index: AcxMssQYIgBRn55bQ8ygbEfqoHMGdwAAcF9w
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94DE667A45@orsmsx504.amr.corp.intel.com>
References: <cover.1311806842.git.nitin.a.kamble@intel.com>
	<368d4cd746ace1a99c7eced1e00275e0eec27573.1311806842.git.nitin.a.kamble@intel.com>
	<4E309B77.1050703@mentor.com>
In-Reply-To: <4E309B77.1050703@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] siteinfo.bbclass: add entries for new x86_64 ABI targets
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
X-List-Received-Date: Wed, 27 Jul 2011 23:32:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Tom Rini
> Sent: Wednesday, July 27, 2011 4:13 PM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 2/4] siteinfo.bbclass: add entries for
> new x86_64 ABI targets
>=20
> On 07/27/2011 04:09 PM, nitin.a.kamble@intel.com wrote:
> > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >
> > Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> > ---
> >  meta/classes/siteinfo.bbclass |   14 +++++++++++++-
> >  1 files changed, 13 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta/classes/siteinfo.bbclass
> b/meta/classes/siteinfo.bbclass
> > index 9dacd58..daa7946 100644
> > --- a/meta/classes/siteinfo.bbclass
> > +++ b/meta/classes/siteinfo.bbclass
> > @@ -42,12 +42,15 @@ def siteinfo_data(d):
> >          "sh4": "endian-little bit-32 sh-common",
> >          "sparc": "endian-big bit-32",
> >          "viac3": "endian-little bit-32 ix86-common",
> > -        "x86_64": "endian-little bit-64",
> > +        "x86_64": "endian-little", # bitinfo specified in targetinfo
> >      }
> >      osinfo =3D {
> >          "darwin": "common-darwin",
> >          "darwin9": "common-darwin",
> >          "linux": "common-linux common-glibc",
> > +        "linux-gnu32": "common-linux common-glibc",
> > +        "linux-gnux32": "common-linux common-glibc",
> > +        "linux-gnu64": "common-linux common-glibc",
> >          "linux-gnueabi": "common-linux common-glibc",
> >          "linux-gnuspe": "common-linux common-glibc",
> >          "linux-uclibc": "common-linux common-uclibc",
> > @@ -68,6 +71,15 @@ def siteinfo_data(d):
> >          "powerpc-linux-uclibcspe": "powerpc-linux powerpc32-linux
> powerpc-linux-uclibc",
> >          "powerpc64-linux-gnuspe": "powerpc-linux powerpc64-linux",
> >          "powerpc64-linux": "powerpc-linux",
> > +        "x86_64-cygwin": "bit-64",
> > +        "x86_64-darvin": "bit-64",
> > +        "x86_64-darvin9": "bit-64",
>=20
> dar_v_in? :)
>=20
> Slightly more seriously, lets drop out ones we can't / aren't using,
> wrt
> hosts, until we're going to do them for real.

Hi Tom,
  I don't know if they(cygwin, darvin) work or not, I just kept them in the=
 same state. If they are not used/working, then it is good to clean them ou=
t.

Nitin

>=20
> --
> Tom Rini
> Mentor Graphics Corporation
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


