Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1UF7KR-0007v6-6g
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 19:20:12 +0100
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2BI3Quu019026;
	Mon, 11 Mar 2013 13:03:26 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2BI3PBI024969;
	Mon, 11 Mar 2013 13:03:25 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Mon, 11 Mar 2013 13:03:26 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Thread-Topic: [OE-core] [PATCH] soc-family: fix SOC_FAMILY override order
Thread-Index: AQHOHDtbHD9KocCEJ0SY43LMI4w7bJicW6WAgAFOrQCAAuwc4IAAbrEA///EIaA=
Date: Mon, 11 Mar 2013 18:03:25 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159453E63@DLEE12.ent.ti.com>
References: <1362765064-27663-1-git-send-email-Chase.Maupin@ti.com>
	<CAP9ODKphM_vr-CgBbpm60tQixxepsCcMN60yGwofnhSRhrm-kA@mail.gmail.com>
	<20130308200628.GB15481@denix.org>
	<CAP9ODKreEY23jZvHhQGPa27EJdH85JzH9_QmWMNU+w7aQ9u_+A@mail.gmail.com>
	<7D46E86EC0A8354091174257B2FED1015944E4E0@DLEE12.ent.ti.com>
	<CAP9ODKrnp4VHmvOyq-D=k1oy62VT0R18Xk1KS80kAD+4JfqLJQ@mail.gmail.com>
	<7D46E86EC0A8354091174257B2FED101594532C3@DLEE12.ent.ti.com>
	<CAP9ODKog6e+3BbDT+pLy1a8GsEuKtyZmuuoHGoc3tOX20OvLpg@mail.gmail.com>
