Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1THK9Y-0000KX-AH
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 21:53:44 +0200
Received: by weyt44 with SMTP id t44so863047wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 12:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=X96NoR5Mk1U5I60LHbMlcCclZ9j4j6FQ7geBqsVMkfs=;
	b=JP5tacy5558ILGnJBXywdnLLAg0FU94CmG0UFhVZREn/BJpT+hbF1TmXFCPKFsUKFg
	aZ3VorP3llH/eUvSae4O3y6gqYu9fKS+JibwRi7ebas+mTckvvVMa2kYfTbh23Bvew62
	/+ab7kLgmdOmqFmh5ORjXydnVmOlf9z7HvgW3A1qNZWXWa69z+5af0+xB2/fEtC7iCA0
	ERd14FHWgWBa5r6j3nzkxqn3TRjXWBFKFwnT0zrf2bY9+D5bPcDgeweJzOxgzTiSwl7A
	3XLP+heR58xDPcuIFLksw6N/1sFBvAm87TUjSWZoB/Mc0Yh25RPeLCsl1mP7JWFIOCCJ
	nP/g==
Received: by 10.216.226.216 with SMTP id b66mr2019063weq.155.1348774852291;
	Thu, 27 Sep 2012 12:40:52 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t7sm14904974wix.6.2012.09.27.12.40.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Sep 2012 12:40:49 -0700 (PDT)
Date: Thu, 27 Sep 2012 21:40:59 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20120927194059.GH3454@jama.jama.net>
References: <cover.1348330479.git.Martin.Jansa@gmail.com>
	<5ac0bc525f5ac3f07c5749efc31e91c3fe6145c1.1348330479.git.Martin.Jansa@gmail.com>
	<1348335944.10108.211.camel@ted>
	<20120927083701.GC3454@jama.jama.net>
	<5064A1DB.40506@windriver.com>
	<20120927191246.GG3454@jama.jama.net>
	<5064A66F.2000908@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5064A66F.2000908@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 2/5] tune-xscale, tune-arm926ejs: add OPTDEFAULTTUNE variable and use more generic DEFAULTTUNE as default
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
X-List-Received-Date: Thu, 27 Sep 2012 19:53:44 -0000
X-Groupsio-MsgNum: 30028
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zhtSGe8h3+lMyY1M"
Content-Disposition: inline

--zhtSGe8h3+lMyY1M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 27, 2012 at 02:18:07PM -0500, Mark Hatle wrote:
> On 9/27/12 2:12 PM, Martin Jansa wrote:
> > On Thu, Sep 27, 2012 at 01:58:35PM -0500, Mark Hatle wrote:
> >> Let me preface this by I have read the patch set.. Martin asked me to =
comment on
> >> the items below...
> >>
> >> On 9/27/12 3:37 AM, Martin Jansa wrote:
> >>> On Sat, Sep 22, 2012 at 06:45:44PM +0100, Richard Purdie wrote:
> >>>> On Sat, 2012-09-22 at 18:51 +0200, Martin Jansa wrote:
> >>>>> * bitbake.conf has OPTDEFAULTTUNE with weak default value of DEFAUL=
TTUNE
> >>>>> * this way xscale or arm926ejs is not used by default when some mac=
hine
> >>>>>     includes its tune*.inc, but it's easy for DISTRO to say it wants
> >>>>>     OPTDEFAULTTUNE for some packages or always (if they don't want =
to
> >>>>>     share built packages between xscale and arm926ejs).
> >>>>>
> >>>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >>>>> ---
> >>>>>    meta/conf/bitbake.conf                       | 1 +
> >>>>>    meta/conf/machine/include/tune-arm926ejs.inc | 3 ++-
> >>>>>    meta/conf/machine/include/tune-xscale.inc    | 3 ++-
> >>>>>    3 files changed, 5 insertions(+), 2 deletions(-)
> >>>>>
> >>>>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> >>>>> index 9b41749..e433fcb 100644
> >>>>> --- a/meta/conf/bitbake.conf
> >>>>> +++ b/meta/conf/bitbake.conf
> >>>>> @@ -95,6 +95,7 @@ HOST_LD_ARCH =3D "${TARGET_LD_ARCH}"
> >>>>>    HOST_AS_ARCH =3D "${TARGET_AS_ARCH}"
> >>>>>    HOST_EXEEXT =3D ""
> >>>>>
> >>>>> +OPTDEFAULTTUNE ??=3D "${DEFAULTTUNE}"
> >>>>>    TUNE_ARCH ??=3D "INVALID"
> >>>>>    TUNE_CCARGS ??=3D ""
> >>>>>    TUNE_LDARGS ??=3D ""
> >>>>
> >>>> As I've said previously, I do not think OPTDEFAULTTUNE is clear in u=
sage
> >>>> or in meaning and we need to find a better solution. I'm therefore n=
ot
> >>>> keen on this change.
> >>>
> >>> OK, what about the rest of patchset (without OPTDEFAULTTUNE bits) to =
use
> >>> different PKGARCH for different TUNE_CCARGS?
> >>
> >> I've been an advocate for a while that the processor optimization (CCA=
RGS) does
> >> make it into the PKGARCH.  ARMPKGSFX_CPU seems like a reasonable appro=
ach to do
> >> this.  It allows each tune to set something to tell people what that b=
inary is
> >> really built for, and for the 'base' tunes (i.e. armv5) it can be left=
 off.
