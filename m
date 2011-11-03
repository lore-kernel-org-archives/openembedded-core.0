Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RM0KT-00015m-Iv
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 17:39:49 +0100
Received: by faas16 with SMTP id s16so1905523faa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2011 09:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AB/FvtJuf7TDPIP0FJdqnoMGOuLBeTzIBHBQ1KDGkEo=;
	b=jszLO313h5dsMv+814xMLNMuAlqKX4B6TT0w6kfOjHiTuUiS3wGQQp0HM36j7pbBIY
	0MGdQsE6/fuwlpMz42fdpzmqMWjlOhq0mxt4Q8X3TjBX8Cbyvi7uIUt0H6Ms5TaDn1tt
	VOAqef04ttSZntbuREeaj4lvQUSFnx6oP7KHI=
Received: by 10.223.76.27 with SMTP id a27mr17460015fak.12.1320338021023;
	Thu, 03 Nov 2011 09:33:41 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d21sm13016403fac.4.2011.11.03.09.33.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Nov 2011 09:33:39 -0700 (PDT)
Date: Thu, 3 Nov 2011 17:33:28 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111103163328.GM9949@jama.jama.net>
References: <1317910796.6398.86.camel@ted>
	<37FC7DDC-D175-45B4-AF8A-F4D5AF384750@dominion.thruhere.net>
	<20111009181016.GB3847@jama.jama.net>
	<9CD7A2A3-228F-46AE-AE56-5D73C9372E4A@dominion.thruhere.net>
	<20111010114506.GC5065@jama.jama.net>
	<1318256283.23801.38.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1318256283.23801.38.camel@ted>
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
X-List-Received-Date: Thu, 03 Nov 2011 16:39:49 -0000
X-Groupsio-MsgNum: 11865
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0+35XlDF45POFHfm"
Content-Disposition: inline

--0+35XlDF45POFHfm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 10, 2011 at 03:17:51PM +0100, Richard Purdie wrote:
> On Mon, 2011-10-10 at 13:45 +0200, Martin Jansa wrote:
> > On Sun, Oct 09, 2011 at 08:11:45PM +0200, Koen Kooi wrote:
> > >=20
> > > Op 9 okt. 2011, om 20:10 heeft Martin Jansa het volgende geschreven:
> > >=20
> > > > On Sun, Oct 09, 2011 at 01:25:09PM +0200, Koen Kooi wrote:
> > > >>=20
> > > >> Op 6 okt. 2011, om 16:19 heeft Richard Purdie het volgende geschre=
ven:
> > > >>=20
> > > >>> sstate was being a little too ethusiastic about removing stamp fi=
les and
> > > >>> was removing stamp files for other machines when it shouldn't hav=
e been.
> > > >>>=20
> > > >>> This patch teaches sstate about machine specific stamp extensions=
 and
> > > >>> allows it to only remove the current task's stampfiles.
> > > >>=20
> > > >> Not sure if it's related to this problem or not but sstate is stil=
l not working as intented for me when switching machines, it keeps rebuildi=
ng the toolchain when switching machine. What I did this morning:
> > > >>=20
> > > >> 1) wipe out tmp, sstate-cache, pseudodone
> > > >> 2) MACHINE=3Dbeagleboard bitbake u-boot
> > > >> 3) cp conf/machine/beagleboard.conf conf/machine/brokensstate.conf
> > > >> 4) MACHINE=3Dbrokensstate bitbake u-boot
> > > >=20
> > > > Same here.. :/ (building 3 armv7 machines.. always "from scratch").
> > >=20
> > > To eliminate varables: Angstrom/shr/aurora/micro/other/all of the abo=
ve?
> >=20
> > DISTRO=3Dshr
> >=20
> > MACHINE=3Dnokia900 bitbake shr-image -> builds from scratch, finished ok
> > MACHINE=3Dpalmpre bitbake shr-image -> builds from scratch, finished ok
> > MACHINE=3Dpalmpre2 bitbake shr-image -> builds from scratch, finished ok
> >=20
> > without wiping anything (same tmp, same sstate-cache, same pseudodone)
> >=20
> > MACHINE=3Dpalmpre bitbake shr-image -> builds from scratch, again!, fin=
ished ok
> > MACHINE=3Dpalmpre2 bitbake shr-image -> builds from scratch, again!, fi=
nished ok
> > MACHINE=3Dnokia900 bitbake shr-image -> builds from scratch, again!, fi=
nished ok
> >=20
> > palmpre and palmpre2 are "the same"
> > $ cat meta-smartphone/meta-palm/conf/machine/palmpre.conf | grep -v ^#
> > require conf/machine/include/palmpre.inc
> >=20
> > $ cat meta-smartphone/meta-palm/conf/machine/palmpre2.conf | grep -v ^#
> > require conf/machine/include/palmpre.inc
> >=20
> > nokia900 is also armv7a-vfp-neon (that's why all packages except
> > MACHINE_ARCH were always reused without rebuilding in OE-classic).
> >=20
> > I have tried to debug sigdata files to see why and also tried to add
> > MACHINEOVERRIDES[vardepsexclude] =3D "MACHINE"
> > as RP suggested, but sofar haven't found solution at least to reuse
> > already built sstate packages for armv7a-vfp-neon.
>=20
> I've posted a patch which at least locally solves the issue with the "cp
> MACHINEA MACHINEB". If there are more issues I'd be interested, see my
> separate email with some debugging tips.

Hi,

to recap what we have talked about on ELCE;

Currently it doesn't seem to change sstate checksums after switching
MACHINE, but still it rebuilds everything at least once after switch.

Today I've tried to wipe tmp and rebuild from sstate-cache and I've
noticed interesting thing:

All recipes are starting with=20
do_populate_lic_setscene=20
not=20
do_populate_sysroot_setscene
like ie koen's build does

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: package quilt-native-0.48-r0: task do_populate_lic_setscene: Started
NOTE: package shr-image-2.0-r18: task do_populate_lic_setscene: Started
NOTE: package quilt-native-0.48-r0: task do_populate_lic_setscene: Succeeded
NOTE: package shr-image-2.0-r18: task do_populate_lic_setscene: Succeeded

Does do_populate_lic_setscene wipe all stamps after do_populate_lic so it=
=20
causes the rebuild instead of population of sysroot from sstate?

IIRC I had similar issue when I was starting to use oe-core and it was=20
in the end caused by inheriting package_ipk (once directly from distro conf=
ig=20
and once through sane-feed-ipk.inc) and it was fixed 6 months ago by:
http://git.shr-project.org/git/?p=3Dmeta-shr.git;a=3Dcommit;h=3D00623b3c6dd=
01c4a227008f7cfdb0801cb06f49a
And IIRC we've talked about some ways to make sstate less error-prone
for such things.

Now I have similar symptoms but only after switching MACHINE.

Any hint?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0+35XlDF45POFHfm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6ywlgACgkQN1Ujt2V2gBxkuwCeM42MQ7rm/oQioQq20BTRevHW
cJkAnAwDSqwmkwTRq7Fw1V+MDpddubFh
=ZREV
-----END PGP SIGNATURE-----

--0+35XlDF45POFHfm--