In-Reply-To: <CAP9ODKog6e+3BbDT+pLy1a8GsEuKtyZmuuoHGoc3tOX20OvLpg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: Patches, oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] soc-family: fix SOC_FAMILY override order
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
X-List-Received-Date: Mon, 11 Mar 2013 18:20:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: otavio.salvador@gmail.com
> [mailto:otavio.salvador@gmail.com] On Behalf Of Otavio Salvador
> Sent: Monday, March 11, 2013 11:24 AM
> To: Maupin, Chase
> Cc: Denys Dmytriyenko; Patches and discussions about the oe-core
> layer
> Subject: Re: [OE-core] [PATCH] soc-family: fix SOC_FAMILY
> override order
>=20
> On Mon, Mar 11, 2013 at 11:49 AM, Maupin, Chase
> <chase.maupin@ti.com> wrote:
> >> -----Original Message-----
> >> From: otavio.salvador@gmail.com
> >> [mailto:otavio.salvador@gmail.com] On Behalf Of Otavio
> Salvador
> >> Sent: Saturday, March 09, 2013 6:11 AM
> >> To: Maupin, Chase
> >> Cc: Denys Dmytriyenko; Patches and discussions about the oe-
> core
> >> layer
> >> Subject: Re: [OE-core] [PATCH] soc-family: fix SOC_FAMILY
> >> override order
> >>
> >> On Fri, Mar 8, 2013 at 7:16 PM, Maupin, Chase
> >> <chase.maupin@ti.com> wrote:
> >> >> -----Original Message-----
> >> >> From: otavio.salvador@gmail.com
> >> >> [mailto:otavio.salvador@gmail.com] On Behalf Of Otavio
> >> Salvador
> >> >> Sent: Friday, March 08, 2013 2:27 PM
> >> >> To: Denys Dmytriyenko
> >> >> Cc: Maupin, Chase; Patches and discussions about the oe-
> core
> >> >> layer
> >> >> Subject: Re: [OE-core] [PATCH] soc-family: fix SOC_FAMILY
> >> >> override order
> >> >>
> >> >> On Fri, Mar 8, 2013 at 5:06 PM, Denys Dmytriyenko
> >> >> <denis@denix.org> wrote:
> >> >> > On Fri, Mar 08, 2013 at 03:52:57PM -0300, Otavio Salvador
> >> >> wrote:
> >> >> >> On Fri, Mar 8, 2013 at 2:51 PM, Chase Maupin
> >> >> <Chase.Maupin@ti.com> wrote:
> >> >> >> > * the current order has SOC_FAMILY settings, which are
> >> >> generic
> >> >> >> >   settings for a group of devices, overriding the
> machine
> >> >> specific
> >> >> >> >   settings.  For example:
> >> >> >> >
> >> >> >> >   KERNEL_DEVICETREE_ti33x =3D "xxxx"
> >> >> >> >   KERNEL_DEVICETREE_beaglebone =3D "yyyy"
> >> >> >> >
> >> >> >> >   Should yield "yyyy" when building for the beaglebone
> >> >> because
> >> >> >> >   that is a more specific device than ti33x.  However,
> >> >> without this
> >> >> >> >   change the result is that the value is set to "xxxx"
> >> >> meaning the
> >> >> >> >   more generic setting overrides the more specific
> >> setting.
> >> >> >> >
> >> >> >> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> >> >> >>
> >> >> >> Maybe while on that you could look at supporting xx:yy
> as
> >> SoC
> >> >> family?
> >> >> >> like am37xx:am3715 ?
> >> >> >
> >> >> > Did you mean am3517? That's a slightly different variant
> of
> >> >> am35x/omap35x SoC.
> >> >>
> >> >> Yes; sorry ... what I meant was 'am35xx:am3517'
> >> >>
> >> >> > But if you really meant am3715 (as well as am3705, am3725
> >> and
> >> >> am3730), then
> >> >> > those are variants of am37x SoC, just with some
> subsystems,
> >> >> like SGX or DSP,
> >> >> > being absent or present. Having those variants handled by
> >> >> SOC_FAMILY would be
> >> >> > an overkill. Instead, we've started using
> MACHINE_FEATURES
> >> to
> >> >> distinguish
> >> >> > between those variants of the same SoC, by checking for
> >> "sgx"
> >> >> and/or "dsp"
> >> >> > flags there and pulling in needed software components
> >> >> accordingly.
> >> >>
> >> >> My main concern here is that COMPATIBLE_MACHINE also parses
> >> >> SOC_FAMILY
> >> >> however if you have two (as the 'am35xx:am3517') it is
> going
> >> to
> >> >> fail;
> >> >> it could split it and parse it individually.
> >> >
> >> > Sorry, I'm not sure if I'm following here.  Are you saying
> you
> >> would find it useful to have support for a MACHINE to have
> more
> >> than one SOC_FAMILY?  In the example above I would have
> expected
> >> that you would have a machine config file for am3517 which has
> an
> >> SOC_FAMILY of am35xx.  Why would you specify two SOC_FAMILY
> >> values per machine?
> >>
> >> We can have more generic to more specific combinations.
> >>
> >> > Or are you trying to build something like omap3->am35xx-
> >am3517
> >> where you can use omap3 as a more generic setting but still
> use
> >> am35xx for a slightly more restrictive group that is still
> >> grouping like parts, and finally you use am3517 for the exact
> >> part?
> >>
> >> Exactly so we avoid duplication stuff to boards or SoCs.
> Another
> >> example of use: imx -> mx6q -> mx6.
> >
> > I see.  This could be of some use and I'll play with it.  This
> should not be required though for this patch since right now I
> want to fix the order issue.  Any objection to the patch as is?
>=20
> No; not really. I just wanted to ask if you could look at it as
> well
> so we can have it working. It does make things much easier for
> all us.

Sure.  Btw, I noticed a weirdness when looking at this where the COMPATIBLE=
_MACHINE being evaluated evaulated/matched only has to be a substring of th=
e SOC family to work.  For example if I have:

MACHINE =3D omap5-evm
SOC_FAMILY =3D omap-a15
COMPATIBLE_MACHINE =3D omap

Then this will work because "omap" (the COMPATIBLE_MACHINE) is a substring =
of SOC_FAMILY (and technically also a substring of omap5-evm)

Even setting COMPATIBLE_MACHINE to omap- will work because that is a substr=
ing of omap-a15.  So the "match" operation is not really precise enough.  I=
'm wondering if this needs to be changed to do an exact match.

>=20
> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854
> http://projetos.ossystems.com.br