> >>
> >> The only concern I have with that is:
> >>
> >> +ARMPKGSFX_CPU =3D "${@bb.utils.contains("TUNE_FEATURES", "arm926ejs",
> >> "-arm926ejs", "", d)}"
> >>
> >> That probably should be a .=3D instead of just '=3D'.  That way if the=
 user loads
> >> multiple compatible tunes the right ARMPKGSFX_CPU will be used.  (Alte=
rnatively
> >> using the overrides would work as well for this.. i.e.
> >> ARMPKGSFX_CPU_tune-arm926ejs instead...
> >
> > OK.
> >
> >> I see Patch 5/5 instead moves toward the ARMPKGARCH usage instead...  =
This is
> >> fine as well, and it was designed to be overriden.. but again the .=3D=
 or
> >> -tune_... syntax should be used...
> >
> > I tend to prefer ARMPKGARCH as it's shorter xscale-te/armv5te-xscale.
> >
> > But not sure what to do with all "lower" PACKAGE_EXTRA_ARCHS:
> > PACKAGE_EXTRA_ARCHS_tune-xscale-be =3D "${PACKAGE_EXTRA_ARCHS_tune-armv=
5teb}"
> > do we want PACKAGE_EXTRA_ARCHS_tune-armv5teb only or also something like
> > armv4t-xscale?
> >
> > Well whole PACKAGE_EXTRA_ARCHS has too many entries already (opkg update
> > would try to download many feeds but only a few does exist).
>=20
> The PACKAGE_EXTRA_ARCHS should contain all of the 'compatible' arch names=
=2E=20
> Which of course feed into the list of feeds used by the various packaging=
=20
> systems.  I think it's up to the distribution to modify or limit the feed=
s=20
> resolved, but I don't know if there is a clean way to do this.  I always =
error=20
> on listing more then less, because I don't know how people are going to w=
ant to=20
> mix and match things.  (And a BSP or end user can always just define what=
 the=20
> PACKAGE_EXTRA_ARCHS value should be.)

Yes that's what I do now, but I'm not too happy about it :/
SUPPORTED_EXTRA_ARCHS ?=3D "armv4t armv5te armv6-novfp armv7a-vfp-neon x86_=
64 x86"
SUPPORTED_EXTRA_ARCHS_armv7a ?=3D "armv7a-vfp-neon"
SUPPORTED_EXTRA_ARCHS_armv6 ?=3D "armv6-novfp"

