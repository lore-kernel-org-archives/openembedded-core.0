Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RHAIt-000329-Gj
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 10:18:11 +0200
Received: by bkat8 with SMTP id t8so4816613bka.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 01:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VsPPiRshiNAh/tVSc3brFewcq+e/0A9z+14Z0NN5fR0=;
	b=ve+sjV8RhPhNbfKX4+XymKDcIjc6nvlje2xWjkaXez5SM+0dgWhN122YQXUUVbkRjq
	YtIbCNU1aHT1iNYFgzzpo+cuAWaC5aNHEcGASz3TTIVMTKO/Vi5W2EAldd+lBtPS1EMz
	tREt1P0fdnvdmSaHyvKgqpe+2m4yZ3jBl/pXU=
Received: by 10.204.132.143 with SMTP id b15mr10091287bkt.79.1319184738329;
	Fri, 21 Oct 2011 01:12:18 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w8sm12496977bks.11.2011.10.21.01.12.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 01:12:16 -0700 (PDT)
Date: Fri, 21 Oct 2011 10:12:09 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111021081209.GO3522@jama.jama.net>
References: <363ECAF1-8602-4139-ADC9-2044FCB5456C@dominion.thruhere.net>
	<1318675132-9265-1-git-send-email-Martin.Jansa@gmail.com>
	<1318698176.2342.77.camel@ted>
	<CA+chaQdAQm1jLLJxC1dSUSu+kgo-JqMffVDur=JNxpe-HGczMg@mail.gmail.com>
	<7603E49D-D11F-4D4A-8883-B07E61B3FBC2@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <7603E49D-D11F-4D4A-8883-B07E61B3FBC2@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] mesa-dri: move extra DRIMODULES to EXTRA_DRIMODULES
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
X-List-Received-Date: Fri, 21 Oct 2011 08:18:11 -0000
X-Groupsio-MsgNum: 11409
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L5nTHegdhbHhzmSD"
Content-Disposition: inline

--L5nTHegdhbHhzmSD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2011 at 09:54:21AM +0200, Koen Kooi wrote:
>=20
> Op 21 okt. 2011, om 09:34 heeft Martin Jansa het volgende geschreven:
>=20
> > On Sat, Oct 15, 2011 at 7:02 PM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >> On Sat, 2011-10-15 at 12:38 +0200, Martin Jansa wrote:
> >>> * this way we can use
> >>>   EXTRA_DRIDRIVERS_armv4t +=3D ",glamo" in meta-openmoko layer and
> >>>   EXTRA_DRIDRIVERS_armv4t +=3D ",foo" in meta-bar layer without knowl=
edge
> >>>   of other modules in other layers in stack
> >>> * actually it's like old MACHINE_DRI_MODULES from OE-classic but rena=
med
> >>>   to indicate that it should be used for architecture not machine
> >>=20
> >> This is way overcomplicated. Just do:
> >>=20
> >> DRIDRIVERS_append_armv4t =3D ",glamo"
> >=20
> > Ah, is it expected that armv4t is no longer valid OVERRIDE?
>=20
> It is valid for angstrom:

I was thinking about adding the same to shr config.. but can I expect
that everybody who wants to use meta-openmoko will read README so
carefully that it will be enough to say
This layer depends on FEED_ARCH OVERRIDE?

Regards,

> koen@dominion:/OE/tentacle/sources/meta-ti$ MACHINE=3Dom-gta01 bitbake -e=
 | grep OVERRIDES
> # DISTROOVERRIDES=3D${DISTRO}
> DISTROOVERRIDES=3D"angstrom"
> # MACHINEOVERRIDES=3D${MACHINE}:${@bb.data.getVar('FEED_ARCH', d,1).repla=
ce('all','noarch')}:${SOC_FAMILY}
> MACHINEOVERRIDES=3D"om-gta01:armv4t:Unknown"
> # OVERRIDES=3D${OVERRIDE_THUMB}${OVERRIDE_INTERWORK}${TARGET_OS}:${TRANSL=
ATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOV=
ERRIDES}:forcevariable${@bb.utils.contains("TUNE_FEATURES", "thumb", ":thum=
b", "", d)}${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", ":th=
umb-interwork", "", d)}:libc-glibc:libc-glibc
>=20
> regards,
>=20
> Koen
>=20
> >=20
> > OVERRIDES=3D"linux-gnueabi:arm:build-linux:pn-libdrm:om-gta02::shr:forc=
evariable:thumb:libc-glibc"
> >=20
> > # OVERRIDES=3D${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:=
pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:forcevariable${@bb.utils.co=
ntains("TUNE_FEATURES",
> > "thumb", ":thumb", "", d)}${@bb.utils.contains("TUNE_FEATURES",
> > "no-thumb-interwork", ":thumb-interwork", "", d)}:libc-glibc
> >=20
> > So I've to change it to
> > DRIDRIVERS_append_arm
> > or is it TRANSLATED_TARGET_ARCH fault?
> >=20
> > Regards,
> >=20
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

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--L5nTHegdhbHhzmSD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6hKVkACgkQN1Ujt2V2gBwHCACff6d1vHz+DhcGtv6Afma6dAaX
TNIAn0OJxyVJuCdNcWseNqNeCZaTnjwT
=vqzI
-----END PGP SIGNATURE-----

--L5nTHegdhbHhzmSD--
