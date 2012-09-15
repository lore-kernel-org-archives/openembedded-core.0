Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TCmZy-0001IW-OW
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Sep 2012 09:14:14 +0200
Received: by weyr6 with SMTP id r6so2845603wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Sep 2012 00:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Y9uSEt9OPKzNYvo11bIREi57rE+AgFx4inh2OaJSQL0=;
	b=FhgK+BmTGUs4Kk7ZKKVgO8RXar6KgG7rf/ny1lo23vz/I56YVT2FNhZSipu7D1YS13
	Fw99Rk0zPfwCI0UUUxqW8ZUcUqj3jwQKkaUUQ0IUKGrTOCtUodUdKpRUmHGz0QOOlga+
	GQiPfORXbfnrYwNEC6cmb08e2eHh+ihObRhgr8uwcxBK6wkMTkgnMqT1j1XExmSpqqTZ
	GI2wbKshxy5UpEU0SYl9Id+0HAsh3UjiAQxyQz4zVwwBwJ4hKW60TV9w/JimxsrA6bet
	xpctgi7Dr3nxTW1UdRyAUSEfkwwJ2cXlXwAcb7RK+7S8YGcR6Phg/wo5+Y+k2ffvNI1M
	TvqQ==
Received: by 10.180.86.106 with SMTP id o10mr3084492wiz.22.1347692499045;
	Sat, 15 Sep 2012 00:01:39 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t7sm4717486wix.6.2012.09.15.00.01.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 15 Sep 2012 00:01:37 -0700 (PDT)
Date: Sat, 15 Sep 2012 09:01:42 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20120915070142.GD11252@jama.jama.net>
References: <20120911130155.GC14077@jama.jama.net>
	<1347460383.11710.34.camel@ted>
	<20120913062017.GA11252@jama.jama.net>
	<1347532926.11710.66.camel@ted>
	<20120913121431.GB11252@jama.jama.net>
	<1347541111.11710.97.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1347541111.11710.97.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: qemuarm: should it really have TUNE_ARCH armv5te?
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
X-List-Received-Date: Sat, 15 Sep 2012 07:14:14 -0000
X-Groupsio-MsgNum: 29351
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hoZxPH4CaxYzWscb"
Content-Disposition: inline

--hoZxPH4CaxYzWscb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 13, 2012 at 01:58:31PM +0100, Richard Purdie wrote:
> On Thu, 2012-09-13 at 14:14 +0200, Martin Jansa wrote:
> > On Thu, Sep 13, 2012 at 11:42:06AM +0100, Richard Purdie wrote:
> > > On Thu, 2012-09-13 at 08:20 +0200, Martin Jansa wrote:
> > > > On Wed, Sep 12, 2012 at 03:33:03PM +0100, Richard Purdie wrote:
> > > > > On Tue, 2012-09-11 at 15:01 +0200, Martin Jansa wrote:
> > > > > > Hi,
> > > > > >=20
> > > > > > when building spitz and qemuarm (both produces packages in armv=
5te feed)
> > > > > > resulting packages are tuned with -mtune=3Dxscale (when built f=
or spitz)=20
> > > > > > or -mtune=3Darm926ej-s (when built for qemuarm).
> > > > > >=20
> > > > > > From
> > > > > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1916#c5
> > > > > > Firstly, if you go changing the tune parameters in a given mach=
ine,
> > > > > > you are expected to use a different PACKAGE_ARCH. If you do tha=
t, you
> > > > > > will get a different package feed for the different binaries,
> > > > > > different WORKDIR and so on. This was always the way the package
> > > > > > architectures was intended to work and nothing has changed ther=
e. Yes,
> > > > > > you as the user changing various variables can create inconsist=
ent
> > > > > > package feeds. There are 101 ways you can do that, the simple a=
nswer
> > > > > > is just don't. We're therefore unlikely to add MACHINE to DEPLO=
Y_DIR
> > > > > > or remove PACKAGE_ARCH, please just use it as its intended.
> > > > > >=20
> > > > > > Does qemuarm use oe-core as it's intended?
> > > > > >=20
> > > > > > Shouldn't spitz produce something like armv5te-xscale and qemua=
rm armv5te-arm926ejs?
> > > > > > It would cause all recipes to build again (cannot share armv5te=
 feed anymore),