> >> Anyway, my point in this is I like having the stuff unique, but we nee=
d to be
> >> sure that you can specify more then one tune file during a build w/o c=
lashes.
> >>
> >>>> I also still think this is a distro packaging issue and should be so=
lved
> >>>> by the distro, even if that means more complexity there. That is the
> >>>> right place for this particular complexity IMO. I'm happy to support
> >>>> that from the core but not in something as user visible and confusin=
g as
> >>>> this variable.
> >>>
> >>> Agreed OPTDEFAULTTUNE is to help distro configs, because complexity
> >>> there will be much worse then when it's defined in tune-* files, beca=
use
> >>> now will have to define DEFAULTTUNE/OPTDEFAULTTUNE for each MACHINE (=
or
> >>> TUNE_FEATURE) it supports and it's less orthogonal (machine/distro
> >>> config) then it could be.
> >>
> >> I really don't have a strong opinion on this either way.  I know for t=
he stuff
> >> I've done in the past (not oe-based) we've just manually configured (t=
he
> >> equivalent of the distro conf) with the information on the handful of =
items that
> >> people wanted optimized the most...  eglibc, openssl, mysql/posgresql.=
=2E.
> >> otherwise folks don't seem to care, and re-use works fine.
> >>
> >> If the list is small (i.e. less then 10 packages) that specifying it v=
ia package
> >> specific overrides in the distro file should be fine.. if it's more th=
en 10
> >> (typically) then we need to start looking for another approach.
> >>
> >> I'd almost suggest in the distro file you could do:
> >>
> >> OPTDEFAULTTUNE =3D "$@{...}" where ... is check for something set by t=
he BSP (or
> >> elsewhere), if set use that value, otherwise using the DEFAULTTUNE val=
ue.
> >>
> >> DEFAULTTUNE-<pn> =3D "${OPTDEFAULTTUNE}"
> >
> > Yes but first I have to say:
> > DEFAULTTUNE_spitz =3D armv5te
> > OPTDEFAULTTUNE_spitz =3D xscale
> > DEFAULTTUNE_qemuarm =3D armv5te
> > OPTDEFAULTTUNE_qemuarm =3D arm926ejs
> > or
> > DEFAULTTUNE_tune-xscale =3D armv5te
> > OPTDEFAULTTUNE_tun_xscale =3D xscale
> > DEFAULTTUNE_tune-arm926ejs =3D armv5te
> > OPTDEFAULTTUNE_tune-arm926ejs =3D arm926ejs
> >
> > to know what's OPTDEFAULTTUNE and DEFAULTTUNE for given MACHINE if it's
> > not in defined tune-xscale/tune-arm926ejs.
>=20
> I assume that a distribution will be (bb)appending, or defining their own=
 BSPs.=20
>   And in that case it's pretty easy to add both the DEFAULTTUNE and=20
> OPTDEFAULTTUNE line to the BSP configuration file.  (And if someone uses =
a=20
> different distribution, then the DEFAULT is used as that is the standard =
method.)

Yes, but how should I .bbappend machine config? e.g. qemuarm.conf in
oe-core?=20

Yes I can add that to my BSPs, but if I call it OPTDEFAULTTUNE
then everybody else (who is interested in my BSP but has own distro)
needs to agree on name OPTDEFAULTTUNE.

That's why I wanted this defined in tune-* files which are shared in
oe-core and used by everybody I guess.

> > And that's what I didn't want to include in my distro config (and then
> > explaining to someone that when adding MACHINE foo he has to send patch
> > for distro config).
>=20
> Ya I understand.  This is an odd situation for many embedded systems.  Yo=
u want=20
> to reuse packages that aren't optimally tuned -- but you still want a few=
 tuned=20
> packages.  It's certainly a usecase we need to support -- but I'm not sur=
e in=20
> the end how people end up doing this.
>=20
> I know most of my commercial customers just want everything to be tuned f=
or the=20
> target BSP.. and they build new distributions for each product they imple=
ment.

Ok, but having both OPTDEFAULTTUNE and DEFAULTTUNE in tune-* allows both
use cases to coexist without any complex configuration on distro side.

Thanks again for constructive comment.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zhtSGe8h3+lMyY1M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBkq8sACgkQN1Ujt2V2gBxFlgCgt/AVu4QuE5K+JK/GEVhfetG5
yC8An3myYvQVqCJEjMVmnAhULSKfJBY4
=HISx
-----END PGP SIGNATURE-----

--zhtSGe8h3+lMyY1M--
