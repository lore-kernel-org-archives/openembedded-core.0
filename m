Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1THKiG-0001Ce-E9
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 22:29:36 +0200
Received: by wibhj13 with SMTP id hj13so3383015wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 13:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rweWR6z09osObywiCc/BXZWUrIeJh/d7Ed3RJSsE1II=;
	b=wlaD5TzSrfnITUAZtZmBqwSsxoD2U5EHSjafUZgMKs2xChpS8OaE0a/Om+NoTdy+Rw
	2tOXrRot6ip62xCmk1SknZFr9otWdTDsl5SxTmHpIZpCL94GlTVJfmjaRLQNmdF84wah
	zMh4AXL/Stj6SZt3vm66R1/k3BSFjJ0aS6WUNN1/oj+kL+d/F/2yOqS4lNRmydUDzvYY
	iDUebaetZeWv1B+aUJgVfSGQb3y254rakmEu0hOrV19PUxvOHSCS6EPtpe53mmUkj511
	qImnzWhtfSTJSu+H5Ki0h661+K5M1seLF8EWWRCJ46IEBuGpK3a8dgCpYpCf/Zu8jrYn
	FoZA==
Received: by 10.180.85.99 with SMTP id g3mr10612523wiz.5.1348777004291;
	Thu, 27 Sep 2012 13:16:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bn7sm15070757wib.8.2012.09.27.13.16.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Sep 2012 13:16:42 -0700 (PDT)
Date: Thu, 27 Sep 2012 22:16:52 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20120927201652.GI3454@jama.jama.net>
References: <cover.1348330479.git.Martin.Jansa@gmail.com>
	<5ac0bc525f5ac3f07c5749efc31e91c3fe6145c1.1348330479.git.Martin.Jansa@gmail.com>
	<1348335944.10108.211.camel@ted>
	<20120927083701.GC3454@jama.jama.net>
	<5064A1DB.40506@windriver.com>
	<20120927191246.GG3454@jama.jama.net>
	<5064A66F.2000908@windriver.com>
	<20120927194059.GH3454@jama.jama.net>
	<5064AEB1.5010203@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5064AEB1.5010203@windriver.com>
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
X-List-Received-Date: Thu, 27 Sep 2012 20:29:36 -0000
X-Groupsio-MsgNum: 30031
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="e5GLnnZ8mDMEwH4V"
Content-Disposition: inline

--e5GLnnZ8mDMEwH4V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 27, 2012 at 02:53:21PM -0500, Mark Hatle wrote:
> On 9/27/12 2:40 PM, Martin Jansa wrote:
> > On Thu, Sep 27, 2012 at 02:18:07PM -0500, Mark Hatle wrote:
> >> On 9/27/12 2:12 PM, Martin Jansa wrote:
> >>> On Thu, Sep 27, 2012 at 01:58:35PM -0500, Mark Hatle wrote:
> >>>> Let me preface this by I have read the patch set.. Martin asked me t=
o comment on
> >>>> the items below...
> >>>>
> >>>> On 9/27/12 3:37 AM, Martin Jansa wrote:
> >>>>> On Sat, Sep 22, 2012 at 06:45:44PM +0100, Richard Purdie wrote:
> >>>>>> On Sat, 2012-09-22 at 18:51 +0200, Martin Jansa wrote:
> >>>>>>> * bitbake.conf has OPTDEFAULTTUNE with weak default value of DEFA=
ULTTUNE
> >>>>>>> * this way xscale or arm926ejs is not used by default when some m=
achine
> >>>>>>>      includes its tune*.inc, but it's easy for DISTRO to say it w=
ants
> >>>>>>>      OPTDEFAULTTUNE for some packages or always (if they don't wa=
nt to
> >>>>>>>      share built packages between xscale and arm926ejs).
> >>>>>>>
> >>>>>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >>>>>>> ---
> >>>>>>>     meta/conf/bitbake.conf                       | 1 +
> >>>>>>>     meta/conf/machine/include/tune-arm926ejs.inc | 3 ++-
> >>>>>>>     meta/conf/machine/include/tune-xscale.inc    | 3 ++-
> >>>>>>>     3 files changed, 5 insertions(+), 2 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> >>>>>>> index 9b41749..e433fcb 100644
> >>>>>>> --- a/meta/conf/bitbake.conf
> >>>>>>> +++ b/meta/conf/bitbake.conf
> >>>>>>> @@ -95,6 +95,7 @@ HOST_LD_ARCH =3D "${TARGET_LD_ARCH}"
> >>>>>>>     HOST_AS_ARCH =3D "${TARGET_AS_ARCH}"
> >>>>>>>     HOST_EXEEXT =3D ""
> >>>>>>>
> >>>>>>> +OPTDEFAULTTUNE ??=3D "${DEFAULTTUNE}"
> >>>>>>>     TUNE_ARCH ??=3D "INVALID"
> >>>>>>>     TUNE_CCARGS ??=3D ""
> >>>>>>>     TUNE_LDARGS ??=3D ""
> >>>>>>
> >>>>>> As I've said previously, I do not think OPTDEFAULTTUNE is clear in=
 usage
