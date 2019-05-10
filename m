Return-Path: <prvs=026f35aa8=Mikko.Rapeli@bmw.de>
Received: from esa7.bmw.c3s2.iphmx.com (esa7.bmw.c3s2.iphmx.com
	[68.232.133.109])
	by mail.openembedded.org (Postfix) with ESMTP id 6BC417E08E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 13:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1557494117; x=1589030117;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=p9qq34zxctQ9sfNxY44zTJCpC6YC7r8p56WoE/j7Fc8=;
	b=pMA9caXzpazmS7TrixlMqTWUlMm1AIb0va7JY/ker7ZQM49fLgaFylUG
	JDbnznVPf6rput3jxP8JWLk9/OGeePMfS1V4XAnSDjpcFojgyj3bZ/fqX
	gStRszFZvqmoT2SL+HxzfG8NBfnT2yGaD3njeEA2SfkHVNl6/gLQOqX9h A=;
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
	esa7.bmw.c3s2.iphmx.com with ESMTP/TLS; 10 May 2019 15:15:02 +0200
Received: from esabb4.muc ([160.50.100.33])  by esagw5.muc with ESMTP/TLS;
	10 May 2019 15:15:02 +0200
Received: from smucm10l.bmwgroup.net (HELO smucm10l.europe.bmw.corp)
	([160.48.96.48])
	by esabb4.muc with ESMTP/TLS; 10 May 2019 15:15:01 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10l.europe.bmw.corp
	(160.48.96.48) with Microsoft SMTP Server (TLS;
	Fri, 10 May 2019 15:15:01 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.004;
	Fri, 10 May 2019 15:15:01 +0200
From: <Mikko.Rapeli@bmw.de>
To: <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH 2/2] openssh: usable sshd depends on rngd from
	rng-tools
Thread-Index: AQHVBaGpALdn5Btobk+wHBWkPPApHaZhIdoAgAAETgCAAASGAIAC/XGAgAAP1YA=
Date: Fri, 10 May 2019 13:15:01 +0000
Message-ID: <20190510131501.GF3459@hiutale>
References: <1557321969-28686-1-git-send-email-mikko.rapeli@bmw.de>
	<1557321969-28686-2-git-send-email-mikko.rapeli@bmw.de>
	<20190508140708.GC25917@localhost> <20190508142232.GC3459@hiutale>
	<24616adf-6d73-ec86-e506-85f860f43731@prevas.dk>
	<CAJTo0LZLLOQGunyBmUeYiZs=qgUTaptnQcW4NfrzvoYjYkH_OQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZLLOQGunyBmUeYiZs=qgUTaptnQcW4NfrzvoYjYkH_OQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.40]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, bunk@stusta.de
Subject: Re: [PATCH 2/2] openssh: usable sshd depends on rngd from rng-tools
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
X-List-Received-Date: Fri, 10 May 2019 13:15:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9752630BC44F3D46A4658AD77A0D7E21@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2019 at 01:18:21PM +0100, Burton, Ross wrote:
> I'm very dubious of the need to make this a dependency, as the
> hardware RNG should be used.  Note that there's been a slew of fixes
> to the kernel to enable this with modern stacks, for example:
>=20
> https://github.com/torvalds/linux/commit/62f95ae805fa9e1e84d47d3219adddd9=
7b2654b7
>=20
> Maybe the IMX driver needs the same patch?

Possibly. Was running 4.14.89 kernel from NXP.

I would have benefitted from this patch, but it's ok if you reject it.

-Mikko

> Ross
>=20
> On Thu, 9 May 2019 at 09:46, Rasmus Villemoes
> <rasmus.villemoes@prevas.dk> wrote:
> >
> > On 08/05/2019 16.22, Mikko.Rapeli@bmw.de wrote:
> > > On Wed, May 08, 2019 at 05:07:08PM +0300, Adrian Bunk wrote:
> > >> On Wed, May 08, 2019 at 04:26:09PM +0300, Mikko Rapeli wrote:
> > >>> Since openssl 1.1.1 and openssh which uses it, sshd
> > >>> startup is delayed. The delays range from few seconds
> > >>> to minutes and even to hours. The delays are visible
> > >>> in host keys generation and when sshd process is started
> > >>> in response to incoming TCP connection but is failing
> > >>> to provide SSH version string and clients or tests time out.
> > >>>
> > >>> In all cases traces show that sshd is waiting for getentropy()
> > >>> system call to return from Linux kernel, which returns only
> > >>> after kernel side random number pool is initialized. The pool
> > >>> is initialized via various entropy source which may be
> > >>> missing on embedded development boards or via rngd from
> > >>> rng-tools package from userspace. HW random number generation
> > >>> and kernel support help but rngd is till needed to feed that data
> > >>> back to the Linux kernel.
> > >>>
> > >>> Example from an NXP imx8 board shows that kernel random number pool
> > >>> initialization can take over 400 seconds without rngd,
> > >>> and with rngd it is initialized at around 4 seconds after boot.
> > >>> The completion of initialization is visible in kernel dmesg with li=
ne
> > >>> "random: crng init done".
> > >>> ...
> > >>> --- a/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
> > >>> +++ b/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
> > >>> @@ -148,6 +148,7 @@ FILES_${PN}-keygen =3D "${bindir}/ssh-keygen"
> > >>>
> > >>>  RDEPENDS_${PN} +=3D "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
> > >>>  RDEPENDS_${PN}-sshd +=3D "${PN}-keygen ${@bb.utils.contains('DISTR=
O_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
> > >>> +RDEPENDS_${PN}-sshd +=3D "rng-tools"
> > >>> ...
> > >>
> > >> This should only be an RRECOMMENDS so that people can opt out of it.
> > >>
> > >> E.g. CONFIG_RANDOM_TRUST_CPU in the kernel can solve the same
> > >> problem without using rng-tools on some platforms.
> > >
> > > I think this is a stronger dependency than just RRECOMMENDS. We build
> > > images and disable recommends but we care that sshd starts as fast as=
 in
> > > sumo and earlier yocto releases for testing etc purposes.
> >
> > But why should boards without a hwrng be forced to spend disk space and
> > run-time resources on a daemon which they don't benefit from at all?
> >
> > I don't think RANDOM_TRUST_CPU works, though. That's just for stuff lik=
e
> > rdrand(), i.e. instructions built into the CPU - not for some other
> > on-chip hwrng. Whether those are used for seeding early on (i.e.,
> > without rngd doing its thing) depends on the ->quality parameter set by
> > the individual hwrng drivers. Very few set one, so they get assigned th=
e
> > default_quality, which is a module parameter that defaults to 0.
> >
> > IOW, I think (but I haven't got around to testing this) one should set
> > rng_core.default_quality=3D512 (or something) on the kernel command lin=
e
> > to make the kernel start the hwrng_fill thread that will seed the
> > entropy pool from the hwrng. At least if I'm reading
> > drivers/char/hw_random/core.c correctly.
> >
> > Rasmus
> >
> >
> >
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core=

