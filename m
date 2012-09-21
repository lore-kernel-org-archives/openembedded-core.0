Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TF5jL-0005o7-G6
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 18:05:27 +0200
Received: by bkvi18 with SMTP id i18so1403447bkv.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2012 08:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PnKc4t84sfVJi87hMqY+9GS5pzBSxYwHicrNsxkBERs=;
	b=sdde0T/QS6HzIg7yYTZvMWfubdEnay2rs/oQlshuqRpLmPM75kL9NS9+VDbdD+9NvR
	xukUzhP35snGBG0wExC+OVToeaxjVg6pNuzGvqS8R5gHEAT8os0qMA7ZhG7N8Y4tXvi+
	gfUfTA1eQIpicPTpF5BUiNVeudyLkB7EHPqJyHiROFN1GPd9UKKgVjVYYgXJ+qEYCmc/
	CA3NjFzC+V/WLqDQo7Kd7sOLrM5MLOhoPBDDY/ITZKW/JlZZ2Qfb0n0UO4CRqptSpUZD
	R0zKZcjiiZGngzLeUEAZ6T/aubYrtf2AWEaNyGmOjesUPJGFOeukKk4ILrcYxv0vL+oq
	cRsg==
Received: by 10.204.150.210 with SMTP id z18mr1249349bkv.53.1348242763293;
	Fri, 21 Sep 2012 08:52:43 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t27sm3293202bkv.10.2012.09.21.08.52.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Sep 2012 08:52:41 -0700 (PDT)
Date: Fri, 21 Sep 2012 17:52:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20120921155238.GH10268@jama.jama.net>
References: <20120911130155.GC14077@jama.jama.net>
	<1347460383.11710.34.camel@ted>
	<20120913062017.GA11252@jama.jama.net>
	<1347532926.11710.66.camel@ted>
	<20120913121431.GB11252@jama.jama.net>
	<1347541111.11710.97.camel@ted>
	<20120915070142.GD11252@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120915070142.GD11252@jama.jama.net>
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
X-List-Received-Date: Fri, 21 Sep 2012 16:05:27 -0000
X-Groupsio-MsgNum: 29647
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mYYhpFXgKVw71fwr"
Content-Disposition: inline

--mYYhpFXgKVw71fwr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 15, 2012 at 09:01:42AM +0200, Martin Jansa wrote:
> On Thu, Sep 13, 2012 at 01:58:31PM +0100, Richard Purdie wrote:
> > On Thu, 2012-09-13 at 14:14 +0200, Martin Jansa wrote:
> > > On Thu, Sep 13, 2012 at 11:42:06AM +0100, Richard Purdie wrote:
> > > > On Thu, 2012-09-13 at 08:20 +0200, Martin Jansa wrote:
> > > > > On Wed, Sep 12, 2012 at 03:33:03PM +0100, Richard Purdie wrote:
> > > > > > On Tue, 2012-09-11 at 15:01 +0200, Martin Jansa wrote:
> > > > > > > Hi,
> > > > > > >=20
> > > > > > > when building spitz and qemuarm (both produces packages in ar=
mv5te feed)
> > > > > > > resulting packages are tuned with -mtune=3Dxscale (when built=
 for spitz)=20
> > > > > > > or -mtune=3Darm926ej-s (when built for qemuarm).
> > > > > > >=20
> > > > > > > From
> > > > > > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1916#c5
> > > > > > > Firstly, if you go changing the tune parameters in a given ma=
chine,
> > > > > > > you are expected to use a different PACKAGE_ARCH. If you do t=
hat, you
> > > > > > > will get a different package feed for the different binaries,
> > > > > > > different WORKDIR and so on. This was always the way the pack=
age
> > > > > > > architectures was intended to work and nothing has changed th=
ere. Yes,
> > > > > > > you as the user changing various variables can create inconsi=
stent
> > > > > > > package feeds. There are 101 ways you can do that, the simple=
 answer
> > > > > > > is just don't. We're therefore unlikely to add MACHINE to DEP=
LOY_DIR
> > > > > > > or remove PACKAGE_ARCH, please just use it as its intended.
> > > > > > >=20
> > > > > > > Does qemuarm use oe-core as it's intended?
> > > > > > >=20
> > > > > > > Shouldn't spitz produce something like armv5te-xscale and qem=
uarm armv5te-arm926ejs?
> > > > > > > It would cause all recipes to build again (cannot share armv5=
te feed anymore),
> > > > > > > but at least it would build it and user will really get it on=
 target, right now
> > > > > > > opkg upgrade can download some packages with xscale some with=
 arm926ej-s.