> >>>>>> or in meaning and we need to find a better solution. I'm therefore=
 not
> >>>>>> keen on this change.
> >>>>>
> >>>>> OK, what about the rest of patchset (without OPTDEFAULTTUNE bits) t=
o use
> >>>>> different PKGARCH for different TUNE_CCARGS?
> >>>>
> >>>> I've been an advocate for a while that the processor optimization (C=
CARGS) does
> >>>> make it into the PKGARCH.  ARMPKGSFX_CPU seems like a reasonable app=
roach to do
> >>>> this.  It allows each tune to set something to tell people what that=
 binary is
> >>>> really built for, and for the 'base' tunes (i.e. armv5) it can be le=
ft off.
> >>>>
> >>>> The only concern I have with that is:
> >>>>
> >>>> +ARMPKGSFX_CPU =3D "${@bb.utils.contains("TUNE_FEATURES", "arm926ejs=
",
> >>>> "-arm926ejs", "", d)}"
> >>>>
> >>>> That probably should be a .=3D instead of just '=3D'.  That way if t=
he user loads
> >>>> multiple compatible tunes the right ARMPKGSFX_CPU will be used.  (Al=
ternatively
> >>>> using the overrides would work as well for this.. i.e.
> >>>> ARMPKGSFX_CPU_tune-arm926ejs instead...
> >>>
> >>> OK.
> >>>
> >>>> I see Patch 5/5 instead moves toward the ARMPKGARCH usage instead...=
  This is
> >>>> fine as well, and it was designed to be overriden.. but again the .=
=3D or
> >>>> -tune_... syntax should be used...
> >>>
> >>> I tend to prefer ARMPKGARCH as it's shorter xscale-te/armv5te-xscale.
> >>>
> >>> But not sure what to do with all "lower" PACKAGE_EXTRA_ARCHS:
> >>> PACKAGE_EXTRA_ARCHS_tune-xscale-be =3D "${PACKAGE_EXTRA_ARCHS_tune-ar=
mv5teb}"
> >>> do we want PACKAGE_EXTRA_ARCHS_tune-armv5teb only or also something l=
ike
> >>> armv4t-xscale?
> >>>
> >>> Well whole PACKAGE_EXTRA_ARCHS has too many entries already (opkg upd=
ate
> >>> would try to download many feeds but only a few does exist).
> >>
> >> The PACKAGE_EXTRA_ARCHS should contain all of the 'compatible' arch na=
mes.
> >> Which of course feed into the list of feeds used by the various packag=
ing
> >> systems.  I think it's up to the distribution to modify or limit the f=
eeds
> >> resolved, but I don't know if there is a clean way to do this.  I alwa=
ys error
> >> on listing more then less, because I don't know how people are going t=
o want to
> >> mix and match things.  (And a BSP or end user can always just define w=
hat the
> >> PACKAGE_EXTRA_ARCHS value should be.)
> >
> > Yes that's what I do now, but I'm not too happy about it :/
> > SUPPORTED_EXTRA_ARCHS ?=3D "armv4t armv5te armv6-novfp armv7a-vfp-neon =
x86_64 x86"
> > SUPPORTED_EXTRA_ARCHS_armv7a ?=3D "armv7a-vfp-neon"
> > SUPPORTED_EXTRA_ARCHS_armv6 ?=3D "armv6-novfp"
> >
> >>>> Anyway, my point in this is I like having the stuff unique, but we n=
eed to be
> >>>> sure that you can specify more then one tune file during a build w/o=
 clashes.
> >>>>
> >>>>>> I also still think this is a distro packaging issue and should be =
solved
> >>>>>> by the distro, even if that means more complexity there. That is t=
he
> >>>>>> right place for this particular complexity IMO. I'm happy to suppo=
rt
> >>>>>> that from the core but not in something as user visible and confus=
ing as
> >>>>>> this variable.
> >>>>>
> >>>>> Agreed OPTDEFAULTTUNE is to help distro configs, because complexity
> >>>>> there will be much worse then when it's defined in tune-* files, be=
cause
> >>>>> now will have to define DEFAULTTUNE/OPTDEFAULTTUNE for each MACHINE=
 (or
> >>>>> TUNE_FEATURE) it supports and it's less orthogonal (machine/distro
> >>>>> config) then it could be.
> >>>>
> >>>> I really don't have a strong opinion on this either way.  I know for=
 the stuff