> > > > > > but at least it would build it and user will really get it on t=
arget, right now
> > > > > > opkg upgrade can download some packages with xscale some with a=
rm926ej-s.
> > > > > >=20
> > > > > > $ ~/bitbake/bin/bitbake-diffsigs
> > > > > >   stamps.1347348910/spitz/armv5te-oe-linux-gnueabi/linux-libc-h=
eaders-3.4.3-r0.do_configure.sigdata.04b364a15889fcff7502614f1c116abc
> > > > > >   stamps.1347348910/qemuarm/armv5te-oe-linux-gnueabi/linux-libc=
-headers-3.4.3-r0.do_configure.sigdata.656f0583be969b427f040f2e143bcb14
> > > > > >   basehash changed from 7fe9c0a3455dac20ba6a90ed337b097e to d8d=
d2ff8613d0aafe60bef1a1e9469a1
> > > > > >   Variable TUNE_CCARGS value changed from
> > > > > >   ${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=3Darmv=
5${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}", "", d)}
> > > > > >   ${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=3Darmv=
4${ARMPKGSFX_THUMB}", "", d)}
> > > > > >   ${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M=
_OPT}", "", d)}
> > > > > >   ${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "=
-mno-thumb-interwork", "-mthumb-interwork", d)}
> > > > > >   ${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contain=
s("TUNE_FEATURES", "callconvention-hard", "-mfloat-abi=3Dhard", "-mfloat-ab=
i=3Dsoftfp", d), "" ,d)}
> > > > > >   ${@bb.utils.contains("TUNE_FEATURES", "xscale", "-mtune=3Dxsc=
ale", "", d)}
> > > > > >   to
> > > > > >   ${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=3Darmv=
5${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}", "", d)}
> > > > > >   ${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=3Darmv=
4${ARMPKGSFX_THUMB}", "", d)}
> > > > > >   ${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M=
_OPT}", "", d)}
> > > > > >   ${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "=
-mno-thumb-interwork", "-mthumb-interwork", d)}
> > > > > >   ${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contain=
s("TUNE_FEATURES", "callconvention-hard", "-mfloat-abi=3Dhard", "-mfloat-ab=
i=3Dsoftfp", d), "" ,d)}
> > > > > >   ${@bb.utils.contains("TUNE_FEATURES", "arm926ejs", "-mtune=3D=
arm926ej-s", "", d)}
> > > > > >=20
> > > > >=20
> > > > > This is a tricky one. As others have mentioned, this is a tune
> > > > > parameter, not an arch one and as such the binaries are compatibl=
e with
> > > > > each other although they potentially are compiled differently with
> > > > > different optimisations.
> > > > >=20
> > > > > As such, mixing the feeds is permitted and will not cause any rea=
l world
> > > > > usage problem. As you point out, sstate is much more sensitive to=
 this
> > > > > kind of change and is correctly deciding the output is different =
though.
> > > > >=20
> > > > > I think my preferred approach would be to have the tune files do
> > > > > something like:
> > > > >=20
> > > > > -mtune=3D${ARMV5TEDEFAULTTUNE}
> > > > >=20
> > > > > and then the user can set ARMV5DEFAULTTUNE to whatever the believ=
e is a
> > > > > appropriate. This would result in the package feed at least havin=
g a
> > > > > consistent state of one tune and sstate would be happy. It then b=
ecomes
> > > > > a distro policy decision which is what it should be. ARMV5TEDEFAU=
LTTUNE
> > > > > would default to the current values meaning the distro would then=
 just
> > > > > do:
> > > > >=20
> > > > > ARMV5TEDEFAULTTUNE_poky =3D "xscale"
> > > > >
> > > > > and hence make their decision. Of course the distro could also de=
cide to
> > > > > split the package architectures up which is equally fine.
> > > > >=20
> > > > > Does something like that sound like it would work?
> > > >=20
> > > > My solution seems to be a bit more flexible then this.
> > >=20
> > > Which cases does it enable which the above doesn't?
> >=20
> > To have separate binary feeds for some packages while keeping most of
> > other packages in armv5te feed without any -mtune or with some
> > ARMV5TEDEFAULTTUNE.
>=20
> Firstly, lets clearly define what the problems are. We want to have some
> packages with the existing tune in separate feeds and have other
> packages sharing (or have no) mtune values?

The proble is, that tune-cpu.inc files sets different -mcpu while
keeping the same PACKAGE_ARCH (first commit in my brach)

> The reason I say that is that initially this looked like a problem with
> sstate and the specific mtune values which is a relatively generic and
> widespread issue. The problem described above is implementation of what
> is very specific distro policy. I want to be clear about which
> problem(s) we're solving as that is leading to confusion discussing it.

sstate is "correctly" detecting -mcpu change and rebuild all packages
with new mcpu, but resulting ipk are in the same arch -> user wont see
which -mcpu was used to buld particular .ipk.
=20
> If the problem(s) we're solving are the distro feed one rather than
> sstate, the problem is more specific the distro policy and I'd expect
> the distro itself to be handling this and not the core.

If I add those PACKAGE_ARCH setting to each tune* which sets new
DEFAULTUNE them some distributions can see it as regression as e.g.
xscale and arm926ejs feed will need twice as much space as now shared
armv5te.

Removin tune-cpu from machine config also seems bad, because of loosing
the option to use correct -mcpu.

That's my solution keeps all information "local" in tune file
DEFAULTTUNE will be set to generic arm5te
OPTDEFAULTTUN to xscale

and distro then can choose which one to use by default or for some
packages.. see my e-mail about it (I won't write it again because I'm
writting from phone)

> > But -mtune=3D${ARMV5TEDEFAULTTUNE} in tune-arm926ejs.inc with=20
> > xscale value set through ARMV5TEDEFAULTTUNE_disto doesn't look very
> > intuitive.
>=20
> I'm not saying that it is. What I'm saying is that it puts the pain in
> the place of the person trying to do the deep configuration and isn't
> the first thing a new user hits and struggles with.=20
>=20
> We can add variables for *everything*. That doesn't mean that we should
> and this is one case that I think the proposal complicates something
> that is already too complicated, badly (under) documented and being
> misused (see the number of patches I've seen recently abusing
> DEFAULTTUNE).
>=20
> At least if the tune files and system was well documented I might feel
> better about things but right now it isn't.
>=20
> > And how many .*DEFAUTTUNE variables distro should set?
>=20
> As soon as you enter the world of recipe specific tunings, I suspect a
> number of variables are going to need to get set.
>=20
> Cheers,
>=20
> Richard
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hoZxPH4CaxYzWscb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBUJ9YACgkQN1Ujt2V2gBybnACfS/Zz6cdqCALoAuN1k4/9FOgS
Gd0AnjtMC1XVQLqweFG+L5ILc7qhcHJ/
=TgQZ
-----END PGP SIGNATURE-----

--hoZxPH4CaxYzWscb--
