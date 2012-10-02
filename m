Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TJ7eK-0000hJ-H9
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 20:56:56 +0200
Received: by wgbdq11 with SMTP id dq11so4330547wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Oct 2012 11:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yeHtL9aJhi6zuyRmHq7/4Qy+bYV+DhJIKVYZ8u075e8=;
	b=ObML+fHaHrcikJ7VfaqS+xXGpM2MPy0YWoBvtFVzr6tU5KLOEBoNeowOBSk1LTYJ0R
	Rj87TjnvIZq4gRXXd9XNTbCFnQ5iPGzbfm+4YXQMBfTMDE4ImOYjn1cvoY7vFsrdlaA/
	zJu4bR1LDTbrvxFX7OTRpdCnYaTS4PG2WRfVJHpYbE8F+lQp/gR0JVVqP/hQtif1Vb28
	Dd5ISxiyTZDK9rGYmiHK94sYXb/KsVdoKnjiLTW3oatKmGmxxuXWtsIeOLd2jq/UfRxJ
	OhFAVDBRX2vpvA+dDdwp2SZlAu4MWSYLFdYJaqHXIS0qzzXrqysKvhLnDt3aVKPR34lg
	1KaQ==
Received: by 10.216.145.156 with SMTP id p28mr9844706wej.140.1349203437950;
	Tue, 02 Oct 2012 11:43:57 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id dm3sm3800339wib.3.2012.10.02.11.43.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 02 Oct 2012 11:43:56 -0700 (PDT)
Date: Tue, 2 Oct 2012 20:43:55 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20121002184355.GB15881@jama.jama.net>
References: <cover.1348330479.git.Martin.Jansa@gmail.com>
	<5ac0bc525f5ac3f07c5749efc31e91c3fe6145c1.1348330479.git.Martin.Jansa@gmail.com>
	<1348335944.10108.211.camel@ted>
	<20120927083701.GC3454@jama.jama.net>
	<5064A1DB.40506@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5064A1DB.40506@windriver.com>
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
X-List-Received-Date: Tue, 02 Oct 2012 18:56:56 -0000
X-Groupsio-MsgNum: 30256
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Content-Disposition: inline

--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 27, 2012 at 01:58:35PM -0500, Mark Hatle wrote:
> Let me preface this by I have read the patch set.. Martin asked me to com=
ment on=20
> the items below...
>=20
> On 9/27/12 3:37 AM, Martin Jansa wrote:
> > On Sat, Sep 22, 2012 at 06:45:44PM +0100, Richard Purdie wrote:
> >> On Sat, 2012-09-22 at 18:51 +0200, Martin Jansa wrote:
> >>> * bitbake.conf has OPTDEFAULTTUNE with weak default value of DEFAULTT=
UNE
> >>> * this way xscale or arm926ejs is not used by default when some machi=
ne
> >>>    includes its tune*.inc, but it's easy for DISTRO to say it wants
> >>>    OPTDEFAULTTUNE for some packages or always (if they don't want to
> >>>    share built packages between xscale and arm926ejs).
> >>>
> >>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >>> ---
> >>>   meta/conf/bitbake.conf                       | 1 +
> >>>   meta/conf/machine/include/tune-arm926ejs.inc | 3 ++-
> >>>   meta/conf/machine/include/tune-xscale.inc    | 3 ++-
> >>>   3 files changed, 5 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> >>> index 9b41749..e433fcb 100644
> >>> --- a/meta/conf/bitbake.conf
> >>> +++ b/meta/conf/bitbake.conf
> >>> @@ -95,6 +95,7 @@ HOST_LD_ARCH =3D "${TARGET_LD_ARCH}"
> >>>   HOST_AS_ARCH =3D "${TARGET_AS_ARCH}"
> >>>   HOST_EXEEXT =3D ""
> >>>
> >>> +OPTDEFAULTTUNE ??=3D "${DEFAULTTUNE}"
> >>>   TUNE_ARCH ??=3D "INVALID"
> >>>   TUNE_CCARGS ??=3D ""
> >>>   TUNE_LDARGS ??=3D ""
> >>
> >> As I've said previously, I do not think OPTDEFAULTTUNE is clear in usa=
ge
> >> or in meaning and we need to find a better solution. I'm therefore not
> >> keen on this change.
> >
> > OK, what about the rest of patchset (without OPTDEFAULTTUNE bits) to use
> > different PKGARCH for different TUNE_CCARGS?
>=20
> I've been an advocate for a while that the processor optimization (CCARGS=
) does=20
> make it into the PKGARCH.  ARMPKGSFX_CPU seems like a reasonable approach=
 to do=20