> > > > > > >=20
> > > > > > > $ ~/bitbake/bin/bitbake-diffsigs
> > > > > > >   stamps.1347348910/spitz/armv5te-oe-linux-gnueabi/linux-libc=
-headers-3.4.3-r0.do_configure.sigdata.04b364a15889fcff7502614f1c116abc
> > > > > > >   stamps.1347348910/qemuarm/armv5te-oe-linux-gnueabi/linux-li=
bc-headers-3.4.3-r0.do_configure.sigdata.656f0583be969b427f040f2e143bcb14
> > > > > > >   basehash changed from 7fe9c0a3455dac20ba6a90ed337b097e to d=
8dd2ff8613d0aafe60bef1a1e9469a1
> > > > > > >   Variable TUNE_CCARGS value changed from
> > > > > > >   ${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=3Dar=
mv5${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}", "", d)}
> > > > > > >   ${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=3Dar=
mv4${ARMPKGSFX_THUMB}", "", d)}
> > > > > > >   ${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB=
_M_OPT}", "", d)}
> > > > > > >   ${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork",=
 "-mno-thumb-interwork", "-mthumb-interwork", d)}
> > > > > > >   ${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.conta=
ins("TUNE_FEATURES", "callconvention-hard", "-mfloat-abi=3Dhard", "-mfloat-=
abi=3Dsoftfp", d), "" ,d)}
> > > > > > >   ${@bb.utils.contains("TUNE_FEATURES", "xscale", "-mtune=3Dx=
scale", "", d)}
> > > > > > >   to
> > > > > > >   ${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=3Dar=
mv5${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}", "", d)}
> > > > > > >   ${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=3Dar=
mv4${ARMPKGSFX_THUMB}", "", d)}
> > > > > > >   ${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB=
_M_OPT}", "", d)}
> > > > > > >   ${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork",=
 "-mno-thumb-interwork", "-mthumb-interwork", d)}
> > > > > > >   ${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.conta=
ins("TUNE_FEATURES", "callconvention-hard", "-mfloat-abi=3Dhard", "-mfloat-=
abi=3Dsoftfp", d), "" ,d)}
> > > > > > >   ${@bb.utils.contains("TUNE_FEATURES", "arm926ejs", "-mtune=
=3Darm926ej-s", "", d)}
> > > > > > >=20
> > > > > >=20
> > > > > > This is a tricky one. As others have mentioned, this is a tune
> > > > > > parameter, not an arch one and as such the binaries are compati=
ble with
> > > > > > each other although they potentially are compiled differently w=
ith
> > > > > > different optimisations.
> > > > > >=20
> > > > > > As such, mixing the feeds is permitted and will not cause any r=
eal world
> > > > > > usage problem. As you point out, sstate is much more sensitive =
to this
> > > > > > kind of change and is correctly deciding the output is differen=
t though.
> > > > > >=20
> > > > > > I think my preferred approach would be to have the tune files do
> > > > > > something like:
> > > > > >=20
> > > > > > -mtune=3D${ARMV5TEDEFAULTTUNE}
> > > > > >=20
> > > > > > and then the user can set ARMV5DEFAULTTUNE to whatever the beli=
eve is a
> > > > > > appropriate. This would result in the package feed at least hav=
ing a
> > > > > > consistent state of one tune and sstate would be happy. It then=
 becomes
> > > > > > a distro policy decision which is what it should be. ARMV5TEDEF=
AULTTUNE
> > > > > > would default to the current values meaning the distro would th=
en just
> > > > > > do:
> > > > > >=20
> > > > > > ARMV5TEDEFAULTTUNE_poky =3D "xscale"
> > > > > >
> > > > > > and hence make their decision. Of course the distro could also =
decide to
> > > > > > split the package architectures up which is equally fine.
> > > > > >=20
> > > > > > Does something like that sound like it would work?
> > > > >=20
> > > > > My solution seems to be a bit more flexible then this.
> > > >=20
> > > > Which cases does it enable which the above doesn't?
> > >=20
> > > To have separate binary feeds for some packages while keeping most of
> > > other packages in armv5te feed without any -mtune or with some
> > > ARMV5TEDEFAULTTUNE.
> >=20
> > Firstly, lets clearly define what the problems are. We want to have some
> > packages with the existing tune in separate feeds and have other
> > packages sharing (or have no) mtune values?
>=20
> The proble is, that tune-cpu.inc files sets different -mcpu while
> keeping the same PACKAGE_ARCH (first commit in my brach)
>=20
> > The reason I say that is that initially this looked like a problem with
> > sstate and the specific mtune values which is a relatively generic and
> > widespread issue. The problem described above is implementation of what
> > is very specific distro policy. I want to be clear about which
> > problem(s) we're solving as that is leading to confusion discussing it.
>=20
> sstate is "correctly" detecting -mcpu change and rebuild all packages
> with new mcpu, but resulting ipk are in the same arch -> user wont see
> which -mcpu was used to buld particular .ipk.
> =20
> > If the problem(s) we're solving are the distro feed one rather than
> > sstate, the problem is more specific the distro policy and I'd expect
> > the distro itself to be handling this and not the core.
>=20
> If I add those PACKAGE_ARCH setting to each tune* which sets new
> DEFAULTUNE them some distributions can see it as regression as e.g.
> xscale and arm926ejs feed will need twice as much space as now shared
> armv5te.
>=20
> Removin tune-cpu from machine config also seems bad, because of loosing
> the option to use correct -mcpu.
>=20
> That's my solution keeps all information "local" in tune file
> DEFAULTTUNE will be set to generic arm5te
> OPTDEFAULTTUN to xscale
>=20
> and distro then can choose which one to use by default or for some
> packages.. see my e-mail about it (I won't write it again because I'm
> writting from phone)

Even with last version of jansa/tune it does not really help with
rebuilds

$ bitbake-diffsigs stamps.1348241943/*/armv5te-oe-linux-gnueabi/linux-libc-=
headers-3.4.3-r0.do_configure*
basehash changed from 82dd3229952508550532e9ab37e78dc4 to 1d04ba204fe9afb1d=
346156dc066da93
Variable TUNE_CCARGS value changed from =20
${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=3Darmv5${ARMPKGSFX_T=
HUMB}${ARMPKGSFX_DSP}", "", d)}=20
${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=3Darmv4${ARMPKGSFX_T=
HUMB}", "", d)}=20
${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "", d)=
}=20
${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "-mno-thumb-int=
erwork", "-mthumb-interwork", d)}=20
${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEATUR=
ES", "callconvention-hard", "-mfloat-abi=3Dhard", "-mfloat-abi=3Dsoftfp", d=
), "" ,d)}=20
${@bb.utils.contains("TUNE_FEATURES", "arm926ejs", "-mtune=3Darm926ej-s", "=
", d)}=20
to =20
${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=3Darmv5${ARMPKGSFX_T=
HUMB}${ARMPKGSFX_DSP}", "", d)}=20
${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=3Darmv4${ARMPKGSFX_T=
HUMB}", "", d)}=20
${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "", d)=
}=20
${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "-mno-thumb-int=
erwork", "-mthumb-interwork", d)}=20
${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEATUR=
ES", "callconvention-hard", "-mfloat-abi=3Dhard", "-mfloat-abi=3Dsoftfp", d=
), "" ,d)}=20
${@bb.utils.contains("TUNE_FEATURES", "xscale", "-mtune=3Dxscale", "", d)}
Hash for dependent task linux-libc-headers_3.4.3.bb.do_patch changed from 4=
d1f46fa912bc21421d343811acab517 to 663e25ca238e049eaff02fd288c5342e

So even if I let both machines using only armv5 thumb dsp TUNE_FEATURES it =
still=20
rebuilds e.g. linux-libc-headers.

We can merge all those
TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "xscale", "-mtune=
=3Dxscale", "", d)}"
fragmets to arch-armv5-dsp.inc, but that doesn't look very correct too (ima=
gine someone who=20
wants to add new tune-magicfoo in his BSP which adds another possible value=
 for TUNE_FEATURES
but still uses armv5te feed.

Any idea?

Cheers,

>=20
> > > But -mtune=3D${ARMV5TEDEFAULTTUNE} in tune-arm926ejs.inc with=20
> > > xscale value set through ARMV5TEDEFAULTTUNE_disto doesn't look very
> > > intuitive.
> >=20
> > I'm not saying that it is. What I'm saying is that it puts the pain in
> > the place of the person trying to do the deep configuration and isn't
> > the first thing a new user hits and struggles with.=20
> >=20
> > We can add variables for *everything*. That doesn't mean that we should
> > and this is one case that I think the proposal complicates something
> > that is already too complicated, badly (under) documented and being
> > misused (see the number of patches I've seen recently abusing
> > DEFAULTTUNE).
> >=20
> > At least if the tune files and system was well documented I might feel
> > better about things but right now it isn't.
> >=20
> > > And how many .*DEFAUTTUNE variables distro should set?
> >=20
> > As soon as you enter the world of recipe specific tunings, I suspect a
> > number of variables are going to need to get set.
> >=20
> > Cheers,
> >=20
> > Richard
> >=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mYYhpFXgKVw71fwr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBcjUYACgkQN1Ujt2V2gByjdACgo4o8RrEk2AQD4T0CVcYfzmj8
3/EAmwdViaHtvOHU6zprgJ7WEwV9ZYcy
=ollB
-----END PGP SIGNATURE-----

--mYYhpFXgKVw71fwr--
