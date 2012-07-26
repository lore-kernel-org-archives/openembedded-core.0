Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.slater@windriver.com>) id 1SuUfR-0003dx-A5
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 22:28:17 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb [147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6QKGj3x006223
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 13:16:45 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.2.203]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.01.0255.000;
	Thu, 26 Jul 2012 13:16:44 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] EXCLUDE_FROM_WORLD
Thread-Index: Ac1rXXJgZ1SXUA3UTPSRnt48UNUAsgAPxq6AAAxmE2A=
Date: Thu, 26 Jul 2012 20:16:44 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF841FF7DD2E@ALA-MBB.corp.ad.wrs.com>
References: <007BD92917A2324FA403BCF9A464CF841FF7D6FA@ALA-MBB.corp.ad.wrs.com>
	<1343329639.7600.13.camel@ted>
In-Reply-To: <1343329639.7600.13.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.152.80]
MIME-Version: 1.0
Subject: Re: EXCLUDE_FROM_WORLD
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
X-List-Received-Date: Thu, 26 Jul 2012 20:28:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-core-
> bounces@lists.openembedded.org] On Behalf Of Richard Purdie
> Sent: Thursday, July 26, 2012 12:07 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] EXCLUDE_FROM_WORLD
>=20
> On Thu, 2012-07-26 at 18:45 +0000, Slater, Joseph wrote:
> > Could somebody clarify excluding things from world?  I see
> > EXCLUDE_FROM_WORLD =3D "1" in
> >
> > many places, including libx11.inc, and I'm sure there's plenty of
> > libx11 stuff in world.
>=20
> The issue is that there are multiple providers of libx11 and when you
> bitbake world, we don't want them all to build. For that reason it gets
> excluded and then the correct version will get built as needed.
>=20
> There are plans afoot to merge those different libx11 recipes at which
> point the exclude from world will get dropped.
>=20
> > I also see package specific exclusions in world-broken.inc.
>=20
> This was originally a list of known problematic packages and used to be
> quite large. Looking at the list:
>=20
> gobject-introspection: Totally broken recipe, I'm tempted to delete it.
> eds-tools: Again, I'm tempted to delete the recipe
> clutter-box2d: This should build, not sure why its on the broken list.

Thanks for the clarifications.  I would think that there would be packages
that you'd want to exclude conditionally.  Like i-only-build-for-x86.bb wou=
ld
not be part of world for ppc builds.  Maybe such packages just cannot ever
be in world, or maybe we do something where EXCLUDE_FROM_WORLD gets compute=
d
from, say, MACHINE_FEATURES?

Joe

>=20
> Chris replied about the other bits...
>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


