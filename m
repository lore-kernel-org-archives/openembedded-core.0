Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1THJiK-0008S4-RI
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 21:25:36 +0200
Received: by wiwc10 with SMTP id c10so904136wiw.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 12:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KksJBqMW8/Zbj4f4QpUYglN1ILPOg+Br7iY0oCMeoic=;
	b=zUDRf6dzRLWeQm44Cz+beu8Pseu/gBFIVGZBcFnsrJfe9595BqjcA5j98+7OsGkh+q
	GqaiLVD1aNCG6IFy6r0O54AhpeCEVsIEdVUK81WkINJttL6twoLK5WSgpNS0ZAe8QU9p
	9smnn3wovmTZsEx0cvj7TwXKPBs9sMzbSqSyM/z7XZKaNnDAZCUqaNVzO+gm8fxiKOR1
	b9HjoETQRd10s8pzVycpulKZMqP8mhes6HsXhGYljNUaVvKfxS1Kdeij8iGCVJGjpKd9
	JiESDD4I/aupNTiRMp8RDCQpNc7x43ErSTvOlRnZWh5d8S2pykzV/Z+eZX39mB+M9HFM
	ddTA==
Received: by 10.180.74.33 with SMTP id q1mr38539263wiv.4.1348773163675;
	Thu, 27 Sep 2012 12:12:43 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k20sm32709709wiv.11.2012.09.27.12.12.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Sep 2012 12:12:42 -0700 (PDT)
Date: Thu, 27 Sep 2012 21:12:46 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20120927191246.GG3454@jama.jama.net>
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
X-List-Received-Date: Thu, 27 Sep 2012 19:25:36 -0000
X-Groupsio-MsgNum: 30026
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xjyYRNSh/RebjC6o"
Content-Disposition: inline

--xjyYRNSh/RebjC6o
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

OK.

> I see Patch 5/5 instead moves toward the ARMPKGARCH usage instead...  Thi=
s is=20
> fine as well, and it was designed to be overriden.. but again the .=3D or=
=20
> -tune_... syntax should be used...

I tend to prefer ARMPKGARCH as it's shorter xscale-te/armv5te-xscale.

But not sure what to do with all "lower" PACKAGE_EXTRA_ARCHS:
PACKAGE_EXTRA_ARCHS_tune-xscale-be =3D "${PACKAGE_EXTRA_ARCHS_tune-armv5teb=
}"
do we want PACKAGE_EXTRA_ARCHS_tune-armv5teb only or also something like
armv4t-xscale?

Well whole PACKAGE_EXTRA_ARCHS has too many entries already (opkg update
would try to download many feeds but only a few does exist).

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

Yes but first I have to say:
DEFAULTTUNE_spitz =3D armv5te
OPTDEFAULTTUNE_spitz =3D xscale
DEFAULTTUNE_qemuarm =3D armv5te
OPTDEFAULTTUNE_qemuarm =3D arm926ejs
or
DEFAULTTUNE_tune-xscale =3D armv5te
OPTDEFAULTTUNE_tun_xscale =3D xscale
DEFAULTTUNE_tune-arm926ejs =3D armv5te
OPTDEFAULTTUNE_tune-arm926ejs =3D arm926ejs

to know what's OPTDEFAULTTUNE and DEFAULTTUNE for given MACHINE if it's
not in defined tune-xscale/tune-arm926ejs.

And that's what I didn't want to include in my distro config (and then
explaining to someone that when adding MACHINE foo he has to send patch
for distro config).

Cheers,

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

--xjyYRNSh/RebjC6o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBkpS4ACgkQN1Ujt2V2gBz7TgCcCXCto9YEF8AjD6KKyRtq5xqD
EDMAniBzAy2kpeVv6EiWwhEN3eM/MujO
=iaqL
-----END PGP SIGNATURE-----

--xjyYRNSh/RebjC6o--
