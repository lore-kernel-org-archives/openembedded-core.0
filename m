Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TJ9Qv-0002SN-Nk
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 22:51:13 +0200
Received: by wibhj13 with SMTP id hj13so1189807wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Oct 2012 13:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AHAf+byqVs3UQLMfYrsEiWhlDIE8KdrBDbTUfts5pQQ=;
	b=l5D1s96UWpjjVzfQwpbEthAlgX922rCz1x48HUxuFDPBDnOxoAvEsc9uqi7SbgsPiD
	VMf+AQKocaEMjwRJMqClAeDesfWa89itH1lebsGyrq3wR+B6DYB3LFaNT2+SXDzMjOmj
	AgRd3+jHomJUHyE8N9L2xhgaTJG/Ndxflz6HStBPqqNAPP9lB+o0rCgpE2vNtcJ7je+d
	V9seZKDx9f/9t4SMs5siXfV5DYZbn8gW8dOD9Gg0lvweXKcP/x5ISnhhLzuwgofouKWO
	sj1mmJFiNO2yuPgSne9iMwRzHcIWPHpnu4zcEw7tbXAbVaU03mguLnZD79GIo4KIwGYV
	yuww==
Received: by 10.216.28.140 with SMTP id g12mr6240583wea.59.1349210294963;
	Tue, 02 Oct 2012 13:38:14 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b7sm23261934wiz.3.2012.10.02.13.38.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 02 Oct 2012 13:38:12 -0700 (PDT)
Date: Tue, 2 Oct 2012 22:38:12 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20121002203812.GD15881@jama.jama.net>
References: <cover.1348330479.git.Martin.Jansa@gmail.com>
	<5ac0bc525f5ac3f07c5749efc31e91c3fe6145c1.1348330479.git.Martin.Jansa@gmail.com>
	<1348335944.10108.211.camel@ted>
	<20120927083701.GC3454@jama.jama.net>
	<5064A1DB.40506@windriver.com>
	<20121002184355.GB15881@jama.jama.net>
	<506B5040.6000703@windriver.com>
MIME-Version: 1.0
In-Reply-To: <506B5040.6000703@windriver.com>
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
X-List-Received-Date: Tue, 02 Oct 2012 20:51:13 -0000
X-Groupsio-MsgNum: 30260
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XvKFcGCOAo53UbWW"
Content-Disposition: inline

--XvKFcGCOAo53UbWW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 02, 2012 at 03:36:16PM -0500, Mark Hatle wrote:
> On 10/2/12 1:43 PM, Martin Jansa wrote:
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
> >>
> >> I see Patch 5/5 instead moves toward the ARMPKGARCH usage instead...  =
This is
> >> fine as well, and it was designed to be overriden.. but again the .=3D=
 or
> >> -tune_... syntax should be used...
> >
> > I've updated contrib/jansa/tune-test with this.
> > http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/tu=
ne-test
> >
> > While changing that to use e.g.
> > ARMPKGARCH_tune-xscale
> > I've noticed that _tune-foo are not valid OVERRIDE, so I had to add
> > ARMPKGARCH =3D "${ARMPKGARCH_tune-${DEFAULTTUNE}}"
> > in arch-arm.inc and then define ARMPKGARCH_tune-foo for every supported
> > arm tune (otherwise it's expanded like this TUNE_PKGARCH (${ARMPKGARCH_=
tune-armv5te}te).).
> >
> > This makes whole
> > TUNE_PKGARCH =3D "${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMP=
KGSFX_EABI}${ARMPKGSFX_ENDIAN}${ARMPKGSFX_FPU}"
> > a bit less usefull, maybe ARMPKGSFX_CPU was better approach..
>=20
> I've clarified with RP on this.  Tune values are not a 'true' override be=
cause=20
> of evaluation time of overrides.  We want the DEFAULTTUNE to be changeabl=
e=20
> during the build process to allow multilibs, alternative configurations, =
etc.
>=20
> So in the tunes to do override-like implementations, you will need:
>=20
> ARMPKGARCH =3D "${ARMPKGARCH_tune-${DEFAULTTUNE}}"
>=20
> and then in each tune fragment:
>=20
> ARMPKGARCH_tune-foo =3D "bar"

Yes that's what I did, but it's a bit ugly, see yourself - 2nd patch from t=
op in that repo

>=20
> --Mark
>=20
> > Cheers,
> >
> >>
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
> >>
> >> and then everything can be encapsulated into the distro file (and dist=
ro BSPs).
> >>    The downside of this approach is that it's not the 'standard' imple=
mentation.
> >>
> >> --Mark
> >>
> >>> Cheers,
> >>>
> >>>
> >>>
> >>> _______________________________________________
> >>> Openembedded-core mailing list
> >>> Openembedded-core@lists.openembedded.org
> >>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >>>
> >>
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XvKFcGCOAo53UbWW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBrULQACgkQN1Ujt2V2gBzECACfWUCB/1aZp/gknsotK9UOvsIn
kGoAn0BqZ/+82JMW1t52kdK+K+i2F1G+
=cxAn
-----END PGP SIGNATURE-----

--XvKFcGCOAo53UbWW--
