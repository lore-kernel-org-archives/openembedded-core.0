Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RDENm-0002x0-RK
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 13:50:59 +0200
Received: by bke11 with SMTP id 11so8417391bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 04:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cshnMFB93J+3akpPUxqQc82aWfK0TgHk1UuVlQ2gBVg=;
	b=OTxNz9yGJlN/6fcnUab9WnyE2lim5lsfnPWQODrWi5YuWjxE/2dB2oFzl296tHY/59
	csziGiALoinrUe9J9D+NNVsob1b9MXEpAFPVEToauC+ivXGsZ6b57tkn7ULBn7OSxT29
	ATANbUEwNDcC2glVOEqs7KLjqKOFT6Cviqvf4=
Received: by 10.204.135.207 with SMTP id o15mr5852226bkt.92.1318247115640;
	Mon, 10 Oct 2011 04:45:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l13sm10291216bkk.9.2011.10.10.04.45.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Oct 2011 04:45:14 -0700 (PDT)
Date: Mon, 10 Oct 2011 13:45:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111010114506.GC5065@jama.jama.net>
References: <1317910796.6398.86.camel@ted>
	<37FC7DDC-D175-45B4-AF8A-F4D5AF384750@dominion.thruhere.net>
	<20111009181016.GB3847@jama.jama.net>
	<9CD7A2A3-228F-46AE-AE56-5D73C9372E4A@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <9CD7A2A3-228F-46AE-AE56-5D73C9372E4A@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: sstate.bbclass: Ensure machine specific stamps are only wiped for the current task
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
X-List-Received-Date: Mon, 10 Oct 2011 11:50:59 -0000
X-Groupsio-MsgNum: 10745
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lMM8JwqTlfDpEaS6"
Content-Disposition: inline

--lMM8JwqTlfDpEaS6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 09, 2011 at 08:11:45PM +0200, Koen Kooi wrote:
>=20
> Op 9 okt. 2011, om 20:10 heeft Martin Jansa het volgende geschreven:
>=20
> > On Sun, Oct 09, 2011 at 01:25:09PM +0200, Koen Kooi wrote:
> >>=20
> >> Op 6 okt. 2011, om 16:19 heeft Richard Purdie het volgende geschreven:
> >>=20
> >>> sstate was being a little too ethusiastic about removing stamp files =
and
> >>> was removing stamp files for other machines when it shouldn't have be=
en.
> >>>=20
> >>> This patch teaches sstate about machine specific stamp extensions and
> >>> allows it to only remove the current task's stampfiles.
> >>=20
> >> Not sure if it's related to this problem or not but sstate is still no=
t working as intented for me when switching machines, it keeps rebuilding t=
he toolchain when switching machine. What I did this morning:
> >>=20
> >> 1) wipe out tmp, sstate-cache, pseudodone
> >> 2) MACHINE=3Dbeagleboard bitbake u-boot
> >> 3) cp conf/machine/beagleboard.conf conf/machine/brokensstate.conf
> >> 4) MACHINE=3Dbrokensstate bitbake u-boot
> >=20
> > Same here.. :/ (building 3 armv7 machines.. always "from scratch").
>=20
> To eliminate varables: Angstrom/shr/aurora/micro/other/all of the above?

DISTRO=3Dshr

MACHINE=3Dnokia900 bitbake shr-image -> builds from scratch, finished ok
MACHINE=3Dpalmpre bitbake shr-image -> builds from scratch, finished ok
MACHINE=3Dpalmpre2 bitbake shr-image -> builds from scratch, finished ok

without wiping anything (same tmp, same sstate-cache, same pseudodone)

MACHINE=3Dpalmpre bitbake shr-image -> builds from scratch, again!, finishe=
d ok
MACHINE=3Dpalmpre2 bitbake shr-image -> builds from scratch, again!, finish=
ed ok
MACHINE=3Dnokia900 bitbake shr-image -> builds from scratch, again!, finish=
ed ok

palmpre and palmpre2 are "the same"
$ cat meta-smartphone/meta-palm/conf/machine/palmpre.conf | grep -v ^#
require conf/machine/include/palmpre.inc

$ cat meta-smartphone/meta-palm/conf/machine/palmpre2.conf | grep -v ^#
require conf/machine/include/palmpre.inc

nokia900 is also armv7a-vfp-neon (that's why all packages except
MACHINE_ARCH were always reused without rebuilding in OE-classic).

I have tried to debug sigdata files to see why and also tried to add
MACHINEOVERRIDES[vardepsexclude] =3D "MACHINE"
as RP suggested, but sofar haven't found solution at least to reuse
already built sstate packages for armv7a-vfp-neon.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lMM8JwqTlfDpEaS6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6S2sIACgkQN1Ujt2V2gBxiewCfTd8v8o72AvigFi/j7W64yWSt
xxUAnRHqqqBkdaAkEZa+50dnupJnQNas
=oIPy
-----END PGP SIGNATURE-----

--lMM8JwqTlfDpEaS6--