> >>>> I've done in the past (not oe-based) we've just manually configured =
(the
> >>>> equivalent of the distro conf) with the information on the handful o=
f items that
> >>>> people wanted optimized the most...  eglibc, openssl, mysql/posgresq=
l...
> >>>> otherwise folks don't seem to care, and re-use works fine.
> >>>>
> >>>> If the list is small (i.e. less then 10 packages) that specifying it=
 via package
> >>>> specific overrides in the distro file should be fine.. if it's more =
then 10
> >>>> (typically) then we need to start looking for another approach.
> >>>>
> >>>> I'd almost suggest in the distro file you could do:
> >>>>
> >>>> OPTDEFAULTTUNE =3D "$@{...}" where ... is check for something set by=
 the BSP (or
> >>>> elsewhere), if set use that value, otherwise using the DEFAULTTUNE v=
alue.
> >>>>
> >>>> DEFAULTTUNE-<pn> =3D "${OPTDEFAULTTUNE}"
> >>>
> >>> Yes but first I have to say:
> >>> DEFAULTTUNE_spitz =3D armv5te
> >>> OPTDEFAULTTUNE_spitz =3D xscale
> >>> DEFAULTTUNE_qemuarm =3D armv5te
> >>> OPTDEFAULTTUNE_qemuarm =3D arm926ejs
> >>> or
> >>> DEFAULTTUNE_tune-xscale =3D armv5te
> >>> OPTDEFAULTTUNE_tun_xscale =3D xscale
> >>> DEFAULTTUNE_tune-arm926ejs =3D armv5te
> >>> OPTDEFAULTTUNE_tune-arm926ejs =3D arm926ejs
> >>>
> >>> to know what's OPTDEFAULTTUNE and DEFAULTTUNE for given MACHINE if it=
's
> >>> not in defined tune-xscale/tune-arm926ejs.
> >>
> >> I assume that a distribution will be (bb)appending, or defining their =
own BSPs.
> >>    And in that case it's pretty easy to add both the DEFAULTTUNE and
> >> OPTDEFAULTTUNE line to the BSP configuration file.  (And if someone us=
es a
> >> different distribution, then the DEFAULT is used as that is the standa=
rd method.)
> >
> > Yes, but how should I .bbappend machine config? e.g. qemuarm.conf in
> > oe-core?
>=20
> Sorry, not bbappend in this case..  but you can do it in a distribution l=
ayer.=20
> (This is from memory so I might not be 100% correct.)
>=20
> You should be able to have in your own layer a qemuarm.conf that looks li=
ke:
>=20
> require conf/machine/qemuarm.conf
> OPTDEFAULTTUNE =3D "something"
> DEFAULTTUNE =3D "something_else"
>=20
> It will know not to open itself in the requires.... and fall back to a pr=
evious=20
> layer.
>=20
> (If that doesn't work, I know we did it somehow.. since we ran into a sim=
ilar=20
> situation with our product.)

yes but that's still at least 2 more lines (possibly in separate .conf
file) for each MACHINE I could possibly support by my distro, I would like=
=20
to keep it more universal (or ortogonal in distro/machine/image sense).

> > Yes I can add that to my BSPs, but if I call it OPTDEFAULTTUNE
> > then everybody else (who is interested in my BSP but has own distro)
> > needs to agree on name OPTDEFAULTTUNE.
> >
> > That's why I wanted this defined in tune-* files which are shared in
> > oe-core and used by everybody I guess.
>=20
> I agree completely, this is the downside of doing it int he distro files =
vs the=20
> tune files.  But in the end it seems reasonable to make it a machine or=
=20
> distribution setting of some kind.
>
> >>> And that's what I didn't want to include in my distro config (and then
> >>> explaining to someone that when adding MACHINE foo he has to send pat=
ch
> >>> for distro config).
> >>
> >> Ya I understand.  This is an odd situation for many embedded systems. =
 You want
> >> to reuse packages that aren't optimally tuned -- but you still want a =
few tuned
> >> packages.  It's certainly a usecase we need to support -- but I'm not =
sure in
> >> the end how people end up doing this.
> >>
> >> I know most of my commercial customers just want everything to be tune=
d for the
> >> target BSP.. and they build new distributions for each product they im=
plement.
> >
> > Ok, but having both OPTDEFAULTTUNE and DEFAULTTUNE in tune-* allows both
> > use cases to coexist without any complex configuration on distro side.
>=20
> Yup, no disagreement there.

Ok, lets see if this changes RP's view on OPTDEFAULTTUNE.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--e5GLnnZ8mDMEwH4V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBktDQACgkQN1Ujt2V2gBxXfQCfQ9RJwYVs0DqJBhez3S4VjhTO
YdgAoINJeuNWbwnufLp3mCswacQ3Weq6
=hOCZ
-----END PGP SIGNATURE-----

--e5GLnnZ8mDMEwH4V--