> this.  It allows each tune to set something to tell people what that bina=
ry is=20
> really built for, and for the 'base' tunes (i.e. armv5) it can be left of=
f.
>=20
> The only concern I have with that is:
>=20
> +ARMPKGSFX_CPU =3D "${@bb.utils.contains("TUNE_FEATURES", "arm926ejs",=20
> "-arm926ejs", "", d)}"
>=20
> That probably should be a .=3D instead of just '=3D'.  That way if the us=
er loads=20
> multiple compatible tunes the right ARMPKGSFX_CPU will be used.  (Alterna=
tively=20
> using the overrides would work as well for this.. i.e.=20
> ARMPKGSFX_CPU_tune-arm926ejs instead...
>=20
> I see Patch 5/5 instead moves toward the ARMPKGARCH usage instead...  Thi=
s is=20
> fine as well, and it was designed to be overriden.. but again the .=3D or=
=20
> -tune_... syntax should be used...

I've updated contrib/jansa/tune-test with this.
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/tune-t=
est

While changing that to use e.g.
ARMPKGARCH_tune-xscale
I've noticed that _tune-foo are not valid OVERRIDE, so I had to add=20
ARMPKGARCH =3D "${ARMPKGARCH_tune-${DEFAULTTUNE}}"
in arch-arm.inc and then define ARMPKGARCH_tune-foo for every supported
arm tune (otherwise it's expanded like this TUNE_PKGARCH (${ARMPKGARCH_tune=
-armv5te}te).).

This makes whole
TUNE_PKGARCH =3D "${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSF=
X_EABI}${ARMPKGSFX_ENDIAN}${ARMPKGSFX_FPU}"
a bit less usefull, maybe ARMPKGSFX_CPU was better approach..

Cheers,

>=20
> Anyway, my point in this is I like having the stuff unique, but we need t=
o be=20
> sure that you can specify more then one tune file during a build w/o clas=
hes.
>=20
> >> I also still think this is a distro packaging issue and should be solv=
ed
> >> by the distro, even if that means more complexity there. That is the
> >> right place for this particular complexity IMO. I'm happy to support
> >> that from the core but not in something as user visible and confusing =
as
> >> this variable.
> >
> > Agreed OPTDEFAULTTUNE is to help distro configs, because complexity
> > there will be much worse then when it's defined in tune-* files, because
> > now will have to define DEFAULTTUNE/OPTDEFAULTTUNE for each MACHINE (or
> > TUNE_FEATURE) it supports and it's less orthogonal (machine/distro
> > config) then it could be.
>=20
> I really don't have a strong opinion on this either way.  I know for the =
stuff=20
> I've done in the past (not oe-based) we've just manually configured (the=
=20
> equivalent of the distro conf) with the information on the handful of ite=
ms that=20
> people wanted optimized the most...  eglibc, openssl, mysql/posgresql...=
=20
> otherwise folks don't seem to care, and re-use works fine.
>=20
> If the list is small (i.e. less then 10 packages) that specifying it via =
package=20
> specific overrides in the distro file should be fine.. if it's more then =
10=20
> (typically) then we need to start looking for another approach.
>=20
> I'd almost suggest in the distro file you could do:
>=20
> OPTDEFAULTTUNE =3D "$@{...}" where ... is check for something set by the =
BSP (or=20
> elsewhere), if set use that value, otherwise using the DEFAULTTUNE value.
>=20
> DEFAULTTUNE-<pn> =3D "${OPTDEFAULTTUNE}"
>=20
> and then everything can be encapsulated into the distro file (and distro =
BSPs).=20
>   The downside of this approach is that it's not the 'standard' implement=
ation.
>=20
> --Mark
>=20
> > Cheers,
> >
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBrNesACgkQN1Ujt2V2gBzJRACeMsJFBvY5Z1B0EP2c4hLwlrzo
NjYAniUj57Y2gDXuiAXbMXgX8ihoyZ+I
=q0ZV
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--
